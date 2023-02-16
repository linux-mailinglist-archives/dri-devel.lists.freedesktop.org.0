Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996369959B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0210E2B7;
	Thu, 16 Feb 2023 13:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7765710E2B7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:21:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2418421C5F;
 Thu, 16 Feb 2023 13:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676553704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4i6LhV6BKsXjCWJhZgmrEDCuS2BlLfQZRN2OH0+91HU=;
 b=V5MR224zHO6eC1Fb6beAYrwDf75lglLW9zgr5rRR0zXGRR+df6VAaUVD/lUvW2PbkgrDxs
 tMyKIdb4S1LzaHRa/TcSsmLyH/jDq4S2d9b/XIusMNzzy5qHJtT7vkdrpJctMWB5Jk55y+
 iOvboAist3f5Z1fwiAo+evtkya0/YxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676553704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4i6LhV6BKsXjCWJhZgmrEDCuS2BlLfQZRN2OH0+91HU=;
 b=X8EVganOq6TW6AtWRjFCuS/QdO+wmFeoBrfy8Qq+Igfh1vLmhu1CieUSu9cU8atNywvQnF
 29wXqATj3VvBdxAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F15E913438;
 Thu, 16 Feb 2023 13:21:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xf8QOuct7mPCWQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Feb 2023 13:21:43 +0000
Message-ID: <ba4daf50-4882-5009-5c68-4385cacfdccb@suse.de>
Date: Thu, 16 Feb 2023 14:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de> <Y+4nIxRhF7KF2Qo0@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y+4nIxRhF7KF2Qo0@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ItdRS0GhAg8Vy85sidt8tFYn"
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ItdRS0GhAg8Vy85sidt8tFYn
Content-Type: multipart/mixed; boundary="------------E2FXlCWjWbMUpwspfYy9xusH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann
 <kraxel@redhat.com>, airlied@redhat.com, sam@ravnborg.org
Message-ID: <ba4daf50-4882-5009-5c68-4385cacfdccb@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de> <Y+4nIxRhF7KF2Qo0@intel.com>
In-Reply-To: <Y+4nIxRhF7KF2Qo0@intel.com>

--------------E2FXlCWjWbMUpwspfYy9xusH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDIuMjMgdW0gMTM6NTIgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIFRodSwgRmViIDE2LCAyMDIzIGF0IDAxOjAzOjAyUE0gKzAxMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gdGhhbmtzIGZvciB0YWtpbmcgYSBsb29r
IGF0IHRoZSBwYXRjaGVzLg0KPj4NCj4+IEFtIDE2LjAyLjIzIHVtIDEyOjMzIHNjaHJpZWIg
R2VyZCBIb2ZmbWFubjoNCj4+PiBPbiBXZWQsIEZlYiAxNSwgMjAyMyBhdCAwNToxNToxN1BN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gU2V0IHRoZSBWR0EgYml0
IGZvciB1bmJsYW5raW5nIHdpdGggbWFjcm8gY29uc3RhbnRzIGluc3RlYWQgb2YgbWFnaWMN
Cj4+Pj4gdmFsdWVzLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+Pj4NCj4+PiBibGFuay91
bmJsYW5rIHNob3VsZCB3b3JrIHNpbWxpYXIgdG8gYm9jaHMgKHNlZSBjb21taXQgMjUwZTc0
MzkxNWQ0KSwNCj4+PiB0aGF0IGlzIG1heWJlIGEgbmljZSB0aGluZyB0byBhZGQgb2YgeW91
IG1vZGVybml6ZSB0aGUgZHJpdmVyIGFueXdheS4NCj4+IFllYWgsIGl0J3MgdGhlIFZHQSBQ
QVMgZmllbGQuIFsxXSBCdXQgaXMgaXQgcmVhbGx5IGNhbGxlZCBibGFua2luZz8gUEFTDQo+
PiBjb250cm9scyBwYWxldHRlIGFjY2VzcywgYnV0IGJsYW5raW5nIGlzIHNvdW5kcyBtb3Jl
IGxpa2UgRFBNUy4NCj4gDQo+IFdoeSBhcmVuJ3QgcGVvcGxlIGp1c3QgdXNpbmcgdGhlIG5v
cm1hbCB3YXkgb2YgZmxpcHBpbmcgdGhlDQo+IHNjcmVlbiBvZmYgYml0IGluIHNlcXVlbmNl
ciByZWdpc3RlciAwMT8NCg0KU2V0dGluZyB0aGUgU0QgYml0IGluIFNSMDEgaXNuJ3QgYSBi
YWQgaWRlYS4gV2UgY2FuIGRvIHRoaXMgYXMgcGFydCBvZiANCmVuYWJsaW5nL2Rpc2FibGlu
ZyB0aGUgcGxhbmUuDQoNCkJ1dCBmb3IgUEFTLCB3ZSBkb24ndCBoYXZlIGEgY2hvaWNlLiBJ
dCdzIG9uZSBvZiB0aGUgYmF6aWxsaW9uIG9ic2N1cmUgDQpWR0Egc2V0dGluZ3MgYW5kIChh
Y2NvcmRpbmcgdG8gYSBjb21tZW50IGluIHRoZSBzb3VyY2UgY29kZSkgd2UgbmVlZCB0byAN
CnVwZGF0ZSBpdCBmb3IgY29tcGF0aWJpbGl0eS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gDQo+Pg0KPj4gVGhlIFBBUyBzZXR0aW5nIGlzIGFjdHVhbGx5IHBhcnQgb2Yg
dGhlIHByaW1hcnkgcGxhbmUsIHNvIGl0J3MgY3VycmVudA0KPj4gbG9jYXRpb24gaW4gdGhl
IENSVEMgY29kZSBpcyBtaXNsZWFkaW5nLiBJIGRpZG4ndCB3YW50IHRvIGNoYW5nZSB0aGUN
Cj4+IGRyaXZlciBsb2dpYyB0b28gbXVjaCwgYnV0IEkgZ3Vlc3MgSSdsbCBmaXggdGhhdCBp
biB0aGUgbmV4dCBpdGVyYXRpb24uDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMN
Cj4+DQo+PiBbMV0NCj4+IGh0dHBzOi8vd2ViLnN0YW5mb3JkLmVkdS9jbGFzcy9jczE0MC9w
cm9qZWN0cy9waW50b3Mvc3BlY3MvZnJlZXZnYS92Z2EvYXR0cnJlZy5odG0jM0MwDQo+Pg0K
Pj4+DQo+Pj4gdGFrZSBjYXJlLA0KPj4+ICAgICBHZXJkDQo+Pj4NCj4+DQo+PiAtLSANCj4+
IFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------E2FXlCWjWbMUpwspfYy9xusH--

--------------ItdRS0GhAg8Vy85sidt8tFYn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPuLecFAwAAAAAACgkQlh/E3EQov+DY
kQ//d+hurP9LqNUyV03rRRATEbJPoLKeaS3xt1kf/svmy1XSxdW4xon1I1soaK/XacFrFIxa1g66
A0HOOuU7GfQPYcpxvRg6+Fn8QldBWKwuINj2OdWO6Foaj/VIdXl8lSA5P3SEvuHTgjuC8HGvLkd5
xqihgJTcw/D0BCLJ5HIEcNdAtNWvi0TnmUpC+3DkHHiaZjUQq+3FX1HZt/YrZ0O8wXtqh4mUbcks
FjcceL06ejPplQSIvWlo3aD6BxzVzo5WC4jf/EuSsByszPUg3fzp2L5mB0O/42EqUrdUY+BVTXFE
MFE7KVvUoD10N+l1gSdp7aAN5TYO03feBBjv1WMvDu7VsnzwxRNAXoeYEs2HdAa0IvzsIYBPjL06
m7n+Kyu70kLLgk39igyHXMeyKDKHQdz/QpsczSCu6g1XSKZZhAtbLSlnrewBFkXXfSRCtPkESikJ
BPyOSpkpS45EvhsZ/gnNeAGkaWUFKIPXhUWpDJnTYLv8Eh9i4NoX7/weAJ7nPhOAaQzH//tnu1O1
gxMncPYPZalw3iVx7g2i01P7Nk2VZvzmrDybKsmTlpHtQf9gf6s8w3Ruldoyu+g+IvpEY55BkK+8
o2s9LXcA58J8fcbiI+LdEp5xH6CEu828eOCubf91r+1w60sbEgRXB8POWiq7I5r5H211NjNIawS/
yik=
=D0Cs
-----END PGP SIGNATURE-----

--------------ItdRS0GhAg8Vy85sidt8tFYn--
