Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E416D377CB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 17:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C313891A4;
	Thu,  6 Jun 2019 15:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB36891A4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 15:25:42 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so1671955qkj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 08:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ujllQUBFctGmQpL1wBwKth15x8ZrZ5+Xk7O+WkgFp+Q=;
 b=GRtb3YOXhWXnuraLV0OlJv10lj49ctn2YJ2YCjFPtBBlaia8nreDSeMi3Z51v2UbOt
 y7udMQGvhzxljDP3W2WrlIqxX549xMtIVS1dLZVebJUncM7BK/99gdkgDF3dUhbWnHcV
 c/UtahapU11UQwclgSTEZDkb71x1ep7g9MlVmUFnw/nrk+F5M1JBzRz6P/5g1b45FTOx
 pceWnr/doGm+RylyEgeiN/8Jcj41CeP0Vo7GVnPVsnDd1wIwbwn6qbVKtSwYHfDKzhT+
 UPMO5+Mi5Q5k/CVMy9amkQwt8g5NtFLAOejVvIO30fjMSh3yGrzTDnH2bGhqOMd2Yo5G
 K2MQ==
X-Gm-Message-State: APjAAAVWfZxN/DyyuduWBf59k8BW5NZs3poe6xeywF8ab5nGkMHcM+xn
 r4fqzjF7IEeoMF8vEvgVvO0=
X-Google-Smtp-Source: APXvYqyQxST0W/3RcbWzU/tUMARNBj/p/EtasiOddlmH9pLsXVmrIUykZYMWFMwLITqPlLuC/xQrlA==
X-Received: by 2002:ae9:f10a:: with SMTP id k10mr38662337qkg.66.1559834741385; 
 Thu, 06 Jun 2019 08:25:41 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id e63sm1020073qkd.57.2019.06.06.08.25.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 08:25:40 -0700 (PDT)
Date: Thu, 6 Jun 2019 12:25:36 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: Forward timer right after drm_crtc_handle_vblank
Message-ID: <20190606152536.km7q4zasqe4mt7br@smtp.gmail.com>
References: <20190606084404.12014-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190606084404.12014-1-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ujllQUBFctGmQpL1wBwKth15x8ZrZ5+Xk7O+WkgFp+Q=;
 b=TLQI4hrXPz9WVAJxPBKwRzClt1gEos3Y+Tg/kEPT23qPUN1XaucDdq6LGdML0QQSz2
 NixRsxDMgT3Ju9SXKWUQ9uqYQinska8P9kn4wNaaCSK/TsBwzwxIf5pl2kn0lYx2p05E
 dKmsz1Ro56ZFBk2IkG5V9uG7vAx4G1I4Rd/6uVbXc3jM1DH8jVd/r8Es1mGJAw+dhuQV
 k0rTdvVnuq2aZDuGIPHklK9W7/gI0rKQRiE4QDBcQYc5qpzP7mwzkJCldN2m9CpsbQ1w
 mugQA5xWVuvKXOq4l1cp3QJJA3FPDp2SLyw85B6ION5W0inXtDyV28VRE+W6tch0rbAH
 dmiA==
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1071705407=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1071705407==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snvga7vro42c4ic7"
Content-Disposition: inline


--snvga7vro42c4ic7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for the patch, and for the great explanation embedded to it.

I tested it here, and everything worked like a charm.

Is it ok if I push it to drm-misc?

Tested-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 06/06, Daniel Vetter wrote:
> In
>=20
> commit def35e7c592616bc09be328de8795e5e624a3cf8
> Author: Shayenne Moura <shayenneluzmoura@gmail.com>
> Date:   Wed Jan 30 14:06:36 2019 -0200
>=20
>     drm/vkms: Bugfix extra vblank frame
>=20
> we fixed the vblank counter to give accurate results outside of
> drm_crtc_handle_vblank, which fixed bugs around vblank timestamps
> being off-by-one and causing the vblank counter to jump when it
> shouldn't.
>=20
> The trouble is that this completely broke crc generation. Shayenne and
> Rodrigo tracked this down to the vblank timestamp going backwards in
> time somehow. Which then resulted in an underflow in drm_vblank.c
> code, which resulted in all kinds of things breaking really badly.
>=20
> The reason for this is that once we've called drm_crtc_handle_vblank
> and the hrtimer isn't forwarded yet, we're returning a vblank
> timestamp in the past. This race is really hard to hit since it's
> small, except when you enable crc generation: In that case there's a
> call to drm_crtc_accurate_vblank right in-betwen, so we're guaranteed
> to hit the bug.
>=20
> The fix is to roll the hrtimer forward _before_ we do the vblank
> processing (which has a side-effect of incrementing the vblank
> counter), and we always subtract one frame from the hrtimer - since
> now it's always one frame in the future.
>=20
> To make sure we don't hit this again also add a WARN_ON checking for
> whether our timestamp is somehow moving into the past, which is never
> should.
>=20
> This also aligns more with how real hw works:
> 1. first all registers are updated with the new timestamp/vblank
> counter values.
> 2. then an interrupt is generated
> 3. kernel interrupt handler eventually fires.
>=20
> So doing this aligns vkms closer with what drm_vblank.c expects.
> Document this also in a comment.
>=20
> Cc: Shayenne Moura <shayenneluzmoura@gmail.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 7508815fac11..1bbe099b7db8 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -15,6 +15,10 @@ static enum hrtimer_restart vkms_vblank_simulate(struc=
t hrtimer *timer)
> =20
>  	spin_lock(&output->lock);
> =20
> +	ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> +					  output->period_ns);
> +	WARN_ON(ret_overrun !=3D 1);
> +
>  	ret =3D drm_crtc_handle_vblank(crtc);
>  	if (!ret)
>  		DRM_ERROR("vkms failure on handling vblank");
> @@ -35,10 +39,6 @@ static enum hrtimer_restart vkms_vblank_simulate(struc=
t hrtimer *timer)
>  			DRM_WARN("failed to queue vkms_crc_work_handle");
>  	}
> =20
> -	ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> -					  output->period_ns);
> -	WARN_ON(ret_overrun !=3D 1);
> -
>  	spin_unlock(&output->lock);
> =20
>  	return HRTIMER_RESTART;
> @@ -74,11 +74,21 @@ bool vkms_get_vblank_timestamp(struct drm_device *dev=
, unsigned int pipe,
>  {
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
>  	struct vkms_output *output =3D &vkmsdev->output;
> +	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> =20
>  	*vblank_time =3D output->vblank_hrtimer.node.expires;
> =20
> -	if (!in_vblank_irq)
> -		*vblank_time -=3D output->period_ns;
> +	if (WARN_ON(*vblank_time =3D=3D vblank->time))
> +		return true;
> +
> +	/*
> +	 * To prevent races we roll the hrtimer forward before we do any
> +	 * interrupt processing - this is how real hw works (the interrupt is
> +	 * only generated after all the vblank registers are updated) and what
> +	 * the vblank core expects. Therefore we need to always correct the
> +	 * timestampe by one frame.
> +	 */
> +	*vblank_time -=3D output->period_ns;
> =20
>  	return true;
>  }
> --=20
> 2.20.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--snvga7vro42c4ic7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlz5MHAACgkQWJzP/com
vP9f8A/8D7cAQE44SlGxsFNbdnkSQ+7b50A8TAjIhLDuVUVWVdfUvFPvuGR7qWHk
kCuCeCPLwlu/HEy9Ih1eJ5s7ZyYyF6vKnoKTzud44R58W/0A+hHnRYgGHVdtRrIB
t4tzRm+Q6rygfU9MFisJ6VXNpXdb2cs1UbncAACY6lbCZJ7DVll0DJLQV6KNV7XX
diuLpGiE7MdCjhF73zc1hupVJ5ywlMSu8cuNiTOVJAtYiDFoQ2QKA7zSIlXZgONx
NT9fGMdc57SgGjfnJ8+bZ8Y03DYdXj7VdHOJAPxnu1I534qkBdLCHaWmoZWAbzxL
+zY7+IGNte9qmVs0fdluweX2ZztYPCPulWDT+j2OqiX4ofunFFsxNjnuYmWWHnvS
LTYwswJKkSpT/EjgH1y3TYxjdVx6F75FVpeB3eDPBO4aHoFpA3lTJMxFvCcLvbnU
t8OSwJeUJrojvt3vzgPYmNM0QP2u80/xQ46Ak7cu5nyGQjMJvFFn/8qMNkny6fyj
tpxir6T8TU9XSlVFcm0F1iv5E/E/gXzdXP/Rhk0g/OJfxzIUMFBK2NfAQQfypxg7
whI5+vzTiF3Np5P5cN9N5DTmpIvURcL3pKgnQMvmLs2m3IP7bdVJjMAOdV/ndhO4
PiSXKVWvZ0JRRQdu+zmglBkJCkRATyYHIVMRcl+7QK2CbiFGvY0=
=t5lC
-----END PGP SIGNATURE-----

--snvga7vro42c4ic7--

--===============1071705407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1071705407==--
