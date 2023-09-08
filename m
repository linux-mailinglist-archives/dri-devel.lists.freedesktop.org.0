Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB47986FE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 14:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A6510E89D;
	Fri,  8 Sep 2023 12:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03E10E89D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 12:27:03 +0000 (UTC)
Received: from [172.22.36.47] (unknown [115.110.84.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: david.heidelberg)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3326E6607249;
 Fri,  8 Sep 2023 13:26:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694176022;
 bh=kxmYxmERfaHjIcR3GX44H1XW83N5R1EvDpk8rarq7DM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RLbKzevVNzRpoYpSOUweFFqV1PRi95V1QP0aZkLHgy9FMlPUBdaTU1jiX2HrmCWKV
 HIPqb9JG1zqG/qvy5nmv36psPYBdSJrfXMr869574pyE9z/e0vG5wo/dbANcMFNOaQ
 h47VoJSADABNfqonov5ftn/5ZzHoyKsMnMsty/sSwZz5Rlfsv9y3+6MN5Dru9XtWzG
 JiQUFm3HXBGAlpgYF5EIgH1ktK2F+/vc96f+OxXYEirTsKYMuVA75QJrhe93UGzDfh
 ebjPpaCyo5tUE/0KcdRVpA5t0+fG0WvXj1p2ux3FHP5ZfjvGAMQ9B4VgFjs77B/EpE
 12/KaIjUQUF+Q==
Message-ID: <2dc6f9fa-06fb-44d8-97cb-6b5a983b7539@collabora.com>
Date: Fri, 8 Sep 2023 17:56:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
To: Vignesh Raman <vignesh.raman@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
 <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
 <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
Content-Language: en-US
From: David Heidelberg <david.heidelberg@collabora.com>
Autocrypt: addr=david.heidelberg@collabora.com; keydata=
 xjMEYlvLOxYJKwYBBAHaRw8BAQdA5CoWEzz4igpwK4h6lK6ZformRk84+ymcfkGNPwqEeILN
 MURhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFib3JhLmNvbT7ClgQT
 FggAPhYhBEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsDBQkFo5qABQsJCAcCBhUKCQgL
 AgQWAgMBAh4BAheAAAoJEGn1Z4YcHsAU84kBAK5YqSWAOuIumAqgWvke6BEsaIGWGQzXSuKj
 er/TXuFuAQCwc9ITSVXWWTSpdFt2+4z7Wch8tIGlbIFcS9dCFddwCc44BGJbyzsSCisGAQQB
 l1UBBQEBB0AEk7jXEwDApGOwMH/X0UAPBH8Y3isjxhNMjpyRcnl2CwMBCAfCfgQYFggAJhYh
 BEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsMBQkFo5qAAAoJEGn1Z4YcHsAU0PEA/j0Y
 uAOKJCnnwrkf3ozPP0sutA5bojoARwcIaZKO/zvIAP9PwTC9DGLg+8LJm7m2Lyf0LxLA8FXD
 wueLHBdwHg6zAQ==
In-Reply-To: <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QVbyyDjtHt2Y2bqlRUbNjGy2"
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QVbyyDjtHt2Y2bqlRUbNjGy2
Content-Type: multipart/mixed; boundary="------------0SjgPXBdE0pfxmCy61iR0gjG";
 protected-headers="v1"
From: David Heidelberg <david.heidelberg@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, daniels@collabora.com, emma@anholt.net,
 robclark@freedesktop.org, gustavo.padovan@collabora.com,
 robdclark@google.com, anholt@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 corbet@lwn.net, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, heiko@sntech.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Message-ID: <2dc6f9fa-06fb-44d8-97cb-6b5a983b7539@collabora.com>
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
 <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
 <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
In-Reply-To: <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>

--------------0SjgPXBdE0pfxmCy61iR0gjG
Content-Type: multipart/mixed; boundary="------------yPjLj8M50Ol2VqN53k1e0e4X"

--------------yPjLj8M50Ol2VqN53k1e0e4X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDgvMDkvMjAyMyAxMzoyMywgVmlnbmVzaCBSYW1hbiB3cm90ZToNCg0KPiBIaSBBbmdl
bG8sDQo+DQo+IE9uIDA3LzA5LzIzIDE2OjE2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdu
byB3cm90ZToNCj4+IElsIDI1LzA4LzIzIDE0OjI0LCBWaWduZXNoIFJhbWFuIGhhIHNjcml0
dG86DQo+Pj4gRW5hYmxlIHJlZ3VsYXRvcg0KPj4+IEVuYWJsZSBNVDYzOTcgUlRDIGRyaXZl
cg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVmlnbmVzaCBSYW1hbiA8dmlnbmVzaC5yYW1h
bkBjb2xsYWJvcmEuY29tPg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9jaS9h
cm02NC5jb25maWcgfCAyICsrDQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaS9hcm02NC5j
b25maWcgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vY2kvYXJtNjQuY29uZmlnDQo+Pj4gaW5k
ZXggODE3ZTE4ZGRmZDRmLi5lYTdhNmNjZWZmNDAgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2NpL2FybTY0LmNvbmZpZw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9j
aS9hcm02NC5jb25maWcNCj4+PiBAQCAtMTg0LDYgKzE4NCw4IEBAIENPTkZJR19IV19SQU5E
T01fTVRLPXkNCj4+PiDCoCBDT05GSUdfTVRLX0RFVkFQQz15DQo+Pj4gwqAgQ09ORklHX1BX
TV9NVEtfRElTUD15DQo+Pj4gwqAgQ09ORklHX01US19DTURRPXkNCj4+PiArQ09ORklHX1JF
R1VMQVRPUl9EQTkyMTE9eQ0KPj4+ICtDT05GSUdfUlRDX0RSVl9NVDYzOTc9eQ0KPj4NCj4+
IEkgd29uZGVyIGlmIGl0J2QgYmUgYSBiZXR0ZXIgaWRlYSB0byBzaW1wbHkgYWRkIHRob3Nl
IHRvIHRoZSANCj4+IGRlZmNvbmZpZyBpbnN0ZWFkIGFzDQo+Pg0KPj4gQ09ORklHX1JFR1VM
QVRPUl9EQTkyMTE9bQ0KPj4gQ09ORklHX1JUQ19EUlZfTVQ2Mzk3PW0NCj4+DQo+PiBBbnkg
b3BpbmlvbiBvbiB0aGlzPyBNYXR0aGlhcz8gQW55b25lIGVsc2U/DQo+DQo+IENPTkZJR19S
VENfRFJWX01UNjM5Nz1tIGlzIGFscmVhZHkgcHJlc2VudCBpbiBkZWZjb25maWcuDQo+IFdl
IGNhbiBhbHNvIGFkZCBDT05GSUdfUkVHVUxBVE9SX0RBOTIxMT1tIHRvIGRlZmNvbmZpZy4N
Cg0KV2UgbmVlZCBhZGQgY29uZmlnIHNuaXBwZXQgb3ZlcnJpZGUgZm9yIENPTkZJR19SRUdV
TEFUT1JfREE5MjExPXkgDQpiZWNhdXNlIG91ciBDSSBkb24ndCBoYXZlIGFueSBpbml0cmQg
d2l0aCBtb2R1bGVzLCB3ZSBqdXN0IGltbWVkaWF0ZWx5IA0KY29udGludWUgYm9vdCBmcm9t
IE5GUywgd2hlcmUgd2UgbG9hZCByZXN0IG9mIHRoZSBib290IG5vbi1lc3NlbnRpYWwgDQpt
b2R1bGVzLg0KDQpGb3IgZ2VuZXJpYyBrZXJuZWwsIEkgYXNzdW1lIENPTkZJR19SRUdVTEFU
T1JfREE5MjExPW0gc2hvdWxkIGJlIGFkZGVkLg0KDQpEYXZpZA0KDQo+DQo+IFJlZ2FyZHMs
DQo+IFZpZ25lc2gNCg0KLS0gDQpEYXZpZCBIZWlkZWxiZXJnDQpDb25zdWx0YW50IFNvZnR3
YXJlIEVuZ2luZWVyDQoNCkNvbGxhYm9yYSBMdGQuDQpQbGF0aW51bSBCdWlsZGluZywgU3Qg
Sm9obidzIElubm92YXRpb24gUGFyaywgQ2FtYnJpZGdlIENCNCAwRFMsIFVLDQpSZWdpc3Rl
cmVkIGluIEVuZ2xhbmQgJiBXYWxlcywgbm8uIDU1MTM3MTgNCg0K
--------------yPjLj8M50Ol2VqN53k1e0e4X
Content-Type: application/pgp-keys; name="OpenPGP_0x69F567861C1EC014.asc"
Content-Disposition: attachment; filename="OpenPGP_0x69F567861C1EC014.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYlvLOxYJKwYBBAHaRw8BAQdA5CoWEzz4igpwK4h6lK6ZformRk84+ymcfkGN
PwqEeILNMURhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFi
b3JhLmNvbT7ClgQTFggAPhYhBEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsD
BQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEGn1Z4YcHsAU84kBAK5Y
qSWAOuIumAqgWvke6BEsaIGWGQzXSuKjer/TXuFuAQCwc9ITSVXWWTSpdFt2+4z7
Wch8tIGlbIFcS9dCFddwCc44BGJbyzsSCisGAQQBl1UBBQEBB0AEk7jXEwDApGOw
MH/X0UAPBH8Y3isjxhNMjpyRcnl2CwMBCAfCfgQYFggAJhYhBEo7kSl22BK0F1Np
/mn1Z4YcHsAUBQJiW8s7AhsMBQkFo5qAAAoJEGn1Z4YcHsAU0PEA/j0YuAOKJCnn
wrkf3ozPP0sutA5bojoARwcIaZKO/zvIAP9PwTC9DGLg+8LJm7m2Lyf0LxLA8FXD
wueLHBdwHg6zAQ=3D=3D
=3DOQS+
-----END PGP PUBLIC KEY BLOCK-----

--------------yPjLj8M50Ol2VqN53k1e0e4X--

--------------0SjgPXBdE0pfxmCy61iR0gjG--

--------------QVbyyDjtHt2Y2bqlRUbNjGy2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRKO5EpdtgStBdTaf5p9WeGHB7AFAUCZPsS/AAKCRBp9WeGHB7A
FJMXAQDOC4fWl0gYmEvUPLQhSmJbWUme0uzP1yaP5MxtaDwvCwD7BgNQv9t8Yrp6
kbFOXh1myrvVXSi5VYV9ry9kKAgaVQs=
=LHU6
-----END PGP SIGNATURE-----

--------------QVbyyDjtHt2Y2bqlRUbNjGy2--
