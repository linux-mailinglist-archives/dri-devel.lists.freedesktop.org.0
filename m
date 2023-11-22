Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F77F5415
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337968918D;
	Wed, 22 Nov 2023 23:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697CA10E031
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:02:34 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-77bb668d941so13284885a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 15:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700694153; x=1701298953; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=713D/mr8FnZsqfiS5P5yxuAHBkWuO1zSh/aXnMAXq+c=;
 b=ZNod370MlYZWr8DvaZCesJ4nWp9++pLqvHDgYTv7C5kN89jo/aR9k2z5jL3LIFbdNd
 E/sSOGdNaotDFO0zspnIWTPgjuQn5umCwu59xpvQJL1P99GQijEBNmwl8AzUYmxpEIBY
 TfS64OD1y3ffmtvLF7mQUtQVCg9H+7cbOPCEYVd/qlEl3mjmIrw9BYuF8wJfZfr54QEi
 id3SEh921xIXesVqm/9Uyf/9ePV8dOCeY5lVJ0wPgdhyo60PGEuu5qvL32b2DbyOo2b0
 BEqpgwjpZnE+Kq3cwPSqFabeMzdSesDz1k2xLJrGk7JEPGbC1lz3vCByij8ZCEnXM1wA
 UpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700694153; x=1701298953;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=713D/mr8FnZsqfiS5P5yxuAHBkWuO1zSh/aXnMAXq+c=;
 b=pl97sZk4vDbVDbfrcm2RXbiav6dhrTk+avTYpF67RBTSR+ym0KLp6iSTismvtXsFmp
 VrxQ7RmRIoZBXXoVA8dWviM9g3KUnS+JC1cMIhJ5tgB0Gb2/e0XKbaCEz4JxMHw7xo/r
 PNngf4IbZiJ9HezxdCA7b+g978CttpLKo8l5o6ZzOv1NbTxr53zEKIhiN2v8h75s8/je
 WrkEp240NL1kWAOZiCtfPmWlDVZVFFEpAt5/jKwQVObZh5JriLbYe6KncVJ5sDr+2OK+
 HrHysiaeHw93SifGN+jflcL6mU+G04EJVbJsf3UHk9Q3i/nSp/7nMBpWq4WtTZRU+ylh
 jBtA==
X-Gm-Message-State: AOJu0Yy7UP3rPn0PqamFJMyNa3PpO6S2rPWK46XzKSZ6QABFxqlu/iGI
 G7Be72LhD8RrxCynkz34dDU=
X-Google-Smtp-Source: AGHT+IEUDWvGnYTYcUAnaLKFreL8IRmmlG7fUaKzJixpcfuHUYa0eUH0HHPIqEM/b6eqfYMwZPjBqw==
X-Received: by 2002:a05:6214:e8f:b0:679:e195:b071 with SMTP id
 hf15-20020a0562140e8f00b00679e195b071mr5129439qvb.9.1700694153301; 
 Wed, 22 Nov 2023 15:02:33 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a0cb2cf000000b0065af71585b5sm171391qvf.58.2023.11.22.15.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 15:02:32 -0800 (PST)
Message-ID: <b2185acd-b5fb-4f60-b5f3-631d27c0396a@gmail.com>
Date: Wed, 22 Nov 2023 18:02:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
Content-Language: en-CA, en-US
To: Bert Karwatzki <spasswolf@web.de>, dri-devel@lists.freedesktop.org
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
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
In-Reply-To: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ylOAiq8atcoddDDTzSS12wZw"
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
Cc: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ylOAiq8atcoddDDTzSS12wZw
Content-Type: multipart/mixed; boundary="------------Iet3ZESvxcq00dVfgOLUkS77";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Bert Karwatzki <spasswolf@web.de>, dri-devel@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-ID: <b2185acd-b5fb-4f60-b5f3-631d27c0396a@gmail.com>
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
In-Reply-To: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>

--------------Iet3ZESvxcq00dVfgOLUkS77
Content-Type: multipart/mixed; boundary="------------9hpX6lEjfBUAB3DPXPmFQYyb"

--------------9hpX6lEjfBUAB3DPXPmFQYyb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-21 04:00, Bert Karwatzki wrote:
> Since linux-next-20231115 my linux system (debian sid on msi alpha 15 l=
aptop)
> suffers from random deadlocks which can occur after=C2=A0 30 - 180min o=
f usage. These
> deadlocks can be actively provoked by creating high system load (usuall=
y by
> compiling a kernel with make -j NRCPUS) and the opening instances of li=
breoffice
> --writer until the system GUI locks (the mouse cursor can still be move=
d but the
> screen is frozen). In this state ssh'ing into the machine is still poss=
ible and
> at least sometimes log messages about hung tasks appear in /var/log/ker=
n.log.
>=20
> More info can be found here:
> https://gitlab.freedesktop.org/drm/amd/-/issues/2994
>=20
> Using the method described to trigger the bug I bisected the problem in=
 the
> linux-next and drm-misc trees to give commit f3123c2590005 as the probl=
em.
> As this simple patch fixes the problem
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 044a8c4875ba..25b97db1b623 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_e=
ntity *entity)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_entity_is_ready(ent=
ity))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (drm_sched_can_queue(sched, entity))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_ru=
n_job_queue(sched);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched, en=
tity))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0
> =C2=A0/**
>=20
> there might be in the entity->dependency branch of drm_sched_entity_is_=
ready
> (some kind of circular dependencies ...).
>=20
> To see if the change to drm_sched_wakeup is the actual cause of the pro=
blem or
> if this problem has been cause by the redesign of the drm scheduler in =
linux
> next-20231115+, I created the following patch for linux-6.6.0:
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429d..dc2abd299aeb 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -358,7 +358,7 @@ static void drm_sched_entity_wakeup(struct dma_fenc=
e *f,
>  container_of(cb, struct drm_sched_entity, cb);
>=20
>  drm_sched_entity_clear_dep(f, cb);
> - drm_sched_wakeup_if_can_queue(entity->rq->sched);
> + drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>  }
>=20
>  /**
> @@ -590,7 +590,7 @@ void drm_sched_entity_push_job(struct drm_sched_job=

> *sched_job)
>  if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>  drm_sched_rq_update_fifo(entity, submit_ts);
>=20
> - drm_sched_wakeup_if_can_queue(entity->rq->sched);
> + drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>  }
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 5a3a622fc672..bbe06403b33d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -865,10 +865,11 @@ static bool drm_sched_can_queue(struct drm_gpu_sc=
heduler
> *sched)
>   *
>   * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, st=
ruct
> drm_sched_entity *entity)
>  {
> - if (drm_sched_can_queue(sched))
> - wake_up_interruptible(&sched->wake_up_worker);
> + if(drm_sched_entity_is_ready(entity))
> + if (drm_sched_can_queue(sched))
> + wake_up_interruptible(&sched->wake_up_worker);
>  }
>=20
>  /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index ac65f0626cfc..6cfe3d193e69 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -548,7 +548,7 @@ void drm_sched_entity_modify_sched(struct drm_sched=
_entity
> *entity,
>                                     unsigned int num_sched_list);
>=20
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, st=
ruct
> drm_sched_entity *entity);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_=
job
> *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recove=
ry);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>=20
> This brings the extra check to the old scheduler and has so far not cau=
sed any
> trouble (using the same stress test described above), so chances are th=
at the
> error is somewhere else in redesigned scheduler.
>=20
>=20
> Bert Karwatzki

Hi Bert,

Thanks for looking into this.

As an afterthought, removing the "entity_is_ready()" qualifier in wake-up=
, makes
the scheduling more opportunistic, and I agree that that is the more corr=
ect approach.
Commit f3123c2590005, basically made the code as close to the way it func=
tioned before
the move to run-queues.

Would you like to create a patch for this?
--=20
Regards,
Luben

--------------9hpX6lEjfBUAB3DPXPmFQYyb
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

--------------9hpX6lEjfBUAB3DPXPmFQYyb--

--------------Iet3ZESvxcq00dVfgOLUkS77--

--------------ylOAiq8atcoddDDTzSS12wZw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZV6IfwUDAAAAAAAKCRBMFUeUMaM0r/i0
AQCmlACn+7p6AJGvJ+9OwZ2rHCDmGdLEVxhNbxh62RhWmwEAhT/JGnccY3sfq4nMjsZREVhQeIwn
XvfPwe4DMEUjBQ0=
=QXdk
-----END PGP SIGNATURE-----

--------------ylOAiq8atcoddDDTzSS12wZw--
