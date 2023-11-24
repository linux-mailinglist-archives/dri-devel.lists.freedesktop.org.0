Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C27F85CC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 23:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCF610E0F9;
	Fri, 24 Nov 2023 22:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7A710E0E8;
 Fri, 24 Nov 2023 22:09:09 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-67a18ee7d3bso5678636d6.2; 
 Fri, 24 Nov 2023 14:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700863748; x=1701468548; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=p5jq6bMsgUGPiFk66dyTJtdzMrKRCMjH0MYq0aCEy/o=;
 b=El2wygHzW1478TRsKiU6JpJxv6o2Blafkmh9weuDLmgxrd5snGPSH33pEpZhnsB9ol
 8P+rQXdYdUPSa0L2iuJttfoa3ZxuPhZXm/P7Ltthtr862UGk6eRL6x4TAYICDK2mYBm4
 DLg1VrgAnIUht/g7JFSDct5Ni35WEeEpxmyIlxCmnxzW/Tz7O25d9oNZDWgSLvtmUf+E
 GZNttBakXWZuWWHv6T/prWhIGWJIHhzUyxtedlZZIUK84j0Fypn1062P1NoZwTI1j9E1
 QTLaHADu9DclshbtriowB3OPVVtelDGtIJ2azElGyVdUHeLrf0tIuNHqkmDLScyhuPp5
 ++/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700863748; x=1701468548;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5jq6bMsgUGPiFk66dyTJtdzMrKRCMjH0MYq0aCEy/o=;
 b=rr5020JhLrW5i3nvzhvJUo36zz3H/+rU7l8DS+n/tFizYYR8S8sqsQqm90QaakdYyE
 x1I4UvIqpMeQpS1E1dfQvVsWxBPMJ5ccw45gJW7gprbixU2+C9kfGIBGT6KGfpAoMUlJ
 ESpCHeAzHVrtK1RqqT0sXPsBGwxwLgZqpjDGunlDGc06gFvhXc2OpQ8f2F+rQ6IG/d3U
 e1fx29KYNC4nVBayrVvqAW4tVyhZHGauCSSUVqlO5vYOeT0XnRL49UJQrdpTAA+Mb2EC
 iMnQ0kzHWGFw8JNyUaZnkiQ3vM1ZuMPZKTLApgHt1PGp5Q52+PgOvki3rkt5I04RXBeO
 4Bng==
X-Gm-Message-State: AOJu0YzMlcUt2op6HctiqceYeU/eJjBdFmkFPKuweJmthBvw/XCBMyYF
 5S6PPlkF2D+pncTK7/k9t/o=
X-Google-Smtp-Source: AGHT+IHfJVOOQfdhgbWqzbStTtnemaLOgLfCVB/UY+Yn5CNlEU2QGbgICBHtKpORP5pH4aksozkcBw==
X-Received: by 2002:a05:622a:18c:b0:423:839d:b420 with SMTP id
 s12-20020a05622a018c00b00423839db420mr5571376qtw.12.1700863748028; 
 Fri, 24 Nov 2023 14:09:08 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 l9-20020ac84589000000b00421c31faf05sm1576779qtn.1.2023.11.24.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 14:09:07 -0800 (PST)
Message-ID: <8826c01f-aad1-473e-8e0c-001f1d163d8c@gmail.com>
Date: Fri, 24 Nov 2023 17:08:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Content-Language: en-CA, en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@redhat.com>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <20231114140855.0b259b2d@canb.auug.org.au>
 <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
 <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
 <ZVXSjt_1uWHuYXsq@phenom.ffwll.local>
 <zuz7zpcjfqzeymfrn53tbhcsem5abqh2l4vcaqkxo5wbgoc742@bnxnkek3wv6t>
 <ed5f8aa6-c46b-414a-a10e-afcdd3535487@gmail.com> <878r6n9tk7.fsf@intel.com>
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
In-Reply-To: <878r6n9tk7.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qfXvmiTkRGuPv3FRkdKwtrCo"
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qfXvmiTkRGuPv3FRkdKwtrCo
Content-Type: multipart/mixed; boundary="------------vulLOyCY816HU9YzfQMVDng7";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Message-ID: <8826c01f-aad1-473e-8e0c-001f1d163d8c@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <20231114140855.0b259b2d@canb.auug.org.au>
 <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
 <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
 <ZVXSjt_1uWHuYXsq@phenom.ffwll.local>
 <zuz7zpcjfqzeymfrn53tbhcsem5abqh2l4vcaqkxo5wbgoc742@bnxnkek3wv6t>
 <ed5f8aa6-c46b-414a-a10e-afcdd3535487@gmail.com> <878r6n9tk7.fsf@intel.com>
In-Reply-To: <878r6n9tk7.fsf@intel.com>

--------------vulLOyCY816HU9YzfQMVDng7
Content-Type: multipart/mixed; boundary="------------SasSK20J2kIE0hFWIl1iXXaL"

--------------SasSK20J2kIE0hFWIl1iXXaL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-24 08:20, Jani Nikula wrote:
> On Wed, 22 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> On 2023-11-22 07:00, Maxime Ripard wrote:
>>> Hi Luben,
>>>
>>> On Thu, Nov 16, 2023 at 09:27:58AM +0100, Daniel Vetter wrote:
>>>> On Thu, Nov 16, 2023 at 09:11:43AM +0100, Maxime Ripard wrote:
>>>>> On Tue, Nov 14, 2023 at 06:46:21PM -0500, Luben Tuikov wrote:
>>>>>> On 2023-11-13 22:08, Stephen Rothwell wrote:
>>>>>>> BTW, cherry picking commits does not avoid conflicts - in fact it=
 can
>>>>>>> cause conflicts if there are further changes to the files affecte=
d by
>>>>>>> the cherry picked commit in either the tree/branch the commit was=

>>>>>>> cheery picked from or the destination tree/branch (I have to deal=
 with
>>>>>>> these all the time when merging the drm trees in linux-next).  Mu=
ch
>>>>>>> better is to cross merge the branches so that the patch only appe=
ars
>>>>>>> once or have a shared branches that are merged by any other branc=
h that
>>>>>>> needs the changes.
>>>>>>>
>>>>>>> I understand that things are not done like this in the drm trees =
:-(
>>>>>>
>>>>>> Hi Stephen,
>>>>>>
>>>>>> Thank you for the clarification--understood. I'll be more careful =
in the future.
>>>>>> Thanks again! :-)
>>>>>
>>>>> In this case, the best thing to do would indeed have been to ask th=
e
>>>>> drm-misc maintainers to merge drm-misc-fixes into drm-misc-next.
>>>>>
>>>>> We're doing that all the time, but we're not ubiquitous so you need=
 to
>>>>> ask us :)
>>>>>
>>>>> Also, dim should have caught that when you pushed the branch. Did y=
ou
>>>>> use it?
>>>>
>>>> Yeah dim must be used, exactly to avoid these issues. Both for apply=
ing
>>>> patches (so not git am directly, or cherry-picking from your own
>>>> development branch), and for pushing. The latter is even checked for=
 by
>>>> the server (dim sets a special push flag which is very long and cont=
ains a
>>>> very clear warning if you bypass it).
>>>>
>>>> If dim was used, this would be a bug in the dim script that we need =
to
>>>> fix.
>>>
>>> It would be very useful for you to explain what happened here so we
>>> improve the tooling or doc and can try to make sure it doesn't happen=

>>> again
>>>
>>> Maxime
>>
>> There is no problem with the tooling--I just forced the commit in.
>=20
> Wait what?
>=20
> What do you mean by forcing the commit in? Bypass dim?
>=20
> If yes, please *never* do that when you're dealing with dim managed
> branches. That's part of the deal for getting commit access, along with=

> following all the other maintainer tools documentation.

Hi Jani,

I only use dim, ever.
--=20
Regards,
Luben

--------------SasSK20J2kIE0hFWIl1iXXaL
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

--------------SasSK20J2kIE0hFWIl1iXXaL--

--------------vulLOyCY816HU9YzfQMVDng7--

--------------qfXvmiTkRGuPv3FRkdKwtrCo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWEe+gUDAAAAAAAKCRBMFUeUMaM0r3yx
APsGBcnleYkHwHi1hlzpZ7PbwYhbXdYUug+/6s0bF9nySQD8CQ4YyOqbLG1jVvzrdKY3QcCWQCE3
GCDRaaC426Wy3wA=
=bIMq
-----END PGP SIGNATURE-----

--------------qfXvmiTkRGuPv3FRkdKwtrCo--
