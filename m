Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B33B29B0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 09:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C556EA40;
	Thu, 24 Jun 2021 07:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753BC6E9FB;
 Thu, 24 Jun 2021 07:46:22 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D07A2197E;
 Thu, 24 Jun 2021 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624520781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVwcri593ba1CJ2aKAAm70yjSxT1JVgNF5z4CPQfIdM=;
 b=OXRjV1BzshWsnMiv9ICZbEo/UP8KUTPx8LxQBoe1fMKhN2ZlrOvvaDBsoFGi24EBT5Q4/Y
 tHnsU1t9IAbqCBPqNtN+7WWsmm7iVox5yB9CD68uY8mxr4nKBMthEq/sxbfAZ0V861Hw/2
 FJ/MCVibFKJ3PuBI77Vg+fwNOi0yQdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624520781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVwcri593ba1CJ2aKAAm70yjSxT1JVgNF5z4CPQfIdM=;
 b=Q/N1aDghXQPGF4NfTpM6eis30ImlC/QnFF7ADuPWJkkFKQk9HPkA0455+uTo2gVAxW3fBS
 y7Jrp7CRvRABgABA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F2A7F11A97;
 Thu, 24 Jun 2021 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624520781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVwcri593ba1CJ2aKAAm70yjSxT1JVgNF5z4CPQfIdM=;
 b=OXRjV1BzshWsnMiv9ICZbEo/UP8KUTPx8LxQBoe1fMKhN2ZlrOvvaDBsoFGi24EBT5Q4/Y
 tHnsU1t9IAbqCBPqNtN+7WWsmm7iVox5yB9CD68uY8mxr4nKBMthEq/sxbfAZ0V861Hw/2
 FJ/MCVibFKJ3PuBI77Vg+fwNOi0yQdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624520781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVwcri593ba1CJ2aKAAm70yjSxT1JVgNF5z4CPQfIdM=;
 b=Q/N1aDghXQPGF4NfTpM6eis30ImlC/QnFF7ADuPWJkkFKQk9HPkA0455+uTo2gVAxW3fBS
 y7Jrp7CRvRABgABA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 2uJXOkw41GDFCQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:46:20 +0000
Subject: Re: [PATCH 10/15] drm/vram-helpers: Create
 DRM_GEM_VRAM_PLANE_HELPER_FUNCS
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-11-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <da2c2108-6f48-6a85-db71-c93614484369@suse.de>
Date: Thu, 24 Jun 2021 09:46:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622165511.3169559-11-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sdO51lUl8HAYV5M4qG0S8bJTLtGR7P5hS"
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sdO51lUl8HAYV5M4qG0S8bJTLtGR7P5hS
Content-Type: multipart/mixed; boundary="VR22UcpH8RRuI3cLNCnkwnmHKzdC3E0wH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tian Tao <tiantao6@hisilicon.com>, Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <da2c2108-6f48-6a85-db71-c93614484369@suse.de>
Subject: Re: [PATCH 10/15] drm/vram-helpers: Create
 DRM_GEM_VRAM_PLANE_HELPER_FUNCS
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20210622165511.3169559-11-daniel.vetter@ffwll.ch>

--VR22UcpH8RRuI3cLNCnkwnmHKzdC3E0wH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.06.21 um 18:55 schrieb Daniel Vetter:
> Like we have for the shadow helpers too, and roll it out to drivers.

In addition to the plane-helper macro, you may also want to add=20
DRM_GEM_VRAM_SIMPLE_DISPLAY_PIPE_FUNCS and use it in bochs.

Best regards
Thomas

>=20
> Acked-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/ast/ast_mode.c                 |  3 +--
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c |  3 +--
>   drivers/gpu/drm/vboxvideo/vbox_mode.c          |  3 +--
>   include/drm/drm_gem_vram_helper.h              | 12 ++++++++++++
>   4 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index e5996ae03c49..f5d58c3088fe 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -612,8 +612,7 @@ ast_primary_plane_helper_atomic_disable(struct drm_=
plane *plane,
>   }
>  =20
>   static const struct drm_plane_helper_funcs ast_primary_plane_helper_f=
uncs =3D {
> -	.prepare_fb =3D drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb =3D drm_gem_vram_plane_helper_cleanup_fb,
> +	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
>   	.atomic_check =3D ast_primary_plane_helper_atomic_check,
>   	.atomic_update =3D ast_primary_plane_helper_atomic_update,
>   	.atomic_disable =3D ast_primary_plane_helper_atomic_disable,
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 29b8332b2bca..ccf80e369b4b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -158,8 +158,7 @@ static const struct drm_plane_funcs hibmc_plane_fun=
cs =3D {
>   };
>  =20
>   static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs =3D=
 {
> -	.prepare_fb	=3D drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb	=3D drm_gem_vram_plane_helper_cleanup_fb,
> +	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
>   	.atomic_check =3D hibmc_plane_atomic_check,
>   	.atomic_update =3D hibmc_plane_atomic_update,
>   };
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vb=
oxvideo/vbox_mode.c
> index 964381d55fc1..972c83b720aa 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -488,8 +488,7 @@ static const struct drm_plane_helper_funcs vbox_pri=
mary_helper_funcs =3D {
>   	.atomic_check =3D vbox_primary_atomic_check,
>   	.atomic_update =3D vbox_primary_atomic_update,
>   	.atomic_disable =3D vbox_primary_atomic_disable,
> -	.prepare_fb	=3D drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb	=3D drm_gem_vram_plane_helper_cleanup_fb,
> +	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
>   };
>  =20
>   static const struct drm_plane_funcs vbox_primary_plane_funcs =3D {
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 27ed7e9243b9..f48d181c824b 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -124,6 +124,18 @@ void
>   drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
>   				     struct drm_plane_state *old_state);
>  =20
> +/**
> + * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> + *	Initializes struct drm_plane_helper_funcs for VRAM handling
> + *
> + * Drivers may use GEM BOs as VRAM helpers for the framebuffer memory.=
 This
> + * macro initializes struct drm_plane_helper_funcs to use the respecti=
ve helper
> + * functions.
> + */
> +#define DRM_GEM_VRAM_PLANE_HELPER_FUNCS \
> +	.prepare_fb =3D drm_gem_vram_plane_helper_prepare_fb, \
> +	.cleanup_fb =3D drm_gem_vram_plane_helper_cleanup_fb
> +
>   /*
>    * Helpers for struct drm_simple_display_pipe_funcs
>    */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VR22UcpH8RRuI3cLNCnkwnmHKzdC3E0wH--

--sdO51lUl8HAYV5M4qG0S8bJTLtGR7P5hS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUOEwFAwAAAAAACgkQlh/E3EQov+Bh
LQ/9Fd1xO2doOMm0ADWxlcIvsaFwKGOr47fKb1OuqlKnFfbTZy4Z7nJwtBCxGVxw/63L1JT3AZJa
WRDowp+0SaMTGbwTLTXsEX10I6BYKd5Ij1FjvUx2uUUOKJCx9Appbzbk8MCEGVOcuv/+zAT1IZLs
DEuKd0uMrEOX4y3EbdQ475usDMZ68xLgDIChhKyNT3hysYXMMqjkjy2tAgnyLdGbkzPtTbrlSEJr
B62EnVy775ygeYZw2GgyZP09v7lem9EtwynSiGMQUO3mOUNdq5m3QCEV//KcHCQDgmWMT1wbzUbs
I8wq6idlCbQgeUXsrdFXVLQ+UXoCrpvjR3O+HQC0rmYQrX/zlDCwKX7a7xAn/X5HDUYdQ79kVdq5
SIKeldD0q51oTRBGoZYgARNjkt4Vvk0gBChGahH/nM5Wtt0kDG7/dybjN9qGXyMzU0lwWysXaxRX
Z7Ir94t5aO9Gs22V8sNzYkT3EdfddgxYmSnwrzj/jyksmd0pz3m8Zccpsrqf3Z1C1+39yTiZ0lKF
i1MEfLnMdiw8Krq9q2CGJX3PylmVKz8CIpxY8128bc108XczQlZY1b0PEo4WZfCwFabMka/pA4iC
KoHetRbknJUcsqoExpsLPJf2Yf46K86zpdTOwEGMhya66/00lS9q4J60Z8fBtNyu10q9sL8gqy0/
NaA=
=dasV
-----END PGP SIGNATURE-----

--sdO51lUl8HAYV5M4qG0S8bJTLtGR7P5hS--
