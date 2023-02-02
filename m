Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FD687E44
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 14:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4DD10E1E2;
	Thu,  2 Feb 2023 13:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD510E50C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 13:05:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AAA243370E;
 Thu,  2 Feb 2023 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675343114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9IjrdN9ufa9KfH8PTvyFHcTuZnLSxhttNdIiL7loUw=;
 b=K9m0MEosC7sED43ndZdVbauv4MF1z3U5tDrT4fHsiMdkZ3EZlaPAKZY0f6YIWeJNHZXq4I
 zlFPtLqV2jTjcBZGDeVdfbZsMo90VC9i0Nld2M9IO25aPAqLqCNsyxLVDrQXeRkBJPYGiI
 VGa1CYyJF/vsX8iSmKJcIqKvGKhYuhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675343114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9IjrdN9ufa9KfH8PTvyFHcTuZnLSxhttNdIiL7loUw=;
 b=QPE3t+rbGU8D/fj8dQ/IyAiOTcz/+P882vTc2PPXHCQDaGKGScJnkbAGy3PdRViuewJtCY
 PR+LTriP2NxO4yAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EA4E138E8;
 Thu,  2 Feb 2023 13:05:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bTviIQq122M+IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Feb 2023 13:05:14 +0000
Message-ID: <ec8c04f7-963a-6e70-fe5b-0fd032bb1455@suse.de>
Date: Thu, 2 Feb 2023 14:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230202110312.808607-1-maxime@cerno.tech>
 <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
 <20230202123555.r2qvjjhtqwx7e2zo@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230202123555.r2qvjjhtqwx7e2zo@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YezYI1yW4yuG5wdw3U0tHX6A"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YezYI1yW4yuG5wdw3U0tHX6A
Content-Type: multipart/mixed; boundary="------------HTIvYTLpK7orp3E69Upc3ZRD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <ec8c04f7-963a-6e70-fe5b-0fd032bb1455@suse.de>
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
References: <20230202110312.808607-1-maxime@cerno.tech>
 <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
 <20230202123555.r2qvjjhtqwx7e2zo@houat>
In-Reply-To: <20230202123555.r2qvjjhtqwx7e2zo@houat>

--------------HTIvYTLpK7orp3E69Upc3ZRD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjMgdW0gMTM6MzUgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IE9uIFRodSwgRmViIDAyLCAyMDIzIGF0IDAxOjIyOjAxUE0gKzAxMDAsIFRo
b21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQW0gMDIuMDIuMjMgdW0gMTI6MDMgc2Nocmll
YiBNYXhpbWUgUmlwYXJkOg0KPj4+IENvbW1pdCA4ZmMwMzgwZjZiYTcgKCJkcm0vY2xpZW50
OiBBZGQgc29tZSB0ZXN0cyBmb3INCj4+PiBkcm1fY29ubmVjdG9yX3BpY2tfY21kbGluZV9t
b2RlKCkiKSB3YXMgbWVhbnQgdG8gaW50cm9kdWNlIHVuaXQgdGVzdHMNCj4+PiBmb3IgdGhl
IHN0YXRpYyBkcm1fY29ubmVjdG9yX3BpY2tfY21kbGluZV9tb2RlKCkgZnVuY3Rpb24uDQo+
Pj4NCj4+PiBJbiBzdWNoIGEgY2FzZSwgdGhlIGt1bml0IGRvY3VtZW50YXRpb24gcmVjb21t
ZW5kZWQgdG8gaW1wb3J0IHRoZSB0ZXN0cw0KPj4+IHNvdXJjZSBmaWxlIGRpcmVjdGx5IGZy
b20gdGhlIHNvdXJjZSBmaWxlIHdpdGggdGhlIHN0YXRpYyBmdW5jdGlvbiB0bw0KPj4+IHRl
c3QuDQo+Pj4NCj4+PiBXaGlsZSBpdCB3YXMgd29ya2luZywgaXQncyBnZW5lcmFsbHkgZnJv
d25lZCB1cG9uLiBGb3J0dW5hdGVseSwgY29tbWl0DQo+Pj4gOWM5ODhmYWU2ZjZhICgia3Vu
aXQ6IGFkZCBtYWNybyB0byBhbGxvdyBjb25kaXRpb25hbGx5IGV4cG9zaW5nIHN0YXRpYw0K
Pj4+IHN5bWJvbHMgdG8gdGVzdHMiKSBpbnRyb2R1Y2VkIG1hY3JvcyB0byBlYXNpbHkgZGVh
bCB3aXRoIHRoYXQgY2FzZS4gV2UNCj4+PiBjYW4gdGh1cyByZW1vdmUgb3VyIGluY2x1ZGUg
YW5kIHVzZSB0aG9zZSBtYWNyb3MgaW5zdGVhZC4NCj4+DQo+PiBJIGxpa2UgdGhhdCB0aGlz
IGluY2x1ZGUgc3RhdGVtZW50cyBpcyBnb2luZyBhd2F5Lg0KPiANCj4gWWVhaCwgd2hlbiBJ
IHNhdyB0aGF0IGl0IHdhcyBub3cgYXZhaWxhYmxlLCBJIHJlbWVtYmVyZWQgeW91IHJlYWxs
eQ0KPiBkaWRuJ3QgbGlrZSBpdCA6KQ0KPiANCj4+IEJ1dCBjaGFuZ2luZyBzeW1ib2wgdmlz
aWJpbGl0eSBmb3IgdGVzdHMgaXMgbGlrZXdpc2UgYXdrd2FyZC4NCj4+DQo+PiBNYXliZSBp
J20gYXNraW4gZ3RvbyBtaXVjaCBmb3IgdGhpcyBzaW1wbGUgcGF0Y2gsIGJ1dCBjYW4ndCB3
ZSBoYXZlIGEgaGVscGVyDQo+PiBtYWNybyB0aGF0IGdlbmVyYXRlcyBhbiBleHBvcnRlZCB3
cmFwcGVyIGZvciBLdW5pdCB0ZXN0cz8gU29tZXRoaW5nIGxpa2UNCj4+IHRoaXM6DQo+Pg0K
Pj4gRVhQT1JUX0tVTklUX1dSQVBQRVIoc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKlwNCj4+
IAkJCWRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGUsDQo+PiAJCQlzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4+DQo+PiB3aGljaCB0aGVuIGdlbmVyYXRlcyBz
b21ldGhpbmcgbGlrZSB0aGlzOg0KPj4NCj4+IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICog
ZHJtX2Nvbm5lY3Rvcl9waWNrX2NtZGxpbmVfbW9kZV9rdW5pdCgNCj4+IAlzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPj4gew0KPj4gCXJldHVybiBkcm1fY29ubmVjdG9y
X3BpY2tfY21kbGluZV9tb2RlKGNvbm5lY3Rvcik7DQo+PiB9DQo+Pg0KPj4gSSBrbm93IHRo
YXQgdGhlIG1hY3JvIGZvciBnZW5lcmF0aW5nIHRoaXMgY29kZSBpcyBtb3JlIGNvbXBsZXgg
dGhhbg0KPj4gaWxsdXN0cmF0ZWQgaGVyZS4gQnV0IHRoaXMgc29sdXRpb24gc2VwYXJhdGVz
IEt1bml0IGFuZCBmdW5jdGlvbnMgY2xlYW5seS4NCj4+IFRoZSBzdGF0aWMgZnVuY3Rpb25z
IHRoYXQgYXJlIGV4cG9ydGVkIGZvciBLdW5pdCB0ZXN0aW5nIHN0aWxsIG5lZWQgdG8gYmUN
Cj4+IGRlY2xhcmVkIGluIGEgaGVhZGVyIGZpbGUuIFRoYXQgY291bGQgYWxzbyBiZSBkb25l
IHZpYSBzdWNoIGEgbWFjcm8uDQo+IA0KPiBJIG1lYW4sIEkgZ3Vlc3Mgd2UgY291bGQgZG8g
dGhhdCwgYnV0IHdoYXQncyB0aGUgcG9pbnQ/IEkgZG9uJ3QgcmVhbGx5DQo+IGdldCB3aGF0
IHRoYXQgd3JhcHBlciBicmluZ3MgdG8gdGhlIHRhYmxlLg0KDQpUaGUgYmlnIGJlbmVmaXQg
b2YgdGhlIGt1bml0IHdyYXBwZXIgaXMgdGhhdCB3ZSBkb24ndCBjaGFuZ2UgdGhlIA0Kdmlz
aWJpbGl0eSBvciBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgdGVzdGVkIGNvZGUuIFRoZSBjdXJy
ZW50bHkgZXhpc3RpbmcgDQptYWNyb3MgaW52aXRlIGxpbmtlciBlcnJvcnMgYmVjYXVzZSBz
eW1ib2wgdmlzaWJpbGl0eSBub3cgZGVwZW5kcyBvbiANCndoZXRoZXIgS3VuaXQgaXQgZW5h
YmxlZC4gSXQncyBhbHNvIG5vdCBjbGVhciB0byBtZSBob3cgS3VuaXQga25vd3MgdGhlIA0K
c3ltYm9sLiBJcyB0aGVyZSBhIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIGluIHRoZSBLdW5pdCB0
ZXN0J3Mgc291cmNlIGNvZGU/IA0KSWYgc28sIGl0IG1pZ2h0IGRpdmVyZ2UgZnJvbSB0aGUg
aW1wbGVtZW50YXRpb247IHdpdGggY29uc2VxdWVuY2VzLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBBbHNvLCB0aGlzIGRldmlhdGVzIGZyb20gdGhlIGV4aXN0aW5nIHBy
YWN0aWNlIHdlIGhhZCBmb3Igc2VsZnRlc3RzIGFuZA0KPiBFWFBPUlRfU1lNQk9MX0ZPUl9U
RVNUU19PTkxZDQo+IA0KPiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------HTIvYTLpK7orp3E69Upc3ZRD--

--------------YezYI1yW4yuG5wdw3U0tHX6A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPbtQoFAwAAAAAACgkQlh/E3EQov+DT
wg/+LB1jmeDHgX7I/ldm6Qc2pirDrw+hbeMpceLR29fCpEXmDvc22gOggUn0KjDT4RJ96G5rOWxv
BtxyrUUUN10OUbD/MvUtxPTjPOqhtGu6/Nnm1oDyyw0N30U7k1A9OrMxgI+61zpDdzVkUk2JdUTP
RcL/Em21Ut8CtHi/92vcFGoN7Q3j5VRh/wVshnsyYV5RMmQtYDHOX5RleX2qk7VDv/663qmQ6+ez
F3TeGmfYRzX8B/vhz896JSlojI1GV2EMpPCIMDt5qFRzo7Vvn4cJSoEnKWyAbusW2L/MjJ/vZ6iD
DeAsrxmLxYvQE6RH2NufR6OOhjtYyJ86u3CmJC/CoenxAVQwzd1otGfpOsx8IC6omJIUWSWb4xY2
ete7oBVbR16pFYp9wsmqewp7NgWpMv5/zVkiVHerDoflLDjP/dAW8O7l6fvP+cKNwdBLjaaKtCXa
OHjNcFfeDilYCwwSUJNpWIDlysaBnDaNVaU+cQyigAcHRnIp+pJVLkDU8sALZufCa34i2iYJoHXD
MQEzEfDqCC89CdbN0Dx86z2rBg1yN/J6nsV/fcNKDDqKOXjqEc0f5UOCBkAjnLSDSHUtlobFWd2c
/I14CYKMuYkAidUoYsEN2zr0c74RwrZkQaU04OzQ6EqYP9p4TtgdyxdxcLOxIiM2fP3oiLNoqZLc
Ll0=
=2TM+
-----END PGP SIGNATURE-----

--------------YezYI1yW4yuG5wdw3U0tHX6A--
