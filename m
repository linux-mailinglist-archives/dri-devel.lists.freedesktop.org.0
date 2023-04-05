Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD576D7653
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAE310E868;
	Wed,  5 Apr 2023 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4E010E868;
 Wed,  5 Apr 2023 08:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF9062288F;
 Wed,  5 Apr 2023 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680682074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8fZEnvBG/mcR/mOca4+aEiu6Dj6/WZaI6ETmEv44Ks=;
 b=k4mcS9tdSgdx275+DY/fpBAo4Q7y3FoPpqnnHJvrEiD614F1bJQzJATRhdFBDbazWsUF4z
 khkl1Ar4TniS0Hs4CK1gJv+5Oc2OwmdluE81+Ggc6b8ebK2xiwSVvLojEj5kXhHxbOYNZ4
 CtpAkz3YsYRLNcR1/nKpy/ctYfO+so8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680682074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8fZEnvBG/mcR/mOca4+aEiu6Dj6/WZaI6ETmEv44Ks=;
 b=n6eo/Lm+gTBVGhzsCm2K0KgaNAXsF5McwVlcwwcI+g25g9hE7xLGTVIwXiTK3jYs0PKvIo
 gwnQNgidGV22NpDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D070A13A10;
 Wed,  5 Apr 2023 08:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EvDzMVosLWTaNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 08:07:54 +0000
Message-ID: <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
Date: Wed, 5 Apr 2023 10:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
In-Reply-To: <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Od0r0Z6F0rRD0laA1EP1BvzX"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Od0r0Z6F0rRD0laA1EP1BvzX
Content-Type: multipart/mixed; boundary="------------sWQZMNvGet9b6O0LeWhd1TIO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
In-Reply-To: <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>

--------------sWQZMNvGet9b6O0LeWhd1TIO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDQuMjMgdW0gMDk6NDkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDA0LjA0LjIzIHVtIDIyOjE4IHNjaHJpZWIgRGFuaWVsIFZldHRl
cjoNCj4+IFRoaXMgb25lIG51a2VzIGFsbCBmcmFtZWJ1ZmZlcnMsIHdoaWNoIGlzIGEgYml0
IG11Y2guIEluIHJlYWxpdHkNCj4+IGdtYTUwMCBpcyBpZ3B1IGFuZCBuZXZlciBzaGlwcGVk
IHdpdGggYW55dGhpbmcgZGlzY3JldGUsIHNvIHRoZXJlIHNob3VsZA0KPj4gbm90IGJlIGFu
eSBkaWZmZXJlbmNlLg0KPj4NCj4+IHYyOiBVbmZvcnR1bmF0ZWx5IHRoZSBmcmFtZWJ1ZmZl
ciBzaXRzIG91dHNpZGUgb2YgdGhlIHBjaSBiYXJzIGZvcg0KPj4gZ21hNTAwLCBhbmQgc28g
b25seSB1c2luZyB0aGUgcGNpIGhlbHBlcnMgd29uJ3QgYmUgZW5vdWdoLiBPdG9oIGlmIHdl
DQo+PiBvbmx5IHVzZSBub24tcGNpIGhlbHBlciwgdGhlbiB3ZSBkb24ndCBnZXQgdGhlIHZn
YSBoYW5kbGluZywgYW5kDQo+PiBzdWJzZXF1ZW50IHJlZmFjdG9yaW5nIHRvIHVudGFuZ2xl
IHRoZXNlIHNwZWNpYWwgY2FzZXMgd29uJ3Qgd29yay4NCj4+DQo+PiBJdCdzIG5vdCBwcmV0
dHksIGJ1dCB0aGUgc2ltcGxlc3QgZml4IChzaW5jZSBnbWE1MDAgcmVhbGx5IGlzIHRoZSBv
bmx5DQo+PiBxdWlya3kgcGNpIGRyaXZlciBsaWtlIHRoaXMgd2UgaGF2ZSkgaXMgdG8ganVz
dCBoYXZlIGJvdGggY2FsbHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+PiBDYzogUGF0cmlrIEpha29ic3NvbiA8
cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4NCj4+IENjOiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9wc2JfZHJ2LmMgfCA5ICsrKysrKystLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2Rydi5jDQo+PiBpbmRleCAyY2U5NmIxYjljNzQuLmYxZTBlZWQ4ZmVh
NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYw0KPj4gQEAgLTQyMiwx
MiArNDIyLDE3IEBAIHN0YXRpYyBpbnQgcHNiX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgDQo+PiBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPj4gwqDCoMKg
wqDCoCAvKg0KPj4gwqDCoMKgwqDCoMKgICogV2UgY2Fubm90IHlldCBlYXNpbHkgZmluZCB0
aGUgZnJhbWVidWZmZXIncyBsb2NhdGlvbiBpbiANCj4+IG1lbW9yeS4gU28NCj4+IC3CoMKg
wqDCoCAqIHJlbW92ZSBhbGwgZnJhbWVidWZmZXJzIGhlcmUuDQo+PiArwqDCoMKgwqAgKiBy
ZW1vdmUgYWxsIGZyYW1lYnVmZmVycyBoZXJlLiBOb3RlIHRoYXQgd2Ugc3RpbGwgd2FudCB0
aGUgcGNpIA0KPj4gc3BlY2lhbA0KPj4gK8KgwqDCoMKgICogaGFuZGxpbmcgdG8ga2ljayBv
dXQgdmdhY29uLg0KPj4gwqDCoMKgwqDCoMKgICoNCj4+IMKgwqDCoMKgwqDCoCAqIFRPRE86
IFJlZmFjdG9yIHBzYl9kcml2ZXJfbG9hZCgpIHRvIG1hcCB2ZGNfcmVnIGVhcmxpZXIuIFRo
ZW4gd2UNCj4+IMKgwqDCoMKgwqDCoCAqwqDCoMKgwqDCoMKgIG1pZ2h0IGJlIGFibGUgdG8g
cmVhZCB0aGUgZnJhbWVidWZmZXIgcmFuZ2UgZnJvbSB0aGUgDQo+PiBkZXZpY2UuDQo+PiDC
oMKgwqDCoMKgwqAgKi8NCj4+IC3CoMKgwqAgcmV0ID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9m
cmFtZWJ1ZmZlcnModHJ1ZSwgJmRyaXZlcik7DQo+PiArwqDCoMKgIHJldCA9IGRybV9hcGVy
dHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKGZhbHNlLCAmZHJpdmVyKTsNCj4+ICvCoMKgwqAg
aWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gKw0KPj4gK8Kg
wqDCoCByZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1
ZmZlcnMocGRldiwgDQo+PiAmZHJpdmVyKTsNCj4gDQo+IFRoaXMgc2ltcGx5IGlzbid0IGl0
LiBJZiB5b3UgaGF2ZSB0byB3b3JrIGFyb3VuZCB5b3VyIG93biBBUEksIGl0J3MgdGltZSAN
Cj4gdG8gcmV0aGluayB0aGUgQVBJLg0KDQpIZXJlJ3MgYSBwcm9wb3NhbDoNCg0KICAxKSBB
cyB5b3UncmUgY2hhbmdpbmcgYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMo
KSBhbnl3YXksIA0KcmVuYW1lIGl0IHRvIGFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19k
ZXZpY2VzX2F0KCksIHNvIGl0J3MgY2xlYXIgDQp0aGF0IGl0IHRha2VzIGEgbWVtb3J5IHJh
bmdlLg0KDQogIDIpIEludHJvZHVjZSBhcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNp
X2RldmljZXNfYXQoKSwgd2hpY2ggdGFrZXMgDQphIFBDSSBkZXZpY2UgYW5kIGEgbWVtb3J5
IHJhbmdlLiBJdCBzaG91bGQgZG8gdGhlIGlzX3ByaW1hcnkgYW5kIHZnYWNvbiANCnN0dWZm
LCBidXQga2ljayBvdXQgdGhlIHJhbmdlLg0KDQogIDMpIENhbGwgYXBlcnR1cmVfcmVtb3Zl
X2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzX2F0KCkgZnJvbSBnbWE1MDAgd2l0aCANCnRoZSBm
dWxsIHJhbmdlLiBFdmVuIGlmIHdlIGNhbiByZXN0cnVjdHVyZSBnbWE1MDAgdG8gZGV0ZWN0
IHRoZSBmaXJtd2FyZSANCmZyYW1lYnVmZmVyIGZyb20gaXRzIHJlZ2lzdGVycyAodGhlcmUn
cyB0aGlzIFRPRE8gaXRlbSksIHdlJ2Qgc3RpbGwgbmVlZCANCmFwZXJ0dXJlX3JlbW92ZV9j
b25mbGljdGluZ19wY2lfZGV2aWNlc19hdCgpIHRvIGRvIHNvbWV0aGluZyB1c2VmdWwgd2l0
aCBpdC4NCg0KICA0KSBXaXRoIHRoYXQsIGFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19k
ZXZpY2VzX2F0KCkgY2FuIGRyb3AgdGhlIA0KcHJpbWFyeSBhcmd1bWVudC4NCg0KT2YgY291
cnNlLCB0aGUgRFJNLXJlbGF0ZWQgaW50ZXJmYWNlIHNob3VsZCBiZSBhZGFwdGVkIGFzIHdl
bGwuIFRoZXJlJ3MgDQphIGJpdCBvZiBvdmVybGFwIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiBib3RoIFBDSSBhcGVydHVyZSBoZWxwZXJzLCBidXQgDQp0aGUgb3ZlcmFsbCBpbnRlcmZh
Y2UgaXMgY2xlYXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVn
YXJkcw0KPiBUaG9tYXMNCj4gDQo+PiDCoMKgwqDCoMKgIGlmIChyZXQpDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------sWQZMNvGet9b6O0LeWhd1TIO--

--------------Od0r0Z6F0rRD0laA1EP1BvzX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtLFoFAwAAAAAACgkQlh/E3EQov+Ah
AA//XYhIoxeiE4lVqrfaUiA+DkKBjIZHWQDrDzorCZ/kek66IkRlA1Ev4Fu3gQSGXF6GFcdukniT
QUWCrd60WbgzPRaxHc5WxDZkRjD0aVBemkpRVskkv8VeS5WsNzHOHHSQRprhQBQdwluH/Ag8Kmv1
OCumVWu2rPm654FI2K1AZplmCYkGvqcNkRi/cpdZZ6ReUmGcFAIk2YTvIsD3LGnh0KRWPLJWxmxH
1i0QEL4dxa6kGIURrp6+zBsk91J1qY/O5PX7N/wB9Qon6SkTTTLPQEJa824d/jFZiapYo8Liv3EW
W5EzjZxcQUSJYudbOAgUUjpoUPzEEXRquW5cjAcdrYuwQdLrXNPpxhNLcvcsfY9MgdjJZCsCrh3h
jIUhTTl5DG3bnzdqiF1sL7X4YMNL2IU9C5HTBh+2b3FBojS1cRut5Uq+AP44EZpbEXdEdJ37jisU
v4DOaRhYW0IJ9fofnRaAsdYLpxukRWOV68ouHskCN4AOkssEpKsnaZVEVCDs5M8WHjVbHeHPELVm
ptG9v7LYEnLDwE8GNhaiairKfIvsFq6RIzfahtnQ/ASg8H5Fi8isT7RKo59JqDYWRxKhaGlBAULQ
fotk9vxJsJBNyPCqgK2rjQHnbfxmUBH/wQ+FBObyGQG7R3kKuJ7Vuk/bRfoO1G2bby3JQwHAj/M+
+EY=
=woH9
-----END PGP SIGNATURE-----

--------------Od0r0Z6F0rRD0laA1EP1BvzX--
