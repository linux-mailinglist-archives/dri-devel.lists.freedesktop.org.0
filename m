Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B854C64C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 12:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B033710E14C;
	Wed, 15 Jun 2022 10:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F03510E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:34:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D10A221C2B;
 Wed, 15 Jun 2022 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655289286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ltkzy74dOB4dO/mdZqScEL1HNiBBwVzbaYSW+LCchHw=;
 b=Xknf0wEaOQOCtuKUY343sIRWNiMzDKtBCMZn4AdqUzlTZDnWgSpUbdoeHkatsbgdwh9vF9
 qNCoIdrcPVSgy/Key0zf6XJHUPj7/lbl2oRkVUo4BtflQk18NSPgTt/cLrMV50qG487aUF
 soH0IzCRRv9Ut2ReldV45V+AqMUKsZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655289286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ltkzy74dOB4dO/mdZqScEL1HNiBBwVzbaYSW+LCchHw=;
 b=yGdkDrD0YVBe6FcWSxzCSdJL5lqSERaylsIUgKTa72S7+gpLWrtsqE2AJPH4PfIbFzn5r9
 j9Vtm/Tps5niREAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B62CF13A35;
 Wed, 15 Jun 2022 10:34:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c/6DK8a1qWK/WwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jun 2022 10:34:46 +0000
Message-ID: <319ef2e1-6af9-fec8-90a1-b2b81ec3de4f@suse.de>
Date: Wed, 15 Jun 2022 12:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
 <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
 <20220614120952.b32i46qfz476mspq@houat>
 <4ae26a1a-9f53-8db6-634b-c5405971e1b1@suse.de>
 <20220615083259.nvf46giedkmr5buj@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220615083259.nvf46giedkmr5buj@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O9ptYDBzahHhfMH0IB0R3kN0"
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
--------------O9ptYDBzahHhfMH0IB0R3kN0
Content-Type: multipart/mixed; boundary="------------Rs0oNfdz0qWCEMpJX0LhYehw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <319ef2e1-6af9-fec8-90a1-b2b81ec3de4f@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
 <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
 <20220614120952.b32i46qfz476mspq@houat>
 <4ae26a1a-9f53-8db6-634b-c5405971e1b1@suse.de>
 <20220615083259.nvf46giedkmr5buj@houat>
In-Reply-To: <20220615083259.nvf46giedkmr5buj@houat>

--------------Rs0oNfdz0qWCEMpJX0LhYehw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDYuMjIgdW0gMTA6MzIgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KWy4u
Ll0NCj4+IFNlZSwgaGVscGVycyBzaG91bGQgYmUgdXNlZnVsIHRvIG1hbnkgZHJpdmVycy4g
SWYgd2UgYWRkIHRoZW0sIHdlIGFsc28gYWRkIGENCj4+IHJlc291cmNlcyBhbmQgbWFpbnRl
bmFuY2Ugb3ZlcmhlYWQgdG8gb3VyIGxpYnJhcmllcy4gQW5kIHJpZ2h0IG5vdywgdGhlc2UN
Cj4+IG5ldyBmdW5jdGlvbnMgYXBwZWFyIHRvIHdvcmsgYXJvdW5kIHRoZSBkZXNpZ24gb2Yg
dGhlIHZjNCBkcml2ZXIncyBkYXRhDQo+PiBzdHJ1Y3R1cmVzLiAgSWYgeW91IHdhbnQgdG8g
a2VlcCB0aGVtLCBtYXliZSBsZXQncyBmaXJzdCBtZXJnZSB0aGVtIGludG8gdmM0DQo+PiAo
c29tZXRoaW5nIGxpa2UgdmM0X2NydGNfaW5pdF93aXRoX3BsYW5lcygpLCBldGMpLiBJZiBh
bm90aGVyIGRyaXZlciB3aXRoIGENCj4+IHVzZSBjYXNlIGNvbWVzIGFsb25nLCB3ZSBjYW4g
c3RpbGwgbW92ZSB0aGVtIG91dCBlYXNpbHkuDQo+IA0KPiBOb3QgdGhhdCBJIGRpc2FncmVl
LCBidXQgdGhlcmUncyBhbHNvIHRoZSBmYWN0IHRoYXQgcGVvcGxlIHdpbGwgc3RhcnQNCj4g
dXNpbmcgaGVscGVycyBiZWNhdXNlIHRoZXkgYXJlIGF2YWlsYWJsZS4NCj4gDQo+IFlvdSBt
ZW50aW9uZWQgZHJtbV9jcnRjX2FsbG9jX3dpdGhfcGxhbmVzKCkuIEl0IHdhcyBpbnRyb2R1
Y2VkIGluIDUuMTINCj4gd2l0aCBhIHNpbmdsZSB1c2VyIChpcHV2My1jcnRjLmMpLiBBbmQg
dGhlbiwgYmVjYXVzZSBpdCB3YXMgYXZhaWxhYmxlLA0KPiBpbiA1LjE3IHdhcyBtZXJnZWQg
dGhlIFVuaXNvYyBkcml2ZXIgdGhhdCB3YXMgdGhlIHNlY29uZCB1c2VyIG9mIHRoYXQNCj4g
ZnVuY3Rpb24uDQoNCk9UT0gsIGl0IGFjdHVhbGx5IHRvb2sgNSByZWxlYXNlcyB0byBmaW5k
IGFub3RoZXIgdXNlci4gTWF5YmUgd2UgbmVlZCB0byANCmxvb2sgaGFyZGVyIGZvciBwb3Nz
aWJsZSByZXVzZSBvZiBoZWxwZXJzLCBidXQgSSB3b3VsZG4ndCBjb3VudCA1IA0KcmVsZWFz
ZXMgYXMgYSBnb29kIHRyYWNrIHJlY29yZC4NCg0KPiANCj4gZHJtbV9zaW1wbGVfZW5jb2Rl
cl9hbGxvYygpIGFuZCBkcm1tX3VuaXZlcnNhbF9wbGFuZV9hbGxvYygpIGFyZSBpbiB0aGUN
Cj4gc2FtZSBzaXR1YXRpb24gYW5kIHdlIHdvdWxkbid0IGhhdmUgaGFkIHRoYXQgZGlzY3Vz
c2lvbiBpZiBpdCB3YXMga2VwdA0KPiBpbiB0aGUgaW14IGRyaXZlci4NCj4gDQo+IFRoZSBo
ZWxwZXIgYmVpbmcgdGhlcmUgYWxsb3dzIGRyaXZlciBhdXRob3JzIHRvIGRpc2NvdmVyIHRo
ZW0gZWFzaWx5LA0KPiBwb2ludGluZyBvdXQgYW4gaXNzdWUgdGhhdCBwb3NzaWJseSB3YXNu
J3Qgb2J2aW91cyB0byB0aGUgYXV0aG9yLCBhbmQgd2UNCj4gY2FuIGFsc28gcG9pbnQgZHVy
aW5nIHJldmlldyB0aGF0IHRoZSBoZWxwZXJzIGFyZSB0aGVyZSB0byBiZSB1c2VkLg0KPiAN
Cj4gTm9uZSBvZiB0aGF0IHdvdWxkIGJlIHBvc3NpYmxlIGlmIHdlIHdlcmUgdG8ga2VlcCB0
aGVtIGluIGEgZHJpdmVyLA0KPiBiZWNhdXNlIG5vIG9uZSBidXQgdGhlIGF1dGhvciB3b3Vs
ZCBrbm93IGFib3V0IGl0Lg0KPiANCj4gTXkgZmVlbGluZyBpcyB0aGF0IHRoZSBydWxlIHlv
dSBtZW50aW9uIHdvcmtzIGdyZWF0IHdoZW4geW91IGtub3cgdGhhdA0KPiBzb21lIGRldmlh
dGlvbiBpcyBnb2luZyB0byBoYXBwZW4uIEJ1dCB3ZSdyZSByZXBsYWNpbmcgYW4gaW5pdCBm
dW5jdGlvbg0KPiB0aGF0IGhhcyBiZWVuIHByb3ZlZCBnb29kIGVub3VnaCBoZXJlLCBzbyBp
dCdzIG5vdCByb2NrZXQgc2NpZW5jZQ0KPiByZWFsbHkuDQo+IA0KPiBkcm1tX211dGV4X2lu
aXQoKSBpcyBhIGdyZWF0IGV4YW1wbGUgb2YgdGhhdCBhY3R1YWxseS4gWW91IG1lcmdlZCBp
dA0KPiByZWNlbnRseSB3aXRoIHR3byB1c2Vycy4gV2UgY291bGQgaGF2ZSB1c2VkIHRoZSBl
eGFjdCBzYW1lIGFyZ3VtZW50IHRoYXQNCj4gaXQgYmVsb25nZWQgaW4gdGhvc2UgZHJpdmVy
cyBiZWNhdXNlIGl0IHdhc24ndCBnZW5lcmljIGVub3VnaCBvcg0KPiBzb21ldGhpbmcuIEJ1
dCBpdCdzIHRyaXZpYWwsIHNvIGl0IHdhcyBhIGdvb2QgZGVjaXNpb24gdG8gbWVyZ2UgaXQg
YXMgYQ0KPiBoZWxwZXIuIEFuZCBiZWNhdXNlIHlvdSBkaWQgc28sIEkgbGF0ZXIgZm91bmQg
b3V0IHRoYXQgbXV0ZXhfZGVzdHJveSgpDQo+IHdhcyBzdXBwb3NlZCB0byBiZSBjYWxsZWQg
aW4gdGhlIGZpcnN0IHBsYWNlLCBJIGNvbnZlcnRlZCB2YzQgdG8NCj4gZHJtbV9tdXRleF9p
bml0KCksIGFuZCBub3cgdGhhdCBidWcgaXMgZml4ZWQuDQoNCkJ1dCB3aGVuIEkgYWRkZWQg
aXQsIHRoZXJlIGFjdHVhbGx5IHdlcmUgdHdvIHVzZXJzLiBJIHdvdWxkIG5vdCBoYXZlIA0K
YWRkZWQgZHJtbV9tdXRleF9pbml0KCkgaWYgaXQgd2FzIG9ubHkgdXNlZnVsIGZvciBhIHNp
bmdsZSBkcml2ZXIuDQoNCkluIG90aGVyIGNhc2VzLCB3ZSB0ZW5kIHRvIHB1c2ggc2luZ2xl
LXVzZXIgaGVscGVycyBpbnRvIHRoZSBkcml2ZXJzLiANClRoYXQgaGFwcGVuZWQgc2V2ZXJh
bCB0aW1lcyB3aXRoIFRUTS4gQ29kZSB3YXMgbW92ZWQgaW50byB2bXdnZngsIA0KYmVjYXVz
ZSB0aGVyZSB3aGVyZSBubyBvdGhlciB1c2Vycy4NCg0KQW55d2F5LCBhcyB5b3UgaW5zaXN0
IG9uIHVzaW5nIHRoaXMgaGVscGVyLCBnbyBmb3IgaXQuIEJ1dCBwbGVhc2UsIGF0IA0KbGVh
c3QgcmVpbXBsZW1lbnQgZHJtX2NydGNfYWxsb2Nfd2l0aF9wbGFuZXMoKSBvbiB0b3Agb2Yg
YSBzaGFyZWQgDQppbnRlcm5hbCBpbXBsZW1lbnRhdGlvbi4gQUZBSUNUIGRybV9jcnRjX2Fs
bG9jX3dpdGhfcGxhbmVzKCkgaXMgDQpkcm1tX2t6YWxsb2MgKyBkcm1tX2NydGNfaW5pdF93
aXRoX3BsYW5lcygpLiBTYW1lIGZvciBvdGhlciByZWxhdGVkIA0KaGVscGVycyBpbiB0aGUg
b3RoZXIgcGF0Y2hlcywgaWYgdGhlcmUgYXJlIGFueS4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gSXQgd291bGRuJ3QgaGF2ZSBiZWVuIHRoZSBjYXNlIGlmIHlvdSBrZXB0
IGl0IGluc2lkZSB0aGUgZHJpdmVycy4NCj4gDQo+IE1heGltZQ0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------Rs0oNfdz0qWCEMpJX0LhYehw--

--------------O9ptYDBzahHhfMH0IB0R3kN0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKptcYFAwAAAAAACgkQlh/E3EQov+B7
YA//SZkv3F+my9Jg4akeY94/pftcDe5p/z0mkycIdM6lGvm4LayUhuKz/ntRTdI+1HhGG91jadnk
Z4bRiQJNEBFg0KRPDiMko0g+TgMV+nn5kBRLh8R+HgvsNPMXGt1A3EkuO7SWgif6h4e5ihEnVLOH
KeWPoQ1ePl0NrtzSzKer6BcEFHwpsoVKIsrFoY1kOg8b1/Vesn/ERVZyvKWJqAU1A7QuYG89ULQt
lAAoBfwPWrLGlJAiTE7GY1Sum7jbej+eXEGanIVOPHGJpBq/Zj2sNOC7TXo+vt53twbg9u58KCWq
KRyHaF6ocKnpGcCumPy3QAOmM2Q+ShzFTU86wuBBrdROVeX3tlmomrmMc+XUV4pxjiwlpflNbaKw
EeqM9QMht0yvIZNroljM+t1uzajpPHztfbsjyJY4D8iik4RGsVh/gOyUJhnWAZLrDDYszJukQFBX
wN87aLn2gg2cpDdsBXCW0/dg40Cmr1Hw15FLv41d9t6KE81DZM8UoUjSmu+QGJ6zfRO8dlPW5sES
Z1/JR7c29UjSRHf4vd7Rs6+UFCMU4n+yovIyRrUGQ0HVB+N/jA/9wOcmnAMIxcjQgsJQLYGZkxah
weGdSJ1oo/ePh9SLRrAoGkqvbgssZ4tgq5EuJ6GZC36oeivgSePZrJCW4m3Xu0NkGvfJTF4TbBdo
8iE=
=gCkc
-----END PGP SIGNATURE-----

--------------O9ptYDBzahHhfMH0IB0R3kN0--
