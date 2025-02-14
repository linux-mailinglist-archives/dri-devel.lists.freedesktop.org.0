Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F390A35C17
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A2910EC52;
	Fri, 14 Feb 2025 11:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k34IWSg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B2210EC52
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:02:24 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6ef60e500d7so17098767b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739530943; x=1740135743; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rzLryw/XAyJKRphNFTyQsyFqFFX/jhMAED6ZmtSxJ5A=;
 b=k34IWSg/PL/pVDbDUTN8ZX3h8dOZy9fg6p7Zcr5WmbeKdn8NwDay1+/9nyTvK1JNYb
 P8s5w+18xf+j7UIi/DAc5yH9qY90Dxbg/qxqI+P5yqYPRTZOWlS7o4sC9/pU7yc05Z4A
 nXTQts1bWG7w+FxUkrCf0Ww6pLj5VQXnn8NbAqRvSMJH6e6eak4QE+dgAnHBT4RaNa6H
 EtjDQbWgc8VhkLDXwrbuG/FMJhYZ+lYpQP62WR/CHG2yICaoiwDVRNgsEM59kztisYDy
 aT5g9UeT6G/S8Qa5BDOHEyxh9DGM/bFGvirMXO8Sonxkp3p8xGxpgCPDnvIhpNIWkibP
 xB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739530943; x=1740135743;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rzLryw/XAyJKRphNFTyQsyFqFFX/jhMAED6ZmtSxJ5A=;
 b=oeRc0lYwxq0uosqA73Nd3Us9l6G7uy8XR6znC4MYh164ehUCzjxXEe/ef36CHCp4lz
 XigjEmlE84rxr39KIAn6l62UAxeRMGdfmT3XgsFfH9majlWwe00Yuv2wwVVMzQK8Wn6z
 hn6S8KIh7YfOr5cewjWhxuL+0P/DVFS1uaz1JObgg7GuKLLTA0k5depGQ0/7QusVOlk+
 He6qEh3Y1Y/Dk3xdUgGVqRuHIIGMNVphaG2iJx4boFgXP9KtiAycrf4a+sBldefjCxBo
 Bk1epr9n4b15RWC5OOH0hDGo1OAVRnUFrFJp9+OEEhfWTjc4RsZH/8Yd3PfT+kvIkJZJ
 UU+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZPLpP5na6tPZk2Cya736MImQi63ngX9Xi+v6R3Aar0xUEpZ+RrXQOVg0I7VMpfOp8nlfSjFU3v2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf5BDMoSQIrWrixotZXR995RwqJoh6op4w4caQx8HLCnHHiC5h
 QRE3FWyG+QG3P75YvWczaKb+/lcYQV5FifEEnPrvVD1IeFhLMTvtSfgMT7Ys6OIsaFXZgnz+5Fd
 24x4OAibqjsfEyiM6H0nncjezq06XIInGA9znIA==
X-Gm-Gg: ASbGncs8wv5mZERzJHRbJZcpFZQ6Lf8n7ZfLrqf03382Py6Sr3JwKfR1z+p7+60p1iC
 CfmYwlC4s2HO+GDNvwC9QUqZlRIaOXsloxslt7SpZaV3TEuAkHfyb5rENlTLUOYJ34FkM8PILJg
 ==
X-Google-Smtp-Source: AGHT+IEKcq28b+1jm6W/qMPjV397BfFJUY6Ro0y3t74MU1oh8ipE5HyvHwkyR5H+34Nm6ywfG6DdYeLN9CCigPMkqzw=
X-Received: by 2002:a05:6902:11c7:b0:e57:4db7:6d51 with SMTP id
 3f1490d57ef6-e5d9f170324mr10340809276.32.1739530943472; Fri, 14 Feb 2025
 03:02:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250128194830eucas1p134d566631b5622c85d843f5d811c3c00@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <20250128194816.2185326-5-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-5-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:01:47 +0100
X-Gm-Features: AWEUYZlteGTa4T3_RQ0f5ZiaQGtHVX2-gpRxvu_zXmJT0uvPZbTFwTKkU3epoaE
Message-ID: <CAPDyKFp6OTa07Lv+jsMy=Rn7U_NYFb_0MfNUXT3cjN_Gkwqs9g@mail.gmail.com>
Subject: Re: [PATCH v4 04/18] firmware: thead: Add AON firmware protocol driver
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
> The T-Head TH1520 SoC uses an E902 co-processor running Always-On (AON)
> firmware to manage power, clock, and other system resources [1]. This
> patch introduces a driver implementing the AON firmware protocol,
> allowing the Linux kernel to communicate with the firmware via mailbox
> channels.  Through an RPC-based interface, the kernel can initiate power
> state transitions, update resource configurations, and perform other
> AON-related tasks.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[...]

> +
> +static int th1520_aon_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct th1520_aon_chan *aon_chan;
> +       struct mbox_client *cl;
> +       int ret;
> +       struct platform_device_info pdevinfo = {
> +               .name = "th1520-pd",
> +               .id = PLATFORM_DEVID_AUTO,
> +               .parent = dev,
> +       };
> +
> +       aon_chan = devm_kzalloc(dev, sizeof(*aon_chan), GFP_KERNEL);
> +       if (!aon_chan)
> +               return -ENOMEM;
> +
> +       cl = &aon_chan->cl;
> +       cl->dev = dev;
> +       cl->tx_block = true;
> +       cl->tx_tout = MAX_TX_TIMEOUT;
> +       cl->rx_callback = th1520_aon_rx_callback;
> +
> +       aon_chan->ch = mbox_request_channel_byname(cl, "aon");
> +       if (IS_ERR(aon_chan->ch))
> +               return dev_err_probe(dev, PTR_ERR(aon_chan->ch),
> +                                    "Failed to request aon mbox chan\n");
> +
> +       mutex_init(&aon_chan->transaction_lock);
> +       init_completion(&aon_chan->done);
> +
> +       platform_set_drvdata(pdev, aon_chan);
> +
> +       aon_chan->pd = platform_device_register_full(&pdevinfo);
> +       ret = PTR_ERR_OR_ZERO(aon_chan->pd);
> +       if (ret) {
> +               dev_err(dev, "Failed to register child device 'th1520-pd': %d\n", ret);
> +               goto free_mbox_chan;
> +       }
> +
> +       ret = devm_of_platform_populate(dev);
> +       if (ret)
> +               goto unregister_pd;
> +
> +       return 0;
> +
> +unregister_pd:
> +       platform_device_unregister(aon_chan->pd);
> +free_mbox_chan:
> +       mbox_free_channel(aon_chan->ch);
> +
> +       return ret;
> +}

Rather than implementing this as a driver, I suggest limiting this to
a set of exported library functions.

In this way, you don't need to register a platform device, but can
instead let the power-domain provider driver in patch6, to be the one
that matches on the "thead,th1520-aon" compatible to probe.

> +
> +static void th1520_aon_remove(struct platform_device *pdev)
> +{
> +       struct th1520_aon_chan *aon_chan = platform_get_drvdata(pdev);
> +
> +       platform_device_unregister(aon_chan->pd);
> +       mbox_free_channel(aon_chan->ch);
> +}
> +
> +static const struct of_device_id th1520_aon_match[] = {
> +       { .compatible = "thead,th1520-aon" },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, th1520_aon_match);
> +
> +static struct platform_driver th1520_aon_driver = {
> +       .driver = {
> +               .name = "th1520-aon",
> +               .of_match_table = th1520_aon_match,
> +       },
> +       .probe = th1520_aon_probe,
> +       .remove = th1520_aon_remove,
> +};
> +module_platform_driver(th1520_aon_driver);
> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 Always-On firmware driver");
> +MODULE_LICENSE("GPL");

[...]

Kind regards
Uffe
