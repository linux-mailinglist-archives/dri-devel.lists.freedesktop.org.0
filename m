Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA741F04C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4005B6EE13;
	Fri,  1 Oct 2021 15:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FA16EE13
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:02:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x27so39503975lfa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RRYA+dwntp7uVySc4zhYcXxMP7m3tm96xWjdtz/hFGQ=;
 b=wEpKAHyG/Z2DV3VekAfpccfohS6GuleXT+sluDZqrLWc4fVXO49fTrUqrSvxv8Zw8s
 RcDa8OGQoiU5NceOwJQxZmdavoBpaLp5cpZxOY6F+bufDOZ4FaXS7oneoiRNEd91hAaQ
 fi0ahFYRT+uLqfme/EMkPYKyQOUjJfW1EYU/EWc5+MnERt9ifHnZPT0xlsv79INHvAVa
 n5iBrHjvoImw38ZK0VwfsIEQXxUdGrUEBOEe3mKZSU/NxPY46J9bjQ5D+37CLL9HCmlI
 03umH+yMd9J3zUrj55H5Ndk+MkCDMyLMUCaV6SGBRA2cOlVqS1jw5smxfm9J/cnyAziI
 nodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RRYA+dwntp7uVySc4zhYcXxMP7m3tm96xWjdtz/hFGQ=;
 b=nS1zo5ITKGvdpZ2BvR0wujH1sx4uLCcfbFfHrLWPSiPTmly+qNa7V+WPLiNvjaoYib
 1qUKHOEeUOhEsd9N8AfpXWv8nQi6YZ9TUtO8R/oHj3YSPKd8/rz50r5ENTEpayRqbFxf
 DUHXsgaYHVhVPWuMfNBc/ehcq7SE5xcGELx00UcfUtV4SJaPrsvNb0WreCLvX0/rjm9c
 Et0IesTZybwG75+pbEI+daQAl7NSnRM9j8o+EDq+SoG8wxAREiSzfYpBPl6BBXN91pJ2
 S/PlTEcALaEdvbn78YQPBB4WIM+qHl2OsU8SmoDJiNHjQO2eJqTzAXEK58/N19oBG2DV
 Knhg==
X-Gm-Message-State: AOAM533sFj3cu0UwiV/xg9AC+ALzUfp7BbECsSeCUDTCuewUlT1lFM9F
 Mt9EaR6MT137S6sYiGi0VgkP5xPxUU7auUfudzrnAw==
X-Google-Smtp-Source: ABdhPJxxMpC0sB/h1irGfplTvjCJzB8zxjxG16OKRPTRKR56TwhoKCfQgSz0EgtJooAfO/BDyR8+6WRX6Wl2uWGM0Ow=
X-Received: by 2002:a05:6512:3095:: with SMTP id
 z21mr5969378lfd.167.1633100572233; 
 Fri, 01 Oct 2021 08:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <CAPDyKFog31OatzU0fHUMfN5FRsX+8Thm8TfipA4QisgFepU+rA@mail.gmail.com>
 <662251e0-d1e4-97ce-16f9-703521cc2600@gmail.com>
In-Reply-To: <662251e0-d1e4-97ce-16f9-703521cc2600@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 17:02:15 +0200
Message-ID: <CAPDyKFoEbemYawwKW_muUKt9W+pGx_pncXvT57K2k4o68Z3P7g@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
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

On Fri, 1 Oct 2021 at 16:41, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.10.2021 17:36, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >>
> >> This series adds runtime PM support to Tegra drivers and enables core
> >> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
> >>
> >> All patches in this series are interdependent and should go via Tegra =
tree.
> >>
> >> Changelog:
> >>
> >> v13: - Fixed compile-test error reported by build bot by reverting the
> >>        mmc/ patch to v11. The sdhci_suspend/resume_host() functions ar=
en't
> >>        available with the disabled CONFIG_PM_SLEEP, some code needs th=
e
> >>        ifdef.
> >>
> >>      - Added last r-b from Rob Herring for the DT patches.
> >>
> >>      - Corrected clk/ PM domain-support patch by not using the
> >>        devm_tegra_core_dev_init_opp_table_common() helper, which I
> >>        utilized in v12. The clk driver implements its own power domain
> >>        state syncing and common helper shouldn't be used. This fixes d=
river
> >>        probing for some clocks on some devices. It was reported by
> >>        Svyatoslav Ryhel for PLLE OPP error on T30 Asus Transformer tab=
let.
> >
> > Dmitry, I have looked through the series and besides those comments
> > that I have posted, I have nothing more to add. Overall it looks good
> > to me.
>
> Ulf, thank you very much! Yours input is invaluable. I'm happy that this
> series moving steadily to the final stage.

My pleasure. Let's get the final pieces fixed so we can get this merged! :-=
)

Kind regards
Uffe
