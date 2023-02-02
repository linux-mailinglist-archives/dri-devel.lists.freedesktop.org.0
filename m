Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5430687D3A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9F10E4F4;
	Thu,  2 Feb 2023 12:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0621910E1C7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 12:22:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9977022639;
 Thu,  2 Feb 2023 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675340522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aivKUktJCkxWeB29dIlDTVdQm51NKsnLDVHTNmxsiGY=;
 b=ePQ74wG8D0/Qlv2Jx/a1b3yEhspZbQ+yiuhiD07xzzAGP/dW3blxy9JZitlyzNGtdlJOVs
 vSHzFop3MVaoS2Xcy4+vHfCkX88c0056K7YUOKHkHJXAVI/M5duh9vGU7F2nvaZmJSK1Vt
 rSoXcAmTBj7lJIW3NaHgYLIxB93CjOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675340522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aivKUktJCkxWeB29dIlDTVdQm51NKsnLDVHTNmxsiGY=;
 b=IZ4AhQmDWdEqaHi4sYeY1NBI77trHlK5LcdzSS3HAXfe35ThuR4E+ru3Pg097+yAenOHLt
 I4JMGfLFG1Me3OAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BCA2139D0;
 Thu,  2 Feb 2023 12:22:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cI9ZHeqq22OwDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Feb 2023 12:22:02 +0000
Message-ID: <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
Date: Thu, 2 Feb 2023 13:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20230202110312.808607-1-maxime@cerno.tech>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230202110312.808607-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Jp0CwW0v0X7eDrHgSToPOshG"
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
--------------Jp0CwW0v0X7eDrHgSToPOshG
Content-Type: multipart/mixed; boundary="------------S7ibESX0hX8Ou9Oor0gJWvf1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
References: <20230202110312.808607-1-maxime@cerno.tech>
In-Reply-To: <20230202110312.808607-1-maxime@cerno.tech>

--------------S7ibESX0hX8Ou9Oor0gJWvf1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjMgdW0gMTI6MDMgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBD
b21taXQgOGZjMDM4MGY2YmE3ICgiZHJtL2NsaWVudDogQWRkIHNvbWUgdGVzdHMgZm9yDQo+
IGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGUoKSIpIHdhcyBtZWFudCB0byBpbnRy
b2R1Y2UgdW5pdCB0ZXN0cw0KPiBmb3IgdGhlIHN0YXRpYyBkcm1fY29ubmVjdG9yX3BpY2tf
Y21kbGluZV9tb2RlKCkgZnVuY3Rpb24uDQo+IA0KPiBJbiBzdWNoIGEgY2FzZSwgdGhlIGt1
bml0IGRvY3VtZW50YXRpb24gcmVjb21tZW5kZWQgdG8gaW1wb3J0IHRoZSB0ZXN0cw0KPiBz
b3VyY2UgZmlsZSBkaXJlY3RseSBmcm9tIHRoZSBzb3VyY2UgZmlsZSB3aXRoIHRoZSBzdGF0
aWMgZnVuY3Rpb24gdG8NCj4gdGVzdC4NCj4gDQo+IFdoaWxlIGl0IHdhcyB3b3JraW5nLCBp
dCdzIGdlbmVyYWxseSBmcm93bmVkIHVwb24uIEZvcnR1bmF0ZWx5LCBjb21taXQNCj4gOWM5
ODhmYWU2ZjZhICgia3VuaXQ6IGFkZCBtYWNybyB0byBhbGxvdyBjb25kaXRpb25hbGx5IGV4
cG9zaW5nIHN0YXRpYw0KPiBzeW1ib2xzIHRvIHRlc3RzIikgaW50cm9kdWNlZCBtYWNyb3Mg
dG8gZWFzaWx5IGRlYWwgd2l0aCB0aGF0IGNhc2UuIFdlDQo+IGNhbiB0aHVzIHJlbW92ZSBv
dXIgaW5jbHVkZSBhbmQgdXNlIHRob3NlIG1hY3JvcyBpbnN0ZWFkLg0KDQpJIGxpa2UgdGhh
dCB0aGlzIGluY2x1ZGUgc3RhdGVtZW50cyBpcyBnb2luZyBhd2F5LiBCdXQgY2hhbmdpbmcg
c3ltYm9sIA0KdmlzaWJpbGl0eSBmb3IgdGVzdHMgaXMgbGlrZXdpc2UgYXdrd2FyZC4NCg0K
TWF5YmUgaSdtIGFza2luIGd0b28gbWl1Y2ggZm9yIHRoaXMgc2ltcGxlIHBhdGNoLCBidXQg
Y2FuJ3Qgd2UgaGF2ZSBhIA0KaGVscGVyIG1hY3JvIHRoYXQgZ2VuZXJhdGVzIGFuIGV4cG9y
dGVkIHdyYXBwZXIgZm9yIEt1bml0IHRlc3RzPyANClNvbWV0aGluZyBsaWtlIHRoaXM6DQoN
CkVYUE9SVF9LVU5JVF9XUkFQUEVSKHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpcDQoJCQlk
cm1fY29ubmVjdG9yX3BpY2tfY21kbGluZV9tb2RlLA0KCQkJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3Rvcik7DQoNCndoaWNoIHRoZW4gZ2VuZXJhdGVzIHNvbWV0aGluZyBsaWtl
IHRoaXM6DQoNCnN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICogZHJtX2Nvbm5lY3Rvcl9waWNr
X2NtZGxpbmVfbW9kZV9rdW5pdCgNCglzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQ0Kew0KCXJldHVybiBkcm1fY29ubmVjdG9yX3BpY2tfY21kbGluZV9tb2RlKGNvbm5lY3Rv
cik7DQp9DQoNCkkga25vdyB0aGF0IHRoZSBtYWNybyBmb3IgZ2VuZXJhdGluZyB0aGlzIGNv
ZGUgaXMgbW9yZSBjb21wbGV4IHRoYW4gDQppbGx1c3RyYXRlZCBoZXJlLiBCdXQgdGhpcyBz
b2x1dGlvbiBzZXBhcmF0ZXMgS3VuaXQgYW5kIGZ1bmN0aW9ucyANCmNsZWFubHkuIFRoZSBz
dGF0aWMgZnVuY3Rpb25zIHRoYXQgYXJlIGV4cG9ydGVkIGZvciBLdW5pdCB0ZXN0aW5nIHN0
aWxsIA0KbmVlZCB0byBiZSBkZWNsYXJlZCBpbiBhIGhlYWRlciBmaWxlLiBUaGF0IGNvdWxk
IGFsc28gYmUgZG9uZSB2aWEgc3VjaCBhIA0KbWFjcm8uDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJu
by50ZWNoPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0
LmMgfCAxMSArKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9k
ZXNldC5jDQo+IGluZGV4IDFiMTJhM2MyMDFhMy4uZjQ4ODgyOTQxODUyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jDQo+IEBAIC04LDYgKzgsOSBAQA0K
PiAgICAqLw0KPiAgIA0KPiAgICNpbmNsdWRlICJkcm0vZHJtX21vZGVzZXRfbG9jay5oIg0K
PiArDQo+ICsjaW5jbHVkZSA8a3VuaXQvdmlzaWJpbGl0eS5oPg0KPiArDQo+ICAgI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPiAg
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+IEBAIC0xNTksNyArMTYyLDggQEAgZHJtX2Nv
bm5lY3Rvcl9oYXNfcHJlZmVycmVkX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwgaW50IHdpZHRoLCBpbnQNCj4gICAJcmV0dXJuIE5VTEw7DQo+ICAgfQ0KPiAgIA0K
PiAtc3RhdGljIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1fY29ubmVjdG9yX3BpY2tf
Y21kbGluZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICtWSVNJ
QkxFX0lGX0tVTklUIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICoNCj4gK2RybV9jb25uZWN0
b3JfcGlja19jbWRsaW5lX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikN
Cj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fY21kbGluZV9tb2RlICpjbWRsaW5lX21vZGU7DQo+
ICAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOw0KPiBAQCAtMjE1LDYgKzIxOSw3
IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX2Nvbm5lY3Rvcl9waWNr
X2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5lDQo+ICAgDQo+ICAgCXJldHVybiBOVUxM
Ow0KPiAgIH0NCj4gK0VYUE9SVF9TWU1CT0xfSUZfS1VOSVQoZHJtX2Nvbm5lY3Rvcl9waWNr
X2NtZGxpbmVfbW9kZSk7DQo+ICAgDQo+ICAgc3RhdGljIGJvb2wgZHJtX2Nvbm5lY3Rvcl9l
bmFibGVkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgc3RyaWN0KQ0K
PiAgIHsNCj4gQEAgLTEyMzMsNyArMTIzOCwzIEBAIGludCBkcm1fY2xpZW50X21vZGVzZXRf
ZHBtcyhzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgaW50IG1vZGUpDQo+ICAgCXJl
dHVybiByZXQ7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2NsaWVudF9tb2Rlc2V0
X2RwbXMpOw0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX0RSTV9LVU5JVF9URVNUDQo+IC0jaW5j
bHVkZSAidGVzdHMvZHJtX2NsaWVudF9tb2Rlc2V0X3Rlc3QuYyINCj4gLSNlbmRpZg0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------S7ibESX0hX8Ou9Oor0gJWvf1--

--------------Jp0CwW0v0X7eDrHgSToPOshG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPbqukFAwAAAAAACgkQlh/E3EQov+Ac
qw/+K7l1bRfiRZx59fAox5s8RiU/xnIpO0oiO9ktGeV6AD+VR3HwNoy0Z0Q55d3UakFLVBdXWq5Q
orDZlk8jCxY2RLCwR2+TjTx+8zM0X7nrRyEv9EKPR/eVNZABmO0luqYDL5DSLR8jdbqMwX9k8cTz
sLYs+RpeYZFfQhL6+GsffrV6gXGDDcXO0IewnK/ADexkU/oMDXYV1nihSoFcOnvUw6UUfeZeJ5wH
gA7M4VEQTWoPq4ypiANFGqyuknde3PI+GapwCZhKOH/ewsIc21DHpTWJEwYXslW6T4REC2HG8cxB
ZO2qTLbn9Vnszy/PdwtNeYetY6/L44+K8Q0qiHJ0k+SAdvMnr7F/FnIfYuvEEWIlEblhZzN+4FIR
TdSQVcLZGrtO05Qoh4aVnTzen8FBmf74Cs/8CUVm7rvWTFcwTWgEDhcdJp6r+irbu4WCXh5pA7fi
Ae4Ob9Ho8jDqY0rPf7zJmg10ITwuZ48JhC1ay4wdxU5dFTYVH4o07DMu6mYIRIFdqISXFPNRrUHU
uV2dinHt140tdgAI1jUwWu1eY+eeFZA0rFGOL8vEMTrKShqGHwVBkaACW33ciGbw5m4AKoSTMrFm
DuIjX8boL2arnfnyzj4aAN5Cyy0YHae65T8iLACQSOaspEUsAjMKNhJc/5/t2llf8rIXObWk5z+U
928=
=wdG+
-----END PGP SIGNATURE-----

--------------Jp0CwW0v0X7eDrHgSToPOshG--
