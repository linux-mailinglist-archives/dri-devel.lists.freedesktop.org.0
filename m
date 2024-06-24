Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB6914975
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF4210E410;
	Mon, 24 Jun 2024 12:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qVZeGghc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A512510E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 12:12:59 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-63bf211542cso34487357b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719231178; x=1719835978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6qUn3B941SaKmnTlYImbJrnT+/A2pSZCbuhCNRlU2c=;
 b=qVZeGghc6tmbxCtlR+PQ1uEM3KEyK10uRab3OXfO9VHPsySm47M70EWgBrmsNkVK+J
 KEpW5pOVcRdaJ6bxgi0kpBX+n73P/vEZgHZqg75xGT0J4PCuZkpJPTRxjnUmq+8zg+/s
 7EKwy8vF6Wct9DjyKFic86tYAM/6MawxqEc1Oifr2LufihnKd12/tz1lUk3L38yxTW48
 qdxMwN0cmmt+F310csqZ2RScXyHtlitchVmffQA6YIno5edEw7TGs0AvMkkjU5qgy3SS
 6WL10EHoN220fm4EXmosMRNdNJgRYaRL/IKlnZjjaC+9SqO274q0hNrtRyXRTWv+rNkS
 newg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719231178; x=1719835978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6qUn3B941SaKmnTlYImbJrnT+/A2pSZCbuhCNRlU2c=;
 b=ESWtfASnWZXUNp1lBVLraKi/meNSwvTnCTJg6WeVFNxT3CZWs1ZNikFfgRoOeZKWFb
 ixM4GitcpK6AgKlz1XeRbMr0dg4mU6jvDBt6Z81/6udpe1uGnuSq0ibntj+iAbAHm2Hq
 Bv+dI70u4BO9+FVPJ5caFQwGHVEyIqWS0bmcO/mNxmvC5PP9OTuMsO0LsK/3KFTfVkks
 aZxee0lCkPEy6CXK3HXIKjq5csf/bv1GwG/74ZFvhfkddxM9iRhZ/nnUxwAMJqcQYRTQ
 Csj15tG9he/xHpYtST3RNZniWlMEWJUxt1ehPTGFdR1JuG4O6Ae4v6/7lLTxSoXqnwcq
 +Ahw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtZkGYTY6NRATwKPMpCTaGkPUEYoOYMMkP/sMwMTYpXzkN4lZRumBmvxus7qAa+OMsgSZ8immCKpDzpnlUylhEuMQIX1mIlOZfIjX6nURM
X-Gm-Message-State: AOJu0YxGsP2GoMil6bIwprbdu+DAlnrxdR3ZL+kF+q4I1mzq6BVKp/bU
 D7aFVwTQfscWY0pdX14DQY1jsVUp9QTYNvM+vPj/O7u2TT7ur2KzAdORh8zFy82740rJaJTLcCu
 xtK97cxPY8P6TKk553zULKXzqdWNZRildM/fFZw==
X-Google-Smtp-Source: AGHT+IEF1HehGOmrnh5OAL93YehPGGcegJHyWkO5g5YUNrXsZWXxAzZkNA0qGBJHKUiwcOCe0R4VtMvMhRHHrQfF14k=
X-Received: by 2002:a81:690b:0:b0:627:7f2a:3b0a with SMTP id
 00721157ae682-6429aa00545mr43803277b3.31.1719231178522; Mon, 24 Jun 2024
 05:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org>
 <859620673.0ifERbkFSE@steina-w>
 <CAA8EJppQtiDxZjLMk6VB0X_4VSuC8cNhPOMd8on2uQ3xo92vSg@mail.gmail.com>
 <1984704.yKVeVyVuyW@steina-w>
In-Reply-To: <1984704.yKVeVyVuyW@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 15:12:45 +0300
Message-ID: <CAA8EJpoKudfSF_BM9O3xXv0GV3wUkTz2x6nH3J4JzrXtk7ECzg@mail.gmail.com>
Subject: Re: [PATCH] drm/lcdif: switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 24 Jun 2024 at 15:03, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dmitry,
>
> Am Montag, 24. Juni 2024, 13:49:03 CEST schrieb Dmitry Baryshkov:
> > On Mon, 24 Jun 2024 at 14:32, Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > >
> > > Hi,
> > >
> > > Am Montag, 24. Juni 2024, 12:31:46 CEST schrieb Dmitry Baryshkov:
> > > > Existing in-kernel device trees use LCDIF with the dsim + adv7533, =
dsim
> > > > + tc358762 or with ldb + panel_bridge. All these combinations suppo=
rt
> > > > using DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment.
> > > >
> > > > Change lcdif driver to use this flag when attaching the bridge and
> > > > create drm_bridge_connector afterwards.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Note: compile-tested only.
> > >
> > > I gave it a try, but it doesn't work. Despite DSI output it also brea=
ks
> > > HDMI output, where I at least some error messages:
> > > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32=
c00000/hdmi@32fd8000 to encoder None-37: -22
> > > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32=
c00000/display-bridge@32fc4000 to encoder None-37: -22
> > > imx-lcdif 32fc6000.display-controller: error -EINVAL: Failed to attac=
h bridge for endpoint0
> > > imx-lcdif 32fc6000.display-controller: error -EINVAL: Cannot connect =
bridge
> > > imx-lcdif 32fc6000.display-controller: probe with driver imx-lcdif fa=
iled with error -22
> >
> > Could you please try it with the following change:
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > index 13bc570c5473..c87d3e55c00d 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > @@ -94,6 +94,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_devic=
e *pdev)
> >         plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
> >         plat_data->priv_data =3D hdmi;
> >         plat_data->phy_force_vendor =3D true;
> > +       plat_data->output_port =3D 1;
> >
> >         hdmi->dw_hdmi =3D dw_hdmi_probe(pdev, plat_data);
> >         if (IS_ERR(hdmi->dw_hdmi))
>
> Okay, this does fix the HDMI probe errors. Nevertheless I get the errors:
> [   13.429313] [drm] Initialized imx-lcdif 1.0.0 for 32e80000.display-con=
troller on minor 1
> [   13.439116] imx-lcdif 32e80000.display-controller: [drm] Cannot find a=
ny crtc or sizes
> [   13.448168] imx-lcdif 32e80000.display-controller: [drm] Cannot find a=
ny crtc or sizes
> [   15.519737] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-con=
troller on minor 2
> [   15.675672] imx-lcdif 32fc6000.display-controller: [drm] Cannot find a=
ny crtc or sizes
>
> just from the lcdif patch for both HDMI and DP.

It seems, because I'm stupid and I missed drm_connector_attach_encoder().

Anyway, it looks like even if that fixes the issue, dw-hdmi needs more
work to work with drm_bridge_connector without losing access to such
features like YCbCr 420 and CEC. So thank you for the tests, but let's
probably drop the patch / idea for now.


>
> Best regards,
> Alexander
>
> >
> > >
> > > Best regards,
> > > Alexander
> > >
> > > > ---
> > > >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mx=
sfb/lcdif_drv.c
> > > > index 0f895b8a99d6..1d5508449995 100644
> > > > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > > > @@ -16,6 +16,7 @@
> > > >
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_bridge.h>
> > > > +#include <drm/drm_bridge_connector.h>
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_fbdev_dma.h>
> > > > @@ -48,6 +49,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_p=
rivate *lcdif)
> > > >  {
> > > >       struct device *dev =3D lcdif->drm->dev;
> > > >       struct device_node *ep;
> > > > +     struct drm_connector *connector;
> > > >       struct drm_bridge *bridge;
> > > >       int ret;
> > > >
> > > > @@ -96,13 +98,23 @@ static int lcdif_attach_bridge(struct lcdif_drm=
_private *lcdif)
> > > >                       return ret;
> > > >               }
> > > >
> > > > -             ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > > > +             ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_=
BRIDGE_ATTACH_NO_CONNECTOR);
> > > >               if (ret) {
> > > >                       of_node_put(ep);
> > > >                       return dev_err_probe(dev, ret,
> > > >                                            "Failed to attach bridge=
 for endpoint%u\n",
> > > >                                            of_ep.id);
> > > >               }
> > > > +
> > > > +             connector =3D drm_bridge_connector_init(lcdif->drm, e=
ncoder);
> > > > +             if (IS_ERR(connector)) {
> > > > +                     ret =3D PTR_ERR(connector);
> > > > +                     of_node_put(ep);
> > > > +
> > > > +                     return dev_err_probe(dev, ret,
> > > > +                                          "Failed to create bridge=
 connector for endpoint%u\n",
> > > > +                                          of_ep.id);
> > > > +             }
> > > >       }
> > > >
> > > >       return 0;
> > > >
> > > > ---
> > > > base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> > > > change-id: 20240624-mxc-lcdif-bridge-attach-60368807b2f9
> > > >
> > > > Best regards,
> > > >
> > >
> > >
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > http://www.tq-group.com/
> > >
> > >
> >
> >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>


--=20
With best wishes
Dmitry
