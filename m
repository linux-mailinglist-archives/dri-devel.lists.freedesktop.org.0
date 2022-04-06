Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0E84F5819
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0789D10E060;
	Wed,  6 Apr 2022 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124C110E116
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:50:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 677C1210DE;
 Wed,  6 Apr 2022 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649235042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lD0ry4dQlfPEWiVab4evz/HYwwWqd7eDGwOxj0rnIk=;
 b=02hUbL+vxgoAP4OMfXcSDw60stGacRjLXZaBxvlX76FiE0amX2cnZLGrXEaVbvC57tlDTX
 RCII+RON48XaeMJrqz6Xw7XWUS5//elqLwpar5I+LtdKLFa5yB6TS7EXrRUmqAgIuYUwm0
 yptAY6fFxM0zekbDnjUePZ1TbIurcJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649235042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lD0ry4dQlfPEWiVab4evz/HYwwWqd7eDGwOxj0rnIk=;
 b=8hf8k2R6jZ5RClPobNyRV5tIPENPTbIkOcanFZ6jBvIwXDE1R4TnarLSZ0nKvPZip4PJxn
 V+SvJUkAakTNFXDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3035C139F5;
 Wed,  6 Apr 2022 08:50:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qjWRCmJUTWLGcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 08:50:42 +0000
Message-ID: <62ffcc58-3770-884f-611f-13cc0fddea4d@suse.de>
Date: Wed, 6 Apr 2022 10:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 11/12] drm/vc4: Add logging and comments
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-12-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220225143534.405820-12-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Xl5vKddbOyOOjhIwP7mL0o0k"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Xl5vKddbOyOOjhIwP7mL0o0k
Content-Type: multipart/mixed; boundary="------------zli0nFshZdlII5ARN0fhvShJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 linux-clk@vger.kernel.org
Message-ID: <62ffcc58-3770-884f-611f-13cc0fddea4d@suse.de>
Subject: Re: [PATCH v7 11/12] drm/vc4: Add logging and comments
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-12-maxime@cerno.tech>
In-Reply-To: <20220225143534.405820-12-maxime@cerno.tech>

--------------zli0nFshZdlII5ARN0fhvShJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI1LjAyLjIyIHVtIDE1OjM1IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gVGhl
IEhWUyBjb3JlIGNsb2NrIGlzbid0IHJlYWxseSBvYnZpb3VzLCBzbyBsZXQncyBhZGQgYSBi
dW5jaCBtb3JlDQo+IGNvbW1lbnRzIGFuZCBzb21lIGxvZ2dpbmcgZm9yIGVhc2llciBkZWJ1
Z2dpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vy
bm8udGVjaD4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jIHwg
MTEgKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMNCj4gaW5kZXggMjRkZTI5YmMxY2RhLi42ZmUw
M2ZjMTdkNzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jDQo+IEBAIC0zODksOCAr
Mzg5LDE1IEBAIHN0YXRpYyB2b2lkIHZjNF9hdG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGRy
bV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPiAgIAkJCQkJCTUwMDAwMDAwMCwNCj4gICAJCQkJ
CQluZXdfaHZzX3N0YXRlLT5jb3JlX2Nsb2NrX3JhdGUpOw0KPiAgIA0KPiArCQlkcm1fZGJn
KGRldiwgIlJhaXNpbmcgdGhlIGNvcmUgY2xvY2sgYXQgJWx1IEh6XG4iLCBjb3JlX3JhdGUp
Ow0KPiArDQo+ICsJCS8qDQo+ICsJCSAqIERvIGEgdGVtcG9yYXJ5IHJlcXVlc3Qgb24gdGhl
IGNvcmUgY2xvY2sgZHVyaW5nIHRoZQ0KPiArCQkgKiBtb2Rlc2V0Lg0KPiArCQkgKi8NCj4g
ICAJCWNsa19zZXRfbWluX3JhdGUoaHZzLT5jb3JlX2NsaywgY29yZV9yYXRlKTsNCj4gICAJ
fQ0KPiArDQo+ICAgCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVz
KGRldiwgc3RhdGUpOw0KPiAgIA0KPiAgIAl2YzRfY3RtX2NvbW1pdCh2YzQsIHN0YXRlKTsN
Cj4gQEAgLTQxNiw2ICs0MjMsMTAgQEAgc3RhdGljIHZvaWQgdmM0X2F0b21pY19jb21taXRf
dGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+ICAgCQlkcm1fZGJnKGRl
diwgIlJ1bm5pbmcgdGhlIGNvcmUgY2xvY2sgYXQgJWx1IEh6XG4iLA0KPiAgIAkJCW5ld19o
dnNfc3RhdGUtPmNvcmVfY2xvY2tfcmF0ZSk7DQo+ICAgDQo+ICsJCS8qDQo+ICsJCSAqIFJl
cXVlc3QgYSBjbG9jayByYXRlIGJhc2VkIG9uIHRoZSBjdXJyZW50IEhWUw0KPiArCQkgKiBy
ZXF1aXJlbWVudHMuDQo+ICsJCSAqLw0KPiAgIAkJY2xrX3NldF9taW5fcmF0ZShodnMtPmNv
cmVfY2xrLCBuZXdfaHZzX3N0YXRlLT5jb3JlX2Nsb2NrX3JhdGUpOw0KPiAgIAl9DQo+ICAg
fQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------zli0nFshZdlII5ARN0fhvShJ--

--------------Xl5vKddbOyOOjhIwP7mL0o0k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNVGEFAwAAAAAACgkQlh/E3EQov+Bl
ohAAqduPwfJMHn8DKbshiYC8q+MhL/14LTbuR7Qg6YyH7PymbLyXV/97RIR6rvzvKrucj9/90akT
AHMJ9wSriIP6tyBDNM80i/oAmF/7KR0LHNA1joLL48jq2tKgEjBSv/7rZ9pkWrtvuFnYd4h8EM8r
VH0p7St9O1iL3LnY3sNacrEefhKtE+wwNHVw72QEuYMAm3iM97vTp9zYU2WM5/Upkg4L4k6FzNrd
LVGd+eC4vB2dqOu8yDWh5rDXasynPf9+F+cqzGdoJzezeT/+cqu5g19NT0NM4n2fG8NHQJ7xkmtY
wuc6LNpP2dHi566yUruXhDH04YQDW6HS5g3ig+ESsUDdEEeznTelkvrOAQR8D1OYBOA5n83KoNJU
/Bt9bZIDWL+nzh6fY4BUAtoh38vNDp670epcsH/JF+9uwYZQW+E4iXpkMhrESrh2GTRr8dwZS/vK
NoXRP5CvaZgTwWcUBsr7l9kj6+wdK18Y47lllVCeN8XqKI3kb6iJbiT61Ud2Y0K9VhzM/0MKmx5E
XcRANTuXvaXileFtrNwx0sNdJWqzf0etpTml0Ory+QdKRJVww8B0yD5SNayCcv0EKWs44IEbNxXz
P8y479CoaKhlNH+ea5Kejat8b5hhFN5fJ6uJntM/irfmzV9S9XMQ5tLUB1+OfS5XcdAQFiVNVqLC
xUw=
=n+Kt
-----END PGP SIGNATURE-----

--------------Xl5vKddbOyOOjhIwP7mL0o0k--
