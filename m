Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058897EEB64
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 04:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1810E718;
	Fri, 17 Nov 2023 03:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0BD10E718
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 03:22:23 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-41e58a33ec9so8858581cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700191342; x=1700796142; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iiVbmahWDLnqUiWj4pYz3vhmV7NQIvNj/KInllVNKzs=;
 b=HdAmWLP8v8595t/SdipT7x/CtV5mLGXF5VCccw9AAwvVXG7qSo5F93rsdLh7cygIt9
 7XnGiBnS/XGFkh0CnzzGgY5xf2HpwDEy7wS5c6Nr/Htb+z11223p3lxPJUUuM47CwFUH
 sWunJOgd7opfifM80XkbDrSSE3S9KW71yrWYX654wuphlK/9AteiBvz6mTyrv97dN6Gm
 xvc0BdQgbPQYX/OS63Q0Gm7raM0gsvayDoJLaP9twBkJrAxM4M17sgnPWHJX761bU6Ki
 kEgGvnNOReGXV00FoRbfGLAUfzIfvqVQGwmYWtyDVlva3LuE0Vd3KZBTjMGywkpHRJgK
 6n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700191342; x=1700796142;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iiVbmahWDLnqUiWj4pYz3vhmV7NQIvNj/KInllVNKzs=;
 b=WXpel4LKe7zSSeLTSyBNcCU+vkxnWStTMbJ7fX/i3cjyL5bb0TTHuuwpvV/2J6ymKT
 KvNO4GF1e4XfezPkCTerRo5D1hhIG4hz35+R0mYRfxMwmluiJGWch0XQb+JbpufIEGWx
 xBMOb2vThstFxfYyYNu5pDqNkNopiBrvIaFo7kzFaBREXmi1DhlZkrEY1UVAI011vaM7
 j4XBT+eMuvHDN3TVmXcS6mCM0Cb9eE2aE8we/B4PJqvmRljXzzN8LHPZCHqeozqxnRYy
 9FeBMxoWVHHgzZ5/ujhrOxQoz1vuf4/9Qjm6vI+Mwb5ZcuON2Bb+N7/ll3J//QI/N2jW
 eJLw==
X-Gm-Message-State: AOJu0YzMbicwyzgvwD+3agQEpIVF3JasM7DJQG4nL/k1oVahipdRC2Ra
 wu3Y8DsoidfdGWYoQedfgOY=
X-Google-Smtp-Source: AGHT+IEl7nJWkJzFVBGSHyQJZIV+x/RGkyQiSTXFCaDlMvxjuDZDNu4+ZaV4no8mOI5MtEZd9cIJGQ==
X-Received: by 2002:a05:622a:1ba2:b0:418:1059:dfb9 with SMTP id
 bp34-20020a05622a1ba200b004181059dfb9mr11638834qtb.1.1700191342352; 
 Thu, 16 Nov 2023 19:22:22 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 m6-20020ac86886000000b0041969bc2e4csm289373qtq.32.2023.11.16.19.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 19:22:21 -0800 (PST)
Message-ID: <adc9ed22-6c3b-4d56-89b4-16258b16e963@gmail.com>
Date: Thu, 16 Nov 2023 22:22:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.3
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
Content-Language: en-CA, en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com> <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
 <87h6losf0p.fsf@intel.com> <fcec4d24-41d6-4897-bc2a-9ea7d3b4afd5@gmail.com>
 <871qcrs9u2.fsf@intel.com>
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
In-Reply-To: <871qcrs9u2.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U0IRTPeU78xTisBW62M0fbx0"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U0IRTPeU78xTisBW62M0fbx0
Content-Type: multipart/mixed; boundary="------------ryjh7f17DSsksuvfqsdtlp28";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <adc9ed22-6c3b-4d56-89b4-16258b16e963@gmail.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com> <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
 <87h6losf0p.fsf@intel.com> <fcec4d24-41d6-4897-bc2a-9ea7d3b4afd5@gmail.com>
 <871qcrs9u2.fsf@intel.com>
In-Reply-To: <871qcrs9u2.fsf@intel.com>

--------------ryjh7f17DSsksuvfqsdtlp28
Content-Type: multipart/mixed; boundary="------------qwtlEO6ufP0LyyhcL280Sin9"

--------------qwtlEO6ufP0LyyhcL280Sin9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-15 03:24, Jani Nikula wrote:
> On Tue, 14 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index a93a387f8a1a15..ce784118e4f762 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -453,7 +453,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const str=
uct device *dev,
>> =20
>>  /* Helper for struct drm_device based logging. */
>>  #define __drm_printk(drm, level, type, fmt, ...)                     =
  \
>> -       dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
>> +       dev_##level##type(drm ? (drm)->dev : NULL, "[drm] " fmt, ##__V=
A_ARGS__)
>=20
> I think that would be an improvement that stands on its own merits.
>=20
> Please also wrap the first drm in parens (drm).

Okay.

>=20
>> The output would be similar to that if drm->dev were NULL.
>=20
> Yes. I don't know how people will feel about intentionally using
> drm_err(NULL, ...) all over the place, but that's another matter. ;)

:-)

--=20
Regards,
Luben

--------------qwtlEO6ufP0LyyhcL280Sin9
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

--------------qwtlEO6ufP0LyyhcL280Sin9--

--------------ryjh7f17DSsksuvfqsdtlp28--

--------------U0IRTPeU78xTisBW62M0fbx0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVbcZQUDAAAAAAAKCRBMFUeUMaM0r+Tf
AP9FgfO13iqFbboyPGqzgka4cDmzh9mHMWmS340hOsRQiAEA0+UmguzPhkaR2USYJPXuIGV6AunR
ZOYtr2xHy2OAZgw=
=vG9e
-----END PGP SIGNATURE-----

--------------U0IRTPeU78xTisBW62M0fbx0--
