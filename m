Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F532B605
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 09:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB3589D57;
	Wed,  3 Mar 2021 08:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195C89FCE;
 Wed,  3 Mar 2021 08:47:49 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id 18so27278107lff.6;
 Wed, 03 Mar 2021 00:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eWlJk+OnUnN9JCibD9zStSD7Qx5vgzXkE9PysrxYBtA=;
 b=NyD3e1Ka8yYKlRZUlrZ56n2iLCBnVTU1GTtrUJrKibyUuUZHZMIBDISqzOAz//z0C3
 f0szh3nF3aQMQ3UEGxhpVkrVHmBaGyTgsRUYcC+2H1ns56R8ay9VmlV56aU/dyxc78B8
 CsqDkywylWsCAuJeBJm8vwDUz7RMODF4i2VJpCHeoWu2oNVKsc6Wyk4KJeqrKg1QU6Bg
 3PXXmT16ZCVvOU7pKtdxuotETlgT5eSoslgH7fSqCGkR4hYemlCjZvIzqENeGgj64qFh
 jhAMF7zW0SCNKuSmIzJv0g7UddCgxLnlBkDOX2GpViYF9F3yVf+BXA857xEgGb0gtHfi
 J8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eWlJk+OnUnN9JCibD9zStSD7Qx5vgzXkE9PysrxYBtA=;
 b=PW9hdqZA1Pba5/lfgXG5UaRYXz7jL0jLZcxDwhkUOOsPm5R5HFmqTAPruBhD7phbVX
 /AogpRKQv9LiCL5dQM4loyxlf0rl56SUxKWy11M0xOYGeb8hzBwjTd+lGfDYApmnlPsa
 3m7CxoIuPHs2VbzS4kx/PD2Q+UyYQDew2JpPJLxwKxt9m+TNGW2dVk25vLvMu73z4Rt4
 zf6XZhz6+O9SgkCkbUXMI0hi1s2BPKILPrAYTE3rwTXz8cU5BPWEp5B5iXr0Y7WoWlQj
 k9WyF3hrfBGl2veL/x/NaYuHZtxzk0fzIw6HOAn1HBNKMnTBKtuAmMF2BvsLcmz8pIIm
 pz5Q==
X-Gm-Message-State: AOAM5335KKQ+1TjBgmYyHpjGUgXO1ql1Bt65nq1PIy/slYW8JZ2olyuE
 Hncyq7KuWgrVX/jwaRlGdKE=
X-Google-Smtp-Source: ABdhPJw/Z3UrCmSGqLcwPxBRaweDlfI/gTxHWq8OSU55aO9oYpXnBm7UTbUqOmosk+c6krqAGELWOA==
X-Received: by 2002:a05:6512:906:: with SMTP id
 e6mr14889181lft.224.1614761267909; 
 Wed, 03 Mar 2021 00:47:47 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e2sm1412822ljp.135.2021.03.03.00.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 00:47:47 -0800 (PST)
Date: Wed, 3 Mar 2021 10:47:44 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20210303104744.2c064f09@eldfell>
In-Reply-To: <20210302204132.12058-1-manasi.d.navare@intel.com>
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1249872110=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1249872110==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pJX5GT0nhakO8wdfDGFJhv9"; protocol="application/pgp-signature"

--Sig_/pJX5GT0nhakO8wdfDGFJhv9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue,  2 Mar 2021 12:41:32 -0800
Manasi Navare <manasi.d.navare@intel.com> wrote:

> In case of a modeset where a mode gets split across mutiple CRTCs
> in the driver specific implementation (bigjoiner in i915) we wrongly count
> the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRT=
C as
> an affected CRTC in atomic_check_only().
> This triggers a warning since affected CRTCs doent match requested CRTC.
>=20
> To fix this in such bigjoiner configurations, we should only
> increment affected crtcs if that CRTC is enabled in UAPI not
> if it is just used internally in the driver to split the mode.

Hi,

I think that makes sense to me. Stealing CRTCs that are not currently
used by the userspace (display server) should be ok, as long as that
is completely invisible to userspace: meaning that it does not cause
userspace to unexpectedly e.g. receive or miss per-crtc atomic
completion events.

Can that also be asserted somehow, or does this already do that?


Thanks,
pq

> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 5b4547e0f775..d7acd6bbd97e 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1358,8 +1358,10 @@ int drm_atomic_check_only(struct drm_atomic_state =
*state)
>  		}
>  	}
> =20
> -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> -		affected_crtc |=3D drm_crtc_mask(crtc);
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->enable)
> +			affected_crtc |=3D drm_crtc_mask(crtc);
> +	}
> =20
>  	/*
>  	 * For commits that allow modesets drivers can add other CRTCs to the


--Sig_/pJX5GT0nhakO8wdfDGFJhv9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmA/TTAACgkQI1/ltBGq
qqcCPQ//eset8Sbn++qBnY+OjT7WTXWID+kEiYS8AI+HW10HW7/yngtzwQJHpapx
1kalvplv4q0Q3yNFmhlI29NLrr64OqNYnTlaQ0aD4UXvYColjmKm/wzxWWjhKFPM
1vKxR3EXw/sW51ok5m+ydKa8dw0UF0FHegPAwrtbA33H9I5K/sKW8PT5Mwt/g7qc
atEayfJ+ixLur/rHmr4CA8gK2G2vc3EwvXdd5e/s3p5FM+Pjjv6ZYYVhBEZ0MGnv
FjuAToHGy3TlAZLikhERtaKwZmMhW5n6JPXe9hFghWeXgwENpvjcadMvTySfhrpb
hqrpFj8LAFiTi31HyI2CYW9ILuhT9TYOLvQ2EfFVLRnZoQzCPlNPhrf0yXaD6+8a
eqFeGAX1vwyZfyNyfQfZdE77BDJNqJavR4uQsRqWyiAL6vx1lGpbsOJe+vUHRTpf
SkJpaTfIrJalW9VheuRSImYZl/HfIlDoVsYABVYxoP6RDnk/VUadi/dY1CyuHgw+
6AgJugG1BhopkdaTF60e84x5woS0JRXhbX75dJa8I4sZiSStRKxC/nWd5NZiugdI
d+6swIT2YnJv0EYXJ66SmCKAEvppYIyjMobg3s2zMrhz9n6hvH3EDbkVcyZlLavG
qlGQjnaJZ3RPpHpXFGKVHA5XEPaI9F1qnRf/IadBBYQyZ95XZrM=
=oLmk
-----END PGP SIGNATURE-----

--Sig_/pJX5GT0nhakO8wdfDGFJhv9--

--===============1249872110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1249872110==--
