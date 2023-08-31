Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C4C78E8EA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B214C10E189;
	Thu, 31 Aug 2023 08:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6D10E189
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:57:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E077F1F854;
 Thu, 31 Aug 2023 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693472249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uEkvqTQyqCEl4x0mfJzRozk0EF93NSdEzQwGO4Dk/A=;
 b=BmyZcDhD6Gick5wIAELjtZQb1Qmeidp0evdEg2NtXcINPQAkgxKDcs0yLnvJ+y2tt1KCd/
 fzbXN3tKJeHAMnvXjfX/ruHkqkg5V2z8VOlTid8nwWqBDcKX4BQ+dOsjDxvsuEBqTBjDLo
 aDK2dcifnR7szEhR0adPo5rI/1MGvH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693472249;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uEkvqTQyqCEl4x0mfJzRozk0EF93NSdEzQwGO4Dk/A=;
 b=0N88Z9MgDfsExBDTRIVcmKE3y8ZClWomuKTziny78mt5wV/FFOalZTsDGMGwpuPd3ME+qk
 FuesNv/deoODHFDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B056B13583;
 Thu, 31 Aug 2023 08:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ET8pKvlV8GT1BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 31 Aug 2023 08:57:29 +0000
Message-ID: <24ba6014-ce85-9013-fa89-17a4c7fcfc21@suse.de>
Date: Thu, 31 Aug 2023 10:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 7/8] drm/fb-helper: Add support for DRM_FORMAT_R1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <62cb6e8c7aba2a037fb3704d46f60b93d7218b90.1692888745.git.geert@linux-m68k.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <62cb6e8c7aba2a037fb3704d46f60b93d7218b90.1692888745.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bhLbKqqPLKvwg7nEUHCxDpy2"
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
--------------bhLbKqqPLKvwg7nEUHCxDpy2
Content-Type: multipart/mixed; boundary="------------ObhbbxdLlOLY2CHIQYAyEeNR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <24ba6014-ce85-9013-fa89-17a4c7fcfc21@suse.de>
Subject: Re: [PATCH v2 7/8] drm/fb-helper: Add support for DRM_FORMAT_R1
References: <cover.1692888745.git.geert@linux-m68k.org>
 <62cb6e8c7aba2a037fb3704d46f60b93d7218b90.1692888745.git.geert@linux-m68k.org>
In-Reply-To: <62cb6e8c7aba2a037fb3704d46f60b93d7218b90.1692888745.git.geert@linux-m68k.org>

--------------ObhbbxdLlOLY2CHIQYAyEeNR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDguMjMgdW0gMTc6MDggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEFkZCBzdXBwb3J0IGZvciB0aGUgbW9ub2Nocm9tZSBsaWdodC1vbi1kYXJrIGJ1ZmZl
ciBmb3JtYXQgKFIxKSB0byB0aGUNCj4gZmIgaGVscGVyLCBzbyB0aGlzIGZvcm1hdCBjYW4g
YmUgdXNlZCBmb3IgZmJkZXYgZW11bGF0aW9uIGFuZCBmb3IgdGhlDQo+IHRleHQgY29uc29s
ZS4gIFRoaXMgYXZvaWRzIHRoZSBvdmVyaGVhZCBvZiB1c2luZyBYUjI0IGFuZCB0aGUgYXNz
b2NpYXRlZA0KPiBjb252ZXJzaW9ucyBvbiBkaXNwbGF5IGhhcmR3YXJlIHRoYXQgc3VwcG9y
dHMgb25seSBhIHNpbXBsZSBtb25vY2hyb21lDQo+IGZvcm1hdC4NCj4gDQo+IFIxIGlzIHZl
cnkgc2ltaWxhciB0byBDMSAobW9ub2Nocm9tZSBpbmRleGVkIGNvbG9yKSwgYW5kIHNoYXJl
cyB0aGUgc2FtZQ0KPiBkZXB0aCBhbmQgYnBwLiAgQXMgZHJtX21vZGVfbGVnYWN5X2ZiX2Zv
cm1hdCgpIHJldHVybnMgYSBmb3JtYXQgYmFzZWQgb24NCj4gb25seSBkZXB0aCBhbmQgYnBw
LCBpdCBjYW5ub3QgZGlzdGluZ3Vpc2ggYmV0d2VlbiBSMSBhbmQgQzEuICBIZW5jZQ0KDQpD
b3VsZCB3ZSByYXRoZXIgYWRkIGFub3RoZXIgcGFyYW1ldGVyIHRvIGRybV9tb2RlX2xlZ2Fj
eV9mYl9mb3JtYXQoKTsgDQpzYXkgJ2Jvb2wgaW5kZXhlZCcuIElmIHNldCB0byB0cnVlLCBp
dCBwcmVmZXJzIF9DeCBmb3JtYXRzLCBvdGhlcndpc2UgX1J4Lg0KDQpUaGUgcGFyYW1ldGVy
IHdvdWxkIGJlICd0cnVlJyBmb3IgbW9zdCBjYWxsczsgZXhjZXB0IGluIA0KZHJtX2ZiX2hl
bHBlcl9maW5kX2Zvcm1hdCgpLiBUaGVyZSwgd2UgY2FuIGdvIHRocm91Z2ggdGhlIGFycmF5
IG9mIGdpdmVuIA0KZm9ybWF0cyBhbmQgY2hlY2sgaWYgdGhlcmUncyBvbmUgdGhhdCBoYXMg
aXNfY29sb3JfaW5kZXhlZCBzZXQuIElmIHNvLCANCndlIHNwZWNpZnkgdHJ1ZSwgaWYgbm90
IHdlIHNwZWNpZnkgZmFsc2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gZHJtX2Zi
X2hlbHBlcl9maW5kX2Zvcm1hdCgpIGlzIG1vZGlmaWVkIHRvIHRyeSB0byBmYWxsIGJhY2sg
dG8gUjEgaWYgQzENCj4gaXMgbm90IHN1cHBvcnRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFJldmlld2Vk
LWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4g
VGVzdGVkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNv
bT4NCj4gLS0tDQo+IHYyOg0KPiAgICAtIEFkZCBSZXZpZXdlZC1ieSwgVGVzdGVkLWJ5Lg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgNDEgKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jDQo+IGluZGV4IDRkYzI4ZmRjYzFlMGE2YTQuLjcxYmFmODU5NzUxNmU5ZmQgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBAQCAtMTEzMCw3ICsxMTMwLDcg
QEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9maWxsX3BpeGVsX2ZtdChzdHJ1Y3QgZmJf
dmFyX3NjcmVlbmluZm8gKnZhciwNCj4gICB7DQo+ICAgCXU4IGRlcHRoID0gZm9ybWF0LT5k
ZXB0aDsNCj4gICANCj4gLQlpZiAoZm9ybWF0LT5pc19jb2xvcl9pbmRleGVkKSB7DQo+ICsJ
aWYgKGZvcm1hdC0+Zm9ybWF0ID09IERSTV9GT1JNQVRfUjEgfHwgZm9ybWF0LT5pc19jb2xv
cl9pbmRleGVkKSB7DQo+ICAgCQl2YXItPnJlZC5vZmZzZXQgPSAwOw0KPiAgIAkJdmFyLT5n
cmVlbi5vZmZzZXQgPSAwOw0KPiAgIAkJdmFyLT5ibHVlLm9mZnNldCA9IDA7DQo+IEBAIC0x
MjM2LDYgKzEyMzYsNyBAQCBpbnQgZHJtX2ZiX2hlbHBlcl9jaGVja192YXIoc3RydWN0IGZi
X3Zhcl9zY3JlZW5pbmZvICp2YXIsDQo+ICAgCWNhc2UgRFJNX0ZPUk1BVF9DMToNCj4gICAJ
Y2FzZSBEUk1fRk9STUFUX0MyOg0KPiAgIAljYXNlIERSTV9GT1JNQVRfQzQ6DQo+ICsJY2Fz
ZSBEUk1fRk9STUFUX1IxOg0KPiAgIAkJLyogc3VwcG9ydGVkIGZvcm1hdCB3aXRoIHN1Yi1i
eXRlIHBpeGVscyAqLw0KPiAgIAkJYnJlYWs7DQo+ICAgDQo+IEBAIC0xNDM5LDEyICsxNDQw
LDI0IEBAIGludCBkcm1fZmJfaGVscGVyX3Bhbl9kaXNwbGF5KHN0cnVjdCBmYl92YXJfc2Ny
ZWVuaW5mbyAqdmFyLA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJf
cGFuX2Rpc3BsYXkpOw0KPiAgIA0KPiArc3RhdGljIGJvb2wgaXNfc3VwcG9ydGVkX2Zvcm1h
dCh1aW50MzJfdCBmb3JtYXQsIGNvbnN0IHVpbnQzMl90ICpmb3JtYXRzLA0KPiArCQkJCXNp
emVfdCBmb3JtYXRfY291bnQpDQo+ICt7DQo+ICsJc2l6ZV90IGk7DQo+ICsNCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgZm9ybWF0X2NvdW50OyArK2kpIHsNCj4gKwkJaWYgKGZvcm1hdHNbaV0g
PT0gZm9ybWF0KQ0KPiArCQkJcmV0dXJuIHRydWU7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJu
IGZhbHNlOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIHVpbnQzMl90IGRybV9mYl9oZWxwZXJf
ZmluZF9mb3JtYXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwgY29uc3QgdWlu
dDMyX3QgKmZvcm1hdHMsDQo+ICAgCQkJCQkgIHNpemVfdCBmb3JtYXRfY291bnQsIHVpbnQz
Ml90IGJwcCwgdWludDMyX3QgZGVwdGgpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gZmJfaGVscGVyLT5kZXY7DQo+ICAgCXVpbnQzMl90IGZvcm1hdDsNCj4gLQlz
aXplX3QgaTsNCj4gICANCj4gICAJLyoNCj4gICAJICogRG8gbm90IGNvbnNpZGVyIFlVViBv
ciBvdGhlciBjb21wbGljYXRlZCBmb3JtYXRzDQo+IEBAIC0xNDU3LDEwICsxNDcwLDEyIEBA
IHN0YXRpYyB1aW50MzJfdCBkcm1fZmJfaGVscGVyX2ZpbmRfZm9ybWF0KHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpmYl9oZWxwZXIsIGNvbnN0DQo+ICAgCWlmICghZm9ybWF0KQ0KPiAgIAkJ
Z290byBlcnI7DQo+ICAgDQo+IC0JZm9yIChpID0gMDsgaSA8IGZvcm1hdF9jb3VudDsgKytp
KSB7DQo+IC0JCWlmIChmb3JtYXRzW2ldID09IGZvcm1hdCkNCj4gLQkJCXJldHVybiBmb3Jt
YXQ7DQo+IC0JfQ0KPiArCWlmIChpc19zdXBwb3J0ZWRfZm9ybWF0KGZvcm1hdCwgZm9ybWF0
cywgZm9ybWF0X2NvdW50KSkNCj4gKwkJcmV0dXJuIGZvcm1hdDsNCj4gKw0KPiArCWlmIChm
b3JtYXQgPT0gRFJNX0ZPUk1BVF9DMSAmJg0KPiArCSAgICBpc19zdXBwb3J0ZWRfZm9ybWF0
KERSTV9GT1JNQVRfUjEsIGZvcm1hdHMsIGZvcm1hdF9jb3VudCkpDQo+ICsJCXJldHVybiBE
Uk1fRk9STUFUX1IxOw0KPiAgIA0KPiAgIGVycjoNCj4gICAJLyogV2UgZm91bmQgbm90aGlu
Zy4gKi8NCj4gQEAgLTE2ODAsMTEgKzE2OTUsMTUgQEAgc3RhdGljIGludCBkcm1fZmJfaGVs
cGVyX3NpbmdsZV9mYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQ0K
PiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2ZpbGxfZml4KHN0
cnVjdCBmYl9pbmZvICppbmZvLCB1aW50MzJfdCBwaXRjaCwNCj4gLQkJCQkgICBib29sIGlz
X2NvbG9yX2luZGV4ZWQpDQo+ICsJCQkJICAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqZm9ybWF0KQ0KPiAgIHsNCj4gICAJaW5mby0+Zml4LnR5cGUgPSBGQl9UWVBFX1BBQ0tF
RF9QSVhFTFM7DQo+IC0JaW5mby0+Zml4LnZpc3VhbCA9IGlzX2NvbG9yX2luZGV4ZWQgPyBG
Ql9WSVNVQUxfUFNFVURPQ09MT1INCj4gLQkJCQkJICAgIDogRkJfVklTVUFMX1RSVUVDT0xP
UjsNCj4gKwlpZiAoZm9ybWF0LT5mb3JtYXQgPT0gRFJNX0ZPUk1BVF9SMSkNCj4gKwkJaW5m
by0+Zml4LnZpc3VhbCA9IEZCX1ZJU1VBTF9NT05PMTA7DQo+ICsJZWxzZSBpZiAoZm9ybWF0
LT5pc19jb2xvcl9pbmRleGVkKQ0KPiArCQlpbmZvLT5maXgudmlzdWFsID0gRkJfVklTVUFM
X1BTRVVET0NPTE9SOw0KPiArCWVsc2UNCj4gKwkJaW5mby0+Zml4LnZpc3VhbCA9IEZCX1ZJ
U1VBTF9UUlVFQ09MT1I7DQo+ICAgCWluZm8tPmZpeC5tbWlvX3N0YXJ0ID0gMDsNCj4gICAJ
aW5mby0+Zml4Lm1taW9fbGVuID0gMDsNCj4gICAJaW5mby0+Zml4LnR5cGVfYXV4ID0gMDsN
Cj4gQEAgLTE3MDcsNiArMTcyNiw3IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZmls
bF92YXIoc3RydWN0IGZiX2luZm8gKmluZm8sDQo+ICAgCWNhc2UgRFJNX0ZPUk1BVF9DMToN
Cj4gICAJY2FzZSBEUk1fRk9STUFUX0MyOg0KPiAgIAljYXNlIERSTV9GT1JNQVRfQzQ6DQo+
ICsJY2FzZSBEUk1fRk9STUFUX1IxOg0KPiAgIAkJLyogc3VwcG9ydGVkIGZvcm1hdCB3aXRo
IHN1Yi1ieXRlIHBpeGVscyAqLw0KPiAgIAkJYnJlYWs7DQo+ICAgDQo+IEBAIC0xNzQ3LDgg
KzE3NjcsNyBAQCB2b2lkIGRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKHN0cnVjdCBmYl9pbmZv
ICppbmZvLA0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBmYl9o
ZWxwZXItPmZiOw0KPiAgIA0KPiAtCWRybV9mYl9oZWxwZXJfZmlsbF9maXgoaW5mbywgZmIt
PnBpdGNoZXNbMF0sDQo+IC0JCQkgICAgICAgZmItPmZvcm1hdC0+aXNfY29sb3JfaW5kZXhl
ZCk7DQo+ICsJZHJtX2ZiX2hlbHBlcl9maWxsX2ZpeChpbmZvLCBmYi0+cGl0Y2hlc1swXSwg
ZmItPmZvcm1hdCk7DQo+ICAgCWRybV9mYl9oZWxwZXJfZmlsbF92YXIoaW5mbywgZmJfaGVs
cGVyLA0KPiAgIAkJCSAgICAgICBzaXplcy0+ZmJfd2lkdGgsIHNpemVzLT5mYl9oZWlnaHQp
Ow0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5z
dHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBB
bmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4
MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------ObhbbxdLlOLY2CHIQYAyEeNR--

--------------bhLbKqqPLKvwg7nEUHCxDpy2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTwVfgFAwAAAAAACgkQlh/E3EQov+Cf
YRAApMJPvcDmm/Yr0g3rhlLuoAJYrB9G1w3/tE5Uk960TFl48I51v/TtEpb+AS9qh+XPE3JdZvWP
R+nBGmh+Ne1KGkJ7tkj+iGLdoe1f5neujaTTWi9ALNQR5RHTM6VEvnWrk6cM7xjH0l7m1wCokYT1
FGlNWxzaXDTSsYsDpbe5d/6jY/ZWXHEFl7vkQrMkP6/oaontb+gFohTsLVNz9MgnAbosizOBHchX
MdTG8Jix0/n0zKotVDCILdh99sDNSHKX+roUvyqZ/NmP0+I4oM4phxFfqUQkXJF4WboYPz/Gy5GK
b6CuUPnpw+OI/wwg56b8kDPMJv3hOMavI3+nSuOnxjnqh4lDkHeKkza3aH4zHeUOeahYt7/uuySZ
wsjVpNXZIF9XQ5AKB39XHda/BgXvjKdfCFi2JqydUy20+55CLQG+wPYx1OaznYYYs1Y9JmsgnA4r
QfVJQN53uTH0dD+CMKrjhMKZT5i0HdTocAtswsMhocsWGMgYIfHj8pIBp0j/Fyp4FbPlNpZPyge9
G0vN1LJV+RMbGLs5GI6H1BQCRRHZTHSIRnFIpZF0b85lKQ1+r/ijiv0T7R9SGayT1JZdqA/W9bV+
BugzqicGq2887ar7LTOMB6J48jLRPcslWxFXw8JHxxXLJ3PU35Ygi/eNmSNHF/tP/4FA21+VoTzP
fdQ=
=CmH/
-----END PGP SIGNATURE-----

--------------bhLbKqqPLKvwg7nEUHCxDpy2--
