Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F0E84AB26
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 01:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B210EC74;
	Tue,  6 Feb 2024 00:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OwOgPkI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E52F10E5ED;
 Tue,  6 Feb 2024 00:45:47 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7838af983c1so383127185a.3; 
 Mon, 05 Feb 2024 16:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707180342; x=1707785142; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AiTXo+U1NoORgtWSqcY9amJeioYgdHVrGlFE0dsrMJU=;
 b=OwOgPkI7UAiNOEWyRQQHH7qKC2b/xS+u3ZzN/okzIDc4NNd+ElfNss+bdLgk6nZBg+
 Bmh7iHLc9+03y/pOqCQ0SZY/3CY+TWajDeK3WZiMFgj6FjzVFjOYq+8O6QofNLDK+Upy
 oWgHMavABecSmvgQTTPG/RLMUSgNmEdACzNTKWUdMQr8CdtgrscIl9gE5S5nD8R4XNfP
 Ewh7XtO1mY2qwH6h4K5xq8FYV5RlTuf/mEEUpb1qCzNxjcTq12Tokn767JKBFxjcW53Y
 rsv1+x+FVNCCc7uKECCXw7R5L9YFh/vX7p7O3yl9lXpxkcfQzkkKCIv8Z99OfJttuVmA
 uMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707180342; x=1707785142;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AiTXo+U1NoORgtWSqcY9amJeioYgdHVrGlFE0dsrMJU=;
 b=fibgd6GVEIDC492UPBznuxct2843oN9XmbcQYE3cz4fiWWfxhashg8L2vu1GkzUD0b
 HSFV7u8VAEhXiHbole5sTMnrjCt0E901+D9iV/Z71hjhA09bfGmVFBtYgdI8q2q+tUWG
 UYuPl7btVW5S3+yPYidCgAMf8kwCRsZeMyR/p4KbGWZB1tdxO7JbJLJxuGCouY0+urnO
 qGitC0ba/7zwon8tiJE2TNPSmRNQtTG/OeHIqlgin8If0Sdpt++R0B56iN56y/lna1mc
 d2JgirMWrlZpTwbwEPubT0vrJFhbjdqbdcvEN5xNQQqyxcozk68amGMaCzpvWPPA+aNR
 EVJw==
X-Gm-Message-State: AOJu0Yxk8zt5HQIhvfwdXb42TNVb8CPygVHoa8bAYRS4dhNJD+7vva2W
 sF65nKQenXU66hc05xWtfWysdQtIwquIrV/tCcUbfoIvRNCQL3CG
X-Google-Smtp-Source: AGHT+IG5qPqAiuoU6n9LQpTUGxuNIvQkzcyE+qpWsSharuZJNX32nzjNEoTJ7070tRkEVaElFAnA4A==
X-Received: by 2002:a05:620a:c9a:b0:784:1f7:3af5 with SMTP id
 q26-20020a05620a0c9a00b0078401f73af5mr715928qki.62.1707180342126; 
 Mon, 05 Feb 2024 16:45:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX0nOTItdWuVRP5TVxS8axOHGjXbb41OPLB0HUOVEWplZ6UMvr7EG9/eFZ0wczOoR7YeOudFnLqHqKJ8zd3gfeoik7N9h+KWT/DnO2y3HgcH+jXHNNnK0XdmUKyaGVhg4ndr4fmKtFfciAzFsOrUW7bErMQ5GcCoqvTnlwzPvVzWmcFI+y8a21Ukw==
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 h10-20020ac8584a000000b0042c2320e6d7sm430748qth.16.2024.02.05.16.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 16:45:41 -0800 (PST)
Message-ID: <54820b56-8ac2-46be-9f66-ab8744130ff6@gmail.com>
Date: Mon, 5 Feb 2024 19:45:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.7.0
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com
References: <20240130030413.2031009-1-matthew.brost@intel.com>
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
In-Reply-To: <20240130030413.2031009-1-matthew.brost@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A5Hg74ItpbpkiI600Hsfgo0u"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A5Hg74ItpbpkiI600Hsfgo0u
Content-Type: multipart/mixed; boundary="------------NsJ6c48S3Ne3ObJD7Tgl0CBZ";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com
Message-ID: <54820b56-8ac2-46be-9f66-ab8744130ff6@gmail.com>
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
References: <20240130030413.2031009-1-matthew.brost@intel.com>
In-Reply-To: <20240130030413.2031009-1-matthew.brost@intel.com>

--------------NsJ6c48S3Ne3ObJD7Tgl0CBZ
Content-Type: multipart/mixed; boundary="------------Fk5MWtX1FyhTBRChgExDrOWh"

--------------Fk5MWtX1FyhTBRChgExDrOWh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-01-29 22:04, Matthew Brost wrote:
> Rather then loop over entities until one with a ready job is found,
> re-queue the run job worker when drm_sched_entity_pop_job() returns NUL=
L.
>=20
> Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job=
 worker")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Indeed, we cannot have any loops in the GPU scheduler work items, as we n=
eed to bounce
between submit and free in the same work queue. (Coming from the original=
 design before
work items/queues were introduced).

Thanks for fixing this, Matt!

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
--=20
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 8acbef7ae53d..7e90c9f95611 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct work_=
struct *w)
>  	struct drm_sched_entity *entity;
>  	struct dma_fence *fence;
>  	struct drm_sched_fence *s_fence;
> -	struct drm_sched_job *sched_job =3D NULL;
> +	struct drm_sched_job *sched_job;
>  	int r;
> =20
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
> =20
>  	/* Find entity with a ready job */
> -	while (!sched_job && (entity =3D drm_sched_select_entity(sched))) {
> -		sched_job =3D drm_sched_entity_pop_job(entity);
> -		if (!sched_job)
> -			complete_all(&entity->entity_idle);
> -	}
> +	entity =3D drm_sched_select_entity(sched);
>  	if (!entity)
>  		return;	/* No more work */
> =20
> +	sched_job =3D drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
> +		complete_all(&entity->entity_idle);
> +		drm_sched_run_job_queue(sched);
> +		return;
> +	}
> +
>  	s_fence =3D sched_job->s_fence;
> =20
>  	atomic_add(sched_job->credits, &sched->credit_count);

--------------Fk5MWtX1FyhTBRChgExDrOWh
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

--------------Fk5MWtX1FyhTBRChgExDrOWh--

--------------NsJ6c48S3Ne3ObJD7Tgl0CBZ--

--------------A5Hg74ItpbpkiI600Hsfgo0u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZcGBLAUDAAAAAAAKCRBMFUeUMaM0r6Cw
AP9mc+bCyk+lKxGErzZdeYhEEj3Xd8egr54aAQSrOVb2WgEA0K3QCI/IMHx2XLSEDWgiDGRLsi8a
VKEoswUcKTYZXg0=
=AxIt
-----END PGP SIGNATURE-----

--------------A5Hg74ItpbpkiI600Hsfgo0u--
