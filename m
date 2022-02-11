Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5704B21F3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B657110EA55;
	Fri, 11 Feb 2022 09:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F748845B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:29:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65C3B2112A;
 Fri, 11 Feb 2022 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644571759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvkfTxWGGl9qy4JhkCIa2NHKFJQQM3lSJHZLiQpisZ4=;
 b=i0ytZQeN9qnJ654C+xnaR7A/pVYAlv6H7expPk+opdn8SAcJ9hOXHRnn66qiia+CtqG6JK
 9k508C63EGcRjPFAqTSaPiZgl6/7/pySsCZdB9AcovLEqVKzOEmPPDYr9FVq/Sa+VOYHPq
 rrhnoAeFhYFj2o57YWeZtz5yaozpDIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644571759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvkfTxWGGl9qy4JhkCIa2NHKFJQQM3lSJHZLiQpisZ4=;
 b=SEBKeC8YP4ChqBabArbN7i84ZcmjJ2G92YiZoxny9WR5m0oSZEDCzBnf04/37Fg/4zp84l
 3fNUtHdWNfSaeACA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1120813BC3;
 Fri, 11 Feb 2022 09:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r6u1Am8sBmKKFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 09:29:19 +0000
Message-ID: <27d13ee0-4f3e-a6a1-53e8-fa5c632ca850@suse.de>
Date: Fri, 11 Feb 2022 10:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220211091927.2988283-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fQWSziTRLMDPgndmSuNHhk3Y"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fQWSziTRLMDPgndmSuNHhk3Y
Content-Type: multipart/mixed; boundary="------------ufT0KX2RwiI04ZN2VHCsigDT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <27d13ee0-4f3e-a6a1-53e8-fa5c632ca850@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
In-Reply-To: <20220211091927.2988283-2-javierm@redhat.com>

--------------ufT0KX2RwiI04ZN2VHCsigDT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjAyLjIyIHVtIDEwOjE5IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBQdWxsIHRoZSBwZXItbGluZSBjb252ZXJzaW9uIGxvZ2ljIGludG8gYSBzZXBh
cmF0ZSBoZWxwZXIgZnVuY3Rpb24uDQo+IA0KPiBUaGlzIHdpbGwgYWxsb3cgdG8gZG8gbGlu
ZS1ieS1saW5lIGNvbnZlcnNpb24gaW4gb3RoZXIgaGVscGVycyB0aGF0DQo+IGNvbnZlcnQg
dG8gYSBncmF5OCBmb3JtYXQuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiANCj4g
KG5vIGNoYW5nZXMgc2luY2UgdjMpDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIEFkZCBh
IGRybV9mYl94cmdiODg4OF90b19ncmF5OF9saW5lKCkgaGVscGVyIGZ1bmN0aW9uIChUaG9t
YXMgWmltbWVybWFubikNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmMgfCAzMSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+IGluZGV4IDBmMjhkZDJiZGQ3Mi4uYjk4
MTcxMjYyM2QzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9o
ZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0K
PiBAQCAtNDY0LDYgKzQ2NCwyMSBAQCB2b2lkIGRybV9mYl94cmdiODg4OF90b194cmdiMjEw
MTAxMF90b2lvKHZvaWQgX19pb21lbSAqZHN0LA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9M
KGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMF90b2lvKTsNCj4gICANCj4gK3N0YXRp
YyB2b2lkIGRybV9mYl94cmdiODg4OF90b19ncmF5OF9saW5lKHU4ICpkc3QsIGNvbnN0IHUz
MiAqc3JjLCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KPiArew0KPiArCXVuc2lnbmVkIGludCB4
Ow0KPiArDQo+ICsJZm9yICh4ID0gMDsgeCA8IHBpeGVsczsgeCsrKSB7DQo+ICsJCXU4IHIg
PSAoKnNyYyAmIDB4MDBmZjAwMDApID4+IDE2Ow0KPiArCQl1OCBnID0gKCpzcmMgJiAweDAw
MDBmZjAwKSA+PiA4Ow0KPiArCQl1OCBiID0gICpzcmMgJiAweDAwMDAwMGZmOw0KPiArDQo+
ICsJCS8qIElUVSBCVC42MDE6IFkgPSAwLjI5OSBSICsgMC41ODcgRyArIDAuMTE0IEIgKi8N
Cj4gKwkJKmRzdCsrID0gKDMgKiByICsgNiAqIGcgKyBiKSAvIDEwOw0KPiArCQlzcmMrKzsN
Cj4gKwl9DQo+ICt9DQo+ICsNCj4gICAvKioNCj4gICAgKiBkcm1fZmJfeHJnYjg4ODhfdG9f
Z3JheTggLSBDb252ZXJ0IFhSR0I4ODg4IHRvIGdyYXlzY2FsZQ0KPiAgICAqIEBkc3Q6IDgt
Yml0IGdyYXlzY2FsZSBkZXN0aW5hdGlvbiBidWZmZXINCj4gQEAgLTQ4NCw4ICs0OTksOSBA
QCBFWFBPUlRfU1lNQk9MKGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMF90b2lvKTsN
Cj4gICB2b2lkIGRybV9mYl94cmdiODg4OF90b19ncmF5OCh2b2lkICpkc3QsIHVuc2lnbmVk
IGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnZhZGRyLA0KPiAgIAkJCSAgICAgIGNvbnN0
IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNs
aXApDQo+ICAgew0KPiAtCXVuc2lnbmVkIGludCBsZW4gPSAoY2xpcC0+eDIgLSBjbGlwLT54
MSkgKiBzaXplb2YodTMyKTsNCj4gLQl1bnNpZ25lZCBpbnQgeCwgeTsNCj4gKwl1bnNpZ25l
ZCBpbnQgbGluZXBpeGVscyA9IGNsaXAtPngyIC0gY2xpcC0+eDE7DQo+ICsJdW5zaWduZWQg
aW50IGxlbiA9IGxpbmVwaXhlbHMgKiBzaXplb2YodTMyKTsNCj4gKwl1bnNpZ25lZCBpbnQg
eTsNCj4gICAJdm9pZCAqYnVmOw0KPiAgIAl1OCAqZHN0ODsNCj4gICAJdTMyICpzcmMzMjsN
Cj4gQEAgLTUwOCwxNiArNTI0LDcgQEAgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fZ3JheTgo
dm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICp2YWQNCj4g
ICAJZm9yICh5ID0gY2xpcC0+eTE7IHkgPCBjbGlwLT55MjsgeSsrKSB7DQo+ICAgCQlkc3Q4
ID0gZHN0Ow0KPiAgIAkJc3JjMzIgPSBtZW1jcHkoYnVmLCB2YWRkciwgbGVuKTsNCj4gLQkJ
Zm9yICh4ID0gY2xpcC0+eDE7IHggPCBjbGlwLT54MjsgeCsrKSB7DQo+IC0JCQl1OCByID0g
KCpzcmMzMiAmIDB4MDBmZjAwMDApID4+IDE2Ow0KPiAtCQkJdTggZyA9ICgqc3JjMzIgJiAw
eDAwMDBmZjAwKSA+PiA4Ow0KPiAtCQkJdTggYiA9ICAqc3JjMzIgJiAweDAwMDAwMGZmOw0K
PiAtDQo+IC0JCQkvKiBJVFUgQlQuNjAxOiBZID0gMC4yOTkgUiArIDAuNTg3IEcgKyAwLjEx
NCBCICovDQo+IC0JCQkqZHN0OCsrID0gKDMgKiByICsgNiAqIGcgKyBiKSAvIDEwOw0KPiAt
CQkJc3JjMzIrKzsNCj4gLQkJfQ0KPiAtDQo+ICsJCWRybV9mYl94cmdiODg4OF90b19ncmF5
OF9saW5lKGRzdDgsIHNyYzMyLCBsaW5lcGl4ZWxzKTsNCj4gICAJCXZhZGRyICs9IGZiLT5w
aXRjaGVzWzBdOw0KPiAgIAkJZHN0ICs9IGRzdF9waXRjaDsNCj4gICAJfQ0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------ufT0KX2RwiI04ZN2VHCsigDT--

--------------fQWSziTRLMDPgndmSuNHhk3Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIGLG4FAwAAAAAACgkQlh/E3EQov+CO
Vw//aT6T/5EwHB1SXQEB3oeYqfTN+zF+KBMmlWGyOvtbmTqwPVOZNVzeZzmSsLe6G4W9SmmZZrpy
lPuC0kTdYBZNmnnqGGW78ll4+Aj1aIyt93SmZ/F9t2Wpg2931xobuhrym17PUjy1BjVwfACEDAxI
M9xyJsG3ZI7cEc+u7HR/LvhrxSIkMXaUTMgLddRE02Mf71TfywyJ9Z6EmbmylJebps9sebd5RiT4
I2IfPyUmTJyuH22cvZIsEhr1VURd9twu6701ZHZ+/U770Sn7CqEWzloz4hBpwBhQd3sY7ByJdkaA
r7MVQShm4BohkRuYecMg2rnFYgjc08WQwwXbvjWIupFdcH+WEdYYOANWNVoEaGCOjXJdd7gUdlZq
aee7vdYRTlFnd/gpOYDCKW1VT0ayqfJqBG98udAVRhcMZ83sSpumFpGo994jWzmLvxRVTAhuMsve
NeiencGE+/8xC/e7JloaYW76oTZZPrSBcWTQeX7/X9hfBfM1WdxFNdxv9W3LiAkMptFGhdz+6Vcu
oxS5PEmynoLM/13DnpsF7YFqH0+7BoxMFWVz2P8hLaAP6E4HORRGhmr7R3ofSEo15g3/goRQlxO1
LaP4KZ5meLtsey5Wuzp2iZBeqyWMeJ/hgZ/NWHwOVwucalRfsmPTxAWSzrVA6D6KbOHDUYK1Bbr1
kUI=
=tKFY
-----END PGP SIGNATURE-----

--------------fQWSziTRLMDPgndmSuNHhk3Y--
