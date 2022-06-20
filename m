Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A7551F43
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 16:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A1F10E369;
	Mon, 20 Jun 2022 14:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B4D10E369
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:45:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE11A21B7A;
 Mon, 20 Jun 2022 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655736311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5vb8YtCm4jHZgxPppfPQfVCqOBnGyntx/1T0QcaKCM=;
 b=r8qwUz/o5OBdn6Gjp+V4DMxb+CfHUV0kSlEjFzjrYvAUZYSb+gZgU0JwzVn2yKIVOKamm7
 g/AbaQfEt5XoHmA4485Tw+1OwT4k2C+xqpiET7h3lo/OPf0nfTVyn3zOre2YztWKXSQNeN
 ExvStVv5ZYOIU2FiF6OEEzO2KAw1pPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655736311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5vb8YtCm4jHZgxPppfPQfVCqOBnGyntx/1T0QcaKCM=;
 b=susbldp1zw2l0e26UT3Bi0BUUr04zQSluDaR6OmyEL6ytikk3aXX/LozwbiOIDb3mURl0G
 Z+YUPcRndVUy5zDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDFCA13638;
 Mon, 20 Jun 2022 14:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wfdJLfeHsGKGZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 14:45:11 +0000
Message-ID: <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>
Date: Mon, 20 Jun 2022 16:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
 <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
 <20220620143928.zbbaltwcah3rpkqh@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220620143928.zbbaltwcah3rpkqh@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OmMrbFXb8BbKtEtdF4miT82l"
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
--------------OmMrbFXb8BbKtEtdF4miT82l
Content-Type: multipart/mixed; boundary="------------0rdcG1k0sqnm4NdYqK7P0DdX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
 <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
 <20220620143928.zbbaltwcah3rpkqh@houat>
In-Reply-To: <20220620143928.zbbaltwcah3rpkqh@houat>

--------------0rdcG1k0sqnm4NdYqK7P0DdX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjIgdW0gMTY6Mzkgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBNb24sIEp1biAyMCwgMjAyMiBhdCAwNDoyNTozOFBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjAuMDYuMjIgdW0gMTU6NDggc2Nocmll
YiBNYXhpbWUgUmlwYXJkOg0KPj4+IEhpLA0KPj4+DQo+Pj4gT24gTW9uLCBKdW4gMjAsIDIw
MjIgYXQgMTI6NDQ6MjRQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+
IEFtIDEwLjA2LjIyIHVtIDExOjI4IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4+Pj4+IFRo
ZSBEUk0tbWFuYWdlZCBmdW5jdGlvbiB0byByZWdpc3RlciBhbiBlbmNvZGVyIGlzDQo+Pj4+
PiBkcm1tX3NpbXBsZV9lbmNvZGVyX2FsbG9jKCkgYW5kIGl0cyB2YXJpYW50cywgd2hpY2gg
d2lsbCBhbGxvY2F0ZSB0aGUNCj4+Pj4+IHVuZGVybHlpbmcgc3RydWN0dXJlIGFuZCBpbml0
aWFsaXNhdGlvbiB0aGUgZW5jb2Rlci4NCj4+Pj4+DQo+Pj4+PiBIb3dldmVyLCB3ZSBtaWdo
dCB3YW50IHRvIHNlcGFyYXRlIHRoZSBzdHJ1Y3R1cmUgY3JlYXRpb24gYW5kIHRoZSBlbmNv
ZGVyDQo+Pj4+PiBpbml0aWFsaXNhdGlvbiwgZm9yIGV4YW1wbGUgaWYgdGhlIHN0cnVjdHVy
ZSBpcyBzaGFyZWQgYWNyb3NzIG11bHRpcGxlIERSTQ0KPj4+Pj4gZW50aXRpZXMsIGZvciBl
eGFtcGxlIGFuIGVuY29kZXIgYW5kIGEgY29ubmVjdG9yLg0KPj4+Pj4NCj4+Pj4+IExldCdz
IGNyZWF0ZSBhbiBoZWxwZXIgdG8gb25seSBpbml0aWFsaXNlIGFuIGVuY29kZXIgdGhhdCB3
b3VsZCBiZSBwYXNzZWQNCj4+Pj4+IGFzIGFuIGFyZ3VtZW50Lg0KPj4+Pj4NCj4+Pj4NCj4+
Pj4gVGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggdGhpcyBwYXRjaCwgYnV0IEkgaGF2ZSB0
byBhZG1pdCB0aGF0IGFkZGluZw0KPj4+PiBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpIGV0
IGFsIHdhcyBhIG1pc3Rha2UuDQo+Pj4NCj4+PiBXaHkgZG8geW91IHRoaW5rIGl0IHdhcyBh
IG1pc3Rha2U/DQo+Pg0KPj4gVGhlIHNpbXBsZS1lbmNvZGVyIHN0dWZmIGlzIGFuIGludGVy
ZmFjZSB0aGF0IG5vIG9uZSByZWFsbHkgbmVlZHMuIENvbXBhcmVkDQo+PiB0byBvcGVuLWNv
ZGluZyB0aGUgZnVuY3Rpb24sIGl0J3MgYmFyZWx5IGFuIGltcHJvdmVtZW50IGluIExPQ3Ms
IGJ1dCBub3RoaW5nDQo+PiBlbHNlLg0KPj4NCj4+IEJhY2sgd2hlbiBJIGFkZGVkIGRybV9z
aW1wbGVfZW5jb2Rlcl9pbml0KCksIEkgd2FudGVkIHRvIHNpbXBsaWZ5IHRoZSBtYW55DQo+
PiBkcml2ZXJzIHRoYXQgaW5pdGlhbGl6ZWQgdGhlIGVuY29kZXIgd2l0aCBhIGNsZWFudXAg
Y2FsbGJhY2sgYW5kIG5vdGhpbmcNCj4+IGVsc2UuICBJSVJDIGl0IHdhcyBhbiBpbXByb3Zl
bWVudCBiYWNrIHRoZW4uICBCdXQgbm93IHdlIGFscmVhZHkgaGF2ZSBhDQo+PiByZWxhdGVk
IGRybW1fIGhlbHBlciBhbmQgYSBkcm1tX2FsbG9jXyBoZWxwZXIuIElmIEkgaGFkIG9ubHkg
YWRkZWQgdGhlIG1hY3JvDQo+PiBiYWNrIHRoZW4sIHdlIGNvdWxkIHVzZSB0aGUgcmVndWxh
ciBlbmNvZGVyIGhlbHBlcnMuDQo+Pg0KPj4+DQo+Pj4+IEl0IHdvdWxkIGhhdmUgYmVlbiBi
ZXR0ZXIgdG8gYWRkIGFuIGluaXRpYWxpemVyIG1hY3JvIGxpa2UNCj4+Pj4NCj4+Pj4gI2Rl
ZmluZSBEUk1fU1RBVElDX0VOQ09ERVJfREVGQVVMVF9GVU5DUyBcDQo+Pj4+ICAgICAuZGVz
dHJveSA9IGRybV9lbmNvZGVyX2NsZWFudXANCj4+Pj4NCj4+Pj4gSXQncyB3YXkgbW9yZSBm
bGV4aWJsZSBhbmQgc2ltaWxhcmx5IGVhc3kgdG8gdXNlLiBBbnl3YXkuLi4NCj4+Pg0KPj4+
IFdlIGNhbiBzdGlsbCBoYXZlIHRoaXMuIEl0IHdvdWxkIHNpbXBsaWZ5IHRoaXMgc2VyaWVz
IHNvIEkgY291bGQNCj4+PiBkZWZpbml0ZWx5IHNxdWVlemUgdGhhdCBwYXRjaCBpbiBhbmQg
YWRkIGEgVE9ETyBpdGVtIC8gZGVwcmVjYXRpb24NCj4+PiBub3RpY2UgZm9yIHNpbXBsZSBl
bmNvZGVycyBpZiB5b3UgdGhpbmsgaXQncyBuZWVkZWQNCj4+DQo+PiBOb3QgbmVjZXNzYXJ5
LiBJdCdzIG5vdCBzdXBlciBpbXBvcnRhbnQuDQo+IA0KPiBUaGUgY29yb2xsYXJ5IGlzIHRo
b3VnaCA6KQ0KPiANCj4gSWYgSSB1bmRlcnN0YW5kIHlvdSByaWdodCwgaXQgbWVhbnMgdGhh
dCB5b3UnZCByYXRoZXIgaGF2ZSBhIGRlc3Ryb3kNCj4gY2FsbGJhY2sgZXZlcnl3aGVyZSBp
bnN0ZWFkIG9mIGNhbGxpbmcgdGhlIF9jbGVhbnVwIGZ1bmN0aW9uIHRocm91Z2ggYQ0KPiBk
cm0tbWFuYWdlZCBjYWxsYmFjaywgYW5kIGxldCBkcm1fZGV2X3VucmVnaXN0ZXIgZG8gaXRz
IGpvYj8NCj4gDQo+IElmIHNvLCBpdCBtZWFucyB0aGF0IHdlIHNob3VsZG4ndCBiZSBmb2xs
b3dpbmcgdGhlIGRybW1fLipfYWxsb2MNCj4gZnVuY3Rpb25zIGFuZCBzaG91bGQgZHJvcCBh
bGwgdGhlIG5ldyBvbmVzIGZyb20gdGhpcyBzZXJpZXMuDQoNCk5vLCBuby4gV2hhdCBJJ20g
c2F5aW5nIGlzIHRoYXQgc2ltcGxlLWVuY29kZXIgaXMgYSBwb2ludGxlc3MgbWlkLWxheWVy
LiANClRoZXJlJ3Mgbm90aGluZyB0aGF0IGNvdWxkbid0IGVhc2lseSBiZSBhY2hpZXZlZCB3
aXRoIHRoZSByZWd1bGFyIA0KZW5jb2RlciBmdW5jdGlvbnMuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IE1heGltZQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------0rdcG1k0sqnm4NdYqK7P0DdX--

--------------OmMrbFXb8BbKtEtdF4miT82l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwh/cFAwAAAAAACgkQlh/E3EQov+Cd
vA/+JlUQGn1OrlcF7ICxX2RIg4VFEPosCeIuwcQ4V9G9U3iIghC9U53LCDtXpQhqpcwWLDgv05Kc
T4xZGq+E2sRNplQYxcoJgVeZ4IdoPmsJqN58T/wpIrTSJ35sA1i5EoFofvzhg7EhZg43LJgZGlIc
e8jdjcPCjUyIlPVkCto8FSkTHLPjNRZeYOMyE2hkKchd80+SdJOwJpaKf0HyOyry1DPo0nAALIBO
odVK/0vS/SZh1ZR5jwv5Ku882d4S8BmFcW0VkTfWbS/H5y4GfWbyYwi/YBu21iIzXfjCDjLqNSO4
BuxlHmqMCgBoAGxi7ZfjBVsC9ZPaoDh+JFmg3ppPvJ5msWK+p9DjptSjTacCStVMaf+ExmiEYzf7
2XVRL/6iCYQsuCkZ/iwYs4Lx6ovAF6fnzEfbyVm+V3BE+zDU0gZt3Yv7yn/hcI+fOMSRuwYmtw3g
oArZj4O5q7meiddYPfUCMCmfQRWfF6gJh4JnsMtEjSwhkQPfxCXdRwDW5mqK8dL6iFbRh1n2/GAQ
0IsOUCT7c37LyR4QKYG5B6CTF6HvRvim+9iseWxiWj2ovLk+KdL0dxIFI7J0sOUzbgdYNGg3TBGY
950K8KJ+rQb02J9GDvP7Wsup+btzmTE3rDy836kcLzBhR/yFGbJgySr2WGe5HpptksUT6HOOpjNh
8qU=
=v2HI
-----END PGP SIGNATURE-----

--------------OmMrbFXb8BbKtEtdF4miT82l--
