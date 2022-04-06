Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCB4F581A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7DE10E18D;
	Wed,  6 Apr 2022 08:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5DA10E218
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:53:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0AF7B1F38A;
 Wed,  6 Apr 2022 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649235199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EzGAQ/MofS+m8XrNR8nWydZTr6PeSPMu+omNIpQeHBA=;
 b=WvFRtJMcgnuV44HT4HDNz2TJxPr/tVBCoTJH9shiK+uch9QD8jbsW/WTJebk5oIB95Kw6f
 fZuUFgI9VvKyxNFehF0AK3NzBSawGYUv7euTibYFc2hBWeuEcljrrcB85M5eRAW7cZI1CQ
 kML8wpEcHDd040xWk9B6oT/JIlVWHyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649235199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EzGAQ/MofS+m8XrNR8nWydZTr6PeSPMu+omNIpQeHBA=;
 b=8m/tuwTE2W7vdpkWV73106BkQqhWRyWWsFRyHKF4iHe4TrwLzI2XOhWhW4dTy2QsPAa7mA
 b6JKMXS8czuZ1sAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4F95139F5;
 Wed,  6 Apr 2022 08:53:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8L7nJv5UTWJqdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 08:53:18 +0000
Message-ID: <b1e7c3ad-1641-3466-e7df-f232d0fe4239@suse.de>
Date: Wed, 6 Apr 2022 10:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 12/12] drm/vc4: hdmi: Remove clock rate initialization
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-13-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220225143534.405820-13-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RtGF9mbG2qwnUI51Xrmvz4jr"
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
--------------RtGF9mbG2qwnUI51Xrmvz4jr
Content-Type: multipart/mixed; boundary="------------dqTW1P6o0A0qYobMjYw27y8o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 linux-clk@vger.kernel.org
Message-ID: <b1e7c3ad-1641-3466-e7df-f232d0fe4239@suse.de>
Subject: Re: [PATCH v7 12/12] drm/vc4: hdmi: Remove clock rate initialization
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-13-maxime@cerno.tech>
In-Reply-To: <20220225143534.405820-13-maxime@cerno.tech>

--------------dqTW1P6o0A0qYobMjYw27y8o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI1LjAyLjIyIHVtIDE1OjM1IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gTm93
IHRoYXQgdGhlIGNsb2NrIGRyaXZlciBtYWtlcyBzdXJlIHdlIG5ldmVyIGVuZCB1cCB3aXRo
IGEgcmF0ZSBvZiAwLA0KPiB0aGUgSERNSSBkcml2ZXIgZG9lc24ndCBuZWVkIHRvIGNhcmUg
YW55bW9yZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBj
ZXJuby50ZWNoPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5j
IHwgMTMgLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gaW5kZXggOTJiMTUzMGFhMTdi
Li4yMWFmZjNhZDk2Y2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gQEAg
LTI1NzYsMTkgKzI1NzYsNiBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpDQo+ICAgCQkJ
dmM0X2hkbWktPmRpc2FibGVfNGtwNjAgPSB0cnVlOw0KPiAgIAl9DQo+ICAgDQo+IC0JLyoN
Cj4gLQkgKiBJZiB3ZSBib290IHdpdGhvdXQgYW55IGNhYmxlIGNvbm5lY3RlZCB0byB0aGUg
SERNSSBjb25uZWN0b3IsDQo+IC0JICogdGhlIGZpcm13YXJlIHdpbGwgc2tpcCB0aGUgSFNN
IGluaXRpYWxpemF0aW9uIGFuZCBsZWF2ZSBpdA0KPiAtCSAqIHdpdGggYSByYXRlIG9mIDAs
IHJlc3VsdGluZyBpbiBhIGJ1cyBsb2NrdXAgd2hlbiB3ZSdyZQ0KPiAtCSAqIGFjY2Vzc2lu
ZyB0aGUgcmVnaXN0ZXJzIGV2ZW4gaWYgaXQncyBlbmFibGVkLg0KPiAtCSAqDQo+IC0JICog
TGV0J3MgcHV0IGEgc2Vuc2libGUgZGVmYXVsdCBhdCBydW50aW1lX3Jlc3VtZSBzbyB0aGF0
IHdlDQo+IC0JICogZG9uJ3QgZW5kIHVwIGluIHRoaXMgc2l0dWF0aW9uLg0KPiAtCSAqLw0K
PiAtCXJldCA9IGNsa19zZXRfbWluX3JhdGUodmM0X2hkbWktPmhzbV9jbG9jaywgSFNNX01J
Tl9DTE9DS19GUkVRKTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlnb3RvIGVycl9wdXRfZGRjOw0K
PiAtDQo+ICAgCS8qDQo+ICAgCSAqIFdlIG5lZWQgdG8gaGF2ZSB0aGUgZGV2aWNlIHBvd2Vy
ZWQgdXAgYXQgdGhpcyBwb2ludCB0byBjYWxsDQo+ICAgCSAqIG91ciByZXNldCBob29rIGFu
ZCBmb3IgdGhlIENFQyBpbml0Lg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------dqTW1P6o0A0qYobMjYw27y8o--

--------------RtGF9mbG2qwnUI51Xrmvz4jr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNVP0FAwAAAAAACgkQlh/E3EQov+Bb
Uw//QIql1fZy9kuJhuDDXDx+YbjD1BUZxyhi6zuh7NDJK9p/6Q796tvK2qqjdG8UPlY+5T6H5R1L
fEsE8AM00gNA/P7AfsZ1tte7J1oVQX2+h05EhT0YVJIETWZtFiLh9VN1vdbY9baPZZsBNpQFHt33
VRmh7ULjoT8wwlvVHFrmlQDYnSYdruYGDMCOjnxSzGmk9ut8rGim5Q1l45sHzaKdZomYZOlg7pSp
V4JZAwdfzZWjsi4HFew8vtVNUd5sZH0ZNmb0A6XwVqpHvOOL3Dkio5/obuA0yFU2fyRUwy9krata
Y0p1dcjEQ74yBWzcI4e5Cxsj4YGryPRobtqEG5ZrlPuGez47Wk47JFV61bl/YFnH42Jb/qZejtEs
kHTflPap95a8Jwhkb4NubBuSPAWpGyx0d/ux74KfZQvtewUlzAKvr6iMWKWmfY7wDSTJaAusyEJz
JieqnbKTcGph9SU8I6h7Yqx6UKFWP3+NAfaBFe3u9TGprSuKymrxtgGKrWKk7fZn/7qliURGWGHw
iltBTKCK9JTX7cklDG8bPNqWKqR49keGhs9h7vhRCTAEQcb/IDph4GsoxsJqbzhfJoQawrqzonPR
okXUrMBQ2auXcH5KAC7/pA0HI1eLE399tDIKqUKo0cbDt7oFJnbW9imDvblp8Hgdg+PvcfDo9ecQ
ki0=
=Ifv/
-----END PGP SIGNATURE-----

--------------RtGF9mbG2qwnUI51Xrmvz4jr--
