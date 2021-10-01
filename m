Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B241EFA4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E76ED65;
	Fri,  1 Oct 2021 14:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820E16ED29
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:37:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y26so39871110lfa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LVU9fXiM8g1pH7koqYPYX1n75qM66AiSkIRtsIE6Mik=;
 b=rjdp3uSFyx/KPmILmOXA7zcMX2+9jvG1S5UIOIMptwVjPZDLmd2m2GUsZlCHaAW145
 3MAbPK9byBkqxyqigd/bPNlnHnU5aQO3Sb9i4E0G6+8b4lShKSFQ6cOdQ4GBXEx3h4kR
 RexBLqYY+OWrmoGwvKy3/kio2LVbujF88ta8dsAcdGTqnC7YCbpDYLlFYAct6DmFCt5G
 crMGo4xuxnDknabvbiAq5xJJISgd/dp2iZ+4O8nuRqdo59bmmCKL7czZCbXAAQCfu/nd
 GXUzqvgWtpYHJpzlm7ZpLul8ysD3f3vTc5ftQMqnENyFLhXoSleoB35xsL/rwShU4xsu
 mAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LVU9fXiM8g1pH7koqYPYX1n75qM66AiSkIRtsIE6Mik=;
 b=sMxBvQ5d0MSPMVkwt0iFFYvwrHAIwrL6RnUKh+0BkxrHW6m+cIp3Y+JKxKXp73e4dJ
 pUnWgCN6XKRcxRaJtouEPBFjQeILT5q/NR5EvyOT0ylMieTNs4bHfEZa1W6/yOYVe3Cw
 Y5uHuZ9V54h5z3Ryp3p4uzlww1Ahpc2PlwJLYeHr93fxQyCT9PQtLa3+mT6f4qGPPatI
 s4Mon1uA4n83TVsYc7HR06oCQ7SgZjYI1op9aAvPeocIkEKGr3oTlB/cI2RdjDXQA7ff
 fFAAsWnAfVRejYxU6DY8o3X21Bu2z3BQdn4E7qESDLWuPEsKffM46nWWInwbrfMqETH4
 MmWg==
X-Gm-Message-State: AOAM532WZHJvjK58rAzE19OeInJS+0mmuBD+F+TSypnsDIs8nVx4KQ/Z
 XhPpXd9loraJdzlg7Jg6w/aas7EwYseq6j1exUZJfA==
X-Google-Smtp-Source: ABdhPJzoa2d4NLaXfyZ7/92L/e88lFw9mt5p0hvXF87bHS92UJ1JIvsfDpz1WLHt81/6+mvdON7qC703SsoiVg2R0Mc=
X-Received: by 2002:a05:6512:3095:: with SMTP id
 z21mr5857247lfd.167.1633099040779; 
 Fri, 01 Oct 2021 07:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 16:36:44 +0200
Message-ID: <CAPDyKFog31OatzU0fHUMfN5FRsX+8Thm8TfipA4QisgFepU+rA@mail.gmail.com>
Subject: Re: [PATCH v13 00/35] NVIDIA Tegra power management patches for 5.16
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
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

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>
> All patches in this series are interdependent and should go via Tegra tree.
>
> Changelog:
>
> v13: - Fixed compile-test error reported by build bot by reverting the
>        mmc/ patch to v11. The sdhci_suspend/resume_host() functions aren't
>        available with the disabled CONFIG_PM_SLEEP, some code needs the
>        ifdef.
>
>      - Added last r-b from Rob Herring for the DT patches.
>
>      - Corrected clk/ PM domain-support patch by not using the
>        devm_tegra_core_dev_init_opp_table_common() helper, which I
>        utilized in v12. The clk driver implements its own power domain
>        state syncing and common helper shouldn't be used. This fixes driver
>        probing for some clocks on some devices. It was reported by
>        Svyatoslav Ryhel for PLLE OPP error on T30 Asus Transformer tablet.

Dmitry, I have looked through the series and besides those comments
that I have posted, I have nothing more to add. Overall it looks good
to me.

Kind regards
Uffe
