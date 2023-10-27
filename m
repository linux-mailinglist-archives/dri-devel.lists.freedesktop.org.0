Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01B7D9B78
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969510E9BD;
	Fri, 27 Oct 2023 14:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67B810E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:33:02 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-584042e7f73so1153226eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698417182; x=1699021982; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CpdGlrhIkHOtBTG4xIg7MKLAautQ7JbXFpIzulYae/o=;
 b=IWJCIcg/Gc1OLbpAiW+xtY14DJE6jzPaCif6PtHEzV66jvFWNJriR5zrx+LAz0LT9+
 hpgAaLxIfbZxemrXHU/xg/tY64PCNwBi8e80eGS9PZu3yRs+D0coMtE90cDuNPOdwVWW
 vtiGVFzOViKpZsBJGINrp8ojSrFVACCtOf8VAXRIVOnVXnxXCPHwoLawKKkaIDx3gepT
 oqbHZ3/xHyF3saFMkP1Qbbz3KuIuZxM1SU+7uVnbJlv5D7pkmvlyOIxkj36shQjc0TAq
 Oyzq8nTeqbvj0Kiazut7EyN0qASwduRy4AANMGDS3NwSKRpdOM5ZY6vpQSiqbdGMvtFr
 w03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698417182; x=1699021982;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpdGlrhIkHOtBTG4xIg7MKLAautQ7JbXFpIzulYae/o=;
 b=aGpWOr73tl0+2PAMjrAOcTnlmlliR1Z74NDU/bQFgkQRNeWF7JPtltESJdWxH3K0qu
 yJVqtQSZEpZ1w9Z4ouLL1xySi54LHUsIu0jeUXlyl4rKTGygSwWvn7x/zhfBs8fb1Qa8
 QPgp0RwKOAjyiaBld2sl0BXmuRj+4AritNB7ngmEg4re1d0lYucdqpoUGgcH6mdCt669
 WnzckyNbF6Dedd9ss3nMwCpV+1SGkmikZSH0o3X8nMJkEs0tInN/NDjU0e9whM9Mb2oO
 /aA8/fO8mYTjo5A2Mm9PugbhX2pK7jvu+sK3PRnF78IZ/JP0Ama9d3YhjjTl1oeOlAnB
 e19Q==
X-Gm-Message-State: AOJu0YwCM30iIHR0dLVSrAqkf4+dIHu9Xr4DJagMDNylax8fCLfqrcvQ
 bEPSVh52tajvyHVt4DyuaIo=
X-Google-Smtp-Source: AGHT+IF/03cFrqTJn8+O4ys2b4VjFDTKEBXHF7ZPV37R13mCKzXZTO5FNCeultSc3iwIboLOAI59jQ==
X-Received: by 2002:a05:6358:186:b0:168:dea8:8897 with SMTP id
 d6-20020a056358018600b00168dea88897mr4449782rwa.22.1698417181757; 
 Fri, 27 Oct 2023 07:33:01 -0700 (PDT)
Received: from [192.168.2.14] ([64.231.246.137])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a0cf807000000b00655d6d31470sm658768qvn.43.2023.10.27.07.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 07:33:01 -0700 (PDT)
Message-ID: <a9215c37-61cd-4fbc-9f80-217daacd96bd@gmail.com>
Date: Fri, 27 Oct 2023 10:32:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
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
In-Reply-To: <20231027102516.0e4b00ef@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zBbQHo0nGdz20abYaC4EXeG0"
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zBbQHo0nGdz20abYaC4EXeG0
Content-Type: multipart/mixed; boundary="------------M3s91CY0sQdA9iUwyyOVqLNg";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Message-ID: <a9215c37-61cd-4fbc-9f80-217daacd96bd@gmail.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
In-Reply-To: <20231027102516.0e4b00ef@collabora.com>

--------------M3s91CY0sQdA9iUwyyOVqLNg
Content-Type: multipart/mixed; boundary="------------vrFRQuCgLc5Nc6W7iMwOFl6n"

--------------vrFRQuCgLc5Nc6W7iMwOFl6n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-27 04:25, Boris Brezillon wrote:
> Hi Danilo,
>=20
> On Thu, 26 Oct 2023 18:13:00 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
>=20
>> Currently, job flow control is implemented simply by limiting the numb=
er
>> of jobs in flight. Therefore, a scheduler is initialized with a credit=

>> limit that corresponds to the number of jobs which can be sent to the
>> hardware.
>>
>> This implies that for each job, drivers need to account for the maximu=
m
>> job size possible in order to not overflow the ring buffer.
>>
>> However, there are drivers, such as Nouveau, where the job size has a
>> rather large range. For such drivers it can easily happen that job
>> submissions not even filling the ring by 1% can block subsequent
>> submissions, which, in the worst case, can lead to the ring run dry.
>>
>> In order to overcome this issue, allow for tracking the actual job siz=
e
>> instead of the number of jobs. Therefore, add a field to track a job's=

>> credit count, which represents the number of credits a job contributes=

>> to the scheduler's credit limit.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>> Changes in V2:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>   - fixed up influence on scheduling fairness due to consideration of =
a job's
>>     size
>>     - If we reach a ready entity in drm_sched_select_entity() but can'=
t actually
>>       queue a job from it due to size limitations, just give up and go=
 to sleep
>>       until woken up due to a pending job finishing, rather than conti=
nue to try
>>       other entities.
>>   - added a callback to dynamically update a job's credits (Boris)
>=20
> This callback seems controversial. I'd suggest dropping it, so the
> patch can be merged.

Sorry, why is it controversial? (I did read back-and-forth above, but it =
wasn't clear
why it is /controversial/.)

I believe only drivers are privy to changes in the credit availability as=
 their
firmware and hardware executes new jobs and finishes others, and so this =
"update"
here is essential--leaving it only to prepare_job() wouldn't quite fulfil=
l the vision
of why the credit mechanism introduced by this patch in the first place.
--=20
Regards,
Luben

--------------vrFRQuCgLc5Nc6W7iMwOFl6n
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

--------------vrFRQuCgLc5Nc6W7iMwOFl6n--

--------------M3s91CY0sQdA9iUwyyOVqLNg--

--------------zBbQHo0nGdz20abYaC4EXeG0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZTvKFAUDAAAAAAAKCRBMFUeUMaM0rykV
AQC2uWndwUzaOjsm0B4ArlehJLxJdgkhjAU6cRSrqPbGFQEAzQO8/yIHT9LKQ4J3SXO0uMYyJu4y
4l+ltVrrttUSoQM=
=obLk
-----END PGP SIGNATURE-----

--------------zBbQHo0nGdz20abYaC4EXeG0--
