Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3B7EEB69
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 04:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E510C10E71A;
	Fri, 17 Nov 2023 03:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3795810E71A;
 Fri, 17 Nov 2023 03:25:22 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-779fb118fe4so88471485a.2; 
 Thu, 16 Nov 2023 19:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700191521; x=1700796321; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v1SDUzSFIVlsm8bGOfhaQX+ULqWCGXJxzSUdDsIqu9M=;
 b=TVkHq061/qb8iwZStZ7HbW+Va4hL/g80lRHNNaxcPj8iB2kLXryij189hr2SPsM2ms
 yELf6Pz69gE/oj7/sh20De45INH1eXcVASd4Zus+W8UEQmWorVyK9iAyFu1VB6zmim3n
 qO1nzBqqI9Ejy7a9Kx8zxCx5Pod/RRzb8X7gCmOkkoFZp/U6XViY8g4EYKXQPSSpuW+x
 oVepQg2mXTV8nplWURRIO0DwaO0DZizEj5ZnROXUPcYbTpmu97rJc9huSz8MrKRAezyG
 BANGHFTrpURxUZJA3+QQ8q5ej3NtmZpIDNQFxWUvnJospKOPM4XU0A77fHv0Zdn0d+zY
 h3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700191521; x=1700796321;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v1SDUzSFIVlsm8bGOfhaQX+ULqWCGXJxzSUdDsIqu9M=;
 b=eCy4TDbAg1fqFtvlP5bJnjTSEIoCu0SGEhbJMkkcVKauMuyIT5qdVSrUUJZJF96GMT
 BzkeEtRtjySOAusH7oAFxPoXzuzv7iZYcOS6eFcW7hFLNqLxwHaz5/b5X+aAq3zK3KIC
 6lbbzc5mP3O0zh4JYWDzGvGWiHs1sQ4HzhfvirUDHuiHvob8xqiUnmZSOftnsQ937jmy
 RWwjSoBNy9678W+CDd0UvofCMkswPblkR6Y45tA4ZbPqeqNKsKW0jcKwqS1Z0MWuKKKG
 yheOVaMEAsXXMfA8Y4eP+LPrYuLOB9O9hPco7i7Mg0gTRDz4UpwUiPl+f14EIlQeZa+z
 Os5g==
X-Gm-Message-State: AOJu0YyZAxFvjAyeGs0kqwzc06XnZB7TjJsOlxnjlPLV66x75hdCMhYu
 LwQ0q3gq9MjyIDJdyoN0EB2igQyuW9gdRXrxeQw=
X-Google-Smtp-Source: AGHT+IHlNtO9TnTbRjGbgMA2BKNdAlzBzZ+wN4lWbeifm++n4twOM1k+C2cGls14ZeVhL+f7W8Rb8w==
X-Received: by 2002:a05:620a:2684:b0:774:a80:3e0b with SMTP id
 c4-20020a05620a268400b007740a803e0bmr11906160qkp.5.1700191521091; 
 Thu, 16 Nov 2023 19:25:21 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 py13-20020a05620a878d00b007742c2ad7dfsm300954qkn.73.2023.11.16.19.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 19:25:20 -0800 (PST)
Message-ID: <ce94020e-a7d4-4799-b87d-fbea7b14a268@gmail.com>
Date: Thu, 16 Nov 2023 22:25:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.3
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Content-Language: en-CA, en-US
To: Maxime Ripard <mripard@redhat.com>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <53oamsiakocoohdvs2raagdpzfj73xlrxuxvrsdvxkkwxdrm3m@dlu2tno6tjgv>
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
In-Reply-To: <53oamsiakocoohdvs2raagdpzfj73xlrxuxvrsdvxkkwxdrm3m@dlu2tno6tjgv>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tb0AQQDQteMC5n59MRtH5kce"
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tb0AQQDQteMC5n59MRtH5kce
Content-Type: multipart/mixed; boundary="------------PRYWEDVvvffGiUImSZzlRUmT";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <ce94020e-a7d4-4799-b87d-fbea7b14a268@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <53oamsiakocoohdvs2raagdpzfj73xlrxuxvrsdvxkkwxdrm3m@dlu2tno6tjgv>
In-Reply-To: <53oamsiakocoohdvs2raagdpzfj73xlrxuxvrsdvxkkwxdrm3m@dlu2tno6tjgv>

--------------PRYWEDVvvffGiUImSZzlRUmT
Content-Type: multipart/mixed; boundary="------------9EdLsqEF2vj8FfubgQ0DbAQ7"

--------------9EdLsqEF2vj8FfubgQ0DbAQ7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-16 04:22, Maxime Ripard wrote:
> Hi,
>=20
> On Mon, Nov 13, 2023 at 09:56:32PM -0500, Luben Tuikov wrote:
>> On 2023-11-13 21:45, Stephen Rothwell wrote:
>>> Hi Luben,
>>>
>>> On Mon, 13 Nov 2023 20:32:40 -0500 Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>>>>
>>>> On 2023-11-13 20:08, Luben Tuikov wrote:
>>>>> On 2023-11-13 15:55, Stephen Rothwell wrote: =20
>>>>>> Hi all,
>>>>>>
>>>>>> Commit
>>>>>>
>>>>>>   0da611a87021 ("dma-buf: add dma_fence_timestamp helper")
>>>>>>
>>>>>> is missing a Signed-off-by from its committer.
>>>>>> =20
>>>>>
>>>>> In order to merge the scheduler changes necessary for the Xe driver=
, those changes
>>>>> were based on drm-tip, which included this change from drm-misc-fix=
es, but which
>>>>> wasn't present in drm-misc-next.
>>>>>
>>>>> I didn't want to create a merge conflict between drm-misc-next and =
drm-misc-fixes,
>>>>> when pulling that change from drm-misc-next to drm-misc-fixes, so t=
hat I can apply =20
>>>>
>>>> ... when pulling that change from from drm-misc-fixes into drm-misc-=
next, so that I can apply...
>>>>
>>>>> the Xe scheduler changes on top of drm-misc-next. =20
>>>>
>>>> The change in drm-misc-fixes is b83ce9cb4a465b. The latter is contai=
ned
>>>> in linus-master, and in drm-misc-fixes, while the former is in drm-m=
isc-next.
>>>> When we merge linus-master/drm-misc-fixes into drm-misc-next, or whi=
chever way
>>>> it happens, I'd like to avoid a merge conflict, but wanted to expedi=
te the changes
>>>> for Xe.
>>>
>>> None of that is relevant ... if you commit a patch to a tree that wil=
l
>>> be in the linux kernel tree, you must add your Signed-off-by to the c=
ommit.
>>
>> Noted!
>>
>> So I always do this when I do git-am and such, but wasn't sure for thi=
s one single cherry-pick whose
>> original author was the committer in drm-misc-fixes, but will add my S=
igned-off-by in those
>> rare circumstances.
>>
>> Thanks for the clarification!
>=20
> In order to move forward with this, can you provide your SoB here for
> that patch so that we can at least point to it in the drm-misc-next PR?=

>=20
> Maxime

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>

--=20
Regards,
Luben

--------------9EdLsqEF2vj8FfubgQ0DbAQ7
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

--------------9EdLsqEF2vj8FfubgQ0DbAQ7--

--------------PRYWEDVvvffGiUImSZzlRUmT--

--------------tb0AQQDQteMC5n59MRtH5kce
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVbdFwUDAAAAAAAKCRBMFUeUMaM0rxFD
AQDELq/dkzIFLrkuryNpi+8Gl6u0PD4LlkrT9ZQqHegrJgD7B93mLHQHkSblxphhQlpHR9xzdzEW
mYNhYe+mzLcYmA0=
=fRGW
-----END PGP SIGNATURE-----

--------------tb0AQQDQteMC5n59MRtH5kce--
