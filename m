Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5033E4C02ED
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 21:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F54010E415;
	Tue, 22 Feb 2022 20:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06E10E415;
 Tue, 22 Feb 2022 20:17:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63475212BD;
 Tue, 22 Feb 2022 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645561034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ko8a0kgKzb1ejVoVYy/oirEXyPWddkA145wKlShMsBI=;
 b=uiDVM7yWKeNH5rtLXV2dWLMJhHrkitP4nAN9Ei+JF/eYSYQirc0yJPbmIwa6OneDWUyeSH
 1j3l2T53pz7Y5HRsd9wvHHYF5Oub8DBNOKsAAbtQbrSJwnYykXicpBF7TIZNzsgNBMzJWO
 bVgzLPxjJB1WvFI/6GSxtslB2Gtaz5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645561034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ko8a0kgKzb1ejVoVYy/oirEXyPWddkA145wKlShMsBI=;
 b=NY4s1c9DSSm7RsdVI/CGbiupoAvU9Ottlp8q7Hj4kNXEtWnpbOpL1mhCz/N1rc8Bwu6yNH
 R8qhleAVYlPrSiCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24C0A13C2F;
 Tue, 22 Feb 2022 20:17:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFXKB8pEFWLNIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Feb 2022 20:17:14 +0000
Message-ID: <66c26d95-cca6-63ca-2bdd-d90dd0a5228e@suse.de>
Date: Tue, 22 Feb 2022 21:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
References: <456a23c6-7324-7543-0c45-751f30ef83f7@linux.intel.com>
 <CAPM=9twqNAQ0+O40SPJOZk=RHkBo5sdHUSWdbaga25Xh8gLs3A@mail.gmail.com>
 <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KV0stUvUOS8h0RBuImHA6OFE"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KV0stUvUOS8h0RBuImHA6OFE
Content-Type: multipart/mixed; boundary="------------lcYD2pDaCDpYrghOjqcuLr3Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "DRM maintainer tools announcements, discussion, and development"
 <dim-tools@lists.freedesktop.org>
Message-ID: <66c26d95-cca6-63ca-2bdd-d90dd0a5228e@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <456a23c6-7324-7543-0c45-751f30ef83f7@linux.intel.com>
 <CAPM=9twqNAQ0+O40SPJOZk=RHkBo5sdHUSWdbaga25Xh8gLs3A@mail.gmail.com>
 <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
In-Reply-To: <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>

--------------lcYD2pDaCDpYrghOjqcuLr3Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjIgdW0gMDk6MTcgc2NocmllYiBNYWFydGVuIExhbmtob3JzdDoN
Cj4gT3AgMDEtMDItMjAyMiBvbSAwNzozOCBzY2hyZWVmIERhdmUgQWlybGllOg0KPj4gT24g
VGh1LCAyNyBKYW4gMjAyMiBhdCAyMTo1NywgTWFhcnRlbiBMYW5raG9yc3QNCj4+IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPj4+IEhpIERhdmUgJiBE
YW5pZWwsDQo+Pj4NCj4+PiBGaXJzdCBwdWxsIGZvciB2NS4xOA0KPj4gSSB3YXMgdHJ5aW5n
IHRvIGJlIGFsbCBlZmZpY2llbnQgYW5kIGdldCB0aGlzIHB1bGxlZCBpbiB0aW1lIGZvciBv
bmNlLg0KPj4NCj4+DQo+PiBIb3dldmVyIGl0IGJyb2tlIGJ1aWxkaW5nIG9uIG15IGFybSB0
ZXN0IGJ1aWxkLg0KPj4NCj4+IFRoZSBuZXcgRFAgaGVscGVyIEtjb25maWcgaXMgd3Jvbmcg
c29tZXdoZXJlLg0KPj4NCj4+IEkndmUgYXR0YWNoZWQgdGhlIC5jb25maWcsIGJ1dCBpdCBh
cHBlYXJzIEkgZ2V0IERSTV9EUF9IRUxQRVIgc2V0IHRvIE0NCj4+IGJ1dCBBTkFMT0dJWF9E
UCBzZXQgdG8gWSBhbmQgaXQgZmFpbHMgdG8gbGluayBiZWNhdXNlIHRoZSBkcCBoZWxwZXIN
Cj4+IHNob3VsZCBiZSBZLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBEYXZlLg0KPiBCZWxvdyBz
aG91bGQgbGlrZWx5IGZpeCBpdD8NCg0KSSBoYXZlIGJlZW4gdHJ5aW5nIGFnYWluIGp1c3Qg
bm93IHdpdGggdGhlIGxhdGVzdCBkcm0tdGlwIGFuZCBjYW5ub3QgDQpyZXByb2R1Y2UgdGhl
IGlzc3VlIHdpdGggdGhlIGF0dGFjaGVkIGNvbmZpZy4NCg0KVGhpcyBQUiBoYXMgYmVlbiBs
b25nIG92ZXJkdWUuIE1hYXJ0ZW4sIGNhbiB5b3UgcGxlYXNlIHNlbmQgb3V0IGFuIA0KdXBk
YXRlIEFTQVA/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL0tjb25maWcNCj4gaW5kZXggNmEyNTFlM2FhNzc5Li5mMjdjZmQyYTk3MjYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcNCj4gQEAgLTY2LDYgKzY2LDcgQEAgY29uZmln
IERSTV9FWFlOT1NfRFANCj4gICAJYm9vbCAiRXh5bm9zIHNwZWNpZmljIGV4dGVuc2lvbnMg
Zm9yIEFuYWxvZ2l4IERQIGRyaXZlciINCj4gICAJZGVwZW5kcyBvbiBEUk1fRVhZTk9TX0ZJ
TUQgfHwgRFJNX0VYWU5PUzdfREVDT04NCj4gICAJc2VsZWN0IERSTV9BTkFMT0dJWF9EUA0K
PiArCXNlbGVjdCBEUk1fRFBfSEVMUEVSDQo+ICAgCWRlZmF1bHQgRFJNX0VYWU5PUw0KPiAg
IAlzZWxlY3QgRFJNX1BBTkVMDQo+ICAgCWhlbHANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL0tj
b25maWcNCj4gaW5kZXggZDU5ZGNhNWVmYjUyLi5mYTVjZmRhNGU5MGUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9LY29uZmlnDQo+IEBAIC04LDYgKzgsNyBAQCBjb25maWcgRFJN
X1JPQ0tDSElQDQo+ICAgCXNlbGVjdCBEUk1fUEFORUwNCj4gICAJc2VsZWN0IFZJREVPTU9E
RV9IRUxQRVJTDQo+ICAgCXNlbGVjdCBEUk1fQU5BTE9HSVhfRFAgaWYgUk9DS0NISVBfQU5B
TE9HSVhfRFANCj4gKwlzZWxlY3QgRFJNX0RQX0hFTFBFUiBpZiBST0NLQ0hJUF9BTkFMT0dJ
WF9EUA0KPiAgIAlzZWxlY3QgRFJNX0RXX0hETUkgaWYgUk9DS0NISVBfRFdfSERNSQ0KPiAg
IAlzZWxlY3QgRFJNX0RXX01JUElfRFNJIGlmIFJPQ0tDSElQX0RXX01JUElfRFNJDQo+ICAg
CXNlbGVjdCBHRU5FUklDX1BIWSBpZiBST0NLQ0hJUF9EV19NSVBJX0RTSQ0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------lcYD2pDaCDpYrghOjqcuLr3Y--

--------------KV0stUvUOS8h0RBuImHA6OFE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIVRMkFAwAAAAAACgkQlh/E3EQov+Aj
ExAAzRuMjvU2Um+WHROx4zssk9eNhNFzgpoWSeEgF+c0ERduWmHyBGvITUNZYpc61eeW8+KbYJnl
ZC5tF0feS5mTTiU0+Ll18arLu2l+2RYu2OB035nMDo6NwLOQIAjqjdnyLMpPjpxWU6hyx9MbjhEk
dVM+qMY1TY8zVhXSiHLQGycCtE0/cf21CQms21LIVw6DUt9y2g0QSOKhJE2NO2JsOHGpmBdbHDzo
xYw4VQ5PVXXHNmZ2wb9EOBZh0AscdSVv1IVdFDMH2dFc0mKTfuwVJ2DpO8eElW/k4Al5YdsjIc7j
APIswcubEk/2ZUUeQOvYEI3VU+va14hAq4SuIurI9jMXM8F2KK+v6hUsw2awUGC3jDYGo6KnO9XL
7WkJJYiicH9Ew7jDOnbcZSz2lppY4nUL7MNLYfL5H8pS5GEbcqDcVGIVGyIbyjk1IlazE/HqgYEk
cE2ayrAqej/Vr56tXoTs8D7ToeTNmZ8H/4x4TOaAcZrFnPUdWtX/qhmDQ9An/+NSHLoEvpj1QlL8
N1IrXGCkjfgsN6ZGKXo0bMH/DGzxui5u4Hb5xlD4VREktzF0BaneOcfM3rTospMfDEg65j6A4uHe
1/BUBitBL8pRckKuSAiuSFcPHOijlpOO1Yon/gx2zErkDgkv791YdChmEdc+oc4mzNYg6hDI+uew
6E8=
=Xm+L
-----END PGP SIGNATURE-----

--------------KV0stUvUOS8h0RBuImHA6OFE--
