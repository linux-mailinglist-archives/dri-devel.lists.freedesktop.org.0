Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3748324EEF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 12:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73756EC93;
	Thu, 25 Feb 2021 11:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389966EC92
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 11:16:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id u125so4445518wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 03:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=heD9jn1aUR3UonADauYnnzfva+UkCJ7sOW2ICNM2+cc=;
 b=XB5lglJgx73xfLznvmTTtXZ4csZXy45xOGKtfyyFkC5kKY7MxkaEHVEqxLMA18893O
 fr5IjW0uKcGhaRtpnLyEcW6sKzpIY19L63vKCnFbTHPSrx7zEdz2n0EXB7BroX4ynDmR
 n5cGmzmOpnXO2bxaEylKgF26S0JkzDyIrFCuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=heD9jn1aUR3UonADauYnnzfva+UkCJ7sOW2ICNM2+cc=;
 b=Uv/KZt75aVC4UYvo6Q+Y6Mu+30q/mgETmZINVLTXabgWPWW1uRYsUAh5n2UArvnSjl
 nbwumVMcx0dEYcBNtu7Fz0ODJnbi9PzbBhvVM8n8QCS/dKc7hy+zOiF51W+RPnsTAz1z
 o2vL064o/Ylx1pjD+Eg6h/Hmxk5gRw0EE5nyOp/1tRuMLrlWwWfklQK/rCKqLNQUsRb3
 eU1h+FGBaAaKtmAK9kquum5FBLpfW5CybNCY7HVnN4iV1Lr2Grjfwc/UrmNyZInR59LI
 WYdLcU4y5yrxhe3Mydkg5yC27YPJuE5FR+NcpwRaNrD+3+pyXk59Tvl9GSezH4jHkjgX
 ybmg==
X-Gm-Message-State: AOAM531vRtE9KNu/JaRGQjAtn/HW0dBGVycsD1TrxrqycTLRJlcWTfFn
 PnJAVi4e85JbbJ4t6kWNiKFf+g==
X-Google-Smtp-Source: ABdhPJxLmAInOgkCHDqcAZ940VEX6npuhR8uMzEzfh02wFBYV6OqoTweXSw1TiF8R8d09saYXuTLag==
X-Received: by 2002:a05:600c:4f85:: with SMTP id
 n5mr2720690wmq.3.1614251787739; 
 Thu, 25 Feb 2021 03:16:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r20sm7114721wmd.18.2021.02.25.03.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 03:16:27 -0800 (PST)
Date: Thu, 25 Feb 2021 12:16:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/15] drm/arc: Use drmm_mode_config_cleanup
Message-ID: <YDeHCfdIZOp9g8bb@phenom.ffwll.local>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
 <20210112084358.2771527-7-daniel.vetter@ffwll.ch>
 <87d3aaed-dfe7-eb72-7bf5-f39cab5aa858@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d3aaed-dfe7-eb72-7bf5-f39cab5aa858@suse.de>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 12:29:59PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 12.01.21 um 09:43 schrieb Daniel Vetter:
> > With autocleanup through drm_device management we can delete all the
> > code. Possible now that there's no confusion against devm_kzalloc'ed
> > structures anymore.
> > =

> > I inlined arcpgu_setup_mode_config because it's tiny and the newly
> > needed return value handling would have been more ...
> > =

> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > ---
> >   drivers/gpu/drm/arc/arcpgu_crtc.c |  4 +---
> >   drivers/gpu/drm/arc/arcpgu_drv.c  | 21 +++++++++------------
> >   drivers/gpu/drm/arc/arcpgu_hdmi.c |  6 +-----
> >   drivers/gpu/drm/arc/arcpgu_sim.c  | 11 ++---------
> >   4 files changed, 13 insertions(+), 29 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/ar=
cpgu_crtc.c
> > index 31a85c703307..43313adb1981 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > @@ -209,10 +209,8 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
> >   	ret =3D drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, =
NULL,
> >   					&arc_pgu_crtc_funcs, NULL);
> > -	if (ret) {
> > -		arc_pgu_plane_destroy(primary);
> > +	if (ret)
> >   		return ret;
> > -	}
> >   	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);
> >   	return 0;
> > diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arc=
pgu_drv.c
> > index 9020352816fa..6349e9dc770e 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> > @@ -30,16 +30,6 @@ static const struct drm_mode_config_funcs arcpgu_drm=
_modecfg_funcs =3D {
> >   	.atomic_commit =3D drm_atomic_helper_commit,
> >   };
> > -static void arcpgu_setup_mode_config(struct drm_device *drm)
> > -{
> > -	drm_mode_config_init(drm);
> > -	drm->mode_config.min_width =3D 0;
> > -	drm->mode_config.min_height =3D 0;
> > -	drm->mode_config.max_width =3D 1920;
> > -	drm->mode_config.max_height =3D 1080;
> > -	drm->mode_config.funcs =3D &arcpgu_drm_modecfg_funcs;
> > -}
> > -
> >   DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
> >   static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
> > @@ -54,7 +44,15 @@ static int arcpgu_load(struct arcpgu_drm_private *ar=
cpgu)
> >   	if (IS_ERR(arcpgu->clk))
> >   		return PTR_ERR(arcpgu->clk);
> > -	arcpgu_setup_mode_config(drm);
> > +	ret =3D drmm_mode_config_init(drm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm->mode_config.min_width =3D 0;
> > +	drm->mode_config.min_height =3D 0;
> > +	drm->mode_config.max_width =3D 1920;
> > +	drm->mode_config.max_height =3D 1080;
> > +	drm->mode_config.funcs =3D &arcpgu_drm_modecfg_funcs;
> =

> It feels wrong to do this before even acquiring I/O memory. I would have
> moved all this just before the call to arc_pgu_setup_crtc().

It really doesn't matter, as long as everything is set up before we call
drm_dev_register, or register the fbdev emulation. So I think I'll just
stick with the color choice the original author went with.

But yeah grouping all the kms stuff a bit more together can't hurt.
-Daniel

> =

> Best regards
> Thomas
> =

> >   	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	arcpgu->regs =3D devm_ioremap_resource(&pdev->dev, res);
> > @@ -108,7 +106,6 @@ static int arcpgu_unload(struct drm_device *drm)
> >   {
> >   	drm_kms_helper_poll_fini(drm);
> >   	drm_atomic_helper_shutdown(drm);
> > -	drm_mode_config_cleanup(drm);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/ar=
cpgu_hdmi.c
> > index dbad2c9237fe..925d6d31bb78 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> > @@ -39,9 +39,5 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, stru=
ct device_node *np)
> >   		return ret;
> >   	/* Link drm_bridge to encoder */
> > -	ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > -	if (ret)
> > -		drm_encoder_cleanup(encoder);
> > -
> > -	return ret;
> > +	return drm_bridge_attach(encoder, bridge, NULL, 0);
> >   }
> > diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arc=
pgu_sim.c
> > index 3772df1647aa..afc34f8b4de0 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> > @@ -73,21 +73,14 @@ int arcpgu_drm_sim_init(struct drm_device *drm, str=
uct device_node *np)
> >   			DRM_MODE_CONNECTOR_VIRTUAL);
> >   	if (ret < 0) {
> >   		dev_err(drm->dev, "failed to initialize drm connector\n");
> > -		goto error_encoder_cleanup;
> > +		return ret;
> >   	}
> >   	ret =3D drm_connector_attach_encoder(connector, encoder);
> >   	if (ret < 0) {
> >   		dev_err(drm->dev, "could not attach connector to encoder\n");
> > -		goto error_connector_cleanup;
> > +		return ret;
> >   	}
> >   	return 0;
> > -
> > -error_connector_cleanup:
> > -	drm_connector_cleanup(connector);
> > -
> > -error_encoder_cleanup:
> > -	drm_encoder_cleanup(encoder);
> > -	return ret;
> >   }
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
