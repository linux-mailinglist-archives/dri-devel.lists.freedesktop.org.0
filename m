Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF972736EFA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FB110E2ED;
	Tue, 20 Jun 2023 14:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E2810E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 14:43:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A8BCD218B0;
 Tue, 20 Jun 2023 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687272223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bW84OXQYLqD6hgShk9TlxIcYAcG6nzbPv0XKceqr7Uw=;
 b=msFw0lko+qCtFCluyzZZWOwIozV180Xt/qXWR9xocbiM85RZ1d9vREZwJq9GoBkTw8Nvsj
 p3pOZK1SD6w/AUa4rStMlnN1LyHFgnCRzU7LIiR0ALphmOUEtixP9TM8Vd6nxBp1skbC+y
 lgo2xkJo0X+05UMVVmh7Ip8IcN4yrp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687272223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bW84OXQYLqD6hgShk9TlxIcYAcG6nzbPv0XKceqr7Uw=;
 b=2YluCctsk+CWVilMVTbAGBcVn7ASAUCbU5aL7o5uj9yo4rvM1yLRVLZ9tLD2aA/ekf17MV
 FXk2lROKP0l9+1AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 798F9133A9;
 Tue, 20 Jun 2023 14:43:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X2yCHB+7kWSKXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 14:43:43 +0000
Message-ID: <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
Date: Tue, 20 Jun 2023 16:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, liyi <liyi@loongson.cn>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cG0CvHxu2McXXl8FqPJz0RTG"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cG0CvHxu2McXXl8FqPJz0RTG
Content-Type: multipart/mixed; boundary="------------Px2w8wb3tTxfLuwERxXTD3ZS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, liyi <liyi@loongson.cn>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
In-Reply-To: <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>

--------------Px2w8wb3tTxfLuwERxXTD3ZS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjMgdW0gMDY6MDggc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IHBp
bmcgPw0KPiANCj4gT24gMjAyMy8zLzE0IDIwOjUzLCBTdWkgSmluZ2Zlbmcgd3JvdGU6DQo+
PiDCoCBlbHNlIGlzIG5vdCBnZW5lcmFsbHkgdXNlZnVsIGFmdGVyIHJldHVybg0KDQpObyBp
bmRlbnRpb24gcGxlYXNlLg0KDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3VpIEppbmdmZW5n
IDwxNTMzMDI3MzI2MEAxODkuY24+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtLmMgfCA3ICsrKystLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+PiBpbmRleCBh
NjIwOGUyYzA4OWIuLjM2NGUzNzMzYWY5OCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4+
IEBAIC0xMTUwLDggKzExNTAsOCBAQCBpbnQgZHJtX2dlbV9waW4oc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGlmIChvYmotPmZ1bmNzLT5w
aW4pDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIG9iai0+ZnVuY3MtPnBpbihvYmop
Ow0KPj4gLcKgwqDCoCBlbHNlDQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiAr
DQo+PiArwqDCoMKgIHJldHVybiAwOw0KDQpUaGlzIGNoYW5nZSBpcyBvay4NCg0KPj4gwqAg
fQ0KPj4gwqAgdm9pZCBkcm1fZ2VtX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQ0KPj4gQEAgLTExNzIsNyArMTE3Miw4IEBAIGludCBkcm1fZ2VtX3ZtYXAoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosIA0KPj4gc3RydWN0IGlvc3lzX21hcCAqbWFwKQ0KPj4gwqDC
oMKgwqDCoCByZXQgPSBvYmotPmZ1bmNzLT52bWFwKG9iaiwgbWFwKTsNCj4+IMKgwqDCoMKg
wqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gLcKg
wqDCoCBlbHNlIGlmIChpb3N5c19tYXBfaXNfbnVsbChtYXApKQ0KPj4gKw0KPj4gK8KgwqDC
oCBpZiAoaW9zeXNfbWFwX2lzX251bGwobWFwKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsNCg0KVGhpcyBpcyBub3QgY29ycmVjdC4gQ2FsbGluZyBpb3N5c19t
YXBfaXNfbnVsbCgpIGlzIHBhcnQgb2YgaGFuZGxpbmcgdGhlIA0KcmV0dXJuIHZhbHVlIGZy
b20gdm1hcCwgc28gdGhlIGVsc2UgaXMgZmluZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdl
cm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBC
b3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------Px2w8wb3tTxfLuwERxXTD3ZS--

--------------cG0CvHxu2McXXl8FqPJz0RTG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSRux4FAwAAAAAACgkQlh/E3EQov+Dw
JxAAxSn2mYtDdEEyZx4HBkIDUhuPt98gSoMvbDyD88ew7AYGGV+Cj9CWIrF2kLv5z1IbPtpTopFj
jl1Q9ntRkAG4OaJ/5QgM6GhfNbSWra1DS3zfNj3BalZsvbdZFWU64FCOaKt8rWrfTdyUtdHPtP01
Ot/t0wSIC7bMWZExbEKKEEEKuv3pA1L6TYLebCebzu4Dvux54YrHK7NVvjhNFp+RdbQJ29mdp4JY
V/wDKx5fzJFtVLFbTxZlFQymlcvWtWbk6YPMzhqxuIdasZOU2xL/GLTRrYoUXeATEtcwWBw7ryvP
PgcwQ+otIYmwdKO6qhjZXDea84YVh0bFSkABfnmaBrb6AA0ywfKCWncoS5jtgJkx5A+3XSI+t8wZ
VTnJsOa7gAmxJv2UcIdjzNTug3XVQabhgvIPO1JnhH5uxYgmnqy3fGIUIk5d1i+8Bmj4JLMhu4iB
AlkaBlGh3nfFYh00lTc8heqcVOunSaoubioNZFOTZ2gGTx/TIkugR4g1Ww7NpJgLKx9cz8K+Oq0u
G1LtoQXqEfmX3vwGZ7xC1xRduUbRXOwFDpemEkckQnOR6cksuws7AXY3UHq/mvspabQJYXI1ejZP
/NUi/YHhGuaGmamY/GKCzgGx5A6Mvjzo0oEXQDFNqDvj9RRIYtXvLEDE5XQZYdnut6+QoRkur9tE
k98=
=/9Vc
-----END PGP SIGNATURE-----

--------------cG0CvHxu2McXXl8FqPJz0RTG--
