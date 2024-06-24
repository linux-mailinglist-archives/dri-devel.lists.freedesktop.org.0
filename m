Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E182914923
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 13:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B403B10E144;
	Mon, 24 Jun 2024 11:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m/OeO330";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2BC10E144
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:49:17 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dfe81d54db9so3862451276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 04:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719229756; x=1719834556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkA/z1l9YpCOLu/cX4kLST/VORs4QaQkWnqqTvlwZPM=;
 b=m/OeO330nhpdJs4mWDG9iMtl3O6EYYdS+MZonw7kq34mAPcRZBjvI28ehPW82UkvcX
 8wA/jQMcSJVXP0PJeERAa1+WpfKjYWFtPtKNKbxgZN6BJnAcWhRf8jyTsU5jcia665pp
 nYMDMrxeiRYXl9WrcYiE6/djIhMU+x/9zzhsEbqInHr4OkZ5USYakqOVV8nniLNUgvUV
 iM9u5BTPP4JPSgSEDTUI0T4qI0Sy4/JdWqrEcDgqHfMmQq7w87Wmm3UCXL3ExIUHoLHq
 bA1H1fZSyXdHFQPoc3m94CEALWYRt87OvEamyg7WtzekbWh3SE3M09Bqg51Jw0sQHz1i
 gf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719229756; x=1719834556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkA/z1l9YpCOLu/cX4kLST/VORs4QaQkWnqqTvlwZPM=;
 b=gxb2n9iObJivkRA5wdrL9YwbkkRJtZQ2c64xBR+IitIu4VWDMeRquu8mPEL6QngPJS
 j7hny5n+4SIyZAuAhWIRvuCYWK23CsCN7hAb8bFVAu7Af8odt3xAsXZzsQH4pWQPIRnk
 6893wnJ9wCRLHZP15LVizepG4l+xJO204lS9Kh2DqpPckayiuPSwbjLTV6qYCWY0X2gk
 iDSDY18QBLllnmuhKHKb+SE0u+gH86jW39iW715+JG7f7tpVT2WQddU26gymnesniz9Q
 IkUBNaBnnL6X6AR17wJWW98GzayfPiZzM5cHD1CA0MvAQyKJUeJyYEMfa9ip8sRtBZQF
 +6xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2QH6T2kkR6n1Is2eBxfiRciqCzPYCzhmARlx9ghIR52h+ozwJpXhoUOX5yxl8J7fi2UM1GhfRQ95uY58ANDINdRdprzono4a4F64YervD
X-Gm-Message-State: AOJu0YxLDhuy9pGr894rR5vhwfDTukBFJyNc4lpSuuAAsuSrhafBZr9q
 buoOmEKebJvCw60VA5q+6SK+PRSp4vM0LY1s0NSvjRsUEXUBWx8xhKsZQUgA6Kn/UARJfsPdGAR
 VocuPr8wDiN3ROxYZdwgAzV5FH0pjZhmx8EFVvw==
X-Google-Smtp-Source: AGHT+IFd9TlWtmtn5DwmKwZMZIwIbV3oYXTGDHovHK4lBMEBgjrMyjz7XYp6QERTqmQdXziI3ZktfSK5+Ivy8M+6820=
X-Received: by 2002:a05:6902:311:b0:dfe:4ab9:1cc1 with SMTP id
 3f1490d57ef6-e030109b1cemr3737428276.40.1719229755986; Mon, 24 Jun 2024
 04:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org>
 <859620673.0ifERbkFSE@steina-w>
In-Reply-To: <859620673.0ifERbkFSE@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 14:49:03 +0300
Message-ID: <CAA8EJppQtiDxZjLMk6VB0X_4VSuC8cNhPOMd8on2uQ3xo92vSg@mail.gmail.com>
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

On Mon, 24 Jun 2024 at 14:32, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Montag, 24. Juni 2024, 12:31:46 CEST schrieb Dmitry Baryshkov:
> > Existing in-kernel device trees use LCDIF with the dsim + adv7533, dsim
> > + tc358762 or with ldb + panel_bridge. All these combinations support
> > using DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment.
> >
> > Change lcdif driver to use this flag when attaching the bridge and
> > create drm_bridge_connector afterwards.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Note: compile-tested only.
>
> I gave it a try, but it doesn't work. Despite DSI output it also breaks
> HDMI output, where I at least some error messages:
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c000=
00/hdmi@32fd8000 to encoder None-37: -22
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c000=
00/display-bridge@32fc4000 to encoder None-37: -22
> imx-lcdif 32fc6000.display-controller: error -EINVAL: Failed to attach br=
idge for endpoint0
> imx-lcdif 32fc6000.display-controller: error -EINVAL: Cannot connect brid=
ge
> imx-lcdif 32fc6000.display-controller: probe with driver imx-lcdif failed=
 with error -22

Could you please try it with the following change:

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 13bc570c5473..c87d3e55c00d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -94,6 +94,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *p=
dev)
        plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
        plat_data->priv_data =3D hdmi;
        plat_data->phy_force_vendor =3D true;
+       plat_data->output_port =3D 1;

        hdmi->dw_hdmi =3D dw_hdmi_probe(pdev, plat_data);
        if (IS_ERR(hdmi->dw_hdmi))


>
> Best regards,
> Alexander
>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/=
lcdif_drv.c
> > index 0f895b8a99d6..1d5508449995 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -16,6 +16,7 @@
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_fbdev_dma.h>
> > @@ -48,6 +49,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
> >  {
> >       struct device *dev =3D lcdif->drm->dev;
> >       struct device_node *ep;
> > +     struct drm_connector *connector;
> >       struct drm_bridge *bridge;
> >       int ret;
> >
> > @@ -96,13 +98,23 @@ static int lcdif_attach_bridge(struct lcdif_drm_pri=
vate *lcdif)
> >                       return ret;
> >               }
> >
> > -             ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > +             ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRID=
GE_ATTACH_NO_CONNECTOR);
> >               if (ret) {
> >                       of_node_put(ep);
> >                       return dev_err_probe(dev, ret,
> >                                            "Failed to attach bridge for=
 endpoint%u\n",
> >                                            of_ep.id);
> >               }
> > +
> > +             connector =3D drm_bridge_connector_init(lcdif->drm, encod=
er);
> > +             if (IS_ERR(connector)) {
> > +                     ret =3D PTR_ERR(connector);
> > +                     of_node_put(ep);
> > +
> > +                     return dev_err_probe(dev, ret,
> > +                                          "Failed to create bridge con=
nector for endpoint%u\n",
> > +                                          of_ep.id);
> > +             }
> >       }
> >
> >       return 0;
> >
> > ---
> > base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> > change-id: 20240624-mxc-lcdif-bridge-attach-60368807b2f9
> >
> > Best regards,
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
