Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B3519B3C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938F110E814;
	Wed,  4 May 2022 09:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26D910ECC8;
 Wed,  4 May 2022 09:14:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 41FF61F745;
 Wed,  4 May 2022 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651655644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FAjoNuvoU/e5r+Dhtmbs6y94IojTmAMxzQSPTvQQq3k=;
 b=mPSdzOe7obE3sdzEwUP7M1b90pyMWlXIHT/sVL28hkQoM3dQFurkrTbvYjJYAZqagWD4YP
 MqHADrNM/spvAyefN+KPGYz52oXAfwVRD4G+Q67MUc8D6ETmf+JcsUuh7B4eiboE+Wptuf
 2dNMZSatWeOVbRhy8Nwr2hNr9BfmgJM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CEC6132C4;
 Wed,  4 May 2022 09:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fr3vJNtDcmIqAgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 04 May 2022 09:14:03 +0000
Message-ID: <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
Date: Wed, 4 May 2022 11:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
In-Reply-To: <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RlLwG6bGfey6DnwJOYNBjCk9"
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
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RlLwG6bGfey6DnwJOYNBjCk9
Content-Type: multipart/mixed; boundary="------------7BrNe85h4V9tvwH7WRoa05e4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
In-Reply-To: <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>

--------------7BrNe85h4V9tvwH7WRoa05e4
Content-Type: multipart/mixed; boundary="------------Y00b4gzBImDUVmzy43dMoV6s"

--------------Y00b4gzBImDUVmzy43dMoV6s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDUuMjIgMTA6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNS4yMDIy
IDE1OjIyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gU29tZSBkcml2ZXJzIGFyZSB1c2lu
ZyBwYXRfZW5hYmxlZCgpIGluIG9yZGVyIHRvIHRlc3QgYXZhaWxhYmlsaXR5IG9mDQo+PiBz
cGVjaWFsIGNhY2hpbmcgbW9kZXMgKFdDIGFuZCBVQy0pLiBUaGlzIHdpbGwgbGVhZCB0byBm
YWxzZSBuZWdhdGl2ZXMNCj4+IGluIGNhc2UgdGhlIHN5c3RlbSB3YXMgYm9vdGVkIGUuZy4g
d2l0aCB0aGUgIm5vcGF0IiB2YXJpYW50IGFuZCB0aGUNCj4+IEJJT1MgZGlkIHNldHVwIHRo
ZSBQQVQgTVNSIHN1cHBvcnRpbmcgdGhlIHF1ZXJpZWQgbW9kZSwgb3IgaWYgdGhlDQo+PiBz
eXN0ZW0gaXMgcnVubmluZyBhcyBhIFhlbiBQViBndWVzdC4NCj4gDQo+IFdoaWxlLCBhcyBw
ZXIgbXkgZWFybGllciBwYXRjaCwgSSBhZ3JlZSB3aXRoIHRoZSBYZW4gUFYgY2FzZSwgSSdt
IG5vdA0KPiBjb252aW5jZWQgIm5vcGF0IiBpcyBzdXBwb3NlZCB0byBob25vciBmaXJtd2Fy
ZS1wcm92aWRlZCBzZXR0aW5ncy4gSW4NCj4gZmFjdCBpbiBteSBwYXRjaCBJIGRpZCBhcnJh
bmdlIGZvciAibm9wYXQiIHRvIGFsc28gdGFrZSBlZmZlY3QgdW5kZXINCj4gWGVuIFBWLg0K
DQpEZXBlbmRzIG9uIHdoYXQgdGhlIHdhbnRlZCBzZW1hbnRpY3MgZm9yICJub3BhdCIgYXJl
Lg0KDQpSaWdodCBub3cgIm5vcGF0IiB3aWxsIHJlc3VsdCBpbiB0aGUgUEFUIE1TUiBsZWZ0
IHVuY2hhbmdlZCBhbmQgdGhlDQpjYWNoZSBtb2RlIHRyYW5zbGF0aW9uIHRhYmxlcyBiZSBp
bml0aWFsaXplZCBhY2NvcmRpbmdseS4NCg0KU28gZG9lcyAibm9wYXQiIG1lYW4gdGhhdCB0
aGUgUEFUIE1TUiBzaG91bGRuJ3QgYmUgY2hhbmdlZCwgb3IgdGhhdA0KUEFHRV9CSVRfUEFU
IHdpbGwgbmV2ZXIgYmUgc2V0Pw0KDQo+PiBBZGQgdGVzdCBmdW5jdGlvbnMgZm9yIHRob3Nl
IGNhY2hpbmcgbW9kZXMgaW5zdGVhZCBhbmQgdXNlIHRoZW0gYXQgdGhlDQo+PiBhcHByb3By
aWF0ZSBwbGFjZXMuDQo+Pg0KPj4gRm9yIHN5bW1ldHJ5IHJlYXNvbnMgZXhwb3J0IHRoZSBh
bHJlYWR5IGV4aXN0aW5nIHg4Nl9oYXNfcGF0X3dwKCkgZm9yDQo+PiBtb2R1bGVzLCB0b28u
DQo+Pg0KPj4gRml4ZXM6IGJkZDhiNmM5ODIzOSAoImRybS9pOTE1OiByZXBsYWNlIFg4Nl9G
RUFUVVJFX1BBVCB3aXRoIHBhdF9lbmFibGVkKCkiKQ0KPj4gRml4ZXM6IGFlNzQ5YzdhYjQ3
NSAoIlBDSTogQWRkIGFyY2hfY2FuX3BjaV9tbWFwX3djKCkgbWFjcm8iKQ0KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gSSB0aGlu
ayB0aGlzIHdhbnRzIGEgUmVwb3J0ZWQtYnkgYXMgd2VsbC4NCg0KT2theS4NCg0KPiANCj4+
IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BjaS5oDQo+PiArKysgYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9wY2kuaA0KPj4gQEAgLTk0LDcgKzk0LDcgQEAgaW50IHBjaWJpb3Nfc2V0
X2lycV9yb3V0aW5nKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCBwaW4sIGludCBpcnEpOw0K
Pj4gICANCj4+ICAgDQo+PiAgICNkZWZpbmUgSEFWRV9QQ0lfTU1BUA0KPj4gLSNkZWZpbmUg
YXJjaF9jYW5fcGNpX21tYXBfd2MoKQlwYXRfZW5hYmxlZCgpDQo+PiArI2RlZmluZSBhcmNo
X2Nhbl9wY2lfbW1hcF93YygpCXg4Nl9oYXNfcGF0X3djKCkNCj4gDQo+IEJlc2lkZXMgdGhp
cyBhbmQgLi4uDQo+IA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX21tYW4uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X21tYW4uYw0KPj4gQEAgLTc2LDcgKzc2LDcgQEAgaTkxNV9nZW1fbW1hcF9pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4gICAJaWYgKGFyZ3MtPmZsYWdz
ICYgfihJOTE1X01NQVBfV0MpKQ0KPj4gICAJCXJldHVybiAtRUlOVkFMOw0KPj4gICANCj4+
IC0JaWYgKGFyZ3MtPmZsYWdzICYgSTkxNV9NTUFQX1dDICYmICFwYXRfZW5hYmxlZCgpKQ0K
Pj4gKwlpZiAoYXJncy0+ZmxhZ3MgJiBJOTE1X01NQVBfV0MgJiYgIXg4Nl9oYXNfcGF0X3dj
KCkpDQo+PiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+PiAgIA0KPj4gICAJb2JqID0gaTkxNV9n
ZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOw0KPj4gQEAgLTc1Nyw3ICs3
NTcsNyBAQCBpOTE1X2dlbV9kdW1iX21tYXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAqZmls
ZSwNCj4+ICAgDQo+PiAgIAlpZiAoSEFTX0xNRU0odG9faTkxNShkZXYpKSkNCj4+ICAgCQlt
bWFwX3R5cGUgPSBJOTE1X01NQVBfVFlQRV9GSVhFRDsNCj4+IC0JZWxzZSBpZiAocGF0X2Vu
YWJsZWQoKSkNCj4+ICsJZWxzZSBpZiAoeDg2X2hhc19wYXRfd2MoKSkNCj4+ICAgCQltbWFw
X3R5cGUgPSBJOTE1X01NQVBfVFlQRV9XQzsNCj4+ICAgCWVsc2UgaWYgKCFpOTE1X2dndHRf
aGFzX2FwZXJ0dXJlKHRvX2d0KGk5MTUpLT5nZ3R0KSkNCj4+ICAgCQlyZXR1cm4gLUVOT0RF
VjsNCj4+IEBAIC04MTMsNyArODEzLDcgQEAgaTkxNV9nZW1fbW1hcF9vZmZzZXRfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+ICAgCQlicmVhazsNCj4+
ICAgDQo+PiAgIAljYXNlIEk5MTVfTU1BUF9PRkZTRVRfV0M6DQo+PiAtCQlpZiAoIXBhdF9l
bmFibGVkKCkpDQo+PiArCQlpZiAoIXg4Nl9oYXNfcGF0X3djKCkpDQo+PiAgIAkJCXJldHVy
biAtRU5PREVWOw0KPj4gICAJCXR5cGUgPSBJOTE1X01NQVBfVFlQRV9XQzsNCj4+ICAgCQli
cmVhazsNCj4+IEBAIC04MjMsNyArODIzLDcgQEAgaTkxNV9nZW1fbW1hcF9vZmZzZXRfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+ICAgCQlicmVhazsN
Cj4+ICAgDQo+PiAgIAljYXNlIEk5MTVfTU1BUF9PRkZTRVRfVUM6DQo+PiAtCQlpZiAoIXBh
dF9lbmFibGVkKCkpDQo+PiArCQlpZiAoIXg4Nl9oYXNfcGF0X3VjX21pbnVzKCkpDQo+PiAg
IAkJCXJldHVybiAtRU5PREVWOw0KPj4gICAJCXR5cGUgPSBJOTE1X01NQVBfVFlQRV9VQzsN
Cj4+ICAgCQlicmVhazsNCj4gDQo+IC4uLiB0aGVzZSB1c2VzIHRoZXJlIGFyZSBzZXZlcmFs
IG1vcmUuIFlvdSBzYXkgbm90aGluZyBvbiB3aHkgdGhvc2Ugd2FudA0KPiBsZWF2aW5nIHVu
YWx0ZXJlZC4gV2hlbiBwcmVwYXJpbmcgbXkgZWFybGllciBwYXRjaCBJIGRpZCBpbnNwZWN0
IHRoZW0NCj4gYW5kIGNhbWUgdG8gdGhlIGNvbmNsdXNpb24gdGhhdCB0aGVzZSBhbGwgd291
bGQgYWxzbyBiZXR0ZXIgb2JzZXJ2ZSB0aGUNCj4gYWRqdXN0ZWQgYmVoYXZpb3IgKG9yIGVs
c2UgSSBjb3VsZG4ndCBoYXZlIGxlZnQgcGF0X2VuYWJsZWQoKSBhcyB0aGUgb25seQ0KPiBw
cmVkaWNhdGUpLiBJbiBmYWN0LCBhcyBzYWlkIGluIHRoZSBkZXNjcmlwdGlvbiBvZiBteSBl
YXJsaWVyIHBhdGNoLCBpbg0KPiBteSBkZWJ1Z2dpbmcgSSBkaWQgZmluZCB0aGUgdXNlIGlu
IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKCkgdG8gYmUgdGhlDQo+IHByb2JsZW1hdGljIG9u
ZSwgd2hpY2ggeW91IGxlYXZlIGFsb25lLg0KDQpPaCwgSSBtaXNzZWQgdGhhdCBvbmUsIHNv
cnJ5Lg0KDQpJIHdhbnRlZCB0byBiZSByYXRoZXIgZGVmZW5zaXZlIGluIG15IGNoYW5nZXMs
IGJ1dCBJIGFncmVlIGF0IGxlYXN0IHRoZQ0KY2FzZSBpbiBhcmNoX3BoeXNfd2NfYWRkKCkg
bWlnaHQgd2FudCB0byBiZSBjaGFuZ2VkLCB0b28uDQoNCmt2bV9pc19tbWlvX3BmbigpIHNo
b3VsZCBub3QgcmVhbGx5IG1hdHRlciBhdCBsZWFzdCBmb3IgdGhlIFhlbiBjYXNlLg0KDQpX
aXRoIHRoZSBvdGhlciB1c2UgY2FzZXMgaW4gbWVtdHlwZS5jIEknbSByYXRoZXIgb24gdGhl
IGVkZ2UuDQoNCkluIGNhc2UgdGhlIHg4NiBtYWludGFpbmVycyB0aGluayB0aG9zZSBzaG91
bGQgYmUgY2hhbmdlZCwgdG9vLCBJIGFncmVlDQp0aGF0IHlvdXIgYXBwcm9hY2ggbWlnaHQg
YmUgdGhlIGJldHRlciBvbmUuDQoNCg0KSnVlcmdlbg0K
--------------Y00b4gzBImDUVmzy43dMoV6s
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Y00b4gzBImDUVmzy43dMoV6s--

--------------7BrNe85h4V9tvwH7WRoa05e4--

--------------RlLwG6bGfey6DnwJOYNBjCk9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJyQ9sFAwAAAAAACgkQsN6d1ii/Ey8i
KAgAiuUxDCrW2LM+rNY4P8V/p08F19Eb8X7VjpQHuP5yfA4LSQs5rUcKj45XOxutARuR8yFeQld3
eFoFiGNjPghf587jgGn5pW+uZ9u8+YvRDzmboUP/QH8dcY63VMyP3pBYCxdcgu3UUeAXVPHgcs66
og32V5hSHko4rVj1pu2b7/RwjovXodIF/egi/ux8b4kk0U1kfeJYlplx9T9niQDBw/I/B5/kWPuE
BDbIBSyhKGzF0SPom1rITiC9ugSgz6NX89xrLYaPyXHSeZL8hUqyAJ5Cd9iFJCrYgE7J6a1Luajy
CYjd+Tc6gPVetmfKKEISEOoRODiMp2kNUxM2ziK9PQ==
=v/JH
-----END PGP SIGNATURE-----

--------------RlLwG6bGfey6DnwJOYNBjCk9--
