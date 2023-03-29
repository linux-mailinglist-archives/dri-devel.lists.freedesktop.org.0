Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5766CD5D3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 11:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41E310E518;
	Wed, 29 Mar 2023 09:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2EC10E52B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:04:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3F5E1FDEE;
 Wed, 29 Mar 2023 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680080657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WI8BEur271kmRLX+iQ3dCgc++8Y7H/Sb22u2MuBKC3U=;
 b=QSPIpQ5YRhu893vZR0iyN3n0CXQDjeYSRjqwnfEJqEkpgg6IHe01OYUU2E2iOiI4rBIKa2
 xMmPcsYe4mF3XqlDRB18M0ZLuffljo8b1I1AeYjv+ZgFtRB2qMH5Ms5FQdrqqrkbLL1ed1
 Hgr3gF/TKhxIlx6ETbIMsW80dIMWaww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680080657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WI8BEur271kmRLX+iQ3dCgc++8Y7H/Sb22u2MuBKC3U=;
 b=Z1HP6E2sFLC8jHRsyFCgM3+K2WnPZN8MticJlPvngve1MhEsveBn3+zQuqqld4AhG08700
 7okLTzBp+j04HDBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF2A2138FF;
 Wed, 29 Mar 2023 09:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8lLbKRH/I2SrdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Mar 2023 09:04:17 +0000
Message-ID: <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
Date: Wed, 29 Mar 2023 11:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230325074636.136833-1-15330273260@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230325074636.136833-1-15330273260@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------W5PV5cs8SW7uIpRGdJnqPZ9g"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------W5PV5cs8SW7uIpRGdJnqPZ9g
Content-Type: multipart/mixed; boundary="------------7A3L9aq7RwQin8oMsHpBOdqi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
References: <20230325074636.136833-1-15330273260@189.cn>
In-Reply-To: <20230325074636.136833-1-15330273260@189.cn>

--------------7A3L9aq7RwQin8oMsHpBOdqi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjJ2luZyBMdWNhcykNCg0KSGkNCg0KQW0gMjUuMDMuMjMgdW0gMDg6NDYgc2NocmllYiBT
dWkgSmluZ2Zlbmc6DQo+ICAgVGhlIGFzc2lnbm1lbnQgYWxyZWFkeSBkb25lIGluIGRybV9j
bGllbnRfYnVmZmVyX3ZtYXAoKSwNCj4gICBqdXN0IHRyaXZhbCBjbGVhbiwgbm8gZnVuY3Rp
b25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdWkgSmluZ2ZlbmcgPDE1MzMw
MjczMjYwQDE4OS5jbj4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9n
ZW5lcmljLmMgfCA1ICsrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiZGV2X2dlbmVyaWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJp
Yy5jDQo+IGluZGV4IDRkNjMyNWU5MTU2NS4uMWRhNDhlNzFjN2YxIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiBAQCAtMjgyLDcgKzI4Miw3IEBAIHN0
YXRpYyBpbnQgZHJtX2ZiZGV2X2RhbWFnZV9ibGl0KHN0cnVjdCBkcm1fZmJfaGVscGVyICpm
Yl9oZWxwZXIsDQo+ICAgCQkJCSBzdHJ1Y3QgZHJtX2NsaXBfcmVjdCAqY2xpcCkNCj4gICB7
DQo+ICAgCXN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyID0gZmJfaGVscGVyLT5i
dWZmZXI7DQo+IC0Jc3RydWN0IGlvc3lzX21hcCBtYXAsIGRzdDsNCj4gKwlzdHJ1Y3QgaW9z
eXNfbWFwIG1hcDsNCj4gICAJaW50IHJldDsNCj4gICANCj4gICAJLyoNCj4gQEAgLTMwMiw4
ICszMDIsNyBAQCBzdGF0aWMgaW50IGRybV9mYmRldl9kYW1hZ2VfYmxpdChzdHJ1Y3QgZHJt
X2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJZ290byBvdXQ7
DQo+ICAgDQo+IC0JZHN0ID0gbWFwOw0KPiAtCWRybV9mYmRldl9kYW1hZ2VfYmxpdF9yZWFs
KGZiX2hlbHBlciwgY2xpcCwgJmRzdCk7DQo+ICsJZHJtX2ZiZGV2X2RhbWFnZV9ibGl0X3Jl
YWwoZmJfaGVscGVyLCBjbGlwLCAmbWFwKTsNCg0KSSBzZWUgd2hhdCB5b3UncmUgZG9pbmcg
YW5kIGl0J3MgcHJvYmFibHkgY29ycmVjdCBpbiB0aGlzIGNhc2UuDQoNCkJ1dCB0aGVyZSdz
IGEgbGFyZ2VyIGlzc3VlIHdpdGggdGhpcyBpb3N5cyBpbnRlcmZhY2VzLiBTb21ldGltZXMg
dGhlIA0KYWRkcmVzcyBoYXMgdG8gYmUgbW9kaWZpZWQgKHNlZSBjYWxscyBvZiBpb3N5c19t
YXBfaW5jcigpKS4gVGhhdCBjYW4gDQpwcmV2ZW50IGluY29ycmVjdCB1c2VzIG9mIHRoZSBt
YXBwaW5nIGluIG90aGVyIHBsYWNlcywgZXNwZWNpYWxseSBpbiANCnVubWFwIGNvZGUuDQoN
CkkgdGhpbmsgaXQgd291bGQgbWFrZSBzZW5zZSB0byBjb25zaWRlciBhIHNlcGFyYXRlIHN0
cnVjdHVyZSBmb3IgdGhlIEkvTyANCmxvY2F0aW9uLiBUaGUgYnVmZmVyIGFzIGEgd2hvbGUg
d291bGQgc3RpbGwgYmUgcmVwcmVzZW50ZWQgYnkgc3RydWN0IA0KaW9zeXNfbWFwLiAgQW5k
IHRoYXQgbmV3IHN0cnVjdHVyZSwgbGV0J3MgY2FsbCBpdCBzdHJ1Y3QgaW9zeXNfcHRyLCAN
CndvdWxkIHBvaW50IHRvIGFuIGFjdHVhbCBsb2NhdGlvbiB3aXRoaW4gdGhlIGJ1ZmZlcidz
IG1lbW9yeSByYW5nZS4gQSANCmZldyBsb2NhdGlvbnMgYW5kIGhlbHBlcnMgd291bGQgbmVl
ZCBjaGFuZ2VzLCBidXQgdGhlcmUgYXJlIG5vdCBzbyBtYW55IA0KY2FsbGVycyB0aGF0IGl0
J3MgYW4gaXNzdWUuICBUaGlzIHdvdWxkIGFsc28gYWxsb3cgZm9yIGEgZmV3IGRlYnVnZ2lu
ZyANCnRlc3RzIHRoYXQgZW5zdXJlIHRoYXQgaW9zeXNfcHRyIGFsd2F5cyBvcGVyYXRlcyB3
aXRoaW4gdGhlIGJvdW5kcyBvZiBhbiANCmlvc3lzX21hcC4NCg0KSSd2ZSBsb25nIGNvbnNp
ZGVyZWQgdGhpcyBpZGVhLCBidXQgdGhlcmUgd2FzIG5vIHByZXNzdXJlIHRvIHdvcmsgb24g
aXQuIA0KTWF5YmUgbm93Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgDQo+ICAg
CWRybV9jbGllbnRfYnVmZmVyX3Z1bm1hcChidWZmZXIpOw0KPiAgIA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------7A3L9aq7RwQin8oMsHpBOdqi--

--------------W5PV5cs8SW7uIpRGdJnqPZ9g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQj/xEFAwAAAAAACgkQlh/E3EQov+BS
YA//XXA6CtpPaytAR+InGtHdcCPLHErAhJuRaY9Ze5A9iu3AxbJiNN2HdMFrOa9E2nBuYN9koOgN
D33d1VwY+TvDSVZnR5A3n6jZrfGwCH2kdlr8kC1WJ29UGsJ+AnoSs1WgBifV5FoYkI80L+nmrEg2
2rIvFMAlraYnjWtTjDLXDy2zWx3Ju4f90EmOFLTyFSA6SNrlRdyaapu74z0d77wUxuwLbHQoHYIL
QQFTztg5pDcYyoWbBrk0bsi1SdN4YDsiZvDhWQzTyFBtTe7R93hegBFUWejtgcHD5LqPOFkXoPrT
BQV3kk03Uweu2xlEfHdonc0t7vLq/0lljES9G8igNJhY2TkOAy0Hm3nScYTsxMASGndyZaKbBJ/q
bPlHVa6mf96oF7FC+Vc+AKdHH/sbQa6+4iAknlDBep5wY72F2HnlbIj11RHa0vpyKim5PlVq1vF7
3LsoGwGo+xmG2qokh9E2dEQTCq/lmBJZay8JKc6CLsFo1KGBDBqRzC/yUhwQLG/n5oRY8ARe6hUo
YFcrXpbhXfocMNf6LX4/qYrV6UYpxnAQpyzbkHf86ggz07DaTI+D6YmLKjU5NvEW76finBkN1Mqk
ZI/+zH2e+STwBsMCtXbxw/AtbdlMXyNK2TWARRz1EP6NC/4oORe3Yt+u9PHvDTzjS8zbayvE7PJ8
ORg=
=vXk4
-----END PGP SIGNATURE-----

--------------W5PV5cs8SW7uIpRGdJnqPZ9g--
