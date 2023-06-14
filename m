Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A972F423
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 07:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9579110E0D2;
	Wed, 14 Jun 2023 05:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6801310E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 05:29:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6DB311FDD6;
 Wed, 14 Jun 2023 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686720561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=921SuzZTvdAstSLk1q0RSC9CkRaIHkeH523JeVvBHp4=;
 b=ba8Cf+hYjMvjxjJHKsCm0QoHdt8/xIB1Acyku4fS3/BFzJ+zmTEFDDYXw3hw6kWbtoBNt8
 Z+8hf+/mbPdp/9DWWS2lu57W2W8kGi7S9cZB0E/rhsWItQtLCJ0v47R1FW/dszGtpVV4dB
 wIFN2ABRpJtpqAAZDcnVCkjreHIXVgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686720561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=921SuzZTvdAstSLk1q0RSC9CkRaIHkeH523JeVvBHp4=;
 b=W2rzTQyXADma32d7giDVTxcdoRJCm/LTf7v/fjbKXwUq9CNoJm8OYHn6pXLipDiMG1Wbur
 sD3gb4ICxXmpqiDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 410591391D;
 Wed, 14 Jun 2023 05:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yNPtDjFQiWTqZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Jun 2023 05:29:21 +0000
Message-ID: <b99747c5-8810-d2b6-80c7-dbc85fcefb8b@suse.de>
Date: Wed, 14 Jun 2023 07:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/fbdev-generic: Remove a redundant assignment clause
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230614013011.750598-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230614013011.750598-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yiDraB2DSjraoMbBPZlOORbF"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yiDraB2DSjraoMbBPZlOORbF
Content-Type: multipart/mixed; boundary="------------1OOLPT0MxuIpNlWE93TCPOQW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <b99747c5-8810-d2b6-80c7-dbc85fcefb8b@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: Remove a redundant assignment clause
References: <20230614013011.750598-1-suijingfeng@loongson.cn>
In-Reply-To: <20230614013011.750598-1-suijingfeng@loongson.cn>

--------------1OOLPT0MxuIpNlWE93TCPOQW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDYuMjMgdW0gMDM6MzAgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IFRo
ZSBhc3NpZ25tZW50ICJkc3QgPSBtYXA7IiBpbiB0aGUgZHJtX2ZiZGV2X2dlbmVyaWNfZGFt
YWdlX2JsaXQoKSBmdW5jdGlvbg0KPiBpcyByZWR1bmRhbnQgYmVjYXVzZSBpdCBoYXMgYWxy
ZWFkeSBiZWVuIGNvcGllZCB3aGVuIHRoZSBjYWxsIHRvDQo+IGRybV9jbGllbnRfYnVmZmVy
X3ZtYXAoKSBpcyBmaW5pc2hlZC4gVGhlcmVmb3JlLCB0aGlzIHBhdGNoIHNhdmVzIGEgdXNl
bGVzcw0KPiBjb3B5LiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCg0KSXNuJ3QgdGhhdCB3aGF0
IHdlIGRpc2N1c3NlZCBoZXJlPw0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2
ZWwvMjAyMzAzMjUwNzQ2MzYuMTM2ODMzLTEtMTUzMzAyNzMyNjBAMTg5LmNuLw0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdWkgSmluZ2Zlbmcg
PHN1aWppbmdmZW5nQGxvb25nc29uLmNuPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDUgKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
YmRldl9nZW5lcmljLmMNCj4gaW5kZXggOThhZTcwMzg0OGEwLi5hYTY5MjRlM2E1OGMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+IEBAIC0xODIsNyAr
MTgyLDcgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZ2VuZXJpY19kYW1hZ2VfYmxpdChzdHJ1
Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPiAgIAkJCQkJIHN0cnVjdCBkcm1fY2xp
cF9yZWN0ICpjbGlwKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpi
dWZmZXIgPSBmYl9oZWxwZXItPmJ1ZmZlcjsNCj4gLQlzdHJ1Y3QgaW9zeXNfbWFwIG1hcCwg
ZHN0Ow0KPiArCXN0cnVjdCBpb3N5c19tYXAgbWFwOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0K
PiAgIAkvKg0KPiBAQCAtMjAyLDggKzIwMiw3IEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2dl
bmVyaWNfZGFtYWdlX2JsaXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4g
ICAJaWYgKHJldCkNCj4gICAJCWdvdG8gb3V0Ow0KPiAgIA0KPiAtCWRzdCA9IG1hcDsNCj4g
LQlkcm1fZmJkZXZfZ2VuZXJpY19kYW1hZ2VfYmxpdF9yZWFsKGZiX2hlbHBlciwgY2xpcCwg
JmRzdCk7DQo+ICsJZHJtX2ZiZGV2X2dlbmVyaWNfZGFtYWdlX2JsaXRfcmVhbChmYl9oZWxw
ZXIsIGNsaXAsICZtYXApOw0KPiAgIA0KPiAgIAlkcm1fY2xpZW50X2J1ZmZlcl92dW5tYXAo
YnVmZmVyKTsNCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpG
cmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBU
b3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0K
SFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------1OOLPT0MxuIpNlWE93TCPOQW--

--------------yiDraB2DSjraoMbBPZlOORbF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSJUDAFAwAAAAAACgkQlh/E3EQov+Db
PBAAq8I7bZsZJ6A3Nw0C6Xy/FivOzNNLra38OdTN90QNgfeMfFEy4HzGdFQtKge7gp5YaqKFEOPl
20HPk5VLX5X40IdHE9XjHNu1yCz5a71zBpx2Mz+XRabJkqH0yjQok4mmfebxi8n8SQljab+m2LhR
w9sId810+AHNcjRNTU39ap9na9k7tXjcnC2uobdsuSTk1zwqfNnOgdyR0I2QK3JUFuIN4LYeFmR7
r6PGearIVTfeihrgEToSWU+AUt4OonjzCk0uamhhgKU90UHeZkA/WzSdTsGjJCpkNLP6Uvu4EK+b
fIZPeEyH+LGff1/5BSqzhsmh1TTTrPGXeT7Jg4b7EChTfVeb2wsib/yrui5JtIp4rlnMHaEXhcvR
FpcCzwsBofLhewIa/h9e9xbOt79m1EM5F7MvX3v14Uxu+I00mCx8piz4LQe8Eguz/+8P+IDWS3Gb
OcCtkyd6X5XpoMIjVG8OkyYNfCUPHoX1zv3+6ph5YAyz7cwy3GzM5D5xQbw4EwxoFfY9NvTI5czL
bTd1ZkbTqs+8Q3xS4Dq7Esq+vh9jxKARG3HY6kFMR2vtGVvDbl5MAGWhnqiSO8Nfbdm98GgHtIbO
76RdrxZGB8KxCgk5PNH0aejqifaZE81N2Rrclc7o0+LcdpIny74rEoJOusGF+ICIFCsHDvb6P6lW
jdY=
=FvDz
-----END PGP SIGNATURE-----

--------------yiDraB2DSjraoMbBPZlOORbF--
