Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF83AEE0B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECA010E449;
	Mon, 30 Jun 2025 14:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.b="EIeX/NM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECA510E424
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 11:47:50 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ae35c447234so591548166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 04:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1751284069; x=1751888869;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:from:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SFbrEiZL/ftRM6JF2YIW1/evu+uKmfTeDRm8IOKGMws=;
 b=EIeX/NM/Jb3PsXVNE7AfVKR60Bzy1JTNWxaiEmRv+BpaeIl+dFn7ML5zNXNNo0VRKR
 fmFBFCONcc0IjF1gfx4H68yo5NqH6wbH5hdS70QDs4Ld0xTrlzoqkmPUZJBJA3/aIwaY
 n2WnKDqHBpwdYdQ6xTFFGNLu7ZwDBprHUgl/47/28Dj0Cmk3HUd3fhjYgk3E6TLHt6mz
 MoRDyduxaaEhtEhxsIT/gEqURVDo5xIwG5f9CxXt/9/t5ZDRdYX3/ccF930OTtDGMl+B
 KQBNZXxe+47p6MPJRVpYbYYhVBsrKeE+PwIAEifIOoHM3lPFnR262FaTMhovAD+9oXgU
 Q9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751284069; x=1751888869;
 h=cc:to:subject:from:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFbrEiZL/ftRM6JF2YIW1/evu+uKmfTeDRm8IOKGMws=;
 b=rV48C8VU4C1o97r+kBuBgwjv4GGkYMEdXKIqghmnnLfR7M2zLWun6QWNB62rE68RGG
 IG0jUYpxoYpvRN6YRQCQVaPg6zF73vMuyWhdMhI1KUUgM8wuOsz0mENaFnO67IOkH0rJ
 TQ4SlA5L6jhePmK0atD8MQAJg29Vqr0TrU8Q/NEmifv8UYujbkse9yZJYEDgjT9l1p/9
 I20m7yXO1J3P38X28J6GG3iyfcxArY2sUitsVLvXIz3N+AVXDaWx3ejeAKi2mIs0x1aN
 OZO2cNfE4qck2Q8/m+GHQIb+cW0mayVlK7/om7dgzWu0+Wi5xtjv9E/k2enxs+Uvzjod
 1Ypg==
X-Gm-Message-State: AOJu0Yy+y/AxsgLP9PBvsH2mtxge/aWyhW31XfBRMkTXbAQ2Cmn8xxx7
 j1T5sOQheNKkE8+RtB+rv0uWj9qmn8RwaUiZ8AKmvyBm2in29W9bpmQ9MqM994NiBoE=
X-Gm-Gg: ASbGnct4qu1OwOKBqyEdQfCXpoE+H874VfxIQEENjlKWJwSZVhiLakyjFZV7AFTYa2Y
 CCSxOWkI4FX2h2SjTXkh4+wZuByAG2HYQkNPsp9Z7XfBkK7E08LFbOtWgbrjNMqIGFc2akxT3t1
 dVnIDQRMXjqhvSXp0bfTb49mXDxH6WmlJqoVreYClJqR6F1xQmjBFLJnWO4e1Ty7l2a81SPfb7B
 09ZYxZ6pLW+8+7N4dc0+I5VD5L+0ItFrWuDJRhrzQWsJyRZkHQ5RhEyimTO47ratX1Gcu1kdZor
 E0pvgMUoPXIiI2p4csvqaOlOo0i4qbvJaXSL3Qqt7nrwr0h7mYE+9Rxy9WUaj0b/lxsvE4UOCrF
 ug8Q=
X-Google-Smtp-Source: AGHT+IEQ9U6mOVbpcaDJlaX6UleT/djg97rF+QkhXHjE4h6drewHlaPpxKWxknS28NXT9UIQxpwiwQ==
X-Received: by 2002:a17:907:dab:b0:ae3:249:ab73 with SMTP id
 a640c23a62f3a-ae30249c82dmr1418917166b.18.1751284069136; 
 Mon, 30 Jun 2025 04:47:49 -0700 (PDT)
Received: from [10.144.229.245] ([185.254.75.26])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bce2sm648327266b.123.2025.06.30.04.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 04:47:48 -0700 (PDT)
Message-ID: <72fd3ae7-46da-4203-b583-3fb857e73542@9elements.com>
Date: Mon, 30 Jun 2025 13:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Intel Xe SR-IOV support status
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0dUfIvXK6cn4vw0we0kqu0lQ"
X-Mailman-Approved-At: Mon, 30 Jun 2025 14:29:29 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0dUfIvXK6cn4vw0we0kqu0lQ
Content-Type: multipart/mixed; boundary="------------Yx41X300LfZEjn1HeRKea3WL";
 protected-headers="v1"
From: Marcello Sylvester Bauer <marcello.bauer@9elements.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <72fd3ae7-46da-4203-b583-3fb857e73542@9elements.com>
Subject: Intel Xe SR-IOV support status

--------------Yx41X300LfZEjn1HeRKea3WL
Content-Type: multipart/mixed; boundary="------------fVqvRcaPIpMicMP6STXJv5ra"

--------------fVqvRcaPIpMicMP6STXJv5ra
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNClN0YXJ0aW5nIHdpdGggVGlnZXIgTGFrZSwgc3VwcG9ydCBmb3IgR1ZULWcgd2Fz
IGRpc2NvbnRpbnVlZCBpbiBmYXZvciBvZiANClNSLUlPViBmb3IgZ3JhcGhpY3MgdmlydHVh
bGl6YXRpb25bMV0uIEN1cnJlbnRseSwgdGhlIHVwc3RyZWFtIFhlIA0KZHJpdmVycyBvbmx5
IHN1cHBvcnQgU1ItSU9WIG9uIFBhbnRoZXIgTGFrZS4gVGhlIHRhYmxlIGJlbG93IHN1bW1h
cml6ZXMgDQp0aGUgY3VycmVudCBzdGF0ZSBiYXNlZCBvbiB0aGUgLmhhc19zcmlvdiBmbGFn
Lg0KDQp8IEludGVsIEdlbiB8IGRybS14ZS1uZXh0WzJdIHwgeGUtZm9yLUNJWzJdIHwgaW50
ZWwgbHRzIGk5MTVbM10gfA0KfCAtLS0tLS0tLS0gfCAtLS0tLS0tLS0tLS0tLSB8IC0tLS0t
LS0tLS0tLSB8IC0tLS0tLS0tLS0tLS0tLS0tIHwNCnwgVEdMICAgICAgIHwgICAgICAgICAg
ICAgbm8gfCBubyAgICAgICAgICAgfCB2NS4xNSAgICAgICAgICAgICB8DQp8IEFETC9SUEwg
ICB8ICAgICAgICAgICAgIG5vIHwgeWVzIChkZWJ1ZykgIHwgdjUuMTUgICAgICAgICAgICAg
fA0KfCBNVEwgICAgICAgfCAgICAgICAgICAgICBubyB8IG5vICAgICAgICAgICB8IHY2LjEg
ICAgICAgICAgICAgIHwNCnwgQVJMICAgICAgIHwgICAgICAgICAgICAgbm8gfCBubyAgICAg
ICAgICAgfCBubyAgICAgICAgICAgICAgICB8DQp8IFBUTCAgICAgICB8ICAgICAgICB2Ni4x
My4xIHwgeWVzICAgICAgICAgIHwgbm8gICAgICAgICAgICAgICAgfA0KDQpJbnRlcmVzdGlu
Z2x5LCB0aGUgeGUvdG9waWMveGUtZm9yLUNJIHRlc3RpbmcgYnJhbmNoIG9ubHkgY292ZXJz
IFNSLUlPViANCnRlc3Rpbmcgb24gdGhlIEFETCBwbGF0Zm9ybSBhbmQgbm90IHRoZSBNVEwg
b3IgQVJMIHBsYXRmb3Jtcy4NCg0KSXMgdGhlcmUgYSByZWFzb24gd2h5IFNSLUlPViBoYXMg
bm90IHlldCBiZWVuIGVuYWJsZWQgb24gdGhlIG90aGVyIA0KcGxhdGZvcm1zPyBBcmUgdGhl
cmUgYW55IHBsYW5zIG9yIHRpbWVsaW5lIGZvciBhZGRpbmcgc3VwcG9ydCBmb3IgdGhlbT8N
Cg0KS2luZCByZWdhcmRzLA0KTWFyY2VsbG8NCi0tLQ0KWzFdIA0KaHR0cHM6Ly93d3cuaW50
ZWwuY29tL2NvbnRlbnQvd3d3L3VzL2VuL3N1cHBvcnQvYXJ0aWNsZXMvMDAwMDU4NTU4L2dy
YXBoaWNzLmh0bWwNClsyXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hl
DQpbM10gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xpbnV4LWludGVsLWx0cw0KWzRdIGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82MDMzMTYvDQo=
--------------fVqvRcaPIpMicMP6STXJv5ra
Content-Type: application/pgp-keys; name="OpenPGP_0xE54B6622A5EDBF61.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE54B6622A5EDBF61.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DGQYi
-----END PGP PUBLIC KEY BLOCK-----

--------------fVqvRcaPIpMicMP6STXJv5ra--

--------------Yx41X300LfZEjn1HeRKea3WL--

--------------0dUfIvXK6cn4vw0we0kqu0lQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEB0muAN3elg6p6gWSpVqlh6ibFBIFAmhieVwACgkQpVqlh6ib
FBIJCRAAsooZKcjJ+gs8vnGtNK/UXRgq7eDpa1q+27JW1FpYyUXMCmtEDzT3U+Uy
xMfABZRMZjxMno5TT6AEfsu43bYknL/S0d59cdH9DF4hjgd3Hv6rsGTZGNLt4qOI
SRh5Ek7BQgawJlaEVBgSX4LaPIwT1gcYnLEQa3O17WfE6EjJF3tKmOepA5bgM+Y1
MJtYQqhcLAQD6w9kSctK6bKWzQeid8qQZx3CVuuU+5Jq2drWSMi9B282NMd0jfoO
fdr/343HRbTwJLNod4+2ZMl+XYvMb12oMe61QGfVaoSZVz2Wn4FspmD/V4nmswsz
7ia3aUCifbEoGY0AeoAJTel5ctPItWXkcE/j2wZ3Vm5mCwwVLgZTKW8oidxbo84m
5mBQp304nNv5VwZ9kH9oEMfzc3DX6ObEUeWrwXNEJ9U6/3uTZyYxcmi6v3IsGWC0
4s3XRaaOsYvXJmKVvAOwehAzsrHIjXhGdtrZyAN6zTG5GQ4NH6bGjyhT6s37E0Ew
YOtmBLS9Y2olACvC7oUHC1pJb52ILZsHAlvQB/BU+HxEYSJL+c/Zr4saeZobS2X0
SR+4/x3pzTcqIIwScIJM9wU0XyeZC5MFjdaatYUjvgIxcXXtZfzbqrsUTYDxiHTL
r08YJGJYIMyJCOGmEUZFXR0PCorCM+XSokCeji7wZTG/wbPuGu8=
=rPVg
-----END PGP SIGNATURE-----

--------------0dUfIvXK6cn4vw0we0kqu0lQ--
