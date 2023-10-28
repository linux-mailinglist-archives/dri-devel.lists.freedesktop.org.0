Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA07DA511
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 05:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF7910E063;
	Sat, 28 Oct 2023 03:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A18910E063
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 03:51:57 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-66fa16092c0so19580236d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698465116; x=1699069916; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OcYVrWnBqjkY6s3i+KnosMsD6+eSYCyoMq5LSmyC1Rs=;
 b=JOxBN1kuQtmYIdOR/UWZ7T8+R0E/K1wc+4CdfQBev4Q1aw3QnM2VAGyGrCPvVuulI4
 jzpZ2R3LvuvA8DMmjtNKpnmfxqCas0RIYHwkZ50BYS6c+CBmhvNISjOPcprxZgjnnsUt
 aeYWOPZl2rc3c+O+YiHAmmUSKel9peR7MVdzhaZR1NEflGQjAxKCoOyXTwjbCzBtZITc
 4uFCbjPE+BwaTnQy0AaDLX0t1Ej+GEciuq44Og79q99g0jM5q4s0gDwE/wUiAAqAlg76
 j1HzYmgvxfLTWYbwMBluaQ8FvO3SCoD0NCZ3cPYoN0+u1Hk7tAkzsoHh0mePsM00OHgG
 mCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698465116; x=1699069916;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OcYVrWnBqjkY6s3i+KnosMsD6+eSYCyoMq5LSmyC1Rs=;
 b=UvX1Cxwd0JxxplSbAfcQD99jEZWBmI8eypjjcLh98/kgCVQuvr43DpgO1oprukSdhf
 cltofxk9lpXWgSA3kgsRmBG6EgAt5EV5/KWJInQpn2X/Nl/gKL+p42i6jqJgPfZCig1V
 a7BejPt2iUAG6h3nTMShnQsNLYriWDhUwIn2qOzBXGwGlk1GJ631EYDFccWpqr+1FEA3
 g3VHfb58M9ZIq+1tHwbtnZmffT1Apr/1Mdu1sLPrHkD4XGKAGKy91+890CUbq8lVYQSZ
 fVb1capyRbS3bUE7az1KPISv/LXhaAoj0pe0Ksb02L8G4Gk8wPywu1RDDs+RTEANVbN3
 4kJQ==
X-Gm-Message-State: AOJu0YxZLI0Gr3+ONNiLR+Ecj1dWhBpaS7e3XJmYlWg0w/LxbreQk4PO
 vfdA6gqBUNNnjlQuE1/ec8po1mCetPlOXjzCHLE=
X-Google-Smtp-Source: AGHT+IHegjfJS6Sn+Nb6aE7VowTH4ygmouXpG6CghxI9hbKHXUvAsu74yh9O8aqM5JTR+RhePdS2GA==
X-Received: by 2002:a05:6214:d06:b0:66d:69d1:d57a with SMTP id
 6-20020a0562140d0600b0066d69d1d57amr5571073qvh.38.1698465116411; 
 Fri, 27 Oct 2023 20:51:56 -0700 (PDT)
Received: from [192.168.2.14] ([64.231.246.137])
 by smtp.gmail.com with ESMTPSA id
 cy7-20020a05621418c700b0065b151d5d12sm1225626qvb.126.2023.10.27.20.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 20:51:56 -0700 (PDT)
Message-ID: <df7f500b-f911-4180-adf2-5a8b8bf2b6c7@gmail.com>
Date: Fri, 27 Oct 2023 23:51:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
 <a9215c37-61cd-4fbc-9f80-217daacd96bd@gmail.com>
 <20231027184143.4427edb8@collabora.com>
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
In-Reply-To: <20231027184143.4427edb8@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TqV7NTz0aDGZyZGGMAGPUxnM"
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
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 Danilo Krummrich <dakr@redhat.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TqV7NTz0aDGZyZGGMAGPUxnM
Content-Type: multipart/mixed; boundary="------------b0m804UtGjCwO8F33HypECbv";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@redhat.com>, matthew.brost@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, christian.koenig@amd.com
Message-ID: <df7f500b-f911-4180-adf2-5a8b8bf2b6c7@gmail.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
 <a9215c37-61cd-4fbc-9f80-217daacd96bd@gmail.com>
 <20231027184143.4427edb8@collabora.com>
In-Reply-To: <20231027184143.4427edb8@collabora.com>

--------------b0m804UtGjCwO8F33HypECbv
Content-Type: multipart/mixed; boundary="------------Luda7dot3zIxE6qlYy8TW7K5"

--------------Luda7dot3zIxE6qlYy8TW7K5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-27 12:41, Boris Brezillon wrote:
> On Fri, 27 Oct 2023 10:32:52 -0400
> Luben Tuikov <ltuikov89@gmail.com> wrote:
>=20
>> On 2023-10-27 04:25, Boris Brezillon wrote:
>>> Hi Danilo,
>>>
>>> On Thu, 26 Oct 2023 18:13:00 +0200
>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>  =20
>>>> Currently, job flow control is implemented simply by limiting the nu=
mber
>>>> of jobs in flight. Therefore, a scheduler is initialized with a cred=
it
>>>> limit that corresponds to the number of jobs which can be sent to th=
e
>>>> hardware.
>>>>
>>>> This implies that for each job, drivers need to account for the maxi=
mum
>>>> job size possible in order to not overflow the ring buffer.
>>>>
>>>> However, there are drivers, such as Nouveau, where the job size has =
a
>>>> rather large range. For such drivers it can easily happen that job
>>>> submissions not even filling the ring by 1% can block subsequent
>>>> submissions, which, in the worst case, can lead to the ring run dry.=

>>>>
>>>> In order to overcome this issue, allow for tracking the actual job s=
ize
>>>> instead of the number of jobs. Therefore, add a field to track a job=
's
>>>> credit count, which represents the number of credits a job contribut=
es
>>>> to the scheduler's credit limit.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>> Changes in V2:
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>   - fixed up influence on scheduling fairness due to consideration o=
f a job's
>>>>     size
>>>>     - If we reach a ready entity in drm_sched_select_entity() but ca=
n't actually
>>>>       queue a job from it due to size limitations, just give up and =
go to sleep
>>>>       until woken up due to a pending job finishing, rather than con=
tinue to try
>>>>       other entities.
>>>>   - added a callback to dynamically update a job's credits (Boris)  =

>>>
>>> This callback seems controversial. I'd suggest dropping it, so the
>>> patch can be merged. =20
>>
>> Sorry, why is it controversial? (I did read back-and-forth above, but =
it wasn't clear
>> why it is /controversial/.)
>=20
> That's a question for Christian, I guess. I didn't quite get what he
> was worried about, other than this hook introducing a new way for
> drivers to screw things up by returning funky/invalid credits (which we=


It's up to the driver--they can test, test, test, and fix their code and =
so on.
We can only do so much and shouldn't be baby-sitting drivers ad nauseam. =
Drivers
can also not define this callback. :-)

> can report with WARN_ON()s). But let's be honest, there's probably a
> hundred different ways (if not more) drivers can shoot themselves in th=
e
> foot with drm_sched already...

Yes, that's true. So there's no worries with this hook.

>=20
>>
>> I believe only drivers are privy to changes in the credit availability=
 as their
>> firmware and hardware executes new jobs and finishes others, and so th=
is "update"
>> here is essential--leaving it only to prepare_job() wouldn't quite ful=
fill the vision
>> of why the credit mechanism introduced by this patch in the first plac=
e.
>=20
> I kinda agree with you, even if I wouldn't so pessimistic as to how
> useful this patch would be without the ->update_job_credits() hook
> (it already makes the situation a lot better for Nouveau and probably
> other drivers too).

Sure, and that's a good thing.

The heart of the dynamic credit scheme this patch is introducing *is* upd=
ate_job_credits()
callback. Without it, it's just about like the current job flow-control s=
cheme we have with
varied job weights (credits). Remember, it is an optional callback and dr=
iver can choose NOT
to define it--simple. :-)

So, I'm very excited about this, and see a wide range of applications and=
 tricks drivers
can do with the credit scheme (albeit had it been an "int" bwha-ha-ha-ha =
]:-> ).

Have a good weekend everyone!
--=20
Regards,
Luben

--------------Luda7dot3zIxE6qlYy8TW7K5
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

--------------Luda7dot3zIxE6qlYy8TW7K5--

--------------b0m804UtGjCwO8F33HypECbv--

--------------TqV7NTz0aDGZyZGGMAGPUxnM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZTyFUwUDAAAAAAAKCRBMFUeUMaM0ry9R
AP99ffr4HYHt8VGCMy5iROcK4QMbSPUNs06YvL6SzaTxQwEAqh4nRjiYzJKeiyxwSx34v4pieDcI
66KeJE5oT9sCpAU=
=vUY+
-----END PGP SIGNATURE-----

--------------TqV7NTz0aDGZyZGGMAGPUxnM--
