Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C719A7C5D13
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 20:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F220610E0C6;
	Wed, 11 Oct 2023 18:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87B110E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 18:52:59 +0000 (UTC)
Received: from [10.0.0.200] (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: david.heidelberg)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 53EF26607331;
 Wed, 11 Oct 2023 19:52:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697050378;
 bh=YzHA3NH/bDved/9AaOvnwC4kNQAv87koiFVVigRebH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ahKrAPknLzEKO2+3ucXqCRdwGrDhsROLXEl+y2H652vq4mxZX6G27hvWM9GDiOQqY
 S+S+LOjmQO0wEAt0rjEt2PUCZoxWZBvIdfk5Yson/NRbRqwQP6LgIjXsTAORK4VeMr
 5I5tDxW4W6/4G2UwFZgC2Uy5lWXWHPrUkAXOQdJ8puMTCwrNSKGwoxaEuMXh50Iobr
 LhZWq0L2VBTVmXYVp43sXWtumXjbgQrUrpU+MGJke6AZN90UdpAD2wIHwuGuxS8RX9
 9pmjniIXSTD47a/25Kk1AZiAo6fU6dAFbc8MkGo9MmM9nnhIM8N9unl+6l1VAsZ0tk
 vYa8hEwBobgnw==
Message-ID: <9f9dda3e-c566-4386-bcc8-9f8439ad55ce@collabora.com>
Date: Wed, 11 Oct 2023 20:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/ci: uprev mesa version - fix container build
To: Helen Koike <helen.koike@collabora.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
References: <20231009004953.203576-1-helen.koike@collabora.com>
 <20231009004953.203576-2-helen.koike@collabora.com>
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
In-Reply-To: <20231009004953.203576-2-helen.koike@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8SxsX7rRjHsahaowqK5pdUkR"
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
Cc: robdclark@chromium.org, rust-for-linux@vger.kernel.org,
 vignesh.raman@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8SxsX7rRjHsahaowqK5pdUkR
Content-Type: multipart/mixed; boundary="------------ny6E8kXJysBqGnGsTn23dceA";
 protected-headers="v1"
From: David Heidelberg <david.heidelberg@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Cc: robdclark@chromium.org, dmitry.baryshkov@linaro.org,
 vignesh.raman@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, quic_abhinavk@quicinc.com,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Message-ID: <9f9dda3e-c566-4386-bcc8-9f8439ad55ce@collabora.com>
Subject: Re: [PATCH 1/9] drm/ci: uprev mesa version - fix container build
References: <20231009004953.203576-1-helen.koike@collabora.com>
 <20231009004953.203576-2-helen.koike@collabora.com>
In-Reply-To: <20231009004953.203576-2-helen.koike@collabora.com>

--------------ny6E8kXJysBqGnGsTn23dceA
Content-Type: multipart/mixed; boundary="------------3IAS6kYbQNC0d0OEGq2HDpNM"

--------------3IAS6kYbQNC0d0OEGq2HDpNM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IERhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFi
b3JhLmNvbT4NCg0KT24gMDkvMTAvMjAyMyAwMjo0OSwgSGVsZW4gS29pa2Ugd3JvdGU6DQo+
IFdoZW4gYnVpbGRpbmcgY29udGFpbmVycywgc29tZSBydXN0IHBhY2thZ2VzIHdlcmUgaW5z
dGFsbGVkIHdpdGhvdXQNCj4gbG9ja2luZyB0aGUgZGVwZW5kZW5jaWVzIHZlcnNpb24sIHdo
aWNoIGdvdCB1cGRhdGVkIGFuZCBzdGFydGVkIGdpdmluZw0KPiBlcnJvcnMgbGlrZToNCj4N
Cj4gZXJyb3I6IGZhaWxlZCB0byBjb21waWxlIGBiaW5kZ2VuLWNsaSB2MC42Mi4wYCwgaW50
ZXJtZWRpYXRlIGFydGlmYWN0cyBjYW4gYmUgZm91bmQgYXQgYC90bXAvY2FyZ28taW5zdGFs
bGtOS1J3ZmANCj4gQ2F1c2VkIGJ5Og0KPiAgICBwYWNrYWdlIGBydXN0aXggdjAuMzguMTNg
IGNhbm5vdCBiZSBidWlsdCBiZWNhdXNlIGl0IHJlcXVpcmVzIHJ1c3RjIDEuNjMgb3IgbmV3
ZXIsIHdoaWxlIHRoZSBjdXJyZW50bHkgYWN0aXZlIHJ1c3RjIHZlcnNpb24gaXMgMS42MC4w
DQo+DQo+IEEgcGF0Y2ggdG8gTWVzYSB3YXMgcmVjZW50bHkgYWRkZWQgZml4aW5nIHRoaXMg
ZXJyb3IsIHNvIHVwZGF0ZSBpdC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSGVsZW4gS29pa2Ug
PGhlbGVuLmtvaWtlQGNvbGxhYm9yYS5jb20+DQo+DQo+IC0tLQ0KPg0KPiBEZXJpdmVkIHdv
cmsgZnJvbSBSRkM6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmkt
ZGV2ZWwvcGF0Y2gvMjAyMzA5MjAxNzQ0NDQuNDA5NTg2LTItaGVsZW4ua29pa2VAY29sbGFi
b3JhLmNvbS8NCj4gQ2hhbmdlczoNCj4gLSBwb2ludCB0byB1cHN0cmVhbSBtZXNhDQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9jaS9naXRsYWItY2kueW1sICB8IDE1ICsrKysrKysr
KysrKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9jaS9sYXZhLXN1Ym1pdC5zaCB8ICAyICst
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2NpL2dpdGxhYi1jaS55bWwg
Yi9kcml2ZXJzL2dwdS9kcm0vY2kvZ2l0bGFiLWNpLnltbA0KPiBpbmRleCAyYzRkZjUzZjVk
ZmUuLjUyMmY4M2RiMWEwNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2NpL2dp
dGxhYi1jaS55bWwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2NpL2dpdGxhYi1jaS55bWwN
Cj4gQEAgLTEsNiArMSw2IEBADQo+ICAgdmFyaWFibGVzOg0KPiAgICAgRFJNX0NJX1BST0pF
Q1RfUEFUSDogJmRybS1jaS1wcm9qZWN0LXBhdGggbWVzYS9tZXNhDQo+IC0gIERSTV9DSV9D
T01NSVRfU0hBOiAmZHJtLWNpLWNvbW1pdC1zaGEgMGRjOTYxNjQ1YzRmMDI0MWY4NTEyY2Iw
ZWMzYWQ1OTYzNTg0MjA3Mg0KPiArICBEUk1fQ0lfQ09NTUlUX1NIQTogJmRybS1jaS1jb21t
aXQtc2hhIDFjZGM0YmUxNGI2NjEwOGFlMGU4MDY5Njg2YWMzZWZlNTJiZWYzY2INCj4gICAN
Cj4gICAgIFVQU1RSRUFNX1JFUE86IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9kcm0NCj4gICAgIFRBUkdFVF9CUkFOQ0g6IGRybS1uZXh0DQo+IEBAIC0yNCw2ICsyNCw4
IEBAIHZhcmlhYmxlczoNCj4gICAgIFBJUEVMSU5FX0FSVElGQUNUU19CQVNFOiAke1MzX0hP
U1R9L2FydGlmYWN0cy8ke0NJX1BST0pFQ1RfUEFUSH0vJHtDSV9QSVBFTElORV9JRH0NCj4g
ICAgICMgcGVyLWpvYiBhcnRpZmFjdCBzdG9yYWdlIG9uIE1pbklPDQo+ICAgICBKT0JfQVJU
SUZBQ1RTX0JBU0U6ICR7UElQRUxJTkVfQVJUSUZBQ1RTX0JBU0V9LyR7Q0lfSk9CX0lEfQ0K
PiArICAjIGRlZmF1bHQga2VybmVsIGZvciByb290ZnMgYmVmb3JlIGluamVjdGluZyB0aGUg
Y3VycmVudCBrZXJuZWwgdHJlZQ0KPiArICBLRVJORUxfSU1BR0VfQkFTRTogaHR0cHM6Ly8k
e1MzX0hPU1R9L21lc2EtbGF2YS9nZngtY2kvbGludXgvdjYuNC4xMi1mb3ItbWVzYS1jaS1m
NmI0YWQ0NWY0OGQNCj4gICANCj4gICAgIExBVkFfSk9CX1BSSU9SSVRZOiAzMA0KPiAgIA0K
PiBAQCAtODYsNiArODgsMTcgQEAgaW5jbHVkZToNCj4gICAgICAgICAtICcvLmdpdGxhYi1j
aS9jb250YWluZXIvZ2l0bGFiLWNpLnltbCcNCj4gICAgICAgICAtICcvLmdpdGxhYi1jaS90
ZXN0L2dpdGxhYi1jaS55bWwnDQo+ICAgICAgICAgLSAnLy5naXRsYWItY2kvbGF2YS9sYXZh
LWdpdGxhYi1jaS55bWwnDQo+ICsgICAgICAtICcvc3JjL21pY3Jvc29mdC9jaS9naXRsYWIt
Y2ktaW5jLnltbCcNCj4gKyAgICAgIC0gJy9zcmMvZ2FsbGl1bS9kcml2ZXJzL3ppbmsvY2kv
Z2l0bGFiLWNpLWluYy55bWwnDQo+ICsgICAgICAtICcvc3JjL2dhbGxpdW0vZHJpdmVycy9j
cm9jdXMvY2kvZ2l0bGFiLWNpLWluYy55bWwnDQo+ICsgICAgICAtICcvc3JjL2dhbGxpdW0v
ZHJpdmVycy9zb2Z0cGlwZS9jaS9naXRsYWItY2ktaW5jLnltbCcNCj4gKyAgICAgIC0gJy9z
cmMvZ2FsbGl1bS9kcml2ZXJzL2xsdm1waXBlL2NpL2dpdGxhYi1jaS1pbmMueW1sJw0KPiAr
ICAgICAgLSAnL3NyYy9nYWxsaXVtL2RyaXZlcnMvdmlyZ2wvY2kvZ2l0bGFiLWNpLWluYy55
bWwnDQo+ICsgICAgICAtICcvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NpL2dpdGxh
Yi1jaS1pbmMueW1sJw0KPiArICAgICAgLSAnL3NyYy9nYWxsaXVtL2Zyb250ZW5kcy9sYXZh
cGlwZS9jaS9naXRsYWItY2ktaW5jLnltbCcNCj4gKyAgICAgIC0gJy9zcmMvaW50ZWwvY2kv
Z2l0bGFiLWNpLWluYy55bWwnDQo+ICsgICAgICAtICcvc3JjL2ZyZWVkcmVuby9jaS9naXRs
YWItY2ktaW5jLnltbCcNCj4gKyAgICAgIC0gJy9zcmMvYW1kL2NpL2dpdGxhYi1jaS1pbmMu
eW1sJw0KPiAgICAgLSBkcml2ZXJzL2dwdS9kcm0vY2kvaW1hZ2UtdGFncy55bWwNCj4gICAg
IC0gZHJpdmVycy9ncHUvZHJtL2NpL2NvbnRhaW5lci55bWwNCj4gICAgIC0gZHJpdmVycy9n
cHUvZHJtL2NpL3N0YXRpYy1jaGVja3MueW1sDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vY2kvbGF2YS1zdWJtaXQuc2ggYi9kcml2ZXJzL2dwdS9kcm0vY2kvbGF2YS1zdWJt
aXQuc2gNCj4gaW5kZXggMGM0NDU2YjIxYjBmLi4zNzlmMjZlYTg3Y2MgMTAwNzU1DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9jaS9sYXZhLXN1Ym1pdC5zaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vY2kvbGF2YS1zdWJtaXQuc2gNCj4gQEAgLTIyLDcgKzIyLDcgQEAgY3AgIiRT
Q1JJUFRTX0RJUiIvc2V0dXAtdGVzdC1lbnYuc2ggcmVzdWx0cy9qb2Itcm9vdGZzLW92ZXJs
YXkvDQo+ICAgDQo+ICAgIyBQcmVwYXJlIGVudiB2YXJzIGZvciB1cGxvYWQuDQo+ICAgc2Vj
dGlvbl9zdGFydCB2YXJpYWJsZXMgIlZhcmlhYmxlcyBwYXNzZWQgdGhyb3VnaDoiDQo+IC1L
RVJORUxfSU1BR0VfQkFTRV9VUkw9Imh0dHBzOi8vJHtCQVNFX1NZU1RFTV9IT1NUX1BBVEh9
IiBcDQo+ICtLRVJORUxfSU1BR0VfQkFTRT0iaHR0cHM6Ly8ke0JBU0VfU1lTVEVNX0hPU1Rf
UEFUSH0iIFwNCj4gICAJYXJ0aWZhY3RzL2NpLWNvbW1vbi9nZW5lcmF0ZS1lbnYuc2ggfCB0
ZWUgcmVzdWx0cy9qb2Itcm9vdGZzLW92ZXJsYXkvc2V0LWpvYi1lbnYtdmFycy5zaA0KPiAg
IHNlY3Rpb25fZW5kIHZhcmlhYmxlcw0KPiAgIA0KDQotLSANCkRhdmlkIEhlaWRlbGJlcmcN
CkNvbnN1bHRhbnQgU29mdHdhcmUgRW5naW5lZXINCg0KQ29sbGFib3JhIEx0ZC4NClBsYXRp
bnVtIEJ1aWxkaW5nLCBTdCBKb2huJ3MgSW5ub3ZhdGlvbiBQYXJrLCBDYW1icmlkZ2UgQ0I0
IDBEUywgVUsNClJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzLCBuby4gNTUxMzcxOA0K
DQo=
--------------3IAS6kYbQNC0d0OEGq2HDpNM
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

--------------3IAS6kYbQNC0d0OEGq2HDpNM--

--------------ny6E8kXJysBqGnGsTn23dceA--

--------------8SxsX7rRjHsahaowqK5pdUkR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRKO5EpdtgStBdTaf5p9WeGHB7AFAUCZSbvCAAKCRBp9WeGHB7A
FE99AQCfVO3V3/u7QmXTIk9sBRg/BuW6BhiGMCr4SWEYz4Nk1AEA2KsyzEZn04ll
0F8f0RdoMcCxIQNeHA5CYB8cBYkiYQQ=
=sv12
-----END PGP SIGNATURE-----

--------------8SxsX7rRjHsahaowqK5pdUkR--
