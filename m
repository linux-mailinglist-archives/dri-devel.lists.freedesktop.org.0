Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05883644075
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 10:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733F710E013;
	Tue,  6 Dec 2022 09:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1463D10E013
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 09:52:32 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F22421C2C;
 Tue,  6 Dec 2022 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670320350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7Dn6UT7jVflO53hPVdqEHAf+UEuhC24fEP0CYlmrBo=;
 b=UGThJCHIvt4gmr7gOqfEI71Bj1wUwVEnY+6oVlf3FiMjJ195PviRYtiN0SM2UvLgCCs+4Z
 nIzAscpCshUP45mUDi8fwWfyAFXt6sf9U1GeGFdTvw0mZZt2Jq1D/I1UpwVk7Pvd/FInz3
 m1VoK2A8XWEd/lKR+94n2o7UQjqYWvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670320350;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7Dn6UT7jVflO53hPVdqEHAf+UEuhC24fEP0CYlmrBo=;
 b=GDyopmm9SUcw7fgf03rrKaB+UItKHchNIv0ZGR8tq6BfCRU1JRzzYPSArx9P7cEfLsW/LZ
 1NzwKWADTEXs4GAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6061413326;
 Tue,  6 Dec 2022 09:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id srOrFt4Qj2O0GgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Dec 2022 09:52:30 +0000
Message-ID: <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
Date: Tue, 6 Dec 2022 10:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
Content-Language: en-US
To: neil.armstrong@linaro.org, Carlo Caione <ccaione@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
 <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SEO4ZkEGGScUgy32BleGjVla"
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SEO4ZkEGGScUgy32BleGjVla
Content-Type: multipart/mixed; boundary="------------pCTPooQV0m10lXNIDNpaW0YE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: neil.armstrong@linaro.org, Carlo Caione <ccaione@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
 <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
In-Reply-To: <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>

--------------pCTPooQV0m10lXNIDNpaW0YE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjIgdW0gMTA6NDEgc2NocmllYiBOZWlsIEFybXN0cm9uZzoNCj4g
SGkgQ2FybG8sDQo+IA0KPiBPbiAwNi8xMi8yMDIyIDA5OjM0LCBDYXJsbyBDYWlvbmUgd3Jv
dGU6DQo+PiBGb3IgcGxhdGZvcm1zIHVzaW5nIHNpbXBsZWZiIC8gZWZpZmIsIGNhbGwNCj4+
IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCkgdG8gcmVtb3ZlIHRoZSBjb25m
bGljdGluZw0KPj4gZnJhbWVidWZmZXIuDQo+IA0KPiBDb25mbGljdGluZyBmcmFtZWJ1ZmZl
ciBvbiB0aGUgU1BJIGRpc3BsYXkgPyBIb3cgaXMgdGhhdCBwb3NzaWJsZSA/DQoNCkNhbGxp
bmcgZHJtX2FwZXJ0dXJlX3JlbW92ZV9mcmFtZWJ1ZmZlcnMoKSBpcyBvbmx5IHJlcXVpcmVk
IGlmIHRoZSANCmdyYXBoaWNzIGNhcmQgbWF5IGhhdmUgYmVlbiBwcmUtaW5pdGlhbGl6ZWQg
YnkgdGhlIHN5c3RlbSwgc3VjaCBhcyBhIA0KVkdBLWNvbXBhdGlibGUgY2FyZCBvbiBhIFBD
Lg0KDQpDb3VsZCB0aGUgU1BJIGRpc3BsYXkgaGF2ZSBiZWVuIGluaXRpYWxpemVkIGJ5IHRo
ZSBmaXJtd2FyZT8gSWYgbm90LCB0aGUgDQpjYWxsIHNob3VsZCBiZSBsZWZ0IG91dC4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhlIG1lc29uX2RybSBzaG91bGQgYWxy
ZWFkeSBkbyB0aGlzLCBubyA/DQo+IA0KPiBOZWlsDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IENhcmxvIENhaW9uZSA8Y2NhaW9uZUBiYXlsaWJyZS5jb20+DQo+PiAtLS0NCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS90aW55L2lsaTk0ODYuYyB8IDUgKysrKysNCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RpbnkvaWxpOTQ4Ni5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9p
bGk5NDg2LmMNCj4+IGluZGV4IDE0YTllNmFkMmQxNS4uNmZkNGQ0MjQzN2ZkIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTQ4Ni5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGlueS9pbGk5NDg2LmMNCj4+IEBAIC0xNCw2ICsxNCw3IEBADQo+PiDC
oCAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+DQo+PiArI2luY2x1ZGUgPGRybS9k
cm1fYXBlcnR1cmUuaD4NCj4+IMKgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4NCj4+IMKgICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPg0KPj4gwqAgI2luY2x1ZGUgPGRy
bS9kcm1fZmJfaGVscGVyLmg+DQo+PiBAQCAtMjM4LDYgKzIzOSwxMCBAQCBzdGF0aWMgaW50
IGlsaTk0ODZfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4+IMKgwqDCoMKgwqAg
aWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gK8KgwqDC
oCByZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhmYWxzZSwgJmlsaTk0
ODZfZHJpdmVyKTsNCj4+ICvCoMKgwqAgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Ow0KPj4gKw0KPj4gwqDCoMKgwqDCoCBkcm1fbW9kZV9jb25maWdfcmVzZXQo
ZHJtKTsNCj4+IMKgwqDCoMKgwqAgcmV0ID0gZHJtX2Rldl9yZWdpc3Rlcihkcm0sIDApOw0K
Pj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------pCTPooQV0m10lXNIDNpaW0YE--

--------------SEO4ZkEGGScUgy32BleGjVla
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOPEN0FAwAAAAAACgkQlh/E3EQov+Ay
DRAAqZNThRPO9KC+zdLqJvMZthooj1R1FF4CuBtG0gVkrjf5E80dRyNt+uaGBt9uXB7B0AekaQiz
SO7VHZ6g3gz6hLbY8tgFZz0su0Xqke+T14bdQ0CjIPphmw1CD2sZK8lfkl5DwW05QdimehLOG5L9
X/Fo3F64NGrVyY9iR6LmcdGX7G/ujueO5cciTeWvnvkLXq4xaH+UbSSg7dfQRm4PnN+tbfSIdg9u
RZFNNjFLp1Tiunh6OlCzgBhdGELdHBPDtz/punSwr53XMsaufe5rTWvxs/336UXtSo7KmCPLvpob
LlZaBV7ImE1cCKKAkGQw8lHICFv+vipqGdE57qh7OMmEchycOgqygKdkLySjSvCRYY7AfGDNqVK+
N5UpxIfTuvY45/IcDGLeCXj5rBoNgxEFqbr7224XotWsEwiHoH8376pM1EPT4yZD9aqmzApIB68S
+AVNX8qwcBKasmPfi+cEjlw9R7nLey6EL0nWEjoMorCaIu9nIfFjdhXhyoklJAA/FQK6sp5Twe+8
+dbt/26dM+ZprMFaPCGrsmiBzglCvLeFMADASpcnqRbKpa3i6ZTFD+2gz/b2QOV1yoA8lXUw4Mfn
XkE3h19o7WYq0ogSoy8l/EFkcZQlxtsGRHIgNcfWTySomdSb/pM1hbHEP1lLsk2AWamLu7iDJA5Q
QWM=
=sUgH
-----END PGP SIGNATURE-----

--------------SEO4ZkEGGScUgy32BleGjVla--
