Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FE7E3327
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 03:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774E08825B;
	Tue,  7 Nov 2023 02:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16B10E4A3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 02:42:27 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7789577b53fso339657385a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 18:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699324946; x=1699929746; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AMGiNg8zB4ue1FwO75XIRwxe78xeaVWHCD1Ot4u8i34=;
 b=DcbwZJRUzNaZ+7VoquH7Y/g1qyiX6NvmF9VMzVuiBxLk7drxuUfhFLre4uCzUESG/g
 7eRCaFpBUxS+J7kF883XxguyJQvund/B6k3024iEH3EdHwWly66KA1jTK5YdyziF0HkZ
 Wtq185pjPLzK1PEK574WKvH/m0O0UZlx1HRXAMh8OOG8waVE3y/lVWpii4JS7EyX1QHS
 DoOf5b8rBnDpKx0ETyJ2m+2Pd2DMYgmHehCAk4VbKKAa9ExnCvcAxxJkaaBXkrYS71H2
 FujIrc0uTYsEr1hmYtmAcTw4LLlRnJnvSgnK/9IIxQlND2J81nXOpA/9aYM5/xKGo2I+
 cwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699324946; x=1699929746;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMGiNg8zB4ue1FwO75XIRwxe78xeaVWHCD1Ot4u8i34=;
 b=w4tpHy7xYbMoY8Uz/UgYZoGIDMarTlHaX617T2m/a62mOYckIHr2XPmImeRuKlnXrh
 EdlY73QPHMCHVhRjO6ZFUfvZz+HC5Hg1/d5BL0HY2gHVP8w9HUufYDoBVW24dEXJtrHV
 kj9Lz0OE7558kkLvRj/ULXQ1ZV8E8JfVJXCGL9iMGn6dszovWfn+gTDDtmHh6hCO/v9n
 c+YMnYZtwTLfxAC7o2+SLZDtYiLDJyYqNqUXb0UHzAfjNR/lxaiuCZZHnyUo9FvEpZBi
 7A9DI+b3Sd7PCCbBqruo8Joq+cpujcoYpUlK59TQfyaamjFG0ixuBN8f1JY2+0B+E9Zb
 2qvA==
X-Gm-Message-State: AOJu0YwArL8lxFTkBwlY6sMXn+NrmHTDWE0/b1HfFjQEZ8tCKUDtXq+h
 hBZnCcdo0V0doexqBU3R1Sw=
X-Google-Smtp-Source: AGHT+IE6Y66LEM6tgVZc8BsIvNkQtPA59MovyG/uNSYqAO6gIFgFMPdOXIFZSl/quSYmDU3m3VoKZA==
X-Received: by 2002:a05:620a:2456:b0:774:1e07:ea0d with SMTP id
 h22-20020a05620a245600b007741e07ea0dmr37895842qkn.44.1699324946279; 
 Mon, 06 Nov 2023 18:42:26 -0800 (PST)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a05620a222400b0075ca4cd03d4sm3834658qkh.64.2023.11.06.18.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 18:42:25 -0800 (PST)
Message-ID: <b558db16-dbc5-43af-b59f-9dd8e7b35e2c@gmail.com>
Date: Mon, 6 Nov 2023 21:42:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
Content-Language: en-CA, en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
 <88bd3e1d-db66-40de-b06f-adcaefacccf3@gmail.com>
 <42646224-60e4-4ac1-b554-730b66fb2704@linux.intel.com>
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
In-Reply-To: <42646224-60e4-4ac1-b554-730b66fb2704@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZAa15zsxDvLmODjj0kJWy0Rt"
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZAa15zsxDvLmODjj0kJWy0Rt
Content-Type: multipart/mixed; boundary="------------sBKGPbifJnGZ1LUPXDOddIGJ";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Message-ID: <b558db16-dbc5-43af-b59f-9dd8e7b35e2c@gmail.com>
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
 <88bd3e1d-db66-40de-b06f-adcaefacccf3@gmail.com>
 <42646224-60e4-4ac1-b554-730b66fb2704@linux.intel.com>
In-Reply-To: <42646224-60e4-4ac1-b554-730b66fb2704@linux.intel.com>

--------------sBKGPbifJnGZ1LUPXDOddIGJ
Content-Type: multipart/mixed; boundary="------------2OyatOUsTwlmutNLE7lEGP15"

--------------2OyatOUsTwlmutNLE7lEGP15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-06 07:41, Tvrtko Ursulin wrote:
>=20
> On 05/11/2023 01:51, Luben Tuikov wrote:
>> On 2023-11-02 06:55, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> I found some of the naming a bit incosistent and unclear so just a sm=
all
>>> attempt to clarify and tidy some of them. See what people think if my=
 first
>>> stab improves things or not.
>>>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>
>>> Tvrtko Ursulin (5):
>>>    drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive=

>>>    drm/sched: Move free worker re-queuing out of the if block
>>>    drm/sched: Rename drm_sched_free_job_queue to be more descriptive
>>>    drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify
>>>      kerneldoc
>>>    drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
>>>
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  4 +-
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 53 ++++++++++++---------=
---
>>>   include/drm/gpu_scheduler.h              |  2 +-
>>>   3 files changed, 29 insertions(+), 30 deletions(-)
>>>
>>
>> Series is,
>>
>> Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
>>
>> and pushed to drm-misc-next.
>=20
> Oh thanks, I definitely did not expect that to happen so quickly,=20
> especially since it conflicts with your fix for RR and there are some=20
> other opens. But it is fine, all that can be worked on top.

Yeah, it does conflict, and it does make some changes obsolete,
but your series was fine and an improvement, so might as well push it.

I'll rebase my patch on top of yours.
--=20
Regards,
Luben

--------------2OyatOUsTwlmutNLE7lEGP15
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

--------------2OyatOUsTwlmutNLE7lEGP15--

--------------sBKGPbifJnGZ1LUPXDOddIGJ--

--------------ZAa15zsxDvLmODjj0kJWy0Rt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUmkCAUDAAAAAAAKCRBMFUeUMaM0rxg/
AQCnLE/Ca68qxgqv7BGrMS1gqIwMhjxH5wxje9DSNNKCsAEAnJQ7TGZ/RzJHfot7XGDmzm5o4OeJ
cgRRXpEkgKQrHw8=
=+Lp9
-----END PGP SIGNATURE-----

--------------ZAa15zsxDvLmODjj0kJWy0Rt--
