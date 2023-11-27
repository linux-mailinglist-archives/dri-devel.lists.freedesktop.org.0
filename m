Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350987F976A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 03:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269C210E120;
	Mon, 27 Nov 2023 02:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D490810E0DC;
 Mon, 27 Nov 2023 02:12:48 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-41cd7a3e8f8so21462501cf.0; 
 Sun, 26 Nov 2023 18:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701051168; x=1701655968; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qugBdKBw39THHjgwXW3RTBqPcyk8dRGoduuik4Rrsqg=;
 b=BJKyNoRXB4jQkXnSSG2zKi81pfUdfgCjS6L6JhwtR62a06USCXAeOSvOQYX6vyKjyb
 hU4YRkK9AJvJV1ek/K+xBrEN1nP9SH9DCFX0fGLKjBQ/lk47TYn0gWLYiRPJCGczrhId
 Tj6qu4pDE7BIdlbiEzQKv79MV/eJt8kUDTh4ETAeJRqOY8A8SxL0BFWvnjI4ljgJwIBv
 BIQq2/Zek+x+YunDR8k2KJV4/VNXIDNJlZ8ZHHE02vX1v9tFnqdFgAdpqxI8XdH008z1
 JW7F5vJhwX8u4+P4Gnca1FXps9yPUu04BCASmTBtjfdE5A37QBrukCIvcIhmJqYm9/iJ
 75bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701051168; x=1701655968;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qugBdKBw39THHjgwXW3RTBqPcyk8dRGoduuik4Rrsqg=;
 b=emaI2fhp4vaPdDOTY4E/7PtMvdfeF5sKkGxDqptvKmfm7htfHBahXsOqtKC1Z5Ab7x
 /QK/47uvjGgyQN7e3YaDj2X2GBYnAbWoiWuswamTCPp3wkvcgqwlWjriCY1QUfMV4XCs
 GxQoYf30ZQoQIStIN7qnuer9Iq5oNXY2v42OjDJZHBR/gMmq6C6i4QglK9zsCUvmR1XA
 sZJprg67LELCeSDmLxKU+NpkDSJAK0UGJlgkch6mdMe8hzmYqZJrjhURCk4C4OTSYLm1
 wxsLTtvpWY9zovnDz0IFWD+q5TLJzxmCKvT3ta/thNA5r2LDpCgecVsseUvWEhsJewJC
 JDiw==
X-Gm-Message-State: AOJu0YxAtzCU9Cmj5Nhg9iwnOvocyTiHZUf7dnt4xIppsRPEc3tLK+K6
 HE1utcAeFgHFhXHTiaD+gjs=
X-Google-Smtp-Source: AGHT+IHMpVJuXgS5KglBGiTNBGXulFF0WfBXXWwEUewotEA8G5zPSVHNOuRY9FQrqtvAoosIfFTOsA==
X-Received: by 2002:ac8:5749:0:b0:423:8b9c:cfb8 with SMTP id
 9-20020ac85749000000b004238b9ccfb8mr12564359qtx.24.1701051167787; 
 Sun, 26 Nov 2023 18:12:47 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac87447000000b0041ea59e639bsm3369008qtr.70.2023.11.26.18.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 18:12:46 -0800 (PST)
Message-ID: <ad3bcdd0-9b73-436a-91cd-6e034bd8980c@gmail.com>
Date: Sun, 26 Nov 2023 21:12:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Content-Language: en-CA, en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20231127103806.35efa376@canb.auug.org.au>
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
In-Reply-To: <20231127103806.35efa376@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wviEZ0IpOBd7JAaeKWbJOXsz"
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
--------------wviEZ0IpOBd7JAaeKWbJOXsz
Content-Type: multipart/mixed; boundary="------------vmKbUiNtiy3e77Q6SGunvJYP";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <ad3bcdd0-9b73-436a-91cd-6e034bd8980c@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20231127103806.35efa376@canb.auug.org.au>
In-Reply-To: <20231127103806.35efa376@canb.auug.org.au>

--------------vmKbUiNtiy3e77Q6SGunvJYP
Content-Type: multipart/mixed; boundary="------------DF08rh0qV4ytr5U57IfaV0Cd"

--------------DF08rh0qV4ytr5U57IfaV0Cd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-26 18:38, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error: 'DRM_SCHED_PRIORI=
TY_MIN' undeclared here (not in a function); did you mean 'DRM_SCHED_PRIO=
RITY_LOW'?
>    21 |         NOUVEAU_SCHED_PRIORITY_SINGLE =3D DRM_SCHED_PRIORITY_MI=
N,
>       |                                         ^~~~~~~~~~~~~~~~~~~~~~
>       |                                         DRM_SCHED_PRIORITY_LOW
>=20
> Caused by commit
>=20
>   fe375c74806d ("drm/sched: Rename priority MIN to LOW")
>=20
> I have used the drm-misc tree from next-20231124 for today.

I posted a fix for this yesterday:
https://lore.kernel.org/r/20231125192246.87268-2-ltuikov89@gmail.com
--=20
Regards,
Luben

--------------DF08rh0qV4ytr5U57IfaV0Cd
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

--------------DF08rh0qV4ytr5U57IfaV0Cd--

--------------vmKbUiNtiy3e77Q6SGunvJYP--

--------------wviEZ0IpOBd7JAaeKWbJOXsz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWP7FQUDAAAAAAAKCRBMFUeUMaM0r/HA
AP0UwqabBpVwQ4K3Cv7V8M8DEsDBst4mh3U3M+A5V78C7gD/WO/c1PqfHpIqZmVeELHy7rZod8ha
r+IfEQRrxFpNCAQ=
=y3V8
-----END PGP SIGNATURE-----

--------------wviEZ0IpOBd7JAaeKWbJOXsz--
