Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEE7E4F74
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 04:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE58110E369;
	Wed,  8 Nov 2023 03:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B29710E369;
 Wed,  8 Nov 2023 03:29:08 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-41b7fd8f458so40970731cf.0; 
 Tue, 07 Nov 2023 19:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699414147; x=1700018947; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XW/jUlD1zX6gloR+bzYXvVutHolbgNsUyPOlFkVtHCM=;
 b=gW3mSidXnuNABmgEl7+hUoHxWlJCWmqbgk8I2tUkVj8C5czK8xprJBbQsXVCH8+DNF
 7mcShWHxeG/gbhfKeZjUHx0u2s1Wj2KpQ+aaa1V6qxImyCmg4FT7s9lcnFfRpSNEjyT8
 gFtbvXE/muDpDLLQSEpyoAIY6c/3C85pBavT7we7P1WWdJvSk9TXEaX1+sPGIkXzEZuX
 LtErQ6CLloX8TDPG9vIANVGf7wmZeRzDbm7D7JH4FEiOYX/xu1yW/tRpijd+6dTkWC/Q
 SFYhEOzwp+LnXd5e3EkDXzAJUfnpV/R/B8rQ7IMLUrUTdqTmP416MZr4DqkI75+D832j
 CUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699414147; x=1700018947;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XW/jUlD1zX6gloR+bzYXvVutHolbgNsUyPOlFkVtHCM=;
 b=m7XgrTIm9n1ADlqoBnVINwIBk3wQ7FdwRdZkuZnwsoild48slkUjFELzMlZvf2dYJ9
 TZ0OO7foVdyWEpEVAaxobwnXsTD2Ge+NFZCNOqzCSiuca4hRGUUaoNrSr9gxsYy58dAj
 rGW3O5WJi/tEhZ6wC6exXasJLrTLCQimsyQ3UHRN7ULIdE7G54c+NhsHz16U10bfQPp5
 OU60m4M0e3Au+9ArvW6xFrygdxEt9fsouB7CwevCdcnI29+cQjDcNjIO5/lww0tmfyX2
 aNDDEJE43NZ63h7aSfDDNgEiv6caaug7fwOrOyJpkCJE43AeZPlrjiDVUZNWqYR47tpL
 PfSw==
X-Gm-Message-State: AOJu0YzYDTUTQlBau6N6JgnOKtLhLsIkziJcSvQ4stkJ95VOzG8Yv3gZ
 Uol0egi1mL+djpt5A3HZmSo=
X-Google-Smtp-Source: AGHT+IGCLygGa6hLQLlhKPnUFZh67VulRA5BuHSEucl7fYxdffwqBnLrf4rUO8ojgzuI/NlZCVT6Aw==
X-Received: by 2002:a05:622a:148c:b0:417:b45b:84c7 with SMTP id
 t12-20020a05622a148c00b00417b45b84c7mr888443qtx.19.1699414147223; 
 Tue, 07 Nov 2023 19:29:07 -0800 (PST)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 k20-20020ac84794000000b004179e79069asm403216qtq.21.2023.11.07.19.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 19:29:06 -0800 (PST)
Message-ID: <ccda3219-c8f7-40a1-81f2-18a24d80e283@gmail.com>
Date: Tue, 7 Nov 2023 22:29:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <08dd5af8-a631-49d4-b0bd-13500d55198b@redhat.com>
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
In-Reply-To: <08dd5af8-a631-49d4-b0bd-13500d55198b@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gpqj6vvroOtk9Ax0C8JXAFpE"
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
 ltuikov@yahoo.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gpqj6vvroOtk9Ax0C8JXAFpE
Content-Type: multipart/mixed; boundary="------------gfAWvpNcQCpremkS11JbT90n";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, tvrtko.ursulin@linux.intel.com
Cc: Liviu.Dudau@arm.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, donald.robson@imgtec.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 intel-xe@lists.freedesktop.org, ketil.johnsen@arm.com, lina@asahilina.net,
 ltuikov@yahoo.com, matthew.brost@intel.com, mcanal@igalia.com,
 robdclark@chromium.org, sarah.walker@imgtec.com
Message-ID: <ccda3219-c8f7-40a1-81f2-18a24d80e283@gmail.com>
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <08dd5af8-a631-49d4-b0bd-13500d55198b@redhat.com>
In-Reply-To: <08dd5af8-a631-49d4-b0bd-13500d55198b@redhat.com>

--------------gfAWvpNcQCpremkS11JbT90n
Content-Type: multipart/mixed; boundary="------------o43KAhIi8nsvUwj9SbbzBQFO"

--------------o43KAhIi8nsvUwj9SbbzBQFO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-07 12:53, Danilo Krummrich wrote:
> On 11/7/23 05:10, Luben Tuikov wrote:
>> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In=
 fact,
>> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), =
and let
>> it do just that, schedule the work item for execution.
>>
>> The problem is that drm_sched_run_job_queue() calls drm_sched_select_e=
ntity()
>> to determine if the scheduler has an entity ready in one of its run-qu=
eues,
>> and in the case of the Round-Robin (RR) scheduling, the function
>> drm_sched_rq_select_entity_rr() does just that, selects the _next_ ent=
ity
>> which is ready, sets up the run-queue and completion and returns that
>> entity. The FIFO scheduling algorithm is unaffected.
>>
>> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity=
(), then
>> in the case of RR scheduling, that would result in drm_sched_select_en=
tity()
>> having been called twice, which may result in skipping a ready entity =
if more
>> than one entity is ready. This commit fixes this by eliminating the ca=
ll to
>> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves i=
t only
>> in drm_sched_run_job_work().
>>
>> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>>      Add fixes-tag. (Tvrtko)
>>
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")=

>=20
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>

Thank you, sir!
--=20
Regards,
Luben

--------------o43KAhIi8nsvUwj9SbbzBQFO
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

--------------o43KAhIi8nsvUwj9SbbzBQFO--

--------------gfAWvpNcQCpremkS11JbT90n--

--------------gpqj6vvroOtk9Ax0C8JXAFpE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUsAggUDAAAAAAAKCRBMFUeUMaM0rzNX
AQD/OF1ASvTKga9KcfKDeaT3WNA/hyydDWyyowK6f3LVeAEArsfsFB1+fLNyh24XSq/RZoc/grp1
a4L0V0U5fRjbHw8=
=a/aL
-----END PGP SIGNATURE-----

--------------gpqj6vvroOtk9Ax0C8JXAFpE--
