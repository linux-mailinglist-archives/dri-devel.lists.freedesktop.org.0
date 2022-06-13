Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F05484C8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4010E47C;
	Mon, 13 Jun 2022 11:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3010E480
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:23:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA81821D94;
 Mon, 13 Jun 2022 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655119434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+Sz8WPXn+aR+nvr7LE5koDfg5PYHXmH4uKvBVfIrT4=;
 b=PmrixLFs7i3xTFuJkDd/oA1ZVFj26dFCD2SzTYfaqwlRwdYKeMfG4N2qduq+ir/V39k+E9
 7F/1aYAYX/lLp0nIOOSEWnnXP8KIUxFHk2vqcNWYp3Eg7KfJBKEXWqn+htbNGVHledxkNY
 EsAlSlK2PwW+IlTLoQvQGh1KAPJRteE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655119434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+Sz8WPXn+aR+nvr7LE5koDfg5PYHXmH4uKvBVfIrT4=;
 b=EcsyM+1FfIBK4fYlbj6XMzX9rdbo/62qMdspGhZjHClVqX0xTeiogCy1xE684L/E/ldmlu
 xRErSmLkHB5O2yAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87953134CF;
 Mon, 13 Jun 2022 11:23:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cR0dIEoep2LtdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Jun 2022 11:23:54 +0000
Message-ID: <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
Date: Mon, 13 Jun 2022 13:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-3-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZWjJvYnv2J0uvQyc4v004goz"
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
--------------ZWjJvYnv2J0uvQyc4v004goz
Content-Type: multipart/mixed; boundary="------------W2Hs5TU5FaMcBrQiG0E4wcfY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-3-maxime@cerno.tech>

--------------W2Hs5TU5FaMcBrQiG0E4wcfY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDEwLjA2LjIyIHVtIDExOjI4IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gVGhlIERSTS1tYW5hZ2VkIGZ1bmN0aW9uIHRvIHJlZ2lzdGVyIGEgQ1JUQyBpcw0K
PiBkcm1tX2NydGNfYWxsb2Nfd2l0aF9wbGFuZXMoKSwgd2hpY2ggd2lsbCBhbGxvY2F0ZSB0
aGUgdW5kZXJseWluZw0KPiBzdHJ1Y3R1cmUgYW5kIGluaXRpYWxpc2F0aW9uIHRoZSBDUlRD
Lg0KPiANCj4gSG93ZXZlciwgd2UgbWlnaHQgd2FudCB0byBzZXBhcmF0ZSB0aGUgc3RydWN0
dXJlIGNyZWF0aW9uIGFuZCB0aGUgQ1JUQw0KPiBpbml0aWFsaXNhdGlvbiwgZm9yIGV4YW1w
bGUgaWYgdGhlIHN0cnVjdHVyZSBpcyBzaGFyZWQgYWNyb3NzIG11bHRpcGxlDQo+IERSTSBl
bnRpdGllcywgZm9yIGV4YW1wbGUgYW4gZW5jb2RlciBhbmQgYSBjb25uZWN0b3IuDQo+IA0K
PiBMZXQncyBjcmVhdGUgYW4gaGVscGVyIHRvIG9ubHkgaW5pdGlhbGlzZSBhIENSVEMgdGhh
dCB3b3VsZCBiZSBwYXNzZWQgYXMNCj4gYW4gYXJndW1lbnQuDQoNCkJlZm9yZSBJIHJldmll
dyBhbGwgb2YgdGhlcyBwYXRjaGVzLCBvbmUgcXVlc3Rpb24uIGl0J3MgeWV0IG5vdCBjbGVh
ciB0byANCm1lIHdoeSBkcm1fY3J0Y19pbml0X3dpdGhfcGxhbmVzKCkgd291bGRuJ3Qgd29y
ay4gKEkga25vdyB3ZSBkaXNjdXNzZWQgDQp0aGlzIG9uIElSQy4pDQoNCklmIHlvdSdyZSBj
YWxsaW5nIGRybW1fbW9kZV9jb25maWdfaW5pdCgpLCBpdCB3aWxsIGNsZWFuIHVwIGFsbCB0
aGUgDQpDUlRDLCBlbmNvZGVyIGNvbm5lY3RvciwgZXRjLiBkYXRhIHN0cnVjdHVyZXMgZm9y
IHlvdS4gRm9yIENSVEMgDQppbnN0YW5jZXMgaW4ga21hbGxvY2VkIG1lbW9yeSwgd291bGRu
J3QgaXQgYmUgc2ltcGxlciB0byBwdXQgdGhlIA0KY29ycmVzcG9uZGluZyBrZnJlZSBpbnRv
IHZjNF9jcnRjX2Rlc3Ryb3koKT8NCg0KSXQgc2VlbXMgb25seSB1c2VmdWwgaWYgeW91IG5l
ZWQgaXQgc3RyaWN0bHkgb3JkZXJlZCB3aXRoIGRybW1fa3phbGxvYygpPw0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWVAY2Vybm8udGVjaD4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jcnRj
LmMgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9jcnRjLmggICAgIHwgIDYgKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgNzMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0
Yy5jDQo+IGluZGV4IDI2YTc3YTczNTkwNS4uZmQ5ODZhN2RkNGFkIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NydGMuYw0KPiBAQCAtMzQxLDkgKzM0MSwxMCBAQCBzdGF0aWMgaW50IF9fZHJtX2Ny
dGNfaW5pdF93aXRoX3BsYW5lcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJt
X2NydGMgKg0KPiAgICAqIFRoZSBAcHJpbWFyeSBhbmQgQGN1cnNvciBwbGFuZXMgYXJlIG9u
bHkgcmVsZXZhbnQgZm9yIGxlZ2FjeSB1QVBJLCBzZWUNCj4gICAgKiAmZHJtX2NydGMucHJp
bWFyeSBhbmQgJmRybV9jcnRjLmN1cnNvci4NCj4gICAgKg0KPiAtICogTm90ZTogY29uc2lk
ZXIgdXNpbmcgZHJtbV9jcnRjX2FsbG9jX3dpdGhfcGxhbmVzKCkgaW5zdGVhZCBvZg0KPiAt
ICogZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcygpIHRvIGxldCB0aGUgRFJNIG1hbmFnZWQg
cmVzb3VyY2UgaW5mcmFzdHJ1Y3R1cmUNCj4gLSAqIHRha2UgY2FyZSBvZiBjbGVhbnVwIGFu
ZCBkZWFsbG9jYXRpb24uDQo+ICsgKiBOb3RlOiBjb25zaWRlciB1c2luZyBkcm1tX2NydGNf
YWxsb2Nfd2l0aF9wbGFuZXMoKSBvcg0KPiArICogZHJtbV9jcnRjX2luaXRfd2l0aF9wbGFu
ZXMoKSBpbnN0ZWFkIG9mIGRybV9jcnRjX2luaXRfd2l0aF9wbGFuZXMoKQ0KPiArICogdG8g
bGV0IHRoZSBEUk0gbWFuYWdlZCByZXNvdXJjZSBpbmZyYXN0cnVjdHVyZSB0YWtlIGNhcmUg
b2YgY2xlYW51cA0KPiArICogYW5kIGRlYWxsb2NhdGlvbi4NCj4gICAgKg0KPiAgICAqIFJl
dHVybnM6DQo+ICAgICogWmVybyBvbiBzdWNjZXNzLCBlcnJvciBjb2RlIG9uIGZhaWx1cmUu
DQo+IEBAIC0zNjgsNiArMzY5LDY5IEBAIGludCBkcm1fY3J0Y19pbml0X3dpdGhfcGxhbmVz
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gICB9
DQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fY3J0Y19pbml0X3dpdGhfcGxhbmVzKTsNCj4gICAN
Cj4gK3N0YXRpYyB2b2lkIGRybW1fY3J0Y19pbml0X3dpdGhfcGxhbmVzX2NsZWFudXAoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gKwkJCQkJICAgICAgIHZvaWQgKnB0cikNCj4gK3sN
Cj4gKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBwdHI7DQo+ICsNCj4gKwlkcm1fY3J0Y19j
bGVhbnVwKGNydGMpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGRybW1fY3J0Y19pbml0
X3dpdGhfcGxhbmVzIC0gSW5pdGlhbGlzZSBhIG5ldyBDUlRDIG9iamVjdCB3aXRoDQo+ICsg
KiAgICBzcGVjaWZpZWQgcHJpbWFyeSBhbmQgY3Vyc29yIHBsYW5lcy4NCj4gKyAqIEBkZXY6
IERSTSBkZXZpY2UNCj4gKyAqIEBjcnRjOiBDUlRDIG9iamVjdCB0byBpbml0DQo+ICsgKiBA
cHJpbWFyeTogUHJpbWFyeSBwbGFuZSBmb3IgQ1JUQw0KPiArICogQGN1cnNvcjogQ3Vyc29y
IHBsYW5lIGZvciBDUlRDDQo+ICsgKiBAZnVuY3M6IGNhbGxiYWNrcyBmb3IgdGhlIG5ldyBD
UlRDDQo+ICsgKiBAbmFtZTogcHJpbnRmIHN0eWxlIGZvcm1hdCBzdHJpbmcgZm9yIHRoZSBD
UlRDIG5hbWUsIG9yIE5VTEwgZm9yIGRlZmF1bHQgbmFtZQ0KPiArICoNCj4gKyAqIEluaXRz
IGEgbmV3IG9iamVjdCBjcmVhdGVkIGFzIGJhc2UgcGFydCBvZiBhIGRyaXZlciBjcnRjIG9i
amVjdC4gRHJpdmVycw0KPiArICogc2hvdWxkIHVzZSB0aGlzIGZ1bmN0aW9uIGluc3RlYWQg
b2YgZHJtX2NydGNfaW5pdCgpLCB3aGljaCBpcyBvbmx5IHByb3ZpZGVkDQo+ICsgKiBmb3Ig
YmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aCBkcml2ZXJzIHdoaWNoIGRvIG5vdCB5ZXQg
c3VwcG9ydCB1bml2ZXJzYWwNCj4gKyAqIHBsYW5lcykuIEZvciByZWFsbHkgc2ltcGxlIGhh
cmR3YXJlIHdoaWNoIGhhcyBvbmx5IDEgcGxhbmUgbG9vayBhdA0KPiArICogZHJtX3NpbXBs
ZV9kaXNwbGF5X3BpcGVfaW5pdCgpIGluc3RlYWQuDQo+ICsgKg0KPiArICogQ2xlYW51cCBp
cyBhdXRvbWF0aWNhbGx5IGhhbmRsZWQgdGhyb3VnaCByZWdpc3RlcmluZw0KPiArICogZHJt
bV9jcnRjX2NsZWFudXAoKSB3aXRoIGRybW1fYWRkX2FjdGlvbigpLiBUaGUgY3J0YyBzdHJ1
Y3R1cmUgc2hvdWxkDQo+ICsgKiBiZSBhbGxvY2F0ZWQgd2l0aCBkcm1tX2t6YWxsb2MoKS4N
Cj4gKyAqDQo+ICsgKiBUaGUgQGRybV9jcnRjX2Z1bmNzLmRlc3Ryb3kgaG9vayBtdXN0IGJl
IE5VTEwuDQo+ICsgKg0KPiArICogVGhlIEBwcmltYXJ5IGFuZCBAY3Vyc29yIHBsYW5lcyBh
cmUgb25seSByZWxldmFudCBmb3IgbGVnYWN5IHVBUEksIHNlZQ0KPiArICogJmRybV9jcnRj
LnByaW1hcnkgYW5kICZkcm1fY3J0Yy5jdXJzb3IuDQo+ICsgKg0KPiArICogUmV0dXJuczoN
Cj4gKyAqIFplcm8gb24gc3VjY2VzcywgZXJyb3IgY29kZSBvbiBmYWlsdXJlLg0KPiArICov
DQo+ICtpbnQgZHJtbV9jcnRjX2luaXRfd2l0aF9wbGFuZXMoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiArCQkJICAgICAgIHN0cnVjdCBkcm1f
cGxhbmUgKnByaW1hcnksDQo+ICsJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZSAqY3Vyc29y
LA0KPiArCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyAqZnVuY3MsDQo+
ICsJCQkgICAgICAgY29uc3QgY2hhciAqbmFtZSwgLi4uKQ0KPiArew0KPiArCXZhX2xpc3Qg
YXA7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCVdBUk5fT04oZnVuY3MgJiYgZnVuY3MtPmRl
c3Ryb3kpOw0KPiArDQo+ICsJdmFfc3RhcnQoYXAsIG5hbWUpOw0KPiArCXJldCA9IF9fZHJt
X2NydGNfaW5pdF93aXRoX3BsYW5lcyhkZXYsIGNydGMsIHByaW1hcnksIGN1cnNvciwgZnVu
Y3MsDQo+ICsJCQkJCSAgbmFtZSwgYXApOw0KPiArCXZhX2VuZChhcCk7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IGRybW1fYWRkX2FjdGlvbl9v
cl9yZXNldChkZXYsIGRybW1fY3J0Y19pbml0X3dpdGhfcGxhbmVzX2NsZWFudXAsDQo+ICsJ
CQkJICAgICAgIGNydGMpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsN
Cj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woZHJtbV9jcnRjX2luaXRf
d2l0aF9wbGFuZXMpOw0KPiArDQo+ICAgc3RhdGljIHZvaWQgZHJtbV9jcnRjX2FsbG9jX3dp
dGhfcGxhbmVzX2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJCQkJCQl2
b2lkICpwdHIpDQo+ICAgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NydGMu
aCBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4gaW5kZXggYTcwYmFlYTA2MzZjLi4yYmFi
ZDVjZmZiZjMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaA0KPiBAQCAtMTIyOSw2ICsxMjI5LDEyIEBAIGlu
dCBkcm1fY3J0Y19pbml0X3dpdGhfcGxhbmVzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+
ICAgCQkJICAgICAgc3RydWN0IGRybV9wbGFuZSAqY3Vyc29yLA0KPiAgIAkJCSAgICAgIGNv
bnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyAqZnVuY3MsDQo+ICAgCQkJICAgICAgY29uc3Qg
Y2hhciAqbmFtZSwgLi4uKTsNCj4gK2ludCBkcm1tX2NydGNfaW5pdF93aXRoX3BsYW5lcyhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiArCQkJICAgICAgIHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywNCj4gKwkJCSAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwcmltYXJ5LA0KPiArCQkJ
ICAgICAgIHN0cnVjdCBkcm1fcGxhbmUgKmN1cnNvciwNCj4gKwkJCSAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2NydGNfZnVuY3MgKmZ1bmNzLA0KPiArCQkJICAgICAgIGNvbnN0IGNoYXIg
Km5hbWUsIC4uLik7DQo+ICAgdm9pZCBkcm1fY3J0Y19jbGVhbnVwKHN0cnVjdCBkcm1fY3J0
YyAqY3J0Yyk7DQo+ICAgDQo+ICAgX19wcmludGYoNywgOCkNCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------W2Hs5TU5FaMcBrQiG0E4wcfY--

--------------ZWjJvYnv2J0uvQyc4v004goz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKnHkoFAwAAAAAACgkQlh/E3EQov+AF
aA//Rtdrn0YsYYMJ2LyPQ81Lvt3lBv1DhKlwRf8DJnsXJe3pufyNceqs9g0kjn4wph1ApyLkaAi+
o7EBVq0Qg6KzPzx64yT3hW3A84QeAtAibiQPKpwg7cecW4EFLNWbRt6S9I+VBlcfc90Y1kqGVQke
k1CqpBjYcUG56s7VfrRR72hk4vmqK/z5C/IEkOEWSJw/Av/QH0azPcNvjOk3VEjjWFuP4KvJfKik
4oXJj4qxh8xxqgeJ+hN2SFAipNX4XJ/+uqSUKn6ljdru03t4gzgcBz7qJyjYKVn2G+cew6Wr78R/
Ciq/A6N2YrDUmi8+sJYCRzvFqW/uNlO41f2UvvNeFZXbzEfyD32n3XML9w6AGg64yvSmdBIYYB/B
7F2ff1RWAPJfhjrnFcPJBoSH3IN3bIYrpsP5mJTOO0Ho4qXa79UxjEgg8fbc7S6e9bSM1gsR5IZF
ozviuZfJWb+3VHZK9NMOsrCCoCNitFjvbnd5f10ePBSGQd7u3rMqpRfd1jeWAUDuAdfCW83+eQXK
P/826FxqE48BNUa31STMEpCOgk5lOy/Ej6I3NL0iwqWZ9IYht4AiTcLMDbdur54LFy49fUcYbRdx
vopH5+vUDZvPk62S8hMa9jw1fEjf1bORMGjLsaPJvVmuSjlsmFzgEGDdpxF2lhpBpucN69XDTEv6
tW4=
=qRdr
-----END PGP SIGNATURE-----

--------------ZWjJvYnv2J0uvQyc4v004goz--
