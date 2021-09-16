Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC140DD40
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 16:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329366EE18;
	Thu, 16 Sep 2021 14:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1CA6EE17
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 14:51:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g16so9963165wrb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KeUrkXA0A4CcChYAHFziiO0SmiZRckl+S1wuDhrNlWQ=;
 b=XZPCFEiJSsD2EfLXo+2ejigCRj88g+HsC/dfXLW16HxuyEPMrloSaxc/DgwL24tfTp
 CQrg5H+LRRLIUFVzxxpMrd9A2LWLPx+O6zpdaclM/nFsxhGiOQb8C+bHgFX1CAo7cO8u
 qbvgMUmKX5yYHYXO60dtWx7rHAdHE7oOzDDJFxcAu2y7NbA40WJ3e0UyvszYRYxFq7vx
 WhV7aNg3I6udjGAK9rhWnRum/Y6uy17pMGJ6P4XvhhVpbNujqtKenhIPVEehM+k2gMBh
 yyPG8X98/TlSUrOh3kFeM38Od9eUAGfkzNyjjMZHbAQXoI3vwUZax6dnS+giPGgavKCY
 L1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KeUrkXA0A4CcChYAHFziiO0SmiZRckl+S1wuDhrNlWQ=;
 b=8I58gxPqCOz5bTF9Z42tAswTEiPJPhYdP+WwcFXAiC3v2eaNL28nK9vz5pMw0UcXvA
 e78y8qaVVDWpe3sTQ4rA65hI3T1tAqol9XO5FyRM/bWDFu8NZnVIQsdWkAC6YyzchdTd
 M7XGAoAyhK7lKQDr+gVwIa43VPR5g/kgREkjMMKDQJQds0JAql/bdFavO33ePNO1TF3S
 BOb3ZH0P94YnI0sh6dqfa3dkMZ0nGkiYYVOy1mtKD0BrZHQ6VmjXCkqwkx+2m0KSH5Hn
 F8EqPPhXXb6BgZcF2Oa/UIw2xl5cij3Ohtz7F4bH/9s9IjBmGDEN33L0aS8mzZibCFN8
 0l8A==
X-Gm-Message-State: AOAM5329579JKjNPb69BgQCs8YGqwYJ9BiRTfUQguga7EhcpZQigFdM8
 b1yfIvx1B/vwMggemTfw7T8=
X-Google-Smtp-Source: ABdhPJxaB+D2s+s/Slot9cFr18Vwo+Ar93q7MwYl23iy5dUuQ877sYvbSf6YQL2MQeyKspzPdEH5Tw==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr6824995wrd.87.1631803918252; 
 Thu, 16 Sep 2021 07:51:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id m29sm3922741wrb.89.2021.09.16.07.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 07:51:56 -0700 (PDT)
Date: Thu, 16 Sep 2021 16:51:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/tegra: Implement buffer object cache
Message-ID: <YUNaCyVISEKYfiKL@orome.fritz.box>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
 <20210916094404.888267-3-thierry.reding@gmail.com>
 <741e628f-8ae2-6c73-2ca4-185659b18ccf@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vMrpbtKEQBdKLUbF"
Content-Disposition: inline
In-Reply-To: <741e628f-8ae2-6c73-2ca4-185659b18ccf@kapsi.fi>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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


--vMrpbtKEQBdKLUbF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 01:39:49PM +0300, Mikko Perttunen wrote:
> On 9/16/21 12:44 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > ...
> > diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
> > index 794c400c38b1..66fe8717e747 100644
> > --- a/drivers/gpu/drm/tegra/uapi.c
> > +++ b/drivers/gpu/drm/tegra/uapi.c
> > @@ -201,7 +201,8 @@ int tegra_drm_ioctl_channel_map(struct drm_device *=
drm, void *data, struct drm_f
> >   		goto put_gem;
> >   	}
> > -	mapping->map =3D host1x_bo_pin(context->client->base.dev, mapping->bo=
, direction);
> > +	mapping->map =3D host1x_bo_pin(context->client->base.dev, mapping->bo=
, direction,
> > +				     &context->client->base.cache);
>=20
> Do we need caching here? The map/unmap operation is explicit and should n=
ot
> be on the hot path, and this will complicate context isolation support wh=
ere
> we cannot have an engine-specific cache.

Yeah, we can probably leave it out here. I more or less blindly added
caches for everything, but really they're the most useful for cursors
and large framebuffers that will otherwise get mapped/unmapped once
every frame.

Thierry

--vMrpbtKEQBdKLUbF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFDWgkACgkQ3SOs138+
s6Gr7g//fS3DAJw52CKhnLU6mUzm1U2SB84t9llhN1Zer98vmZ1paKAEtOYm4Jqj
p4zTQagOzkIf3SWCDvlAtJk/jVRVfHF4/VGFhgzhYv+yq9Jta0z5p0WzPmaBxoQl
i7uMe3yiz3uBHvCkOkzIjRL0mlMLUQ6TBroXY4PnyqjmAnLLaY4W6qCUwIH6e64m
KjkL5peok8z2T6k8B3zm3WPqExo4niEgcu2eXOfJxzol4n8xXuGd4ZzVRyU19vYD
QqKCQATdcl8zvL8ucYcHSXqYZ65ev6saZZnP/Gz2y25VS79295umzdebeKvSvgWL
z79K28Xo45BEUdn4k9hxxpikjLfX4TlKVrKLzFAGTD7WHh0N2ZpxG4Y6P+bgkkK2
MogEqUEOMt18F52pFLA2EaNC3x+cm2BKMPXxPi5S1EFji9h37q4wmtPI7Ca9qT89
+TA6vHonnf67F/vzqTgZo0OADA5qcyUtANfLGSSO3V6LSuE8Gk7eJoNCB4D9QyEd
NjownDWzgEIJr8i7S4V/gH/u3lkKCiTaZ8pt7RhrVmtAn+z+xsS8ZuWx1jl58ZUo
L5BlWDiUojC6nPYLnUKcR9SQzWGr9lrzocu8Lpdl07e9KWlibb0B+ZQY5n/KzDeQ
RCqTvIctGlLnau9F+/+219eTEgHyYRGKXPuRI0AyRUXU8ZiTy/I=
=fpes
-----END PGP SIGNATURE-----

--vMrpbtKEQBdKLUbF--
