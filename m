Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599827F8E51
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 21:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D943010E044;
	Sat, 25 Nov 2023 20:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B810E042
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 20:03:21 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-77d84f8808dso75907985a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 12:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700942600; x=1701547400; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sVJ1K4ykChPptZK5rEmfpueoCqNlqMb09+e3MnBhEKA=;
 b=TyabcNrxHAP5RCRb/CLIeJ8nGIESOmGpDHlH8hnr54KOFxc5pwX33VuErRGXYoLHfH
 Cg0f4E8Ft7QCJgiyf6tydYKbuE4VIzq61U8HwywxBfcfL56ShTPC2QBV/Z07imOb0MCd
 ACPpkUYk89QHHBpwR9ZBvlbzzEBvARJSIQWN5F6AmgRJMBVafq/vmYiHCo7KbcGBvdcO
 N/OHhdFRUXowB4MSYvN6TOnWet9e77gTlVzPLCE1ttccGXYUU58hGDXhxCiSM+/DBdE6
 e6y5KEQXKAA47tAfNvVm+Os2AsyjhGVNM/+L4U37aVCQ7A+UnoB1Jw3Co98nKU/opFuk
 h1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700942600; x=1701547400;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sVJ1K4ykChPptZK5rEmfpueoCqNlqMb09+e3MnBhEKA=;
 b=rnOXp/5z5s8Bahhw7oJS4jSV8amNpPLAcEz5IrgXKabhxudMSWQY7T85DwCrEjmJDH
 2A13Q/vrQjtEKDARZV4roJEqlKzX+VuAt7qTpBgAClFaJoAiDOaSdgzJ+3eaPO/FJ6+1
 6wA6upjVW0qo1o3SjnUuTIhSowd97xpFVsApURHBBHk7i4lPC6GRWYifW9b3DVb7+OnD
 JAGaIs9DVF87RjaWEGteFzkUUJm64xLIDO+DxPx7mpdEt2LXOWZ9eDpAH03ImtGtb/AK
 iuwtPkEnXyXjzIs7jEpXTYHjklQuQ9cM9B7rlAFsxv69lVCMDCep191pvc/3FzqBwVAK
 27Ug==
X-Gm-Message-State: AOJu0YyFaAArqlg2+bBi8ejDUSSrUDhDXHjpoQhGCHenXANoyyIwhrOj
 hNhKZp0uLdOtQx57CngcoyWqtcTrf1lcGg==
X-Google-Smtp-Source: AGHT+IFg8iTOGVpTekbOnQODzFtkOVgnyVjbTWoBWuIvV35+QW/copImkcYtKYat4HIYbphcFVj9fQ==
X-Received: by 2002:a37:c409:0:b0:77d:6225:4d3f with SMTP id
 d9-20020a37c409000000b0077d62254d3fmr8435107qki.28.1700942600224; 
 Sat, 25 Nov 2023 12:03:20 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 or4-20020a05620a618400b0077d9b938490sm273821qkn.23.2023.11.25.12.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Nov 2023 12:03:19 -0800 (PST)
Message-ID: <c5292d06-2e37-4715-96dc-699f369111fa@gmail.com>
Date: Sat, 25 Nov 2023 15:03:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
Content-Language: en-CA, en-US
To: Bert Karwatzki <spasswolf@web.de>, dri-devel@lists.freedesktop.org
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
 <b2185acd-b5fb-4f60-b5f3-631d27c0396a@gmail.com>
 <4ed1921c91c46ca2bb3877038aff27dc4ea0dab1.camel@web.de>
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
In-Reply-To: <4ed1921c91c46ca2bb3877038aff27dc4ea0dab1.camel@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------btl9PZaaOazfcI0Ow0SN03rk"
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
--------------btl9PZaaOazfcI0Ow0SN03rk
Content-Type: multipart/mixed; boundary="------------dnTw3oOd0FXZcuoVhXW56kW9";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Bert Karwatzki <spasswolf@web.de>, dri-devel@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-ID: <c5292d06-2e37-4715-96dc-699f369111fa@gmail.com>
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
 <b2185acd-b5fb-4f60-b5f3-631d27c0396a@gmail.com>
 <4ed1921c91c46ca2bb3877038aff27dc4ea0dab1.camel@web.de>
In-Reply-To: <4ed1921c91c46ca2bb3877038aff27dc4ea0dab1.camel@web.de>

--------------dnTw3oOd0FXZcuoVhXW56kW9
Content-Type: multipart/mixed; boundary="------------Qbe6ldnkUUbC14tz7smz0Hjx"

--------------Qbe6ldnkUUbC14tz7smz0Hjx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-24 04:38, Bert Karwatzki wrote:
> Am Mittwoch, dem 22.11.2023 um 18:02 -0500 schrieb Luben Tuikov:
>> On 2023-11-21 04:00, Bert Karwatzki wrote:
>>> Since linux-next-20231115 my linux system (debian sid on msi alpha 15=

>>> laptop)
>>> suffers from random deadlocks which can occur after=C2=A0 30 - 180min=
 of usage.
>>> These
>>> deadlocks can be actively provoked by creating high system load (usua=
lly by
>>> compiling a kernel with make -j NRCPUS) and the opening instances of
>>> libreoffice
>>> --writer until the system GUI locks (the mouse cursor can still be mo=
ved but
>>> the
>>> screen is frozen). In this state ssh'ing into the machine is still po=
ssible
>>> and
>>> at least sometimes log messages about hung tasks appear in
>>> /var/log/kern.log.
>>>
>>> More info can be found here:
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2994
>>>
>>> Using the method described to trigger the bug I bisected the problem =
in the
>>> linux-next and drm-misc trees to give commit f3123c2590005 as the pro=
blem.
>>> As this simple patch fixes the problem
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 044a8c4875ba..25b97db1b623 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>>> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sche=
d_entity *entity)
>>> =C2=A0{
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_entity_is_ready(e=
ntity))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched, entity))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched=
_run_job_queue(sched);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched, =
entity))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 drm_sched_run_job_queue(sched);
>>> =C2=A0}
>>> =C2=A0
>>> =C2=A0/**
>>>
>>> there might be in the entity->dependency branch of drm_sched_entity_i=
s_ready
>>> (some kind of circular dependencies ...).
>>>
>>> To see if the change to drm_sched_wakeup is the actual cause of the p=
roblem
>>> or
>>> if this problem has been cause by the redesign of the drm scheduler i=
n linux
>>> next-20231115+, I created the following patch for linux-6.6.0:
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index a42763e1429d..dc2abd299aeb 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -358,7 +358,7 @@ static void drm_sched_entity_wakeup(struct dma_fe=
nce *f,
>>> =C2=A0container_of(cb, struct drm_sched_entity, cb);
>>>
>>> =C2=A0drm_sched_entity_clear_dep(f, cb);
>>> - drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>> + drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>>> =C2=A0}
>>>
>>> =C2=A0/**
>>> @@ -590,7 +590,7 @@ void drm_sched_entity_push_job(struct drm_sched_j=
ob
>>> *sched_job)
>>> =C2=A0if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>>> =C2=A0drm_sched_rq_update_fifo(entity, submit_ts);
>>>
>>> - drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>> + drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>>> =C2=A0}
>>> =C2=A0}
>>> =C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 5a3a622fc672..bbe06403b33d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -865,10 +865,11 @@ static bool drm_sched_can_queue(struct
>>> drm_gpu_scheduler
>>> *sched)
>>> =C2=A0 *
>>> =C2=A0 * Wake up the scheduler if we can queue jobs.
>>> =C2=A0 */
>>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, =
struct
>>> drm_sched_entity *entity)
>>> =C2=A0{
>>> - if (drm_sched_can_queue(sched))
>>> - wake_up_interruptible(&sched->wake_up_worker);
>>> + if(drm_sched_entity_is_ready(entity))
>>> + if (drm_sched_can_queue(sched))
>>> + wake_up_interruptible(&sched->wake_up_worker);
>>> =C2=A0}
>>>
>>> =C2=A0/**
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
>>> index ac65f0626cfc..6cfe3d193e69 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -548,7 +548,7 @@ void drm_sched_entity_modify_sched(struct
>>> drm_sched_entity
>>> *entity,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsign=
ed int num_sched_list);
>>>
>>> =C2=A0void drm_sched_job_cleanup(struct drm_sched_job *job);
>>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);=

>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, =
struct
>>> drm_sched_entity *entity);
>>> =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm=
_sched_job
>>> *bad);
>>> =C2=A0void drm_sched_start(struct drm_gpu_scheduler *sched, bool full=
_recovery);
>>> =C2=A0void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>>>
>>> This brings the extra check to the old scheduler and has so far not c=
aused
>>> any
>>> trouble (using the same stress test described above), so chances are =
that
>>> the
>>> error is somewhere else in redesigned scheduler.
>>>
>>>
>>> Bert Karwatzki
>>
>> Hi Bert,
>>
>> Thanks for looking into this.
>>
>> As an afterthought, removing the "entity_is_ready()" qualifier in wake=
-up,
>> makes
>> the scheduling more opportunistic, and I agree that that is the more c=
orrect
>> approach.
>> Commit f3123c2590005, basically made the code as close to the way it
>> functioned before
>> the move to run-queues.
>>
>> Would you like to create a patch for this?
>=20
> Should I create the patch (is a simple revert of f3123c.. + explaining =
commit
> message enough?) for the drm-misc tree?

Yes, that'd be awesome!

Please CC all the people in this email, and also if you could --in-reply-=
to=3D
the last message in this thread with all the CC and all--an easy way to
do this is to just copy the "git send-email" line from lore.kernel.org. T=
hanks!

> Also, I did a little more experimentation: I applied f3123c25900 on top=

> of=C2=A0commit a6149f0393699 and commit 35963cf2cd25e to see where the =
problems
> start. The result is that f3.. + a6.. leads to lock ups while f3.. + 35=
=2E. seems
> to be fine so the problems starts with the move from kthread to work qu=
eue.

Outstanding! Thank you Bert for doing all this testing.

So while the conclusion might be that a6 is the problem, it really is not=
=2E
Scheduling (CPU/GPU) is a fickle thing and care and deep thought needs to=
 be exercised
when implementing it--it really is not a trivial thing.

See the thread responses starting with this email:
https://lore.kernel.org/all/d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.in=
tel.com/

Yes, to avoid lock-ups we should revert f3.

However, I think that we should go further and have drm_sched_wakeup() ca=
ll
drm_sched_run_job_queue() unconditionally. drm_sched_run_job_work() does =
do its
own checks whether to continue or dequeue, and traditionally it's been do=
ne like this
to avoid races.

Could you also test with,

void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
		      struct drm_sched_entity *entity)
{
	drm_sched_run_job_queue(sched);
}

IOW, traditionally, a scheduler wake-up is uni-directional, i.e.,
	free up a resource,
	wake up thread waiting to use it;
The resource could be, for instance, adding an item to a queue, atomicall=
y, etc., etc.
What is important however, is that there is no decision making in this pr=
ocess.
The modified version of drm_sched_wakeup() above achieves this one-direct=
ion.

In our wake-up, we check whether to schedule work, and using the same
checks it does when after it's scheduled and running. The former could le=
ad to problems. I did mention
in the linked thread above that the worst we get is an extra wake-up and =
extra check, in a string
of schedules, so the overhead would be 1/#(runs of drm_sched_run_job_work=
), i.e. the longer the string
of schedules, the smaller the overhead.

Thanks again!
--=20
Regards,
Luben

--------------Qbe6ldnkUUbC14tz7smz0Hjx
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

--------------Qbe6ldnkUUbC14tz7smz0Hjx--

--------------dnTw3oOd0FXZcuoVhXW56kW9--

--------------btl9PZaaOazfcI0Ow0SN03rk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWJS/gUDAAAAAAAKCRBMFUeUMaM0ryQi
AP9vVMuwnLiqO/WP8PdTCPdT3V4+LnetKwHTYiiA9DPYXgEAiOG19R/5YLjmY6k6WrRm2O39ePIQ
+gyXdQVUDiu6hA0=
=EYYJ
-----END PGP SIGNATURE-----

--------------btl9PZaaOazfcI0Ow0SN03rk--
