Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3283D70DC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 10:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DBE6E82C;
	Tue, 27 Jul 2021 08:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E292D6E82C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 08:09:18 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u3so20216435lff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eRvjbwKu3Wu40fOdtlzUwXEHFJpXrpgPfw7clKvSHJ4=;
 b=u540Ta0cSvUjIvlZ+sNWBvWksMuwvc3/D1IgqAfQJgc6tKaiDn2d24EfGWgKkEoM2Q
 xwHobAthBijfE80r2O7VR+lpaaxSadfHG9mOXW8KleT2Qo/gJ7js4z0X7nIMaz1bVPKq
 ELTqVeLJrJhmkiTgZ0+LavuekcdvHQMzYmJeOx6HuHGLj8FvAuj3QxldmMVop3upac3B
 uf3lY1DG8mjXpRnpq8bzc9f+X+8hQTwUaaqnMfg8eQOU0VUeNyYRWrq620NJIol5w6NE
 tpYZUq2kurfmLXyQ8aLGstJKWDqpNKlTk1b3gA3G7oW57HtOrHAKS+cLbIY6q64ig0HR
 ygwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eRvjbwKu3Wu40fOdtlzUwXEHFJpXrpgPfw7clKvSHJ4=;
 b=UlFL1GhnOI248Lw3kjgMcnhrIWBN3yFXuNYNu3wCaIDjGXoUs2YEf7+Rk5/POUZvBp
 wJQORu3tjFKH8kezshelxlJPYXjhMpyaWwFPz9J25ucWDthK7pvPOAGTp2hFrYpKBqrW
 VveIu11OpGATvtKT11JKVMxaL+zVZR/tuQ8QHiblbPzaqaMIG6+A1QvtY/nS6XA+bCuT
 tfAKvPMUMGmpRD3kS2M4vgK8NFaiBRosdqeJZ96XfdsupUIMEQxVgg42PzVFQBSEh9kn
 NMZ79XR5lXYYNSamFU6A1zdwmZPiXfiVIP24Qa+zNWFB5YR/GWfDZPcqUNk5dhJ24vwY
 jkGA==
X-Gm-Message-State: AOAM533oGJIxlVhe3Jfp2ATg2YMq4SpxpbPV3f0aJ9+biIi+PShO+hAB
 S+vTIF3djlg1w4HTz7fXz58=
X-Google-Smtp-Source: ABdhPJw+C8McBPhXKg791uNtirv8lvHGqO6x81cN2NlSKWs5cOFfMPUTnN/RjhEIYeiM5y0y7Ld82w==
X-Received: by 2002:a05:6512:3f13:: with SMTP id
 y19mr15605873lfa.444.1627373357187; 
 Tue, 27 Jul 2021 01:09:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p7sm221614lfk.51.2021.07.27.01.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 01:09:16 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:09:13 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_RMFB
Message-ID: <20210727110913.29159b48@eldfell>
In-Reply-To: <ephVkof3uGu2RpOdBbrHE3qF98zBfIBRzXe4Vyoboh0@cp4-web-034.plabs.ch>
References: <ephVkof3uGu2RpOdBbrHE3qF98zBfIBRzXe4Vyoboh0@cp4-web-034.plabs.ch>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_ufh/cABkTWYGpXLwu7BTmc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_ufh/cABkTWYGpXLwu7BTmc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jul 2021 07:50:32 +0000
Simon Ser <contact@emersion.fr> wrote:

> Since there's no struct to attach the docs to, document the IOCTL
> definition.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index e1f49dd241f7..283d61d5a243 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1050,6 +1050,16 @@ extern "C" {
>  #define DRM_IOCTL_MODE_GETPROPBLOB	DRM_IOWR(0xAC, struct drm_mode_get_bl=
ob)
>  #define DRM_IOCTL_MODE_GETFB		DRM_IOWR(0xAD, struct drm_mode_fb_cmd)
>  #define DRM_IOCTL_MODE_ADDFB		DRM_IOWR(0xAE, struct drm_mode_fb_cmd)
> +/**
> + * DRM_IOCTL_MODE_RMFB - Remove a framebuffer.
> + *
> + * This removes a framebuffer previously added via ADDFB/ADDFB2. The IOC=
TL
> + * argument is a framebuffer object ID.
> + *
> + * Warning: removing a framebuffer currently in-use on an enabled plane =
will
> + * disable that plane. If the plane is primary, the CRTC may also be dis=
abled
> + * (depending on driver capabilities).

Hi,

I recall some discussions around having a CRTC running with only a
non-primary plane active. Maybe we should just drop the "If the plane
is primary," part to leave it more open.

I believe no-one should take advantage of RmFB turning a CRTC off. It's
just something that can happen, so userspace needs to be aware to avoid
it.

With or without that change:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> + */
>  #define DRM_IOCTL_MODE_RMFB		DRM_IOWR(0xAF, unsigned int)
>  #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_pag=
e_flip)
>  #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_=
cmd)


--Sig_/_ufh/cABkTWYGpXLwu7BTmc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmD/vykACgkQI1/ltBGq
qqc5Ag//TSXLaSNwMmDtE3ZA51kOf0XqUDkq2CC8pS7Y8uH7OfU+UlV1oIrhLaHM
1xBFvTh26alE6pZvvyfkOL2zJtsLcxoT4ogoOVN5ZbmgCpSM5rN/FIb4GWkbe/u6
/05QDank9W5WIWpcltjaqdZ9bUJ27CLuBR/gKSJCgQBVKKmcrKQhwyNgG/3RGObl
U4xqtDgXxXWR8QzHs5TrrkVX18nikQ+9D8kJQagfE318SDAmUjNb2C5MMX+D9DFO
jHQSC1V1JRib7vCFHNNKp4SkvZNDEuMgdyLk2bYJ15nzKGEq+zlnOD8oQnVdG70C
i9i908g40jI0rUI6fech9qEwb5S3rkroKHKEasfLBg2jr7FWr+e69/p/Op1ZUb8c
JvuI1rrSb7dMKzrlirFfv+O+1w9Ik5SvSPhs+C9Or+yU/eK8ZLZ3oG+fxqjoRNCM
PTfdrQ86nWah+p2Wlp069OGJ5k+WznjFrkGt7EH+xFzXZzMFpQQJaIwXnLBJLjpt
u/8/b+HMBenernfCz5aJ1DmaEuw7pCu8cDhQSLod52ZP+gDFabH6F+L+PpGiWqAq
EYUCAbFDebmyTazrWx3A1u1TN2HeLkbOMSGsXu1b3+mTYQkWrX66FeHqObD2RiK5
ORIrYt8nMN6uE2KouxrZ6ncNmsSvwnG5xj9rfsg6/qJiwu4WiLY=
=KPAJ
-----END PGP SIGNATURE-----

--Sig_/_ufh/cABkTWYGpXLwu7BTmc--
