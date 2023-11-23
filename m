Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A827F55EB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 02:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2D710E6BD;
	Thu, 23 Nov 2023 01:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A796710E6BD;
 Thu, 23 Nov 2023 01:34:38 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-77d66c7af31so94832585a.1; 
 Wed, 22 Nov 2023 17:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700703278; x=1701308078; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FVvQm7dNdcrEw+By/HnAz+p8UyFgjuaek7oRs10lPJY=;
 b=mcROjoCqV4kU5Sr7HJaY1etgGBHnkXaYuj0SAY4P37q0Ediz99BhI2RFfm0df6QlIV
 qXCWpQKTOmILsr1zLV8rv5jSw9FAqrEkV6EXv9ocMdzfmwTxhy4ek9Kl1wpD2BGmC2Vf
 fm/a4QUP844MI/TTiO/LsvHsg6KnPRuENSVmkOmTEAb0igpO9pe0EGgQKKKc9kh0W+c0
 PbgIlysdoKvaSpNdapBGr6aqAIIF5U6PLVfnHjynG4nEsAAFKqEbR95cXaOzqk2Q99/R
 2xJs7w6CNKINE+VBDN0JqGNx0WTGN2/R74Tta9lJ0FIv0y2uOjDmXAp92baOORrdSmvW
 gSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700703278; x=1701308078;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FVvQm7dNdcrEw+By/HnAz+p8UyFgjuaek7oRs10lPJY=;
 b=GfjPRUbggmgfGYnM3uBUYN2lWn2nFxHVXq51pNMHvN32aTuYCnAZzJmmPDIlC9bmBf
 FmjRZCj05g8AZHF13AVzLEwNMrcPk+nrZmcRIcauEd57mUyHP2MMh3CUUrxjSgoWhFlk
 89qd6rQL9bsOsrlIWfNDpjckoUBqb/OwvvJgwXXLjjWIIRufo5Iw4eSL3RSNLlSfjerX
 8rAzuTNDLh+JJwrgmZ8rKk0tr9/hzCf2J/cAum0DZXuD3k2G9HAPDhg7gwFKGeF36OFz
 c5/oQdsW3WmYk+70DwzluFH9qPLm2mWKQHeVrXerxE/YhuPuhIoF54yTbD+0UrwI40+E
 IfXQ==
X-Gm-Message-State: AOJu0YwEUTh8BSZ7FKQU59W/ScznaPaoIo3ZddmI4shUeZ8jAmM65g0A
 2bqCMzs1xQKU21a+De22TsE=
X-Google-Smtp-Source: AGHT+IHx11EczPrIFISk6oINBDdC+aE6H1v5VzuBWLY0gV6CordtkXc/Q14nS5mEopntoBTUpp8S8w==
X-Received: by 2002:a05:620a:1712:b0:773:fa62:39fe with SMTP id
 az18-20020a05620a171200b00773fa6239femr2160568qkb.1.1700703277644; 
 Wed, 22 Nov 2023 17:34:37 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 vz18-20020a05620a495200b0077d5c5af0c1sm62097qkn.6.2023.11.22.17.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 17:34:36 -0800 (PST)
Message-ID: <019eb41e-6052-414f-90d4-cd192fa3fe04@gmail.com>
Date: Wed, 22 Nov 2023 20:34:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-CA, en-US
To: Phillip Susi <phill@thesusis.net>, Alex Deucher <alexdeucher@gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87bkbodp51.fsf@vps.thesusis.net>
 <CADnq5_Nh4wCFY10Ha9dTGWvehPCdY2zxfERtFuoeF5_xA+P=QA@mail.gmail.com>
 <87r0kircdo.fsf@vps.thesusis.net>
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
In-Reply-To: <87r0kircdo.fsf@vps.thesusis.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------27nbuB0IZ3H2JpCGJkZb2mlG"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------27nbuB0IZ3H2JpCGJkZb2mlG
Content-Type: multipart/mixed; boundary="------------JaUbo0Dk7JfrrXuVg05JtlSM";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Phillip Susi <phill@thesusis.net>, Alex Deucher <alexdeucher@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-ID: <019eb41e-6052-414f-90d4-cd192fa3fe04@gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87bkbodp51.fsf@vps.thesusis.net>
 <CADnq5_Nh4wCFY10Ha9dTGWvehPCdY2zxfERtFuoeF5_xA+P=QA@mail.gmail.com>
 <87r0kircdo.fsf@vps.thesusis.net>
In-Reply-To: <87r0kircdo.fsf@vps.thesusis.net>

--------------JaUbo0Dk7JfrrXuVg05JtlSM
Content-Type: multipart/mixed; boundary="------------0UWsNpAWAXtLgwX61eP4ohzW"

--------------0UWsNpAWAXtLgwX61eP4ohzW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-21 17:05, Phillip Susi wrote:
> Alex Deucher <alexdeucher@gmail.com> writes:
>=20
>> Does reverting 56e449603f0ac580700621a356d35d5716a62ce5 alone fix it?
>> Can you also attach your full dmesg log for the failed suspend?
>=20
> No, it doesn't.  Here is the full syslog from the boot with only that
> revert:
>=20

Thank you Phillip for verifying this.

BTW, luben.tuikov@amd.com should absolutely bounce for everyone sending e=
mails to it. Not sure why it is still active.
My new email is the one this email is coming from.
--=20
Regards,
Luben

--------------0UWsNpAWAXtLgwX61eP4ohzW
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

--------------0UWsNpAWAXtLgwX61eP4ohzW--

--------------JaUbo0Dk7JfrrXuVg05JtlSM--

--------------27nbuB0IZ3H2JpCGJkZb2mlG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZV6sIwUDAAAAAAAKCRBMFUeUMaM0r0PV
AP0WuXBGxTcRLZ2DRrGpYBHu4m7v0WRi1i3elruWFZVUtAEAsqEfv7eS3EOHFkUAGpjnAdrE4sQB
BVYPLJdOYTd4pA0=
=2dlN
-----END PGP SIGNATURE-----

--------------27nbuB0IZ3H2JpCGJkZb2mlG--
