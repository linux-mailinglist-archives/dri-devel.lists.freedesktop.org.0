Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3EA35C48
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C64110EC50;
	Fri, 14 Feb 2025 11:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UIsjw2kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613110EC50
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:16:34 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so197127276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531794; x=1740136594; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9jM48aKf/sbl9H/oOIzSS3d/8y4m7nkDsYlbYDKZEDc=;
 b=UIsjw2kkrJqCoc93AKswmetdxJC9IKVpvWhBsiYDJ02X6A7ZwgJarXtjRRV20VV7an
 nJgMmULf89hPde2KyRV8VEKTg8Szj763ong8iO91+og+F6Tnk+gLpp9mFEPUVZZ2BDy6
 AQQ+g5uNZb/Mbt9Fg1m4wTLV/tnod2ETzAPPpNjnNEFc6rCdcB9GerFaYzhTY8bsgpTh
 xH0uezV7DTeKKkfn1NX8YLug+gclsDayfHHCDWnNsUpvgd3xD03ZFSpmwhEM9o0HsUl8
 akOqF2Mgo82IRJ51BxJIlZAjiTSDyclTes0c7WbfZcRG1q/ypCCuhP8n6lJyM7y4qALi
 A41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531794; x=1740136594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9jM48aKf/sbl9H/oOIzSS3d/8y4m7nkDsYlbYDKZEDc=;
 b=qhPTl4S4LRZpQ+54qok8nUd9tTpUobH8u19g+GWMoFnzUW8YvMLt10C4uw25cmjMcj
 oU+0ArbC5tmN/CN7Cxv3cjKQ+952MtvPJT8D/UNzfYCemSglrYZ73FZw4zXMaE5KVgVw
 k5NYDQ/x6ctcJi0CjBkmc8OF+NxmjHhiWSAxt/HJRcZZ3l5iVSwFScJJQIeiUyVGqy3A
 u1MGWukBuN7gjx3IF/upnB6DsVUZXHqsRHxVXdYMsXzoFA2StDZ2IDNsbIKjMbRaupJF
 szJkAqob465RyH+BfqlgboGK8guf5ifSzdCBsJkckm2G/r2bZ+QAGkdQHMtEZMAJilWh
 4xoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgnbM5JMPETXHOQ9HMjlW4xHjJoq2YPd7acrThWp3vnTuRETV587rTgfB7XmRtoO06ICfOebTc+EE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi49JGKyzn6PlpmSVznhuJLdNM0vVzH668VxDrJACwGrd6jF1A
 4C8D9Yckb1Vr0n+RLFha/WY9R0EGAEGeQ+9aFmTqP+U2EiRvrEZ0chGj2vniqc9Yc66p0EliadK
 AP4PogNvsTBJ4LdjY4TwTxUiY9xKop4atAyLIhA==
X-Gm-Gg: ASbGncuvRRzLOL30ZD5treoLMrKJFuumsXDeU3RY95FbEM0ir4WaT7348lCIn1rUs1+
 UsDi4SFKuKbMd75KwM40yWsi9mADw4KXzNYX8p4PXslqK+4CQKoDA4swZll50uiCqiUSuNAUyMA
 ==
X-Google-Smtp-Source: AGHT+IE6woj8oPDle191tVLCdn9IrSTd52LbGDiCC/HBR/zbujT5GVfsySFK4K0WQQyEViMhqMK63WlGFClc8+pjkbk=
X-Received: by 2002:a05:6902:841:b0:e5b:323b:a1a4 with SMTP id
 3f1490d57ef6-e5d9f180dc6mr10461212276.41.1739531793901; Fri, 14 Feb 2025
 03:16:33 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <20250128194816.2185326-7-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-7-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:15:58 +0100
X-Gm-Features: AWEUYZmWRXn0bzCrMyNA_HXGOtxuTTirzpyDWms-8p0mq8f1JPxvJIR_18CPMCg
Message-ID: <CAPDyKFrcs5Hc-X6qExEA992MoQcakCuKRjw7cek3KpYZihsLFw@mail.gmail.com>
Subject: Re: [PATCH v4 06/18] pmdomain: thead: Add power-domain driver for
 TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, jszhang@kernel.org, 
 p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jan 2025 at 20:48, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver");
>
> Introduce a power-domain driver for the TH1520 SoC, which is using AON
> firmware protocol to communicate with E902 core through the hardware
> mailbox. This way it can send power on/off commands to the E902 core.
>
> The interaction with AUDIO power island e.g trying to turn it OFF proved
> to crash the firmware running on the E902 core. Introduce the workaround
> to disable interacting with the power island.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[...]

> +
> +static int th1520_pd_probe(struct platform_device *pdev)
> +{
> +       struct generic_pm_domain **domains;
> +       struct genpd_onecell_data *pd_data;
> +       struct th1520_aon_chan *aon_chan;
> +       struct device *dev = &pdev->dev;
> +       int i;
> +
> +       aon_chan = dev_get_drvdata(dev->parent);
> +       if (!aon_chan) {
> +               dev_err(dev, "Failed to get AON channel from parent\n");
> +               return -EINVAL;
> +       }

As pointed out on patch4. Rather than receiving the aon_chang from the
parent device like this, it seems better to receive it from a call to
a library function provided by the FW library.

> +
> +       domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
> +                              sizeof(*domains), GFP_KERNEL);
> +       if (!domains)
> +               return -ENOMEM;
> +
> +       pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
> +       if (!pd_data)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +               struct th1520_power_domain *pd;
> +
> +               if (th1520_pd_ranges[i].disabled)
> +                       continue;
> +
> +               pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
> +               if (IS_ERR(pd))
> +                       return PTR_ERR(pd);
> +
> +               pd->aon_chan = aon_chan;
> +               domains[i] = &pd->genpd;
> +               dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
> +       }
> +
> +       pd_data->domains = domains;
> +       pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
> +       pd_data->xlate = th1520_pd_xlate;
> +
> +       /*
> +        * Initialize all power domains to off to ensure they start in a
> +        * low-power state. This allows device drivers to manage power
> +        * domains by turning them on or off as needed.
> +        */
> +       th1520_pd_init_all_off(domains, dev);
> +
> +       return of_genpd_add_provider_onecell(dev->parent->of_node, pd_data);
> +}
> +
> +static struct platform_driver th1520_pd_driver = {
> +       .driver = {
> +               .name = "th1520-pd",
> +       },
> +       .probe = th1520_pd_probe,
> +};
> +module_platform_driver(th1520_pd_driver);

There is no ->remove() callback.

Either add one or make this a builtin_platform_driver() with
"suppress_bind_attrs = true".

> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

Besides the minor thing above, this looks good to me!

Kind regards
Uffe
