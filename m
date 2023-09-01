Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B778FBFF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 12:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1784A10E5E1;
	Fri,  1 Sep 2023 10:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FFC10E5E1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 10:59:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DFE02185A;
 Fri,  1 Sep 2023 10:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693565946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oaAifDCb7pXiXvrUdNzBqZP5QcjUbtDnryXp5WBpt9s=;
 b=IeIPxj99i++E0Fozs7RZTMIIp4Ecfu0NYu775zRiTTq1h7GPvr+a7wEo/eyeqI8sIBjKX5
 4twendUkWvBcp0m3tvq9iEZOtTqhKU/dt/pPEpzYc6LV4vSNhwBfIiXhAM30s4WRgBxLw4
 MS7SN5+HECSSI3OacRXR7HGqAg6Cu5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693565946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oaAifDCb7pXiXvrUdNzBqZP5QcjUbtDnryXp5WBpt9s=;
 b=bJRoCDwAxoea4O8QmmTG1YZypQyGHn7jiBDFUJpqlq950Iaew39pKKHuy/k74IgPQi9CHA
 wVbsK6YPyNqMqiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E84413582;
 Fri,  1 Sep 2023 10:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gRXLGfrD8WSDcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Sep 2023 10:59:06 +0000
Message-ID: <a6eca431-7464-09da-333d-a40318422077@suse.de>
Date: Fri, 1 Sep 2023 12:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230830062546.720679-1-javierm@redhat.com>
 <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
 <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S3pFUnfsJ7f8uJBUuD6zm9Qk"
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S3pFUnfsJ7f8uJBUuD6zm9Qk
Content-Type: multipart/mixed; boundary="------------Dn2nE0oBpXFk3eVDv0psxhU1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Message-ID: <a6eca431-7464-09da-333d-a40318422077@suse.de>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
References: <20230830062546.720679-1-javierm@redhat.com>
 <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
 <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>

--------------Dn2nE0oBpXFk3eVDv0psxhU1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDkuMjMgdW0gMDk6NDggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gSGkgSmF2aWVyLA0KPj4NCj4+IGFub3RoZXIgaWRlYSBhYm91dCB0aGlz
IHBhdGNoOiB3aHkgbm90IGp1c3Qga2VlcCB0aGUgYWxsb2NhdGlvbiBpbiB0aGUNCj4+IHBs
YW5lJ3MgYXRvbWljIGNoZWNrLCBidXQgc3RvcmUgdGhlIHRlbXBvcmFyeSBidWZmZXJzIGlu
IGEgcGxhbmUgc3RydWN0Lg0KPj4gWW91J2Qgb25seSBncm93IHRoZSBhcnJheXMgbGVuZ3Ro
IGluIGF0b21pY19jaGVjayBhbmQgbGF0ZXIgZmV0Y2ggdGhlDQo+PiBwb2ludGVycyBpbiBh
dG9taWNfdXBkYXRlLiBJdCBuZWVkcyBzb21lIGxvY2tpbmcsIGJ1dCBub3RoaW5nIGNvbXBs
aWNhdGVkLg0KPj4NCj4gDQo+IFllcywgdGhhdCB3b3VsZCB3b3JrIHRvby4gQW5vdGhlciBv
cHRpb24gaXMgdG8ganVzdCBtb3ZlIHRoZSBidWZmZXJzIHRvDQo+IHN0cnVjdCBzc2QxMzB4
X2RldmljZSBhcyBpdCB3YXMgYmVmb3JlIGNvbW1pdCA0NWI1ODY2OWU1MzIgKCJkcm0vc3Nk
MTMweDoNCg0KQWRkaW5nIHNvbWV0aGluZyBsaWtlIGEgc3RydWN0IHNzZDEzMHhfcGxhbmUg
dGhhdCBob2xkcyB0aGUgdGVtcG9yYXJ5IA0KbWVtb3J5IGhhcyB0aGUgYWR2YW50YWdlIG9m
IG1ha2luZyBhIGNsZWFyIGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgbWVtb3J5IA0KYW5kIHRo
ZSBwbGFuZS4gSWYgbm90aGluZyBlbHNlLCB0byB0aGUgbmV4dCBwcm9ncmFtbWVyIHJlYWRp
bmcgdGhlIGNvZGUuDQoNCj4gQWxsb2NhdGUgYnVmZmVyIGluIHRoZSBwbGFuZSdzIC5hdG9t
aWNfY2hlY2soKSBjYWxsYmFjayIpIGJ1dCBqdXN0IG1ha2UNCj4gdGhlbSBmaXhlZCBhcnJh
eXMgd2l0aCB0aGUgc2l6ZSBvZiB0aGUgYmlnZ2VzdCBmb3JtYXQuDQoNCldoYXQgaXMgdGhl
IHNpemUgb2YgdGhlIGJpZ2dlc3QgZm9ybWF0PyBJIGhhdmVuJ3QgcmVhZCB0aGUgZHJpdmVy
IGNvZGUsIA0KYnV0IGEgc2hhZG93IHBsYW5lIGNhbiBiZSB1cCB0byA0MDk2IHBpeGVscyB3
aWRlLiBJdCdzIDE2IEtpQiBmb3IgDQpYUkdCODg4LiBOb3QgdG9vIG11Y2gsIGJ1dCBub3Qg
bm90aGluZyBlaXRoZXIuDQoNClRvIHJlZHVjZSBhbGxvY2F0aW9uIGFuZC9vciBsb2NraW5n
IG92ZXJoZWFkLCB5b3UgY291bGQgdHJ5IHRvIHVwZGF0ZSANCnRoZSBwb2ludGVycyBpbiB0
aGUgcGxhbmUgc3RydWN0IHdpdGggUkNVIHNlbWFudGljcy4gUGxhbmUgdXBkYXRlcyB3b3Vs
ZCANCnVzZSB3aGF0ZXZlciBwb2ludGVyIHRoZXkgc2F3LCB3aGlsZSB0aGUgcGxhbmUncyBh
dG9taWNfY2hlY2sgY291bGQgZ3JvdyANCnRoZSBtZW1vcnkgYnVmZmVycyBhcyBuZWNlc3Nh
cnkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoYXQgd2lsbCBiZSBzb21l
IG1lbW9yeSB3YXN0ZWQgYnV0IHdpbGwgcHJldmVudCB0aGUgcHJvYmxlbSBvZiB0cnlpbmcg
dG8NCj4gYWxsb2NhdGUgYnVmZmVycyBhZnRlciBkcm1fYXRvbWljX2hlbHBlcl9zd2FwX3N0
YXRlKCkgaGFzIGJlZW4gY2FsbGVkLg0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFz
DQo+Pg0KPj4gQW0gMzAuMDguMjMgdW0gMDg6MjUgc2NocmllYiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXM6DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------Dn2nE0oBpXFk3eVDv0psxhU1--

--------------S3pFUnfsJ7f8uJBUuD6zm9Qk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTxw/kFAwAAAAAACgkQlh/E3EQov+DD
XA/+NsrajO9lVGArI8052Wvzc+LW2cXijhMA5MQGLrJCBnrUdLj1pViNLNjPdFMaz7crvDP+cyTJ
kAAvmnXwhTzhLyHq7tCQjjNwt0jcryW3VnHtMn5blN7Z7TrUVhLpisyA8U9cvFUFjvfxYHChcOxB
0z1dOpFXY80XzV0wduExWWK8D4PAVZlcVeLHcSTHSWIWWgW61ZxhMY44/k1CanNiTTFgPOwB9Rhl
3RQNrQ7g9dr1zt2tjH6VrVdfzJxsZU13G8dYTWJI6Ka3opct7kJIn9ToP4OD66CzMZhAId4Tpq72
h1ePqNfSxbNe+WELAnn9MQp/3kj+DeGO1+Y3lrVLE+51OGU9TjSYBD12Gyz8Dak57yf80GiFU5aW
z6vCrA03iZuIs4/9DMW11/z6NiDqpmK7hGhHCGrSDXkZBpBvzAZUvpwJMz6RM/HBzs3LCtx4Bek+
u+cEtyaZ1YOk2iLRg9x1tUM+BYZXirV5VF6wvulr26v3VT2RNQFhT+8QPjqLCCHO6a6mPESMGpuo
4pNKv5Mjj9qoXZ6ej6wPvNWWIUs6jVgmb/VIM6BVruxfiu8O6EiAslp1cgjzb3QVcIlQmeE45az1
dH0UcH2vojaUKPIltET802ZPL53M/x7bLANemSOBhSBAXodoQo8nquWuXMltDkunr4I7YP4DxELl
tiE=
=aGRz
-----END PGP SIGNATURE-----

--------------S3pFUnfsJ7f8uJBUuD6zm9Qk--
