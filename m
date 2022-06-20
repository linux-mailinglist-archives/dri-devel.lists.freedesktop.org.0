Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D87D551651
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465011338D;
	Mon, 20 Jun 2022 10:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDDC11338C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:55:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EFF4D21AD7;
 Mon, 20 Jun 2022 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655722525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Okw4Wq1Wt8KnXfXpirMjOljagsvzRexf8BaaAR8hak=;
 b=DYpy0gS+Yp6pQGddarzXPKIOl38DWs7x4d4BGrsPaT0y1RDuK6B9MbkB7VgwqAlEn5clSa
 YDlPAkaxR6UkWI3wx857u75WLoQgj6/Wesii30b5ibbF2yY25BAgJ/nrjMfDR3bmoVHnGL
 lDAoVPTBLQNhbgnbRzYm3uwRAPyIQ/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655722525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Okw4Wq1Wt8KnXfXpirMjOljagsvzRexf8BaaAR8hak=;
 b=JyOdp5sYhTi3HGL2BYuN+u2rviJ6MKoca/s8SoQKltkOK8jMheR6SAQdDloL2D/xneXElg
 lfAUjrIQqAP6P5Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD84E13638;
 Mon, 20 Jun 2022 10:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id girIMB1SsGIkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 10:55:25 +0000
Message-ID: <f20aec33-93e9-d90d-2ae0-4c8c8bde70e7@suse.de>
Date: Mon, 20 Jun 2022 12:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 32/64] drm/vc4: dsi: Fix the driver structure lifetime
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-33-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-33-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N8k0340X1Q9VnooYu0aeOXds"
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
--------------N8k0340X1Q9VnooYu0aeOXds
Content-Type: multipart/mixed; boundary="------------2FeS2viCWnWHMNGX1NanIpS7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <f20aec33-93e9-d90d-2ae0-4c8c8bde70e7@suse.de>
Subject: Re: [PATCH 32/64] drm/vc4: dsi: Fix the driver structure lifetime
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-33-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-33-maxime@cerno.tech>

--------------2FeS2viCWnWHMNGX1NanIpS7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA2LjIyIHVtIDExOjI4IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gVGhl
IHZjNF9kc2kgc3RydWN0dXJlIGlzIGN1cnJlbnRseSBhbGxvY2F0ZWQgdGhyb3VnaCBhIGRl
dmljZS1tYW5hZ2VkDQo+IGFsbG9jYXRpb24uIFRoaXMgY2FuIGxlYWQgdG8gdXNlLWFmdGVy
LWZyZWUgaXNzdWVzIGhvd2V2ZXIgaW4gdGhlIHVuYmluZGluZw0KPiBwYXRoIHNpbmNlIHRo
ZSBEUk0gZW50aXRpZXMgd2lsbCBzdGljayBhcm91bmQsIGJ1dCB0aGUgdW5kZXJseWluZyBz
dHJ1Y3R1cmUNCj4gaGFzIGJlZW4gZnJlZWQuDQo+IA0KPiBIb3dldmVyLCB3ZSBjYW4ndCBq
dXN0IGZpeCBpdCBieSB1c2luZyBhIERSTS1tYW5hZ2VkIGFsbG9jYXRpb24gbGlrZSB3ZSBk
aWQNCj4gZm9yIHRoZSBvdGhlciBkcml2ZXJzIHNpbmNlIHRoZSBEU0kgY2FzZSBpcyBhIGJp
dCBtb3JlIGludHJpY2F0ZS4NCj4gDQo+IEluZGVlZCwgdGhlIHN0cnVjdHVyZSB3aWxsIGJl
IGFsbG9jYXRlZCBhdCBwcm9iZSB0aW1lLCB3aGVuIHdlIGRvbid0IGhhdmUgYQ0KPiBEUk0g
ZGV2aWNlIHlldCwgdG8gYmUgYWJsZSB0byByZWdpc3RlciB0aGUgRFNJIGJ1cyBkcml2ZXIu
IFdlIHdpbGwgdGhlbg0KPiByZXVzZSBpdCBhdCBiaW5kIHRpbWUgdG8gcmVnaXN0ZXIgb3Vy
IEtNUyBlbnRpdGllcyBpbiB0aGUgZnJhbWV3b3JrLg0KPiANCj4gSW4gb3JkZXIgdG8gd29y
ayBhcm91bmQgYm90aCBjb25zdHJhaW50cywgd2UgY2FuIHVzZSBhIGtyZWYgdG8gdHJhY2sg
dGhlDQo+IHVzZXJzIG9mIHRoZSBzdHJ1Y3R1cmUgKERTSSBob3N0LCBhbmQgS01TKSwgYW5k
IHRoZW4gcHV0IG91ciBzdHJ1Y3R1cmUgd2hlbg0KPiB0aGUgRFNJIGhvc3Qgd2lsbCBoYXZl
IGJlZW4gdW5yZWdpc3RlcmVkLCBhbmQgdGhyb3VnaCBhIERSTS1tYW5hZ2VkIGFjdGlvbg0K
PiB0aGF0IHdpbGwgZXhlY3V0ZSBvbmNlIHdlIHdvbid0IG5lZWQgdGhlIEtNUyBlbnRpdGll
cyBhbnltb3JlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
QGNlcm5vLnRlY2g+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5j
IHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfZHNpLmMNCj4gaW5kZXggMTA1MzNhMmE0MWIzLi4yODI1MzdmMjdiOGUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2RzaS5jDQo+IEBAIC01MTAsNiArNTEwLDggQEAgc3RydWN0IHZj
NF9kc2kgew0KPiAgIAlzdHJ1Y3QgdmM0X2VuY29kZXIgZW5jb2RlcjsNCj4gICAJc3RydWN0
IG1pcGlfZHNpX2hvc3QgZHNpX2hvc3Q7DQo+ICAgDQo+ICsJc3RydWN0IGtyZWYga3JlZjsN
Cj4gKw0KPiAgIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KPiAgIA0KPiAgIAlz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlOw0KPiBAQCAtMTQ3OSw2ICsxNDgxLDE1IEBAIHZj
NF9kc2lfaW5pdF9waHlfY2xvY2tzKHN0cnVjdCB2YzRfZHNpICpkc2kpDQo+ICAgCQkJCSAg
ICAgIGRzaS0+Y2xrX29uZWNlbGwpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIHZj
NF9kc2lfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZik7DQo+ICsNCj4gK3N0YXRpYyB2b2lk
IHZjNF9kc2lfcHV0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKnB0cikNCj4gK3sN
Cj4gKwlzdHJ1Y3QgdmM0X2RzaSAqZHNpID0gcHRyOw0KPiArDQo+ICsJa3JlZl9wdXQoJmRz
aS0+a3JlZiwgJnZjNF9kc2lfcmVsZWFzZSk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50
IHZjNF9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rl
ciwgdm9pZCAqZGF0YSkNCj4gICB7DQo+ICAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsNCj4gQEAgLTE0ODgsNiArMTQ5OSwxMiBA
QCBzdGF0aWMgaW50IHZjNF9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkNCj4gICAJZG1hX2NhcF9tYXNrX3QgZG1hX21h
c2s7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICsJa3JlZl9nZXQoJmRzaS0+a3JlZik7DQo+
ICsNCj4gKwlyZXQgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoZHJtLCB2YzRfZHNpX3B1
dCwgZHNpKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICAgCWRz
aS0+dmFyaWFudCA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiAgIA0KPiAg
IAlJTklUX0xJU1RfSEVBRCgmZHNpLT5icmlkZ2VfY2hhaW4pOw0KPiBAQCAtMTY0MiwxNiAr
MTY1OSwyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9vcHMgdmM0X2RzaV9v
cHMgPSB7DQo+ICAgCS51bmJpbmQgPSB2YzRfZHNpX3VuYmluZCwNCj4gICB9Ow0KPiAgIA0K
PiArc3RhdGljIHZvaWQgdmM0X2RzaV9yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQ0KPiAr
ew0KPiArCXN0cnVjdCB2YzRfZHNpICpkc2kgPQ0KPiArCQljb250YWluZXJfb2Yoa3JlZiwg
c3RydWN0IHZjNF9kc2ksIGtyZWYpOw0KPiArDQo+ICsJa2ZyZWUoZHNpKTsNCj4gK30NCj4g
Kw0KPiAgIHN0YXRpYyBpbnQgdmM0X2RzaV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gICB7DQo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5k
ZXY7DQo+ICAgCXN0cnVjdCB2YzRfZHNpICpkc2k7DQo+ICAgDQo+IC0JZHNpID0gZGV2bV9r
emFsbG9jKGRldiwgc2l6ZW9mKCpkc2kpLCBHRlBfS0VSTkVMKTsNCj4gKwlkc2kgPSBremFs
bG9jKHNpemVvZigqZHNpKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICghZHNpKQ0KPiAgIAkJ
cmV0dXJuIC1FTk9NRU07DQo+ICAgCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRzaSk7DQo+ICAg
DQo+ICsJa3JlZl9pbml0KCZkc2ktPmtyZWYpOw0KPiAgIAlkc2ktPnBkZXYgPSBwZGV2Ow0K
PiAgIAlkc2ktPmRzaV9ob3N0Lm9wcyA9ICZ2YzRfZHNpX2hvc3Rfb3BzOw0KPiAgIAlkc2kt
PmRzaV9ob3N0LmRldiA9IGRldjsNCj4gQEAgLTE2NjYsNiArMTY5Miw3IEBAIHN0YXRpYyBp
bnQgdmM0X2RzaV9kZXZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICAgCXN0cnVjdCB2YzRfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gICAN
Cj4gICAJbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9ob3N0KTsNCj4gKwlr
cmVmX3B1dCgmZHNpLT5rcmVmLCAmdmM0X2RzaV9yZWxlYXNlKTsNCg0KTWF5YmUgdmM0X2Rz
aV9wdXQoKSA/DQoNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------2FeS2viCWnWHMNGX1NanIpS7--

--------------N8k0340X1Q9VnooYu0aeOXds
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwUh0FAwAAAAAACgkQlh/E3EQov+CW
/Q/+I/PkBMV0YfZw5SbPU2Yg0l8OUvvJppy+zpKiNzZTBR7CXzr5e+yUiwegf9J+ugrc62Luo25v
SyBN6e1ZCMjgQ7LiBJzuaE/D0y7bFuxRFcgsRRUm0O4FdQlohmBytKmf8BB0P+Rd/nqjgi8fYfW/
rzlZtiee4wCuah+V8P+AZP7Lhyeo6HAHya/rbShiI0kjwewvwvZhoyHdbfiFk0PCY5ZPZwD1bAVN
t0bz9OyA44nWIyUNqj05Q1bH4WwKTiTGINSs1kiXXCDj3PVDYH8irBBEIHsuURXh2fTc3H5zQTo0
o+cEqTXs6yCMUBIPu6VN/0HcUeW8Bu8w6QgoU9ECxZGRzCrgBIcjA+M2nRkqMAb4HycV3+SljX7J
eaVQK2MeUFq1dc2j6A3yDmuRE+ILwiJd+aZ1woPx9Mk33gPgBFXGvxDgriujKqBjpsdJtPdH6fGZ
+c+j6kvEQjx/eROquml/n3L3s4p40LOu1CdI63xlvtruAwJoTFcMKNY880IAlRLK//cNrp6heNvk
By9dYvyQQRgvdHFbOtjq52RAYv0LlfOie1P0gSsdlMOVgpcamKp8EtI1jWesN7E87Qa/cJ+dgaef
nNqtinptJ9JDxIfCon1JIJi7VhuBvzD55zkv29EhtqHxdL+CXPlQe987whaZvns1pDeXVoopxbd/
kuY=
=UsqT
-----END PGP SIGNATURE-----

--------------N8k0340X1Q9VnooYu0aeOXds--
