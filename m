Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8483FD21
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 05:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1975E1122F2;
	Mon, 29 Jan 2024 04:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8D1122F2;
 Mon, 29 Jan 2024 04:09:24 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-783d916d039so197404485a.2; 
 Sun, 28 Jan 2024 20:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706501304; x=1707106104; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aK/DeH37UJ3zBFzoYfRccZROfS9NQRZ8LG2l7m048Kk=;
 b=UZVZpQx5OPNAfivGuhY1WaLBG+/IETbDhXV62yOicTM5Nj9bXFFNcsNVC7w6TxOhJc
 7LjdDFwppe7LBI3duRHx6VQbhV9k02+IhCS04cZ+IWZtM5l/WNmyGw6zOxAJ8Uy/mMxT
 K+fi0K51VSzMT4AsQBIjqEqykHBdgt/HtVyJExxIXsoK+s5CIV8NvvudKwjQdX+mYWQF
 pQdVNGtAATFuCK2qhae3pt+g7YftIsExJui9lvvM7OOBFWcClX9u632qR0PF58XyANzi
 TzYXAUGoDx7ppzTHstaLhXXbW7sztdXrutnvRi4KRdxF4VoQMiduRMWErdMtzrllNHBc
 JgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706501304; x=1707106104;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aK/DeH37UJ3zBFzoYfRccZROfS9NQRZ8LG2l7m048Kk=;
 b=VI4jCAcOL04291ON3e5I2Z/kTcWMputKFXPkExMI2O8BKOus7CFm8HyzwgJiHKlTvl
 kP5OhXGAECIbvwCI3u1XwAgsD+SSqyqZ6tB20vyuOSYjjQaBNzRSbWm7kIszm9uPQz5Q
 VkNfXiDlHg7wPT46ZN9y7g1xp48zjoxtobSpjpH5msSg2nAl73W1jcSCN4roIX4/3lmT
 DQAhEy7zcD8f24SieBvJjenzjbC76wilH0MW18rwxmNNkIOXP629GxQuwBzJInlMKBWu
 cSqSk+LlP2ssMQZCVEzECsRUpqBJdL79s2shjefiSSIlBYirpZ5u1aluyElOHbx434If
 9quw==
X-Gm-Message-State: AOJu0YwaPrbDmUmKmBzTXAds4ACTV4b/S2n27bUSZgbnw48ClGsKuzxN
 SPTK+n92VHJ+zE6jLEw5c/zMcMJpazo+Fsa3PX8ENFK6uSIzFace
X-Google-Smtp-Source: AGHT+IHgrP2/DHf4BPhiY7+eLfP8VuvmZv95SQvc3FZc8vOTm4TiVqsYwttcIKO9f7TOw7ukRur4EA==
X-Received: by 2002:a05:620a:19a1:b0:783:c7dc:4d34 with SMTP id
 bm33-20020a05620a19a100b00783c7dc4d34mr8390022qkb.63.1706501303798; 
 Sun, 28 Jan 2024 20:08:23 -0800 (PST)
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b00783dfd725absm2150414qkp.42.2024.01.28.20.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 20:08:23 -0800 (PST)
Message-ID: <2a6dc042-9e40-4c9a-97f4-667a99b3d7bf@gmail.com>
Date: Sun, 28 Jan 2024 23:08:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.6.0
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240124210811.1639040-1-matthew.brost@intel.com>
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
In-Reply-To: <20240124210811.1639040-1-matthew.brost@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9Tlx4K3ZhpZJyhOyd4L0Ypev"
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
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 christian.koenig@amd.com, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9Tlx4K3ZhpZJyhOyd4L0Ypev
Content-Type: multipart/mixed; boundary="------------IHVr9Fxg0ouNhkYq0EhO9D3U";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>
Message-ID: <2a6dc042-9e40-4c9a-97f4-667a99b3d7bf@gmail.com>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
References: <20240124210811.1639040-1-matthew.brost@intel.com>
In-Reply-To: <20240124210811.1639040-1-matthew.brost@intel.com>

--------------IHVr9Fxg0ouNhkYq0EhO9D3U
Content-Type: multipart/mixed; boundary="------------zbDDSdo5pXwSYSJZY0OkNzjZ"

--------------zbDDSdo5pXwSYSJZY0OkNzjZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-01-24 16:08, Matthew Brost wrote:
> All entities must be drained in the DRM scheduler run job worker to
> avoid the following case. An entity found that is ready, no job found
> ready on entity, and run job worker goes idle with other entities + job=
s
> ready. Draining all ready entities (i.e. loop over all ready entities)
> in the run job worker ensures all job that are ready will be scheduled.=

>=20
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=3D=
bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
> Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciel=
lo@amd.com/
> Reported-by: Vlastimil Babka <vbabka@suse.cz>
> Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179=
fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Hi Matthew,

Thanks for working on this and sending the patch.

Could we add a fixes-tag to the tag list,

Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")

This really drives to point as shown here,
https://gitlab.freedesktop.org/drm/amd/-/issues/3124
which is mentioned in a Closes tag--thanks!
--=20
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 550492a7a031..85f082396d42 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_=
struct *w)
>  	struct drm_sched_entity *entity;
>  	struct dma_fence *fence;
>  	struct drm_sched_fence *s_fence;
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *sched_job =3D NULL;
>  	int r;
> =20
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
> =20
> -	entity =3D drm_sched_select_entity(sched);
> +	/* Find entity with a ready job */
> +	while (!sched_job && (entity =3D drm_sched_select_entity(sched))) {
> +		sched_job =3D drm_sched_entity_pop_job(entity);
> +		if (!sched_job)
> +			complete_all(&entity->entity_idle);
> +	}
>  	if (!entity)
> -		return;
> -
> -	sched_job =3D drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
> -		complete_all(&entity->entity_idle);
>  		return;	/* No more work */
> -	}
> =20
>  	s_fence =3D sched_job->s_fence;
> =20

--------------zbDDSdo5pXwSYSJZY0OkNzjZ
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

--------------zbDDSdo5pXwSYSJZY0OkNzjZ--

--------------IHVr9Fxg0ouNhkYq0EhO9D3U--

--------------9Tlx4K3ZhpZJyhOyd4L0Ypev
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZbckrQUDAAAAAAAKCRBMFUeUMaM0r75f
AP9SLQC8J0NaM7Q1ULAGrHoqOwS4ODe2RraUfb9iCRTADwD/a4hF+dHCNgkD4V6PJw7UZX2qGehk
Z1N4GwouzNfZ/gk=
=eYFY
-----END PGP SIGNATURE-----

--------------9Tlx4K3ZhpZJyhOyd4L0Ypev--
