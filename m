Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86687FE7CC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 04:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA8D10E110;
	Thu, 30 Nov 2023 03:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57B710E0FA;
 Thu, 30 Nov 2023 03:47:55 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dafe04717baso412863276.1; 
 Wed, 29 Nov 2023 19:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701316075; x=1701920875; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/ooAZonyzMtQr9Pp4WSy61Py6nyWIEIRAS3Y3o/ElNY=;
 b=HifcMTG697RUMJ0RjbwC5yEX+G60UQ35kRlcgbI+oFlwjQ8zI+3Kl+GAdFd7P8+Giu
 DQPxrK6i8NN3GfmmMjfUKVWA9BQdPMBQY9+cPtXYdHNv5YLaKN6JidBZ0QxPCbkTprxS
 q7hJMNlypsC1rhFrYyXe/4ZTj7p1ZcfiAXq2Krzv04rR7V58jO7SjA99GrykDHAUnl/E
 /sSSwdAZrf4AkhqCGY1j/i019yJvKz8dbN9lsE5+6mDVTFEQZEeagbnUyXwPVOfA3/bw
 I6XEEpItAt67iSruvUBS2ZLpjmG7SoGybAj/fyw0ZK9rqEGUgRMAuPuV6pBsnKKAV/my
 mW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701316075; x=1701920875;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ooAZonyzMtQr9Pp4WSy61Py6nyWIEIRAS3Y3o/ElNY=;
 b=UHuyHtc9NFexeCWg0GrimjvtlBGB0QeM7IyPaNxO33VjJyH13dWPOpQkCWOSGQbBvY
 P7Pl+YOnd0mYu0VwphhmCVjkEhuqa6TYmwTK6qMfwBH90FnoS6m7KszeWmUODkKzP51R
 +lz7B5ClOgqFQ+Q08QwTiOaRcgfon1tIdOxn+TCKhkuqDVVs79kUK9T2Kk9MISPsggxS
 3fmyhO1OI6Zq4ta0oW15FPL5E0qivkNaHfnk8tbgwGdX52Ti583MoFSpz+vf+ZNYQ0Xg
 Opp8U4H6VsxkBRFPJJw/FXjrqGBCmopKGHLm/gKPXPxEq/x9Xpy+WOw92AHQuDtqa2lh
 Ve9g==
X-Gm-Message-State: AOJu0Yyk4fsilkiKwnNS3FZVn6RBQEeGaetsCMBwt5S9vpXeQedRRTM5
 EN2V9VSU/TvbG5Hfxh+fWyE=
X-Google-Smtp-Source: AGHT+IHX1U+rXwVKuihbTbuJM7yhIUCvWC7n7fi5i07dD04t+IWU500xlQBsGa36liUTyx5FKv8uJQ==
X-Received: by 2002:a25:4f41:0:b0:da0:365d:9e21 with SMTP id
 d62-20020a254f41000000b00da0365d9e21mr19506616ybb.22.1701316074656; 
 Wed, 29 Nov 2023 19:47:54 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a0caa56000000b0067a56ff6bc6sm96268qvb.122.2023.11.29.19.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 19:47:54 -0800 (PST)
Message-ID: <db75bcf5-13a7-4176-a2fb-94cd198a1a7b@gmail.com>
Date: Wed, 29 Nov 2023 22:47:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.1
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
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
 <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7pD37DDt9F1Atwjm4Vbi6i4r"
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
--------------7pD37DDt9F1Atwjm4Vbi6i4r
Content-Type: multipart/mixed; boundary="------------62Pp0k0dWHdQX64XEdGln3dN";
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
Message-ID: <db75bcf5-13a7-4176-a2fb-94cd198a1a7b@gmail.com>
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
 <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>
In-Reply-To: <05a4dec0-1c07-4a64-9439-e2c306807ded@gmail.com>

--------------62Pp0k0dWHdQX64XEdGln3dN
Content-Type: multipart/mixed; boundary="------------Y9s0jSILn1S04HCmmGSyJ408"

--------------Y9s0jSILn1S04HCmmGSyJ408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-29 22:36, Luben Tuikov wrote:
> On 2023-11-29 15:49, Alex Deucher wrote:
>> On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmai=
l.com> wrote:
>>>
>>> Actually I think I see the problem.  I'll try and send out a patch
>>> later today to test.
>>
>> Does the attached patch fix it?
>=20
> Thanks for the patch, Alex.
>=20
> Is it possible for AMD to also reproduce this issue and test this patch=
 on a Navi23 system?
>=20
>> From 96e75b5218f7a124eafa53853681eef8fe567ab8 Mon Sep 17 00:00:00 2001=

>> From: Alex Deucher <alexander.deucher@amd.com>
>> Date: Wed, 29 Nov 2023 15:44:25 -0500
>> Subject: [PATCH] drm/amdgpu: fix buffer funcs setting order on suspend=

>>
>> We need to make disable this after the last eviction
>=20
> "make disable" --> "disable"
>=20
>> call, but before we disable the SDMA IP.
>>
>> Fixes: b70438004a14 ("drm/amdgpu: move buffer funcs setting up a level=
")
>> Link: https://lists.freedesktop.org/archives/amd-gfx/2023-November/101=
197.html
>=20
> Link: https://lore.kernel.org/r/87edgv4x3i.fsf@vps.thesusis.net
>=20
> Let's link the start of the thread.
>=20
> Regards,
> Luben
>=20
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Phillip Susi <phill@thesusis.net>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c
>> index b5edf40b5d03..78553e027db4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4531,8 +4531,6 @@ int amdgpu_device_suspend(struct drm_device *dev=
, bool fbcon)
>> =20
>>  	amdgpu_ras_suspend(adev);
>> =20
>> -	amdgpu_ttm_set_buffer_funcs_status(adev, false);
>> -
>>  	amdgpu_device_ip_suspend_phase1(adev);
>> =20
>>  	if (!adev->in_s0ix)
>> @@ -4542,6 +4540,8 @@ int amdgpu_device_suspend(struct drm_device *dev=
, bool fbcon)
>>  	if (r)
>>  		return r;
>> =20
>> +	amdgpu_ttm_set_buffer_funcs_status(adev, false);
>> +

If you're moving this past phase 1, there's another instance in amdgpu_de=
vice_ip_suspend(),
which may need to be moved down.

Regards,
Luben

>>  	amdgpu_fence_driver_hw_fini(adev);
>> =20
>>  	amdgpu_device_ip_suspend_phase2(adev);
>=20
>>
>> Alex
>>
>>>
>>> Alex
>>>
>>> On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gma=
il.com> wrote:
>>>>
>>>> On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gma=
il.com> wrote:
>>>>>
>>>>> On 2023-11-29 10:22, Alex Deucher wrote:
>>>>>> On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@=
gmail.com> wrote:
>>>>>>>
>>>>>>> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@=
gmail.com> wrote:
>>>>>>>>
>>>>>>>> On 2023-11-28 17:13, Alex Deucher wrote:
>>>>>>>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@the=
susis.net> wrote:
>>>>>>>>>>
>>>>>>>>>> Alex Deucher <alexdeucher@gmail.com> writes:
>>>>>>>>>>
>>>>>>>>>>>> In that case those are the already known problems with the s=
cheduler
>>>>>>>>>>>> changes, aren't they?
>>>>>>>>>>>
>>>>>>>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  May=
be I'm
>>>>>>>>>>> misunderstanding what the original report was actually testin=
g.  If it
>>>>>>>>>>> was 6.7, then try reverting:
>>>>>>>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>>>>>>>>>> b70438004a14f4d0f9890b3297cd66248728546c
>>>>>>>>>>
>>>>>>>>>> At some point it was suggested that I file a gitlab issue, but=
 I took
>>>>>>>>>> this to mean it was already known and being worked on.  -rc3 c=
ame out
>>>>>>>>>> today and still has the problem.  Is there a known issue I cou=
ld track?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> At this point, unless there are any objections, I think we shou=
ld just
>>>>>>>>> revert the two patches
>>>>>>>> Uhm, no.
>>>>>>>>
>>>>>>>> Why "the two" patches?
>>>>>>>>
>>>>>>>> This email, part of this thread,
>>>>>>>>
>>>>>>>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
>>>>>>>>
>>>>>>>> clearly states that reverting *only* this commit,
>>>>>>>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable =
number of run-queues
>>>>>>>> *does not* mitigate the failed suspend. (Furthermore, this commi=
t doesn't really change
>>>>>>>> anything operational, other than using an allocated array, inste=
ad of a static one, in DRM,
>>>>>>>> while the 2nd patch is solely contained within the amdgpu driver=
 code.)
>>>>>>>>
>>>>>>>> Leaving us with only this change,
>>>>>>>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
>>>>>>>> to be at fault, as the kernel log attached in the linked email a=
bove shows.
>>>>>>>>
>>>>>>>> The conclusion is that only b70438004a14f4 needs reverting.
>>>>>>>
>>>>>>> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a1=
4f4,
>>>>>>> 56e449603f0ac5 breaks amdgpu.
>>>>>>
>>>>>> We can try and re-enable it in the next kernel.  I'm just not sure=

>>>>>> we'll be able to fix this in time for 6.7 with the holidays and al=
l
>>>>>> and I don't want to cause a lot of scheduler churn at the end of t=
he
>>>>>> 6.7 cycle if we hold off and try and fix it.  Reverting seems like=
 the
>>>>>> best short term solution.
>>>>>
>>>>> A lot of subsequent code has come in since commit 56e449603f0ac5, a=
s it opened
>>>>> the opportunity for a 1-to-1 relationship between an entity and a s=
cheduler.
>>>>> (Should've always been the case, from the outset. Not sure why it w=
as coded as
>>>>> a fixed-size array.)
>>>>>
>>>>> Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and=
 the problem
>>>>> is wholly contained in amdgpu, and no other driver has this problem=
, there is
>>>>> no reason to have to "churn", i.e. go back and forth in DRM, only t=
o cover up
>>>>> an init bug in amdgpu. See the response I just sent in @this thread=
:
>>>>> https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmai=
l.com
>>>>>
>>>>> And it's not like this issue is unknown. I first posted about it on=
 2023-10-16.
>>>>>
>>>>> Ideally, amdgpu would just fix their init code.
>>>>
>>>> You can't make changes to core code that break other drivers.
>>>> Arguably 56e449603f0ac5 should not have gone in in the first place i=
f
>>>> it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
>>>> code, but as a side effect it seems to have broken suspend for some
>>>> users.
>>>>
>>>> Alex

--------------Y9s0jSILn1S04HCmmGSyJ408
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

--------------Y9s0jSILn1S04HCmmGSyJ408--

--------------62Pp0k0dWHdQX64XEdGln3dN--

--------------7pD37DDt9F1Atwjm4Vbi6i4r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWgF4QUDAAAAAAAKCRBMFUeUMaM0r9fX
AP9QwgLO57J2QN5j6jjzmu8/87+MFGO4zafYpRyOtpLoAQD/cErYjMxl6UEW1ZKf7xvkfz86Gj+C
IMOlr5/qUUwMHAc=
=nrQK
-----END PGP SIGNATURE-----

--------------7pD37DDt9F1Atwjm4Vbi6i4r--
