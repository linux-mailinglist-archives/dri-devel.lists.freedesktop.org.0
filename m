Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527173167AC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 14:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D186EC83;
	Wed, 10 Feb 2021 13:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91806EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 13:14:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,168,1610406000"; d="scan'208";a="492258135"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 14:14:54 +0100
Date: Wed, 10 Feb 2021 14:14:54 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] video: use getter/setter functions
In-Reply-To: <YCPbxSHWMipTz+mB@phenom.ffwll.local>
Message-ID: <alpine.DEB.2.22.394.2102101414100.2881@hadrien>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell> <YCPbxSHWMipTz+mB@phenom.ffwll.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2043823747-1612962895=:2881"
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-omap@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2043823747-1612962895=:2881
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 10 Feb 2021, Daniel Vetter wrote:

> On Wed, Feb 10, 2021 at 08:23:41AM +0000, Lee Jones wrote:
> > On Tue, 09 Feb 2021, Julia Lawall wrote:
> >
> > > Use getter and setter functions, for platform_device structures and a
> > > spi_device structure.
> > >
> > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > >
> > > ---
> > >  drivers/video/backlight/qcom-wled.c                                  |    2 +-
> >
> > This patch is fine.
> >
> > Could you please split it out and submit it separately though please.
>
> Or just apply the entire patch through backlight tree, there's nothing
> going on in fbdev anyway I think.

I was indeed not sure how much to split this up.  If it is desired to
split it more, I can do that.

julia

>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
> > >  drivers/video/fbdev/amifb.c                                          |    4 ++--
> > >  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
> > >  drivers/video/fbdev/imxfb.c                                          |    2 +-
> > >  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
> > >  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
> > >  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
> > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
> > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
> > >  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
> > >  10 files changed, 16 insertions(+), 16 deletions(-)
> >
> > ...]
> >
> > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > index 3bc7800eb0a9..091f07e7c145 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
> > >
> > >  static int wled_remove(struct platform_device *pdev)
> > >  {
> > > -	struct wled *wled = dev_get_drvdata(&pdev->dev);
> > > +	struct wled *wled = platform_get_drvdata(pdev);
> > >
> > >  	mutex_destroy(&wled->lock);
> > >  	cancel_delayed_work_sync(&wled->ovp_work);
> >
> > For my own reference (apply this as-is to your sign-off block):
> >
> >   Acked-for-Backlight-by: Lee Jones <lee.jones@linaro.org>
> >
> > --
> > Lee Jones [李琼斯]
> > Senior Technical Lead - Developer Services
> > Linaro.org │ Open source software for Arm SoCs
> > Follow Linaro: Facebook | Twitter | Blog
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
--8323329-2043823747-1612962895=:2881
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--8323329-2043823747-1612962895=:2881--
