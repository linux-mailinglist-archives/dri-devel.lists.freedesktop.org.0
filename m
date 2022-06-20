Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8589551719
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 13:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A759510E036;
	Mon, 20 Jun 2022 11:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E0410E036
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 11:16:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB8B91F385;
 Mon, 20 Jun 2022 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655723808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XS7+i7TH+g9shY1vcxbADqcUpjauD/869q4I4bycsdY=;
 b=RXaSdqyKxEqiTGQYEw++KrmzT1Pgs6I/MOZhkSyeA2FXr3ZO4ksqWAQFNONnUYwU6ywbHU
 dWuRtnuJxatk84UrPKRh/6QGs5l1zOLU+LyoeNSY+gm6CagiD3ufYyu49vUF9lN+G9ouSp
 WL10tEbn3PNszVAwwcFl30enzHmFri0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655723808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XS7+i7TH+g9shY1vcxbADqcUpjauD/869q4I4bycsdY=;
 b=mc/P5Eh5A8O6XCsQmz2qGFaZ5dGsr68RPtjwm1RcgD5SffJJpZIovD7m4r8wlAqwSRBFnY
 9cwNTsd/C0SVa1BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81027134CA;
 Mon, 20 Jun 2022 11:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1s6PHiBXsGI5ewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 11:16:48 +0000
Message-ID: <0dd27b75-772c-da0e-9e17-638256e5c87b@suse.de>
Date: Mon, 20 Jun 2022 13:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 46/64] drm/vc4: txp: Remove duplicate regset
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-47-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-47-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i0Pt5XX8uwGQ0tA7KXITE8gW"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i0Pt5XX8uwGQ0tA7KXITE8gW
Content-Type: multipart/mixed; boundary="------------x6JKtyEV3lm3eH814zGriXHc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <0dd27b75-772c-da0e-9e17-638256e5c87b@suse.de>
Subject: Re: [PATCH 46/64] drm/vc4: txp: Remove duplicate regset
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-47-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-47-maxime@cerno.tech>

--------------x6JKtyEV3lm3eH814zGriXHc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA2LjIyIHVtIDExOjI5IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gVGhl
cmUncyBhbHJlYWR5IGEgcmVnc2V0IGluIHRoZSB2YzRfY3J0YyBzdHJ1Y3R1cmUgc28gdGhl
cmUncyBubyBuZWVkIHRvDQo+IGR1cGxpY2F0ZSBpdCBpbiB2YzRfdHhwLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+DQoNCkFja2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYyB8IDkgKysrKy0tLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYyBiL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X3R4cC5jDQo+IGluZGV4IDg3Yzg5NmY0ODJmYi4uNTFhYzAxODM4
MDkzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYw0KPiBAQCAtMTU0LDcgKzE1NCw2
IEBAIHN0cnVjdCB2YzRfdHhwIHsNCj4gICAJc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVj
dG9yIGNvbm5lY3RvcjsNCj4gICANCj4gICAJdm9pZCBfX2lvbWVtICpyZWdzOw0KPiAtCXN0
cnVjdCBkZWJ1Z2ZzX3JlZ3NldDMyIHJlZ3NldDsNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRp
YyBpbmxpbmUgc3RydWN0IHZjNF90eHAgKmVuY29kZXJfdG9fdmM0X3R4cChzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIpDQo+IEBAIC00OTMsOSArNDkyLDkgQEAgc3RhdGljIGludCB2
YzRfdHhwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIs
IHZvaWQgKmRhdGEpDQo+ICAgCXR4cC0+cmVncyA9IHZjNF9pb3JlbWFwX3JlZ3MocGRldiwg
MCk7DQo+ICAgCWlmIChJU19FUlIodHhwLT5yZWdzKSkNCj4gICAJCXJldHVybiBQVFJfRVJS
KHR4cC0+cmVncyk7DQo+IC0JdHhwLT5yZWdzZXQuYmFzZSA9IHR4cC0+cmVnczsNCj4gLQl0
eHAtPnJlZ3NldC5yZWdzID0gdHhwX3JlZ3M7DQo+IC0JdHhwLT5yZWdzZXQubnJlZ3MgPSBB
UlJBWV9TSVpFKHR4cF9yZWdzKTsNCj4gKwl2YzRfY3J0Yy0+cmVnc2V0LmJhc2UgPSB0eHAt
PnJlZ3M7DQo+ICsJdmM0X2NydGMtPnJlZ3NldC5yZWdzID0gdHhwX3JlZ3M7DQo+ICsJdmM0
X2NydGMtPnJlZ3NldC5ucmVncyA9IEFSUkFZX1NJWkUodHhwX3JlZ3MpOw0KPiAgIA0KPiAg
IAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnR4cC0+Y29ubmVjdG9yLmJhc2UsDQo+ICAg
CQkJCSAmdmM0X3R4cF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsNCj4gQEAgLTUyMSw3ICs1
MjAsNyBAQCBzdGF0aWMgaW50IHZjNF90eHBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkNCj4gICANCj4gICAJZGV2X3NldF9k
cnZkYXRhKGRldiwgdHhwKTsNCj4gICANCj4gLQl2YzRfZGVidWdmc19hZGRfcmVnc2V0MzIo
ZHJtLCAidHhwX3JlZ3MiLCAmdHhwLT5yZWdzZXQpOw0KPiArCXZjNF9kZWJ1Z2ZzX2FkZF9y
ZWdzZXQzMihkcm0sICJ0eHBfcmVncyIsICZ2YzRfY3J0Yy0+cmVnc2V0KTsNCj4gICANCj4g
ICAJcmV0dXJuIDA7DQo+ICAgfQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------x6JKtyEV3lm3eH814zGriXHc--

--------------i0Pt5XX8uwGQ0tA7KXITE8gW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwVx8FAwAAAAAACgkQlh/E3EQov+D/
ow/+N9Q4umgLlBq9Oi/srWxwno8ZeVSi/T09QroUm1lIKJsua86hX4LxK/3HeU66LwNL3aulVQGl
ZaVLj3vO2OpKrA0I4EPxgyUwh7F77166S029ITiIFdfI2faXITmGDbA52OYNbWHzdg0+l5UZkoCJ
Yy/wiH3b6nEPgYOaeOdJrzXHX1QvHlNk3DHZUq45er65LjnQWsda9fj3s3EIEew9GiuYQ70E5mR0
HUiHorKnQSYnJY/Tepgzrm0klJz6oA1PrZmXqyqclZ7ggWQPYdRzMxLFFKbrKcZc0zS5dp3p/UU+
9XIgjL8xXQ+cqp5UJ6O489B9ig6Nc4BDT2JlLjOaRbVpN+8dVWO0mVFdWskH2UrkeWIospQ5QTIn
NHhzFJkWE3gE/NbAKWRAIp3qubUzdz2clEukugqmQhqw/KngVlsw4LFujboVVQSaf0xtlZOO6jXa
xz+I6UDF188declo9FnzCNpu8PW/X0Y4ElJWiSKvemohi+tX2sF1bY2sjoY4FxlUl5gi/6NoUNuv
Hh4c1NI2eDGvlwdAMLqWJpU8B/uk8Yq1TXKX6cPNx/4unbb5evVhb3aSrZ38hV8+vPOgUwHJfOuF
uj4ntcIsolOHVatSpSzvvM2yo87jN60COK9WJLkHMnmXziwh79HUKlYkz9kINkPAO7P56NxeD7bd
+qs=
=j/Cl
-----END PGP SIGNATURE-----

--------------i0Pt5XX8uwGQ0tA7KXITE8gW--
