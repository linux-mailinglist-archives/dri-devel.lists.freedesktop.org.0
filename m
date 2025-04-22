Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CAA9794E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451AF10E635;
	Tue, 22 Apr 2025 21:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGEcD0+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1C010E635
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:41:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso49278625e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745358089; x=1745962889; darn=lists.freedesktop.org;
 h=autocrypt:subject:from:cc:to:content-language:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CdpsBpDWdxMBBvIM8tPsAm81m0X2FgTrOU07T3tJZx4=;
 b=WGEcD0+0zyQfdQ1wIfDBzxLCH6LbTYaGIqi3ZoEMRwsQpFyZhSj18ejSrVUmcRRFGI
 Yn10CsUx60qmGcVZXv710h6WVohXBrUevbWxBS6HPJaQQwuGxzJvApa0Iwqb8iiJYCkh
 oOnfwm7kDcjYfkmL+StOy+KhOG1dKGRydEmTOBkygOi+c4BAChgISDmE+17/TEgKPUdP
 9/bnZ6Ncwx/1XqJy7HS7VOjLZTLspceQQKzk1vF41w3MJGVY5hObdbBV+TV8A6vITAG8
 xUl17tEGt4k48ywMgJ21z5RDWs72HH2TumDeKYhZaPAsqnYLhxFqKT4mRtd6xJoEV/Jo
 4MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745358089; x=1745962889;
 h=autocrypt:subject:from:cc:to:content-language:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CdpsBpDWdxMBBvIM8tPsAm81m0X2FgTrOU07T3tJZx4=;
 b=hG2kOC7r89otSCI5mjENzgdJF+GOF5GNV0Qwrnm1zAdSYEWUk0537GpPA/nJcCF8Ma
 I9KAgtyvDiVaqAa3ZGhcmeDwCCraGSm/3gTaY8Mnj4zhSm7npt2/0L3yeoY2pPRofrHb
 G6SYpp/ofFk2Ee7KU6I+NRAbGjDW9Yj6G02hSorDN7S8BjEk8g1FpLLZNUF7K/qZeuyZ
 eMsGvLcOFc2YgtweNr+v/4J9WS2CsVZGh541D3ebE1moQSUoOPWRQUSOSlYRs/Cw4N0I
 6ATYUZiuPH9t9srRiMgWsCMFpEiOXzmndZWKUq5FBgy6EJsBUtpaDqFbSpo4n5xZb/di
 XJdA==
X-Gm-Message-State: AOJu0Yx2PUy4Vsopn8Oo0GWy9cUZfkYdzi4O/gTfTITN0bpn/6o3Z1oB
 HwpwS29u5RIunfzr74s5AXTSaTKVHfckY9o3AN/DD/dWQIK163YU
X-Gm-Gg: ASbGncu1sRcHMk5NiSyK4p3GV7peN7Kd/NejJ59cFbsH9W6YbrORm9yaUEJvy0mKxCg
 yZWP3u1ZCm5/afA+VC0ke4x+rLrMgjSNMpRtzwxCKldZNjViLcHNjZWQLx/WWdGNkVoKA72JfK7
 gT1tdi7wDY045z9j+kL3RJVH2lW/ImMWVJETfxzuaFOgorS8RgXyjme58OZiml+d7YvB2/4Qrki
 JBsOV3pnlzcHPHtFrrk0KxyUKSiwbbTZJbRkTFPs7ezyWHWaesXTTVkgCYeRJwP2gIAllN4Km3Z
 SsVroE2mXD4Y+KiL99rD2ZoAo0Lk4cS+AlAxEhtcNzPXo+FWCA==
X-Google-Smtp-Source: AGHT+IHQVD0tIfkPN74yp5c4f2oJLeNnumF3FWo3PgQxDk2Ugmmb39SXChQKZpo1gDy2JzECsRQb1Q==
X-Received: by 2002:a05:600c:8508:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-4406aba4af7mr178019315e9.15.1745358088581; 
 Tue, 22 Apr 2025 14:41:28 -0700 (PDT)
Received: from [192.168.1.248] ([194.120.133.58])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-44092d369f1sm2256155e9.29.2025.04.22.14.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 14:41:27 -0700 (PDT)
Message-ID: <5369c64b-ba14-481c-8156-62a2efa5f447@gmail.com>
Date: Tue, 22 Apr 2025 22:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 "Richard_j_nixon@hotmail.com" <Richard_j_nixon@hotmail.com>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: drm: panel: Add driver for Himax HX8279 DDIC panels
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HW6FEBicTQyXxGu8zSYeoTOq"
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
--------------HW6FEBicTQyXxGu8zSYeoTOq
Content-Type: multipart/mixed; boundary="------------N3ZcnUoSP2zg08nWWTSKJgQN";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 "Richard_j_nixon@hotmail.com" <Richard_j_nixon@hotmail.com>
Message-ID: <5369c64b-ba14-481c-8156-62a2efa5f447@gmail.com>
Subject: re: drm: panel: Add driver for Himax HX8279 DDIC panels

--------------N3ZcnUoSP2zg08nWWTSKJgQN
Content-Type: multipart/mixed; boundary="------------075VCYFG3sx02irjB7RB8IlG"

--------------075VCYFG3sx02irjB7RB8IlG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnN0YXRpYyBhbmFseXNpcyBvbiB0b2RheSdzIGxpbnV4LW5leHQgaGFzIGZvdW5k
IHR3byBpc3N1ZXMgd2l0aCB0aGUgDQpmb2xsb3dpbmcgY29tbWl0Og0KDQpjb21taXQgMzhk
NDJjMjYxMzg5OTg1ZThkZDQ3MzlkYmQ5N2UyZGM4NTVlOGRkMA0KQXV0aG9yOiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KRGF0ZTogICBNb24gQXByIDE0IDEwOjI5OjE4IDIwMjUgKzAyMDANCg0KICAg
ICBkcm06IHBhbmVsOiBBZGQgZHJpdmVyIGZvciBIaW1heCBIWDgyNzkgRERJQyBwYW5lbHMN
Cg0KDQpJbiB0aGUgZm9sbG93aW5nIGNvZGUsIGJvb2xlYW4gdmFyaWFibGVzIGdvYV9vZGRf
dmFsaWQgYW5kIA0KZ29hX2V2ZW5fdmFsaWQgYXJlIG5vdCBpbml0aWFsaXplZC4gVGhleSBh
cmUgb25seSBiZWluZyBzZXQgKHRvIGZhbHNlKSANCm9uIHRoZSBudW1femVybyBpZiBzdGF0
ZW1lbnRzOg0KDQpzdGF0aWMgaW50IGh4ODI3OV9jaGVja19nb2FfY29uZmlnKHN0cnVjdCBo
eDgyNzkgKmh4LCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQp7DQogICAgICAgICBjb25zdCBzdHJ1
Y3QgaHg4Mjc5X3BhbmVsX2Rlc2MgKmRlc2MgPSBoeC0+ZGVzYzsNCiAgICAgICAgIGJvb2wg
Z29hX29kZF92YWxpZCwgZ29hX2V2ZW5fdmFsaWQ7DQogICAgICAgICBpbnQgaSwgbnVtX3pl
cm8sIG51bV9jbHIgPSAwOw0KDQogICAgICAgICAvKiBVcCB0byA0IHplcm8gdmFsdWVzIGlz
IGEgdmFsaWQgY29uZmlndXJhdGlvbi4gQ2hlY2sgdGhlbSBhbGwuICovDQogICAgICAgICBu
dW1femVybyA9IDE7DQogICAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShkZXNj
LT5nb2Ffb2RkX3RpbWluZyk7IGkrKykgew0KICAgICAgICAgICAgICAgICBpZiAoZGVzYy0+
Z29hX29kZF90aW1pbmdbaV0pDQogICAgICAgICAgICAgICAgICAgICAgICAgbnVtX3plcm8r
KzsNCiAgICAgICAgIH0NCg0KICAgICAgICAgaWYgKG51bV96ZXJvID09IEFSUkFZX1NJWkUo
ZGVzYy0+Z29hX29kZF90aW1pbmcpKQ0KICAgICAgICAgICAgICAgICBnb2Ffb2RkX3ZhbGlk
ID0gZmFsc2U7DQoNCiAgICAgICAgIC8qIFVwIHRvIDMgemVyb2VzIGlzIGEgdmFsaWQgY29u
ZmlnLiBDaGVjayB0aGVtIGFsbC4gKi8NCiAgICAgICAgIG51bV96ZXJvID0gMTsNCiAgICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRlc2MtPmdvYV9ldmVuX3RpbWluZyk7
IGkrKykgew0KICAgICAgICAgICAgICAgICBpZiAoZGVzYy0+Z29hX2V2ZW5fdGltaW5nW2ld
KQ0KICAgICAgICAgICAgICAgICAgICAgICAgIG51bV96ZXJvKys7DQogICAgICAgICB9DQoN
CiAgICAgICAgIGlmIChudW1femVybyA9PSBBUlJBWV9TSVpFKGRlc2MtPmdvYV9ldmVuX3Rp
bWluZykpDQogICAgICAgICAgICAgICAgIGdvYV9ldmVuX3ZhbGlkID0gZmFsc2U7DQoNCg0K
YW5kIHNvIHRoZSBmb2xsb3dpbmcgdHdvIGNoZWNrcyBvbiB0aGUgYm9vbGVhbiB2YXJpYWJs
ZXMgaXMgb24gDQpwb3RlbnRpYWxseSB1bmluaXRpYWxpemVkIHZhbHVlczoNCg0KICAgICAg
ICAgLyogUHJvZ3JhbW1pbmcgb25lIHdpdGhvdXQgdGhlIG90aGVyIHdvdWxkIG1ha2Ugbm8g
c2Vuc2UhICovDQogICAgICAgICBpZiAoZ29hX29kZF92YWxpZCAhPSBnb2FfZXZlbl92YWxp
ZCkNCiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNCiAgICAgICAgIC8qIFdl
IGtub3cgdGhhdCBib3RoIGFyZSBlaXRoZXIgdHJ1ZSBvciBmYWxzZSBub3csIGNoZWNrIGp1
c3QgDQpvbmUgKi8NCiAgICAgICAgIGlmICghZ29hX29kZF92YWxpZCkNCiAgICAgICAgICAg
ICAgICAgaHgtPnNraXBfZ29hX3RpbWluZyA9IHRydWU7DQoNCg0KQ29saW4NCg==
--------------075VCYFG3sx02irjB7RB8IlG
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

--------------075VCYFG3sx02irjB7RB8IlG--

--------------N3ZcnUoSP2zg08nWWTSKJgQN--

--------------HW6FEBicTQyXxGu8zSYeoTOq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmgIDQEFAwAAAAAACgkQaMKH38aoAiaK
bQ/+Lf3XZD7U7g7oSad8C4m0KFGC2osXPSdA4eTAOsnWXNvMJQIe/2juSzSz4Ius023wFWEOe4m0
vOzvEInM6l2UQrUOhLH2XhP1C5LpJpIUuq4tjgt0QDSJNRMOgz/PfqAIUaFdRiMCEBtEKupS8Wyu
0x21EKgek3jCWENpVmvC/fKPR8/+hN224ACxBfOFxaC5Woc9p700lHITEB8M+74Jccoqw3qMnjsW
hAF0LV12XhX/Se9KIGnlfkCu992exi5qgBgClALKQok9gAecZ5x86fR2/WuVIX+p054skA/tEgdv
t76Uk0x9gIHQnFiUKAQsP8+CXjQLBi0RURXmaU5VI6/UIqs49jSOdrsCUtLq7WW8//H0PJY2WbXy
fBIUmhp4Z85IXOZO0jqyEDM+0CwioKd4n1kaYJ4LtTzObooBpwP/WzzGg9UPmU92Tak1/BIhGWp5
CVIm2IOapKVKcDVYE8vpnm2EFwMP8bcN8bNxNMlJheaNOcbWpRaGbExeiPokSDcjNJ6FVVje9rs6
44uGWyVdHBV1fQTlGItjWZYjoHNNpqVXvj0pvJjCoG0M/QlJpDJz3Fvy64zAQZmAjGQcsuUaXBbh
e2Yae+Vpnnxt+4fRv3j7YuD5pNFSz4tiHIVKtQgzqRjJtot613kavQa64q/qtXWzRhXDqdVaKaCL
9tM=
=9cRm
-----END PGP SIGNATURE-----

--------------HW6FEBicTQyXxGu8zSYeoTOq--
