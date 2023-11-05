Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD07E11D5
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 01:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B36D10E23C;
	Sun,  5 Nov 2023 00:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D5C10E23C
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 00:00:27 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7788f513872so206246485a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Nov 2023 17:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699142426; x=1699747226; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7DzF67eKJe/4PbOKTFsVMSX959vPZFQAi7vydmr8pzA=;
 b=TMbXwxV9pxxGobePONzJKD4CWqORzGs+Hza88NjldBLeZVQ1VCCbY5fmFsKD3ra2Gl
 qkQbXLhrq27Xxm1VW7xjvE6h3p+WWljdNgiGBDkz6FYkI58QpGXJURmuAQNFpS7cN5p/
 AVum5eWcjpWfh1MR4OyOXDvG08djJN7M65D3ZhwsRbmGg9IJVX1KKD4Lpm+emlmKHcP5
 6ZwfC25PD9h7dXNFwsGBs5eG2C+jxA9emsFnefImPKzkpmLhcatfXql2y26/BUUFhkJb
 6uhQ6gehtxQvxIznfHHJ1pYyUHdv8ICZY3WgzbXd/Xy5UA19dlKXG8RHw6et2ClPypOp
 Ch9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699142426; x=1699747226;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7DzF67eKJe/4PbOKTFsVMSX959vPZFQAi7vydmr8pzA=;
 b=ieiiS7Z9SgOV+I7F/0VQ+hTmUCl/HvaACczC9sqF6t6pPzMk6GaZ5MnbzUZMA4zMTw
 v2C9g0XlOU2RQkYFWlM0eAoeD1Ul7qmgoL/60nXHI2HP+n8MpIpNN8z/y5bvpve4Cf4w
 cKeTPteR+/NAPpIcBw5VlG0GQeLntj2I19G1wFtYBQF30t7EEKFpzeTGB6te2Y1vJOTW
 /s+cB/UweM8aGypbSLtE63nbhih2laQ0HMbSgbJgi8DO1qadubOkriBBRr3ujzVw1ouj
 61+nAYZQ49F4Hp7fogkMwFDxyVew47h1GJNvaZnBcQqMZoiibM/sAw0Iyp4gtCnDA6YJ
 LZbQ==
X-Gm-Message-State: AOJu0YzIkj806xLfc7CNK79r91wUcD8iadrr1TVYfzin0OQR1+mtUUcY
 jtBXbSNFK1SErQJLuhlpU+c=
X-Google-Smtp-Source: AGHT+IE8ttDMPJMrysFiGZ7GdZ9QyLGVcwEiQ4F2+Lv88V1L1hYAT4b1pmLYXkZakwIQwrszh0zgZw==
X-Received: by 2002:a05:620a:2890:b0:77a:2de5:2cf0 with SMTP id
 j16-20020a05620a289000b0077a2de52cf0mr20809193qkp.11.1699142425631; 
 Sat, 04 Nov 2023 17:00:25 -0700 (PDT)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a05620a141800b0077412ca0ae1sm1956811qkj.65.2023.11.04.17.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 17:00:25 -0700 (PDT)
Message-ID: <900cf366-a75c-475b-bccb-f10494048e85@gmail.com>
Date: Sat, 4 Nov 2023 20:00:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
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
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cjowcf5D3KmOGgV2YhF7Jx1a"
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
 Luben Tuikov <luben.tuikov@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cjowcf5D3KmOGgV2YhF7Jx1a
Content-Type: multipart/mixed; boundary="------------f79j9sW9QspVV1bapkaUXkgI";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Message-ID: <900cf366-a75c-475b-bccb-f10494048e85@gmail.com>
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>

--------------f79j9sW9QspVV1bapkaUXkgI
Content-Type: multipart/mixed; boundary="------------eWMX0fbQvH2FIyfNJIDyhFhM"

--------------eWMX0fbQvH2FIyfNJIDyhFhM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tvrtko,

I only now saw this patch and I had to look for it...

Do you get a bounce from luben.tuikov@amd.com? No? You should have.

Please don't use luben.tuikov@amd.com.

Please use ltuikov89@gmail.com, this email.
=20
Regards,
Luben

On 2023-11-02 06:55, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> I found some of the naming a bit incosistent and unclear so just a smal=
l
> attempt to clarify and tidy some of them. See what people think if my f=
irst
> stab improves things or not.
>=20
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Tvrtko Ursulin (5):
>   drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
>   drm/sched: Move free worker re-queuing out of the if block
>   drm/sched: Rename drm_sched_free_job_queue to be more descriptive
>   drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify
>     kerneldoc
>   drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
>=20
>  drivers/gpu/drm/scheduler/sched_entity.c |  4 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 53 ++++++++++++------------=

>  include/drm/gpu_scheduler.h              |  2 +-
>  3 files changed, 29 insertions(+), 30 deletions(-)
>=20

--------------eWMX0fbQvH2FIyfNJIDyhFhM
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

--------------eWMX0fbQvH2FIyfNJIDyhFhM--

--------------f79j9sW9QspVV1bapkaUXkgI--

--------------cjowcf5D3KmOGgV2YhF7Jx1a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUbbEAUDAAAAAAAKCRBMFUeUMaM0rwdT
AQDunOdAYvjBVC44x2hEdQbz1lT/s2Tr+0r8e+GFM6KaEwEAwyTiq2yDJsvP/Y3QSAnNfeaN7pQc
CaCDVN8UnH4frww=
=lCcr
-----END PGP SIGNATURE-----

--------------cjowcf5D3KmOGgV2YhF7Jx1a--
