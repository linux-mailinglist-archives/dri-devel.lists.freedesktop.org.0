Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEF35DE1F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 13:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F57B89D7B;
	Tue, 13 Apr 2021 11:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C1689D7B;
 Tue, 13 Apr 2021 11:56:22 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id p23so15352552ljn.0;
 Tue, 13 Apr 2021 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lmMHhXwp4JmFcVhYlaA4WGTJhPxaIkhUZQDPimSZgGI=;
 b=Yq/VZe/AXNgvcMa/jw/kOk/wv6H8MKkTjzQFS2oP8lYWXlSJh3p+I+CKMdXuXCjep3
 rqRFFp4HryEXN9iqRbkatpwAwCbTiEQOK/yOXdMPETAOvALTsbDeSXFKRXBGIp/54TV/
 Wc75NUJkDbiv64qzMVcCfxnhcrIsM056WLgZKfiv9cYaqmdwcgr/lMNtow7/CZh1gK2e
 Yhoo0ck96s3nzzOmXTxDAZ/yyWUtYJI8eCVCT5VOS1oAxy49ooih0AjxpodTcs9Xz7r8
 RV8qut6BFLbivyFun4S9E1d0G0uLwc7wIurfqEwbW4Pt6lMO1IXXxcEPDRpbLdCZvpD2
 hQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lmMHhXwp4JmFcVhYlaA4WGTJhPxaIkhUZQDPimSZgGI=;
 b=XE95AnU2s4SHfx8xh/PhHEq/BvwSi8l1n5T7dGMkM7E9JOjmX7CMKRGxRUJf/tI1qZ
 u1LdZCrMcfPjMgExOy1ygK4f/38kMmfaC/gacRJ6hAn0QWHOXDBtMlCrVjW3QldVbB1F
 oVUYZL7OU1zwtXKVSJxmWGnc7pT77VlAfcUz9YiPNQ3e8v6wqQNSQ/wKYQ9IXwx36o5K
 XZBFvjWstKNccOkeTbhFQ+AvnX+VlEjz/xk933tPgiRzQnhRkkGT9Eo3zafXF1d3tOQt
 2xCd/T6iyc8WgbnW7Oxt3PHEX+FAQkny/A4Y0jjox1BNfowR/yXAgMdBk+xWJpzERiYr
 UqJA==
X-Gm-Message-State: AOAM5325msUGyt41j9fIYOzmCQTVODuC+j7+RAxYHN2uEYzVF+x0pvrM
 bYaW6sCQZldamM/3hTDj+Ik=
X-Google-Smtp-Source: ABdhPJxPu2MXpF9eHZjFuq7K6Cj3/HItwd1C2qw7/QgSLLSAVr1VH87auWcgtDrbCBcs1MImDHhq5w==
X-Received: by 2002:a2e:8616:: with SMTP id a22mr20975915lji.509.1618314980961; 
 Tue, 13 Apr 2021 04:56:20 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p12sm1830898lfu.85.2021.04.13.04.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:56:20 -0700 (PDT)
Date: Tue, 13 Apr 2021 14:56:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 12/12] drm/modifiers: Enforce consistency between the
 cap an IN_FORMATS
Message-ID: <20210413145602.70f674b1@eldfell>
In-Reply-To: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0457246137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0457246137==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Jeo3XQlThZDgIRmrUjCVX6m"; protocol="application/pgp-signature"

--Sig_/Jeo3XQlThZDgIRmrUjCVX6m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Apr 2021 11:49:03 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> It's very confusing for userspace to have to deal with inconsistencies
> here, and some drivers screwed this up a bit. Most just ommitted the
> format list when they meant to say that only linear modifier is
> allowed, but some also meant that only implied modifiers are
> acceptable (because actually none of the planes registered supported
> modifiers).
>=20
> Now that this is all done consistently across all drivers, document
> the rules and enforce it in the drm core.
>=20
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_plane.c   | 16 +++++++++++++++-
>  include/drm/drm_mode_config.h |  2 ++
>  2 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 0dd43882fe7c..16a7e3e57f7f 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -128,6 +128,11 @@
>   *     pairs supported by this plane. The blob is a struct
>   *     drm_format_modifier_blob. Without this property the plane doesn't
>   *     support buffers with modifiers. Userspace cannot change this prop=
erty.
> + *
> + *     Note that userspace can check the DRM_CAP_ADDFB2_MODIFIERS driver
> + *     capability for general modifier support. If this flag is set then=
 every
> + *     plane will have the IN_FORMATS property, even when it only suppor=
ts
> + *     DRM_FORMAT_MOD_LINEAR.

Ooh, that's even better. But isn't that changing the meaning of the
cap? Isn't the cap older than IN_FORMATS?

What about the opposite? Is it allowed to have even a single IN_FORMATS
if you don't have the cap?

>   */
> =20
>  static unsigned int drm_num_planes(struct drm_device *dev)
> @@ -277,8 +282,14 @@ static int __drm_universal_plane_init(struct drm_dev=
ice *dev,
>  			format_modifier_count++;
>  	}
> =20
> -	if (format_modifier_count)
> +	/* autoset the cap and check for consistency across all planes */
> +	if (format_modifier_count) {
> +		WARN_ON(!config->allow_fb_modifiers &&
> +			!list_empty(&config->plane_list));

What does this mean?

>  		config->allow_fb_modifiers =3D true;
> +	} else {
> +		WARN_ON(config->allow_fb_modifiers);
> +	}
> =20
>  	plane->modifier_count =3D format_modifier_count;
>  	plane->modifiers =3D kmalloc_array(format_modifier_count,
> @@ -360,6 +371,9 @@ static int __drm_universal_plane_init(struct drm_devi=
ce *dev,
>   * drm_universal_plane_init() to let the DRM managed resource infrastruc=
ture
>   * take care of cleanup and deallocation.
>   *
> + * Drivers supporting modifiers must set @format_modifiers on all their =
planes,
> + * even those that only support DRM_FORMAT_MOD_LINEAR.

Good.

> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab424ddd7665..1ddf7783fdf7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -909,6 +909,8 @@ struct drm_mode_config {
>  	 * @allow_fb_modifiers:
>  	 *
>  	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> +	 * Note that drivers should not set this directly, it is automatically
> +	 * set in drm_universal_plane_init().
>  	 *
>  	 * IMPORTANT:
>  	 *

Thanks,
pq

--Sig_/Jeo3XQlThZDgIRmrUjCVX6m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmB1htIACgkQI1/ltBGq
qqeHOQ/8Chckz7qKtENYTlTJ3xXUFDUT4E2yCfUfyLUoHHM/FalRemG14IIBcv4A
uVt1c2wVc97uBR/YvTWK+zyIjmtJwH0G1ltn37b9c5veRv/dfFQdCzjZElkue1hk
blGJ0TIvA7FaOlDeNTLv1VPnIUBzOPqXs9tQ66MTx2nMq+ZA2uWFzu/STRUcKTAm
jj8+rfPMPrpyohYv3gk2u2RLt+vNN9v91zAA4bsxPDSD4DWUxSILZttDI/kklVAz
v3P9q3QbCvTYKp1D+c/EWm3WcoPjXo9tAgdoHdMZZUwxMnI0hB4gHEEiA6rdzmB1
1JtoWIIo8tNJnLwNv4X9CAisM4hPg4TcOPmjJUuHnHTEN3A63UDX8QQTURvTeN4d
eEY6yx+l8S+hkc64KXWv/VpEkRqCzhaaS+UufMtN2Or3MomqAamUGTbvlQs2QF+y
PGZ6lEk+mH3aUB9W6mgqj0nbQYsuGUM1cLFKVW/rEjxPMs4vTiQS1jEgvW7P3RM9
JBIc0/9c73KJ/dgLtsH+S/Pb6oujalg7pAlgctO2yXr1XiFeiWliDyQ356echlcq
Zla1Plx3txVXobqu13ubQ6bOuTfEXrVHbWddi8y2K76P7IA3Qc8XAYgnxJEEYNdg
cWlvuQ0dvp6Uf5oFMXR2z8GGcvUtN1bOceSrrmZQu1W7WYOtlNU=
=Nncx
-----END PGP SIGNATURE-----

--Sig_/Jeo3XQlThZDgIRmrUjCVX6m--

--===============0457246137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0457246137==--
