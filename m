Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013187E4F73
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 04:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AB110E6F8;
	Wed,  8 Nov 2023 03:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1909F10E369;
 Wed,  8 Nov 2023 03:28:36 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-777745f1541so453063085a.0; 
 Tue, 07 Nov 2023 19:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699414115; x=1700018915; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hhDgUr0rU5mZRf9jreUMZWAzGSayLhVYle46Qmy8nhE=;
 b=J5wfVJTkNXbFDdQVCQMsTCphzk26rr2uHeymaIdvisiVaMQnikNBPQI0f9ECwH5geY
 NThDMsSvJBxxB0isDhNr7U5kXzTvrW5fNzmPPmlVzRLQIFxxAoeCz5SojICxudj2ilSs
 TTE3HHfUrIfV+xgcKR1zTt4JmoVwBgwsulgbNOTZ24SH5KaW+nnJf5s/sSVxCgxNWaac
 UGlgN7+ZK/Q6h2ZI/lHkf26sb/Upx4d+oWjKAJP9lBTHRgFcEXSYnsBW36DCi4FM3df+
 6NlYy7vQjzeC8Vli/RD1rqpMNS1g1Q9t9FDn8ACGpALYhyr+CTBYxOFaYRQjMwZtdjlq
 4VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699414115; x=1700018915;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hhDgUr0rU5mZRf9jreUMZWAzGSayLhVYle46Qmy8nhE=;
 b=K3CRhWzzq9Mg0qZQ8Ae5ywrso0SJKLZD00aYuh9bPb/sCnxLxiv7COvGVJvkySRnOG
 G94BmkBiWonpNSbSFSWhuKYHpBhMx+msZF7A537SMd9wcKt90cHRLb2HiHKWj09JV1RE
 jnIFdcoS1xiw9zdEt3KbK3KLikTlowKz+BDL9uMnqwCeCRXdwmsyBqdF/wlevb7/YgQa
 Te+2bGAj/BItbaLIVCheGDZkNVzSHtRAxXAvuUYL7AAnG+z+s4OFabqbPKJGmVzha8JY
 mCl2hyv8c42r6CSYGtp3yTTIK6gGZCV/lpti+R6Pv2qouC6Y7CHK2Nk7fvy6piYUWX+I
 NnVQ==
X-Gm-Message-State: AOJu0YzcQjNAkEq67Bh8+B6BzrAcVFbc7H+eaXdpdZx74cL7Wl9yNfAy
 oGfvJPexDNbCdLpKZzaMT3Q=
X-Google-Smtp-Source: AGHT+IEam4wjWprneVY14YYI+fg4TBXKF2xpLKQp09zLgFHHV+QW3KmakWk+RSWxD1bJF/MtTM1eWg==
X-Received: by 2002:ac8:5a44:0:b0:41e:3e18:e094 with SMTP id
 o4-20020ac85a44000000b0041e3e18e094mr1183580qta.26.1699414114960; 
 Tue, 07 Nov 2023 19:28:34 -0800 (PST)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 k20-20020ac84794000000b004179e79069asm403216qtq.21.2023.11.07.19.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 19:28:34 -0800 (PST)
Message-ID: <64aec3c6-7df4-4d11-a9b8-b4f718d50a43@gmail.com>
Date: Tue, 7 Nov 2023 22:28:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <ZUokEKnPbLAAkCct@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZUokEKnPbLAAkCct@DUT025-TGLU.fm.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oZeOpSZh3hOLLEQ13dmdBstt"
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
Cc: robdclark@chromium.org, tvrtko.ursulin@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oZeOpSZh3hOLLEQ13dmdBstt
Content-Type: multipart/mixed; boundary="------------IihkTqJDkUpRHZTrVDwN1EKK";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: tvrtko.ursulin@linux.intel.com, Liviu.Dudau@arm.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com, intel-xe@lists.freedesktop.org,
 ketil.johnsen@arm.com, lina@asahilina.net, ltuikov@yahoo.com,
 mcanal@igalia.com, robdclark@chromium.org, sarah.walker@imgtec.com
Message-ID: <64aec3c6-7df4-4d11-a9b8-b4f718d50a43@gmail.com>
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <ZUokEKnPbLAAkCct@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZUokEKnPbLAAkCct@DUT025-TGLU.fm.intel.com>

--------------IihkTqJDkUpRHZTrVDwN1EKK
Content-Type: multipart/mixed; boundary="------------ztivjG1qWbr81sPaO0geveaH"

--------------ztivjG1qWbr81sPaO0geveaH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-07 06:48, Matthew Brost wrote:
> On Mon, Nov 06, 2023 at 11:10:21PM -0500, Luben Tuikov wrote:
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
>>     Add fixes-tag. (Tvrtko)
>>
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")=

>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thank you, sir!
--=20
Regards,
Luben

--------------ztivjG1qWbr81sPaO0geveaH
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

--------------ztivjG1qWbr81sPaO0geveaH--

--------------IihkTqJDkUpRHZTrVDwN1EKK--

--------------oZeOpSZh3hOLLEQ13dmdBstt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUsAWQUDAAAAAAAKCRBMFUeUMaM0r7V1
AQCVc9vXOQOHPMwabC7F41NCzU8R0LQwrRTQwnnhjQFfWwD/e25l2uACseWrwwqtTDgVxmM8CWSE
qHSKfPU8vWTiog8=
=mHWb
-----END PGP SIGNATURE-----

--------------oZeOpSZh3hOLLEQ13dmdBstt--
