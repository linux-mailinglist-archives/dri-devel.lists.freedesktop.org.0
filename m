Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC43A7970CE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5DD10E212;
	Thu,  7 Sep 2023 08:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D506B10E09B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:35:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A22A21862;
 Thu,  7 Sep 2023 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694075756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0rFn44AIm2HsPQJSCh9y4NhrNnMiKMMHFylbijlpr74=;
 b=fZZ6lxmEHRIXC+4bZsmuuleGSB6QnZxjuahXtO4RMu/wMnxP2Uvi/AInIAdiGGpgdnRAtN
 w0dE7l88KuMZ9fa7/B74kM7URkn58gsdkT2kw5rHH3GvSrQdZMhvu0b4l7kbAIGflY2Mbi
 DoRz+xHEE27OaMqpl1c49rYgst4u4SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694075756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0rFn44AIm2HsPQJSCh9y4NhrNnMiKMMHFylbijlpr74=;
 b=1pjSBHeiF41sYtaMDUSFc3KHMSZpywc1jAGH7X+yAkoYXMaKcnUu/jNvsXKrSBaCbUEkOe
 mUN/WKdz5635HrAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 568E9138FA;
 Thu,  7 Sep 2023 08:35:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9I0kFGyL+WSEHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:35:56 +0000
Message-ID: <dd898338-813f-df63-4255-986903aa7cb6@suse.de>
Date: Thu, 7 Sep 2023 10:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
 <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
 <ZPmD5WNZzz279qZ7@orome>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZPmD5WNZzz279qZ7@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XbJwvbe96UzrF5hJWzfl03Nt"
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XbJwvbe96UzrF5hJWzfl03Nt
Content-Type: multipart/mixed; boundary="------------AfJPVNc8LkZzMyTF6XPV9OxB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Message-ID: <dd898338-813f-df63-4255-986903aa7cb6@suse.de>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
 <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
 <ZPmD5WNZzz279qZ7@orome>
In-Reply-To: <ZPmD5WNZzz279qZ7@orome>

--------------AfJPVNc8LkZzMyTF6XPV9OxB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDkuMjMgdW0gMTA6MDMgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMTA6MDQ6MjlBTSArMDIwMCwgRGFuaWVsIFZldHRl
ciB3cm90ZToNCj4+IE9uIFRodSwgMzEgQXVnIDIwMjMgYXQgMDg6MzMsIE1pa2tvIFBlcnR0
dW5lbiA8Y3luZGlzQGthcHNpLmZpPiB3cm90ZToNCj4+Pg0KPj4+IE9uIDgvMzAvMjMgMTM6
MTksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBIaQ0KPj4+Pg0KPj4+PiBBbSAy
NS4wOC4yMyB1bSAxNToyMiBzY2hyaWViIFRoaWVycnkgUmVkaW5nOg0KPj4+Pj4gRnJvbTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4+Pj4+DQo+Pj4+PiBUZWdy
YSBEUk0gZG9lc24ndCBzdXBwb3J0IGRpc3BsYXkgb24gVGVncmEyMzQgYW5kIGxhdGVyLCBz
byBtYWtlIHN1cmUNCj4+Pj4+IG5vdCB0byByZW1vdmUgYW55IGV4aXN0aW5nIGZyYW1lYnVm
ZmVycyBpbiB0aGF0IGNhc2UuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgOCArKysrKy0tLQ0KPj4+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pj4+DQo+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RybS5jDQo+Pj4+PiBpbmRleCBiMWUxYTc4ZTMwYzYuLjdhMzhkYWRi
YzI2NCAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYw0K
Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jDQo+Pj4+PiBAQCAtMTIy
MCw5ICsxMjIwLDExIEBAIHN0YXRpYyBpbnQgaG9zdDF4X2RybV9wcm9iZShzdHJ1Y3QNCj4+
Pj4+IGhvc3QxeF9kZXZpY2UgKmRldikNCj4+Pj4+ICAgICAgICBkcm1fbW9kZV9jb25maWdf
cmVzZXQoZHJtKTsNCj4+Pj4+IC0gICAgZXJyID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9mcmFt
ZWJ1ZmZlcnMoJnRlZ3JhX2RybV9kcml2ZXIpOw0KPj4+Pj4gLSAgICBpZiAoZXJyIDwgMCkN
Cj4+Pj4+IC0gICAgICAgIGdvdG8gaHViOw0KPj4+Pj4gKyAgICBpZiAoZHJtLT5tb2RlX2Nv
bmZpZy5udW1fY3J0YyA+IDApIHsNCj4+Pj4NCj4+Pj4gSWYgeW91IGRvbid0IHN1cHBvcnQg
dGhlIGhhcmR3YXJlLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gcmV0dXJuDQo+Pj4+IC1F
Tk9ERVYgaWYgIW51bV9jcnRjPw0KPj4+DQo+Pj4gV2hpbGUgZGlzcGxheSBpcyBub3Qgc3Vw
cG9ydGVkIHRocm91Z2ggVGVncmFEUk0gb24gVGVncmEyMzQrLCBjZXJ0YWluDQo+Pj4gbXVs
dGltZWRpYSBhY2NlbGVyYXRvcnMgYXJlIHN1cHBvcnRlZCwgc28gd2UgbmVlZCB0byBmaW5p
c2ggcHJvYmUgZm9yIHRob3NlLg0KPj4NCj4+IElkZWFsbHkgeW91IGFsc28gcmVnaXN0ZXIg
dGhlIHRlZ3JhIGRyaXZlciB3aXRob3V0IERSSVZFUl9NT0RFU0VUIHwNCj4+IERSSVZFUl9B
VE9NSUMgaW4gdGhhdCBjYXNlLCB0byBhdm9pZCB1bmVjZXNzYXJ5IHVzZXJzcGFjZSBjb25m
dXNpb24uDQo+PiBNb3N0IHVzZXJzcGFjZSBjYW4gY29wZSB3aXRoIGEgZGlzcGxheSBkcml2
ZXIgd2l0aG91dCBhbnkgY3J0YywgYnV0IEkNCj4+IHRoaW5rIHhvcmctbW9kZXNldHR0aW5n
IGFjdHVhbGx5IGZhbGxzIG92ZXIuIE9yIGF0IGxlYXN0IEkndmUgc2Vlbg0KPj4gc29tZSBo
YWNrcyB0aGF0IHRoZSBhZ3ggcGVvcGxlIGFkZGVkIHRvIG1ha2Ugc3VyZSBYIGRvZXNuJ3QN
Cj4+IGFjY2lkZW50YWxseSBvcGVuIHRoZSB3cm9uZyBkcml2ZXIuDQo+IA0KPiBUaGF0J3Mg
YSBnb29kIHBvaW50LiBIb3dldmVyIEkgcmVjYWxsIGZyb20gZWFybGllciBhdHRlbXB0cyBh
dCBkb2luZw0KPiBzb21ldGhpbmcgbGlrZSB0aGlzIGluIE5vdXZlYXUgKGFsdGhvdWdoIHRo
aXMgaXMgbm93IHZlcnkgbG9uZyBhZ28pIHRoYXQNCj4gaXQncyBub3QgdmVyeSBlYXN5LiBU
aGUgcHJvYmxlbSwgYXMgSSByZWNhbGwsIGlzIHRoYXQgdGhlIGRyaXZlciBpcyBhDQo+IHNp
bmdsZXRvbiwgc28gd2Ugd291bGQgZXNzZW50aWFsbHkgYmUgc3VwcG9ydGluZyBlaXRoZXIg
bW9kZXNldHRpbmcgb3INCj4gbm90LCBmb3IgYW55IGRldmljZSBpbiB0aGUgc3lzdGVtLg0K
DQpUYWtlIGEgbG9vayBhdCBzdHJ1Y3QgZHJtX2RldmljZS5kcml2ZXJfZmVhdHVyZXMuIEl0
IGxldCdzIHlvdSBjbGVhciB0aGUgDQpmbGFncyB0aGF0IHlvdXIgZGV2aWNlIGRvZXNuJ3Qg
c3VwcG9ydC4NCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS9zb3Vy
Y2UvaW5jbHVkZS9kcm0vZHJtX2RldmljZS5oI0wxMjgNCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gTm93LCBpdCdzIHVubGlrZWx5IHRoYXQgd2UnZCBoYXZlIGEgbWl4IG9m
IG9uZSBUZWdyYSBEUk0gZHJpdmVyIHdpdGgNCj4gZGlzcGxheSBzdXBwb3J0IGFuZCBhbm90
aGVyIHdpdGhvdXQsIGJ1dCBpdCdzIHNvbWV0aGluZyB0aGF0IEkgcmVjYWxsDQo+IGJhY2sg
YXQgdGhlIHRpbWUgd2l0aCBOb3V2ZWF1IHdhcyBwcm9ibGVtYXRpYyBiZWNhdXNlIHlvdSBj
b3VsZCBoYXZlIHRoZQ0KPiBUZWdyYSBpbnRlZ3JhdGVkIGdyYXBoaWNzICh3aXRob3V0IGRp
c3BsYXkgc3VwcG9ydCkgYW5kIGEgUENJLWNvbm5lY3RlZA0KPiBkaXNjcmV0ZSBHUFUgKHdp
dGggZGlzcGxheSBzdXBwb3J0KSB3aXRoaW4gdGhlIHNhbWUgc3lzdGVtLg0KPiANCj4gSSBu
ZWVkIHRvIGxvb2sgaW50byBpdCBhIGJpdCBtb3JlIHRvIHNlZSBpZiBJIGNhbiBjb21lIHVw
IHdpdGggc29tZXRoaW5nDQo+IGdvb2QgdG8gYWNjb3VudCBmb3IgdGhpcy4NCj4gDQo+IFRo
aWVycnkNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------AfJPVNc8LkZzMyTF6XPV9OxB--

--------------XbJwvbe96UzrF5hJWzfl03Nt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT5i2sFAwAAAAAACgkQlh/E3EQov+CN
KhAAgDnVn+JWXkR4znfhRMMq33jieCG3KvClEG4FpHKRGvVuwwjKEGYvW+GDhdpDaIJzjHqfsYht
O12Pfs8KK/4bF3d+GvKwaCElZfjd+k8no2oxl9s27qLtKpSJHpW4Y4+tIRKe7cRPXAmE8gGbEsFJ
so8nLc+GkZIFDphG/o74v8497dTMPnBWLGWxPRJg+f6nfCylXPEXtO5KW5TZd7B6POJYT7JNbUSQ
yFHEjHyZvTHcmHkBlC9TA2sM6A+0F4Mwc5FN/FuZ8j+3xBkCHCgGIfc43MzNGBXV/bUJZ6Haq5aN
aPqhIuNyBdUQdrYsjI7+McJTAvRrHb/p0BTn/6CPIJXJzjM/U9UV21DsqGyGJGiD3GEqgq/mYTCM
JEQmWFSODZ4GSFbHW2B+sfBwbb4ccXvmrGsYbdBEkOg4Yq8h7rqAJ7d1TTyLEsiAXsTgyCULx9a7
V3rlX6YBfvhry6VSjzhx2w7xe1BEtL+H2tLNvzZ/d7q69t+3ZtSYO4IGS2VmZbk8RC7XBATz3qHJ
0gVzmprFN+2wwoojg86KbflAwFhfNuYAnfcdtOrXiR67MZIjzMf2D+rnDrGTS33xJfLf+95HNN+v
DnykldVkZdK757EOiNpKvUQGEZJs6V9R9BTGZSPeQlwBjUmqCFDOLDkOyB9cAmVEaikYRuysigKM
iaI=
=+rNB
-----END PGP SIGNATURE-----

--------------XbJwvbe96UzrF5hJWzfl03Nt--
