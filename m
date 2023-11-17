Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B77EEB57
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 04:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F4010E63D;
	Fri, 17 Nov 2023 03:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C4010E63D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 03:18:30 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-778a47bc09aso91598985a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700191109; x=1700795909; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:content-language:references:cc:to:subject
 :from:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IvuM4l946cAU+cBhVcR/TEOQCNNzFmbkyMzXpfUXVH4=;
 b=UyI6f7tEbXkFp2/SraYjmFgvYTPLBLy/mmNNBcEb4SbfWnSP5QdNHyH0g+Ccn0L7ae
 tJqLp0I61PUU6l322A5CwLoP8JJgZlyA+fekHgpnssno0C3ulc7plAiHCiAVKnoB0NJu
 E9Ohh0f+ML1iDy7roAJc7VD9oH44PPbhqSkLrs38VKvj6494IXrUqn9t66bjkrlNlK/x
 SqUcKCkeXB9Pp5UpzfGX/CJHgAqNBxy752HHBgrbz2Ie//pJ0H7CUDfdK9nLDeOlXCGV
 cBqwcDLU8VghNwRF93R3dtyeFg1cCWLcNG+pb+u1hzF78Jr+8E4lIQIoccK0j5jxHuDP
 cFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700191109; x=1700795909;
 h=in-reply-to:autocrypt:content-language:references:cc:to:subject
 :from:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IvuM4l946cAU+cBhVcR/TEOQCNNzFmbkyMzXpfUXVH4=;
 b=wGhsxZGUQmGxKfND0QtsxuOBbIKQN9vEkHtM6Dkpg0WrZDRYoNwjXLqUKYcf6exK4t
 fJWJ3BTUmVu/4bnRPYofOd51qC75hTURCEAMAbQqL+tL/lFC/qK8unz/YgS4Hlmlbaq4
 Qyuqn/to5kEgZhkQxZ2aliatK7kObIVStMyDaFrJN7lWOMg158RnamdxbIYj5A50TM+4
 JyNdFmtoJpok5VIFltEV4M7MKHX4yQszMfSWfpa45/dBeyBr64fxF5m1PlL0PUCp7lYA
 z39J9tfPs10BOCAeZR36E1kmnGbPht2KFroV3qOg7l1ntOdKcTfeoNPK24pHANQ6yPVS
 snVQ==
X-Gm-Message-State: AOJu0YwNCX07eBarMA/m8tFBxv3hoWu9hnLo+b1ruIRSLZdnEf4NZaNr
 BI1tPiQE4mH4DjneHgBCcPA=
X-Google-Smtp-Source: AGHT+IGmdB8s0V113Xq3/hqZCckBEYr1tJpCLgEDcYKYk1hetXA0mUxg8TVv7i5ivV2wqorP9xA9Rg==
X-Received: by 2002:a05:620a:29cb:b0:777:326d:83de with SMTP id
 s11-20020a05620a29cb00b00777326d83demr10800700qkp.56.1700191109502; 
 Thu, 16 Nov 2023 19:18:29 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a05620a0c5500b007759a81d88esm300677qki.50.2023.11.16.19.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 19:18:28 -0800 (PST)
Message-ID: <bffaa7eb-05e4-4842-b199-f03a46036414@gmail.com>
Date: Thu, 16 Nov 2023 22:18:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.3
From: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/scheduler: improve GPU scheduler documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexander.deucher@amd.com
References: <20231113123832.120710-1-christian.koenig@amd.com>
Content-Language: en-CA, en-US
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20231113123832.120710-1-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fnACaQ8009B0lpfHGaxhqVLS"
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fnACaQ8009B0lpfHGaxhqVLS
Content-Type: multipart/mixed; boundary="------------xevBy6bxCgVNTWIXMB4Jj5JA";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexander.deucher@amd.com
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-ID: <bffaa7eb-05e4-4842-b199-f03a46036414@gmail.com>
Subject: Re: [PATCH] drm/scheduler: improve GPU scheduler documentation
References: <20231113123832.120710-1-christian.koenig@amd.com>
In-Reply-To: <20231113123832.120710-1-christian.koenig@amd.com>

--------------xevBy6bxCgVNTWIXMB4Jj5JA
Content-Type: multipart/mixed; boundary="------------0Oe0R27QGSgiLep46F3QL9yQ"

--------------0Oe0R27QGSgiLep46F3QL9yQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-13 07:38, Christian K=C3=B6nig wrote:
> Start to improve the scheduler document. Especially document the
> lifetime of each of the objects as well as the restrictions around
> DMA-fence handling and userspace compatibility.

Thanks Christian for doing this--much needed.

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 126 ++++++++++++++++++++-----=

>  1 file changed, 104 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 506371c42745..36a7c5dc852d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,110 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push j=
obs
> - * into software queues which are then scheduled on a hardware run que=
ue.
> - * The software queues have a priority among them. The scheduler selec=
ts the entities
> - * from the run queue using a FIFO. The scheduler provides dependency =
handling
> - * features among jobs. The driver is supposed to provide callback fun=
ctions for
> - * backend operations to the scheduler like submitting a job to hardwa=
re run queue,
> - * returning the dependencies of a job etc.

So, I don't mind this paragraph, as it provides an overview or the relati=
onship between
a DRM GPU scheduler, entities, run-queues, and jobs.

> - *
> - * The organisation of the scheduler is the following:
> - *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities=

> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be schedu=
led on
> - *    the hardware.

This is also good, and shouldn't have been deleted.

> - *
> - * The jobs in a entity are always scheduled in the order that they we=
re pushed.

I'd have said here "jobs within an entity". Again shouldn't have been del=
eted.
This is good overall/overview information.

> - *
> - * Note that once a job was taken from the entities queue and pushed t=
o the
> - * hardware, i.e. the pending queue, the entity must not be referenced=
 anymore
> - * through the jobs entity pointer.
> + * The GPU scheduler implements some logic to decide which command sub=
mission
> + * to push next to the hardware. Another major use case for the GPU sc=
heduler
> + * is to enforce correct driver behavior around those command submissi=
on.

The GPU scheduler also enforces correct driver behaviour around those com=
mand submissions.

> + * Because of this it's also used by drivers which don't need the actu=
al
> + * scheduling functionality.

=2E.. but need to push jobs into their firmware/hardware and maintain/kee=
p correct
DRM dependencies in the form of "fences".

> + *
> + * To fulfill this task the GPU scheduler uses of the following object=
s:
> + *
> + * 1. The job object which contains a bunch of dependencies in the for=
m of

Drop "which".

Instead of listing what it contains, how it is used, what it does, explai=
n
what it is: work/task to be executed by the GPU. _Then_ you can start lis=
ting
what it contains, how it is used, what it does.

> + *    DMA-fence objects. Drivers can also implement an optional prepar=
e_job
> + *    callback which returns additional dependencies as DMA-fence obje=
cts.

"can also"? This would usually follow if the other callbacks/etc., have b=
een described
and they haven't, so I'd say "Drivers implement an optional prepare_job c=
allback,..."

> + *    It's important to note that this callback must follow the DMA-fe=
nce rules,
> + *    so it can't easily allocate memory or grab locks under which mem=
ory is
> + *    allocated. Drivers should use this as base class for an object w=
hich
> + *    contains the necessary state to push the command submission to t=
he
> + *    hardware.
> + *
> + *    The lifetime of the job object should at least be from pushing i=
t into the
> + *    scheduler until the scheduler notes through the free callback th=
at a job
> + *    isn't needed any more. Drivers can of course keep their job obje=
ct alive
> + *    longer than that, but that's outside of the scope of the schedul=
er
> + *    component.

[New paragraph starts describing the job initialization.]

Add:  Job initialization is split into two parts,
> + *    drm_sched_job_init() and drm_sched_job_arm().

Perhaps we should mention briefly what each one does..?

Add:  It's important to note that
> + *    after arming a job drivers must follow the DMA-fence rules and c=
an't
> + *    easily allocate memory or takes locks under which memory is allo=
cated.
> + *
> + * 2. The entity object which is a container for jobs which should exe=
cute

Drop "which". "The entity object is a container of ..."

> + *    sequentially. Drivers should create an entity for each individua=
l context
> + *    they maintain for command submissions which can run in parallel.=


This isn't very clear, but can be made so by: "they maintain for command =
submissions."
"Entities' jobs can run in parallel as facilitated by the GPU."

> + *
> + *    The lifetime of the entity should *not* exceed the lifetime of t=
he
> + *    userspace process it was created for and drivers should call the=

> + *    drm_sched_entity_flush() function from their file_operations.flu=
sh
> + *    callback.=20

Okay... they should... WHEN? When we use "should do something" we always =
clarify with "when xyz happens."

Add:  Background is that for compatibility reasons with existing
> + *    userspace all results of a command submission should become visi=
ble

"Background" --> "The reason for this is for compatibility with existing =
=2E.."

> + *    externally even after after a process exits. The only exception =
to that

Remove one of the two "after".

> + *    is when the process is actively killed by a SIGKILL. In this cas=
e the
> + *    entity object makes sure that jobs are freed without running the=
m while
> + *    still maintaining correct sequential order for signaling fences.=
 So it's
> + *    possible that an entity object is not alive any more while jobs =
from it

"to not be alive"
(This paragraph here, including SIGKILL, could be made clearer, by splitt=
ing it in two
parts. One describing normal behaviour, i.e. SIGTERM, and the other descr=
ibing SIGKILL.)

> + *    are still running on the hardware.
> + *
> + * 3. The hardware fence object which is a DMA-fence provided by the d=
river as

Drop "which". "The hardware fence object is a DMA-fence which is provided=
 by the driver
as _a_ result of running a job/jobs."

> + *    result of running jobs. Drivers need to make sure that the norma=
l
> + *    DMA-fence semantics are followed for this object. It's important=
 to note

"DMA-fence semantics" are mentioned several times so far, and a link to a=
 description
of said semantics (or NULL if none is in the kernel)--would be nice to pu=
t.

> + *    that the memory for this object can *not* be allocated in the ru=
n_job
> + *    callback since that would violate the requirements for the DMA-f=
ence
> + *    implementation.

Is it "no allocation" or just "allocation for this object" in run_job?
(Or maybe no kernel allocation..., we should probably clarify this.)

Add:  The scheduler maintains a timeout handler which triggers
> + *    if this fence doesn't signal in a configurable time frame.
> + *
> + *    The lifetime of this object follows DMA-fence ref-counting rules=
, the
> + *    scheduler takes ownership of the reference returned by the drive=
r and
> + *    drops it when it's not needed any more. Errors should also be si=
gnaled
> + *    through the hardware fence and are bubbled up back to the schedu=
ler fence

By whom?
"through the hardware fence by the driver, and are ..."

> + *    and entity.
> + *
> + * 4. The scheduler fence object which encapsulates the whole time fro=
m pushing
> + *    the job into the scheduler until the hardware has finished proce=
ssing it.

Perhaps drop "time encapsulation."

It's not very clear what you want to say here. Perhaps, use "exists" and =
drop "which", as in:
4. The scheduler fence object exists/is ref-ed by DRM, etc., from the tim=
e when the job is
pushed into the scheduler until the hardware has finished with it.

If fence signaling is involved in those two steps, it should be noted her=
e.

If this is about ownership, it should be simply stated.

> + *    This is internally managed by the scheduler, but drivers can gra=
b
> + *    additional reference to it after arming a job. The implementatio=
n

Instead of "implementation" perhaps use "DRM scheduler code?"

> + *    provides DMA-fence interfaces for signaling both scheduling of a=
 command
> + *    submission as well as finishing of processing.

I'd clarify with
	"provides DMA-fence interfaces for drivers, for the scheduling of a comm=
and
	 submission, akin to the start of a command, and finishing command proce=
ssing."

Perhaps we can also mention when drivers are supposed to call these...?

> + *
> + *    The lifetime of this object also follows normal DMA-fence ref-co=
unting
> + *    rules. The finished fence is the one normally exposed outside of=
 the
> + *    scheduler, but the driver can grab references to both the schedu=
led as
> + *    well as the finished fence when needed for pipe-lining optimizat=
ions.
> + *
> + * 5. The run queue object which is a container of entities for a cert=
ain
> + *    priority level. The lifetime of those objects are bound to the s=
cheduler
> + *    lifetime.

"which is" --> "is"
"entities for a certain" --> "entities of a certain"

> + *
> + *    This is internally managed by the scheduler and drivers shouldn'=
t touch
> + *    them directly.
> + *
> + * 6. The scheduler object itself which does the actual work of select=
ing a job
> + *    and pushing it to the hardware. Both FIFO and RR selection algor=
ithm are
> + *    supported, but FIFO is preferred for many use cases.

Let's drop "which" and just say "The scheduler object does the actual wor=
k of ..."

> + *
> + *    The lifetime of this object is managed by the driver using it. B=
efore
> + *    destroying the scheduler the driver must ensure that all hardwar=
e
> + *    processing involving this scheduler object has finished by calli=
ng for
> + *    example disable_irq(). It is *not* sufficient to wait for the ha=
rdware
> + *    fence here since this doesn't guarantee that all callback proces=
sing has
> + *    finished.

Okay, and perhaps we could mention drm_sched_fini() here.

> + *
> + * All callbacks the driver needs to implement are restricted by DMA-f=
ence
> + * signaling rules to guarantee deadlock free forward progress. This e=
specially
> + * means that for normal operation no memory can be allocated. All mem=
ory which

Need a pointer to the "DMA-fence signaling rules" and also need to define=
 "normal operation",
or clarify it in the sentence.

> + * is needed for pushing the job to the hardware must be allocated bef=
ore
> + * arming a job. It also means that no locks can be taken under which =
memory
> + * might be allocated as well.

Yes, that makes sense. I think this is generally the case for driver and =
firmware
writers, and I'd think is common sense, but it is good to have it in writ=
ing.

> + *
> + * Memory which is optional to allocate for device core dumping or deb=
ugging
> + * *must* be allocated with GFP_NOWAIT and appropriate error handling =
taking if
> + * that allocation fails. GFP_ATOMIC should only be used if absolutely=

> + * necessary since dipping into the special atomic reserves is usually=
 not
> + * justified for a GPU driver.

Yes, that's well said. Good to have it here.

> + *
> + * The scheduler also used to provided functionality for re-submitting=
 jobs

"The scheduler also used ..." --> "The scheduler is also used ..."

> + * with replacing the hardware fence during reset handling. This funct=
ionality
> + * is now marked as deprecated since this has proven to be fundamental=
ly racy
> + * and not compatible with DMA-fence rules and shouldn't be used in an=
y new
> + * code.

I wouldn't use a contraction here. In order to emphasize that job re-subm=
ission
is depreciated, I'd use:
	"and should not be used in any new code."

>   */
> =20
>  #include <linux/kthread.h>

--=20
Regards,
Luben


--------------0Oe0R27QGSgiLep46F3QL9yQ
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

--------------0Oe0R27QGSgiLep46F3QL9yQ--

--------------xevBy6bxCgVNTWIXMB4Jj5JA--

--------------fnACaQ8009B0lpfHGaxhqVLS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVbbewUDAAAAAAAKCRBMFUeUMaM0r/3F
AP4g+FdELpisIMThz2t4noq97PsCYehrWh/V6/DU9aq4ewD9GaEx0Qu+UpZCM2BFh6N5BuARG10N
D2phmx7d5UqLdgg=
=//0P
-----END PGP SIGNATURE-----

--------------fnACaQ8009B0lpfHGaxhqVLS--
