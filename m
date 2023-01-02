Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65965B347
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD7110E348;
	Mon,  2 Jan 2023 14:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739A10E348
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:20:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 601BB5BF98;
 Mon,  2 Jan 2023 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672669207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2lr/NFicTFAuhRCK9gBXD09P6vUqRfW5FI79f4N+rR4=;
 b=wa13lAN6k1TVY9hQqIE9AYg0obtnYmDM8Qtq9omZ+JCxuDIVRi2C5up7hXfQyrYPUIbKTv
 V8E5COrGTLbXjRfZl8lJu82nt4SotajgZCgxta78STDKUhKEjNm2RSHCcON304oafsZU0y
 2vYybVZr2oPAGJzHbscmP1fUziO8dBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672669207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2lr/NFicTFAuhRCK9gBXD09P6vUqRfW5FI79f4N+rR4=;
 b=Ksw6vwUqwCdgz8K4EZtlnFqdXePv7/cIW1sa92kWVxm1PZzhUzjj+lbPHE3se2htM6WkNs
 62MsBD1y3TG/EkBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33410139C8;
 Mon,  2 Jan 2023 14:20:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KHOeCxfosmN7RwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 14:20:07 +0000
Message-ID: <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
Date: Mon, 2 Jan 2023 15:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230102135757.262676-1-mcanal@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230102135757.262676-1-mcanal@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8wB2O7Q40fxMBHA7r4u000h1"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8wB2O7Q40fxMBHA7r4u000h1
Content-Type: multipart/mixed; boundary="------------tjYEEzvhiGaVIYh2xOuS7Fgu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
Subject: Re: [PATCH] drm/vc4: Check for valid formats
References: <20230102135757.262676-1-mcanal@igalia.com>
In-Reply-To: <20230102135757.262676-1-mcanal@igalia.com>

--------------tjYEEzvhiGaVIYh2xOuS7Fgu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDEuMjMgdW0gMTQ6NTcgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IEN1
cnJlbnRseSwgdmM0IGlzIG5vdCBjaGVja2luZyB2YWxpZCBmb3JtYXRzIGJlZm9yZSBjcmVh
dGluZyBhDQo+IGZyYW1lYnVmZmVyLCB3aGljaCBpcyB0cmlnZ2VyaW5nIHRoZSBJR1QgdGVz
dA0KPiBpZ3RAa21zX2FkZGZiX2Jhc2ljQGFkZGZiMjUtYmFkLW1vZGlmaWVyIHRvIGZhaWws
IGFzIHZjNCBhY2NlcHRzDQo+IHRvIGNyZWF0ZSBhIGZyYW1lYnVmZmVyIHdpdGggYW4gaW52
YWxpZCBtb2RpZmllci4gVGhlcmVmb3JlLCBjaGVjaw0KPiBmb3IgdmFsaWQgZm9ybWF0cyBi
ZWZvcmUgY3JlYXRpbmcgZnJhbWVidWZmZXJzIG9uIHZjNCBhbmQgdmM1IGluDQo+IG9yZGVy
IHRvIGF2b2lkIGNyZWF0aW5nIGZyYW1lYnVmZmVycyB3aXRoIGludmFsaWQgZm9ybWF0cy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jIHwgMjMgKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMNCj4gaW5kZXgg
NTNkOWYzMDQ2MGNmLi41ZDFhZmQ2NmZjYzEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2ttcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2tt
cy5jDQo+IEBAIC01MDAsNiArNTAwLDI3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICp2YzRfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IAkJbW9kZV9j
bWQgPSAmbW9kZV9jbWRfbG9jYWw7DQo+IAl9DQo+IA0KPiArCWlmICghZHJtX2FueV9wbGFu
ZV9oYXNfZm9ybWF0KGRldiwgbW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCwNCj4gKwkJCQkgICAg
ICBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pKSB7DQo+ICsJCWRybV9kYmdfa21zKGRldiwgIlVu
c3VwcG9ydGVkIHBpeGVsIGZvcm1hdCAlcDRjYyAvIG1vZGlmaWVyIDB4JWxseFxuIiwNCj4g
KwkJCSAgICAmbW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCwgbW9kZV9jbWQtPm1vZGlmaWVyWzBd
KTsNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICsJfQ0KDQpUaGlzIG1pZ2h0
IGJlIGEgc3R1cGlkIHF1ZXN0aW9uLCBidXQgd2h5IGRvZXNuJ3QgZHJtX2ZiZ2VtX2ZiX2Ny
ZWF0ZSgpIA0KZG8gdGhpcyB0ZXN0IGFscmVhZHk/IEl0IHNlZW1zIGxpa2UgYSBuby1icmFp
bmVyIGFuZCAqbm90KiB0ZXN0aW5nIGZvciANCnRoZSBwbGFuZSBmb3JtYXRzIHNob3VsZCBi
ZSB0aGUgZXhjZXB0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsNCj4gKwly
ZXR1cm4gZHJtX2dlbV9mYl9jcmVhdGUoZGV2LCBmaWxlX3ByaXYsIG1vZGVfY21kKTsNCj4g
K30NCj4gKw0KPiArc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKnZjNV9mYl9jcmVh
dGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gKwkJCQkJICAgICBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGVfcHJpdiwNCj4gKwkJCQkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJf
Y21kMiAqbW9kZV9jbWQpDQo+ICt7DQo+ICsJaWYgKCFkcm1fYW55X3BsYW5lX2hhc19mb3Jt
YXQoZGV2LCBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LA0KPiArCQkJCSAgICAgIG1vZGVfY21k
LT5tb2RpZmllclswXSkpIHsNCj4gKwkJZHJtX2RiZ19rbXMoZGV2LCAiVW5zdXBwb3J0ZWQg
cGl4ZWwgZm9ybWF0ICVwNGNjIC8gbW9kaWZpZXIgMHglbGx4XG4iLA0KPiArCQkJICAgICZt
b2RlX2NtZC0+cGl4ZWxfZm9ybWF0LCBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pOw0KPiArCQly
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gKwl9DQo+ICsNCj4gCXJldHVybiBkcm1fZ2Vt
X2ZiX2NyZWF0ZShkZXYsIGZpbGVfcHJpdiwgbW9kZV9jbWQpOw0KPiAgIH0NCj4gDQo+IEBA
IC0xMDMzLDcgKzEwNTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZp
Z19mdW5jcyB2YzRfbW9kZV9mdW5jcyA9IHsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9tb2RlX2NvbmZpZ19mdW5jcyB2YzVfbW9kZV9mdW5jcyA9IHsNCj4gCS5hdG9taWNfY2hl
Y2sgPSB2YzRfYXRvbWljX2NoZWNrLA0KPiAJLmF0b21pY19jb21taXQgPSBkcm1fYXRvbWlj
X2hlbHBlcl9jb21taXQsDQo+IC0JLmZiX2NyZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlLA0K
PiArCS5mYl9jcmVhdGUgPSB2YzVfZmJfY3JlYXRlLA0KPiAgIH07DQo+IA0KPiAgIGludCB2
YzRfa21zX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gLS0NCj4gMi4zOC4xDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------tjYEEzvhiGaVIYh2xOuS7Fgu--

--------------8wB2O7Q40fxMBHA7r4u000h1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOy6BYFAwAAAAAACgkQlh/E3EQov+A3
PBAAitUDlpA+1nN6RahT8cSyrV3MS75zgAMo5VU9HUl+31mIvmDhFZL++AHpRjF3aLFPLay3yF5w
BNqWl4YPL0pj/vskJuCjHNrrWOq7XC1IosfTdFif9qaT0TLbf6qUqD8Uua3bb2hN6owrzQuTSsCE
03lMrDuExWgWu+R/bu13UTpG7Jj/rYJ4ojQINLkmzVjxiBjiuz9UmvBNZxZC54KKb6bEkoJGS3Gg
RDroJ+2eWS50TlzyKUN+4AywCO6QU78cY8W2aUL4qRwf8UapZonGj5yrI7hPsuxQfWLHn3W6Nmmu
IIgODSgeIUY4ZNaLuYusL8a+OWI/NMq8F0M7uZ0ipN+vwsNqp0guWDX9m+8wB0PT3nfAPRcbIXQz
fem4xhVQeVcozyhMzaAlfjUJThYXGRNQ2vyPLc63p55EtNzUDzak7sqMubqIIeI0jiwZzkpIeElF
OezpBNfDnnnZn3/+gRFTA2rWrUsn2cbUWBqP2Kai8aHC0/4e53VxlipX7cDVYuwAaaWTRGkog7ew
l88e4ZVlWVvhfV1oqWlZRyna9rDjMXDwyTrDTXj5JVVsUFRdXcODUdKc5adCaT8HSa83sMvE+uRC
f3qUiph5pBlvDmd2xZdVGkZkJgs7yRVWixFSqccVonYKq13lK/vB77SeWGwi7PGx91UcT6OEiuiv
q9k=
=DYCM
-----END PGP SIGNATURE-----

--------------8wB2O7Q40fxMBHA7r4u000h1--
