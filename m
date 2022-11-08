Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BDF620FF6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447710E41B;
	Tue,  8 Nov 2022 12:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131C310E414
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:10:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C85231F38C;
 Tue,  8 Nov 2022 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667909449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLF0i7PHvi+AsGdzkBsNcA9AEhed2PxdsT+Nsmf7aEk=;
 b=P0NJU20ca0q3pw88pxz4xpunwkGivXuPE1JQFpvLb/Cn3r2+BvZMNb9T8DH9zazDBRn1iL
 QvhufzB+7DsyGGM8xbh3W5c5bD6CmnjoztjyG/QoanLyz63l9moKwETgVymI8Q9IBl/J62
 22JXPjgXYOU8g6sFrgemv0p9BX5TR2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667909449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLF0i7PHvi+AsGdzkBsNcA9AEhed2PxdsT+Nsmf7aEk=;
 b=QSmBOsTdVFXyTtjzK4IhaEP+0dfdR9/aNSjjJN1oY/ldpgqLnc95XMSJn2wX+//snmiGFE
 saIBSMYSHm+9vgCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E9E813398;
 Tue,  8 Nov 2022 12:10:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TqyoJUlHamNcVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Nov 2022 12:10:49 +0000
Message-ID: <39a93eaa-8942-d630-243a-f6e34a16718d@suse.de>
Date: Tue, 8 Nov 2022 13:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 01/26] drm: modeset-helper: Export dev_pm_ops for simple
 drivers
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-2-paul@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221107175106.360578-2-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AOLZySXSGaZzUzUNqM0OyhfC"
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
--------------AOLZySXSGaZzUzUNqM0OyhfC
Content-Type: multipart/mixed; boundary="------------gHgVjLbJBirhdUBXs5QjVQ9l";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <39a93eaa-8942-d630-243a-f6e34a16718d@suse.de>
Subject: Re: [PATCH 01/26] drm: modeset-helper: Export dev_pm_ops for simple
 drivers
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-2-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-2-paul@crapouillou.net>

--------------gHgVjLbJBirhdUBXs5QjVQ9l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF1bCwNCg0KdGhhbmtzIGZvciBjbGVhbmluZyB1cC4gUGxlYXNlIHNlZSBteSBjb21t
ZW50cyBiZWxvdy4NCg0KQW0gMDcuMTEuMjIgdW0gMTg6NTAgc2NocmllYiBQYXVsIENlcmN1
ZWlsOg0KPiBFeHBvcnQgYSBkZXZfcG1fb3BzIG1lYW50IHRvIGJlIHVzZWQgd2l0aCBzaW1w
bGUgZHJpdmVycywgd2hpY2ggaGF2ZQ0KPiB0aGVpciBzdHJ1Y3QgZHJtX2RldmljZSByZWdp
c3RlcmVkIGFzIHRoZWlyIHN0cnVjdCBkZXZpY2UncyBkcnZkYXRhLCBhbmQNCj4gb25seSBj
YWxsIGRybV9tb2RlX2NvbmZpZ19wbV97c3VzcGVuZCxyZXN1bWV9Lg0KPiANCj4gVGhlIHN5
bWJvbCBpcyBjb25kaXRpb25hbGx5IGV4cG9ydGVkIGlmIElTX0VOQUJMRUQoQ09ORklHX1BN
X1NMRUVQKSwgYW5kDQo+IHRoZXJlZm9yZSBpdCBzaG91bGQgYWx3YXlzIGJlIHJlZmVyZW5j
ZWQgdXNpbmcgdGhlIHBtX3NsZWVwX3B0cigpIG1hY3JvLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXNldF9oZWxwZXIuYyB8IDMyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICBpbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXIuaCAg
ICAgfCAgNCArKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlci5jDQo+IGluZGV4IGY4NThk
ZmVkZjJjZi4uMGJjOWY5MjI4YTYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21vZGVzZXRfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
c2V0X2hlbHBlci5jDQo+IEBAIC0yMCw2ICsyMCw5IEBADQo+ICAgICogT0YgVEhJUyBTT0ZU
V0FSRS4NCj4gICAgKi8NCj4gICANCj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4g
KyNpbmNsdWRlIDxsaW51eC9wbS5oPg0KPiArDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRv
bWljX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPg0KPiAg
ICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiBAQCAtMjQ0LDMgKzI0NywzMiBAQCBp
bnQgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoc3RydWN0IGRybV9kZXZpY2UgKmRl
dikNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fbW9k
ZV9jb25maWdfaGVscGVyX3Jlc3VtZSk7DQo+ICsNCj4gK3N0YXRpYyBpbnQgZHJtX21vZGVf
Y29uZmlnX3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXN0cnVj
dCBkcm1fZGV2aWNlICpkcm0gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKw0KPiArCXJl
dHVybiBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3BlbmQoZHJtKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCBkcm1fbW9kZV9jb25maWdfcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZk
YXRhKGRldik7DQo+ICsNCj4gKwlyZXR1cm4gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1
bWUoZHJtKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBkcm1fbW9kZV9jb25maWdfcG1f
b3BzIC0gRXhwb3J0ZWQgZGV2X3BtX29wcyBoZWxwZXIgZm9yIHNpbXBsZSBkcml2ZXJzDQo+
ICsgKg0KPiArICogVGhpcyBkZXZfcG1fb3BzIGNhbiBiZSB1c2VkIGZvciBzaW1wbGUgZHJp
dmVycyB0aGF0IHdvdWxkIG90aGVyd2lzZSBvbmx5IGNhbGwNCj4gKyAqIGRybV9tb2RlX2Nv
bmZpZ19oZWxwZXJfc3VzcGVuZCAvIGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfcmVzdW1lIGlu
IHRoZWlyIFBNDQo+ICsgKiBjYWxsYmFja3MuIEl0IGlzIG9ubHkgdmFsaWQgaWYgdGhlIGRy
aXZlcidzIGRybV9kZXZpY2UgaGFzIGJlZW4gcmVnaXN0ZXJlZCBhcw0KPiArICogdGhlIHN0
cnVjdCBkZXZpY2UncyBkcnZkYXRhLg0KPiArICoNCj4gKyAqIFRoZSBleHBvcnRlZCBzeW1i
b2wgbXVzdCBhbHdheXMgYmUgdXNlZCB3aXRoIHRoZSBwbV9zbGVlcF9wdHIoKSBtYWNybywg
bGlrZQ0KPiArICogdGhpczoNCj4gKyAqIC5wbSA9IHBtX3NsZWVwX3B0cigmZHJtX21vZGVf
Y29uZmlnX3BtX29wcyksDQo+ICsgKi8NCj4gK0VYUE9SVF9TSU1QTEVfREVWX1BNX09QUyhk
cm1fbW9kZV9jb25maWdfcG1fb3BzLA0KPiArCQkJIGRybV9tb2RlX2NvbmZpZ19wbV9zdXNw
ZW5kLCBkcm1fbW9kZV9jb25maWdfcG1fcmVzdW1lKTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRf
aGVscGVyLmgNCj4gaW5kZXggOTk1ZmQ5ODFjYWIwLi44NWYyOTYzN2U5YzEgMTAwNjQ0DQo+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlci5oDQo+ICsrKyBiL2luY2x1
ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlci5oDQo+IEBAIC0yMyw2ICsyMyw4IEBADQo+ICAg
I2lmbmRlZiBfX0RSTV9LTVNfSEVMUEVSX0hfXw0KPiAgICNkZWZpbmUgX19EUk1fS01TX0hF
TFBFUl9IX18NCg0KSSBsaWtlIHRoYXQgeW91IGNsZWFuIHVwIHRoZSBkcml2ZXIsIGJ1dCBu
b3QgaG93IGl0J3MgZG9uZSBUQkguDQoNCj4gICANCj4gKyNpbmNsdWRlIDxsaW51eC9wbS5o
Pg0KPiArDQoNCkhhbGYgb2YgRFJNIHNvbWVob3cgaW5jdWRlcyBkcm1fa21zX2hlbHBlci5o
LiBTbyB0aGlzIGluY2x1ZGUgc3RhdGVtZW50cyANCmFmZmVjdHMgbW9yZSBvciBsZXNzIGV2
ZXJ5dGhpbmcuDQoNCj4gICBzdHJ1Y3QgZHJtX2NydGM7DQo+ICAgc3RydWN0IGRybV9jcnRj
X2Z1bmNzOw0KPiAgIHN0cnVjdCBkcm1fZGV2aWNlOw0KPiBAQCAtNDEsNCArNDMsNiBAQCBp
bnQgZHJtX2NydGNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsDQo+ICAgaW50IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfc3VzcGVuZChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4gICBpbnQgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9y
ZXN1bWUoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgDQo+ICtleHRlcm4gY29uc3Qg
c3RydWN0IGRldl9wbV9vcHMgZHJtX21vZGVfY29uZmlnX3BtX29wczsNCj4gKw0KDQpUaGF0
J3MgbWF5YmUgc3ViamVjdGl2ZSwgYnV0IEkgZG9uJ3QgbGlrZSBleHBvcnRpbmcgc3VjaCBf
ZnVuY3MgYW5kIF9vcHMgDQppbnN0YW5jZXMuIFRoZXkgYXJlIGxpa2UgYmxhY2tib3hlcy4g
IEFuZCB0aGV5IHBvbGx1dGUgdGhlIHN5bWJvbCANCm5hbWVzcGFjZSB1bm5lY2Vzc2FyaWx5
Lg0KDQpJIHByb3Bvc2UgYSBzb2x1dGlvbiBzaW1pbGFyIHRvIERFRklORV9EUk1fR0VNX0ZP
UFMgWzFdIG9yIA0KZHJtX21vZHVsZV9wY2lfZHJpdmVyLiBbMl0NCg0KRGVmaW5lIGEgbWFj
cm8gaW4gdGhlIGhlYWRlciB0byBjcmVhdGUgdGhlIF9vcHMgaW5zdGFuY2UsIHN1Y2ggYXMN
Cg0KI2lmIGRlZmluZWQoQ09ORklHX1BNKQ0KI2RlZmluZSBERUZJTkVfRFJNX01PREVfQ09O
RklHX0hFTFBFUl9QTV9PUFMoX25hbWUpICBcDQogICBzdGF0aWMgX18gIyMgX25hbWUgIyMg
X3N1c3BlbmQoKSB7ICBcDQogICAgIGNhbGwgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9zdXNw
ZW5kKCkgIFwNCiAgIH0gXA0KICAgc3RhdGljIF9fICMjIF9uYW1lICMjIF9yZXN1bWUoKSB7
ICBcDQogICAgIGNhbGwgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoKSAgXA0KICAg
fSAgXA0KICAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKF9uYW1lLCBfXyAjIyBfbmFtZSAj
IyBfc3VzcGVuZCwgX18gIyMgX25hbWUgDQojIyBfcmVzdW1lKTsNCiNlbHNlDQojZGVmaW5l
IERFRklORV9EUk1fTU9ERV9DT05GSUdfSEVMUEVSX1BNX09QUyhfbmFtZSkNCiNlbmRpZg0K
DQpEcml2ZXJzIGNhbiB0aGVuIGtlZXAgdGhlIGluc3RhbmNlIGFuZCB0aGUgaW5jbHVkZSBm
b3IgcG0uaCBpbnRlcm5hbCANCndpdGhpbiB0aGVpciBfZHJ2LmMgZmlsZS4gVGhlIHNtYWxs
IGNhbGxiYWNrIGZ1bmN0aW9ucyBhcmUgd2l0aGluIHRoZSANCnNvdXJjZSBmaWxlIGFzIHdl
bGwuICBJZiBDT05GSUdfUE0gaGFzIGJlZW4gZGlzYWJsZWQsIG5vdGhpbmcgaXMgYmVpbmcg
DQpnZW5lcmF0ZWQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEtcmM0L3NvdXJjZS9pbmNsdWRlL2RybS9k
cm1fZ2VtLmgjTDM5Ng0KWzJdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djYuMS1yYzQvc291cmNlL2luY2x1ZGUvZHJtL2RybV9tb2R1bGUuaCNMNTgNCg0KDQo+ICAg
I2VuZGlmDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------gHgVjLbJBirhdUBXs5QjVQ9l--

--------------AOLZySXSGaZzUzUNqM0OyhfC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNqR0kFAwAAAAAACgkQlh/E3EQov+CS
lQ//Y0Ttvawrxso8davv8e/rQ6FCiIKeKZbXw7bGt7IrCPREfRmdlunEGwGvPuaKk8s3QSMJdrsW
oul0DMbZoeZKuk7EySEsHR4Rm0o9mi2/6I81HojjnOR7OOgG2/u37DFNhk/V/n6YpII4EU71sigl
xhRbTYY+FoYJt9B8MM5TCZf7jCzHYG/RkIxOokydXUJVAjNTpLCulh79mO7lSfE1fTAqLBaR+X6C
ZzlVP0qIPk5nIGXX8ggm6zK03vbK6vwaPBD229qw+Hq1lIfAmTB0LtQwxqLnHyqyaO7m7NN3gc2g
VEuJFZ4UOy4zSXUPftNt/YfIfVtUo1at3U6a0W0Mp2DY69+BZddt24UP3Jb+GtF5+uHh+StPi9T5
8wCgdfT1FcqiVL4De1dZG/QTgOdBAAKF9NHJ4e+JaK0g3SsBzAvKOcrmaIZNIL1QI2+qp8OTSPlY
msxyqHnfNoL6oykkaGXg/77zpAgiZkkfbnN/K2Dm8a7D+/H8PbZqCOIwWKH8mQQA/FF5V7ICv/op
T4YwIVoGnQLUB8HjFTltTih3UEdRMzs5M2+HtWRW9bnvojrdKxQ+NY756Yyph1oX8gAfI3R7MV1i
AzFXXk510PVTgDx3M21quT1snFsBiVJaG9M3M2x5leKU69tOXrf1vOkL1G7Yc5XctQrTO3Y3B5Cx
CoU=
=Qycj
-----END PGP SIGNATURE-----

--------------AOLZySXSGaZzUzUNqM0OyhfC--
