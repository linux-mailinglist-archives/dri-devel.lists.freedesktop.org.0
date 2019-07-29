Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E078DA8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81389B3B;
	Mon, 29 Jul 2019 14:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285D289B11;
 Mon, 29 Jul 2019 14:20:45 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h28so42147522lfj.5;
 Mon, 29 Jul 2019 07:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=43UGeEwAQkjlHDnqicJjZYi7omjHdHxow+JLSHMazAo=;
 b=qPyKnkm1+sHuAQVPdrMPDpdcZ4LwjCMURgeXYi1Vrfp3MLY+sRaoc2dFz6Tox7bqg/
 7s/y58Zfd3jpHvfXyu/cBWhr5V8vD5mwrhu6fyAMBnE9AQZlWuwi/A1c6C5BybfuAPn7
 Gvt2f/HzYwlnsYHjaJ7KS3488jcDPrQzLsybrfndcid7P9w389iKj7elhvJA+oqPkNt6
 sk3HeYlQhGyI1tCOzUVr74JXMcKmIVBAiaW5r6FchzT+jWrmvO5G+5HioTigFuyc0PsD
 sKD50V7RRspWi1Qn5MWHok5ir5bLJVCsZTrNQ1xmbEf2JqfAlTWhpQ3hlkJcI93z1XPa
 QHDA==
X-Gm-Message-State: APjAAAXoLmw1ypZV5yIfPeAU2PZ3nXrcpo2VoovTTNAVKO0P8dKN0xu2
 LwMYffDTEoPY1IxabQBI/ok=
X-Google-Smtp-Source: APXvYqynET/j6yhi8X7zI1dtHBq6j04AuC8cZus1oGE4JVGVHyVGvr+ZYd3kLAVtk0c9gW/mNjfslA==
X-Received: by 2002:a19:7607:: with SMTP id c7mr53774385lff.28.1564410043428; 
 Mon, 29 Jul 2019 07:20:43 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p15sm13039939lji.80.2019.07.29.07.20.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:20:43 -0700 (PDT)
Date: Mon, 29 Jul 2019 17:20:40 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v11 1/6] drm: Add Content protection type property
Message-ID: <20190729172040.48257318@eldfell.localdomain>
In-Reply-To: <20190714110008.19647-1-ramalingam.c@intel.com>
References: <20190712070026.13088-2-ramalingam.c@intel.com>
 <20190714110008.19647-1-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=43UGeEwAQkjlHDnqicJjZYi7omjHdHxow+JLSHMazAo=;
 b=UztM92RZAid6DlYuZ0Z+R2hS/xNvGCKuTp2B6FGptUoMlIAJu8IUP2yPSM/YTObZE1
 0ooAqjpAAdN8CXe9IeYmW2IBrzpZ4sPme5TE++t0RtZ/vutooKYUkKeYRtFXx8a0AV+1
 5dzx+Dk7SqR7rcQKLiNRDo7BEC5gJf37Kbbf/lphd2816rl/UqjsQm6GbW3oqAcKbXB3
 BcUn4oOcV7wh7hiBTOQ1AnTVWX30B0UcYJIIN5WsPb6k+hjGEG1ZTPhJ7Xcv9earNhQu
 11QR/fMfExUDTpLQa5pJJ2ywZ+SLX7aVIseE2d0RkiDyHcsFMnpDVHwRGbiiajCKVtuk
 9eBg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2039456484=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2039456484==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NynhjkGkYDa3r.f5jBc2xvm"; protocol="application/pgp-signature"

--Sig_/NynhjkGkYDa3r.f5jBc2xvm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 14 Jul 2019 16:30:08 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> This patch adds a DRM ENUM property to the selected connectors.
> This property is used for mentioning the protected content's type
> from userspace to kernel HDCP authentication.
>=20
> Type of the stream is decided by the protected content providers.
> Type 0 content can be rendered on any HDCP protected display wires.
> But Type 1 content can be rendered only on HDCP2.2 protected paths.
>=20
> So when a userspace sets this property to Type 1 and starts the HDCP
> enable, kernel will honour it only if HDCP2.2 authentication is through
> for type 1. Else HDCP enable will be failed.
>=20
> Need ACK for this new conenctor property from userspace consumer.
>=20
> v2:
>   cp_content_type is replaced with content_protection_type [daniel]
>   check at atomic_set_property is removed [Maarten]
> v3:
>   %s/content_protection_type/hdcp_content_type [Pekka]
> v4:
>   property is created for the first requested connector and then reused.
> 	[Danvet]
> v5:
>   kernel doc nits addressed [Daniel]
>   Rebased as part of patch reordering.
> v6:
>   Kernel docs are modified [pekka]
> v7:
>   More details in Kernel docs. [pekka]
> v8:
>   Few more clarification into kernel doc of content type [pekka]
> v9:
>   Small fixes in coding style.
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_connector.c           | 51 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_hdcp.c                | 36 +++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 +-
>  include/drm/drm_connector.h               |  7 ++++
>  include/drm/drm_hdcp.h                    |  2 +-
>  include/drm/drm_mode_config.h             |  6 +++
>  include/uapi/drm/drm_mode.h               |  4 ++
>  8 files changed, 111 insertions(+), 3 deletions(-)


Snip - sorry, gmail simply refuses to deliver my mail without trimming
it hard.

> =20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ab331e5dc23..5c954394093f 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -218,6 +218,10 @@ extern "C" {
>  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
>  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
> =20
> +/* Content Type classification for HDCP2.2 vs others */
> +#define DRM_MODE_HDCP_CONTENT_TYPE0		0
> +#define DRM_MODE_HDCP_CONTENT_TYPE1		1

Hi,

I still believe that these definitions do not belong in the uapi
header. Userspace must use the string names instead.

Otherwise the patch looks fine, though my Weston review is still
on-going.


Thanks,
pq

> +
>  struct drm_mode_modeinfo {
>  	__u32 clock;
>  	__u16 hdisplay;


--Sig_/NynhjkGkYDa3r.f5jBc2xvm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0/ALgACgkQI1/ltBGq
qqcwPhAAo1S/7nLjCwA1EOrpbRkGmSdbKL7skcDvCl4GkPZvZiqa16+2khrqK3rk
i46hXEEHjLlWJ/PZdsu7mNafZgu3ADQfxb2ppNq/m27HXlO8dWswye71xOAeH7If
7uThdHLC5UV9vPY22Bx2LJi/QzFFgdULP1+eQOZS2Uv1UtJVx3JMTVLYl+QU+ZDc
nTkibE2cH2OTm0K3J3uiS9rGDg17LrfeZZZbi4HBd5UTf+2tf/FDKVwbVBx5aESt
sZJpqcxuPTtnSqAtU73qDKEnpKK8RwW4VghaBS38jT1t2jYNQ2dHo1wCcBpj2XSR
rSCqKJl+xwuQy+TRZ6Y7MRg6YoqqHVaAYBNuvTfaMpHW0poiLCb9nvOgAzk7u/lq
lddUNOpznO3XbK4frXdaY7NulJVkTvHiFJ/4dnXxU32473pBILx7hNwQyGcZp1EH
pQ4z4xo5eymh5iYp8wdkHAAADSegR7bT3qz1G4NKakEzn9s0C+A9GDRajLq3/rea
/9U7dkyImFBRiELvR4/AM//rReFUZcTV7HJu1OVjdkg5HvFoQz2InBtKmbf4Lhhr
n202yWfQYK7FF9kRFhj0W5+YRmE0/2zkBePMvXRNUfJpGZ2zTXaar79II12wAoag
QlgNhJFH4wabtnvZ+mSV+GRhK8uRbIOXc5Fcleow+0XwxNOpWcU=
=P0q8
-----END PGP SIGNATURE-----

--Sig_/NynhjkGkYDa3r.f5jBc2xvm--

--===============2039456484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2039456484==--
