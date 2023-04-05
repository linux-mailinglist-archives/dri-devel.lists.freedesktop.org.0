Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D7D6D75D6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FAB10E880;
	Wed,  5 Apr 2023 07:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA62010E867;
 Wed,  5 Apr 2023 07:49:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51E12223E9;
 Wed,  5 Apr 2023 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680680967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydfamv56uwj8kgPZsnSrWK9GAECy28etXTDk58Y1WS8=;
 b=E6SPeLeaEYVDvS8FJi0H9gaa7q4P6Hc9u0q196MunJLJSIqE7snsN9vGRgJUy9ge1321K3
 eplNbSHOr9iQ4HV2SuwVqQTuI/trPpvyR547Lrvkpg+nmX2gbRU969ghB58pRL4Nzqr/Gy
 lym6bCJ03sxYSuqazdQvNMPiLP+BPbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680680967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydfamv56uwj8kgPZsnSrWK9GAECy28etXTDk58Y1WS8=;
 b=FvB5eeyam9FyLYBpPwXzgOVia1btDVsjqiEg8OLTI9PkxYYMTR8LOiZSIrV7e0b7UPSuY1
 a0yUWBlt6iJ6fGBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3186913A31;
 Wed,  5 Apr 2023 07:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7rBOCwcoLWT9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 07:49:27 +0000
Message-ID: <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
Date: Wed, 5 Apr 2023 09:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0a05GRMGE3OkpNvRiRswPT07"
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
--------------0a05GRMGE3OkpNvRiRswPT07
Content-Type: multipart/mixed; boundary="------------3koGnN6GDthHcwqq2T0TTGVN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230404201842.567344-1-daniel.vetter@ffwll.ch>

--------------3koGnN6GDthHcwqq2T0TTGVN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDQuMjMgdW0gMjI6MTggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBU
aGlzIG9uZSBudWtlcyBhbGwgZnJhbWVidWZmZXJzLCB3aGljaCBpcyBhIGJpdCBtdWNoLiBJ
biByZWFsaXR5DQo+IGdtYTUwMCBpcyBpZ3B1IGFuZCBuZXZlciBzaGlwcGVkIHdpdGggYW55
dGhpbmcgZGlzY3JldGUsIHNvIHRoZXJlIHNob3VsZA0KPiBub3QgYmUgYW55IGRpZmZlcmVu
Y2UuDQo+IA0KPiB2MjogVW5mb3J0dW5hdGVseSB0aGUgZnJhbWVidWZmZXIgc2l0cyBvdXRz
aWRlIG9mIHRoZSBwY2kgYmFycyBmb3INCj4gZ21hNTAwLCBhbmQgc28gb25seSB1c2luZyB0
aGUgcGNpIGhlbHBlcnMgd29uJ3QgYmUgZW5vdWdoLiBPdG9oIGlmIHdlDQo+IG9ubHkgdXNl
IG5vbi1wY2kgaGVscGVyLCB0aGVuIHdlIGRvbid0IGdldCB0aGUgdmdhIGhhbmRsaW5nLCBh
bmQNCj4gc3Vic2VxdWVudCByZWZhY3RvcmluZyB0byB1bnRhbmdsZSB0aGVzZSBzcGVjaWFs
IGNhc2VzIHdvbid0IHdvcmsuDQo+IA0KPiBJdCdzIG5vdCBwcmV0dHksIGJ1dCB0aGUgc2lt
cGxlc3QgZml4IChzaW5jZSBnbWE1MDAgcmVhbGx5IGlzIHRoZSBvbmx5DQo+IHF1aXJreSBw
Y2kgZHJpdmVyIGxpa2UgdGhpcyB3ZSBoYXZlKSBpcyB0byBqdXN0IGhhdmUgYm90aCBjYWxs
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPg0KPiBDYzogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29u
QGdtYWlsLmNvbT4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KPiBDYzogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jIHwgOSAr
KysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNi
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMNCj4gaW5kZXggMmNl
OTZiMWI5Yzc0Li5mMWUwZWVkOGZlYTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNi
X2Rydi5jDQo+IEBAIC00MjIsMTIgKzQyMiwxNyBAQCBzdGF0aWMgaW50IHBzYl9wY2lfcHJv
YmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICpl
bnQpDQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIFdlIGNhbm5vdCB5ZXQgZWFzaWx5IGZpbmQg
dGhlIGZyYW1lYnVmZmVyJ3MgbG9jYXRpb24gaW4gbWVtb3J5LiBTbw0KPiAtCSAqIHJlbW92
ZSBhbGwgZnJhbWVidWZmZXJzIGhlcmUuDQo+ICsJICogcmVtb3ZlIGFsbCBmcmFtZWJ1ZmZl
cnMgaGVyZS4gTm90ZSB0aGF0IHdlIHN0aWxsIHdhbnQgdGhlIHBjaSBzcGVjaWFsDQo+ICsJ
ICogaGFuZGxpbmcgdG8ga2ljayBvdXQgdmdhY29uLg0KPiAgIAkgKg0KPiAgIAkgKiBUT0RP
OiBSZWZhY3RvciBwc2JfZHJpdmVyX2xvYWQoKSB0byBtYXAgdmRjX3JlZyBlYXJsaWVyLiBU
aGVuIHdlDQo+ICAgCSAqICAgICAgIG1pZ2h0IGJlIGFibGUgdG8gcmVhZCB0aGUgZnJhbWVi
dWZmZXIgcmFuZ2UgZnJvbSB0aGUgZGV2aWNlLg0KPiAgIAkgKi8NCj4gLQlyZXQgPSBkcm1f
YXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyh0cnVlLCAmZHJpdmVyKTsNCj4gKwlyZXQg
PSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhmYWxzZSwgJmRyaXZlcik7DQo+
ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IGRybV9hcGVy
dHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycyhwZGV2LCAmZHJpdmVy
KTsNCg0KVGhpcyBzaW1wbHkgaXNuJ3QgaXQuIElmIHlvdSBoYXZlIHRvIHdvcmsgYXJvdW5k
IHlvdXIgb3duIEFQSSwgaXQncyB0aW1lIA0KdG8gcmV0aGluayB0aGUgQVBJLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCWlmIChyZXQpDQo+ICAgCQlyZXR1cm4gcmV0Ow0K
PiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------3koGnN6GDthHcwqq2T0TTGVN--

--------------0a05GRMGE3OkpNvRiRswPT07
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtKAYFAwAAAAAACgkQlh/E3EQov+Bv
ihAAkG1UG10F/QjhpKZI1l+ZX5QFGl8HUB6M358ex8+1aQQpNsCnhVqSP1f1WWJJ8s8m67xSRqru
DyCK9PgvEZENpBErKpozdxA77zYgAFNfufoyRFqU98+vyrRs3cj6ySGRo+mW4U1IikNI5OKDxc1W
PI6RNAhe7IY06k8hUE0XvQiq7yIO+EW4mvpEvn2bIJAPcmvFLEy2GwaCVOYN5eVYGqy9w699yqpv
A60ArkCKazUePuUf6aKnprzQzQ3EFayUHkiIGfH/5O5spXrqxJK02kORAJ+ka2ZlphEuFNPjK/0l
7Eny/u9yRHdQ8KTVv8DH2qvCsgWuXsrFiwJEziWfIvx06NhyYZl9buzIuObSd96n9RDQ1w901CIN
GPU/lI3ncqTWp9swBeA+sNFY3HZP9OfBH9tDlfCKHL/Z1//OQFR9cqKliIAvSMHH56JOCG30r4R1
PMIBnneaC4hiEe2FFg1P2Mago6Xfr3ugS6jz8e5aWODgj2SAQErFgLP639LHm1lGWFxup+5Q0mn1
+vXvUi6aeNWFFa1O4xW7V1aJ+vhU0WBMVhswYwySNfatbN7NAWFQLgp/AjNolsawO0YnkJ5XX/2E
5s6mSa/ADjrNcgrOtAcqbDyHSoM97dqKKOl4yp9T/61oJaJLqBI3GAD6a7t5m5qP3ub2eBRVXCfm
EGg=
=kZY5
-----END PGP SIGNATURE-----

--------------0a05GRMGE3OkpNvRiRswPT07--
