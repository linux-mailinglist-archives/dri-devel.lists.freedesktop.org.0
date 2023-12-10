Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB580B859
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 03:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0FB10E309;
	Sun, 10 Dec 2023 02:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E7A10E300;
 Sun, 10 Dec 2023 02:00:16 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-67abd020f40so35453486d6.0; 
 Sat, 09 Dec 2023 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702173615; x=1702778415; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Iirnk+K80ukU5tUHF57C2FdkiPvuVc7P/UMA6GstnZ0=;
 b=LzmX7W4RG6RQwOVkPPGKfPj/hH6ecDgZpZfKMZIMxZ73P78vLSDmw1w8Y+evx+egQo
 6mcn9sO6gIjlw48XTiOypnZeRA7Qb38C+4bUUPcx5hwQnErRPPaJ/OgNM8PK1TlZalNP
 Ey4uClVFgOcm668cH9JeEzdQFquk0C3u2qL8NNbFrLTiCJL8rj06QJ+6mS8ccpmr6jE1
 lo7PZQIu5glBN1XzDVICH91gWZPpUzW621aqVoJmdwoOTqQ9vNX+Kb7TIwIrqKXCvaY+
 Rpe1CTaVWKkVYh2MRdcXcMFPfFDikbZKsjJ4859lC3Uq+AaD8s1UioSwKSu6utNDLO67
 S1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702173615; x=1702778415;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iirnk+K80ukU5tUHF57C2FdkiPvuVc7P/UMA6GstnZ0=;
 b=kJmtHiLdVrZWlZXv4zpAF/pKYfKPbojF8+BMYZn4xm8jaARq0SkJ9VA7fsBsMjYoTh
 DA0fI5eL/7oOM9IZ/uS5wYkTWxSph0vVJkQy6vo6YQ3gEAi6kFC39NEpA5e59u/SaBit
 3wKnsqt7MAbT+EJnyFnUigOaF0JMtwkzCYgvTt4dsA4pXfEugfodzuSAndjnXbgqKui7
 qLDdB/cuWtpCeJ4oxT4nONuU1dc+h7aMWEZ/eqS+woKTwgSqhqSOTzD4k+jLYJpK/d9Q
 28wjIwvERiXSsf69NNPIISWM/JqDbeczHYDXmEFbahbJB7UVU9YOqI+ask/eWF06NL3h
 3ZKg==
X-Gm-Message-State: AOJu0YzleSUVpg75r7K/9QoBFvyO7slVV8j1itHWZ0MrZ/OIIfHOf+ug
 Vl1RHVzY17zqt8/3NCE5NJA=
X-Google-Smtp-Source: AGHT+IHmmO8yEQxrJ3T556l1Tmtu1x5im4Nj1OUazKYtPscjv2QXgn0AAZMkSWymutV6XmCr0Gc/AA==
X-Received: by 2002:a05:6214:1549:b0:67a:a2a2:3935 with SMTP id
 t9-20020a056214154900b0067aa2a23935mr3074853qvw.7.1702173614950; 
 Sat, 09 Dec 2023 18:00:14 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 pp12-20020a056214138c00b0067a14238fa9sm2051161qvb.94.2023.12.09.18.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 18:00:14 -0800 (PST)
Message-ID: <cd286d71-811e-4976-8538-4f946dca6da8@gmail.com>
Date: Sat, 9 Dec 2023 21:00:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.1
Subject: Re: [PATCH] drm/scheduler: Unwrap job dependencies
Content-Language: en-CA, en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231205190234.371322-1-robdclark@gmail.com>
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
In-Reply-To: <20231205190234.371322-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DH1b43QTRDFYjum9TFiZzmL0"
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:bdma_\(?:buf|fence|resv\)b"
 <linaro-mm-sig@lists.linaro.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_\(?:buf|fence|resv\)b"
 <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DH1b43QTRDFYjum9TFiZzmL0
Content-Type: multipart/mixed; boundary="------------5AcjGbok14q8wunARMWuRa49";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Message-ID: <cd286d71-811e-4976-8538-4f946dca6da8@gmail.com>
Subject: Re: [PATCH] drm/scheduler: Unwrap job dependencies
References: <20231205190234.371322-1-robdclark@gmail.com>
In-Reply-To: <20231205190234.371322-1-robdclark@gmail.com>

--------------5AcjGbok14q8wunARMWuRa49
Content-Type: multipart/mixed; boundary="------------Xnbegemyy81hwQG4dwAVqouJ"

--------------Xnbegemyy81hwQG4dwAVqouJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 2023-12-05 14:02, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> Container fences have burner contexts, which makes the trick to store a=
t
> most one fence per context somewhat useless if we don't unwrap array or=

> chain fences.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Link: https://lore.kernel.org/all/20230322224403.35742-1-robdclark@gmail.=
com/

Let's include a link to the original thread, as the main discussion can b=
e found
therein.

Christian, could you review this patch please?

Thanks!
--=20
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 47 ++++++++++++++++++--------=

>  1 file changed, 32 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 9762464e3f99..16b550949c57 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -52,6 +52,7 @@
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> +#include <linux/dma-fence-unwrap.h>
>  #include <linux/dma-resv.h>
>  #include <uapi/linux/sched/types.h>
> =20
> @@ -684,27 +685,14 @@ void drm_sched_job_arm(struct drm_sched_job *job)=

>  }
>  EXPORT_SYMBOL(drm_sched_job_arm);
> =20
> -/**
> - * drm_sched_job_add_dependency - adds the fence as a job dependency
> - * @job: scheduler job to add the dependencies to
> - * @fence: the dma_fence to add to the list of dependencies.
> - *
> - * Note that @fence is consumed in both the success and error cases.
> - *
> - * Returns:
> - * 0 on success, or an error on failing to expand the array.
> - */
> -int drm_sched_job_add_dependency(struct drm_sched_job *job,
> -				 struct dma_fence *fence)
> +static int drm_sched_job_add_single_dependency(struct drm_sched_job *j=
ob,
> +					       struct dma_fence *fence)
>  {
>  	struct dma_fence *entry;
>  	unsigned long index;
>  	u32 id =3D 0;
>  	int ret;
> =20
> -	if (!fence)
> -		return 0;
> -
>  	/* Deduplicate if we already depend on a fence from the same context.=

>  	 * This lets the size of the array of deps scale with the number of
>  	 * engines involved, rather than the number of BOs.
> @@ -728,6 +716,35 @@ int drm_sched_job_add_dependency(struct drm_sched_=
job *job,
> =20
>  	return ret;
>  }
> +
> +/**
> + * drm_sched_job_add_dependency - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> +				 struct dma_fence *fence)
> +{
> +	struct dma_fence_unwrap iter;
> +	struct dma_fence *f;
> +	int ret =3D 0;
> +
> +	dma_fence_unwrap_for_each (f, &iter, fence) {
> +		dma_fence_get(f);
> +		ret =3D drm_sched_job_add_single_dependency(job, f);
> +		if (ret)
> +			break;
> +	}
> +
> +	dma_fence_put(fence);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_sched_job_add_dependency);
> =20
>  /**

--------------Xnbegemyy81hwQG4dwAVqouJ
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

--------------Xnbegemyy81hwQG4dwAVqouJ--

--------------5AcjGbok14q8wunARMWuRa49--

--------------DH1b43QTRDFYjum9TFiZzmL0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZXUbpAUDAAAAAAAKCRBMFUeUMaM0r4CB
AP9BzdKV0/Demva8WlC8Tg3QI4lENeTPM8OVE+DczzG1/wEArLptFP004Ze3PTau6EO21XXw68MP
6GZn+DgxJOc7nQQ=
=MtnB
-----END PGP SIGNATURE-----

--------------DH1b43QTRDFYjum9TFiZzmL0--
