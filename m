Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93B6CD5F9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 11:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304B410E515;
	Wed, 29 Mar 2023 09:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38D10E506
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:09:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96720219E1;
 Wed, 29 Mar 2023 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680080954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkDSO9gisUmrfR4J8E3LdwBNX1MJ924+7fjQmWZXwMw=;
 b=jCamSbJR1rUAnKIHBOk+RFtEqo33kEoBm/NwJcGEWfnbfgXrMOQSVeQQINLNp424BDJ6za
 aRfmF0WKDAKHF8H2yFeLLBhPB+EK9Gd6WXtROAN6NaBYX7TK6sJ6CsmUgqbIa8o7i/vAsW
 rzdpTP0YZ4McLGL7GAsRcpRL6LffzRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680080954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkDSO9gisUmrfR4J8E3LdwBNX1MJ924+7fjQmWZXwMw=;
 b=AkY8Q0vrIeG4HQirxTpgO3S6uSbYGC52hCAJ0SZtTI2NGQB8mqMfqqdz3rBPpnCWLKBTUy
 aNGyCpyDbsfeRGDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EC58138FF;
 Wed, 29 Mar 2023 09:09:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tSksFjoAJGSMegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Mar 2023 09:09:14 +0000
Message-ID: <6504a971-cf4b-ac35-4fe9-ee49b984b521@suse.de>
Date: Wed, 29 Mar 2023 11:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
In-Reply-To: <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xisgQ1LsOp80r1yWF4amrlt0"
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
--------------xisgQ1LsOp80r1yWF4amrlt0
Content-Type: multipart/mixed; boundary="------------7TXW7RLbx04W0AUDsj43WVSy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <6504a971-cf4b-ac35-4fe9-ee49b984b521@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
In-Reply-To: <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>

--------------7TXW7RLbx04W0AUDsj43WVSy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI5LjAzLjIzIHVtIDExOjA0IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IChjYydpbmcgTHVjYXMpDQo+IA0KPiBIaQ0KPiANCj4gQW0gMjUuMDMuMjMgdW0gMDg6NDYg
c2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+PiDCoCBUaGUgYXNzaWdubWVudCBhbHJlYWR5IGRv
bmUgaW4gZHJtX2NsaWVudF9idWZmZXJfdm1hcCgpLA0KPj4gwqAganVzdCB0cml2YWwgY2xl
YW4sIG5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFN1aSBK
aW5nZmVuZyA8MTUzMzAyNzMyNjBAMTg5LmNuPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDUgKystLS0NCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIA0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4gaW5kZXggNGQ2MzI1ZTkxNTY1Li4x
ZGE0OGU3MWM3ZjEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2
X2dlbmVyaWMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmlj
LmMNCj4+IEBAIC0yODIsNyArMjgyLDcgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZGFtYWdl
X2JsaXQoc3RydWN0IA0KPj4gZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fY2xpcF9yZWN0ICpj
bGlwKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIg
KmJ1ZmZlciA9IGZiX2hlbHBlci0+YnVmZmVyOw0KPj4gLcKgwqDCoCBzdHJ1Y3QgaW9zeXNf
bWFwIG1hcCwgZHN0Ow0KPj4gK8KgwqDCoCBzdHJ1Y3QgaW9zeXNfbWFwIG1hcDsNCj4+IMKg
wqDCoMKgwqAgaW50IHJldDsNCj4+IMKgwqDCoMKgwqAgLyoNCj4+IEBAIC0zMDIsOCArMzAy
LDcgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZGFtYWdlX2JsaXQoc3RydWN0IA0KPj4gZHJt
X2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPj4gwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Ow0KPj4gLcKgwqDCoCBkc3QgPSBtYXA7DQo+PiAt
wqDCoMKgIGRybV9mYmRldl9kYW1hZ2VfYmxpdF9yZWFsKGZiX2hlbHBlciwgY2xpcCwgJmRz
dCk7DQo+PiArwqDCoMKgIGRybV9mYmRldl9kYW1hZ2VfYmxpdF9yZWFsKGZiX2hlbHBlciwg
Y2xpcCwgJm1hcCk7DQo+IA0KPiBJIHNlZSB3aGF0IHlvdSdyZSBkb2luZyBhbmQgaXQncyBw
cm9iYWJseSBjb3JyZWN0IGluIHRoaXMgY2FzZS4NCj4gDQo+IEJ1dCB0aGVyZSdzIGEgbGFy
Z2VyIGlzc3VlIHdpdGggdGhpcyBpb3N5cyBpbnRlcmZhY2VzLiBTb21ldGltZXMgdGhlIA0K
PiBhZGRyZXNzIGhhcyB0byBiZSBtb2RpZmllZCAoc2VlIGNhbGxzIG9mIGlvc3lzX21hcF9p
bmNyKCkpLiBUaGF0IGNhbiANCj4gcHJldmVudCBpbmNvcnJlY3QgdXNlcyBvZiB0aGUgbWFw
cGluZyBpbiBvdGhlciBwbGFjZXMsIGVzcGVjaWFsbHkgaW4gDQoNCidwcmV2ZW50IGNvcnJl
Y3QgdXNlcycNCg0KPiB1bm1hcCBjb2RlLg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBtYWtl
IHNlbnNlIHRvIGNvbnNpZGVyIGEgc2VwYXJhdGUgc3RydWN0dXJlIGZvciB0aGUgSS9PIA0K
PiBsb2NhdGlvbi4gVGhlIGJ1ZmZlciBhcyBhIHdob2xlIHdvdWxkIHN0aWxsIGJlIHJlcHJl
c2VudGVkIGJ5IHN0cnVjdCANCj4gaW9zeXNfbWFwLsKgIEFuZCB0aGF0IG5ldyBzdHJ1Y3R1
cmUsIGxldCdzIGNhbGwgaXQgc3RydWN0IGlvc3lzX3B0ciwgDQo+IHdvdWxkIHBvaW50IHRv
IGFuIGFjdHVhbCBsb2NhdGlvbiB3aXRoaW4gdGhlIGJ1ZmZlcidzIG1lbW9yeSByYW5nZS4g
QSANCj4gZmV3IGxvY2F0aW9ucyBhbmQgaGVscGVycyB3b3VsZCBuZWVkIGNoYW5nZXMsIGJ1
dCB0aGVyZSBhcmUgbm90IHNvIG1hbnkgDQo+IGNhbGxlcnMgdGhhdCBpdCdzIGFuIGlzc3Vl
LsKgIFRoaXMgd291bGQgYWxzbyBhbGxvdyBmb3IgYSBmZXcgZGVidWdnaW5nIA0KPiB0ZXN0
cyB0aGF0IGVuc3VyZSB0aGF0IGlvc3lzX3B0ciBhbHdheXMgb3BlcmF0ZXMgd2l0aGluIHRo
ZSBib3VuZHMgb2YgYW4gDQo+IGlvc3lzX21hcC4NCj4gDQo+IEkndmUgbG9uZyBjb25zaWRl
cmVkIHRoaXMgaWRlYSwgYnV0IHRoZXJlIHdhcyBubyBwcmVzc3VyZSB0byB3b3JrIG9uIGl0
LiANCj4gTWF5YmUgbm93Lg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+
IMKgwqDCoMKgwqAgZHJtX2NsaWVudF9idWZmZXJfdnVubWFwKGJ1ZmZlcik7DQo+IA0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------7TXW7RLbx04W0AUDsj43WVSy--

--------------xisgQ1LsOp80r1yWF4amrlt0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQkADkFAwAAAAAACgkQlh/E3EQov+D7
Mg/+P3ukqIvb04q4tsxKRQMak9HAPpCGy0bOFPa/kETocKlqn1AyTF+BkfSgopPMG+gGeU576hkY
ewTnzB7oHVBFfZgbgPoGfUujGRkcWkOoAPc9ax5G1kpdJF9Y4M72lPLcKtHEDO1vHaIwRepXuzz6
NEjI63AAfGLqepqbj4QExbu0eCb75yRd4UyO5XHkhGPKyIAHu9DuWtisBw6UhRli9PRmlgJbVPnC
vJzBty5qaUVC3Nn7bzrS8spmSgSNkoe+951FXA71KPbL/YcmJ74q/LTyTdU7hV9F5raxMgogMf4s
Xd32vqFCEgSxcos8xU5qpKoLbA7pT+pHUNiSKxUurvoKD8yvpuM+1taR+i5tXU9EAeKS5O9oawyd
KCmtvaFJJUWsTam2M+skMxTPbwYg9F603yPf4oQXdniM7JOXu3vJ4vaU/uzhgAYjCnkQ9W99TQwv
SkwN2CTZ8MaLdiUHdxdKHvRzooCrE+TwBTCjh7fDrKFhkmMZwOjUdkfhl7ec6yc1Na9D9/FB1Fiu
2PpD5mb3XQz2z2kzhJgtbYhr/cUbsPq4qA+MwA3yVdLJHIvw0f3n4f0drWv7vFID3WMpGDyJLbo0
fZ2cg3eoo4prxNOby6FFkr03YdxpFgiawraKcEZI3MA+HVrnVxP+Luqa7Ms302HMP6MlpxqPfe/a
Cqg=
=Bmbu
-----END PGP SIGNATURE-----

--------------xisgQ1LsOp80r1yWF4amrlt0--
