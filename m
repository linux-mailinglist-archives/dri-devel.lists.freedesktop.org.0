Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D87FDD73
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3068D10E63A;
	Wed, 29 Nov 2023 16:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D5110E638;
 Wed, 29 Nov 2023 16:41:52 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-423a7dd0803so24907651cf.3; 
 Wed, 29 Nov 2023 08:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701276111; x=1701880911; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fjs3Okyq9EWbreP6AOnF4Rr0g4Cepv9m/ouV8NW/+O4=;
 b=brImebm8BJgEku4ItG74GAWeA47TBsXN7UDO3/cAoEdw7CUkyl7ySr1R0ZtSTBZkGi
 RX9koEIs3A3zyBdgMdfDHrpn9QwXrgef/+Rbx0gLFfngQEyHe7ZBTyYxS0P0XndHvnV/
 F66EOUVQ7f1gCOCdHt6UaSy2Kw8SP/EhWSE2IMbGzta3rCTt7vUtdZCL8Z5PfeyCcbKx
 OzR/OexVnB4U8gtBtIqPexlxrg1W3duknt9VB/q//L21rWSUhkV/x0htpaSfOWVuaHmk
 lxPawdX8O4RO8dbywSXyfzM5+rObkBll/eDRTKQWMgcLQyHQwKANQ0bB2/f9YdTlTXgt
 sQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701276111; x=1701880911;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fjs3Okyq9EWbreP6AOnF4Rr0g4Cepv9m/ouV8NW/+O4=;
 b=WEEcyHNEadk2HBn7oDq0x0ZqDW0WP66jHYfJMYNObzFCtFIyWX9Uo8Z5jhYaUQ8Mpe
 Aug5Q34mzuBnYBbwiVxuIayOqehOBL43ECN9fAcpLJYnfeGdrG42BoYL27/8FHV2cJ50
 F+0fX9vtwJoEbPlO1ix3jdW3jF5vZozkNp+YJ47eh9qBvPVuT7PTzL37I+QbZi+l0p1+
 /ZHm8kI0v1zsEGffEqVbyG0FtU4Ea9GLARFLnaxOPRplukeFyXTnRpHAGK2j1xKPDKPg
 YtnsB9Aawd+bbJrOgxDTbULA88YNBqcvuSpPvkPxgIeEt5oreN5inmb7ToAyaDf+E5ev
 Casg==
X-Gm-Message-State: AOJu0Yx68LxIyMaQturszi1bl6G75a+8K56C3qnBfZcsOJpBMKcjiSva
 owu7b7vPnFaHldvahZtd0Ak=
X-Google-Smtp-Source: AGHT+IHJLt6t2SBXVcMOy+x4u9k4HCGdsvez9v81S9XkJIrlzx7UuYuSel6DeNSKzD86cKYjhVoQ+Q==
X-Received: by 2002:a05:622a:4c0e:b0:423:d75b:2b62 with SMTP id
 ey14-20020a05622a4c0e00b00423d75b2b62mr8468314qtb.51.1701276111101; 
 Wed, 29 Nov 2023 08:41:51 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 fc21-20020a05622a489500b00423e6885152sm909995qtb.75.2023.11.29.08.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 08:41:50 -0800 (PST)
Message-ID: <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
Date: Wed, 29 Nov 2023 11:41:40 -0500
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
In-Reply-To: <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UyehoVd0FbltVXpXzUgljOtM"
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
--------------UyehoVd0FbltVXpXzUgljOtM
Content-Type: multipart/mixed; boundary="------------0XZomOJokaOIq0ur7sjc7Zhs";
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
Message-ID: <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
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
In-Reply-To: <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>

--------------0XZomOJokaOIq0ur7sjc7Zhs
Content-Type: multipart/mixed; boundary="------------X4lhUOpMG3SysAtmJ6e16SnL"

--------------X4lhUOpMG3SysAtmJ6e16SnL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-29 10:22, Alex Deucher wrote:
> On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail=
=2Ecom> wrote:
>>
>> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail=
=2Ecom> wrote:
>>>
>>> On 2023-11-28 17:13, Alex Deucher wrote:
>>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis=
=2Enet> wrote:
>>>>>
>>>>> Alex Deucher <alexdeucher@gmail.com> writes:
>>>>>
>>>>>>> In that case those are the already known problems with the schedu=
ler
>>>>>>> changes, aren't they?
>>>>>>
>>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'=
m
>>>>>> misunderstanding what the original report was actually testing.  I=
f it
>>>>>> was 6.7, then try reverting:
>>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>>>>> b70438004a14f4d0f9890b3297cd66248728546c
>>>>>
>>>>> At some point it was suggested that I file a gitlab issue, but I to=
ok
>>>>> this to mean it was already known and being worked on.  -rc3 came o=
ut
>>>>> today and still has the problem.  Is there a known issue I could tr=
ack?
>>>>>
>>>>
>>>> At this point, unless there are any objections, I think we should ju=
st
>>>> revert the two patches
>>> Uhm, no.
>>>
>>> Why "the two" patches?
>>>
>>> This email, part of this thread,
>>>
>>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
>>>
>>> clearly states that reverting *only* this commit,
>>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable numbe=
r of run-queues
>>> *does not* mitigate the failed suspend. (Furthermore, this commit doe=
sn't really change
>>> anything operational, other than using an allocated array, instead of=
 a static one, in DRM,
>>> while the 2nd patch is solely contained within the amdgpu driver code=
=2E)
>>>
>>> Leaving us with only this change,
>>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
>>> to be at fault, as the kernel log attached in the linked email above =
shows.
>>>
>>> The conclusion is that only b70438004a14f4 needs reverting.
>>
>> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
>> 56e449603f0ac5 breaks amdgpu.
>=20
> We can try and re-enable it in the next kernel.  I'm just not sure
> we'll be able to fix this in time for 6.7 with the holidays and all
> and I don't want to cause a lot of scheduler churn at the end of the
> 6.7 cycle if we hold off and try and fix it.  Reverting seems like the
> best short term solution.

A lot of subsequent code has come in since commit 56e449603f0ac5, as it o=
pened
the opportunity for a 1-to-1 relationship between an entity and a schedul=
er.
(Should've always been the case, from the outset. Not sure why it was cod=
ed as
a fixed-size array.)

Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and the p=
roblem
is wholly contained in amdgpu, and no other driver has this problem, ther=
e is
no reason to have to "churn", i.e. go back and forth in DRM, only to cove=
r up
an init bug in amdgpu. See the response I just sent in @this thread:
https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com

And it's not like this issue is unknown. I first posted about it on 2023-=
10-16.=20

Ideally, amdgpu would just fix their init code.
--=20
Regards,
Luben

--------------X4lhUOpMG3SysAtmJ6e16SnL
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

--------------X4lhUOpMG3SysAtmJ6e16SnL--

--------------0XZomOJokaOIq0ur7sjc7Zhs--

--------------UyehoVd0FbltVXpXzUgljOtM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWdpxAUDAAAAAAAKCRBMFUeUMaM0rxMG
AP0VKIwpMtTXzjbkhP+YlAOkqgomRWdt1ImVdFZwC6ss/AEA1HV4kiVP2+VGwRtGUUImxMuRwOGE
gH5ERcUPC6tIlA0=
=9LNu
-----END PGP SIGNATURE-----

--------------UyehoVd0FbltVXpXzUgljOtM--
