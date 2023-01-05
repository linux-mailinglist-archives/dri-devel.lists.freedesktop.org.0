Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C665F058
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AABB10E751;
	Thu,  5 Jan 2023 15:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA0910E0E0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:43:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0529201DE;
 Thu,  5 Jan 2023 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672933425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gtz6+BNiEL10rr71+nU4C/bMc2jwjeYughLqYCCz0WQ=;
 b=wVZA0BgeDDimEJj+IHLo7BK4FZLmbloPurPCwUhfG+ImFvSEagdMnIND+XL9Hbi2MM109b
 ETlPAxlbuUyu00vR09cRD12LeL4MV16xamGJTtzGn3q/eoSk9QeQCgKEqSRqnhQmmsNw4+
 F+eUQj4l3xlF6ktdU45sBJrqacK7XLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672933425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gtz6+BNiEL10rr71+nU4C/bMc2jwjeYughLqYCCz0WQ=;
 b=0Lc7J1Nt6c8xtnEvrpXlkiFZE4vOxh0nKNUsU7gmVtId8axr2BiN/EzbjX2lVtBiJdz9RP
 Gx/3p8eTwVOOyzDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D378013338;
 Thu,  5 Jan 2023 15:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sCsyMjHwtmPmMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jan 2023 15:43:45 +0000
Message-ID: <87a69797-9d8e-fdf3-19fb-34d85311bdb5@suse.de>
Date: Thu, 5 Jan 2023 16:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/gem: Check for valid formats
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
 <Y7brvC7lvhtQCeU/@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y7brvC7lvhtQCeU/@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B7cX1FAcvaProWGhwLyqzHyF"
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
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B7cX1FAcvaProWGhwLyqzHyF
Content-Type: multipart/mixed; boundary="------------8FaKHBK3pl1cewY3T0H0Byut";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <87a69797-9d8e-fdf3-19fb-34d85311bdb5@suse.de>
Subject: Re: [PATCH] drm/gem: Check for valid formats
References: <20230103125322.855089-1-mcanal@igalia.com>
 <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
 <Y7brvC7lvhtQCeU/@phenom.ffwll.local>
In-Reply-To: <Y7brvC7lvhtQCeU/@phenom.ffwll.local>

--------------8FaKHBK3pl1cewY3T0H0Byut
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDEuMjMgdW0gMTY6MjQgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUdWUsIEphbiAwMywgMjAyMyBhdCAwMjoxNjozMFBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IHRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cCBw
YXRjaC4NCj4+DQo+PiBBbSAwMy4wMS4yMyB1bSAxMzo1MyBzY2hyaWViIE1hw61yYSBDYW5h
bDoNCj4+PiBDdXJyZW50bHksIGRybV9nZW1fZmJfY3JlYXRlKCkgZG9lc24ndCBjaGVjayBp
ZiB0aGUgcGl4ZWwgZm9ybWF0IGlzDQo+Pj4gc3VwcG9ydGVkLCB3aGljaCBjYW4gbGVhZCB0
byB0aGUgYWNjZXB0YW5jZSBvZiBpbnZhbGlkIHBpeGVsIGZvcm1hdHMNCj4+PiBlLmcuIHRo
ZSBhY2NlcHRhbmNlIG9mIGludmFsaWQgbW9kaWZpZXJzLiBUaGVyZWZvcmUsIGFkZCBhIGNo
ZWNrIGZvcg0KPj4+IHZhbGlkIGZvcm1hdHMgb24gZHJtX2dlbV9mYl9jcmVhdGUoKS4NCj4+
Pg0KPj4+IE1vcmVvdmVyLCBub3RlIHRoYXQgdGhpcyBjaGVjayBpcyBvbmx5IHZhbGlkIGZv
ciBhdG9taWMgZHJpdmVycywNCj4+PiBiZWNhdXNlLCBmb3Igbm9uLWF0b21pYyBkcml2ZXJz
LCBjaGVja2luZyBkcm1fYW55X3BsYW5lX2hhc19mb3JtYXQoKSBpcw0KPj4+IG5vdCBwb3Nz
aWJsZSBzaW5jZSB0aGUgZm9ybWF0IGxpc3QgZm9yIHRoZSBwcmltYXJ5IHBsYW5lIGlzIGZh
a2UsIGFuZA0KPj4+IHdlJ2QgdGhlcmVmb3IgcmVqZWN0IHZhbGlkIGZvcm1hdHMuDQo+Pj4N
Cj4+PiBTdWdnZXN0ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5j
b20+DQo+Pj4gLS0tDQo+Pj4gICAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAg
ICAgICAgICAgICAgfCA3ICsrLS0tLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYyB8IDkgKysrKysrKysrDQo+Pj4gICAgMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QNCj4+PiBpbmRleCAxZjhhNWViZTE4OGUuLjY4YmRhZmEwMjg0ZiAxMDA2
NDQNCj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0DQo+Pj4gQEAgLTI3NiwxMSArMjc2LDggQEAgVmFy
aW91cyBob2xkLXVwczoNCj4+PiAgICAtIE5lZWQgdG8gc3dpdGNoIHRvIGRybV9mYmRldl9n
ZW5lcmljX3NldHVwKCksIG90aGVyd2lzZSBhIGxvdCBvZiB0aGUgY3VzdG9tIGZiDQo+Pj4g
ICAgICBzZXR1cCBjb2RlIGNhbid0IGJlIGRlbGV0ZWQuDQo+Pj4gLS0gTWFueSBkcml2ZXJz
IHdyYXAgZHJtX2dlbV9mYl9jcmVhdGUoKSBvbmx5IHRvIGNoZWNrIGZvciB2YWxpZCBmb3Jt
YXRzLiBGb3INCj4+PiAtICBhdG9taWMgZHJpdmVycyB3ZSBjb3VsZCBjaGVjayBmb3IgdmFs
aWQgZm9ybWF0cyBieSBjYWxsaW5nDQo+Pj4gLSAgZHJtX3BsYW5lX2NoZWNrX3BpeGVsX2Zv
cm1hdCgpIGFnYWluc3QgYWxsIHBsYW5lcywgYW5kIHBhc3MgaWYgYW55IHBsYW5lDQo+Pj4g
LSAgc3VwcG9ydHMgdGhlIGZvcm1hdC4gRm9yIG5vbi1hdG9taWMgdGhhdCdzIG5vdCBwb3Nz
aWJsZSBzaW5jZSBsaWtlIHRoZSBmb3JtYXQNCj4+PiAtICBsaXN0IGZvciB0aGUgcHJpbWFy
eSBwbGFuZSBpcyBmYWtlIGFuZCB3ZSdkIHRoZXJlZm9yIHJlamVjdCB2YWxpZCBmb3JtYXRz
Lg0KPj4+ICstIE5lZWQgdG8gc3dpdGNoIHRvIGRybV9nZW1fZmJfY3JlYXRlKCksIGFzIG5v
dyBkcm1fZ2VtX2ZiX2NyZWF0ZSgpIGNoZWNrcyBmb3INCj4+PiArICB2YWxpZCBmb3JtYXRz
IGZvciBhdG9taWMgZHJpdmVycy4NCj4+PiAgICAtIE1hbnkgZHJpdmVycyBzdWJjbGFzcyBk
cm1fZnJhbWVidWZmZXIsIHdlJ2QgbmVlZCBhIGVtYmVkZGluZyBjb21wYXRpYmxlDQo+Pj4g
ICAgICB2ZXJzaW9uIG9mIHRoZSB2YXJpb3MgZHJtX2dlbV9mYl9jcmVhdGUgZnVuY3Rpb25z
LiBNYXliZSBjYWxsZWQNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fZnJhbWVidWZmZXJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFt
ZWJ1ZmZlcl9oZWxwZXIuYw0KPj4+IGluZGV4IGU5MzUzM2I4NjAzNy4uYjhhNjE1YTEzOGNk
IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVy
X2hlbHBlci5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZm
ZXJfaGVscGVyLmMNCj4+PiBAQCAtOSw2ICs5LDcgQEANCj4+PiAgICAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGRybS9kcm1fZGFtYWdlX2hlbHBlci5o
Pg0KPj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4+PiAgICAjaW5jbHVkZSA8ZHJt
L2RybV9mb3VyY2MuaD4NCj4+PiAgICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5o
Pg0KPj4+ICAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPg0KPj4+IEBAIC0xNjQsNiArMTY1
LDE0IEBAIGludCBkcm1fZ2VtX2ZiX2luaXRfd2l0aF9mdW5jcyhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LA0KPj4+ICAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4gICAgCX0NCj4+PiArCWlm
IChkcm1fZHJ2X3VzZXNfYXRvbWljX21vZGVzZXQoZGV2KSAmJg0KPj4+ICsJICAgICFkcm1f
YW55X3BsYW5lX2hhc19mb3JtYXQoZGV2LCBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LA0KPj4+
ICsJCQkJICAgICAgbW9kZV9jbWQtPm1vZGlmaWVyWzBdKSkgew0KPj4NCj4+IEJlY2F1c2Ug
dGhpcyBpcyBhIGdlbmVyaWMgaGVscGVyLCBpdCBoYXMgdG8gaGFuZGxlIHRoZSBvZGQgY2Fz
ZXMgYXMgd2VsbC4NCj4+IEhlcmUgd2UgY2Fubm90IGFzc3VtZSBtb2RpZmllclswXSwgYmVj
YXVzZSB0aGVyZSdzIGEgbW9kaWZpZXIgZm9yIGVhY2ggcGl4ZWwNCj4+IHBsYW5lIGluIG11
bHRpLXBsYW5lIGZvcm1hdHMuIChUaGF0J3MgYSBkaWZmZXJlbnQgdHlwZSBvZiBwbGFuZSB0
aGFuIHRoZQ0KPj4gc3RydWN0IHBsYW5lIHdlJ3JlIHBhc3NpbmcgaW4uKSBJZiBvbmUgY29t
YmluYXRpb24gaXNuJ3Qgc3VwcG9ydGVkLCB0aGUNCj4+IGhlbHBlciBzaG91bGQgZmFpbC4N
Cj4gDQo+IFRoaXMgd2FzIGEgbWlzdGFrZSBpbiB0aGUgYWRkZmIyIGRlc2lnbiwgd2UgbGF0
ZXIgcmVjdGlmaWVkIHRoYXQgYWxsDQo+IG1vZGlmaWVycyBtdXN0IG1hdGNoLiBUaGlzIGlz
IGJlY2F1c2UgdGhlIG1vZGlmaWVyIGl0c2VsIGNhbiBjaGFuZ2UgdGhlDQo+IG51bWJlciBv
ZiBwbGFuZXMgKGZvciBhdXggY29tcHJlc3Npb24gcGxhbmVzIGFuZCBzdHVmZiBsaWtlIHRo
YXQpLg0KPiANCj4gVGhlIGZ1bGwgZHJtIGZvcm1hdCBkZXNjcmlwdGlvbiBpcyB0aGUgKGRy
bV9mb3VyY2MsIGRybV9mb3JtYXRfbW9kaWZpZXIpDQo+IHBhaXIuDQoNCkRvZXMgdGhpcyBt
ZWFuIHRoYXQgb25seSBtb2RpZmllclswXSB3aWxsIGV2ZXIgY29udGFpbiBhIHZhbGlkIHZh
bHVlLCBPUiANCnRoYXQgYWxsIG1vZGlmaWVyc1tpXSBoYXZlIHRvIGNvbnRhaW4gdGhlIHNh
bWUgdmFsdWU/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoaXMgc2hvdWxk
IGJlIGRvY3VtZW50ZWQgc29tZXdoZXJlIGFscmVhZHksIGlmIG5vdCwgZ29vZCBpZGVhIHRv
IHVwZGF0ZQ0KPiBhZGRmYiBkb2NzIChvciBtYWtlIHRoZW0gaGFwcGVuIGluIHRoZSBmaXJz
dCBwbGFjZSkuDQo+IC1EYW5pZWwNCj4gDQo+Pg0KPj4gV2UgZ2V0IHRoZSBudW1iZXIgb2Yg
cGl4ZWwgcGxhbmVzIGZyb20gdGhlIGZvcm1hdCBpbmZvLiBTbyB0aGUgY29ycmVjdA0KPj4g
aW1wbGVtZW50YXRpb24gaXMgc29tZXRoaW5nIGxpa2UgdGhhdA0KPj4NCj4+IGlmIChkcm1f
ZHJ2X3VzZXNfYXRvbWljX21vZGVzZXQoKSkpIHsNCj4+IAlmb3IgKGkgPSAwOyBpIDwgaW5m
by0+bnVtX3BsYW5lczsgKytpKSB7DQo+PiAgICAgICAgICAJaWYgKCFkcm1fYW55X3BsYW5l
X2hhc19mb3JtYXQoZGV2LCBwaXhlbF9mb3JtYXQsIFwNCj4+IAkJCQltb2RpZmllcltpXSkg
ew0KPj4gCQkJZHJtX2RiZ19rbXMoZGV2LCAiZXJyb3IgbXNnIik7DQo+PiAJCQlyZXR1cm4g
LUVJTlZBTDsNCj4+IAkJfQ0KPj4gICAgICAgICAgfQ0KPj4gfQ0KPj4NCj4+DQo+Pj4gKwkJ
ZHJtX2RiZyhkZXYsICJVbnN1cHBvcnRlZCBwaXhlbCBmb3JtYXQgJXA0Y2MgLyBtb2RpZmll
ciAweCVsbHhcbiIsDQo+Pg0KPj4gZHJtX2RiZygpIGlzIGZvciBkcml2ZXJzLiBVc2UgZHJt
X2RiZ19rbXMoKSBwbGVhc2UuDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+
DQo+Pg0KPj4+ICsJCQkmbW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCwgbW9kZV9jbWQtPm1vZGlm
aWVyWzBdKTsNCj4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4+PiArCX0NCj4+PiArDQo+Pj4g
ICAgCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1fcGxhbmVzOyBpKyspIHsNCj4+PiAgICAJ
CXVuc2lnbmVkIGludCB3aWR0aCA9IG1vZGVfY21kLT53aWR0aCAvIChpID8gaW5mby0+aHN1
YiA6IDEpOw0KPj4+ICAgIAkJdW5zaWduZWQgaW50IGhlaWdodCA9IG1vZGVfY21kLT5oZWln
aHQgLyAoaSA/IGluZm8tPnZzdWIgOiAxKTsNCj4+DQo+PiAtLSANCj4+IFRob21hcyBaaW1t
ZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------8FaKHBK3pl1cewY3T0H0Byut--

--------------B7cX1FAcvaProWGhwLyqzHyF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO28DEFAwAAAAAACgkQlh/E3EQov+B+
6A/9EZFb1/ilsEShhtCxAH/Eb13iDKG2cb+mhot1I7KPyuCc5t1D0nNx10RLu3QOj2hWrjQX/0TN
P0tr5DWP7TtPkLVMHMbL66fYQcQZ08O5ypA3te/ubF1gG5wxzjtJYt1LzK9pvXO821uh/D2zLGSa
BdbrF0yZ2ikEHwQPMNE3WYjOKBbFyXL1wiGAcPlHz0/HzS3XOhMNhbpOZAnYyV+H0ZfWq91wE+iK
f3XZiwo8XEEfEX3vfx3rggm1AQntM31dPR3feTrhmNNuHUvQI6wVkYm4v0IuOh6uL60S5IyObctr
4GVWQqsGKQg8MmlFBQbGG4QjC+7rsARv9P6l6+PW1loVfUTCBAd1LkEZjHWOtI985Eu3RfIrxWEx
mRBtE9qkJsWLl/AiyTRUPs3yEvL/XYTJsRCwqAF/GY4MbemiwdSeHOZG3ashlq9G73zLuHN7G3wU
KHBOZPn/+H8Mj1QrdwcUngL5f6/yplwkEIVTgN0F7MOdWRHsFmBXU9N96y3DzOP7Xw2mGXLhJzpb
fgV1nYZKbwYnxwqpgJf6olAh3e/kCSc+0XcujnPIdUX3anzN1s8uj0mdslICKFTZ2DFLDKTzHWce
xAx/+Mq3eJkHeLGz9HswzwPsVywCXnanIcXexqH4Tkxk4KwUUbCwj2JSwArpmeF2wCjWZddA21V4
a3o=
=Emfu
-----END PGP SIGNATURE-----

--------------B7cX1FAcvaProWGhwLyqzHyF--
