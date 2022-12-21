Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAE652E40
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 10:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B23810E431;
	Wed, 21 Dec 2022 09:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D202610E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:08:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A51C6B31A;
 Wed, 21 Dec 2022 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671613689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3yWjaHhj4dPNyWfNrpROf0D0Qp6xcOORm1RODQqVzo=;
 b=xHO0vw6Smf0z8s929o4P4/PoxvRZekrHa7iQnaP7Mhm5Ir5x3V0HSffSSWBubiJdSM54yW
 FawFG7NwlrwIcEQMPVfPqMPZQryyPPzd/DgJOkttZiLRZH/McQGsNonRW2NdJEsX4Kj/iy
 RYmb87xKaQV67n0DSDeYCNRuN9j831M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671613689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3yWjaHhj4dPNyWfNrpROf0D0Qp6xcOORm1RODQqVzo=;
 b=ZaqLeW3Ffv2CnnKk5oupMCsR7qeHyxGTJ4J6MOoPKqXiQ0FDh2x+OUabldvtSpd+hKEON6
 wObUKU30Kc+WC4Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E796E1390E;
 Wed, 21 Dec 2022 09:08:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uvl9N/jMomNofwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Dec 2022 09:08:08 +0000
Message-ID: <e10cf9f1-af23-4355-7768-7d5010a28be0@suse.de>
Date: Wed, 21 Dec 2022 10:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/10] drm/print: Fix support for NULL as first argument
 of drm_dbg_*
Content-Language: en-US
To: Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1671566741.git.code@siddh.me>
 <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VAdZP8B12qb20EEwBHWgZBk2"
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VAdZP8B12qb20EEwBHWgZBk2
Content-Type: multipart/mixed; boundary="------------jDzyD3jKfsQFk1bC0NY4pgB3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <e10cf9f1-af23-4355-7768-7d5010a28be0@suse.de>
Subject: Re: [PATCH 04/10] drm/print: Fix support for NULL as first argument
 of drm_dbg_*
References: <cover.1671566741.git.code@siddh.me>
 <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
In-Reply-To: <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>

--------------jDzyD3jKfsQFk1bC0NY4pgB3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTIuMjIgdW0gMjE6MTYgc2NocmllYiBTaWRkaCBSYW1hbiBQYW50Og0K
PiBDb21tZW50cyBzYXkgbWFjcm9zIERSTV9ERUJVR18qIGFyZSBkZXByZWNhdGVkIGluIGZh
dm9yIG9mDQo+IGRybV9kYmdfKihOVUxMLCAuLi4pLCBidXQgdGhleSBoYXZlIGJyb2tlbiBz
dXBwb3J0IGZvciBpdCwNCj4gYXMgdGhlIG1hY3JvIHdpbGwgcmVzdWx0IGluIGAoTlVMTCkg
PyAoTlVMTCktPmRldiA6IE5VTExgLg0KPiANCj4gVGh1cywgZml4IHRoZW0gYnkgY2FzdGlu
ZyBpbnB1dCBkcm0gdG8gYSB0ZW1wb3Jhcnkgc3RydWN0IHB0ciwNCj4gd2l0aCB0aGUgc2Ft
ZSBjb252ZW50aW9uIGFzIGluIF9fRFJNX0RFRklORV9EQkdfUkFURUxJTUlURUQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTaWRkaCBSYW1hbiBQYW50IDxjb2RlQHNpZGRoLm1lPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCB8IDg5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDY5IGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9wcmludC5oIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgNCj4gaW5kZXggYTQ0
ZmI3ZWYyNTdmLi41MzcwMmQ4MzAyOTEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9wcmludC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oDQo+IEBAIC00ODYs
MjYgKzQ4Niw3NSBAQCB2b2lkIF9fZHJtX2Rldl9kYmcoc3RydWN0IF9kZGVidWcgKmRlc2Ms
IGNvbnN0IHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAJX19kcm1fcHJpbnRrKChkcm0pLCBl
cnIsIF9yYXRlbGltaXRlZCwgIipFUlJPUiogIiBmbXQsICMjX19WQV9BUkdTX18pDQo+ICAg
DQo+ICAgDQo+IC0jZGVmaW5lIGRybV9kYmdfY29yZShkcm0sIGZtdCwgLi4uKQkJCQkJXA0K
PiAtCWRybV9kZXZfZGJnKChkcm0pID8gKGRybSktPmRldiA6IE5VTEwsIERSTV9VVF9DT1JF
LCBmbXQsICMjX19WQV9BUkdTX18pDQouLi4NCj4gKyNkZWZpbmUgZHJtX2RiZ19jb3JlKGRy
bSwgZm10LCAuLi4pCQkJCVwNCj4gKyh7CQkJCQkJCQlcDQo+ICsJY29uc3Qgc3RydWN0IGRy
bV9kZXZpY2UgKmRybV8gPSAoZHJtKTsJCQlcDQo+ICsJZHJtX2Rldl9kYmcoZHJtXyA/IGRy
bV8tPmRldiA6IE5VTEwsIERSTV9VVF9DT1JFLAlcDQo+ICsJCSAgICBmbXQsICMjX19WQV9B
UkdTX18pOwkJCVwNCj4gK30pDQoNCkluc3RlYWQgb2YgZG9pbmcgdGhpcyBmb3IgZWFjaCBk
cm1fZGJnXyBtYWNybywgcmF0aGVyIGFkZCBhbiBpbnRlcm5hbCANCmhlbHBlciB0aGF0IHJl
dHVybnMgdGhlIGRldmljZSBvciBOVUxMIGxpa2UgdGhpczoNCg0Kc3RhdGljIGlubGluZSBz
dHJ1Y3QgZGV2aWNlICpfX2RybV9wcmludF9kZXYoc3RydWN0IGRybV9kZXZpY2UgKmRybSkN
CnsNCglpZiAoZHJtKQ0KCQlyZXR1cm4gZHJtLT5kZXY7DQoJcmV0dXJuIE5VTEw7DQp9DQoN
CmFuZCBjaGFuZ2UgdGhlIG1hY3JvcyB0bw0KDQpkcm1fZGJnX2NvcmUoZHJtLCBmbXQsIC4u
LikNCglkcm1fZGV2X2RiZyhfX2RybV9wcmludF9kZXYoZHJtKSwgRFJNX1VUX0NPUkUsICkN
Cg0KYW5kIHNvIG9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsNCj4gKyNkZWZp
bmUgZHJtX2RiZ19kcml2ZXIoZHJtLCBmbXQsIC4uLikJCQkJXA0KPiArKHsJCQkJCQkJCVwN
Cj4gKwljb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtXyA9IChkcm0pOwkJCVwNCj4gKwlk
cm1fZGV2X2RiZyhkcm1fID8gZHJtXy0+ZGV2IDogTlVMTCwgRFJNX1VUX0RSSVZFUiwJXA0K
PiArCQkgICAgZm10LCAjI19fVkFfQVJHU19fKTsJCQlcDQo+ICt9KQ0KPiArDQo+ICsjZGVm
aW5lIGRybV9kYmdfa21zKGRybSwgZm10LCAuLi4pCQkJCVwNCj4gKyh7CQkJCQkJCQlcDQo+
ICsJY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybV8gPSAoZHJtKTsJCQlcDQo+ICsJZHJt
X2Rldl9kYmcoZHJtXyA/IGRybV8tPmRldiA6IE5VTEwsIERSTV9VVF9LTVMsCVwNCj4gKwkJ
ICAgIGZtdCwgIyNfX1ZBX0FSR1NfXyk7CQkJXA0KPiArfSkNCj4gKw0KPiArI2RlZmluZSBk
cm1fZGJnX3ByaW1lKGRybSwgZm10LCAuLi4pCQkJCVwNCj4gKyh7CQkJCQkJCQlcDQo+ICsJ
Y29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybV8gPSAoZHJtKTsJCQlcDQo+ICsJZHJtX2Rl
dl9kYmcoZHJtXyA/IGRybV8tPmRldiA6IE5VTEwsIERSTV9VVF9QUklNRSwJXA0KPiArCQkg
ICAgZm10LCAjI19fVkFfQVJHU19fKTsJCQlcDQo+ICt9KQ0KPiArDQo+ICsjZGVmaW5lIGRy
bV9kYmdfYXRvbWljKGRybSwgZm10LCAuLi4pCQkJCVwNCj4gKyh7CQkJCQkJCQlcDQo+ICsJ
Y29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybV8gPSAoZHJtKTsJCQlcDQo+ICsJZHJtX2Rl
dl9kYmcoZHJtXyA/IGRybV8tPmRldiA6IE5VTEwsIERSTV9VVF9BVE9NSUMsCVwNCj4gKwkJ
ICAgIGZtdCwgIyNfX1ZBX0FSR1NfXyk7CQkJXA0KPiArfSkNCj4gKw0KPiArI2RlZmluZSBk
cm1fZGJnX3ZibChkcm0sIGZtdCwgLi4uKQkJCQlcDQo+ICsoewkJCQkJCQkJXA0KPiArCWNv
bnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fID0gKGRybSk7CQkJXA0KPiArCWRybV9kZXZf
ZGJnKGRybV8gPyBkcm1fLT5kZXYgOiBOVUxMLCBEUk1fVVRfVkJMLAlcDQo+ICsJCSAgICBm
bXQsICMjX19WQV9BUkdTX18pOwkJCVwNCj4gK30pDQo+ICsNCj4gKyNkZWZpbmUgZHJtX2Ri
Z19zdGF0ZShkcm0sIGZtdCwgLi4uKQkJCQlcDQo+ICsoewkJCQkJCQkJXA0KPiArCWNvbnN0
IHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fID0gKGRybSk7CQkJXA0KPiArCWRybV9kZXZfZGJn
KGRybV8gPyBkcm1fLT5kZXYgOiBOVUxMLCBEUk1fVVRfU1RBVEUsCVwNCj4gKwkJICAgIGZt
dCwgIyNfX1ZBX0FSR1NfXyk7CQkJXA0KPiArfSkNCj4gKw0KPiArI2RlZmluZSBkcm1fZGJn
X2xlYXNlKGRybSwgZm10LCAuLi4pCQkJCVwNCj4gKyh7CQkJCQkJCQlcDQo+ICsJY29uc3Qg
c3RydWN0IGRybV9kZXZpY2UgKmRybV8gPSAoZHJtKTsJCQlcDQo+ICsJZHJtX2Rldl9kYmco
ZHJtXyA/IGRybV8tPmRldiA6IE5VTEwsIERSTV9VVF9MRUFTRSwJXA0KPiArCQkgICAgZm10
LCAjI19fVkFfQVJHU19fKTsJCQlcDQo+ICt9KQ0KPiArDQo+ICsjZGVmaW5lIGRybV9kYmdf
ZHAoZHJtLCBmbXQsIC4uLikJCQkJXA0KPiArKHsJCQkJCQkJCVwNCj4gKwljb25zdCBzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtXyA9IChkcm0pOwkJCVwNCj4gKwlkcm1fZGV2X2RiZyhkcm1f
ID8gZHJtXy0+ZGV2IDogTlVMTCwgRFJNX1VUX0RQLAkJXA0KPiArCQkgICAgZm10LCAjI19f
VkFfQVJHU19fKTsJCQlcDQo+ICt9KQ0KPiArDQo+ICsjZGVmaW5lIGRybV9kYmdfZHJtcmVz
KGRybSwgZm10LCAuLi4pCQkJCVwNCj4gKyh7CQkJCQkJCQlcDQo+ICsJY29uc3Qgc3RydWN0
IGRybV9kZXZpY2UgKmRybV8gPSAoZHJtKTsJCQlcDQo+ICsJZHJtX2Rldl9kYmcoZHJtXyA/
IGRybV8tPmRldiA6IE5VTEwsIERSTV9VVF9EUk1SRVMsCVwNCj4gKwkJICAgIGZtdCwgIyNf
X1ZBX0FSR1NfXyk7CQkJXA0KPiArfSkNCj4gICANCj4gICAjZGVmaW5lIGRybV9kYmcoZHJt
LCBmbXQsIC4uLikJZHJtX2RiZ19kcml2ZXIoZHJtLCBmbXQsICMjX19WQV9BUkdTX18pDQo+
ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------jDzyD3jKfsQFk1bC0NY4pgB3--

--------------VAdZP8B12qb20EEwBHWgZBk2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOizPgFAwAAAAAACgkQlh/E3EQov+Ba
SBAAviPCixhN4CV6h1JupdIPytaaegqYc+4bLD8LwpKLNEZqUvFrkbBWDisn7b/op7SQsPwYQsZl
r4juBRxVgDwGW2hD8h6JkSU/UQqQr7hKd0jGd+IBGLpB7CIqbeiLVoq70AlaGd/a6pNhxKQVMJ7J
orpW+wmmauOVYG/SXpmqiTh8sMPMbkkeW98K1/UBoEJxXUmg8hgUjvaSacjZP5LIOhz6cE7HKer7
1zQvGPLUZPEgMpHO3WAwjLRYbW19DnEsa4oFQynaXq0au6qTZY09FC/vEGBweCP48GCNS3NmWwwS
QsHWM4tGw3ZHUujRwPIDCVHToOGCsKvZueru7qojOQKKCpOpJR5lMimuZyFx4gT6WPTdKT591hXF
+uIgbU6xLN3LXacP7IHcEKOLrMs9RYFiI1xQZD423fkAMZT/xFuB2Ehx/jiYWCxOIwt3VlK2GXsW
YzI51T8AEGWenunIHx1JSz0GQMP4zfaOhGfAkVE7blmzEftQNbk+P4r1yfp8S9dXkmH6XhTQvafg
ZLoJMkI63ipWHw0phUVFuxiBnG3PWvEu3XyETQ/Vu5NKBMmUxspSl+SzqYvF0J2OkB8Ns1zMg9ak
rGmLLLu0Kk5VQc6V8jEIkdC9hyafMFjad0HT7Mcr2locwEL8Qn92n/IiPg6D1DvPOzxSQi5Jvbxt
LrU=
=Fvpw
-----END PGP SIGNATURE-----

--------------VAdZP8B12qb20EEwBHWgZBk2--
