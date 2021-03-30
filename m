Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413D34E5BE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 12:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EF56E8A1;
	Tue, 30 Mar 2021 10:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729C06E8A1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 10:48:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id k8so15889647iop.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rP4kknX4xAvleYYg0u92Em0z72hot5F8BzD9RddRRUk=;
 b=EbUxrwGTbHNhFj3dhzWvOVejXKYejKx9ObBGEO2MgczgMKQnT+vXFQRfGg8vrNb/79
 KL/A0537a2GEjEYCAl7GY3oVE68vAS1j+oDWC6SotMtY9X5GCV/J4ATA4Uek1T+EnTTF
 /S+nYVBYnx+p8PzqDMOT6+sZ1DJeuObbYabHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rP4kknX4xAvleYYg0u92Em0z72hot5F8BzD9RddRRUk=;
 b=FJksVnpgN5MsIXpErPbUK8kBavCE3mXusj38toM2EBPCAjKAvj7a2Yu7nom2bWLA+H
 aX44SlL+S35AECul9651GWF9VPTpbFBvsWHbIG59jSwgPA4hlvobyNeAxVqHQRmLnaCl
 AOFHhFs17WYJuVSapli2X8ApdIHxmyQKSOM2WOn5VAiUHTzibt01iU6Fz91L1+ucGYqF
 1ZHL8CDLTVFQPIRHBySGYs6RACLHECySBfFJuNjkmmq76Njf7n/ksfP6wlvVmgNqvygI
 wKz02LJiB37ZKAtV+FG3I6o/YIBVUuEiVE0wMiDDyENBpN5hfjjw40LuLTpHWz2xfT+9
 /sZg==
X-Gm-Message-State: AOAM533JtNmzAq5Oz4KJ3edJ2/47vadOuGKoDBqAaJ0G59OgLCA5+otM
 oVsfqNQBKT9/0Y5IRCA412v/Jrp7xUvT9BewWbpgIQ==
X-Google-Smtp-Source: ABdhPJw/U5SlztC8bxQ7GW+0c8uKyz5qnR7FWLJK/549d5I/fXM+w1ZQvMlnX4P6c7fKXRSF8zGbDwvXCWFsbPHN0hA=
X-Received: by 2002:a05:6638:2bb:: with SMTP id
 d27mr28069519jaq.98.1617101330606; 
 Tue, 30 Mar 2021 03:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210203110717.686204-1-enric.balletbo@collabora.com>
 <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
In-Reply-To: <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 30 Mar 2021 18:48:24 +0800
Message-ID: <CAJMQK-hNwBm8r9GokjjbapyS+1MwtfL_DJda9q4xjK2Ud6SvvA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add missing MODULE_DEVICE_TABLE()
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 5:43 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi,
>
> On 3/2/21 12:07, Enric Balletbo i Serra wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > This patch adds the missing MODULE_DEVICE_TABLE definitions on different
> > Mediatek drivers which generates correct modalias for automatic loading
> > when these drivers are compiled as an external module.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

>
> A gentle ping for someone to review this patchset :-)
>
> Thanks,
>   Enric
>
> > ---
> >
> >  drivers/gpu/drm/mediatek/mtk_cec.c      | 2 ++
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 1 +
> >  drivers/gpu/drm/mediatek/mtk_dsi.c      | 1 +
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c     | 1 +
> >  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c | 1 +
> >  6 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> > index cb29b649fcdb..3b86e626e459 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> >
> > @@ -247,6 +248,7 @@ static const struct of_device_id mtk_cec_of_ids[] = {
> >       { .compatible = "mediatek,mt8173-cec", },
> >       {}
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
> >
> >  struct platform_driver mtk_cec_driver = {
> >       .probe = mtk_cec_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 52f11a63a330..2680370652fd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -822,6 +822,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
> >       },
> >       { },
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> >
> >  struct platform_driver mtk_dpi_driver = {
> >       .probe = mtk_dpi_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 5f49a809689b..e4645c8ae1c0 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -470,6 +470,7 @@ static const struct of_device_id mtk_drm_of_ids[] = {
> >         .data = &mt8183_mmsys_driver_data},
> >       { }
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> >
> >  static int mtk_drm_probe(struct platform_device *pdev)
> >  {
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 0527480c07be..c71ce62d1bec 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1193,6 +1193,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
> >         .data = &mt8183_dsi_driver_data },
> >       { },
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
> >
> >  struct platform_driver mtk_dsi_driver = {
> >       .probe = mtk_dsi_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > index 8ee55f9e2954..b4696a9d73f7 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > @@ -1818,6 +1818,7 @@ static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
> >       },
> >       {}
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
> >
> >  static struct platform_driver mtk_hdmi_driver = {
> >       .probe = mtk_drm_hdmi_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> > index 62dbad5675bb..6207eac88550 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> > @@ -335,6 +335,7 @@ static const struct of_device_id mtk_hdmi_ddc_match[] = {
> >       { .compatible = "mediatek,mt8173-hdmi-ddc", },
> >       {},
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
> >
> >  struct platform_driver mtk_hdmi_ddc_driver = {
> >       .probe = mtk_hdmi_ddc_probe,
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
