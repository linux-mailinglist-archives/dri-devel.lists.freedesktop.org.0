Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC908389FA8
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 10:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ACA6F385;
	Thu, 20 May 2021 08:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2196F385
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 08:17:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e11so18623555ljn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 01:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=aDttU0eLDxZ8kWRs72XJpnaBXEIu9kNUDCt2DFDP9i0=;
 b=It/cp699l2T6VtRF2qHPBZDF66HD0EzAuQXV56VktWi8VIRGjCchuWFRN+FS3X0TpG
 z7gIson9jBuRLI5FlKSJ/1WRRhFQBBSZ2assf5MRRijjnKTGCrkAECYm4nQQgyP71upq
 B/K0ca4Quom/BohaRpOs76BfzoMH2NoTVHeAF+3WtM8hzLwLSW347wHVf4wGaeSNzv8C
 4joANAfLk1zxwK5NUqrUUjALJR3yjlLGCHtNNYgmuxw4FfBVIKuzcIpeK6OXQH+E0DJZ
 CL7yrvOGgK2FgF9TePF3xrVskxWg8QYcY5RZw6kC/C/kGPTv/1Rocnp4BE4skLmZsw5F
 4Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=aDttU0eLDxZ8kWRs72XJpnaBXEIu9kNUDCt2DFDP9i0=;
 b=NTtA5ImOvj3XNLlaiAu6TbMbtaEbyRZaOX0u0o+wci6ftsNPVxUf0bbA0UrS6fT0mr
 ml/DqrON+VM3FC0g0PJNXq8GKEryGrMUXoucqNf9cK3CnR3ek44o7+U/gG5jr3+eo7yO
 77zHXmRVPp5lOWMWjRJBeX+IcpAffQp94HO3q25x8lHV6Y3mEdchktmEmDKnjU74FBaU
 MhaQQg0U9QNgQC63JqFHF9acBTSadLQ/EAfDWJer+N8ihIyIj1ZUUoMd7sVJLZDPtxQ0
 xvzCdEyEpNh2C7x29paElC24bRADVnalef1NMzHt1R4m9/0chtgpXARnG6Y0AM0kCjy1
 Wq+g==
X-Gm-Message-State: AOAM530F1u9ZrhwyODJd75ZIET8wjNkOfp11sSr3RKj5IOR5CzMxpn0V
 Dg8Dsj1lq0rEf4nSUfHrxrc=
X-Google-Smtp-Source: ABdhPJzCXcpUvxSO6LtyhsaukFeCEV+aJSfu7MbqjnxfYDzkAxXxkViTjNvvZwTuEZ6oiZgJdUB8gw==
X-Received: by 2002:a2e:8715:: with SMTP id m21mr2211425lji.319.1621498657140; 
 Thu, 20 May 2021 01:17:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r14sm224499lfn.217.2021.05.20.01.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:17:36 -0700 (PDT)
Date: Thu, 20 May 2021 11:17:33 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm: document minimum kernel version for
 DRM_CLIENT_CAP_*
Message-ID: <20210520111733.7f44a492@eldfell>
In-Reply-To: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
References: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oypl0QBiRU9==sLJTT2wPYc"; protocol="application/pgp-signature"
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
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/oypl0QBiRU9==sLJTT2wPYc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021 11:14:52 +0000
Simon Ser <contact@emersion.fr> wrote:

> The kernel versions including the following commits are referenced:
>=20
> DRM_CLIENT_CAP_STEREO_3D
> 61d8e3282541 ("drm: Add a STEREO_3D capability to the SET_CLIENT_CAP ioct=
l")
>=20
> DRM_CLIENT_CAP_UNIVERSAL_PLANES
> 681e7ec73044 ("drm: Allow userspace to ask for universal plane list (v2)")
> c7dbc6c9ae5c ("drm: Remove command line guard for universal planes")
>=20
> DRM_CLIENT_CAP_ATOMIC
> 88a48e297b3a ("drm: add atomic properties")
> 8b72ce158cf0 ("drm: Always enable atomic API")
>=20
> DRM_CLIENT_CAP_ASPECT_RATIO
> 7595bda2fb43 ("drm: Add DRM client cap for aspect-ratio")
>=20
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> d67b6a206507 ("drm: writeback: Add client capability for exposing writeba=
ck connectors")
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 87878aea4526..ec2b122cdcc5 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -780,6 +780,8 @@ struct drm_get_cap {
>   * If set to 1, the DRM core will expose the stereo 3D capabilities of t=
he
>   * monitor by advertising the supported 3D layouts in the flags of struct
>   * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
> + *
> + * This capability is always supported starting from kernel version 3.13.

Does this mean for all DRM drivers, or is it just that the definition
of the cap is recognised but it still depends per-driver if it actually
supports it?

This is always the hard question for me to figure out, and the more
interesting one.

I think adding "for all drivers" would make things much more clear,
like in the other cases you mention "atomic-capable drivers".

>   */
>  #define DRM_CLIENT_CAP_STEREO_3D	1
> =20
> @@ -788,6 +790,9 @@ struct drm_get_cap {
>   *
>   * If set to 1, the DRM core will expose all planes (overlay, primary, a=
nd
>   * cursor) to userspace.
> + *
> + * This capability has been introduced in kernel version 3.15. Starting =
from
> + * kernel version 3.17, this capability is always supported.
>   */
>  #define DRM_CLIENT_CAP_UNIVERSAL_PLANES  2
> =20
> @@ -797,6 +802,13 @@ struct drm_get_cap {
>   * If set to 1, the DRM core will expose atomic properties to userspace.=
 This
>   * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
>   * &DRM_CLIENT_CAP_ASPECT_RATIO.

Wait, why does atomic turn on aspect ratio? That's surprising,
since I wouldn't think that atomic depends on aspect ratio features.

> + *
> + * If the driver doesn't support atomic mode-setting, enabling this capa=
bility
> + * will fail with -EOPNOTSUPP.
> + *
> + * This capability has been introduced in kernel version 4.0. Starting f=
rom
> + * kernel version 4.2, this capability is always supported for atomic-ca=
pable
> + * drivers.
>   */
>  #define DRM_CLIENT_CAP_ATOMIC	3
> =20
> @@ -805,6 +817,8 @@ struct drm_get_cap {
>   *
>   * If set to 1, the DRM core will provide aspect ratio information in mo=
des.
>   * See ``DRM_MODE_FLAG_PIC_AR_*``.
> + *
> + * This capability is always supported starting from kernel version 4.18.
>   */
>  #define DRM_CLIENT_CAP_ASPECT_RATIO    4
> =20
> @@ -814,6 +828,9 @@ struct drm_get_cap {
>   * If set to 1, the DRM core will expose special connectors to be used f=
or
>   * writing back to memory the scene setup in the commit. The client must=
 enable
>   * &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This capability is always supported for atomic-capable drivers starti=
ng from
> + * kernel version 4.19.
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> =20

These are really nice additions to help people figure out which ones
they would be happy to require unconditionally in userspace.

I just hope this won't encourage anyone to be testing for kernel
version instead of these caps, though.

Anyway,

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/oypl0QBiRU9==sLJTT2wPYc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCmGx0ACgkQI1/ltBGq
qqcFoRAAlgGpSdG9ggowJI0xrDopXPlKHKS6nQEEmf0mw+eJKsTLG7w3EKgy3+WP
kgY2ixpfV/m8RXoRt20mUHQRrv9lbCFLIavBo3+AR8BUAz2aLrUJIdIS/2/bJVWd
eywupVSBQt6Hq1JS7bcWJewwPCY1t2/3+wpRpiqpgWmZzD709rsesXSTpXdiVy0u
0z6Hg5hr24ZlGnHq049G+7pq92lUwZt+YNzFGClFUHkp2RrQ9Yt/2zua8rAXzt0Z
QoXp0U6qB5FvKtJlcbDLBoPCJG5ecdEEv8VVR3480EWy8uKKwiYgehzn7MVFeSju
gfML6wGbiWfplj7AU9ee30OPAjANu4w1zScrSgFwfa7DzDfCfAQQGfBM7JvD8/XK
evnUem5LG70Q87oahdJsvJ24dPVRtqHd3ZUEcd5CJbIjSKviTv7LfbCxSif0wOAm
hU3Wos40EWSho8xxwcsOUzhHAhcb1UJId42eUoNQHz9pJzbKJuosCf1UkvCH/Czh
sIbp1cpFmQBdv7t0aolVUPezDW6OCdP7qJ+ShVNOCn0rv9FVJKxjK6yZL6M98b9e
dkvNe2Y4dKri/GptasfSechbM7HO1qoJFv+cJNSDbZw/LyewbotGdGWBSOs/w54a
Pq7Q/5Q4nu4q8ZN5OiuN0avok/Nz7ujfzWDZSphRYX42DQgxLhw=
=o2cT
-----END PGP SIGNATURE-----

--Sig_/oypl0QBiRU9==sLJTT2wPYc--
