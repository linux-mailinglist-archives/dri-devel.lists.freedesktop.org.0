Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDBE7FDCDA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5798F10E302;
	Wed, 29 Nov 2023 16:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4261210E302;
 Wed, 29 Nov 2023 16:21:09 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-67a16594723so34659026d6.3; 
 Wed, 29 Nov 2023 08:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701274868; x=1701879668; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5C0iYWHlIaLUE5Bo19jtvrWCFWmST23+Bi2pSXzdUIU=;
 b=mSNauxKIereSqAJ31fPJxmqkzlqK833towuijE44J7p+wliCHMM4L3m+Y74X7Lf5xo
 3YGAwts0mEKWcvE5V+t60wLYuduQv3b6Bpl3bMQDgI37vDEKoxhvgjZdVw8d9RGMVHc0
 bDpoiDW1KI3AUdEISIns7L89GnaOv2HAYuqqh8z4kWpbJehxkTXA791M0UDYXnpQp9Wa
 2h3KZSzbt7bf+KhIQ3ptEfbN7mVX25gEYtSR0bvhXHE3UkShJyoEfjwSEQKbApTM1J08
 SORkTcO9Le7iOffXgPmKeh6HSVZ/nx1GbHXGaHn29fSol9yd7EBRo4Va32f/gVJaHfje
 YuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701274868; x=1701879668;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5C0iYWHlIaLUE5Bo19jtvrWCFWmST23+Bi2pSXzdUIU=;
 b=WUUy2JzSE7bdw6bc+aS6FPQsnO7R9ThuumMqr8MBRgbx6eGZBq+leREr+4zy8BK7oy
 fHEAw8WhEeQb2kBqj9IFDiUX9TsI9LTotqQ1sgzCNufuO7mbH88cF+fiRKmf3u1Unlo3
 vOhpJk3Nw72PvqzAMD741JH/UPe+6acUs8MknatCGe67BfpqvqOD083OzzertuXrKMIY
 M20wVC/f8EumDQdFJkUHgyM+s685LognmdxY6yPyMiHvSD1DwP9nhrysyyJePDiO0ljv
 sO7npParrXNSVJ/F+w4tcJDuCJhLb5C03yazNBXD0wG8BO4rnWyl9+gwk9QjWCzF3TJ8
 cfDA==
X-Gm-Message-State: AOJu0Yzwtl61yVqlqVnYGr170PE96cB9ELHPmd+6nZ0vvMPyxzu2jYGw
 dy2vOWeeXib4GNTvM7RIcxo=
X-Google-Smtp-Source: AGHT+IG/vAfZvOuAExosXZrnY/hJuEiEqq2qYBpy5m3ZQeaRX1Ui3Vzvx7GS5IgEJzTd5WW/g+htsA==
X-Received: by 2002:a0c:e7ce:0:b0:67a:3e70:3e3d with SMTP id
 c14-20020a0ce7ce000000b0067a3e703e3dmr12014239qvo.14.1701274868197; 
 Wed, 29 Nov 2023 08:21:08 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 cj19-20020a05622a259300b00423ec241c54sm620462qtb.47.2023.11.29.08.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 08:21:07 -0800 (PST)
Message-ID: <05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com>
Date: Wed, 29 Nov 2023 11:20:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.1
Subject: Re: Radeon regression in 6.6 kernel
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
In-Reply-To: <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j7wTypPcX4sW4ivkzQYkyKmq"
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
--------------j7wTypPcX4sW4ivkzQYkyKmq
Content-Type: multipart/mixed; boundary="------------jdFCh49Ay0wTOfXIQ5VBNmuF";
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
Message-ID: <05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com>
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
In-Reply-To: <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>

--------------jdFCh49Ay0wTOfXIQ5VBNmuF
Content-Type: multipart/mixed; boundary="------------MuT0iEzPiRE10VeiMpxSflIk"

--------------MuT0iEzPiRE10VeiMpxSflIk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-29 08:50, Alex Deucher wrote:
> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.=
com> wrote:
>>
>> On 2023-11-28 17:13, Alex Deucher wrote:
>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.=
net> wrote:
>>>>
>>>> Alex Deucher <alexdeucher@gmail.com> writes:
>>>>
>>>>>> In that case those are the already known problems with the schedul=
er
>>>>>> changes, aren't they?
>>>>>
>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm=

>>>>> misunderstanding what the original report was actually testing.  If=
 it
>>>>> was 6.7, then try reverting:
>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>>>> b70438004a14f4d0f9890b3297cd66248728546c
>>>>
>>>> At some point it was suggested that I file a gitlab issue, but I too=
k
>>>> this to mean it was already known and being worked on.  -rc3 came ou=
t
>>>> today and still has the problem.  Is there a known issue I could tra=
ck?
>>>>
>>>
>>> At this point, unless there are any objections, I think we should jus=
t
>>> revert the two patches
>> Uhm, no.
>>
>> Why "the two" patches?
>>
>> This email, part of this thread,
>>
>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
>>
>> clearly states that reverting *only* this commit,
>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable number=
 of run-queues
>> *does not* mitigate the failed suspend. (Furthermore, this commit does=
n't really change
>> anything operational, other than using an allocated array, instead of =
a static one, in DRM,
>> while the 2nd patch is solely contained within the amdgpu driver code.=
)
>>
>> Leaving us with only this change,
>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
>> to be at fault, as the kernel log attached in the linked email above s=
hows.
>>
>> The conclusion is that only b70438004a14f4 needs reverting.
>=20
> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
> 56e449603f0ac5 breaks amdgpu.

It doesn't "break" it, amdgpu just needs to be fixed.

I know we put in a Fixes tag in=20
b70438004a14f4 "drm/amdgpu: move buffer funcs setting up a level"
pointing to 56e449603f0ac5 "drm/sched: Convert the GPU scheduler to varia=
ble number of run-queues",
but given the testing Phillip has done, the culprit is wholly contained i=
n
the amdgpu driver code.

No other driver has this problem since commit 56e449603f0ac5.

The Fixes tag in b70438004a14f4 "drm/amdgpu: move buffer funcs setting up=
 a level" should've ideally
pointed to an amdgpu-driver code commit only (perhaps an old-old commit),=
 and I was a bit uncomfortable
putting in a Fixes tag which pointed to drm code, but we did it so that t=
he amdgpu commit follows
the changes in DRM. In retrospect, the Fixes tag should've pointed to and=
 amdgpu-driver commit when
that the amdgpu code was originally written.

I remember that the problem was really that amdgpu called drm_sched_entit=
y_init(),
in amdgpu_ttm_set_buffer_funcs_status() without actually having initializ=
ed the scheduler
used therein. For instance, the code before commit b70438004a14f4, looked=
 like this:

void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool =
enable)
{
	struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_VRAM);
	uint64_t size;
	int r;

	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
	    adev->mman.buffer_funcs_enabled =3D=3D enable)
		return;

	if (enable) {
		struct amdgpu_ring *ring;
		struct drm_gpu_scheduler *sched;

		ring =3D adev->mman.buffer_funcs_ring;
		sched =3D &ring->sched;                             <-- LT: No one has =
initialized this scheduler
		r =3D drm_sched_entity_init(&adev->mman.entity,     <-- Oopses, now tha=
t sched->sched_rq is not a static array
					  DRM_SCHED_PRIORITY_KERNEL, &sched,
					  1, NULL);
		if (r) {
			DRM_ERROR("Failed setting up TTM BO move entity (%d)\n",
				  r);
			return;
		}


Before commit 56e449603f0ac5, amdgpu was getting away with this, because =
the sched->sched_rq
was a static array.

Ideally, amdgpu code would be fixed.
--=20
Regards,
Luben

--------------MuT0iEzPiRE10VeiMpxSflIk
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

--------------MuT0iEzPiRE10VeiMpxSflIk--

--------------jdFCh49Ay0wTOfXIQ5VBNmuF--

--------------j7wTypPcX4sW4ivkzQYkyKmq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWdk6gUDAAAAAAAKCRBMFUeUMaM0r2hv
AP0aSHUC/xllp8MB8hWrrBVNo7NSc2n2uHg5NRzMwqrpfQEA4qwd2RptMLI7lNLpv+dYkg6sgNRJ
IGR+myJk9DecGAs=
=V4Z6
-----END PGP SIGNATURE-----

--------------j7wTypPcX4sW4ivkzQYkyKmq--
