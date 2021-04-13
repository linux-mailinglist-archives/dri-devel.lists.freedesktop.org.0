Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA735E0E6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75E188D96;
	Tue, 13 Apr 2021 14:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAF389024
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:04:42 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p6so9883485wrn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=h/8wbVDaxKr1pxr3xsfJZCxLfYGtm7wlDkUhOm6t6b4=;
 b=hBQxBj0oG2Kel7df7Of3iDfJUusA0RF8LI9lu89GN9KaVP3u88gTytEJBBpdsiVttV
 YZ23pgKYTDa2Wpql6LfNMUnLc8cDfge7j+LpE2twGRdxL61RruI8j3w8X3C1W2c8qKCi
 7PYPZXvhwHo2HF1035nYZPcCpRc+lDkkA8HOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h/8wbVDaxKr1pxr3xsfJZCxLfYGtm7wlDkUhOm6t6b4=;
 b=WtRyLVTWhNkxCX/P5397z1bdCYPGkqqkGuTcbC37sQWYdzAEGVyYRVvjRxuasP2VnC
 ywHddTCP65+dMcgH5Z4XWZwC2ofKk+J6oC0Ls3C0/aO7IIxlipNNdUszC8uFiD/o85Ks
 iTw/frWf/OVpJPhW7Te6tHBrZwpLkOOi6pjN8qWWsFTdGHzUWV/dfzc5swJ8yM7PGoGu
 M767w25qGBxN1iuG+Z8H8hUzjhdHsZQj7JLUivzkzN7oP3TyPrE56+Kv8CR1UMOINBv8
 zWpC0Y87acsU6I4NV/CFXbEnZZg4vp0fedNLHEkBotHMevml+2/6FYojB9SYbI0PEu9s
 IQ9A==
X-Gm-Message-State: AOAM532B0eHY3/RWhTsbkf8x2sLVK33VHegvZGUv+p1o2pr+s2PxCvFg
 0OwZaD4inStoPOi6BLyQfDbx5Q==
X-Google-Smtp-Source: ABdhPJxIskl1NS0XtaVK2rXOOyH64CtwzDZOqUuJOxxyU93tTi9dGB9/qlYK4sqT5VsoRX9bJngn6Q==
X-Received: by 2002:adf:b608:: with SMTP id f8mr15474341wre.338.1618322681172; 
 Tue, 13 Apr 2021 07:04:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm2584304wmb.35.2021.04.13.07.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 07:04:39 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:04:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 05/12] drm/imx: Don't set allow_fb_modifiers explicitly
Message-ID: <YHWk9V/4mu1lGFgD@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-5-daniel.vetter@ffwll.ch>
 <290aef5ed13749d465eb19235aa87a2cef63dd2a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <290aef5ed13749d465eb19235aa87a2cef63dd2a.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 01:47:28PM +0200, Lucas Stach wrote:
> Am Dienstag, dem 13.04.2021 um 11:48 +0200 schrieb Daniel Vetter:
> > Since
> > =

> > commit 890880ddfdbe256083170866e49c87618b706ac7
> > Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Date:   Fri Jan 4 09:56:10 2019 +0100
> > =

> > =A0=A0=A0=A0drm: Auto-set allow_fb_modifiers when given modifiers at pl=
ane init
> > =

> > this is done automatically as part of plane init, if drivers set the
> > modifier list correctly. Which is the case here.
> > =

> > This one actually set it twice on top of what drm_plane_init does, so
> > double-redundant!
> =

> That's not true. imx-dcss and imx-drm are two totally separate drivers.
> Maybe we should move imx-drm into its own ipuv3 directory one day to
> make this more clear. Change is still correct, though.

Hm I greeped for drm_universal_plane_init and didn't find anythinf for the
imx main driver ... where are planes set up for that? Need to review that
they have the modifiers listed in all cases.
-Daniel

> =

> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> > =A0drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 -
> > =A0drivers/gpu/drm/imx/imx-drm-core.c  | 1 -
> > =A02 files changed, 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/=
dcss/dcss-kms.c
> > index b549ce5e7607..37ae68a7fba5 100644
> > --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > @@ -52,7 +52,6 @@ static void dcss_kms_mode_config_init(struct dcss_kms=
_dev *kms)
> > =A0	config->min_height =3D 1;
> > =A0	config->max_width =3D 4096;
> > =A0	config->max_height =3D 4096;
> > -	config->allow_fb_modifiers =3D true;
> > =A0	config->normalize_zpos =3D true;
> > =A0
> > =

> > =

> > =

> > =A0	config->funcs =3D &dcss_drm_mode_config_funcs;
> > diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/i=
mx-drm-core.c
> > index 2ded8e4f32d0..8be4edaec958 100644
> > --- a/drivers/gpu/drm/imx/imx-drm-core.c
> > +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> > @@ -209,7 +209,6 @@ static int imx_drm_bind(struct device *dev)
> > =A0	drm->mode_config.max_height =3D 4096;
> > =A0	drm->mode_config.funcs =3D &imx_drm_mode_config_funcs;
> > =A0	drm->mode_config.helper_private =3D &imx_drm_mode_config_helpers;
> > -	drm->mode_config.allow_fb_modifiers =3D true;
> > =A0	drm->mode_config.normalize_zpos =3D true;
> > =A0
> > =

> > =

> > =

> > =A0	ret =3D drmm_mode_config_init(drm);
> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
