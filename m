Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764B7E754A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 00:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6B710E075;
	Thu,  9 Nov 2023 23:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4906F10E075;
 Thu,  9 Nov 2023 23:49:27 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-77a277eb084so94083685a.2; 
 Thu, 09 Nov 2023 15:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699573766; x=1700178566; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ApLnHJvJXH0pE81/zw7BCzdBWO74xGUsnadGBwzyyUc=;
 b=ChxGrRJDtX67Lg5sWCjm5TWAS4mc6FBQ6In/A+ofM20VJjkEOrBiB5EBupZyG9E/OZ
 bAfFm6AaAww6uJSeewjwGakQCR9CDBw4dGannjxOhC6sxv+c9hk2HweAUbKao8+IKAdb
 1+RoXgrKeSYZ+DBT/shJ+YiQ3nVhzUgYunQVO4z3mGJ8ljMEWD2wPzXWLyTPwDvyE+kw
 mkg73f/8JqybcOmVC4BVVmd2sIGoFZFwPVp7klqlNN7lB7SGpS8qA2abCVYZ0zsdpQIi
 x5JGC9n011OaOm6rNifV8e5RZimrETeaG2+CAIKExVHtHEBPTqnnH9w/k2fOSix1zyRL
 mwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699573766; x=1700178566;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApLnHJvJXH0pE81/zw7BCzdBWO74xGUsnadGBwzyyUc=;
 b=joJHsAlp5lZ9gQJ2Bebwd3w8hktSNsk+Awc4GU0jhx5HpahNqz+ILnEJdYLfgDYJuS
 WoNUMWBIWvzd3tQLVPGXfCe2vkjnaCDGCSobX1gnmL7c1NeFbfXwQyOMq+jICRSAn1Uf
 EbuJUu6jlXjqf5yWlJ3YLvEMf3N0kmzdPSNxiWAJovE7rTOUF4YQq11UzxWH8GOZQVh4
 nSBMQgDFCQ35Jpu6OLwOeKBKGMQSHYd7dlry6mAHNWJv+wJQul3kbmWsocbcTmYdu4Rk
 FgzVcC+/ei66Ku5FOU8zOejOc/W0srnSr/DVn5rw6sBKw1jhQQDrodiWNEII5RTJ3p9j
 s88Q==
X-Gm-Message-State: AOJu0Yym3GkSQtzAmPat5pRaCzOHdKEzNXcN1omvJFWX3nWPSS/2NaFW
 9OPUtHlnbTciue9H992CkNg=
X-Google-Smtp-Source: AGHT+IEHKoQKiWU1ioOYsWf/1MbDmii6/C3bN35ocZQsVPANSGTn++tSo6a/bLiheQJzfrcgvZBJFw==
X-Received: by 2002:ad4:5aaa:0:b0:66d:a20f:ecfb with SMTP id
 u10-20020ad45aaa000000b0066da20fecfbmr7264664qvg.37.1699573766102; 
 Thu, 09 Nov 2023 15:49:26 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 mk23-20020a056214581700b0066d20f29e5fsm2502191qvb.35.2023.11.09.15.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 15:49:24 -0800 (PST)
Message-ID: <6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com>
Date: Thu, 9 Nov 2023 18:49:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <70fb8d33-6b39-433f-8fa3-76883001ed68@redhat.com>
 <603b1390-3593-4056-a29b-261b7f635ff6@gmail.com>
 <da463288-5c22-4786-bc75-ec21ae9cf96c@redhat.com>
 <6170dbc1-e8ab-41e9-916b-ccdc2be7ac6b@redhat.com>
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
In-Reply-To: <6170dbc1-e8ab-41e9-916b-ccdc2be7ac6b@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v93PPLjjSUfbjxIn0L1Nnihd"
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, lina@asahilina.net, mcanal@igalia.com,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v93PPLjjSUfbjxIn0L1Nnihd
Content-Type: multipart/mixed; boundary="------------ALtufUoo2XmqMIO2j93Z5VlK";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, tvrtko.ursulin@linux.intel.com
Cc: Liviu.Dudau@arm.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, donald.robson@imgtec.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 intel-xe@lists.freedesktop.org, ketil.johnsen@arm.com, lina@asahilina.net,
 matthew.brost@intel.com, mcanal@igalia.com, robdclark@chromium.org,
 sarah.walker@imgtec.com
Message-ID: <6273fadf-267a-4965-82ab-89c5b3f28cf2@gmail.com>
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <70fb8d33-6b39-433f-8fa3-76883001ed68@redhat.com>
 <603b1390-3593-4056-a29b-261b7f635ff6@gmail.com>
 <da463288-5c22-4786-bc75-ec21ae9cf96c@redhat.com>
 <6170dbc1-e8ab-41e9-916b-ccdc2be7ac6b@redhat.com>
In-Reply-To: <6170dbc1-e8ab-41e9-916b-ccdc2be7ac6b@redhat.com>

--------------ALtufUoo2XmqMIO2j93Z5VlK
Content-Type: multipart/mixed; boundary="------------Yo2cVoXmPWtbjWwsYqCb6OfZ"

--------------Yo2cVoXmPWtbjWwsYqCb6OfZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-09 18:41, Danilo Krummrich wrote:
> On 11/9/23 20:24, Danilo Krummrich wrote:
>> On 11/9/23 07:52, Luben Tuikov wrote:
>>> Hi,
>>>
>>> On 2023-11-07 19:41, Danilo Krummrich wrote:
>>>> On 11/7/23 05:10, Luben Tuikov wrote:
>>>>> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().=C2=
=A0 In fact,
>>>>> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(=
), and let
>>>>> it do just that, schedule the work item for execution.
>>>>>
>>>>> The problem is that drm_sched_run_job_queue() calls drm_sched_selec=
t_entity()
>>>>> to determine if the scheduler has an entity ready in one of its run=
-queues,
>>>>> and in the case of the Round-Robin (RR) scheduling, the function
>>>>> drm_sched_rq_select_entity_rr() does just that, selects the _next_ =
entity
>>>>> which is ready, sets up the run-queue and completion and returns th=
at
>>>>> entity. The FIFO scheduling algorithm is unaffected.
>>>>>
>>>>> Now, since drm_sched_run_job_work() also calls drm_sched_select_ent=
ity(), then
>>>>> in the case of RR scheduling, that would result in drm_sched_select=
_entity()
>>>>> having been called twice, which may result in skipping a ready enti=
ty if more
>>>>> than one entity is ready. This commit fixes this by eliminating the=
 call to
>>>>> drm_sched_select_entity() from drm_sched_run_job_queue(), and leave=
s it only
>>>>> in drm_sched_run_job_work().
>>>>>
>>>>> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Add fixes-tag. (Tvrtko)
>>>>>
>>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>>>> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work ite=
m")
>>>>> ---
>>>>> =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------=
------
>>>>> =C2=A0=C2=A0 1 file changed, 3 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
>>>>> index 27843e37d9b769..cd0dc3f81d05f0 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sc=
hed_rq *rq)
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 /**
>>>>> - * __drm_sched_run_job_queue - enqueue run-job work
>>>>> + * drm_sched_run_job_queue - enqueue run-job work
>>>>> =C2=A0=C2=A0=C2=A0 * @sched: scheduler instance
>>>>> =C2=A0=C2=A0=C2=A0 */
>>>>> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sc=
hed)
>>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sche=
d)
>>>>> =C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!READ_ONCE(sched->pause_su=
bmit))
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue_=
work(sched->submit_wq, &sched->work_run_job);
>>>>> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_=
scheduler *sched)
>>>>> =C2=A0=C2=A0 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)=

>>>>> =C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched)=
)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched_run_job_que=
ue(sched);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_run_job_queue=
(sched);
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 /**
>>>>> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler=
 **sched_list,
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 EXPORT_SYMBOL(drm_sched_pick_best);
>>>>> -/**
>>>>> - * drm_sched_run_job_queue - enqueue run-job work if there are rea=
dy entities
>>>>> - * @sched: scheduler instance
>>>>> - */
>>>>> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sche=
d)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0 if (drm_sched_select_entity(sched))
>>>>
>>>> Hm, now that I rebase my patch to implement dynamic job-flow control=
 I recognize that
>>>> we probably need the peek semantics here. If we do not select an ent=
ity here, we also
>>>> do not check whether the corresponding job fits on the ring.
>>>>
>>>> Alternatively, we simply can't do this check in drm_sched_wakeup(). =
The consequence would
>>>> be that we don't detect that we need to wait for credits to free up =
before the run work is
>>>> already executing and the run work selects an entity.
>>>
>>> So I rebased v5 on top of the latest drm-misc-next, and looked around=
 and found out that
>>> drm_sched_wakeup() is missing drm_sched_entity_is_ready(). It should =
look like the following,
>>
>> Yeah, but that's just the consequence of re-basing it onto Tvrtko's pa=
tch.
>>
>> My point is that by removing drm_sched_select_entity() from drm_sched_=
run_job_queue() we do not
>> only loose the check whether the selected entity is ready, but also wh=
ether we have enough
>> credits to actually run a new job. This can lead to queuing up work th=
at does nothing but calling
>> drm_sched_select_entity() and return.
>=20
> Ok, I see it now.  We don't need to peek, we know the entity at drm_sch=
ed_wakeup().
>=20
> However, the missing drm_sched_entity_is_ready() check should have been=
 added already when
> drm_sched_select_entity() was removed. Gonna send a fix for that as wel=
l.

Let me do that, since I added it to your patch.
Then you can rebase your credits patch onto mine.

--=20
Regards,
Luben

--------------Yo2cVoXmPWtbjWwsYqCb6OfZ
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

--------------Yo2cVoXmPWtbjWwsYqCb6OfZ--

--------------ALtufUoo2XmqMIO2j93Z5VlK--

--------------v93PPLjjSUfbjxIn0L1Nnihd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZU1v+wUDAAAAAAAKCRBMFUeUMaM0r2ZS
AP4vMNmPCVDs5J3pVPv0+66/igjpWe5+M1A6Xrwg9wpdzgEAq+7DOW85H1pqM522MRHnp0EF518Q
KiqFHA4FSEzOawo=
=QShB
-----END PGP SIGNATURE-----

--------------v93PPLjjSUfbjxIn0L1Nnihd--
