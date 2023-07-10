Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7274D4CD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 13:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6558010E157;
	Mon, 10 Jul 2023 11:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43D810E157
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:51:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7AEE71FEE9;
 Mon, 10 Jul 2023 11:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688989899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b63AdZG7loth1s/Ab22HhMt5pKXA2TBVOl+TodRbhg=;
 b=QNz6pekD3HGbd0EcK/E0ZAZYUT49mQucTWehSVlV4jobdDDJGn5fTlyzBru1pmKQ9gBaXO
 A6oxC/46LC376oK1TNHHaxx1kXhpP8qc0I6oENKClwns6RK/8TP4i76ApdEIN9eryi9UOI
 6Kk18z/0oSaL4XfxRp+c0i+OIR5ZnyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688989899;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9b63AdZG7loth1s/Ab22HhMt5pKXA2TBVOl+TodRbhg=;
 b=nBtSg+vZLXuhugGflCd1Mfx821J+axsOJ/dAjCvEM2ZH0Tw2MfAA8oIGDRyTWqDKma8Hq5
 5kom7VzpjT3OlXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BA581361C;
 Mon, 10 Jul 2023 11:51:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +utwEcvwq2TdbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 11:51:39 +0000
Message-ID: <45925a3e-40ec-7509-b9da-53c11594f6d7@suse.de>
Date: Mon, 10 Jul 2023 13:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
 <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bM3nLF4PVRA7pEcnbKDYKYeQ"
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
Cc: loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bM3nLF4PVRA7pEcnbKDYKYeQ
Content-Type: multipart/mixed; boundary="------------p7Hs6jNNzORrl80BOrE9c0YW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
Cc: loongson-kernel@lists.loongnix.cn,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <45925a3e-40ec-7509-b9da-53c11594f6d7@suse.de>
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
 <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
In-Reply-To: <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>

--------------p7Hs6jNNzORrl80BOrE9c0YW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTM6MzQgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gSGks
DQo+IA0KPiBPbiAyMDIzLzcvMTAgMTg6MzksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4NCj4+DQo+PiBBbSAxMC4wNy4yMyB1bSAxMjoyNCBzY2hyaWViIFN1aSBKaW5nZmVuZzoN
Cj4+PiBCZWNhdXNlIHNtYXRjaCB3YXJuaW5nczoNCj4+Pg0KPj4+IGRyaXZlcnMvZ3B1L2Ry
bS9sb29uZ3Nvbi9sc2RjX3BsYW5lLmM6MTk5DQo+Pj4gbHNkY19jdXJzb3JfcGxhbmVfYXRv
bWljX2FzeW5jX2NoZWNrKCkNCj4+PiB3YXJuOiB2YXJpYWJsZSBkZXJlZmVyZW5jZWQgYmVm
b3JlIGNoZWNrICdzdGF0ZScgKHNlZSBsaW5lIDE4MCkNCj4+Pg0KPj4+IHZpbSArL3N0YXRl
ICsxOTkgZHJpdmVycy9ncHUvZHJtL2xvb25nc29uL2xzZGNfcGxhbmUuYw0KPj4+DQo+Pj4g
MTc0wqAgc3RhdGljIGludA0KPj4+IMKgwqDCoMKgwqAgbHNkY19jdXJzb3JfcGxhbmVfYXRv
bWljX2FzeW5jX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4+IDE3NcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgDQo+Pj4gKnN0YXRl
KQ0KPj4+IDE3NsKgIHsNCj4+PiAxNzfCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqbmV3X3N0YXRlOw0KPj4+IDE3OMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7DQo+Pj4gMTc5DQo+Pj4gMTgwwqDCoMKg
wqDCoMKgwqDCoMKgIG5ld19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0
ZShzdGF0ZSwgcGxhbmUpOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXl5eXl4NCj4+PiBzdGF0ZSBpcyBkZXJlZmVy
ZW5jZWQgaW5zaWRlIHRoaXMgZnVuY3Rpb24NCj4+Pg0KPj4+IDE4MQ0KPj4+IDE4MsKgIGlm
ICghcGxhbmUtPnN0YXRlIHx8ICFwbGFuZS0+c3RhdGUtPmZiKSB7DQo+Pj4gMTgzwqDCoMKg
wqDCoMKgwqDCoMKgIGRybV9kYmcocGxhbmUtPmRldiwgIiVzOiBzdGF0ZSBpcyBOVUxMXG4i
LCBwbGFuZS0+bmFtZSk7DQo+Pj4gMTg0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+PiAxODXCoCB9DQo+Pj4gMTg2DQo+Pj4gMTg3wqAg
aWYgKG5ld19zdGF0ZS0+Y3J0Y193ICE9IG5ld19zdGF0ZS0+Y3J0Y19oKSB7DQo+Pj4gMTg4
wqDCoMKgwqDCoMKgwqDCoMKgIGRybV9kYmcocGxhbmUtPmRldiwgInVuc3VwcG9ydGVkIGN1
cnNvciBzaXplOiAldXgldVxuIiwNCj4+PiAxODnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG5ld19zdGF0ZS0+Y3J0Y193LCBuZXdfc3RhdGUtPmNydGNfaCk7DQo+Pj4g
MTkwwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+IDE5McKgIH0NCj4+
PiAxOTINCj4+PiAxOTPCoCBpZiAobmV3X3N0YXRlLT5jcnRjX3cgIT0gNjQgJiYgbmV3X3N0
YXRlLT5jcnRjX3cgIT0gMzIpIHsNCj4+PiAxOTTCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2Ri
ZyhwbGFuZS0+ZGV2LCAidW5zdXBwb3J0ZWQgY3Vyc29yIHNpemU6ICV1eCV1XG4iLA0KPj4+
IDE5NcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV3X3N0YXRlLT5jcnRj
X3csIG5ld19zdGF0ZS0+Y3J0Y19oKTsNCj4+PiAxOTbCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7DQo+Pj4gMTk3wqAgfQ0KPj4+IDE5OA0KPj4+IDE5OcKgIGlmIChzdGF0
ZSkgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXg0KPj4+IENoZWNrZWQgdG9vIGxh
dGUhDQo+Pj4NCj4+PiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBsaW5hcm8ub3JnPg0KPj4+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIzMDcxMDA0MjMuclY3RDA1VXEtbGtwQGludGVsLmNvbS8NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNuPg0KPj4NCj4+IEFja2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+DQo+PiBC
VFcsIHlvdSdyZSBwb3N0aW5nIHRoZXNlIHBhdGNoZXMgZm9yIGxvb25nc29uLCANCj4gDQo+
IEknbSBwb3N0aW5nIHRoZXNlIHBhdGNoZXMgZm9yIHRoZSBkcm0vbG9vbmdzb24gZHJpdmVy
IGluIGRybS1taXNjIGFuZC9vciANCj4gZHJtLXRpcCBicmFuY2gsDQo+IA0KPiB3aGF0IGRv
IHlvdSBtZWFucyBmb3IgKmxvb25nc29uKiwNCj4gDQo+PiBidXQgdGhhdCBkcml2ZXIgaXMg
bm90IHlldCBpbiBvdXIgdHJlZT8NCj4+DQo+IA0KPiBJIGFscmVhZHkgYXBwbGllZChwdXNo
KSBkcm0vbG9vbmdzb24gZHJpdmVyIHRvIGRybS1taXNjLW5leHQgYnJhbmNoLA0KPiANCj4g
V2hhdCBkbyB5b3UgbWVhbnMgdGhhdCBieSAibm90IHlldCBpbiBvdXIgdHJlZSIsIGxpbnV4
IGtlcm5lbCBzaWRlPw0KPiANCj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/DQoNCk5vLCBp
dCdzIG15IGZhdWx0LiBJIGRpZG4ndCB1cGRhdGUgbXkgYnJhbmNoZXMgY29ycmVjdGx5LiA6
KQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+IEJlc3QgcmVnYXJkcw0K
Pj4gVGhvbWFzDQo+Pg0KPj4NCj4+PiAtLS0NCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbG9v
bmdzb24vbHNkY19wbGFuZS5jIHwgOCArLS0tLS0tLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbG9vbmdzb24vbHNkY19wbGFuZS5jIA0KPj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2xvb25nc29uL2xzZGNfcGxhbmUuYw0KPj4+IGluZGV4IDJhYjNkYjk4MmFh
My4uMGQ1MDk0NjMzMjIyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9sb29u
Z3Nvbi9sc2RjX3BsYW5lLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbG9vbmdzb24v
bHNkY19wbGFuZS5jDQo+Pj4gQEAgLTE5NiwxMyArMTk2LDcgQEAgc3RhdGljIGludCANCj4+
PiBsc2RjX2N1cnNvcl9wbGFuZV9hdG9taWNfYXN5bmNfY2hlY2soc3RydWN0IGRybV9wbGFu
ZSAqcGxhbmUsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+
IMKgwqDCoMKgwqAgfQ0KPj4+IMKgIC3CoMKgwqAgaWYgKHN0YXRlKSB7DQo+Pj4gLcKgwqDC
oMKgwqDCoMKgIGNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9leGlzdGluZ19jcnRjX3N0
YXRlKHN0YXRlLCANCj4+PiBuZXdfc3RhdGUtPmNydGMpOw0KPj4+IC3CoMKgwqAgfSBlbHNl
IHsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgY3J0Y19zdGF0ZSA9IHBsYW5lLT5jcnRjLT5zdGF0
ZTsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX2RiZyhwbGFuZS0+ZGV2LCAiJXM6IGF0b21p
YyBzdGF0ZSBpcyBOVUxMXG4iLCBwbGFuZS0+bmFtZSk7DQo+Pj4gLcKgwqDCoCB9DQo+Pj4g
LQ0KPj4+ICvCoMKgwqAgY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2V4aXN0aW5nX2Ny
dGNfc3RhdGUoc3RhdGUsIA0KPj4+IG5ld19zdGF0ZS0+Y3J0Yyk7DQo+Pj4gwqDCoMKgwqDC
oCBpZiAoIWNydGNfc3RhdGUtPmFjdGl2ZSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6
IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9l
cm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------p7Hs6jNNzORrl80BOrE9c0YW--

--------------bM3nLF4PVRA7pEcnbKDYKYeQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSr8MoFAwAAAAAACgkQlh/E3EQov+Dk
Fw//ePfZQdMN0v3R9F8fgb4SeN6tnQlbbEovMsbSv2/ZU6g5tx/ruCTT472rFux3tqYPmi95POao
uaBqFstalX+HnBpdTBb6VWAxC5eYvB2b/yqOhjl7ov7mqZyAL4utPYtJW0pedfYyDG/bEsdZV6u0
BsRsObDg4iU78t6VRmNV6FLasnIJPuJvu0ayOf2FkcTGH8EOe3Ajtcy/S3XmeC+hrvcKMcnl5R6u
Ja97oPhER9mfoCTVzYZPtkYbCyzo2XsghTINtMx5ko9TgCmumBuUhz8x2jWqKFezsE7M+z3oZgoz
AEN094vxLW6ELSxbZWLk5LgYmvIP4X1h7daxd3r+UO0kJ7YNezPocUAQ34wd3ZTWA7M7qTij7R7M
v/Iwe2xyhbxZ7hC47B6Zm5uM080UIcVgHkdfc6WQP2hfOEX0bAVmiHSyha2Fz2Zw+Vn5M4Q7z8M4
s2Obni46/mGXo534iAAbknAaymY/cCx8uyuLPsI1Aa2S++ohBXXrzxRmacynnrqjJoW/+RV564z6
Xj67NYyG63zpcAwA7LIqJ+DRlly0G2axJENW3UFaaZ8xanPTRvq32E0iEQyQqNSOAbnL0tmrprs3
+PubKHIzh4WR7YWA1bZvtB0k6gTVDBQe7ka1JlCzvJLmI/fLaUDz74GDcH8r0Q0VYSY8fux3l3dB
YP0=
=pzxq
-----END PGP SIGNATURE-----

--------------bM3nLF4PVRA7pEcnbKDYKYeQ--
