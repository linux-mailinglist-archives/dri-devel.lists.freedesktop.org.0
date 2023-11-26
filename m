Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91C97F959D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 22:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2B410E154;
	Sun, 26 Nov 2023 21:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7DE10E154
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 21:55:08 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-778ac9c898dso158349185a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 13:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701035707; x=1701640507; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1F7xzbcMM56AUoH69sxBSBuJqy1j92C5EwcqY0NEnpk=;
 b=gabzbPUpLJnHTvDHZ3Bb4ueY2Uhpq0O6i47FUgemeGXuNsP52pODKegWxntUDQ9Woa
 AFVoF8el0K5j1WjPKZfeRVfjfk5A+pJSnlalYKWZItaC5lMbxPD7Y8gM3MazbgaNz6kY
 +moL8/FgeEqNOD4i7EbdEgrKbpmbOXibGrEm4G+jmyQyCeB7LbDIipAw4QAOwGcws53r
 /37p/i/NrQCCXAtBaIdkfyw9tlxePsWioGsTSA5OtOgkUQOgm+D0Cg6iFmsKPxqQZaqP
 /h1bw+1zKnOANukT9PHviXIbPpLFOqL5X0kr82umIYInAWVk6h5cabfjJK/taSG2fvGF
 GeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701035707; x=1701640507;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1F7xzbcMM56AUoH69sxBSBuJqy1j92C5EwcqY0NEnpk=;
 b=XAmHlsDRx9IlVp39Sc9wNTFgKB+ib/N9uc0b9Y4J0NVup2XfuIgLgeJJ68wu/F/zp3
 9reqrBZgfSoozKfBYh/Gf/KfSIsJiNnU1pG6ocDYRnmvPYYc1HISOo25pVlqQn9Lxkm3
 t3uzKkdD+mj5foEL0Z5mphDXlfAF5KoJWFw+NgJDMKFq/uJx/8mD6xEvdoAt5VZ8cRgK
 nuILXCSHyW3yqD6lYWifl+kkRRYeFH2l6+V3csSiZBa5qgGgOCKEQf+8Yj2TeiK7ml2U
 Vf7aAsl5uSDMF5TD/dXyQCnD3iuQBmMJ99JOVxQFm6ObQIM6DU9DTfICq6hrnDu/bjAx
 8SuQ==
X-Gm-Message-State: AOJu0Yy17+6/j4DLYbMcq7RnUMGunPJsdDLshB09youU/XEbma+toIei
 5lTPNg4cpYearTwHq2DhcabFb0um6JPVBw==
X-Google-Smtp-Source: AGHT+IH2/PkXyzgJT4577HF9Twx6pC0aXE0cfFpdr5Ob9QcoYwoqhTbF5/TlO9Euk3zMCHtFO0ZUQw==
X-Received: by 2002:a05:620a:1b94:b0:778:8676:1dd9 with SMTP id
 dv20-20020a05620a1b9400b0077886761dd9mr9234870qkb.32.1701035707497; 
 Sun, 26 Nov 2023 13:55:07 -0800 (PST)
Received: from [192.168.2.14]
 (bras-base-toroon0964w-grc-76-76-65-20-140.dsl.bell.ca. [76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 bp33-20020a05620a45a100b0077d92cce012sm1509790qkb.78.2023.11.26.13.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 13:55:07 -0800 (PST)
Message-ID: <cbd9eba4-5750-45e5-80fe-1037cbabbf2a@gmail.com>
Date: Sun, 26 Nov 2023 16:55:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH] drm/sched: Fix compilation issues with DRM priority rename
Content-Language: en-CA, en-US
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231125192246.87268-2-ltuikov89@gmail.com>
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
In-Reply-To: <20231125192246.87268-2-ltuikov89@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------W0IuIsFZAJQ7BPSfgWGHG9ep"
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
Cc: Matt Coster <matt.coster@imgtec.com>, Danilo Krummrich <dakr@redhat.com>,
 kernel test robot <lkp@intel.com>, Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------W0IuIsFZAJQ7BPSfgWGHG9ep
Content-Type: multipart/mixed; boundary="------------1bROTmFG0xdCUeiGjma9OC20";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Cc: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Message-ID: <cbd9eba4-5750-45e5-80fe-1037cbabbf2a@gmail.com>
Subject: Re: [PATCH] drm/sched: Fix compilation issues with DRM priority
 rename
References: <20231125192246.87268-2-ltuikov89@gmail.com>
In-Reply-To: <20231125192246.87268-2-ltuikov89@gmail.com>

--------------1bROTmFG0xdCUeiGjma9OC20
Content-Type: multipart/mixed; boundary="------------NEkTPtYQ0ZNukKf4t01JbBYr"

--------------NEkTPtYQ0ZNukKf4t01JbBYr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-25 14:22, Luben Tuikov wrote:
> Fix compilation issues with DRM scheduler priority rename MIN to LOW.
>=20
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311252109.WgbJsSkG-lkp=
@intel.com/
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Donald Robson <donald.robson@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.free=
desktop.org>
> Fixes: fe375c74806dbd ("drm/sched: Rename priority MIN to LOW")
Fixes: 38f922a563aac3 ("drm/sched: Reverse run-queue priority enumeration=
")
> Fixes: 5f03a507b29e44 ("drm/nouveau: implement 1:1 scheduler - entity r=
elationship")
> ---

Added an additional Fixes tag as shown above, to complete the set.
--=20
Regards,
Luben

--------------NEkTPtYQ0ZNukKf4t01JbBYr
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

--------------NEkTPtYQ0ZNukKf4t01JbBYr--

--------------1bROTmFG0xdCUeiGjma9OC20--

--------------W0IuIsFZAJQ7BPSfgWGHG9ep
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWO+ugUDAAAAAAAKCRBMFUeUMaM0r9lg
AP9Nn8fdNcjQpOXZk6GmMInOwY/ql8Smxwl4D3R1/aMn7gD+MRb2xIbZdJqbCqMD1TcvPf3PWUc1
jaqwcn+NdhUKYwk=
=cFxl
-----END PGP SIGNATURE-----

--------------W0IuIsFZAJQ7BPSfgWGHG9ep--
