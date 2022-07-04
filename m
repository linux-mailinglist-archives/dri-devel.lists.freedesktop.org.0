Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B8565C0C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BAC11210F;
	Mon,  4 Jul 2022 16:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2671210E068
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 14:28:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9D891FF80;
 Mon,  4 Jul 2022 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656944892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jljU4+CCx2N89sbXYbT+Pz7HW5CCTrKSfc9kb43QdKo=;
 b=nTapdA7kZmDFXnXxbhrtQBY+U6/eb9wOCCuHkx+oAulkxiFo0YuecP4ux3zV9yf+GcW3ZO
 hylPC3aAWXVkSXN0DCRDUhlYbpZebWEtwUu1I+cBLGigXDn31KVlUWV/7FN7jFfh1o9xv5
 j3MK6MyWoUpg8cThRzJ92s8cLgAvAUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656944892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jljU4+CCx2N89sbXYbT+Pz7HW5CCTrKSfc9kb43QdKo=;
 b=cOIwUDjK3XKwFmdaa8PzEiNBb4j/ba+XA7e9VF1XqpmVIGFYXLUKodFw9BseW2cl7YuSpq
 Eag32TWgaCZzXFDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95A9E13451;
 Mon,  4 Jul 2022 14:28:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4LeUI/z4wmKUXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Jul 2022 14:28:12 +0000
Message-ID: <48e682b2-ec5e-781f-da07-0ebaf7ab65ec@suse.de>
Date: Mon, 4 Jul 2022 16:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm: Prevent drm_copy_field() to attempt copying a
 NULL pointer
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-3-javierm@redhat.com>
 <b90d5ae5-8629-8be8-6390-f22f97ec4f5e@suse.de>
 <8e783b8c-e7b9-3d8e-e80d-2f2608421293@redhat.com>
 <83fa378f-b331-0cb7-5878-d4d23a543b18@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <83fa378f-b331-0cb7-5878-d4d23a543b18@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a6jnEekHrVkHrgR25y6vPjhU"
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
Cc: David Airlie <airlied@linux.ie>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a6jnEekHrVkHrgR25y6vPjhU
Content-Type: multipart/mixed; boundary="------------Hd0Z1ERFRdvvO5q0NpVW3dO4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Message-ID: <48e682b2-ec5e-781f-da07-0ebaf7ab65ec@suse.de>
Subject: Re: [PATCH 2/2] drm: Prevent drm_copy_field() to attempt copying a
 NULL pointer
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-3-javierm@redhat.com>
 <b90d5ae5-8629-8be8-6390-f22f97ec4f5e@suse.de>
 <8e783b8c-e7b9-3d8e-e80d-2f2608421293@redhat.com>
 <83fa378f-b331-0cb7-5878-d4d23a543b18@redhat.com>
In-Reply-To: <83fa378f-b331-0cb7-5878-d4d23a543b18@redhat.com>

--------------Hd0Z1ERFRdvvO5q0NpVW3dO4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRvIHN1bW1hcml6ZSBvdXIgZGlzY3Vzc2lvbiBvbiBJUkMsIEknZCByZXR1cm4g
YW4gZW1wdHkgc3RyaW5nIGFuZCBkbyBhIA0KZHJtX3dhcm5fb25jZSgpIGlmIHRoZXJlJ3Mg
YSBOVUxMIHBvaW50ZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFtIDA0LjA3LjIy
IHVtIDE0OjU1IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPiBPbiA3LzQv
MjIgMTQ6MzYsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+IEhlbGxvIFRo
b21hcywNCj4+DQo+PiBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQo+Pg0KPiANCj4gW3Nu
aXBdDQo+IA0KPj4+PiArCS8qIGRvbid0IGF0dGVtcHQgdG8gY29weSBhIE5VTEwgcG9pbnRl
ciAqLw0KPj4+PiArCWlmIChXQVJOX09OQ0UoIXZhbHVlLCAiQlVHOiB0aGUgdmFsdWUgdG8g
Y29weSB3YXMgbm90IHNldCEiKSkNCj4+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICsN
Cj4+Pg0KPj4+IFdlIHVzdWFsbHkgYXNzdW1lIHRoYXQgdGhlIGNhbGxlciBwYXNzZXMgdGhl
IGNvcnJlY3QgYXJndW1lbnRzLiBUaGlzIGlzDQo+Pj4gZGlmZmVyZW50IGZvciBubyByZWFz
b25zLiBJJ2QgcmF0aGVyIG5vdCB0YWtlIHRoaXMgcGF0Y2ggdW5sZXNzIHRoZXJlJ3MNCj4+
PiBhIHNlY3VyaXR5IGltcGxpY2F0aW9uIHRvIHRoZSBpb2N0bCBpbnRlcmZhY2UgKGUuZy4s
IGxlYWtpbmcgaW5mb3JtYXRpb24NCj4+PiBiZWNhdXNlIG9mIHRoaXMgTlVMTCBwdHIpLg0K
Pj4+DQo+Pg0KPj4gVGhpcyBjYW4gbGVhZCBmcm9tIGFuIG9vcHMgKHNvZnQgcGFuaWMpIHRv
IGEga2VybmVsIGNyYXNoIGZvciBhIGJ1Z2d5IGRyaXZlci4NCj4+DQo+PiBJIHNlZSBmcm9t
IHdoZXJlIHlvdSBhcmUgY29taW5nIGZyb20gYnV0IHRoZW4gSSB0aGluayB3ZSBzaG91bGQg
c2FuaXRpemUgdGhlDQo+PiBmaWxsZWQgc3RydWN0IGRybV9kcml2ZXIgZmllbGRzIGluIGRy
bV9kZXZfcmVnaXN0ZXIoKSBhbmQgbWFrZSBpdCBmYWlsIGVhcmx5Lg0KPj4NCj4+IFdvdWxk
IHlvdSBhZ3JlZSB3aXRoIHN1Y2ggYSBwYXRjaD8gQnV0IHdoYXQgSSB0aGluayB0aGF0IHdl
IHNob3VsZG4ndCBhbGxvdw0KPj4gaXMgdG8gYXR0ZW1wdCBjb3B5aW5nIGEgTlVMTCBwb2lu
dGVyLCBpZiB3ZSBjYW4gZWFzaWx5IHByZXZlbnQgaXQuDQo+Pg0KPiANCj4gSSBtZWFuIHNv
bWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgcGF0Y2ggKGRpZG4ndCBhZGQgYSBjb21taXQg
bWVzc2FnZQ0KPiBmb3IgYnJldml0eSk6DQo+IA0KPiAgRnJvbSA0YzEzNDAwYzU0ZTBlMjk5
MThhOGViMjQ4MDEzZjU0Y2QyNjYwZjRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiBG
cm9tOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4g
RGF0ZTogTW9uLCA0IEp1bCAyMDIyIDE0OjUzOjQ4ICswMjAwDQo+IFN1YmplY3Q6IFtQQVRD
SF0gZHJtOiBDaGVjayBpbiBkcm1fZGV2X3JlZ2lzdGVyKCkgdGhhdCByZXF1aXJlZCBEUk0g
ZHJpdmVyDQo+ICAgZmllbGRzIHdlcmUgc2V0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyB8IDEzICsrKysrKysrKysrKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2Rydi5jDQo+IGluZGV4IDgyMTRhMGIxYWI3Zi4uZDRlZWJhZjM3ZTIzIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHJ2LmMNCj4gQEAgLTg0Miw2ICs4NDIsMTIgQEAgc3RhdGljIHZvaWQgcmVt
b3ZlX2NvbXBhdF9jb250cm9sX2xpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gICAJ
a2ZyZWUobmFtZSk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIGNoZWNr
X2RybV9kcml2ZXJfZmllbGRzKGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIpDQo+
ICt7DQo+ICsJLyogcmVxdWlyZWQgc2luY2UgYXJlIGNvcGllZCB0byB1c2VyLXNwYWNlIGJ5
IERSTV9JT0NUTF9WRVJTSU9OICovDQo+ICsJcmV0dXJuIGRyaXZlci0+bmFtZSAmJiBkcml2
ZXItPmRhdGUgJiYgZHJpdmVyLT5kZXNjOw0KPiArfQ0KPiArDQo+ICAgLyoqDQo+ICAgICog
ZHJtX2Rldl9yZWdpc3RlciAtIFJlZ2lzdGVyIERSTSBkZXZpY2UNCj4gICAgKiBAZGV2OiBE
ZXZpY2UgdG8gcmVnaXN0ZXINCj4gQEAgLTg2NSw3ICs4NzEsMTEgQEAgc3RhdGljIHZvaWQg
cmVtb3ZlX2NvbXBhdF9jb250cm9sX2xpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4g
ICBpbnQgZHJtX2Rldl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25l
ZCBsb25nIGZsYWdzKQ0KPiAgIHsNCj4gICAJY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgKmRy
aXZlciA9IGRldi0+ZHJpdmVyOw0KPiAtCWludCByZXQ7DQo+ICsJaW50IHJldCA9IC1FSU5W
QUw7DQo+ICsNCj4gKwlpZiAoZHJtX1dBUk4oZGV2LCAhY2hlY2tfZHJtX2RyaXZlcl9maWVs
ZHMoZHJpdmVyKSwNCj4gKwkJICAgICAiUmVxdWlyZWQgRFJNIGRyaXZlcnMgZmllbGRzIG5v
dCBzZXQuXG4iKSkNCj4gKwkJCWdvdG8gb3V0X2VycjsNCj4gICANCj4gICAJaWYgKCFkcml2
ZXItPmxvYWQpDQo+ICAgCQlkcm1fbW9kZV9jb25maWdfdmFsaWRhdGUoZGV2KTsNCj4gQEAg
LTkxMyw2ICs5MjMsNyBAQCBpbnQgZHJtX2Rldl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZsYWdzKQ0KPiAgIG91dF91bmxvY2s6DQo+ICAgCWlm
IChkcm1fZGV2X25lZWRzX2dsb2JhbF9tdXRleChkZXYpKQ0KPiAgIAkJbXV0ZXhfdW5sb2Nr
KCZkcm1fZ2xvYmFsX211dGV4KTsNCj4gK291dF9lcnI6DQo+ICAgCXJldHVybiByZXQ7DQo+
ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2Rldl9yZWdpc3Rlcik7DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------Hd0Z1ERFRdvvO5q0NpVW3dO4--

--------------a6jnEekHrVkHrgR25y6vPjhU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLC+PwFAwAAAAAACgkQlh/E3EQov+A2
MA/+M+IbBZ2NqDIeP5Re0XOp8Mdov71eEbSRzPFFD6SX4yp4WZonwXtDFc5OHwxXdah3d4xbNnDc
E2qlXHb7GVAFZitFWkcvc8AE7NhSZe9X17tceRV1Elk4nVLJ492PBi5oNoVr6+mQT0OeHCPk/TUw
BinnxnC4uCExRw46bkCNS9urZYX8JKm5YU5X7LnzCmn6h3gC3dMZ0BKEc4bEociyFyfnuYYFhy84
rCVOiyuAWzrVE2JR7m/x1k26qk6pqsbtlKPrLBTZFotS7RvfTFoMJhwiabNBPBP7QaEo8T6LcmFG
zt6IxQps/SldsOQ3JsKSsdrdN79U5C1KQZrywYa3Xm+FI1K/HCwVhTKjNid6W9uG9ssMmllgl/5b
nRwG3xXuzL8NpRTmN+6+TMbGwbhEK8mGYpCn1eTUTX+wdc+wfu6yVo4sH4/peAeceI56eMBGG/Hz
Fpbh1bo9qbNPw0ZG26DYJ9RQXk2FqhN7BRa3yUK9TaYqDdGpH4vF3p6iP7vq0Ubx3mX6zqDJkoF8
RmOzlGyxlA8afBGW1ZJs8ggGhynV4mZeor08VJ2yJ/L51q906eQUW1ofKz6uloIQkWKs2Jh/VLO1
2+Uk2C9Nrk/s+jkzpi7eTIEfQHXq41P9kXzu0XEGeAlnePrNMq6pQtWmJ3A0hShlbdKNDE94N9Yy
VCg=
=82FZ
-----END PGP SIGNATURE-----

--------------a6jnEekHrVkHrgR25y6vPjhU--
