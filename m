Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E67FE7B0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 04:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A323F10E0FD;
	Thu, 30 Nov 2023 03:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AC110E0FA;
 Thu, 30 Nov 2023 03:36:22 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-67a4645fdc3so2727026d6.0; 
 Wed, 29 Nov 2023 19:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701315381; x=1701920181; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2PHS4YlhuMwAw3gouh5uyxuL0JDRJm67/1dyEH8GClk=;
 b=ZW3y7ZyUJ12KpUo10UJ1E0ExmDQQJyCwF+3OtWFjmHROxrFO5x1O1K3JEaakPa1voi
 HBJDVvyPpMr//Tn8aQ0B1Ja5EQQ3uhntxrA168sO86sehj862Nndqp+pVWZkK4Jyt+eP
 ACg1Cm1jGFhExouMvsMG/neyLamEvqXIylLSW9PXOITf5Z7rYnqVCDhTILtzXLRUFpgZ
 6ihBOMGkt/fQ4oL5xoGWA611Ud3spDzjG3fBLoQf7Xo+vgbdnec4VedbEXu4tCrKrwyk
 GEC56hR5AnQ1hTwXHWErquDnbl6/YY246TU3zIXqqdO3mQn5PPX4rtqp7deJURrCxtoJ
 FQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701315381; x=1701920181;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2PHS4YlhuMwAw3gouh5uyxuL0JDRJm67/1dyEH8GClk=;
 b=JukSQVhHdCDVdeq9OMhkFX7mNcf5MhZrUC52TM95pqrSEV34yrEHQNA6RKjGchW7pC
 IAB9E8v1NZMU76cSVsjq0Lav0QNGrckTE9Y8G0AUPhTpCC6UAqTAfSOHlvSHnN3EqE5k
 SSyaJdCJZ2ELlTwiXjRwE133yBVbIE2GdLC3SL25WmOD4y/eIxPlNMvkX7LG2NNim8cN
 VIR8WOzjNQZhUnxkGdLSmXxzAsv51SKHtgxoZJosQTcviBqXhMZ5wNT0gwThOijOxSWM
 WX303S+ZKuvHCPhIYK8LPKnQW3V1HYPcYl3N7bZImcVcFbTdSqz383d/GrmCv6mwfyXL
 5T4g==
X-Gm-Message-State: AOJu0YzddujRI6Ip0ML/HrKA6+zFsIne8FfkthRvKUO3F60OXslT02oi
 9oTEHg2YOWMaDXhiBykjl1A=
X-Google-Smtp-Source: AGHT+IHLBfhfdZnM3tyL0AlehBW2kvTjWZkEkQyFUNwsb5cSx1v8trFslFjg27932gcyBi2b+VcunA==
X-Received: by 2002:ad4:4e02:0:b0:66f:bcc5:cf70 with SMTP id
 dl2-20020ad44e02000000b0066fbcc5cf70mr20258892qvb.42.1701315381203; 
 Wed, 29 Nov 2023 19:36:21 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 rq7-20020a05620a674700b0077893a5a80esm96427qkn.123.2023.11.29.19.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 19:36:20 -0800 (PST)
Message-ID: <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
Date: Wed, 29 Nov 2023 22:36:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.1
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-CA, en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
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
In-Reply-To: <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZbIxeGbw3NzBMpe07AmuMpvg"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZbIxeGbw3NzBMpe07AmuMpvg
Content-Type: multipart/mixed; boundary="------------TgjR6nihfsXk5OlhbbIXgqPn";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Message-ID: <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
In-Reply-To: <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>

--------------TgjR6nihfsXk5OlhbbIXgqPn
Content-Type: multipart/mixed; boundary="------------YooC07uup0M40PSX0m0ZER07"

--------------YooC07uup0M40PSX0m0ZER07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-29 15:49, Alex Deucher wrote:
> On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
=2Ecom> wrote:
>>
>> Actually I think I see the problem.  I'll try and send out a patch
>> later today to test.
>=20
> Does the attached patch fix it?

Thanks for the patch, Alex.

Is it possible for AMD to also reproduce this issue and test this patch o=
n a Navi23 system?

> From 96e75b5218f7a124eafa53853681eef8fe567ab8 Mon Sep 17 00:00:00 2001
> From: Alex Deucher <alexander.deucher@amd.com>
> Date: Wed, 29 Nov 2023 15:44:25 -0500
> Subject: [PATCH] drm/amdgpu: fix buffer funcs setting order on suspend
>=20
> We need to make disable this after the last eviction

"make disable" --> "disable"

> call, but before we disable the SDMA IP.
>=20
> Fixes: b70438004a14 ("drm/amdgpu: move buffer funcs setting up a level"=
)
> Link: https://lists.freedesktop.org/archives/amd-gfx/2023-November/1011=
97.html

Link: https://lore.kernel.org/r/87edgv4x3i.fsf@vps.thesusis.net

Let's link the start of the thread.

Regards,
Luben

> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Phillip Susi <phill@thesusis.net>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> index b5edf40b5d03..78553e027db4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4531,8 +4531,6 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
> =20
>  	amdgpu_ras_suspend(adev);
> =20
> -	amdgpu_ttm_set_buffer_funcs_status(adev, false);
> -
>  	amdgpu_device_ip_suspend_phase1(adev);
> =20
>  	if (!adev->in_s0ix)
> @@ -4542,6 +4540,8 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
>  	if (r)
>  		return r;
> =20
> +	amdgpu_ttm_set_buffer_funcs_status(adev, false);
> +
>  	amdgpu_fence_driver_hw_fini(adev);
> =20
>  	amdgpu_device_ip_suspend_phase2(adev);

>=20
> Alex
>=20
>>
>> Alex
>>
>> On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmai=
l.com> wrote:
>>>
>>> On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmai=
l.com> wrote:
>>>>
>>>> On 2023-11-29 10:22, Alex Deucher wrote:
>>>>> On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@g=
mail.com> wrote:
>>>>>>
>>>>>> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@g=
mail.com> wrote:
>>>>>>>
>>>>>>> On 2023-11-28 17:13, Alex Deucher wrote:
>>>>>>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thes=
usis.net> wrote:
>>>>>>>>>
>>>>>>>>> Alex Deucher <alexdeucher@gmail.com> writes:
>>>>>>>>>
>>>>>>>>>>> In that case those are the already known problems with the sc=
heduler
>>>>>>>>>>> changes, aren't they?
>>>>>>>>>>
>>>>>>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Mayb=
e I'm
>>>>>>>>>> misunderstanding what the original report was actually testing=
=2E  If it
>>>>>>>>>> was 6.7, then try reverting:
>>>>>>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>>>>>>>>> b70438004a14f4d0f9890b3297cd66248728546c
>>>>>>>>>
>>>>>>>>> At some point it was suggested that I file a gitlab issue, but =
I took
>>>>>>>>> this to mean it was already known and being worked on.  -rc3 ca=
me out
>>>>>>>>> today and still has the problem.  Is there a known issue I coul=
d track?
>>>>>>>>>
>>>>>>>>
>>>>>>>> At this point, unless there are any objections, I think we shoul=
d just
>>>>>>>> revert the two patches
>>>>>>> Uhm, no.
>>>>>>>
>>>>>>> Why "the two" patches?
>>>>>>>
>>>>>>> This email, part of this thread,
>>>>>>>
>>>>>>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
>>>>>>>
>>>>>>> clearly states that reverting *only* this commit,
>>>>>>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable n=
umber of run-queues
>>>>>>> *does not* mitigate the failed suspend. (Furthermore, this commit=
 doesn't really change
>>>>>>> anything operational, other than using an allocated array, instea=
d of a static one, in DRM,
>>>>>>> while the 2nd patch is solely contained within the amdgpu driver =
code.)
>>>>>>>
>>>>>>> Leaving us with only this change,
>>>>>>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
>>>>>>> to be at fault, as the kernel log attached in the linked email ab=
ove shows.
>>>>>>>
>>>>>>> The conclusion is that only b70438004a14f4 needs reverting.
>>>>>>
>>>>>> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14=
f4,
>>>>>> 56e449603f0ac5 breaks amdgpu.
>>>>>
>>>>> We can try and re-enable it in the next kernel.  I'm just not sure
>>>>> we'll be able to fix this in time for 6.7 with the holidays and all=

>>>>> and I don't want to cause a lot of scheduler churn at the end of th=
e
>>>>> 6.7 cycle if we hold off and try and fix it.  Reverting seems like =
the
>>>>> best short term solution.
>>>>
>>>> A lot of subsequent code has come in since commit 56e449603f0ac5, as=
 it opened
>>>> the opportunity for a 1-to-1 relationship between an entity and a sc=
heduler.
>>>> (Should've always been the case, from the outset. Not sure why it wa=
s coded as
>>>> a fixed-size array.)
>>>>
>>>> Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and =
the problem
>>>> is wholly contained in amdgpu, and no other driver has this problem,=
 there is
>>>> no reason to have to "churn", i.e. go back and forth in DRM, only to=
 cover up
>>>> an init bug in amdgpu. See the response I just sent in @this thread:=

>>>> https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail=
=2Ecom
>>>>
>>>> And it's not like this issue is unknown. I first posted about it on =
2023-10-16.
>>>>
>>>> Ideally, amdgpu would just fix their init code.
>>>
>>> You can't make changes to core code that break other drivers.
>>> Arguably 56e449603f0ac5 should not have gone in in the first place if=

>>> it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
>>> code, but as a side effect it seems to have broken suspend for some
>>> users.
>>>
>>> Alex

--------------YooC07uup0M40PSX0m0ZER07
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

--------------YooC07uup0M40PSX0m0ZER07--

--------------TgjR6nihfsXk5OlhbbIXgqPn--

--------------ZbIxeGbw3NzBMpe07AmuMpvg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWgDKwUDAAAAAAAKCRBMFUeUMaM0r4f/
AQDByPIw/32Cu91f+TEeE/8qAhNoyQIznR7Mb9HH2yHw9AD8Cu/C8dm1B05KBoBAeBawE/FGHrJH
8vpI7rIeFlnv9gc=
=1CPR
-----END PGP SIGNATURE-----

--------------ZbIxeGbw3NzBMpe07AmuMpvg--
