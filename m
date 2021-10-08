Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837374266F8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BAB6E0C8;
	Fri,  8 Oct 2021 09:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07F6E0C8;
 Fri,  8 Oct 2021 09:35:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0044420112;
 Fri,  8 Oct 2021 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633685734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oR5ZxFmRD6TdYNhetQCFxwhDU/NrhGPObfyDYCH99ok=;
 b=HzdaY/l/Ho565nYt2djCTKAa7hTTPywU6Ll8t6QXh2jnAQiVK4kS+qWVaFWiCvCrqIAlmz
 jazAQ9UJnmcus7m15lxrL2I1tCbzgi9/AmLNu/4HNcB4vOSVJYvpaAb3UnFXc15QRH1vLA
 EljxHIo4W5ZX9G24kQR05mb6DReldBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633685734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oR5ZxFmRD6TdYNhetQCFxwhDU/NrhGPObfyDYCH99ok=;
 b=fYjrpVsWZZoOwsHwoguVQ2/H97P34vaDVD/u+4MAte468lwg1s25HiP+Rg0khWhf96D/2v
 Gqr+JDW5qDE5YmDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB3E513EA2;
 Fri,  8 Oct 2021 09:35:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K5ywMOUQYGGHBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Oct 2021 09:35:33 +0000
Message-ID: <378933da-c49a-dc0d-a28f-c9c1ed502a49@suse.de>
Date: Fri, 8 Oct 2021 11:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/5] dri: cleanup debugfs error handling
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k6YfyDe6B5eIPTxY9GNfpIWH"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k6YfyDe6B5eIPTxY9GNfpIWH
Content-Type: multipart/mixed; boundary="------------SkMpxEjqp5zDCd6hpQNHmy5s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <378933da-c49a-dc0d-a28f-c9c1ed502a49@suse.de>
Subject: Re: [PATCH 1/5] dri: cleanup debugfs error handling
References: <20211008091704.27094-1-nirmoy.das@amd.com>
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>

--------------SkMpxEjqp5zDCd6hpQNHmy5s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTAuMjEgdW0gMTE6MTcgc2NocmllYiBOaXJtb3kgRGFzOg0KPiBEZWJ1
Z2ZzIEFQSSByZXR1cm5zIGVuY29kZWQgZXJyb3IgaW5zdGVhZCBvZiBOVUxMLg0KPiBUaGlz
IHBhdGNoIGNsZWFudXBzIGRybSBkZWJ1Z2ZzIGVycm9yIGhhbmRsaW5nIHRvDQo+IHByb3Bl
cmx5IHNldCBkcmkgYW5kIGl0cyBtaW5vcidzIHJvb3QgZGVudHJ5IHRvIE5VTEwuDQo+IA0K
PiBBbHNvIGRvIG5vdCBlcnJvciBvdXQgaWYgZHJpL21pbm9yIGRlYnVnZnMgZGlyZWN0b3J5
DQo+IGNyZWF0aW9uIGZhaWxzIGFzIGEgZGVidWdmcyBlcnJvciBpcyBub3QgYSBmYXRhbCBl
cnJvci4NCj4gDQo+IENDOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPg0KPiBDQzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwu
b3JnPg0KPiBDQzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+
IENDOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+IENDOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5p
cm1veS5kYXNAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzLmMgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHJ2LmMgICAgICB8IDE2ICsrKysrKysrKystLS0tLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ludGVybmFsLmggfCAgNyArKystLS0tDQo+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAzNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZGVidWdmcy5jDQo+IGluZGV4IGIwYTgyNjQ4OTQ4OC4uYWYyNzVhMGMwOWI0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYw0KPiBAQCAtMTgwLDYgKzE4MCw5IEBAIHZvaWQg
ZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpm
aWxlcywgaW50IGNvdW50LA0KPiAgIAlzdHJ1Y3QgZHJtX2luZm9fbm9kZSAqdG1wOw0KPiAg
IAlpbnQgaTsNCj4gDQo+ICsJaWYgKCFtaW5vci0+ZGVidWdmc19yb290KQ0KPiArCQlyZXR1
cm47DQo+ICsNCj4gICAJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsNCj4gICAJCXUz
MiBmZWF0dXJlcyA9IGZpbGVzW2ldLmRyaXZlcl9mZWF0dXJlczsNCj4gDQo+IEBAIC0yMDMs
NyArMjA2LDcgQEAgdm9pZCBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoY29uc3Qgc3RydWN0
IGRybV9pbmZvX2xpc3QgKmZpbGVzLCBpbnQgY291bnQsDQo+ICAgfQ0KPiAgIEVYUE9SVF9T
WU1CT0woZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKTsNCj4gDQo+IC1pbnQgZHJtX2RlYnVn
ZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5vciwgaW50IG1pbm9yX2lkLA0KPiArdm9p
ZCBkcm1fZGVidWdmc19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yLCBpbnQgbWlub3Jf
aWQsDQo+ICAgCQkgICAgIHN0cnVjdCBkZW50cnkgKnJvb3QpDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gbWlub3ItPmRldjsNCj4gQEAgLTIxMiw4ICsyMTUsMTYg
QEAgaW50IGRybV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3IsIGludCBt
aW5vcl9pZCwNCj4gICAJSU5JVF9MSVNUX0hFQUQoJm1pbm9yLT5kZWJ1Z2ZzX2xpc3QpOw0K
PiAgIAltdXRleF9pbml0KCZtaW5vci0+ZGVidWdmc19sb2NrKTsNCj4gICAJc3ByaW50Zihu
YW1lLCAiJWQiLCBtaW5vcl9pZCk7DQo+ICsNCj4gKwlpZiAoIXJvb3QpDQo+ICsJCWdvdG8g
ZXJyb3I7DQo+ICsNCj4gICAJbWlub3ItPmRlYnVnZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRl
X2RpcihuYW1lLCByb290KTsNCj4gDQo+ICsJaWYgKElTX0VSUihtaW5vci0+ZGVidWdmc19y
b290KSkNCj4gKwkJZ290byBlcnJvcjsNCj4gKw0KPiArDQo+ICAgCWRybV9kZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlcyhkcm1fZGVidWdmc19saXN0LCBEUk1fREVCVUdGU19FTlRSSUVTLA0KPiAg
IAkJCQkgbWlub3ItPmRlYnVnZnNfcm9vdCwgbWlub3IpOw0KPiANCj4gQEAgLTIzMCw3ICsy
NDEsMTEgQEAgaW50IGRybV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3Is
IGludCBtaW5vcl9pZCwNCj4gICAJaWYgKGRldi0+ZHJpdmVyLT5kZWJ1Z2ZzX2luaXQpDQo+
ICAgCQlkZXYtPmRyaXZlci0+ZGVidWdmc19pbml0KG1pbm9yKTsNCj4gDQo+IC0JcmV0dXJu
IDA7DQo+ICsJcmV0dXJuOw0KPiArDQo+ICtlcnJvcjoNCj4gKwltaW5vci0+ZGVidWdmc19y
b290ID0gTlVMTDsNCj4gKwlyZXR1cm47DQo+ICAgfQ0KPiANCj4gDQo+IEBAIC0yNDEsNiAr
MjU2LDkgQEAgaW50IGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJt
X2luZm9fbGlzdCAqZmlsZXMsIGludCBjb3VudCwNCj4gICAJc3RydWN0IGRybV9pbmZvX25v
ZGUgKnRtcDsNCj4gICAJaW50IGk7DQo+IA0KPiArCWlmICghbWlub3ItPmRlYnVnZnNfcm9v
dCkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gICAJbXV0ZXhfbG9jaygmbWlub3ItPmRlYnVn
ZnNfbG9jayk7DQo+ICAgCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7DQo+ICAgCQls
aXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBxLCAmbWlub3ItPmRlYnVnZnNfbGlzdCkgew0KPiBA
QCAtMjYxLDYgKzI3OSw5IEBAIHN0YXRpYyB2b2lkIGRybV9kZWJ1Z2ZzX3JlbW92ZV9hbGxf
ZmlsZXMoc3RydWN0IGRybV9taW5vciAqbWlub3IpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJt
X2luZm9fbm9kZSAqbm9kZSwgKnRtcDsNCj4gDQo+ICsJaWYgKCFtaW5vci0+ZGVidWdmc19y
b290KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gICAJbXV0ZXhfbG9jaygmbWlub3ItPmRlYnVn
ZnNfbG9jayk7DQo+ICAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShub2RlLCB0bXAsICZt
aW5vci0+ZGVidWdmc19saXN0LCBsaXN0KSB7DQo+ICAgCQlkZWJ1Z2ZzX3JlbW92ZShub2Rl
LT5kZW50KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+IGluZGV4IDdhNTA5NzQ2N2JhNS4uZmE1N2Vj
MmQ0OWJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4gQEAgLTE2MCwxMSArMTYwLDcgQEAg
c3RhdGljIGludCBkcm1fbWlub3JfcmVnaXN0ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dW5zaWduZWQgaW50IHR5cGUpDQo+ICAgCWlmICghbWlub3IpDQo+ICAgCQlyZXR1cm4gMDsN
Cj4gDQo+IC0JcmV0ID0gZHJtX2RlYnVnZnNfaW5pdChtaW5vciwgbWlub3ItPmluZGV4LCBk
cm1fZGVidWdmc19yb290KTsNCj4gLQlpZiAocmV0KSB7DQo+IC0JCURSTV9FUlJPUigiRFJN
OiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkuXG4iKTsNCg0K
UmF0aGVyIHRoYW4gZGVsZXRpbmcgdGhlIGVycm9yIG1lc3NhZ2UsIHJldHVybiBhbiBlcnJv
ciBjb2RlIGZyb20gDQpkcm1fZGVidWdmc19pbml0KCkgYW5kIHByaW50IGl0IGhlcmUuIEkn
ZCBjaGFuZ2UgRFJNX0VSUk9SKCkgdG8gDQpkcm1fZGJnX2NvcmUoTlVMTCwgLi4uKS4NCg0K
DQo+IC0JCWdvdG8gZXJyX2RlYnVnZnM7DQo+IC0JfQ0KPiArCWRybV9kZWJ1Z2ZzX2luaXQo
bWlub3IsIG1pbm9yLT5pbmRleCwgZHJtX2RlYnVnZnNfcm9vdCk7DQo+IA0KPiAgIAlyZXQg
PSBkZXZpY2VfYWRkKG1pbm9yLT5rZGV2KTsNCj4gICAJaWYgKHJldCkNCj4gQEAgLTEwNTAs
NyArMTA0NiwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBkcm1fY29yZV9pbml0KHZvaWQpDQo+
ICAgCQlnb3RvIGVycm9yOw0KPiAgIAl9DQo+IA0KPiAtCWRybV9kZWJ1Z2ZzX3Jvb3QgPSBk
ZWJ1Z2ZzX2NyZWF0ZV9kaXIoImRyaSIsIE5VTEwpOw0KPiArCWlmICghZGVidWdmc19pbml0
aWFsaXplZCgpKSB7DQo+ICsJCWRybV9kZWJ1Z2ZzX3Jvb3QgPSBOVUxMOw0KPiArCX0gZWxz
ZSB7DQo+ICsJCWRybV9kZWJ1Z2ZzX3Jvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImRyaSIs
IE5VTEwpOw0KPiArCQlpZiAoSVNfRVJSKGRybV9kZWJ1Z2ZzX3Jvb3QpKSB7DQo+ICsJCQlE
Uk1fV0FSTigiRFJNOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSAvc3lzL2tlcm5lbC9kZWJ1Zy9k
cmkuXG4iKTsNCg0KVGhpcyBzaG91bGQgYWxzbyBwcmludCB0aGUgZXJyb3IgY29kZS4gSSdk
IGFsc28gY2hhbmdlIHRoZSBjYWxsIHRvIA0KZHJtX2RiZ19jb3JlKCkuIFRoZSBtZXNzYWdl
IHNob3VsZCBzYXkgJ2ZhaWxlZCB0byBjcmVhdGUnLCBzbyBpdCdzIA0KZGlmZmVybnQgZnJv
bSB0aGUgb3RoZXIgb25lLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsJCQlkcm1f
ZGVidWdmc19yb290ID0gTlVMTDsNCj4gKwkJfQ0KPiArCX0NCj4gDQo+ICAgCXJldCA9IHJl
Z2lzdGVyX2NocmRldihEUk1fTUFKT1IsICJkcm0iLCAmZHJtX3N0dWJfZm9wcyk7DQo+ICAg
CWlmIChyZXQgPCAwKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRl
cm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oDQo+IGluZGV4IDE3ZjM1
NDhjOGVkMi4uZTI3YTQwMTY2MTc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ludGVybmFsLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5o
DQo+IEBAIC0xODIsOCArMTgyLDggQEAgaW50IGRybV9nZW1fZHVtYl9kZXN0cm95KHN0cnVj
dCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gDQo+ICAgLyog
ZHJtX2RlYnVnZnMuYyBkcm1fZGVidWdmc19jcmMuYyAqLw0KPiAgICNpZiBkZWZpbmVkKENP
TkZJR19ERUJVR19GUykNCj4gLWludCBkcm1fZGVidWdmc19pbml0KHN0cnVjdCBkcm1fbWlu
b3IgKm1pbm9yLCBpbnQgbWlub3JfaWQsDQo+IC0JCSAgICAgc3RydWN0IGRlbnRyeSAqcm9v
dCk7DQo+ICt2b2lkIGRybV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3Is
IGludCBtaW5vcl9pZCwNCj4gKwkJICAgICAgc3RydWN0IGRlbnRyeSAqcm9vdCk7DQo+ICAg
dm9pZCBkcm1fZGVidWdmc19jbGVhbnVwKHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKTsNCj4g
ICB2b2lkIGRybV9kZWJ1Z2ZzX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3Rvcik7DQo+ICAgdm9pZCBkcm1fZGVidWdmc19jb25uZWN0b3JfcmVtb3ZlKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpOw0KPiBAQCAtMTkxLDEwICsxOTEsOSBA
QCB2b2lkIGRybV9kZWJ1Z2ZzX2NydGNfYWRkKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7DQo+
ICAgdm9pZCBkcm1fZGVidWdmc19jcnRjX3JlbW92ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMp
Ow0KPiAgIHZvaWQgZHJtX2RlYnVnZnNfY3J0Y19jcmNfYWRkKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0Yyk7DQo+ICAgI2Vsc2UNCj4gLXN0YXRpYyBpbmxpbmUgaW50IGRybV9kZWJ1Z2ZzX2lu
aXQoc3RydWN0IGRybV9taW5vciAqbWlub3IsIGludCBtaW5vcl9pZCwNCj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBkcm1fZGVidWdmc19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yLCBp
bnQgbWlub3JfaWQsDQo+ICAgCQkJCSAgIHN0cnVjdCBkZW50cnkgKnJvb3QpDQo+ICAgew0K
PiAtCXJldHVybiAwOw0KPiAgIH0NCj4gDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGRybV9k
ZWJ1Z2ZzX2NsZWFudXAoc3RydWN0IGRybV9taW5vciAqbWlub3IpDQo+IC0tDQo+IDIuMzIu
MA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------SkMpxEjqp5zDCd6hpQNHmy5s--

--------------k6YfyDe6B5eIPTxY9GNfpIWH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFgEOUFAwAAAAAACgkQlh/E3EQov+DP
mBAAuwNluYT3lfVFEwHXQbKS2vW5aLZC+hu8CxF3MnyLYzeENoWzYgGE6IeNcEZdLgchCR3b5O9a
mQ7SwHSsmBvhCtDvbTchtWplDhmwIiZ34Ogdb3sAl7RX/4eCsmWJ+2BRC2VhYCIcKZagbbxKI5SX
yjcSViOlNAW/eJ003rs/5e6uJhCHwrrHQlzS0xMZDScL2rdm6ZGUxuaf60+ugHiNBqpTaNJ1f60l
3ZPNJnquCKpobcdL0a9JvEH/2UuMXryHHz0IGkFkwUdwZsf12R0p3h+uyJ4yLZyWRlP1wd9+ZLSs
MP3ghaXDzBGgpkEExRiUheLzpJRdixAhybPCYnjk5u7xNbbxMRYlxWFKO1rn4ftc5ZRr4931HW7e
/7fIwEpx4DkREPIjrBqs+Gl9vygQRJDyxCjQSjk+2A5bNml9b5KLIA62XPDxV2I3ebF+MbP3XKm6
SawdcxY7kytyUO5ASBQ0zMAPMYCArEoROb9/dKUqwW4kz8ffGsdznD7xOZWgbjgs2Ulw9lM5jCJU
cwZEIBoudBCshkJboKppntRl+agAEIvQF3CibUywMQkcZfQMpldD5a1rB8SsgvndJ32GhtuP+pw7
f51IbmOIy3+bsUs/iK9c08GrbLdn24meKT3tpLPL8nOgx1aBKPq2GNWHyKvpT8Ytv7T+hsfKgbIt
XYU=
=7Hgb
-----END PGP SIGNATURE-----

--------------k6YfyDe6B5eIPTxY9GNfpIWH--
