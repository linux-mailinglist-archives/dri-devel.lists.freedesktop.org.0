Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F27E7687
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 02:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AA710E40C;
	Fri, 10 Nov 2023 01:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBAB10E40C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:25:14 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-779f2718accso100214285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 17:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699579514; x=1700184314; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EpUnJqiUGSLxpIVZCLs3iuc/qoT2JsrHayU5aHdmSgw=;
 b=RRIyB3SxOk6IV1dQEkslC+576pq1XEJgKGo4v9T1AHmuAAQLfkiWDTdqqmc1Jz0IsA
 UEJVx/cjsbUG3lkyj2+re/0eOtMaXNgoHAhH5Hmj6ChoKAHFH5Y7+h7Ja7YphmXJ90+j
 5NSYW/jYT4d837B6J8lOIQO6E1U9cyDIwYF53RZM8x0OLrTc7lZR6Y7Q3U/TKR064I0s
 qZW61yvx43TQSSbSvOWdfp2NzaVgsN7w/AZXEWvYCbkea18evXqHM+09x2tGIUu9axzQ
 Z4qg/IFjuoSJtFydRZZMm9lEvv1t8uV3gPGvE9LZJFTj+LgFkPv35a8ArIYtRw0QXern
 T5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699579514; x=1700184314;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EpUnJqiUGSLxpIVZCLs3iuc/qoT2JsrHayU5aHdmSgw=;
 b=aMTUB/9qUOVgrYNDkuoZtsu/I1a29KRXNFw/3csY860DrZIDrC233g6MpdPBFcQCtC
 Qyi/qysEKnyN7OvddAyMhtVuJ+GMSBT9fYM3sUtz5dFeIeCrOcQwj9C8M6hYhjnRZVf5
 FM11ZDIJ5fg+Q6F86IwTOKpU63W9z0/k6TCey6nJLsPnac2uamdFKiOEuvm6Nl8CGhYK
 acSR3VoJJs8MjxyZ/aDMkiTqXK3lZmKmGuepgBikuFKnuMNjifkAFFNUM66O3qprzfyr
 Bz1iVyoyEa5pXpOFYLab3LA0UejktAbsCCV5Kz62QZMb5P9BQaKd26PjIblt3D0HVM7v
 o96A==
X-Gm-Message-State: AOJu0Yx1mrmV7m8s7R5LIhiJZmn1B616YpgyzqER5GeWi++WzjqdKvJm
 eNitumTK+7MksJbHgLWf1P0=
X-Google-Smtp-Source: AGHT+IFtn34MZGOJTJPoUlS84mWDoS7tZj77ECGknkw0pwVUPjcpnDLuAHDZjQKn2w0ODzoMCoyY0A==
X-Received: by 2002:a05:620a:944b:b0:776:5135:d96d with SMTP id
 sm11-20020a05620a944b00b007765135d96dmr4957508qkn.69.1699579513829; 
 Thu, 09 Nov 2023 17:25:13 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05620a11ac00b007756c8ce8f5sm340439qkk.59.2023.11.09.17.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 17:25:13 -0800 (PST)
Message-ID: <42d3b0c0-bad6-4ac2-b755-6cbfc5ec5524@gmail.com>
Date: Thu, 9 Nov 2023 20:25:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH drm-misc-next v6] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
References: <20231110001638.71750-1-dakr@redhat.com>
 <e2ec5036-81bd-490b-bdc2-fc215e14b8b1@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <e2ec5036-81bd-490b-bdc2-fc215e14b8b1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bPvpcKrN0Yc0NcbiEaGlhd20"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bPvpcKrN0Yc0NcbiEaGlhd20
Content-Type: multipart/mixed; boundary="------------kgLzOj4RzCBhSFeyZnEhB2ij";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <42d3b0c0-bad6-4ac2-b755-6cbfc5ec5524@gmail.com>
Subject: Re: [PATCH drm-misc-next v6] drm/sched: implement dynamic job-flow
 control
References: <20231110001638.71750-1-dakr@redhat.com>
 <e2ec5036-81bd-490b-bdc2-fc215e14b8b1@gmail.com>
In-Reply-To: <e2ec5036-81bd-490b-bdc2-fc215e14b8b1@gmail.com>

--------------kgLzOj4RzCBhSFeyZnEhB2ij
Content-Type: multipart/mixed; boundary="------------E8VXvVACxyfdc08ijFfa0Jwv"

--------------E8VXvVACxyfdc08ijFfa0Jwv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-09 19:57, Luben Tuikov wrote:
> On 2023-11-09 19:16, Danilo Krummrich wrote:
[snip]
>> @@ -667,6 +771,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>   * drm_sched_job_init - init a scheduler job
>>   * @job: scheduler job to init
>>   * @entity: scheduler entity to use
>> + * @credits: the number of credits this job contributes to the schedu=
lers
>> + * credit limit
>>   * @owner: job owner for debugging
>>   *
>>   * Refer to drm_sched_entity_push_job() documentation
>> @@ -684,7 +790,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>   */
>>  int drm_sched_job_init(struct drm_sched_job *job,
>>  		       struct drm_sched_entity *entity,
>> -		       void *owner)
>> +		       u32 credits, void *owner)
>>  {
>>  	if (!entity->rq) {
>>  		/* This will most likely be followed by missing frames
>> @@ -695,7 +801,11 @@ int drm_sched_job_init(struct drm_sched_job *job,=

>>  		return -ENOENT;
>>  	}
>> =20
>> +	if (unlikely(!credits))
>> +		return -EINVAL;
>> +
>=20
> This will most likely result in bad user experience (read: blank screen=
),
> and debugging this would be really hard without something to go by
> in the kernel log.
>=20
> (This was exactly the case with amdgpu when 56e449603f0ac5
> ("drm/sched: Convert the GPU scheduler to variable number of run-queues=
")=20
> was being worked on and merged. Without the drm_err() on missing rq in
> the lines immediately before the hunk above returning -ENOENT, there
> was no indication why setting up an fb was failing very early on (blank=
 screen).)
>=20
> So it is best to print a "[drm] *ERROR* "-equivalent string in the logs=
,
> so that we can make a note of this, without relying on drivers, old and=
 new, logging
> that drm_sched_job_init() failed.

If you add _exactly_ this,

	if (unlikely(!credits)) {
		pr_err("*ERROR* %s: credits cannot be 0!\n", __func__)
		return -EINVAL;
	}

You can add my,

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

and push it.
--=20
Regards,
Luben

--------------E8VXvVACxyfdc08ijFfa0Jwv
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

--------------E8VXvVACxyfdc08ijFfa0Jwv--

--------------kgLzOj4RzCBhSFeyZnEhB2ij--

--------------bPvpcKrN0Yc0NcbiEaGlhd20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZU2GcAUDAAAAAAAKCRBMFUeUMaM0r53R
AP4m/2BjdiWwu8IVlgMIUrqMF3AM/9iDocTx2+iMM4NYTQEA2dsqYHnnTHFYCAsDILyTssactkuL
aFOznk95n6x1NQU=
=WX/n
-----END PGP SIGNATURE-----

--------------bPvpcKrN0Yc0NcbiEaGlhd20--
