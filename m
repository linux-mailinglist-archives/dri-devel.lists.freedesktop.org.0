Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9FC55BFA5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E8612A993;
	Tue, 28 Jun 2022 08:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A8811B242
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:55:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77B0F21BFA;
 Tue, 28 Jun 2022 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656406557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8WFqB5T2024IqKWVKHGeA2jym8PfYKGlKwpWyZlxEY=;
 b=K0QKrGl856DCTRHSQ1DRMqHM0gXgE9q7IEpMLr7uPR8qPJoWX0rGRsRcqQ3w/hIcJNgqFq
 QpRkj0bkOy4iTiuDjGHknsFhwEwqG6V2uen5yp5vVPqe0Q/peKn+j0qSu0/yINfOwHA0Un
 VthuNp2dV8ZJG5VvOx9TS39FFhNqrQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656406557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8WFqB5T2024IqKWVKHGeA2jym8PfYKGlKwpWyZlxEY=;
 b=4jGPdnvGgjN1nGiRdKKUuPXXcs8R5Vdqo4biYmA5jJ+ZbQCXCm2DV0RhDBwecVLtqBv308
 5mQ1XfaHCDfNxmAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48FFC13ACA;
 Tue, 28 Jun 2022 08:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hw3sEB3CumIOOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Jun 2022 08:55:57 +0000
Message-ID: <63e8fdc3-07c2-943b-9369-be1b7f3b2f2c@suse.de>
Date: Tue, 28 Jun 2022 10:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/68] drm/encoder: Introduce drmm_encoder_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-4-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220622143209.600298-4-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rxJH3vAFZqLIVHyJhjba6YkO"
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
--------------rxJH3vAFZqLIVHyJhjba6YkO
Content-Type: multipart/mixed; boundary="------------Z60H0iml8mcKPUBEPwOyTqNm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <63e8fdc3-07c2-943b-9369-be1b7f3b2f2c@suse.de>
Subject: Re: [PATCH v2 03/68] drm/encoder: Introduce drmm_encoder_init
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-4-maxime@cerno.tech>
In-Reply-To: <20220622143209.600298-4-maxime@cerno.tech>

--------------Z60H0iml8mcKPUBEPwOyTqNm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDYuMjIgdW0gMTY6MzEgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBU
aGUgRFJNLW1hbmFnZWQgZnVuY3Rpb24gdG8gcmVnaXN0ZXIgYW4gZW5jb2RlciBpcw0KPiBk
cm1tX2VuY29kZXJfYWxsb2MoKSBhbmQgaXRzIHZhcmlhbnRzLCB3aGljaCB3aWxsIGFsbG9j
YXRlIHRoZSB1bmRlcmx5aW5nDQo+IHN0cnVjdHVyZSBhbmQgaW5pdGlhbGlzYXRpb24gdGhl
IGVuY29kZXIuDQo+IA0KPiBIb3dldmVyLCB3ZSBtaWdodCB3YW50IHRvIHNlcGFyYXRlIHRo
ZSBzdHJ1Y3R1cmUgY3JlYXRpb24gYW5kIHRoZSBlbmNvZGVyDQo+IGluaXRpYWxpc2F0aW9u
LCBmb3IgZXhhbXBsZSBpZiB0aGUgc3RydWN0dXJlIGlzIHNoYXJlZCBhY3Jvc3MgbXVsdGlw
bGUgRFJNDQo+IGVudGl0aWVzLCBmb3IgZXhhbXBsZSBhbiBlbmNvZGVyIGFuZCBhIGNvbm5l
Y3Rvci4NCj4gDQo+IExldCdzIGNyZWF0ZSBhbiBoZWxwZXIgdG8gb25seSBpbml0aWFsaXNl
IGFuIGVuY29kZXIgdGhhdCB3b3VsZCBiZSBwYXNzZWQNCj4gYXMgYW4gYXJndW1lbnQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMgfCA1NyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9lbmNv
ZGVyLmggICAgIHwgIDUgKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5jb2Rlci5jDQo+IGlu
ZGV4IGE5NDAwMjRjODA4Ny4uYjI5ZjJmMDc3NDRmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VuY29kZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vu
Y29kZXIuYw0KPiBAQCAtMTQ4LDkgKzE0OCw5IEBAIHN0YXRpYyBpbnQgX19kcm1fZW5jb2Rl
cl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgICogdGhlIGVuY29kZXIgc3Ry
dWN0dXJlLiBUaGUgZW5jb2RlciBzdHJ1Y3R1cmUgc2hvdWxkIG5vdCBiZSBhbGxvY2F0ZWQg
d2l0aA0KPiAgICAqIGRldm1fa3phbGxvYygpLg0KPiAgICAqDQo+IC0gKiBOb3RlOiBjb25z
aWRlciB1c2luZyBkcm1tX2VuY29kZXJfYWxsb2MoKSBpbnN0ZWFkIG9mIGRybV9lbmNvZGVy
X2luaXQoKSB0bw0KPiAtICogbGV0IHRoZSBEUk0gbWFuYWdlZCByZXNvdXJjZSBpbmZyYXN0
cnVjdHVyZSB0YWtlIGNhcmUgb2YgY2xlYW51cCBhbmQNCj4gLSAqIGRlYWxsb2NhdGlvbi4N
Cj4gKyAqIE5vdGU6IGNvbnNpZGVyIHVzaW5nIGRybW1fZW5jb2Rlcl9hbGxvYygpIG9yIGRy
bW1fZW5jb2Rlcl9pbml0KCkNCj4gKyAqIGluc3RlYWQgb2YgZHJtX2VuY29kZXJfaW5pdCgp
IHRvIGxldCB0aGUgRFJNIG1hbmFnZWQgcmVzb3VyY2UNCj4gKyAqIGluZnJhc3RydWN0dXJl
IHRha2UgY2FyZSBvZiBjbGVhbnVwIGFuZCBkZWFsbG9jYXRpb24uDQo+ICAgICoNCj4gICAg
KiBSZXR1cm5zOg0KPiAgICAqIFplcm8gb24gc3VjY2VzcywgZXJyb3IgY29kZSBvbiBmYWls
dXJlLg0KPiBAQCAtMjIxLDkgKzIyMSw2IEBAIHZvaWQgKl9fZHJtbV9lbmNvZGVyX2FsbG9j
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCBzaXplX3Qgb2Zmc2V0LA0K
PiAgIAl2YV9saXN0IGFwOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAtCWlmIChXQVJOX09O
KGZ1bmNzICYmIGZ1bmNzLT5kZXN0cm95KSkNCj4gLQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7DQo+IC0NCj4gICAJY29udGFpbmVyID0gZHJtbV9remFsbG9jKGRldiwgc2l6ZSwgR0ZQ
X0tFUk5FTCk7DQo+ICAgCWlmICghY29udGFpbmVyKQ0KPiAgIAkJcmV0dXJuIEVSUl9QVFIo
LUVOT01FTSk7DQo+IEBAIC0yMzEsMTkgKzIyOCw1NyBAQCB2b2lkICpfX2RybW1fZW5jb2Rl
cl9hbGxvYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgc2l6ZV90IG9m
ZnNldCwNCj4gICAJZW5jb2RlciA9IGNvbnRhaW5lciArIG9mZnNldDsNCj4gICANCj4gICAJ
dmFfc3RhcnQoYXAsIG5hbWUpOw0KPiAtCXJldCA9IF9fZHJtX2VuY29kZXJfaW5pdChkZXYs
IGVuY29kZXIsIGZ1bmNzLCBlbmNvZGVyX3R5cGUsIG5hbWUsIGFwKTsNCj4gKwlyZXQgPSBk
cm1tX2VuY29kZXJfaW5pdChkZXYsIGVuY29kZXIsIGZ1bmNzLCBlbmNvZGVyX3R5cGUsIG5h
bWUsIGFwKTsNCg0KVGhhdCdzIHRoZSBzYW1lIHByb2JsZW0gd2l0aCBhcCBhcyBpbiB0aGUg
Q1JUQyBjYXNlLiBJIGd1ZXNzIG90aGVyIA0KcGF0Y2hlcyBhcmUgYWxzbyBhZmZlY3RlZC4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIAl2YV9lbmQoYXApOw0KPiAgIAlpZiAo
cmV0KQ0KPiAgIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gICANCj4gLQlyZXQgPSBkcm1t
X2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkcm1tX2VuY29kZXJfYWxsb2NfcmVsZWFzZSwg
ZW5jb2Rlcik7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4g
LQ0KPiAgIAlyZXR1cm4gY29udGFpbmVyOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKF9f
ZHJtbV9lbmNvZGVyX2FsbG9jKTsNCj4gICANCj4gKy8qKg0KPiArICogZHJtbV9lbmNvZGVy
X2luaXQgLSBJbml0aWFsaXplIGEgcHJlYWxsb2NhdGVkIGVuY29kZXINCj4gKyAqIEBkZXY6
IGRybSBkZXZpY2UNCj4gKyAqIEBlbmNvZGVyOiB0aGUgZW5jb2RlciB0byBpbml0DQo+ICsg
KiBAZnVuY3M6IGNhbGxiYWNrcyBmb3IgdGhpcyBlbmNvZGVyIChvcHRpb25hbCkNCj4gKyAq
IEBlbmNvZGVyX3R5cGU6IHVzZXIgdmlzaWJsZSB0eXBlIG9mIHRoZSBlbmNvZGVyDQo+ICsg
KiBAbmFtZTogcHJpbnRmIHN0eWxlIGZvcm1hdCBzdHJpbmcgZm9yIHRoZSBlbmNvZGVyIG5h
bWUsIG9yIE5VTEwgZm9yIGRlZmF1bHQgbmFtZQ0KPiArICoNCj4gKyAqIEluaXRpYWxpemVz
IGEgcHJlYWxsb2NhdGVkIGVuY29kZXIuIEVuY29kZXIgc2hvdWxkIGJlIHN1YmNsYXNzZWQg
YXMNCj4gKyAqIHBhcnQgb2YgZHJpdmVyIGVuY29kZXIgb2JqZWN0cy4gQ2xlYW51cCBpcyBh
dXRvbWF0aWNhbGx5IGhhbmRsZWQNCj4gKyAqIHRocm91Z2ggcmVnaXN0ZXJpbmcgZHJtX2Vu
Y29kZXJfY2xlYW51cCgpIHdpdGggZHJtbV9hZGRfYWN0aW9uKCkuIFRoZQ0KPiArICogZW5j
b2RlciBzdHJ1Y3R1cmUgc2hvdWxkIGJlIGFsbG9jYXRlZCB3aXRoIGRybW1fa3phbGxvYygp
Lg0KPiArICoNCj4gKyAqIFRoZSBAZHJtX2VuY29kZXJfZnVuY3MuZGVzdHJveSBob29rIG11
c3QgYmUgTlVMTC4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOg0KPiArICogWmVybyBvbiBzdWNj
ZXNzLCBlcnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+ICsgKi8NCj4gK2ludCBkcm1tX2VuY29k
ZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsDQo+ICsJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyAqZnVu
Y3MsDQo+ICsJCSAgICAgIGludCBlbmNvZGVyX3R5cGUsIGNvbnN0IGNoYXIgKm5hbWUsIC4u
LikNCj4gK3sNCj4gKwl2YV9saXN0IGFwOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlpZiAo
V0FSTl9PTihmdW5jcyAmJiBmdW5jcy0+ZGVzdHJveSkpDQo+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiArDQo+ICsJdmFfc3RhcnQoYXAsIG5hbWUpOw0KPiArCXJldCA9IF9fZHJtX2VuY29k
ZXJfaW5pdChkZXYsIGVuY29kZXIsIGZ1bmNzLCBlbmNvZGVyX3R5cGUsIG5hbWUsIGFwKTsN
Cj4gKwl2YV9lbmQoYXApOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsN
Cj4gKwlyZXQgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkcm1tX2VuY29kZXJf
YWxsb2NfcmVsZWFzZSwgZW5jb2Rlcik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1tX2Vu
Y29kZXJfaW5pdCk7DQo+ICsNCj4gICBzdGF0aWMgc3RydWN0IGRybV9jcnRjICpkcm1fZW5j
b2Rlcl9nZXRfY3J0YyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpDQo+ICAgew0KPiAg
IAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOw0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX2VuY29kZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmgNCj4g
aW5kZXggNmU5MWEwMjgwZjMxLi42NzEzZmUxODA0ZTkgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9lbmNvZGVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIu
aA0KPiBAQCAtMTk0LDYgKzE5NCwxMSBAQCBpbnQgZHJtX2VuY29kZXJfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJf
ZnVuY3MgKmZ1bmNzLA0KPiAgIAkJICAgICBpbnQgZW5jb2Rlcl90eXBlLCBjb25zdCBjaGFy
ICpuYW1lLCAuLi4pOw0KPiAgIA0KPiAraW50IGRybW1fZW5jb2Rlcl9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsDQo+ICsJCSAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
ciwNCj4gKwkJICAgICAgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzICpmdW5jcywN
Cj4gKwkJICAgICAgaW50IGVuY29kZXJfdHlwZSwgY29uc3QgY2hhciAqbmFtZSwgLi4uKTsN
Cj4gKw0KPiAgIF9fcHJpbnRmKDYsIDcpDQo+ICAgdm9pZCAqX19kcm1tX2VuY29kZXJfYWxs
b2Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJCQkgICBzaXplX3Qgc2l6ZSwgc2l6
ZV90IG9mZnNldCwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------Z60H0iml8mcKPUBEPwOyTqNm--

--------------rxJH3vAFZqLIVHyJhjba6YkO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK6whwFAwAAAAAACgkQlh/E3EQov+AD
Fw//TANnLPkXXW0QdkQ+AD4s5PqWdrTyKzeam5ma+MJCBO3gI4UEM4XAZsHE4D5wFJmdQRIfyOax
dJMtKoVEiVYp8+P7Xm1uGc2wwp7/m3Vk4DaPWySP+1UaSgcIgDn8QZECfXfcvC+FSfLr0ud1+wEK
lS1CRDu084qsga5YE+KMdrR9IL7vp3W4zBs8zKmYpmK8pFg+zS4yi4BSynD0HhLNfsgGbHVSVwyG
CXsSwUK3c5DXRdKEZhro8jhJyzB3aDanoCdY/jx4jGT1ep6iEkzyw/gvqnWiZXAtEUBLxiRTzkhz
OdFOZzXxMuQwxNFL0DqYZPe7V1nUxVZBFLABXpgMhCDYeSpBsSnz2fRx1UsX12uEVPzYXI110iEa
mvxi779l19p5LxjAPjy9ndiIJxp7aRyqjyFf5vrE6EfmvM+hP+vclpZIA60yyzVPYtswG7VSDiYJ
FSUm7KtePham6lOKjmQ8uebB0Z7QjkYiotM+hoEJHdGVRz14tVMoCoCkr76iFYgCk+3TEKYEruKh
0jMsBZ80PDMEAIvHuZIWDqjwP743yIeWESp5eIjI0HVZIKA9yZh9R5lov0QpbWBia6MR//2zsMN/
kvPfplMq3CbC+AZUX3ClHX3xby2/qM7GXxJExfUaLcx71TTUGO7EmPu3Z5wR0zjc6RJ+YFurkA9K
I6I=
=Qm0/
-----END PGP SIGNATURE-----

--------------rxJH3vAFZqLIVHyJhjba6YkO--
