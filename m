Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B951DB383
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCEE6E15A;
	Wed, 20 May 2020 12:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E827D6E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:35:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w7so2917471wre.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=l6WZZPgGrFnIPWbZC3y/7DBKv/kQfsxXxK4CcrbTkTA=;
 b=HR1bIuIbnuqKpgXNtOZhBZtBYTfDCwVrs9KjZF63DLfQRo6L+O8WcBYP7I+QRfpvHU
 EYsIB+RLyfzcocEQX1UATV/MQkTfUlMUzPkqvQj8qzr9/U/tp9muUA3BrRSpA2Pt1LxI
 vy4SbM3ZBAhJsoazjj86A1YGQqSyLTljeAmRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l6WZZPgGrFnIPWbZC3y/7DBKv/kQfsxXxK4CcrbTkTA=;
 b=j3SyAg5xGEqc89FO3HFxeooBy/j8hq2yFc4kJPGxfRr3Um7aY/4icVF3aMHsMePwkk
 ljHGWm8anouZx1iJbxrlicgaGjm8uOzlRRxqHa+8PDF4+nTH58G2b5Fd5iDPvog8LoIn
 UG+dyrfylc3Ckp9NrAIKAJoGHXYDgU0l9nQ1R88XVujpkUJLiMZoWq5IBjXDTVPb3W/Z
 kzEJdoSDuP+fCsTUX0I1Mi+QAfv39RAWggLDkuUmW+lnX+wtkGQl1/Vw8QgsJ9iayBcN
 7+IvTOr1k8gRtDrqmny54Bs5+osyZRuxGyndoCUB/PFdnXqx0oj0P2T0A7WDVgJnqpVl
 jKuQ==
X-Gm-Message-State: AOAM5325tc2N8EDtTR81SNY4wgqQQbS/EBIHc4yQI18jn3mZxe7HyqTH
 MQUPPnUwbd4R8qxoYwNExQFiXQ==
X-Google-Smtp-Source: ABdhPJyV73Jg9MOF2t6+PiQhUVHyBzmzhtcgj1BaKR1ex6bvfNB4nY3OeUoiM6n65zycGMy16NYoUg==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr1867622wrs.323.1589978106533; 
 Wed, 20 May 2020 05:35:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 32sm2783749wrg.19.2020.05.20.05.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:35:05 -0700 (PDT)
Date: Wed, 20 May 2020 14:35:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: DPMS is no longer the only mutable connector prop
Message-ID: <20200520123504.GV206103@phenom.ffwll.local>
References: <vrfq3PQ_YaPv75xE6-4QeyyLkevKNLpQo8JgnX6EnEcYaFRXxSg98QECUOmHe_eMirwPB0qNRXHE_jzEkXDb3J3YS2OuZXAZgJFnNMLm6W4=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vrfq3PQ_YaPv75xE6-4QeyyLkevKNLpQo8JgnX6EnEcYaFRXxSg98QECUOmHe_eMirwPB0qNRXHE_jzEkXDb3J3YS2OuZXAZgJFnNMLm6W4=@emersion.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 02:22:28PM +0000, Simon Ser wrote:
> There are a bunch of other writable connector properties now.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Michel D=E4nzer <michel@daenzer.net>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think in general the list of connector properties has become rather
sprawling and disorganized ...
-Daniel

> ---
>  drivers/gpu/drm/drm_connector.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b1099e1251a2..f2b20fd66319 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -948,8 +948,7 @@ static const struct drm_prop_enum_list dp_colorspaces=
[] =3D {
>   * 	connector is linked to. Drivers should never set this property direc=
tly,
>   * 	it is handled by the DRM core by calling the &drm_connector_funcs.dp=
ms
>   * 	callback. For atomic drivers the remapping to the "ACTIVE" property =
is
> - * 	implemented in the DRM core.  This is the only standard connector
> - * 	property that userspace can change.
> + * 	implemented in the DRM core.
>   *
>   * 	Note that this property cannot be set through the MODE_ATOMIC ioctl,
>   * 	userspace must use "ACTIVE" on the CRTC instead.
> -- =

> 2.26.2
> =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
