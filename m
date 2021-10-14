Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3342D9C0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62346E882;
	Thu, 14 Oct 2021 13:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7096E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:08:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB50A1FD33;
 Thu, 14 Oct 2021 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634216902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UnMhzxYojByyLRzAMZ6RpIM35OXpPQBIfD+frz88bHE=;
 b=gviUgw4Ne5km/oQx7JTTfXFCBwU9qVODaxXsHteo+tHdT+3mu1bOiK7nMrfRr6uqmFaenV
 A9IP/UC9pZenwAs61P/gAMXVKbI/ZSOA6rwIOhrft6V1SnOziEMfllgx+braNPRl0mMgxr
 i5bxP4nM5a6acBrauw3hl6hkD4scXCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634216902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UnMhzxYojByyLRzAMZ6RpIM35OXpPQBIfD+frz88bHE=;
 b=MCLTt3AIxbvz4QjaneGXOPTRGk6GTHPyJhziu58x47V0R4yX+JVNRRY5a49sajUWBhP9fY
 iNAFT4jY/9H2ppDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8824413D8A;
 Thu, 14 Oct 2021 13:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sSmDH8YraGF0UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Oct 2021 13:08:22 +0000
Message-ID: <b182a5b4-84d2-44a1-165f-728e9e8046e5@suse.de>
Date: Thu, 14 Oct 2021 15:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Content-Language: en-US
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, edmund.j.dea@intel.com
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-7-anitha.chrisanthus@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211013233632.471892-7-anitha.chrisanthus@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0zwKV97qx1aaoDbCPtBby6uR"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0zwKV97qx1aaoDbCPtBby6uR
Content-Type: multipart/mixed; boundary="------------d43ROBy6b0igkVFqJ2hQyPfd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, edmund.j.dea@intel.com
Message-ID: <b182a5b4-84d2-44a1-165f-728e9e8046e5@suse.de>
Subject: Re: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-7-anitha.chrisanthus@intel.com>
In-Reply-To: <20211013233632.471892-7-anitha.chrisanthus@intel.com>

--------------d43ROBy6b0igkVFqJ2hQyPfd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTAuMjEgdW0gMDE6MzYgc2NocmllYiBBbml0aGEgQ2hyaXNhbnRodXM6
DQo+IEVuYWJsZSBzdXBwb3J0IGZvciBmYmNvbiAoZnJhbWVidWZmZXIgY29uc29sZSkuDQo+
IFRoZSB1c2VyIGNhbiBpbml0aWFsaXplIGZiY29uIGJ5IGxvYWRpbmcga21iLWRybSB3aXRo
IHRoZSBwYXJhbWV0ZXINCj4gY29uc29sZT0xLg0KPiANCj4gdjI6IGFkZGVkIG1pc3Npbmcg
c3RhdGljIGNsa19lbmFibGUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEVkbXVuZCBEZWEgPGVk
bXVuZC5qLmRlYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFuaXRoYSBDaHJpc2Fu
dGh1cyA8YW5pdGhhLmNocmlzYW50aHVzQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2ttYi9rbWJfZHJ2LmMgfCAxMSArKysrKysrKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2ttYi9rbWJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYw0K
PiBpbmRleCA5NjFhYzZmYjVmY2YuLmI0ZTY2ZWFjNjNiNSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2ttYi9rbWJfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2tt
Yi9rbWJfZHJ2LmMNCj4gQEAgLTUsNiArNSw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2Nsay5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGVwYXJhbS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5o
Pg0KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9vZl9yZXNlcnZlZF9tZW0uaD4NCj4gQEAgLTE1LDYgKzE2LDcgQEANCj4gICANCj4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fZHJ2Lmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4NCj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9w
cm9iZV9oZWxwZXIuaD4NCj4gQEAgLTI0LDYgKzI2LDEyIEBADQo+ICAgI2luY2x1ZGUgImtt
Yl9kc2kuaCINCj4gICAjaW5jbHVkZSAia21iX3JlZ3MuaCINCj4gICANCj4gKy8qIE1vZHVs
ZSBQYXJhbWV0ZXJzICovDQo+ICtzdGF0aWMgYm9vbCBjb25zb2xlOw0KPiArbW9kdWxlX3Bh
cmFtKGNvbnNvbGUsIGJvb2wsIDA0MDApOw0KPiArTU9EVUxFX1BBUk1fREVTQyhjb25zb2xl
LA0KPiArCQkgIkVuYWJsZSBmcmFtZWJ1ZmZlciBjb25zb2xlIHN1cHBvcnQgKDA9ZGlzYWJs
ZSBbZGVmYXVsdF0sIDE9b24pIik7DQo+ICsNCj4gICBzdGF0aWMgaW50IGttYl9kaXNwbGF5
X2Nsa19lbmFibGUoc3RydWN0IGttYl9kcm1fcHJpdmF0ZSAqa21iKQ0KPiAgIHsNCj4gICAJ
aW50IHJldCA9IDA7DQo+IEBAIC01NTksNiArNTY3LDkgQEAgc3RhdGljIGludCBrbWJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAJaWYgKHJldCkNCj4gICAJ
CWdvdG8gZXJyX3JlZ2lzdGVyOw0KPiAgIA0KPiArCWlmIChjb25zb2xlKQ0KPiArCQlkcm1f
ZmJkZXZfZ2VuZXJpY19zZXR1cCgma21iLT5kcm0sIDMyKTsNCg0KVGhlIHVzZSBvZiB0aGUg
ZmluYWwgcGFyYW1ldGVyIGlzIHNvbWV3aGF0IGNvbmZ1c2luZyBhbmQgc2hvdWxkIHByb2Jh
Ymx5IA0KYmUgMC4gSXQncyB0aGUgbnVtYmVyIG9mIGJpdHMgcGVyIHBpeGVsLiAzMiBpcyB0
aGUgZGVmYXVsdC4gQnV0IHRoZSANCnByZWZlcnJlZCB3YXkgb2Ygc2VsZWN0aW5nIGNvbG9y
IG1vZGUgaXMgdmlhIA0KZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGgsIHdoaWNo
IGlzIHRoZSBjb2xvciBkZXB0aCAoMjQhKS4gU28gDQptYXliZSByYXRoZXIgc2V0IHByZWZl
cnJlZF9kZXB0aCB0byAyNCBhbmQgbGV0IHRoZSBmYmRldiBoZWxwZXIgZmlndXJlIA0Kb3V0
IHRoZSBkZXRhaWxzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsNCj4gICAJcmV0
dXJuIDA7DQo+ICAgDQo+ICAgIGVycl9yZWdpc3RlcjoNCj4gDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------d43ROBy6b0igkVFqJ2hQyPfd--

--------------0zwKV97qx1aaoDbCPtBby6uR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFoK8UFAwAAAAAACgkQlh/E3EQov+Ah
ZxAAoWQ2iUVrjXlSOi7KdV/g1RNe8oyfCTj06VasaQXmVPlqXBJMDKEyiAqkUWi16fQXwQK56eT3
sCEcEjk+w7lFydOtEGDvO91pbrpVze/fYw1BP+PakMP/MC17Fhz+rjm6KSx/KBx+e58UkCQ47I7p
HOtwSYTglyDtsbSthuFwR2Fb9i1etqV6jYchHUNGCUmC9aWXqVsXZt/IVOnn/aNPbZXgDX3BdoMk
gX8GaM10GGdHbM0MQuzxcE6ZacqloCNaS6gWSkn06pnpXblDKal3wMFfkq7Hu0JrRY4XUPUkX0oe
dk7h5qIzTaKHo3fFHH7YlVkFWUmtpX54F39306KzW366KL6Qxr6k3hqzEshhdFuQFYzR+gakvZK0
s2U5nifDmyiGiW4zP08TOSIAp2I4tImv404yLrzhKCW+v3bNh+n54kJN6qevtTdWGUn1obkAFnlA
PkrBRqbFBx0i9mLvRBzd8gpogcKJbuqScK/ec2KES7bF0jtciih6gvm+Lm76QRP7uTc9nVZfEvB3
ti2i5MFOBG1AShrpBj+BeKxeUP+0ToTYkQUjIDDNtKWuZ9+zi4kpng/Ysqpy47ocVy0WdEYvb38S
nC0L2918qjqFodTL3W3+450GbFomlilgC9RqnswsPp7U/5Zgk9VnSFp8kOsLBBz1IUI9FByCxHgG
070=
=Xh6R
-----END PGP SIGNATURE-----

--------------0zwKV97qx1aaoDbCPtBby6uR--
