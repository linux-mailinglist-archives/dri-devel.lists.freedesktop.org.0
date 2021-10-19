Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95294334E4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 13:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B63B6E175;
	Tue, 19 Oct 2021 11:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106266E175
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 11:40:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t9so6826637lfd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p/y6DgAZycykowwrleZpy70Yak++qIhNqJ9ImugcYMs=;
 b=gbZb/rIEkq16uEpMdDfbn531uPXxDE2vXRTZ1At7zc8FyijjHf+TaWP9WSCNsx9CRl
 Ax+uAwkmd3zCdbRdDaM3dpQ6QH2wtz6LdoMLA6+gjkzDI8FsGa3Gg4WLu7V9K5SrUrby
 y6A+UktAxyprVLbdSpurxxaZ8mnWtv03QgVC25vrqwdz6F5CjpkyH0G67ZL5o2xSalbx
 z2YLwvEkGXJDZVRENSUyiANgZXnd7Hl65An187cV1TSi/tcYxCoWRVEqIP0BwzqCyQr0
 hoZBxk1g0lrSFu4sw+cYxe+pvM8G9j1I2iiX+c9B9ryltLhmQtiX2zDR77yR1QolGdKK
 MOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p/y6DgAZycykowwrleZpy70Yak++qIhNqJ9ImugcYMs=;
 b=hBLszyc0DxfEOmKHQ731LNTg8E5h5N7rXCC+izVmXI2M5Jpmu8Zt5a7TtFeOS+AePp
 AO6GbZtoLhlo48+CLFmDHG9Y/lceV+MIe6iBUXXdFV+bIlUtQUCBxN1pfX8zh0OHERuP
 O0D89eGE9vOuu1x41Sg4OwYznMkqjuRquBB0EYRqEnbtW0WXcIUaA9Zi0qVdNzQFAuup
 tVC+IOiuyTEPlmC6sVo/bz5l4s1LBeKa7gXKuJmGB/fwhMZrsB4ZS5C5t7R2sWJb+W6X
 6Y0oOTUZUUO1uAhT/yOOWoKS8DurTr/WBq1Kgbw5Vh2V61ZXDdOjqtdoUOZQnCYqtS6q
 NrmQ==
X-Gm-Message-State: AOAM532rs41yXLzyoNVrfHi/j4gbb343r79UlA7yjRzQmDnBWY8pcwq+
 CBT+0mhAoDtRI7XGeYV1rtxNjZ4voNRrrsXUN4T1lw==
X-Google-Smtp-Source: ABdhPJyiZ8hxPaWs5ZGwktR/58DXEHsnrg2iCZG7+dtLEFQZezq+DvEjCTIwbhL0fm341kLJAfk/05h60QX3kuXQ9G4=
X-Received: by 2002:a05:6512:3084:: with SMTP id
 z4mr5314051lfd.167.1634643653278; 
 Tue, 19 Oct 2021 04:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-21-digetx@gmail.com>
 <CAPDyKFoF2QxZss_h9B1NFqOqgeF=TQ6LajCedGiJ9_P8X5M0NA@mail.gmail.com>
 <0bcbcd3d-2154-03d2-f572-dc9032125c26@gmail.com>
 <CAPDyKFohA9iu2UQfwoc0pCrCGupdwnUTWjKOtP09_C2KaFSo8w@mail.gmail.com>
 <073114ea-490b-89a9-e82d-852b34cb11df@gmail.com>
In-Reply-To: <073114ea-490b-89a9-e82d-852b34cb11df@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Oct 2021 13:40:16 +0200
Message-ID: <CAPDyKFoOMvEW0o6=-_bYKhwUcbfeTD4qu-K2tfkdXiR0bErHsw@mail.gmail.com>
Subject: Re: [PATCH v13 20/35] mtd: rawnand: tegra: Add runtime PM and OPP
 support
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

On Sun, 17 Oct 2021 at 10:38, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.10.2021 18:01, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, 1 Oct 2021 at 16:35, Dmitry Osipenko <digetx@gmail.com> wrote:
> >>
> >> 01.10.2021 17:24, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wro=
te:
> >>>>
> >>>> The NAND on Tegra belongs to the core power domain and we're going t=
o
> >>>> enable GENPD support for the core domain. Now NAND must be resumed u=
sing
> >>>> runtime PM API in order to initialize the NAND power state. Add runt=
ime PM
> >>>> and OPP support to the NAND driver.
> >>>>
> >>>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>> ---
> >>>>  drivers/mtd/nand/raw/tegra_nand.c | 55 ++++++++++++++++++++++++++--=
---
> >>>>  1 file changed, 47 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/ra=
w/tegra_nand.c
> >>>> index 32431bbe69b8..098fcc9cb9df 100644
> >>>> --- a/drivers/mtd/nand/raw/tegra_nand.c
> >>>> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> >>>> @@ -17,8 +17,11 @@
> >>>>  #include <linux/mtd/rawnand.h>
> >>>>  #include <linux/of.h>
> >>>>  #include <linux/platform_device.h>
> >>>> +#include <linux/pm_runtime.h>
> >>>>  #include <linux/reset.h>
> >>>>
> >>>> +#include <soc/tegra/common.h>
> >>>> +
> >>>>  #define COMMAND                                        0x00
> >>>>  #define   COMMAND_GO                           BIT(31)
> >>>>  #define   COMMAND_CLE                          BIT(30)
> >>>> @@ -1151,6 +1154,7 @@ static int tegra_nand_probe(struct platform_de=
vice *pdev)
> >>>>                 return -ENOMEM;
> >>>>
> >>>>         ctrl->dev =3D &pdev->dev;
> >>>> +       platform_set_drvdata(pdev, ctrl);
> >>>>         nand_controller_init(&ctrl->controller);
> >>>>         ctrl->controller.ops =3D &tegra_nand_controller_ops;
> >>>>
> >>>> @@ -1166,14 +1170,22 @@ static int tegra_nand_probe(struct platform_=
device *pdev)
> >>>>         if (IS_ERR(ctrl->clk))
> >>>>                 return PTR_ERR(ctrl->clk);
> >>>>
> >>>> -       err =3D clk_prepare_enable(ctrl->clk);
> >>>> +       err =3D devm_pm_runtime_enable(&pdev->dev);
> >>>> +       if (err)
> >>>> +               return err;
> >>>> +
> >>>> +       err =3D devm_tegra_core_dev_init_opp_table_common(&pdev->dev=
);
> >>>> +       if (err)
> >>>> +               return err;
> >>>> +
> >>>> +       err =3D pm_runtime_resume_and_get(&pdev->dev);
> >>>>         if (err)
> >>>>                 return err;
> >>>>
> >>>>         err =3D reset_control_reset(rst);
> >>>>         if (err) {
> >>>>                 dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
> >>>> -               goto err_disable_clk;
> >>>> +               goto err_put_pm;
> >>>>         }
> >>>>
> >>>>         writel_relaxed(HWSTATUS_CMD_DEFAULT, ctrl->regs + HWSTATUS_C=
MD);
> >>>> @@ -1188,21 +1200,19 @@ static int tegra_nand_probe(struct platform_=
device *pdev)
> >>>>                                dev_name(&pdev->dev), ctrl);
> >>>>         if (err) {
> >>>>                 dev_err(ctrl->dev, "Failed to get IRQ: %d\n", err);
> >>>> -               goto err_disable_clk;
> >>>> +               goto err_put_pm;
> >>>>         }
> >>>>
> >>>>         writel_relaxed(DMA_MST_CTRL_IS_DONE, ctrl->regs + DMA_MST_CT=
RL);
> >>>>
> >>>>         err =3D tegra_nand_chips_init(ctrl->dev, ctrl);
> >>>>         if (err)
> >>>> -               goto err_disable_clk;
> >>>> -
> >>>> -       platform_set_drvdata(pdev, ctrl);
> >>>> +               goto err_put_pm;
> >>>>
> >>>
> >>> There is no corresponding call pm_runtime_put() here. Is it
> >>> intentional to always leave the device runtime resumed after ->probe(=
)
> >>> has succeeded?
> >>>
> >>> I noticed you included some comments about this for some other
> >>> drivers, as those needed more tweaks. Is that also the case for this
> >>> driver?
> >>
> >> Could you please clarify? There is pm_runtime_put() in both probe-erro=
r
> >> and remove() code paths here.
> >
> > I was not considering the error path of ->probe() (or ->remove()), but
> > was rather thinking about when ->probe() completes successfully. Then
> > you keep the device runtime resumed, because you have called
> > pm_runtime_resume_and_get() for it.
> >
> > Shouldn't you have a corresponding pm_runtime_put() in ->probe(),
> > allowing it to be runtime suspended, until the device is really needed
> > later on. No?
>
> This driver doesn't support active power management. I don't have Tegra
> hardware that uses NAND storage for testing, so it's up to somebody else
> to implement dynamic power management. NAND doesn't require high
> voltages, so it's fine to keep the old driver behaviour by keeping
> hardware resumed since the probe time.

Alright, fair enough and thanks for clarifying!

Kind regards
Uffe
