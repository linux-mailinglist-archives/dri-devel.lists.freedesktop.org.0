Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678EB54AA92
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8C10F9B4;
	Tue, 14 Jun 2022 07:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD7710F9B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:29:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D43821A64;
 Tue, 14 Jun 2022 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655191787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfPLYeTqDx0XspcnWLqni39/YwDDGfDIeuyoRGwbS94=;
 b=HKfLDxxFKEAgpRT5QxBo4GPiYiFH1EbZE3lkxDexgSmJ/vfoNLqsNEz6ZbKenTXyxvtJE4
 6Dzj/QDtvnSmbNwYri0hut9qbDx7M9hCazzDCwfTL2JaElQ8bXjyvlhMNDQldWwk236mjt
 JFV1KZBWgrCyzh2g54TKp60ovITmWCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655191787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfPLYeTqDx0XspcnWLqni39/YwDDGfDIeuyoRGwbS94=;
 b=SDUA3qTtTF7aSJ49tdh8Ua+GnfGlxRmiIVyT9O7pSUZNeIjSrMzR684QpDXBh3coi8Tuf8
 Dbeh6oPk3k5DIrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31AD3139EC;
 Tue, 14 Jun 2022 07:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EUUlC+s4qGLbAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jun 2022 07:29:47 +0000
Message-ID: <bdfb49ec-9983-b51b-38fb-3b72041a8e1f@suse.de>
Date: Tue, 14 Jun 2022 09:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 13/19] drm/gma500: Unify struct *_intel_lvds_helper_funcs
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
 <20220613123436.15185-14-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220613123436.15185-14-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ee000SmmlgVxLMvNPhjv3p9n"
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ee000SmmlgVxLMvNPhjv3p9n
Content-Type: multipart/mixed; boundary="------------GNA7LfiPsjEBWmo6sqwH5dEq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Message-ID: <bdfb49ec-9983-b51b-38fb-3b72041a8e1f@suse.de>
Subject: Re: [PATCH 13/19] drm/gma500: Unify struct *_intel_lvds_helper_funcs
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
 <20220613123436.15185-14-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220613123436.15185-14-patrik.r.jakobsson@gmail.com>

--------------GNA7LfiPsjEBWmo6sqwH5dEq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDYuMjIgdW0gMTQ6MzQgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBUaGVzZSBub3cgb25seSBjb250YWlucyBnZW5lcmljIGdtYSBmdW5jdGlvbnMgc28gY3Jl
YXRlDQo+IGdtYV9sdmRzX2hlbHBlcl9mdW5jcyB0aGF0IGJvdGggUFNCIGFuZCBDRFYgY2Fu
IHVzZS4gT2FrdHJhaWwgc3RpbGwNCj4gbmVlZHMgdGhlIG1vZGVzZXQgY2FsbGJhY2sgcmVm
YWN0b3JlZCB0byBhbGlnbiB3aXRoIFBTQiBhbmQgQ0RWLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfbHZkcy5jIHwgMTEg
Ky0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9sdmRzLmMgICAg
ICAgfCAxNCArKysrKysrKysrKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21h
X2x2ZHMuaCAgICAgICB8ICA1ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9w
c2JfaW50ZWxfbHZkcy5jIHwgMTAgKy0tLS0tLS0tLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfbHZkcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9jZHZfaW50ZWxfbHZkcy5jDQo+IGluZGV4IGRkZmI5NzZiNjA1OS4uODBj
Y2MwMGM0N2U1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9p
bnRlbF9sdmRzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxf
bHZkcy5jDQo+IEBAIC0xMzYsMTUgKzEzNiw2IEBAIHN0YXRpYyBpbnQgY2R2X2ludGVsX2x2
ZHNfc2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ICAg
CXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Vu
Y29kZXJfaGVscGVyX2Z1bmNzDQo+IC0JCQkJCWNkdl9pbnRlbF9sdmRzX2hlbHBlcl9mdW5j
cyA9IHsNCj4gLQkuZHBtcyA9IGdtYV9sdmRzX2VuY29kZXJfZHBtcywNCj4gLQkubW9kZV9m
aXh1cCA9IGdtYV9sdmRzX21vZGVfZml4dXAsDQo+IC0JLnByZXBhcmUgPSBnbWFfbHZkc19w
cmVwYXJlLA0KPiAtCS5tb2RlX3NldCA9IGdtYV9sdmRzX21vZGVfc2V0LA0KPiAtCS5jb21t
aXQgPSBnbWFfbHZkc19jb21taXQsDQo+IC19Ow0KPiAtDQo+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcw0KPiAgIAkJCQljZHZfaW50ZWxfbHZk
c19jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gew0KPiAgIAkuZ2V0X21vZGVzID0gY2R2X2lu
dGVsX2x2ZHNfZ2V0X21vZGVzLA0KPiBAQCAtMjg2LDcgKzI3Nyw3IEBAIHZvaWQgY2R2X2lu
dGVsX2x2ZHNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAlnbWFfY29ubmVj
dG9yX2F0dGFjaF9lbmNvZGVyKGdtYV9jb25uZWN0b3IsIGdtYV9lbmNvZGVyKTsNCj4gICAJ
Z21hX2VuY29kZXItPnR5cGUgPSBJTlRFTF9PVVRQVVRfTFZEUzsNCj4gICANCj4gLQlkcm1f
ZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsICZjZHZfaW50ZWxfbHZkc19oZWxwZXJfZnVu
Y3MpOw0KPiArCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2RlciwgJmdtYV9sdmRzX2hl
bHBlcl9mdW5jcyk7DQo+ICAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3Is
DQo+ICAgCQkJCSAmY2R2X2ludGVsX2x2ZHNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+
ICAgCWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLnN1YnBpeGVsX29yZGVyID0gU3ViUGl4ZWxI
b3Jpem9udGFsUkdCOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9n
bWFfbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfbHZkcy5jDQo+IGluZGV4
IDIxNWJmOGY3ZDQxZi4uYmY5ZmE1ZWJkYmQzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2dtYV9sdmRzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9nbWFfbHZkcy5jDQo+IEBAIC0yOTksOSArMjk5LDkgQEAgdm9pZCBnbWFfbHZkc19jb21t
aXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQ0KPiAgIAlnbWFfbHZkc19zZXRfcG93
ZXIoZGV2LCB0cnVlKTsNCj4gICB9DQo+ICAgDQo+IC12b2lkIGdtYV9sdmRzX21vZGVfc2V0
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwNCj4gLQkJICAgICAgIHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlLA0KPiAtCQkgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKmFkanVzdGVkX21vZGUpDQo+ICtzdGF0aWMgdm9pZCBnbWFfbHZkc19tb2RlX3NldChz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQo+ICsJCQkgICAgICBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqbW9kZSwNCj4gKwkJCSAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICphZGp1c3RlZF9tb2RlKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IGVuY29kZXItPmRldjsNCj4gICAJc3RydWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYg
PSB0b19kcm1fcHNiX3ByaXZhdGUoZGV2KTsNCj4gQEAgLTMzNCwzICszMzQsMTEgQEAgdm9p
ZCBnbWFfbHZkc19tb2RlX3NldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQo+ICAg
CVJFR19XUklURShQRklUX0NPTlRST0wsIHBmaXRfY29udHJvbCk7DQo+ICAgfQ0KPiAgIA0K
PiArY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBnbWFfbHZkc19oZWxw
ZXJfZnVuY3MgPSB7DQo+ICsJLmRwbXMgPSBnbWFfbHZkc19lbmNvZGVyX2RwbXMsDQo+ICsJ
Lm1vZGVfZml4dXAgPSBnbWFfbHZkc19tb2RlX2ZpeHVwLA0KPiArCS5wcmVwYXJlID0gZ21h
X2x2ZHNfcHJlcGFyZSwNCj4gKwkubW9kZV9zZXQgPSBnbWFfbHZkc19tb2RlX3NldCwNCj4g
KwkuY29tbWl0ID0gZ21hX2x2ZHNfY29tbWl0LA0KPiArfTsNCj4gKw0KDQpBbHRlcm5hdGl2
ZWx5LCB5b3UgY291bGQgdXNlIGFuIGluaXRpYWxpemVyIG1hY3JvLCBzdWNoIGFzDQoNCiNk
ZWZpbmUgR01BX0xWRFNfSEVMUEVSX0ZVTkNTIFwNCiAgIC5kcG1zID0gLi4NCiAgIC5tb2Rl
X2ZpeHVwID0gLi4uDQogICAuLi4NCg0KYW5kIHVzZSBpdCB0byBpbml0aWFsaXplIHRoZSBw
ZXItbW9kZWwgbW9kZWwgaW5zdGFuY2VzLiBUaGlzIHdvdWxkIGFsbG93IA0KdG8ga2VlcCBl
YWNoIGluc3RhbmNlIGFzICdzdGF0aWMgY29uc3QnLiAgVGhlIGxpbmtlciBzaG91bGQgYmUg
YWJsZSB0byANCnNvcnQgb3V0IGR1cGxpY2F0ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2x2ZHMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2x2ZHMuaA0KPiBpbmRleCBlYmJhODY5YTI1
YjcuLjNjNDdiZWE4NTlhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9nbWFfbHZkcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ21hX2x2ZHMu
aA0KPiBAQCAtMzQsOCArMzQsNyBAQCBib29sIGdtYV9sdmRzX21vZGVfZml4dXAoc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyLA0KPiAgIAkJCSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSAqYWRqdXN0ZWRfbW9kZSk7DQo+ICAgdm9pZCBnbWFfbHZkc19wcmVwYXJlKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2Rlcik7DQo+ICAgdm9pZCBnbWFfbHZkc19jb21taXQoc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyKTsNCj4gLXZvaWQgZ21hX2x2ZHNfbW9kZV9zZXQoc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyLA0KPiAtCQkgICAgICAgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUsDQo+IC0JCSAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAq
YWRqdXN0ZWRfbW9kZSk7DQo+ICsNCj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgZHJtX2VuY29k
ZXJfaGVscGVyX2Z1bmNzIGdtYV9sdmRzX2hlbHBlcl9mdW5jczsNCj4gICANCj4gICAjZW5k
aWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2x2
ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2x2ZHMuYw0KPiBpbmRl
eCA1NTNmNmNiNWYzMjIuLjI5YTliNGVhNTgwMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9wc2JfaW50ZWxfbHZkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2ludGVsX2x2ZHMuYw0KPiBAQCAtMjM2LDE0ICsyMzYsNiBAQCBpbnQg
cHNiX2ludGVsX2x2ZHNfc2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsDQo+ICAgCXJldHVybiAtMTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBwc2JfaW50ZWxfbHZkc19oZWxwZXJf
ZnVuY3MgPSB7DQo+IC0JLmRwbXMgPSBnbWFfbHZkc19lbmNvZGVyX2RwbXMsDQo+IC0JLm1v
ZGVfZml4dXAgPSBnbWFfbHZkc19tb2RlX2ZpeHVwLA0KPiAtCS5wcmVwYXJlID0gZ21hX2x2
ZHNfcHJlcGFyZSwNCj4gLQkubW9kZV9zZXQgPSBnbWFfbHZkc19tb2RlX3NldCwNCj4gLQku
Y29tbWl0ID0gZ21hX2x2ZHNfY29tbWl0LA0KPiAtfTsNCj4gLQ0KPiAgIGNvbnN0IHN0cnVj
dCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcw0KPiAgIAkJCQlwc2JfaW50ZWxfbHZkc19j
b25uZWN0b3JfaGVscGVyX2Z1bmNzID0gew0KPiAgIAkuZ2V0X21vZGVzID0gcHNiX2ludGVs
X2x2ZHNfZ2V0X21vZGVzLA0KPiBAQCAtMzI5LDcgKzMyMSw3IEBAIHZvaWQgcHNiX2ludGVs
X2x2ZHNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAlnbWFfY29ubmVjdG9y
X2F0dGFjaF9lbmNvZGVyKGdtYV9jb25uZWN0b3IsIGdtYV9lbmNvZGVyKTsNCj4gICAJZ21h
X2VuY29kZXItPnR5cGUgPSBJTlRFTF9PVVRQVVRfTFZEUzsNCj4gICANCj4gLQlkcm1fZW5j
b2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsICZwc2JfaW50ZWxfbHZkc19oZWxwZXJfZnVuY3Mp
Ow0KPiArCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2RlciwgJmdtYV9sdmRzX2hlbHBl
cl9mdW5jcyk7DQo+ICAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsDQo+
ICAgCQkJCSAmcHNiX2ludGVsX2x2ZHNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+ICAg
CWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLnN1YnBpeGVsX29yZGVyID0gU3ViUGl4ZWxIb3Jp
em9udGFsUkdCOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------GNA7LfiPsjEBWmo6sqwH5dEq--

--------------Ee000SmmlgVxLMvNPhjv3p9n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKoOOoFAwAAAAAACgkQlh/E3EQov+D6
UBAAwoPQ1EaL3WcYEvxnhD82/OmhLKCRauIz33ar3VAEoz9MwIhSR7tKqbFhgWM7Yf7YCgED2w1+
vlmQ8U31gQDcj41d7gZZkePaG9KVLTRiNr0xrNnDmo3WTP0rCVcisvr7SvPLT2cVVRvkw49mPFQE
ZpviQx7RHvvGV9aJTI5kz3Bm8wD9e/JkOrD+hbEnYtfzZ5MtM0pD7FJs87gUHXThvc9jyNC0WHK4
ZRrb0H1rtNR3ezBAqpWV0WjpQW2sauRIi/5ZpbJM0R2wCX0blB+ZxbGoqKECZWQc+yQ3/MAGLKH0
e/AuzNodzx2+rUjmgyVh4kUkbFDuo7bnqtSxdyOXOrTNP0xoRR5waRaQkdZ9sgFLMPkAvPzODE4g
mjPqpkFsz3fQxG7J2jPJ7i1bMJJXW6FORunKDxD7x5tjuSSwV8NqayJ2QsbUxanEFQzU+zUgnVns
wc3MuEaLmLk/H/ihSOs4qyEJ0q5d8AVxDwa/tv5FGrW9TGZ/IHfoSOZ+XFUS2Up7CtnuJSx5w4ol
9/7qTZ11zS8KqwNUbKoOGIuAvMWlz3IlZ97P7cc5vMNzK3FIqYEhNP+Q7LWVCj1VjtmG8LeBWOam
/3qFn2UFb6V1Oi1o/1igLNRNVOGQFP1Bomj85VMgAVnU7+KG5OSi9btPufcEcCtzq7ty5mUYIQdk
klA=
=49up
-----END PGP SIGNATURE-----

--------------Ee000SmmlgVxLMvNPhjv3p9n--
