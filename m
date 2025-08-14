Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F85B279E7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 09:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2204910E246;
	Fri, 15 Aug 2025 07:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nWt7OZb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866310E843
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:54:13 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so3849055e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755168852; x=1755773652; darn=lists.freedesktop.org;
 h=to:autocrypt:subject:from:content-language:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i6NMrOrfBsbi7eEHhMx2Jg+ZLwA+A5SHXYgNjvrmABM=;
 b=nWt7OZb8zmkIlUw7MUKzZVTIucYStRR4RtoCbdB64ndMJg9YAGLIEPYrK9U6blIjzt
 pBmIsG4npB7oX3WW6s1fxtqX7eZoeQQrogqKKEZMX93911RnYRv3Ldl4z0v7lYlxZBLF
 k1sDveKkjGnBmt6pAk4oO1q2F66wrr56icP6PjMJpLRN0s/JU8J2MKjwzXgmcQimk+4m
 x2QHXM61z00KJdgHa1xFNoqyYwUN8B+1UdfXX/htxulLxdq+K5v07gkpkH59jIt9uNQj
 D2x7EgDcoiK1ZL5/xJ2TfzJ1/ZFB1dd2bmZ38bI5jjBsNSGvJ7qm37cs4lC+P2qlCu1m
 YC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755168852; x=1755773652;
 h=to:autocrypt:subject:from:content-language:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6NMrOrfBsbi7eEHhMx2Jg+ZLwA+A5SHXYgNjvrmABM=;
 b=sAl5EUKmH5pLSJ7+A6KZjlJhrzftkB2QTgfvIISVhtJ3LoEyHGgEjtUE5TA5hb9XyL
 djyxuea9rFtzJ0bHJmEfxPlQpscyyRgIbLjyjYZo61YmwIDnhCzlWFQF8MY1/nx1dRTY
 BaGG3QY1Ief2yIaFsD1bG12zqnpFpPfeVzXV4mr0gtq6B29iDdLhdySSjbx1x6c21uXb
 /f1f+UJcAwoQ0mNbgTxpvjQFTpiScUiZyujS8Vz1wpaY8JPdo64vumn4epYgcj7mmVF7
 fbLAgByBrhhG+6/ewixsvyf09Rz+Y5xIWFZMVu5SUfHgmMtscfVzLU0OUpgDP2iVpMfx
 729w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiYGsGoGAV1/7iAO0TP7ei4xVktl3aikygXja+O6xE7qkBs+aS2GW0+3gYYVa4IIFJeFvFff+jmd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNK2+/17rx4FoFVdXX1p8Y/fo1UJaanwVnmci/NNc4xFr2Ncmw
 BAuW7IAarx19Pv53/y00OrUr7idWsPUAysAohCSe3A1gIxpnTjxx9wW0gP/MVYid
X-Gm-Gg: ASbGncvfJe9eafefQCVUQlj6bmOP1DRnbPkflWOxBLZrhz/BYsgUpKK0zwjtWEBx8Wi
 VYbNrsy6OB050Ow1ni9rxYLxJETc77+gJgmQ56JT3CRYxBAB8V1VXHdw/TqQbifDAzty79LFl9O
 MkCUur7V+yY5EnzyepzQBjEGsEH/+tMz1gztFpQ8nf3I0ODCP+ijACcQgXyPhHL3s/rB6b2IY5u
 vxYtWK3ByRUYCsObvAK9bYhNS/CcP+yJ4MubwL7fKmE+N6PQcVsZ045jlbCphdjAKraQIeBpns9
 xfSabSq59Ae7tLOodXCSAduCTPS1qmq73r/VeEyRisiQWiErByoIdoOfV7/GUlGdEwGpK9BAZzP
 fdE8H+zkSx/rjEV0n6Ldr92Gv48N36rEaLxAj6xvMpALuL7DWjGLRAe03nsU=
X-Google-Smtp-Source: AGHT+IH16HjgomMN2dh/XAyQbhrYYnXx3WklXNRuoxUS9ImwE0yzGDa2vY/0ZB/1Bdzc+IhxDIXAZw==
X-Received: by 2002:a05:600c:450e:b0:458:f70d:ebd7 with SMTP id
 5b1f17b1804b1-45a1b66d5c9mr18529065e9.20.1755168851436; 
 Thu, 14 Aug 2025 03:54:11 -0700 (PDT)
Received: from [10.55.1.176] (188.70.78.188.dynamic.jazztel.es.
 [188.78.70.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6fba41sm16627925e9.20.2025.08.14.03.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 03:54:10 -0700 (PDT)
Message-ID: <51e650f7-39f3-4e06-a3ed-9941e0ccb0c0@gmail.com>
Date: Thu, 14 Aug 2025 12:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, es
From: "David C. Manuelda" <stormbyte@gmail.com>
Subject: Proposal: Make CONFIG_DRM_TTM_HELPER a user-configurable option
Autocrypt: addr=stormbyte@gmail.com; keydata=
 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
 keS4m75L
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0G536LPjOhwC1KI7fL9FSAKs"
X-Mailman-Approved-At: Fri, 15 Aug 2025 07:17:25 +0000
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
--------------0G536LPjOhwC1KI7fL9FSAKs
Content-Type: multipart/mixed; boundary="------------51myZiFgNOLS20v0HMRsMfEI";
 protected-headers="v1"
From: "David C. Manuelda" <stormbyte@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <51e650f7-39f3-4e06-a3ed-9941e0ccb0c0@gmail.com>
Subject: Proposal: Make CONFIG_DRM_TTM_HELPER a user-configurable option

--------------51myZiFgNOLS20v0HMRsMfEI
Content-Type: multipart/mixed; boundary="------------s0ppEJguwEdGHNZDw0Ws0DnX"

--------------s0ppEJguwEdGHNZDw0Ws0DnX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJJ20gd29ya2luZyB3aXRoIGV4dGVybmFsIERSTSBkcml2ZXJzIChzdWNo
IGFzIE5WSURJQSdzIHByb3ByaWV0YXJ5IA0KbW9kdWxlKSwgYW5kIEkndmUgbm90aWNlZCB0
aGF0IGBDT05GSUdfRFJNX1RUTV9IRUxQRVJgIGlzIGN1cnJlbnRseSBub3QgDQp1c2VyLXNl
bGVjdGFibGXigJRpdCBnZXRzIHB1bGxlZCBpbiBvbmx5IHdoZW4gZW5hYmxpbmcgb3RoZXIg
ZHJpdmVycyBsaWtlIA0KYG5vdXZlYXVgLCBgYW1kZ3B1YCwgZXRjLg0KDQpUaGlzIGNyZWF0
ZXMgYSBzaXR1YXRpb24gd2hlcmUsIGluIG9yZGVyIHRvIGJ1aWxkIHN1cHBvcnQgZm9yIGV4
dGVybmFsIA0KZHJpdmVycyB0aGF0IGRlcGVuZCBvbiBgRFJNX1RUTV9IRUxQRVJgLCBvbmUg
bXVzdCBhbHNvIGVuYWJsZSB1bnJlbGF0ZWQgDQpEUk0gZHJpdmVycywgd2hpY2ggbWF5IG5v
dCBiZSBkZXNpcmVkIGluIGNlcnRhaW4gc2V0dXBzLg0KDQpJbiBteSBodW1ibGUgb3Bpbmlv
biwgaXQgd291bGQgYmUgYmVuZWZpY2lhbCB0byBtYWtlIGBEUk1fVFRNX0hFTFBFUmAgYSAN
CmRpcmVjdGx5IHNlbGVjdGFibGUgb3B0aW9uIGluIGBtZW51Y29uZmlnYC4gVGhpcyB3b3Vs
ZCBhbGxvdyB1c2VycyB0byANCmVuYWJsZSBpdCBpbmRlcGVuZGVudGx5LCB3aXRob3V0IGRy
YWdnaW5nIGluIG90aGVyIGRyaXZlcnMuDQoNClRoYW5rcyBmb3IgeW91ciBhdHRlbnRpb24g
YW5kIGZvciBhbGwgdGhlIHdvcmsgeW91IGRvIG9uIHRoZSBrZXJuZWwuDQoNCkJlc3QgcmVn
YXJkcywNCkRhdmlkIEMuIE1hbnVlbGRhDQo=
--------------s0ppEJguwEdGHNZDw0Ws0DnX
Content-Type: application/pgp-keys; name="OpenPGP_0x813A1725FA18B780.asc"
Content-Disposition: attachment; filename="OpenPGP_0x813A1725FA18B780.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
9CjQugJlQaKYNhZ3keS4m75L
=3Df/eA
-----END PGP PUBLIC KEY BLOCK-----

--------------s0ppEJguwEdGHNZDw0Ws0DnX--

--------------51myZiFgNOLS20v0HMRsMfEI--

--------------0G536LPjOhwC1KI7fL9FSAKs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEElxGNhLvh60ul/Hc7gToXJfoYt4AFAmidwFEFAwAAAAAACgkQgToXJfoYt4CY
CQ//bzMQXKThLTb2EYNYusGSyZgouB715x3wArc5iinX6ym0EGYTAtcwwIqqVPJhbpMOfzH6gMby
52PAlXrXAWVJcLdqz63NPdvo2wPWGtGAyu/E1mJHmb6rM19qe/2kAwKPx2/FRbzFBm9aqvKIiKSt
RzZPWV+OIAgo+PL/pPNcoxSD/eKp1ohA2nuku5hY773tfAzEsDgiKOf9hHGS5YdHLppi4OVVb7Hq
OcRtsU3VgBfQzHfA2EvyyemMNN8YTEfo7IxQJjrrtiRfHMxkq+Q0B+SjYVvvfm9xY2U1zTSu4b2L
R1Yghz6es8AaNPCsLUMqp+bpb+Dmw3nZDjqNYLwvXMgsZieJtTaGnRfI4nmqbR53x/85qjoRgvv/
ljARxmsMuA9riWijTUsYDXO1khGJAQJSm1Jd3e7+t5L2XaovQmGa0BxjEdWJZHBEV+PkYrnJ4cMe
NsKdut0kGxFNYyzw4jcR5I7HLa5wt9y0I2FwGc+zClRJyYAQBfw2j3tApG8thw7UDBSeOLLL0Ukl
D8o8S3qxqEe8F1h3Nfn03fTpHaGZS/kBFhkvgnW0OV28q6snYl/3qJ8NRwfT3FjPtaGvNKwD/w9e
zD8myrVeHlTj06YzJZr+6YROC5s2GXoJFamgLZD0/uRepNNdnDPaBtrGlHaGaVIzn8QwU74kMpNE
G5w=
=ItkC
-----END PGP SIGNATURE-----

--------------0G536LPjOhwC1KI7fL9FSAKs--
