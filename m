Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30616D3EBD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 10:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31C710E257;
	Mon,  3 Apr 2023 08:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B14E10E257
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 08:15:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1540D219BE;
 Mon,  3 Apr 2023 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680509749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JczNSRY/LnXg12uFcxUXdP9dWL704griIdqZddThh/A=;
 b=cStoq1OYr5Ep9hW61Mx+7AQT2jaYXoPpDjHZXgNaIhVvaH/w8/+SQB0IOhx5zyGJ2vb/WJ
 dWiQsnYtaLJQWIGdUrjoEzED4F22moHuxR4R32AEBAtxdnZEUTuV5ZVt6Mbx9GO4aRqNJ3
 URAknPotkclx4Um2DO1ZLbgtdaMPPak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680509749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JczNSRY/LnXg12uFcxUXdP9dWL704griIdqZddThh/A=;
 b=/MAzX/PwXbl1C9O4d6POIu6iQI9Fdst/UR9PXcRdt/WacoyNhggkPlhlcFjWBmkJnivxqu
 565fROVxfNvlioCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6D0B1331A;
 Mon,  3 Apr 2023 08:15:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mHldNzSLKmS3OgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 08:15:48 +0000
Message-ID: <b819f298-2d9a-2ed6-dd74-889a5f31aef4@suse.de>
Date: Mon, 3 Apr 2023 10:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/6] drm/omapdrm: Initialize fbdev DRM client
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-6-tzimmermann@suse.de>
 <719ef7ad-1674-bb29-d2cf-ff7db800686c@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <719ef7ad-1674-bb29-d2cf-ff7db800686c@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zzJtFiqMSvjpA0EWU4QkDk0s"
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
--------------zzJtFiqMSvjpA0EWU4QkDk0s
Content-Type: multipart/mixed; boundary="------------UtbPiMGvXuaP2f2CNEjvpt4p";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b819f298-2d9a-2ed6-dd74-889a5f31aef4@suse.de>
Subject: Re: [PATCH 5/6] drm/omapdrm: Initialize fbdev DRM client
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-6-tzimmermann@suse.de>
 <719ef7ad-1674-bb29-d2cf-ff7db800686c@ideasonboard.com>
In-Reply-To: <719ef7ad-1674-bb29-d2cf-ff7db800686c@ideasonboard.com>

--------------UtbPiMGvXuaP2f2CNEjvpt4p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjMgdW0gMTQ6MTMgc2NocmllYiBUb21pIFZhbGtlaW5lbjoNCj4g
T24gMzAvMDMvMjAyMyAxMTozMiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBJbml0
aWFsaXplIHRoZSBmYmRldiBjbGllbnQgaW4gdGhlIGZiZGV2IGNvZGUgd2l0aCBlbXB0eSBo
ZWxwZXINCj4+IGZ1bmN0aW9ucy4gQWxzbyBjbGVhbiB1cCB0aGUgY2xpZW50LiBUaGUgaGVs
cGVycyB3aWxsIGxhdGVyDQo+PiBpbXBsZW1lbnQgdmFyaW91cyBmdW5jdGlvbmFsaXR5IG9m
IHRoZSBEUk0gY2xpZW50LiBObyBmdW5jdGlvbmFsDQo+PiBjaGFuZ2VzLg0KPiANCj4gSSBk
b24ndCBzZWUgdGhpcyBkb2luZyBhbnkgY2xlYW51cHMuDQoNClllYWgsIHRoYXQncyByZWFs
bHkgbm90IHdlbGwgcGhyYXNlZCBpbiBteSBjb21taXQgbWVzc2FnZS4gSSB3YW50ZWQgdG8g
DQpzYXkgdGhhdCB3ZSBub3cgY2xlYW4gdXAgYnkgY2FsbGluZyBkcm1fY2xpZW50X3JlbGVh
c2UoKSBpbiBfZmluaSBhbmQgDQp0aGUgZXJyb3ItaGFuZGxpbmcgY29kZS4NCg0KPiANCj4g
SSB0aGluayB0aGlzIGNvdWxkIGJlIGFzIHdlbGwgbWVyZ2VkIHRvIHRoZSBuZXh0IHBhdGNo
LCBhcyB0aGlzIGlzIHN1Y2ggDQo+IGEgc2hvcnQgb25lLg0KDQpTdXJlIG5vdCBwcm9ibGVt
LiBUaGV5IGJvdGggYmVsb25nIHRvZ2V0aGVyLCBidXQgSSB0aG91Z2h0IGl0J3MgZWFzaWVy
IA0KZm9yIHJldmlld2VycyB0byBzZWUgd2hhdCdzIGhhcHBlbmluZyBpZiB0aGV5IGFyZSBz
ZXBhcmF0ZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmV2aWV3ZWQtYnk6
IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPg0KPiAN
Cj4gIMKgVG9taQ0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2ZiZGV2LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2
LmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYw0KPj4gaW5k
ZXggNzllNDE3YjM5MWJmLi5mMGUzNWY0NzY0YTcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZmJkZXYuYw0KPj4gQEAgLTIyMSw2ICsyMjEsMzAgQEAgc3RhdGlj
IHN0cnVjdCBkcm1fZmJfaGVscGVyICpnZXRfZmIoc3RydWN0IA0KPj4gZmJfaW5mbyAqZmJp
KQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gZmJpLT5wYXI7DQo+PiDCoCB9DQo+PiArLyoNCj4+
ICsgKiBzdHJ1Y3QgZHJtX2NsaWVudA0KPj4gKyAqLw0KPj4gKw0KPj4gK3N0YXRpYyB2b2lk
IG9tYXBfZmJkZXZfY2xpZW50X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jbGllbnRfZGV2ICpj
bGllbnQpDQo+PiAreyB9DQo+PiArDQo+PiArc3RhdGljIGludCBvbWFwX2ZiZGV2X2NsaWVu
dF9yZXN0b3JlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50KQ0KPj4gK3sNCj4+ICvC
oMKgwqAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgb21hcF9mYmRl
dl9jbGllbnRfaG90cGx1ZyhzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCkNCj4+ICt7
DQo+PiArwqDCoMKgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9jbGllbnRfZnVuY3Mgb21hcF9mYmRldl9jbGllbnRfZnVuY3MgPSB7DQo+
PiArwqDCoMKgIC5vd25lcsKgwqDCoMKgwqDCoMKgID0gVEhJU19NT0RVTEUsDQo+PiArwqDC
oMKgIC51bnJlZ2lzdGVywqDCoMKgID0gb21hcF9mYmRldl9jbGllbnRfdW5yZWdpc3RlciwN
Cj4+ICvCoMKgwqAgLnJlc3RvcmXCoMKgwqAgPSBvbWFwX2ZiZGV2X2NsaWVudF9yZXN0b3Jl
LA0KPj4gK8KgwqDCoCAuaG90cGx1Z8KgwqDCoCA9IG9tYXBfZmJkZXZfY2xpZW50X2hvdHBs
dWcsDQo+PiArfTsNCj4+ICsNCj4+IMKgIC8qIGluaXRpYWxpemUgZmJkZXYgaGVscGVyICov
DQo+PiDCoCB2b2lkIG9tYXBfZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0K
Pj4gwqAgew0KPj4gQEAgLTI0MiwxMCArMjY2LDE0IEBAIHZvaWQgb21hcF9mYmRldl9pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiDCoMKgwqDCoMKgIGRybV9mYl9oZWxwZXJf
cHJlcGFyZShkZXYsIGhlbHBlciwgMzIsICZvbWFwX2ZiX2hlbHBlcl9mdW5jcyk7DQo+PiAt
wqDCoMKgIHJldCA9IGRybV9mYl9oZWxwZXJfaW5pdChkZXYsIGhlbHBlcik7DQo+PiArwqDC
oMKgIHJldCA9IGRybV9jbGllbnRfaW5pdChkZXYsICZoZWxwZXItPmNsaWVudCwgImZiZGV2
IiwgDQo+PiAmb21hcF9mYmRldl9jbGllbnRfZnVuY3MpOw0KPj4gwqDCoMKgwqDCoCBpZiAo
cmV0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbDsNCj4+ICvCoMKgwqAgcmV0
ID0gZHJtX2ZiX2hlbHBlcl9pbml0KGRldiwgaGVscGVyKTsNCj4+ICvCoMKgwqAgaWYgKHJl
dCkNCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9kcm1fY2xpZW50X3JlbGVhc2U7DQo+
PiArDQo+PiDCoMKgwqDCoMKgIHJldCA9IGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWco
aGVscGVyKTsNCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIGZpbmk7DQo+PiBAQCAtMjU0LDYgKzI4Miw4IEBAIHZvaWQgb21hcF9mYmRldl9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiDCoCBmaW5pOg0KPj4gwqDCoMKgwqDC
oCBkcm1fZmJfaGVscGVyX2ZpbmkoaGVscGVyKTsNCj4+ICtlcnJfZHJtX2NsaWVudF9yZWxl
YXNlOg0KPj4gK8KgwqDCoCBkcm1fY2xpZW50X3JlbGVhc2UoJmhlbHBlci0+Y2xpZW50KTsN
Cj4+IMKgIGZhaWw6DQo+PiDCoMKgwqDCoMKgIGRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGhl
bHBlcik7DQo+PiDCoMKgwqDCoMKgIGtmcmVlKGZiZGV2KTsNCj4+IEBAIC0yOTEsNiArMzIx
LDcgQEAgdm9pZCBvbWFwX2ZiZGV2X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+
IMKgwqDCoMKgwqAgaWYgKGZiKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9mcmFtZWJ1
ZmZlcl9yZW1vdmUoZmIpOw0KPj4gK8KgwqDCoCBkcm1fY2xpZW50X3JlbGVhc2UoJmhlbHBl
ci0+Y2xpZW50KTsNCj4+IMKgwqDCoMKgwqAgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoaGVs
cGVyKTsNCj4+IMKgwqDCoMKgwqAga2ZyZWUoZmJkZXYpOw0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------UtbPiMGvXuaP2f2CNEjvpt4p--

--------------zzJtFiqMSvjpA0EWU4QkDk0s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQqizQFAwAAAAAACgkQlh/E3EQov+DL
rxAAhzqTdSFp9EBSMO7Uwya4PGV6RWX2p3SgESI7foWR1L8oCncGSjZykycQXUmbSdlyvVvlnyZH
ptEVUhTX9MU4zKLMI9D5XNoXFl5SDLd/KoXp96YqQmUBXMwdzggZVjNAAv0gdPeG7tCpo9Vphy6n
Dg7ZYyj6eLsA+kb1g7LBZq/XjN7M7ml4a333SZdlOZtIQIT7uYwygLq+0+Bxw6IUd+kiLrGXyabl
velyphHSVpus6DZclLsogf4aBXEfoSz8B8VRnoszXIZ7gfJH5w+J8eucCbfFcADLxtNNBnZR9HzR
/IAuL5yLOmcAqQPk5VkWu27TD11muLi3oX+oOF1NLpCz35C2tr1XMva79PhLjvk6FljqN2kffbt2
KUHKY7QQtiTiM3qh/FTgPc0hQn1s0UqjzsmJiS0F4b+sSEjkWD/bZ9kF8E+5Nj6hEqDr9K1FmUN0
LvtAa+ukD5J4BV1FV6j4HT6G3S2w+TptlO1ipa8LbYQHoYNc3S6pGcg0fwb1GujAXLtn+RKOPm3T
oHnyT8wnQuuOqd6lvRjWcekLz9CEc34pszGLOIcNVNmpwAYCiIldpw9kja3i336MRXKUNRl92zkI
J9pR46Cohnx2IevPWAc53Dfj9H2YOI5tuH3ugI0qHy4/TvqgpZp6x7tJMIV7A5Qq2ZJQyINMEuXT
xtU=
=ZEaM
-----END PGP SIGNATURE-----

--------------zzJtFiqMSvjpA0EWU4QkDk0s--
