Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194DAF103A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ACE10E32A;
	Wed,  2 Jul 2025 09:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MxbPJZLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FEF10E32A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 09:42:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so3659678f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751449338; x=1752054138; darn=lists.freedesktop.org;
 h=cc:to:autocrypt:subject:from:content-language:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AL4Q7J3vJ8teU14qOCKHQMf2Oqlcoy+k13iLtd5zxes=;
 b=MxbPJZLwUq4jTJcquvLLxIz4iVkqnTo9bG6iN+4Uxe1xoUPXvFOV5qN4fS00uIaa57
 ohrT9StQsdLWEugPkBm9ZUjIH1MBTBe4zFpvs1KnePxZcv2wmKY5GdAmbfFBbM2L6ztE
 dFPcSgwm/8HV4uuIzLc8+0CI6e9b+LEz/e0puZnImri6vcdWkJnMa6xxNOl9dyEEaF1k
 FnlzAFCWMItwf+dIIMzi7gkVNDyUKxlWl34Q2dC+XFRxmqSPkB3Fl+rLONn/gf5IG6ef
 FNps7F8dN3xWWORxO5J5YwOqCBf2XnTnndcBnnF9FxNHEH3vpSI9VOg5z8CryuupOuys
 tmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751449338; x=1752054138;
 h=cc:to:autocrypt:subject:from:content-language:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AL4Q7J3vJ8teU14qOCKHQMf2Oqlcoy+k13iLtd5zxes=;
 b=mqDf0/DcfUdGMaqL1uXqx/f2nTL0UZ5FwKEPaR4A4BPr/JOryk/KnmKGQv5JeEyFYt
 HyDrUW4Qyj78smzsGHJDIhb6N5mlnB88VJN5MVcT8DsjSC7LLwSPM+Ne4iF+cHQN3CX6
 eK/ZWgRmK+myi4Zm7ejOhb+WsOztn3BJqb41YVyy/a2Od6QuCqzCCrWb/DwjbA5goknB
 +L4QwUcA0YG6xfDdWW7B5TFLduSh1up18NA6RgklwNDTTsWpfXkc2zLwOVQoeexaXPfN
 ZzmzJ+UN2Dl2hdfNluhSI+tOftC+P09ILKVJs3KSIAk3JJyTFNUdt4RO+TK40iTNHD2z
 AxMA==
X-Gm-Message-State: AOJu0Ywu6qy38BizuGD5o6bQRiMLYq0nbBkwlOL008KtW+xw4qSJAopQ
 xfhocfJUbK++hR6JNz/DAoyAx32+8eg4zub6KJ06v78nwmWWi9n5PRnx8UggntfvIprERl3z
X-Gm-Gg: ASbGncsRZkQtBVOQvLWPbsQN0xjTI6MN1le/P4rwFDObT5PvLPzorbP1pve5AXJQaAg
 Tcel24FqMGOOSDMr00PjZ5aGdztRu7v2t1P0JGFyeweW4219aa3ht3E2YtJuJTayHoWzt3HCjxu
 jh5bSguzOA0oC4qhBdy2fbh0cjzhRl+MHkmtD7dNyDL+PwSSveyML9XtPhnuHyLfSVsszvne7gu
 uiFKifdpbgYhF+Hu+wBqVE4DocEb2nlOMx0/TDCYHPeG1jZHoPQzE78prqH2eD/RjQeq19wU1W1
 bKWbQPt2ipzEE62+1eZo6t+JjVnPmin8Hxo5FdyqibNJaR89+Lgpg9XCgNkH7401K1nL
X-Google-Smtp-Source: AGHT+IEzEnj13dlHQ5rul4e2j99B00ZAhc3XeDzukgDyhpBldeGjn58tVxChGXagrFAXtJ/ZsAt74Q==
X-Received: by 2002:a5d:64e7:0:b0:3a5:8a68:b823 with SMTP id
 ffacd0b85a97d-3b1fed6f921mr1616405f8f.23.1751449338000; 
 Wed, 02 Jul 2025 02:42:18 -0700 (PDT)
Received: from [192.168.1.248] ([87.254.0.133])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f44dsm15431969f8f.87.2025.07.02.02.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 02:42:17 -0700 (PDT)
Message-ID: <056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com>
Date: Wed, 2 Jul 2025 10:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HmFe4WOS7fNp4xwygCXH6U04"
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
--------------HmFe4WOS7fNp4xwygCXH6U04
Content-Type: multipart/mixed; boundary="------------PJ00F2d9gQ00jhKeF2tPhjeX";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com>
Subject: re: drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API

--------------PJ00F2d9gQ00jhKeF2tPhjeX
Content-Type: multipart/mixed; boundary="------------wi5dnFuCAAIN1crZyhj3LocE"

--------------wi5dnFuCAAIN1crZyhj3LocE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgYmVsaWV2ZSB0aGVyZSBpcyBhIHJlZ3Jlc3Npb24gaW4gbGludXgtbmV4dCBj
YXVzZWQgYnkgdGhlIGZvbGxvd2luZyANCmNvbW1pdDoNCg0KY29tbWl0IGE1OWEyNzE3Njkx
NDlmMGI4MjU4NTA3Mjc2ZjNkMmEyNDM3MGNiZGINCkF1dGhvcjogTHVjYSBDZXJlc29saSA8
bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCkRhdGU6ICAgV2VkIE1heSAyOCAxMToyOToz
NiAyMDI1ICswMjAwDQoNCiAgICAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGNvbnZlcnQgdG8g
ZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJDQoNCg0KdGhlIGlzc3VlIGlzIGFzIGZvbGxv
d3M6DQoNCnN0YXRpYyBpbnQgdGNfcHJvYmVfYnJpZGdlX2VuZHBvaW50KHN0cnVjdCB0Y19k
YXRhICp0YywgZW51bSB0Y19tb2RlIG1vZGUpDQp7DQogICAgICAgICBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSB0Yy0+ZGV2Ow0KICAgICAgICAgc3RydWN0IG9mX2VuZHBvaW50IGVuZHBvaW50
Ow0KICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gTlVMTDsNCg0KICAgICAg
ICAgZm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9kZShkZXYtPm9mX25vZGUsIG5vZGUpIHsNCiAg
ICAgICAgICAgICAgICAgaWYgKGVuZHBvaW50LnBvcnQgPT0gMikgew0KCQkJLi4uDQoJCQku
Li4NCg0KVGhlIGNoZWNrIGZvciBlbmRwb2ludC5wb3J0ID09IDIgaXMgY2hlY2tpbmcgYW4g
dW5pbml0aWFsaXplZCBmaWVsZCBpbiANCnRoZSB1bmluaXRpYWxpemVkIHN0cnVjdHVyZSBl
bmRwb2ludC4gVGhlIGNvZGUgYmVmb3JlIHRoaXMgY29tbWl0IGNhbGxlZCANCiAgb2ZfZ3Jh
cGhfcGFyc2VfZW5kcG9pbnQobm9kZSwgJmVuZHBvaW50KSB0byBmZXRjaCBlbmRwb2ludCBh
bmQgbm93IA0KdGhpcyBzZWVtcyB0byBiZSBtaXNzaW5nLg0KDQpDb2xpbg0KDQoNCg==
--------------wi5dnFuCAAIN1crZyhj3LocE
Content-Type: application/pgp-keys; name="OpenPGP_0x68C287DFC6A80226.asc"
Content-Disposition: attachment; filename="OpenPGP_0x68C287DFC6A80226.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBE6TJCgBEACo6nMNvy06zNKj5tiwDsXXS+LhT+LwtEsy9EnraKYXAf2xwazc
ICSjX06efanlyhB0figzQO0n/tP7BcfMVNG7n1+DC71mSyRK1ZERcG1523ajvdZO
xbBCTvTitYOy3bjs+LXKqeVMhK3mRvdTjjmVpWnWqJ1LL+Hn12ysDVVfkbtuIm2N
oaSEC8Ae8LSSyCMecd22d9PnLR4UeFgrWEkQsqROq6ZDJT9pBLGe1ZS0pVGhkRyB
P9GP65oPev39SmfAx9R92SYJygCy0pPvBMWKvEZS/7bpetPNx6l2xu9UvwoeEbpz
UvH26PHO3DDAv0ynJugPCoxlGPVf3zcfGQxy3otydNTWkP6Wh3Q85m+AlifgKZud
jZLrO6c+fAw/jFu1UMjNuyhgShtFU7NvEzL3RqzFf9O1qM2muj83IeFQ1FZ65QAi
CdTa3npz1vHc7N4uEQBUxyXgXfCI+A5yDnjHwzU0Y3RYS52TA3nfa08yLGPLTf5w
yAREkFYou20vh5vRvPASoXx6auVf1MuxokDShVhxLpryBnlKCobs4voxN54BUO7m
zuERXN8kadsxGFzItAyfKYzEiJrpUB1yhm78AecDyiPlMjl99xXk0zs9lcKriaBy
VUv/NsyJFQj/kmdxox3XHi9K29kopFszm1tFiDwCFr/xumbZcMY17Yi2bQARAQAB
zSdDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT7CwZEEEwEI
ADsCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQRwYtqk8AG5xmFnAM9owoff
xqgCJgUCY8GcawIZAQAKCRBowoffxqgCJtd/EACIWcaxfVt/MH4qqo5ELsjCFPVp
+RhVpQDWy8v9Np2YbTcZ4AY2Zj4Pq/HrZ3F/Bh02v85C6mNv8BDTKev6Qcq3BYw0
iqw6/xLNvRcSFHM81mQI9xtnAWIWfI9k5hpX19QooPIIP3GOMdMc1uRUGTxTgTFA
AsAswRY3kMzo6k7arQnUs9zbiZ9SmS43qWOIxzGnvneekHHDAcomc/oho7kgj6rK
p/f9qRrhForkgVQwdj6iBlW934yRXzeFVF3wr7Lk5GQNIEkJiNQPZs54ojBS/Kx6
3UTLT1HgOp6UY9RPEi9wubmUR+J6YjLRZMr5PCcA86EYmRoysnnJ8Q/SlBVD8npp
GVEcuvrbH3MBfhmwOPDc3RyLkEtKfSTB92k1hsmRkx9zkyuUzhcSnqQnpWGJD+xt
KHvcHRT7Uxaa+SDwUDM36BjkyVcZQy8c+Is2jA55uwNgPpiA7n82pTeT+FRGd+7i
CLQHaryu6FO6DNDv09RbPBjIiC/q814aeKJaSILP1ld9/PEBrLPdm+6lG6OKOt9D
DV6jPmfR96FydjxcmI1cgZVgPomSxv2JB1erOggB8rmX4hhWYsVQl1AXZs3LdEpJ
6clmCPspn/ufZxHslgR9/WR1EvPMQc8XtssF55p8ehRIcVSXDRcMFr3ZuqMTXcL6
8YbDmv5OGS95O1Gs4c0iQ29saW4gS2luZyA8Y29saW4ua2luZ0B1YnVudHUuY29t
PsLBdwQTAQgAIQUCTwq47wIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRBo
woffxqgCJo1bD/4gPIQ0Muy5TGHqTQ/bSiQ9oWjS5rAQvsrsVwcm2Ka7Uo8LzG8e
grZrYieJxn3Qc22b98TiT6/5+sMa3XxhxBZ9FvALve175NPOz+2pQsAV88tR5NWk
5YSzhrpzi7+klkWEVAB71hKFZcT0qNlDSeg9NXfbXOyCVNPDJQJfrtOPEuutuRuU
hrXziaRchqmlhmszKZGHWybmPWnDQEAJdRs2Twwsi68WgScqapqd1vq2+5vWqzUT
JcoHrxVOnlBq0e0IlbrpkxnmxhfQ+tx/Sw9BP9RITgOEFh6tf7uwly6/aqNWMgFL
WACArNMMkWyOsFj8ouSMjk4lglT96ksVeCUfKqvCYRhMMUuXxAe+q/lxsXC+6qok
Jlcd25I5U+hZ52pz3A+0bDDgIDXKXn7VbKooJxTwN1x2g3nsOLffXn/sCsIoslO4
6nbr0rfGpi1YqeXcTdU2Cqlj2riBy9xNgCiCrqrGfX7VCdzVwpQHyNxBzzGG6JOm
9OJ2UlpgbbSh6/GJFReW+I62mzC5VaAoPgxmH38g0mA8MvRT7yVpLep331F3Inmq
4nkpRxLd39dgj6ejjkfMhWVpSEmCnQ/Tw81z/ZCWExFp6+3Q933hGSvifTecKQlO
x736wORwjjCYH/A3H7HK4/R9kKfL2xKzD+42ejmGqQjleTGUulue8JRtpM1AQ29s
aW4gSWFuIEtpbmcgKEludGVsIENvbGluIElhbiBLaW5nIGtleSkgPGNvbGluLmtp
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
=3DQKm6
-----END PGP PUBLIC KEY BLOCK-----

--------------wi5dnFuCAAIN1crZyhj3LocE--

--------------PJ00F2d9gQ00jhKeF2tPhjeX--

--------------HmFe4WOS7fNp4xwygCXH6U04
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmhk/uEFAwAAAAAACgkQaMKH38aoAiZ0
oxAAlw7O8Nz4Xm+m/Gt2UG/19XFeZZFK9Z98L92C6RAKwSXuutWbgL41e5Es09gnYF2PwFIeCVsC
rvgMneI6orW7Up46vuVxstJrQ6sm2q8oOx50nKS1ThU73irmiC0neTrsoi+l7LIHwzD5QKGGjJTG
wncMk4kASxc00PFDYA/IgWFSwvEWaU4pmL6I5XOj4lIU1EQwiR6zSeeBVy1rkeg3AARZ4+gZEmbA
lVVYvENANeCnR8lpwGWTZPgTWJqNI7E9/FmvO2ILfj1Afaf7qQdLHggZmglii+iJJ6x/pLtj5ZOW
R8RRBXk4G3vMCvTjD/MHrw6CZ9DevmEozeQOSFSMw9gDeNsTo8kIw1ZNP9Gh0iDqkrVQ9ClmGG2x
MKftntjQQSNA73BMxiO9ssFJYR8lsvyKKgO6k1qjodxlLlUd+neBml23CyUNdNWqiAoAPpE0rkVh
9KHJBNCkFa1DmfWWnqsLfB+yzyTGpjEL1ZvWkTnNTXIK1ZGY15psNLTpxLxJoHikFHjnVv9T9Or6
LaOWwRPHVlLvpox7G7GLv9pdvTRWaAtccXGwpP5S3d/KCKUNNDNCDchTRy7EPSjGYK1Amb/4L0+x
fmsb5a3X7grrA3/G6UTK8Q6Ffcue1l7ZxKhFMU8q7nlyK5LZn64GEfAPDudJFo/nBNBKJl1DqmIC
kIw=
=loTL
-----END PGP SIGNATURE-----

--------------HmFe4WOS7fNp4xwygCXH6U04--
