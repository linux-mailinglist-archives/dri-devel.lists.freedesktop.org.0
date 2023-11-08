Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5027E501E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 06:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C8710E07A;
	Wed,  8 Nov 2023 05:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F6610E071
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 05:46:36 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-675b844adc7so6322546d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 21:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699422395; x=1700027195; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zu1B8DgVQtJr4Wjq4F1030egCyGMUDlWnV/j6bqPL0Y=;
 b=KOxNOCl5AUuXqfWUNJWrZJ5lWP7JFR499E/PVs3Svgsic4TCSEPCWp3ohBqrttIbrM
 Ht+3+WbZ9GZUyGMwN2Ndxae3/CZpMhEW7CzKienXiJnbqsqq6kzh0YyEXChrgXMCIyU/
 mwlbUNhussaKS9zD1RyIZCqEokFpmTMWPpgn0NXVtxo4uXik+FX8VD9FAxs0jpSBxRlB
 b+r2dAnQaZJkYUafsJ38827N6Wx7hN75Fxh2pVF+t2u7m/6Qsn2I8YbICJntYTcRuZoz
 4uP6HlF4KXyZquyPVhFV4iphfVHnRa0yreod8XJzHRcj6qH2KykTvey1OThYM7KGwVJ3
 ZFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699422395; x=1700027195;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zu1B8DgVQtJr4Wjq4F1030egCyGMUDlWnV/j6bqPL0Y=;
 b=pcA7bmGH+mJUrARMgWTV6ALpfLZYkT3hSD9Gk2+mhtdiU2qN9r53Y3bBeB6uiyzY6o
 fN2KwTzEj8CewrqHJ6Ga6J00PSMawSugMHISUl4M9QpE+UObHOsQDlRKpTewPCvVPThX
 Kis5Q+RoVeQnwCwNyQS9nGCecwMcGmX7K6QNpSAaX78IduVCQt4KG98ZmzcAB0jp2h2I
 PX5SXWrk7u0WphBv8tdlXA3R9KEgJyIgxg2EpRSRncXs9V52eU7612MrPgXlr6xLPyJi
 GPx1SnjL0dweVswX/0xxr7TbQrhmuwf2GiSV/bJ4E6I+jHSc1O82ub25UPVJRT2FT5V1
 Ux5g==
X-Gm-Message-State: AOJu0Yx15h9FBm1/r0sn/afKZb9Dh2xtYbm4Q/mTcBu++8u9B+1dB79U
 WTEs6kfZxOxImQwpAtv+/D9K9E3sxuNnn7T9Ww8=
X-Google-Smtp-Source: AGHT+IHSPhNJSTdi7vCBGKA2B216AXS7IN4kfyXHyaOB6H/fYImEHJU3OeOBAbdXfXm7HZ536x5aLA==
X-Received: by 2002:a05:6214:21aa:b0:66d:2e59:4fc2 with SMTP id
 t10-20020a05621421aa00b0066d2e594fc2mr931231qvc.40.1699422395494; 
 Tue, 07 Nov 2023 21:46:35 -0800 (PST)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 i10-20020ad4538a000000b00670bd5a3720sm709754qvv.97.2023.11.07.21.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 21:46:35 -0800 (PST)
Message-ID: <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
Date: Wed, 8 Nov 2023 00:46:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20231108022716.15250-1-dakr@redhat.com>
Content-Language: en-CA, en-US
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
In-Reply-To: <20231108022716.15250-1-dakr@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UGdY5zLUPuElTkXAuNfJeVsk"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UGdY5zLUPuElTkXAuNfJeVsk
Content-Type: multipart/mixed; boundary="------------fOE005u163L7eTYwK9JuzEbe";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
References: <20231108022716.15250-1-dakr@redhat.com>
In-Reply-To: <20231108022716.15250-1-dakr@redhat.com>

--------------fOE005u163L7eTYwK9JuzEbe
Content-Type: multipart/mixed; boundary="------------VB0Zul1e8VgVc0hPoacCCzse"

--------------VB0Zul1e8VgVc0hPoacCCzse
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please use my gmail address, the one one I'm responding from--I=
 don't want
to miss any DRM scheduler patches. BTW, the luben.tuikov@amd.com email sh=
ould bounce
as undeliverable.

On 2023-11-07 21:26, Danilo Krummrich wrote:
> Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable
> number of run-queues") introduces drm_err() in drm_sched_job_init(), in=

> order to indicate that the given entity has no runq, however at this
> time job->sched is not yet set, likely to be NULL initialized, and henc=
e
> shouldn't be used.
>=20
> Replace the corresponding drm_err() call with pr_err() to avoid a
> potential page fault.
>=20
> While at it, extend the documentation of drm_sched_job_init() to
> indicate that job->sched is not a valid pointer until
> drm_sched_job_arm() has been called.
>=20
> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable =
number of run-queues")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 27843e37d9b7..dd28389f0ddd 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   * This function returns -ENOENT in this case (which probably should b=
e -EIO as
>   * a more meanigful return value).
>   *
> + * Note that job->sched is not a valid pointer until drm_sched_job_arm=
() has
> + * been called.
> + *

Good catch!

Did you actually get this to page-fault and have a kernel log?

I'm asking because we see it correctly set in this kernel log coming from=
 AMD,

[   11.886024] amdgpu 0000:0a:00.0: [drm] *ERROR* drm_sched_job_init: ent=
ity has no rq!

in this email,
https://lore.kernel.org/r/CADnq5_PS64jYS_Y3kGW27m-kuWP+FQFiaVcOaZiB=3DJLS=
gPnXBQ@mail.gmail.com

>   * Returns 0 for success, negative error code otherwise.
>   */
>  int drm_sched_job_init(struct drm_sched_job *job,
> @@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		 * or worse--a blank screen--leave a trail in the
>  		 * logs, so this can be debugged easier.
>  		 */
> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
> +		pr_err("%s: entity has no rq!\n", __func__);

Is it feasible to do something like the following?

		dev_err(job->sched ? job->sched->dev : NULL, "%s: entity has no rq!\n",=
 __func__);

>  		return -ENOENT;
>  	}
> =20
>=20
> base-commit: c015fb6d01adb616fb54824feb55ce5ab18e8ca1

--=20
Regards,
Luben

--------------VB0Zul1e8VgVc0hPoacCCzse
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

--------------VB0Zul1e8VgVc0hPoacCCzse--

--------------fOE005u163L7eTYwK9JuzEbe--

--------------UGdY5zLUPuElTkXAuNfJeVsk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUsgsgUDAAAAAAAKCRBMFUeUMaM0r4Ux
AP42XIcikJp3Nof/hM8PI5NaV+fNoMP8oaHTGmZXkpmfBgD/Y/zLX+NrSNZasdqC2wV2ctqBcWdP
sQVN0bTo3fJzTQY=
=XOK3
-----END PGP SIGNATURE-----

--------------UGdY5zLUPuElTkXAuNfJeVsk--
