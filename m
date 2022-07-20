Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2A57B30D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503B510E7F9;
	Wed, 20 Jul 2022 08:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6BF10E7F9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:36:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64C4D1FA24;
 Wed, 20 Jul 2022 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658306188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q19UdPEPZrq5lzg7yoJMNV2lBywbeQKmqr3AfI+OIFA=;
 b=rRKufIpqkiwoXZN8HPJjNg/odrS21AWBNxO1hB8ouGS51MV3W1o3GW26z0JKVd+wRnS+ne
 OVjwVtfKN4UWaHSCUKP+uK9CXmretqspOADbHCxXNI6VXkh6ek/B1OjKTPYooNpWG3kQYI
 tbRze4tTwpua6MOSaB113Cx5wvzwe3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658306188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q19UdPEPZrq5lzg7yoJMNV2lBywbeQKmqr3AfI+OIFA=;
 b=sKq+n9CAZAVS3CR5kP5858sae8oYyi84dAeR2nZAZEV42jSjV2VIujpBASf3GzmK/pghHY
 zCLOMprHxOviokDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43DB113ABB;
 Wed, 20 Jul 2022 08:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UEubD4y+12J8dgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:36:28 +0000
Message-ID: <c7964f0e-27c5-c629-4d43-5fb27ea5c99e@suse.de>
Date: Wed, 20 Jul 2022 10:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 08/14] drm/mgag200: Set SCROFF in primary-plane code
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, sam@ravnborg.org,
 airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220718092753.9598-1-tzimmermann@suse.de>
 <20220718092753.9598-9-tzimmermann@suse.de>
 <ff31024f-72c7-633a-feec-d8c74d99557e@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ff31024f-72c7-633a-feec-d8c74d99557e@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QGFetsOzQfBP62qdwrj2o85C"
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
--------------QGFetsOzQfBP62qdwrj2o85C
Content-Type: multipart/mixed; boundary="------------Mh2YonvkktMzjkZBo6s09jBK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, sam@ravnborg.org,
 airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <c7964f0e-27c5-c629-4d43-5fb27ea5c99e@suse.de>
Subject: Re: [PATCH v2 08/14] drm/mgag200: Set SCROFF in primary-plane code
References: <20220718092753.9598-1-tzimmermann@suse.de>
 <20220718092753.9598-9-tzimmermann@suse.de>
 <ff31024f-72c7-633a-feec-d8c74d99557e@redhat.com>
In-Reply-To: <ff31024f-72c7-633a-feec-d8c74d99557e@redhat.com>

--------------Mh2YonvkktMzjkZBo6s09jBK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDcuMjIgdW0gMTA6MTcgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDE4LzA3LzIwMjIgMTE6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVGhl
IFNDUk9GRiBiaXQgY29udHJvbHMgcmVhZGluZyB0aGUgcHJpbWFyeSBwbGFuZSdzIHNjYW5v
dXQgYnVmZmVyDQo+PiBmcm9tIHZpZGVvIG1lbW9yeS4gU2V0IGl0IGZyb20gcHJpbWFyeS1w
bGFuZSBjb2RlLCBpbnN0ZWFkIG9mIENSVEMNCj4+IGNvZGUuDQo+IA0KPiBJJ20gYSBiaXQg
Y29uY2VybmVkIGFib3V0IHRoZSBwZXJmb3JtYW5jZSBpbXBhY3Qgb2YgdGhpcyBwYXRjaC4N
Cj4gDQo+IFByZXZpb3VzbHksIHRoZSBTQ1JPRkYgYml0IGFuZCBtc2xlZXAoMjApIHdhcyBk
b25lIG9ubHkgd2hlbiANCj4gZW5hYmxpbmcvZGlzYWJsaW5nIGRpc3BsYXkuDQo+IFdpdGgg
dGhpcyBwYXRjaCwgaXQgd2lsbCBiZSBkb25lIGZvciBlYWNoIGZyYW1lLCB3aGljaCB3aWxs
IG5lZ2F0aXZlbHkgDQo+IGltcGFjdCBwZXJmb3JtYW5jZXMuDQoNCkdvb2QgcG9pbnQuIEkn
bGwgbWFrZSB0aGlzIGNvbmRpdGlvbmFsLg0KDQpTb21laG93IHBsYW5lcyBhcmUgbWlzc2lu
ZyBhIGNhbGxiYWNrIHRoYXQgb25seSBnZXRzIGV4ZWN1dGVkIHdoZW4gYSANCnBsYW5lIGdl
dHMgZW5hYmxlZC4gdGhlcmUncyBhdG9taWNfZGlzYWJsZSBmb3IgZGlzYWJsaW5nIGFuZCBh
dG9taWMgDQp1cGRhdGUgaXMgc3VwcG9zZWQgdG8gdXBkYXRlIGFuZCBlbmFibGUgYW5kIHRo
ZSBwbGFuZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gLS0gDQo+IA0KPiBK
b2NlbHluDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZpZXdlZC1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFs
ZW1wZUByZWRoYXQuY29tPg0KPj4gVGVzdGVkLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxl
bXBlQHJlZGhhdC5jb20+DQo+PiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X21vZGUuYyB8IDMzICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIA0KPj4g
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPj4gaW5kZXggMzk1
MDlkZDg0YjIzLi43ODllMDJiODYxNWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4+IEBAIC01NTAsNyArNTUwLDcgQEAgc3RhdGljIHZv
aWQgbWdhZzIwMF9nMjAwZXZfc2V0X2hpcHJpbHZsKHN0cnVjdCANCj4+IG1nYV9kZXZpY2Ug
Km1kZXYpDQo+PiDCoCBzdGF0aWMgdm9pZCBtZ2FnMjAwX2VuYWJsZV9kaXNwbGF5KHN0cnVj
dCBtZ2FfZGV2aWNlICptZGV2KQ0KPj4gwqAgew0KPj4gLcKgwqDCoCB1OCBzZXEwLCBzZXEx
LCBjcnRjZXh0MTsNCj4+ICvCoMKgwqAgdTggc2VxMCwgY3J0Y2V4dDE7DQo+PiDCoMKgwqDC
oMKgIFJSRUdfU0VRKDB4MDAsIHNlcTApOw0KPj4gwqDCoMKgwqDCoCBzZXEwIHw9IE1HQVJF
R19TRVEwX1NZTkNSU1QgfA0KPj4gQEAgLTU2NCwxMiArNTY0LDYgQEAgc3RhdGljIHZvaWQg
bWdhZzIwMF9lbmFibGVfZGlzcGxheShzdHJ1Y3QgDQo+PiBtZ2FfZGV2aWNlICptZGV2KQ0K
Pj4gwqDCoMKgwqDCoCBtZ2Ffd2FpdF92c3luYyhtZGV2KTsNCj4+IMKgwqDCoMKgwqAgbWdh
X3dhaXRfYnVzeShtZGV2KTsNCj4+IC3CoMKgwqAgUlJFR19TRVEoMHgwMSwgc2VxMSk7DQo+
PiAtwqDCoMKgIHNlcTEgJj0gfk1HQVJFR19TRVExX1NDUk9GRjsNCj4+IC3CoMKgwqAgV1JF
R19TRVEoMHgwMSwgc2VxMSk7DQo+PiAtDQo+PiAtwqDCoMKgIG1zbGVlcCgyMCk7DQo+PiAt
DQo+PiDCoMKgwqDCoMKgIFJSRUdfRUNSVCgweDAxLCBjcnRjZXh0MSk7DQo+PiDCoMKgwqDC
oMKgIGNydGNleHQxICY9IH5NR0FSRUdfQ1JUQ0VYVDFfVlNZTkNPRkY7DQo+PiDCoMKgwqDC
oMKgIGNydGNleHQxICY9IH5NR0FSRUdfQ1JUQ0VYVDFfSFNZTkNPRkY7DQo+PiBAQCAtNTc4
LDcgKzU3Miw3IEBAIHN0YXRpYyB2b2lkIG1nYWcyMDBfZW5hYmxlX2Rpc3BsYXkoc3RydWN0
IA0KPj4gbWdhX2RldmljZSAqbWRldikNCj4+IMKgIHN0YXRpYyB2b2lkIG1nYWcyMDBfZGlz
YWJsZV9kaXNwbGF5KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KQ0KPj4gwqAgew0KPj4gLcKg
wqDCoCB1OCBzZXEwLCBzZXExLCBjcnRjZXh0MTsNCj4+ICvCoMKgwqAgdTggc2VxMCwgY3J0
Y2V4dDE7DQo+PiDCoMKgwqDCoMKgIFJSRUdfU0VRKDB4MDAsIHNlcTApOw0KPj4gwqDCoMKg
wqDCoCBzZXEwICY9IH5NR0FSRUdfU0VRMF9TWU5DUlNUOw0KPj4gQEAgLTU5MSwxMiArNTg1
LDYgQEAgc3RhdGljIHZvaWQgbWdhZzIwMF9kaXNhYmxlX2Rpc3BsYXkoc3RydWN0IA0KPj4g
bWdhX2RldmljZSAqbWRldikNCj4+IMKgwqDCoMKgwqAgbWdhX3dhaXRfdnN5bmMobWRldik7
DQo+PiDCoMKgwqDCoMKgIG1nYV93YWl0X2J1c3kobWRldik7DQo+PiAtwqDCoMKgIFJSRUdf
U0VRKDB4MDEsIHNlcTEpOw0KPj4gLcKgwqDCoCBzZXExIHw9IE1HQVJFR19TRVExX1NDUk9G
RjsNCj4+IC3CoMKgwqAgV1JFR19TRVEoMHgwMSwgc2VxMSk7DQo+PiAtDQo+PiAtwqDCoMKg
IG1zbGVlcCgyMCk7DQo+PiAtDQo+PiDCoMKgwqDCoMKgIFJSRUdfRUNSVCgweDAxLCBjcnRj
ZXh0MSk7DQo+PiDCoMKgwqDCoMKgIGNydGNleHQxIHw9IE1HQVJFR19DUlRDRVhUMV9WU1lO
Q09GRiB8DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNR0FSRUdfQ1JUQ0VYVDFf
SFNZTkNPRkY7DQo+PiBAQCAtNjc2LDYgKzY2NCw3IEBAIHN0YXRpYyB2b2lkIA0KPj4gbWdh
ZzIwMF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLA0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9
IHBsYW5lX3N0YXRlLT5mYjsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9hdG9taWNfaGVs
cGVyX2RhbWFnZV9pdGVyIGl0ZXI7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcmVjdCBk
YW1hZ2U7DQo+PiArwqDCoMKgIHU4IHNlcTE7DQo+PiDCoMKgwqDCoMKgIGlmICghZmIpDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4gQEAgLTY4OCwxMSArNjc3LDI1IEBA
IHN0YXRpYyB2b2lkIA0KPj4gbWdhZzIwMF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNf
dXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4gwqDCoMKgwqDCoCAvKiBBbHdh
eXMgc2Nhbm91dCBpbWFnZSBhdCBWUkFNIG9mZnNldCAwICovDQo+PiDCoMKgwqDCoMKgIG1n
YWcyMDBfc2V0X3N0YXJ0YWRkKG1kZXYsICh1MzIpMCk7DQo+PiDCoMKgwqDCoMKgIG1nYWcy
MDBfc2V0X29mZnNldChtZGV2LCBmYik7DQo+PiArDQo+PiArwqDCoMKgIFJSRUdfU0VRKDB4
MDEsIHNlcTEpOw0KPj4gK8KgwqDCoCBzZXExICY9IH5NR0FSRUdfU0VRMV9TQ1JPRkY7DQo+
PiArwqDCoMKgIFdSRUdfU0VRKDB4MDEsIHNlcTEpOw0KPj4gK8KgwqDCoCBtc2xlZXAoMjAp
Ow0KPj4gwqAgfQ0KPj4gwqAgc3RhdGljIHZvaWQgbWdhZzIwMF9wcmltYXJ5X3BsYW5lX2hl
bHBlcl9hdG9taWNfZGlzYWJsZShzdHJ1Y3QgDQo+PiBkcm1fcGxhbmUgKnBsYW5lLA0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQ0KPj4gLXsgfQ0KPj4g
K3sNCj4+ICvCoMKgwqAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBsYW5lLT5kZXY7DQo+
PiArwqDCoMKgIHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2ID0gdG9fbWdhX2RldmljZShkZXYp
Ow0KPj4gK8KgwqDCoCB1OCBzZXExOw0KPj4gKw0KPj4gK8KgwqDCoCBSUkVHX1NFUSgweDAx
LCBzZXExKTsNCj4+ICvCoMKgwqAgc2VxMSB8PSBNR0FSRUdfU0VRMV9TQ1JPRkY7DQo+PiAr
wqDCoMKgIFdSRUdfU0VRKDB4MDEsIHNlcTEpOw0KPj4gK8KgwqDCoCBtc2xlZXAoMjApOw0K
Pj4gK30NCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5j
cyANCj4+IG1nYWcyMDBfcHJpbWFyeV9wbGFuZV9oZWxwZXJfZnVuY3MgPSB7DQo+PiDCoMKg
wqDCoMKgIERSTV9HRU1fU0hBRE9XX1BMQU5FX0hFTFBFUl9GVU5DUywNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Mh2YonvkktMzjkZBo6s09jBK--

--------------QGFetsOzQfBP62qdwrj2o85C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLXvosFAwAAAAAACgkQlh/E3EQov+Aw
+hAA0R7ZCbfEjrbK5Yv1DNkeH7ecUtZD+bv/z2eguZybWnR0eWON108HV1xU34F8qNG8OjNffqrq
WR6KSU+/Y3fdeNrwVZDWwLwYKUrPF/yPmNgYYOgWuK0u19qRartiXqmi0M9n6Hg1a3fbGFX5FGJ5
I4GgG+VCRBY5Y8E8mYdGSQuuQuNaRUjIoztLYeEnm1DDx5ZE5jkOJOtA4fFuHKf975qDMrWdapzc
tOhjPUVdKAcyOTKb2wvRTOs5HnKI09o3U8R8z63zBMDRWPvAX452VBDcRKtLMoynpVc/ewUU1cB4
yMZt6JcECsc8F8ixVruJMIWWl3Osg5NgvuFMQFWmsVdKlTDkh5IhWeIC7kxrGC0S9x9QuiYuWJRu
udC19TJBHhuy03RveJYJHNowGLIIvqXQnwHNtTKnx0h8ePxPtz9moEZ29S0m066aDb8GZYDMg5jf
5m9yTU8P0v6EtB0o9VHjLu8n9pgjYQKa9k81UpPKtMSCNtTq4Kge0oxILDVuCew2onbxbJUWi9i1
OEgkOXvH7BU5+IJ4nS/Cgzt6gcpE3onpnR4y9JjX6yV30JNGd/M53Z1SoLEtqu7mGxFKinCCSN0C
LjeHyHhzKv43P5BvT2VPS8Kwsdr0sKomWWD1Ll3Uov0f9iYJxPbGlY2CYu703gta3AZRNdq9Ue+Y
JQ4=
=TBeK
-----END PGP SIGNATURE-----

--------------QGFetsOzQfBP62qdwrj2o85C--
