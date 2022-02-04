Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614854A9F79
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 19:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86BD10E801;
	Fri,  4 Feb 2022 18:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6010EBC0;
 Fri,  4 Feb 2022 18:48:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE9011F37D;
 Fri,  4 Feb 2022 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644000491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQkZ3teGEPr23y/ioYRbb+TVVhEt7w47QVQSahWM88w=;
 b=ePRZBjBXaHy1YvVslp+TubmTLRx3c03VGseBXPKt7mKL32PNooG/4Gp3LucEq62wfrCUYK
 gWN8wCUsEvhddB9au/4ldXxvjtJeiAnbPtUDy2i2/vjPDpLs2SZ9qBZYp8isOtWQyszgiB
 1GLjZ1gTFmjPSMCnqnQ2LpFXM+e/lJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644000491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQkZ3teGEPr23y/ioYRbb+TVVhEt7w47QVQSahWM88w=;
 b=G4KnRmzFxVyxWgXIYRt94I0J6sIhjenH63bgHLdkkJ3HmuK9lU/40QmKXFNClQM0MqCgAy
 /rhxNDoM+p7nJmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78E8B13AD9;
 Fri,  4 Feb 2022 18:48:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hB9wHOt0/WEOfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 18:48:11 +0000
Message-ID: <59ec3b5a-6e3f-ed8a-4cc1-c0bedb923bb8@suse.de>
Date: Fri, 4 Feb 2022 19:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/19] iosys-map: Add offset to iosys_map_memcpy_to()
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-3-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220204174436.830121-3-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ckRAS7hLEsBGDMlTBEqJpu8B"
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ckRAS7hLEsBGDMlTBEqJpu8B
Content-Type: multipart/mixed; boundary="------------kObLxEvQqYTPfydg2JbgdZma";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Message-ID: <59ec3b5a-6e3f-ed8a-4cc1-c0bedb923bb8@suse.de>
Subject: Re: [PATCH 02/19] iosys-map: Add offset to iosys_map_memcpy_to()
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-3-lucas.demarchi@intel.com>
In-Reply-To: <20220204174436.830121-3-lucas.demarchi@intel.com>

--------------kObLxEvQqYTPfydg2JbgdZma
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMTg6NDQgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IEluIGNlcnRhaW4gc2l0dWF0aW9ucyBpdCdzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIHdyaXRl
IHRvIGFuDQo+IG9mZnNldCBvZiB0aGUgbWFwcGluZy4gQWRkIGEgZHN0X29mZnNldCB0byBp
b3N5c19tYXBfbWVtY3B5X3RvKCkuDQo+IA0KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBE
ZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9jYWNoZS5jICAgICB8ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyB8ICAyICstDQo+ICAgaW5jbHVkZS9saW51eC9pb3N5cy1tYXAu
aCAgICAgICB8IDE3ICsrKysrKysrKy0tLS0tLS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hl
LmMNCj4gaW5kZXggNjY1OTdlNDExNzY0Li5jM2U2ZTYxNWJmMDkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NhY2hlLmMNCj4gQEAgLTIxOCw3ICsyMTgsNyBAQCBzdGF0aWMgdm9pZCBtZW1jcHlf
ZmFsbGJhY2soc3RydWN0IGlvc3lzX21hcCAqZHN0LA0KPiAgIAlpZiAoIWRzdC0+aXNfaW9t
ZW0gJiYgIXNyYy0+aXNfaW9tZW0pIHsNCj4gICAJCW1lbWNweShkc3QtPnZhZGRyLCBzcmMt
PnZhZGRyLCBsZW4pOw0KPiAgIAl9IGVsc2UgaWYgKCFzcmMtPmlzX2lvbWVtKSB7DQo+IC0J
CWlvc3lzX21hcF9tZW1jcHlfdG8oZHN0LCBzcmMtPnZhZGRyLCBsZW4pOw0KPiArCQlpb3N5
c19tYXBfbWVtY3B5X3RvKGRzdCwgMCwgc3JjLT52YWRkciwgbGVuKTsNCj4gICAJfSBlbHNl
IGlmICghZHN0LT5pc19pb21lbSkgew0KPiAgIAkJbWVtY3B5X2Zyb21pbyhkc3QtPnZhZGRy
LCBzcmMtPnZhZGRyX2lvbWVtLCBsZW4pOw0KPiAgIAl9IGVsc2Ugew0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMNCj4gaW5kZXggMjM4ZjgxNWNiMmEwLi5iZjVjYzlhNDJlNWEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBAQCAtMzg1LDcgKzM4NSw3IEBA
IHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGFtYWdlX2JsaXRfcmVhbChzdHJ1Y3QgZHJt
X2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPiAgIAlpb3N5c19tYXBfaW5jcihkc3QsIG9mZnNl
dCk7IC8qIGdvIHRvIGZpcnN0IHBpeGVsIHdpdGhpbiBjbGlwIHJlY3QgKi8NCj4gICANCj4g
ICAJZm9yICh5ID0gY2xpcC0+eTE7IHkgPCBjbGlwLT55MjsgeSsrKSB7DQo+IC0JCWlvc3lz
X21hcF9tZW1jcHlfdG8oZHN0LCBzcmMsIGxlbik7DQo+ICsJCWlvc3lzX21hcF9tZW1jcHlf
dG8oZHN0LCAwLCBzcmMsIGxlbik7DQo+ICAgCQlpb3N5c19tYXBfaW5jcihkc3QsIGZiLT5w
aXRjaGVzWzBdKTsNCj4gICAJCXNyYyArPSBmYi0+cGl0Y2hlc1swXTsNCj4gICAJfQ0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaCBiL2luY2x1ZGUvbGludXgv
aW9zeXMtbWFwLmgNCj4gaW5kZXggZjQxODZmOTFjYWE2Li5lZGQ3ZmEzYmU5ZTkgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgNCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9pb3N5cy1tYXAuaA0KPiBAQCAtMjIwLDIyICsyMjAsMjMgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGlvc3lzX21hcF9jbGVhcihzdHJ1Y3QgaW9zeXNfbWFwICptYXApDQo+ICAgfQ0K
PiAgIA0KPiAgIC8qKg0KPiAtICogaW9zeXNfbWFwX21lbWNweV90byAtIE1lbWNweSBpbnRv
IGlvc3lzIG1hcHBpbmcNCj4gKyAqIGlvc3lzX21hcF9tZW1jcHlfdG9fb2Zmc2V0IC0gTWVt
Y3B5IGludG8gb2Zmc2V0IG9mIGlvc3lzX21hcA0KDQonaW9zeXNfbWFwX21lbWNweV90bycN
Cg0KV2l0aCB0aGF0IGZpeGVkOg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICAg
KiBAZHN0OglUaGUgaW9zeXNfbWFwIHN0cnVjdHVyZQ0KPiArICogQGRzdF9vZmZzZXQ6CVRo
ZSBvZmZzZXQgZnJvbSB3aGljaCB0byBjb3B5DQo+ICAgICogQHNyYzoJVGhlIHNvdXJjZSBi
dWZmZXINCj4gICAgKiBAbGVuOglUaGUgbnVtYmVyIG9mIGJ5dGUgaW4gc3JjDQo+ICAgICoN
Cj4gLSAqIENvcGllcyBkYXRhIGludG8gYSBpb3N5cyBtYXBwaW5nLiBUaGUgc291cmNlIGJ1
ZmZlciBpcyBpbiBzeXN0ZW0NCj4gLSAqIG1lbW9yeS4gRGVwZW5kaW5nIG9uIHRoZSBidWZm
ZXIncyBsb2NhdGlvbiwgdGhlIGhlbHBlciBwaWNrcyB0aGUgY29ycmVjdA0KPiAtICogbWV0
aG9kIG9mIGFjY2Vzc2luZyB0aGUgbWVtb3J5Lg0KPiArICogQ29waWVzIGRhdGEgaW50byBh
IGlvc3lzX21hcCB3aXRoIGFuIG9mZnNldC4gVGhlIHNvdXJjZSBidWZmZXIgaXMgaW4NCj4g
KyAqIHN5c3RlbSBtZW1vcnkuIERlcGVuZGluZyBvbiB0aGUgYnVmZmVyJ3MgbG9jYXRpb24s
IHRoZSBoZWxwZXIgcGlja3MgdGhlDQo+ICsgKiBjb3JyZWN0IG1ldGhvZCBvZiBhY2Nlc3Np
bmcgdGhlIG1lbW9yeS4NCj4gICAgKi8NCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBpb3N5c19t
YXBfbWVtY3B5X3RvKHN0cnVjdCBpb3N5c19tYXAgKmRzdCwgY29uc3Qgdm9pZCAqc3JjLA0K
PiAtCQkJCSAgICAgICBzaXplX3QgbGVuKQ0KPiArc3RhdGljIGlubGluZSB2b2lkIGlvc3lz
X21hcF9tZW1jcHlfdG8oc3RydWN0IGlvc3lzX21hcCAqZHN0LCBzaXplX3QgZHN0X29mZnNl
dCwNCj4gKwkJCQkgICAgICAgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuKQ0KPiAgIHsN
Cj4gICAJaWYgKGRzdC0+aXNfaW9tZW0pDQo+IC0JCW1lbWNweV90b2lvKGRzdC0+dmFkZHJf
aW9tZW0sIHNyYywgbGVuKTsNCj4gKwkJbWVtY3B5X3RvaW8oZHN0LT52YWRkcl9pb21lbSAr
IGRzdF9vZmZzZXQsIHNyYywgbGVuKTsNCj4gICAJZWxzZQ0KPiAtCQltZW1jcHkoZHN0LT52
YWRkciwgc3JjLCBsZW4pOw0KPiArCQltZW1jcHkoZHN0LT52YWRkciArIGRzdF9vZmZzZXQs
IHNyYywgbGVuKTsNCj4gICB9DQo+ICAgDQo+ICAgLyoqDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------kObLxEvQqYTPfydg2JbgdZma--

--------------ckRAS7hLEsBGDMlTBEqJpu8B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9dOoFAwAAAAAACgkQlh/E3EQov+C2
6hAAml+Bim+PqDJBspFVrNnNRlYIJUQvm30u80gSNa2rwqUjZ3apZmBP7yg2Nq88vcbACr5Sri2G
wUA96+iYlyxie1zyV1mv2PRy1nkgI3RSGT0/BaIO0emsDadzQz3U4UOHD4+pXvm4V7cYwdAi/z6I
/FBGnC6InnChJZsY7NtbqoCZWPd8rIlRnNgrtKR+89s9wG/06L0ucjYinbnDqigHkDh7LYpPlh1O
exAYUmicuE5kFNt2lti26dCS1nu6JiEHRqPbysyhok1lr6yxG6nmcyWA9QSj45ZMFJKQeImewkxR
roYV7JbTwd4r+CKUqTOR/FbD3dvbx5LOHGRo6sbqU3WogQlQlV2PbEJjHtzwcVZYCl7ytCA5dhxR
N7b0QkWozxM2oZ7t3uDTiYB4Hkp4YSP2Xgk/vIf/ke+zOB/sMIz8US+Ozm4e2UbuWgfYbCcd7Qzd
vaqWbo5eWk9rIBRdg3wgXKBArEO2bMxAOq+srXDDX76njGrCr6/Mt4obwssFztGBg5Qws4Cfp8An
LbmFqJ0u9rTNv7SJzb0nCEN40bZegFRNEbPCikUfjyViu6I8Glec+9Y96LS81yRUWQEdJ0xl6SZ6
7vEBFzaBOE9q9MA3tY7bMaEsIXKN4X8c4Xh0ou9gbjReO+nw9dBVm6rd5JQtk7DM7tT0M/UT4SJA
f+E=
=2j5n
-----END PGP SIGNATURE-----

--------------ckRAS7hLEsBGDMlTBEqJpu8B--
