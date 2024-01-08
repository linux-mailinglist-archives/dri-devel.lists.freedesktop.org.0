Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BF826790
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 05:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24B610E161;
	Mon,  8 Jan 2024 04:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAC710E161
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 04:17:12 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-680b1335af6so19486446d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jan 2024 20:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704687432; x=1705292232; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=42H+8pLF3a4y4924hwnyHcgjfAQoJmqKFluj8FhzHCE=;
 b=QIlpJS14QhOGXE+4hKA2t9vvHmrZ4WD3n32d5FaHgDXN20oFLsJwapZ3Xk6JDNYbrF
 OuMbaAiPZ9bGuZCXjQ+qs68Q1OkFB4WzM+14liDyDq25xiGVVJT+P8b/uz+oSCy7LnxZ
 lOrLOEB8sUxNBvpWzPpvQmWYWNIlz25h+IWSaNoYs10lzLEH7Y9XH85lqp0b3ElzeTH7
 A4g9ENgdoB5Imf/VIxECtMskn0/IYfVkzvdkH+7SMA+Vd54qhgSaJSc+0wUgO37wzPYl
 y2FDdrRRwyqu1DmNsVLGJUbJKzjkt/Qe4eVV2mPW3EplSi/F7YuxTPU0SekjkAe/jtCp
 iBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704687432; x=1705292232;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=42H+8pLF3a4y4924hwnyHcgjfAQoJmqKFluj8FhzHCE=;
 b=hIhtmh+An0FHOOhgmV9fnZ0lHoE04WifOXp5L9yhRqQt6T6mOlNbEBw55gogdhVxrc
 dq6oqEfpyqXWvWBJrRfW0K3r33Eoi99cLA3lrQcE/ct6oM481uI5z/y1N9JsslckFuj5
 SupddcrsX9yOnhCqgUWDtGg83N/bucfe+LvJbNTpcvNo0Vbp+wjEaVR4UtUuxaefqVT+
 CzX84O092uw/96cBgyOfRak7SdJc5atUQR+nck4NU/+BplbAhEgLyb0EpScxBb0lQ5Fl
 4UhpNO+lR8BmrYJoSGJPxuCKB+KMa+qnXWb1ax1bwfcrQfHe3CMPXUurWUujwXwXZlXk
 +YSQ==
X-Gm-Message-State: AOJu0YzVNpXR9r4K075TTXxYFAIjbkq/9fUXW2jNfKJ7RtHUyrmhYPi7
 dl9tfA2621ZlNhfwoNSktVw=
X-Google-Smtp-Source: AGHT+IHBJd928t26adY7ajSfvXu37/R9j/Xx9a38JOv0M14cTLYRd7BO7EIjc3WeZk0LNrkjmllgpQ==
X-Received: by 2002:a05:6214:20aa:b0:681:962:b650 with SMTP id
 10-20020a05621420aa00b006810962b650mr640676qvd.9.1704687431639; 
 Sun, 07 Jan 2024 20:17:11 -0800 (PST)
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 mx20-20020a0562142e1400b0067f802d373bsm2557852qvb.89.2024.01.07.20.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jan 2024 20:17:11 -0800 (PST)
Message-ID: <3fdc015b-33e5-4c10-88b0-964e95fb22b2@gmail.com>
Date: Sun, 7 Jan 2024 23:17:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.6.0
Subject: Re: [PATCH 2/2] drm/sched: Return an error code only as a constant in
 drm_sched_init()
Content-Language: en-CA, en-US
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <12b3e9cb-3241-40cc-b7a4-43c45b9eedc9@web.de>
 <85f8004e-f0c9-42d9-8c59-30f1b4e0b89e@web.de>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <85f8004e-f0c9-42d9-8c59-30f1b4e0b89e@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0OdjEfeS27b0xQjUbLwg8LPF"
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0OdjEfeS27b0xQjUbLwg8LPF
Content-Type: multipart/mixed; boundary="------------6aFc9OoRicXVkSLC0wSL3l6q";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Message-ID: <3fdc015b-33e5-4c10-88b0-964e95fb22b2@gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: Return an error code only as a constant in
 drm_sched_init()
References: <12b3e9cb-3241-40cc-b7a4-43c45b9eedc9@web.de>
 <85f8004e-f0c9-42d9-8c59-30f1b4e0b89e@web.de>
In-Reply-To: <85f8004e-f0c9-42d9-8c59-30f1b4e0b89e@web.de>

--------------6aFc9OoRicXVkSLC0wSL3l6q
Content-Type: multipart/mixed; boundary="------------ucjVn0mqx7jv0wNqHN30m4Es"

--------------ucjVn0mqx7jv0wNqHN30m4Es
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-12-26 10:58, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Dec 2023 16:37:37 +0100
>=20
> Return an error code without storing it in an intermediate variable.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thank you Markus for this patch.

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

Pushed to drm-misc-next.
--=20
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index b99d4e9ff109..1abbcdf38430 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1249,7 +1249,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
> -	int i, ret;
> +	int i;
>=20
>  	sched->ops =3D ops;
>  	sched->credit_limit =3D credit_limit;
> @@ -1285,7 +1285,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>=20
>  		sched->own_submit_wq =3D true;
>  	}
> -	ret =3D -ENOMEM;
> +
>  	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
>  					GFP_KERNEL | __GFP_ZERO);
>  	if (!sched->sched_rq)
> @@ -1321,7 +1321,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>  	if (sched->own_submit_wq)
>  		destroy_workqueue(sched->submit_wq);
>  	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", =
__func__);
> -	return ret;
> +	return -ENOMEM;
>  }
>  EXPORT_SYMBOL(drm_sched_init);
>=20
> --
> 2.43.0
>=20

--------------ucjVn0mqx7jv0wNqHN30m4Es
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------ucjVn0mqx7jv0wNqHN30m4Es--

--------------6aFc9OoRicXVkSLC0wSL3l6q--

--------------0OdjEfeS27b0xQjUbLwg8LPF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZZt3RgUDAAAAAAAKCRBMFUeUMaM0r1Mm
AP9G375ycXDv/SdVEJRCDeXWTFESuUCs5KbEksQguSy8UAD+J8sH8QQOl1Ib2ADC2XrbF3RzIrqO
xtCJaap8RPtcjgw=
=cdoY
-----END PGP SIGNATURE-----

--------------0OdjEfeS27b0xQjUbLwg8LPF--
