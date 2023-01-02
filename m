Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C765B416
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C1B10E350;
	Mon,  2 Jan 2023 15:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A15610E351
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:21:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9C0C341FA;
 Mon,  2 Jan 2023 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672672915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLkgnW91Co/yrY3DUInHuoyQdEphdLRzbca+IpMwwAg=;
 b=m2i6Wrjg4Ln3XrrqWqkn6nspvSLFkS7SH1UZFH2J5ttQJVCJqEpKVdI1X9FGAOzLBAFGfA
 GVOcRYhmK1hx9dyCTgRuBeTV1mZuJ7GgMXNV9q7b8NndJIELrfPHRL1le96JT473pYvdMh
 or9YhiTCeui9BgfQY71vNhsse7QGXTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672672915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLkgnW91Co/yrY3DUInHuoyQdEphdLRzbca+IpMwwAg=;
 b=kooCCPBPZnp8jQHtcgZQJ69es1ctxl0HkdfeIlMJ9UPDy0cQvpHkRdepra25n8zTmpCwnh
 89hQDVcdlY7SKJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C6D813427;
 Mon,  2 Jan 2023 15:21:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iPBIHZP2smP0ZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 15:21:55 +0000
Message-ID: <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
Date: Mon, 2 Jan 2023 16:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5QZbTnb0M024P6dO3DmnCYtT"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5QZbTnb0M024P6dO3DmnCYtT
Content-Type: multipart/mixed; boundary="------------mrcp4w2XKQ5okkNGjoAB6GhO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
Subject: Re: [PATCH] drm/vc4: Check for valid formats
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
In-Reply-To: <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>

--------------mrcp4w2XKQ5okkNGjoAB6GhO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDEuMjMgdW0gMTU6Mjkgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IEhp
LA0KPiANCj4gT24gMS8yLzIzIDExOjIwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+
IEhpDQo+Pg0KPj4gQW0gMDIuMDEuMjMgdW0gMTQ6NTcgc2NocmllYiBNYcOtcmEgQ2FuYWw6
DQo+Pj4gQ3VycmVudGx5LCB2YzQgaXMgbm90IGNoZWNraW5nIHZhbGlkIGZvcm1hdHMgYmVm
b3JlIGNyZWF0aW5nIGENCj4+PiBmcmFtZWJ1ZmZlciwgd2hpY2ggaXMgdHJpZ2dlcmluZyB0
aGUgSUdUIHRlc3QNCj4+PiBpZ3RAa21zX2FkZGZiX2Jhc2ljQGFkZGZiMjUtYmFkLW1vZGlm
aWVyIHRvIGZhaWwsIGFzIHZjNCBhY2NlcHRzDQo+Pj4gdG8gY3JlYXRlIGEgZnJhbWVidWZm
ZXIgd2l0aCBhbiBpbnZhbGlkIG1vZGlmaWVyLiBUaGVyZWZvcmUsIGNoZWNrDQo+Pj4gZm9y
IHZhbGlkIGZvcm1hdHMgYmVmb3JlIGNyZWF0aW5nIGZyYW1lYnVmZmVycyBvbiB2YzQgYW5k
IHZjNSBpbg0KPj4+IG9yZGVyIHRvIGF2b2lkIGNyZWF0aW5nIGZyYW1lYnVmZmVycyB3aXRo
IGludmFsaWQgZm9ybWF0cy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1hw61yYSBDYW5h
bCA8bWNhbmFsQGlnYWxpYS5jb20+DQo+Pj4gLS0tDQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfa21zLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQ0KPj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMgDQo+Pj4gYi9k
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9rbXMuYw0KPj4+IGluZGV4IDUzZDlmMzA0NjBjZi4u
NWQxYWZkNjZmY2MxIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2ttcy5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMNCj4+PiBA
QCAtNTAwLDYgKzUwMCwyNyBAQCBzdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciANCj4+
PiAqdmM0X2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPj4+IMKgwqDCoMKg
wqDCoMKgIG1vZGVfY21kID0gJm1vZGVfY21kX2xvY2FsOw0KPj4+IMKgwqDCoMKgfQ0KPj4+
DQo+Pj4gK8KgwqDCoCBpZiAoIWRybV9hbnlfcGxhbmVfaGFzX2Zvcm1hdChkZXYsIG1vZGVf
Y21kLT5waXhlbF9mb3JtYXQsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pKSB7DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGRybV9kYmdfa21zKGRldiwgIlVuc3VwcG9ydGVkIHBpeGVsIGZvcm1hdCAlcDRj
YyAvIG1vZGlmaWVyIA0KPj4+IDB4JWxseFxuIiwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICZtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LCBtb2RlX2NtZC0+bW9kaWZp
ZXJbMF0pOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsN
Cj4+PiArwqDCoMKgIH0NCj4+DQo+PiBUaGlzIG1pZ2h0IGJlIGEgc3R1cGlkIHF1ZXN0aW9u
LCBidXQgd2h5IGRvZXNuJ3QgZHJtX2ZiZ2VtX2ZiX2NyZWF0ZSgpIA0KPj4gZG8gdGhpcyB0
ZXN0IGFscmVhZHk/IEl0IHNlZW1zIGxpa2UgYSBuby1icmFpbmVyIGFuZCAqbm90KiB0ZXN0
aW5nIGZvciANCj4+IHRoZSBwbGFuZSBmb3JtYXRzIHNob3VsZCBiZSB0aGUgZXhjZXB0aW9u
Lg0KPiANCj4gSSB0aG91Z2h0IHRoZSBzYW1lIGluaXRpYWxseSwgYnV0IHRoZW4gSSBmb3Vu
ZCB0aGlzIG1lbnRpb24gb24gdGhlIFRPRE8gDQo+IGxpc3QgWzFdLiBTbywgaXQNCj4gaXMg
bm90IHBvc3NpYmxlIHRvIHRlc3QgaXQgb24gZHJtX2dlbV9mYl9jcmVhdGUoKSBiZWNhdXNl
LCBmb3IgDQo+IG5vbi1hdG9taWMsIGNoZWNraW5nDQo+IGRybV9hbnlfcGxhbmVfaGFzX2Zv
cm1hdCgpIGlzIG5vdCBwb3NzaWJsZSBzaW5jZSBsaWtlIHRoZSBmb3JtYXQgbGlzdCANCj4g
Zm9yIHRoZSBwcmltYXJ5IHBsYW5lDQo+IGlzIGZha2UgYW5kIHdlJ2QgdGhlcmVmb3IgcmVq
ZWN0IHZhbGlkIGZvcm1hdHMuDQoNClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIgdG8gdGhlIGRv
Y3MuDQoNCkkgc2VlIHR3byBvcHRpb25zOg0KDQoxKSBUZXN0aW5nIGZvciBhdG9taWMgbW9k
ZXNldHRpbmcgY2FuIGJlIGRvbmUgdmlhIA0KZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYs
IERSSVZFUl9BVE9NSUMpLiAgSWYgdHJ1ZSwgDQpkcm1fZ2VtX2ZiX2NyZWF0ZSgpIGNhbiBm
dXJ0aGVyIHRlc3QgZm9yIHRoZSBwbGFuZSBmb3JtYXRzLiBGb3IgDQpub24tYXRvbWljIGRy
aXZlcnMsIGp1c3Qgc2tpcCB0aGUgZm9ybWF0IHRlc3QuDQoNCjIpIEFzIGFuIGFsdGVybmF0
aXZlLCB3ZSBjb3VsZCBpbnZlcnQgdGhlIElHVCB0ZXN0IGFuZCBleHBsaWNpdGx5IGFsbG93
IA0KYW55IGZvcm1hdCB0byBiZSBhbGxvY2F0ZWQuIEFsbW9zdCBubyBkcml2ZXJzIGN1cnJl
bnRseSBib3RoZXIgd2l0aCB0aGUgDQpmb3JtYXQgdGVzdCBhbnl3YXkuIEFuZCBEUk0gd2ls
bCBhbHJlYWR5IGZhaWwgaWYgdXNlcnNwYWNlIGF0dGFjaGVzIGEgDQpmcmFtZWJ1ZmZlciB0
byBhIHBsYW5lIHdpdGggaW5jb21wYXRpYmxlIGZvcm1hdHMuIFsxXSAgKEknZCBwZXJzb25h
bGx5IA0KcHJlZmVyIHRoaXMgb3B0aW9uLCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3Mg
YW55IGNvbnNlbnN1cyBvbiB0aGF0LikNCg0KV2l0aCBlaXRoZXIgaW1wbGVtZW50ZWQsIHRo
ZSBUT0RPIGl0ZW0gY291bGQgYmUgcmVtdm9lZCBBRkFJQ1QuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jI0w3ODkNCg0KPiANCj4gSSdt
IG5vdCBzdXJlIGlmIGFueXRoaW5nIGNoYW5nZWQgc2luY2UgdGhpcyB3YXMgd3JpdHRlbiwg
YnV0IHRoYXQgd2FzIA0KPiB0aGUgcmVhc29uIHRoYXQgSQ0KPiBkZWNpZGVkIHRvIGludHJv
ZHVjZSB0aGUgY2hlY2sgaW4gdGhlIGRyaXZlciBpbnN0ZWFkIG9mIHRoZSBBUEkuDQo+IA0K
PiBbMV0gDQo+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS90cmVlL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0I24yNzkNCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4g
LSBNYcOtcmEgQ2FuYWwNCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+
DQo+Pj4gKw0KPj4+ICvCoMKgwqAgcmV0dXJuIGRybV9nZW1fZmJfY3JlYXRlKGRldiwgZmls
ZV9wcml2LCBtb2RlX2NtZCk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyBzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICp2YzVfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9m
Yl9jbWQyICptb2RlX2NtZCkNCj4+PiArew0KPj4+ICvCoMKgwqAgaWYgKCFkcm1fYW55X3Bs
YW5lX2hhc19mb3JtYXQoZGV2LCBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LA0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kZV9jbWQtPm1vZGlm
aWVyWzBdKSkgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBkcm1fZGJnX2ttcyhkZXYsICJVbnN1
cHBvcnRlZCBwaXhlbCBmb3JtYXQgJXA0Y2MgLyBtb2RpZmllciANCj4+PiAweCVsbHhcbiIs
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmbW9kZV9jbWQtPnBpeGVs
X2Zvcm1hdCwgbW9kZV9jbWQtPm1vZGlmaWVyWzBdKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+Pj4gK8KgwqDCoCB9DQo+Pj4gKw0KPj4+IMKg
wqDCoMKgcmV0dXJuIGRybV9nZW1fZmJfY3JlYXRlKGRldiwgZmlsZV9wcml2LCBtb2RlX2Nt
ZCk7DQo+Pj4gwqAgfQ0KPj4+DQo+Pj4gQEAgLTEwMzMsNyArMTA1NCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIA0KPj4+IHZjNF9tb2RlX2Z1bmNz
ID0gew0KPj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNz
IHZjNV9tb2RlX2Z1bmNzID0gew0KPj4+IMKgwqDCoMKgLmF0b21pY19jaGVjayA9IHZjNF9h
dG9taWNfY2hlY2ssDQo+Pj4gwqDCoMKgwqAuYXRvbWljX2NvbW1pdCA9IGRybV9hdG9taWNf
aGVscGVyX2NvbW1pdCwNCj4+PiAtwqDCoMKgIC5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2Ny
ZWF0ZSwNCj4+PiArwqDCoMKgIC5mYl9jcmVhdGUgPSB2YzVfZmJfY3JlYXRlLA0KPj4+IMKg
IH07DQo+Pj4NCj4+PiDCoCBpbnQgdmM0X2ttc19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpDQo+Pj4gLS0gDQo+Pj4gMi4zOC4xDQo+Pj4NCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------mrcp4w2XKQ5okkNGjoAB6GhO--

--------------5QZbTnb0M024P6dO3DmnCYtT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOy9pMFAwAAAAAACgkQlh/E3EQov+AY
yQ/9EK37uPJM9/Ga1Vst2HskamjefzecPj85/SiVpgC3BoaKo6eonQ85/ltWybrKigy0BX8R0eHx
sJgW9kVCaHftz8E3rRmmu8fXNWdfiYECkkBaJzxq2FjX4OJeEhWnJ/vA0BdPl30u+uZjVw+LV37q
yk+T+agAlJwGH1RHpEBSAyJfrFzLkDFkvk1HJYTBfzveDYgXdB9xQjyoph4km7BQXx7d1NFDInox
5OHWISnEosAulxzbl3THPbMxpRAogxH04vehbak/HNeNGMBx0ffoOohVqBtaP/A52SqIQwtey4Pw
MtK04qjAJiUbSp/B7YOP9lUnHzMRF7Qe33HQ75M3tRAwa9Th2Z0KYk0nqTWx1a7y1A9+ftdb08VS
fR9JnZGfEBzLCfMItSSOSM/eVaPcjFZQeqqDhPkpbkTK/cfCLbQe/NEfFjo/ySS+lR+2y75/x3SZ
SMRVBWAibTirWKGuxwLH2yBdhFCFzBW2p1xGQXilANyFbembtRlr8IWdqT1xh/ddtGKMRiIHZTdk
dIpUh3darFs6pvykiX1xH8F4ejvO+giL955tO2Gf6xJIHViKtb8LIkhsfpNrUl1wDtFYzFjJLc7t
mnpiXICZem6bdjPu+lAKqads1Ehif8qzuKYrM9w8r0m2QjdD6ZPMOoODAbxDBGmmJq+Qd18Sv9zg
NlM=
=yQPO
-----END PGP SIGNATURE-----

--------------5QZbTnb0M024P6dO3DmnCYtT--
