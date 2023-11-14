Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE627EA818
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 02:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14E810E0A4;
	Tue, 14 Nov 2023 01:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE73C10E0A4;
 Tue, 14 Nov 2023 01:08:24 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-77891c236fcso329597585a.3; 
 Mon, 13 Nov 2023 17:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699924104; x=1700528904; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JKcvvlyi44mL6KlohMsUtHtgv16cdE0L7BYR9br9JrA=;
 b=beLZI2Q5uFzjEy3g/E0FkEfsNwy6mEKHVgM4zNCCyJSM3/qybfuny8ueU8A28S8B/F
 co+57Q9YESvkAVkGqDQblq9UkK2iIgdAlExmka1yQMhe0rh8pxW7bAtDMjodNwTwAGJP
 XFewwyiMr7fxb0sMKeKJ6BCAUM0vjdVHsuPa0Rb+1DZ+GbFCLN48rfDH4yp/9sQ1/vfw
 CLE+38enhQK0Xp//CutBbgyKf4RrBSqBFgM5m7LaXHz3jBuwoUPdgQI6a75E7mRKrMCD
 1PnUPwcS4szzG4EA/ShzaANctUCdOmqo3lNGSGmwb2eKiv0j9ysoiTWxtiud3OBtRcQx
 IrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699924104; x=1700528904;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKcvvlyi44mL6KlohMsUtHtgv16cdE0L7BYR9br9JrA=;
 b=E+Et6EK0CKgLCx6aRs1r8rDRtYQjS3IFgHrcyqGfEO/DXTS89PN9qxEVoQaJAy0GBq
 Vf6kyHGxW5txuDr0lz6+4AUEYAPrGvGPMmOmi+5iU5rc043dS89I46RVuBdFNpi1ZrUR
 SUgMVSqaDql6bNexiaiTOieIIiwa8Wc8RdH1FHHYh3hKqwxXdHu3lS76i+uzPj4DINUp
 WUGIhy8nSCzRm9gHYrKwIRZCzYCcOLim/IRAf94QHjOjkgpM3zPjynIJjrTo+7f9aCZS
 BC7/fiY0DkEoWUO0G6bNb+RFmieB0xBlp6gNGbLiH3vflpTq3tPkvoZ3ydaUq3VZMt2M
 PDZg==
X-Gm-Message-State: AOJu0Yz+KiS4HL3U/44GoxjmDjagQQ0WF3hYeFM3f17SiBmqZQCqaIxj
 KhX1xEgZdpqGzrHh/RWXMZE=
X-Google-Smtp-Source: AGHT+IFiQWl24h9GC1sLTorOF/ZdWCUlUOYvQPa91zZrJC9cw0bp+El0mMCJWAMiyBDFPfqhTaNV+g==
X-Received: by 2002:a05:620a:19a1:b0:779:d1ea:c5da with SMTP id
 bm33-20020a05620a19a100b00779d1eac5damr972334qkb.37.1699924103773; 
 Mon, 13 Nov 2023 17:08:23 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 qf6-20020a05620a660600b0077407e3d68asm2268274qkn.111.2023.11.13.17.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 17:08:23 -0800 (PST)
Message-ID: <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
Date: Mon, 13 Nov 2023 20:08:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Content-Language: en-CA, en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20231114075501.61321c29@canb.auug.org.au>
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
In-Reply-To: <20231114075501.61321c29@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vEfybuPWDPn3tC0gL2qgH3Ql"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vEfybuPWDPn3tC0gL2qgH3Ql
Content-Type: multipart/mixed; boundary="------------B4ohSNNGqjiBnNCLqzuihuRH";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
References: <20231114075501.61321c29@canb.auug.org.au>
In-Reply-To: <20231114075501.61321c29@canb.auug.org.au>

--------------B4ohSNNGqjiBnNCLqzuihuRH
Content-Type: multipart/mixed; boundary="------------qvDQOYufPGufy4Mj2qrN1Ci0"

--------------qvDQOYufPGufy4Mj2qrN1Ci0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-13 15:55, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   0da611a87021 ("dma-buf: add dma_fence_timestamp helper")
>=20
> is missing a Signed-off-by from its committer.
>=20

In order to merge the scheduler changes necessary for the Xe driver, thos=
e changes
were based on drm-tip, which included this change from drm-misc-fixes, bu=
t which
wasn't present in drm-misc-next.

I didn't want to create a merge conflict between drm-misc-next and drm-mi=
sc-fixes,
when pulling that change from drm-misc-next to drm-misc-fixes, so that I =
can apply
the Xe scheduler changes on top of drm-misc-next.
--=20
Regards,
Luben

--------------qvDQOYufPGufy4Mj2qrN1Ci0
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

--------------qvDQOYufPGufy4Mj2qrN1Ci0--

--------------B4ohSNNGqjiBnNCLqzuihuRH--

--------------vEfybuPWDPn3tC0gL2qgH3Ql
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVLIfgUDAAAAAAAKCRBMFUeUMaM0r7zT
AQCiNDNdfwwEl1fqI+vA0gRQhPhPspazrejdUdFVOa2rkwD9Ey1+rknoP3/l6BG/sMCB6KcSvzYM
VqgKbrH9xS0SCQk=
=MWyy
-----END PGP SIGNATURE-----

--------------vEfybuPWDPn3tC0gL2qgH3Ql--
