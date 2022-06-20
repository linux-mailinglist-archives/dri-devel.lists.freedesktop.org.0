Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E3551718
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 13:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6110E278;
	Mon, 20 Jun 2022 11:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4FF10E278
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 11:16:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76D2121AC4;
 Mon, 20 Jun 2022 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655723781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUNCVUnZxLnFOL1PqOej4Q4gYO930E4cSuuxoq5Ldus=;
 b=lffw0KjSc2eYQN+pavxj8SG6LDfI1VMLltkTFhAMGoAZ1QxdS4SJuFdPRQT0SKe8M70rss
 A9HkJS9smvbMthcuViqOVsRqDZL6bXHRGoEKj55FAM5QVDAvjldW6XXhDnat4bmJ3nqoqd
 qPyUd0hudSVT4Nw3/pX8rLp0X9S+sQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655723781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUNCVUnZxLnFOL1PqOej4Q4gYO930E4cSuuxoq5Ldus=;
 b=9Tq9jK/KXxsIUVP2aEm3bMVorgEZNY9+F0Y4rNr6cL98tUak+yfjxKht9qUCEodRWFbgLd
 RV+5AyC33OXXQZBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 541DE134CA;
 Mon, 20 Jun 2022 11:16:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HBGKEwVXsGIIewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 11:16:21 +0000
Message-ID: <bc424de8-6cfd-5a50-bb1c-f7ad999e8848@suse.de>
Date: Mon, 20 Jun 2022 13:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 45/64] drm/vc4: txp: Remove vc4_dev txp pointer
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-46-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-46-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tlxf5IiWAOtP0Z000BHSR3id"
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
--------------tlxf5IiWAOtP0Z000BHSR3id
Content-Type: multipart/mixed; boundary="------------gMLpWzbDVcyQPnAJSMG00TuA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <bc424de8-6cfd-5a50-bb1c-f7ad999e8848@suse.de>
Subject: Re: [PATCH 45/64] drm/vc4: txp: Remove vc4_dev txp pointer
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-46-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-46-maxime@cerno.tech>

--------------gMLpWzbDVcyQPnAJSMG00TuA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA2LjIyIHVtIDExOjI5IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gVGhl
cmUncyBubyB1c2VyIGZvciB0aGF0IHBvaW50ZXIgc28gbGV0J3MganVzdCBnZXQgcmlkIG9m
IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5v
LnRlY2g+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuaCB8IDEg
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jIHwgNiAtLS0tLS0NCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9k
cnYuaA0KPiBpbmRleCA4NDZmM2NkYTE3OWEuLjVmMmQ3NjQwYTA5ZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfZHJ2LmgNCj4gQEAgLTgwLDcgKzgwLDYgQEAgc3RydWN0IHZjNF9kZXYg
ew0KPiAgIAlzdHJ1Y3QgdmM0X2h2cyAqaHZzOw0KPiAgIAlzdHJ1Y3QgdmM0X3YzZCAqdjNk
Ow0KPiAgIAlzdHJ1Y3QgdmM0X3ZlYyAqdmVjOw0KPiAtCXN0cnVjdCB2YzRfdHhwICp0eHA7
DQo+ICAgDQo+ICAgCXN0cnVjdCB2YzRfaGFuZ19zdGF0ZSAqaGFuZ19zdGF0ZTsNCj4gICAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMNCj4gaW5kZXggZjMwNmUwNWFjNWIyLi44N2M4OTZm
NDgyZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jDQo+IEBAIC00NjgsNyArNDY4
LDYgQEAgc3RhdGljIGludCB2YzRfdHhwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ICAgCXN0
cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBkZXZfZ2V0X2RydmRhdGEobWFzdGVyKTsNCj4gLQlz
dHJ1Y3QgdmM0X2RldiAqdmM0ID0gdG9fdmM0X2Rldihkcm0pOw0KPiAgIAlzdHJ1Y3QgdmM0
X2NydGMgKnZjNF9jcnRjOw0KPiAgIAlzdHJ1Y3QgdmM0X3R4cCAqdHhwOw0KPiAgIAlzdHJ1
Y3QgZHJtX2NydGMgKmNydGM7DQo+IEBAIC01MjEsNyArNTIwLDYgQEAgc3RhdGljIGludCB2
YzRfdHhwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIs
IHZvaWQgKmRhdGEpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIA0KPiAgIAlkZXZfc2V0X2Ry
dmRhdGEoZGV2LCB0eHApOw0KPiAtCXZjNC0+dHhwID0gdHhwOw0KPiAgIA0KPiAgIAl2YzRf
ZGVidWdmc19hZGRfcmVnc2V0MzIoZHJtLCAidHhwX3JlZ3MiLCAmdHhwLT5yZWdzZXQpOw0K
PiAgIA0KPiBAQCAtNTMxLDEzICs1MjksOSBAQCBzdGF0aWMgaW50IHZjNF90eHBfYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkN
Cj4gICBzdGF0aWMgdm9pZCB2YzRfdHhwX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2UgKm1hc3RlciwNCj4gICAJCQkgICB2b2lkICpkYXRhKQ0KPiAgIHsNCj4g
LQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZkYXRhKG1hc3Rlcik7DQo+
IC0Jc3RydWN0IHZjNF9kZXYgKnZjNCA9IHRvX3ZjNF9kZXYoZHJtKTsNCj4gICAJc3RydWN0
IHZjNF90eHAgKnR4cCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgIA0KPiAgIAl2YzRf
dHhwX2Nvbm5lY3Rvcl9kZXN0cm95KCZ0eHAtPmNvbm5lY3Rvci5iYXNlKTsNCj4gLQ0KPiAt
CXZjNC0+dHhwID0gTlVMTDsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVj
dCBjb21wb25lbnRfb3BzIHZjNF90eHBfb3BzID0gew0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------gMLpWzbDVcyQPnAJSMG00TuA--

--------------tlxf5IiWAOtP0Z000BHSR3id
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwVwQFAwAAAAAACgkQlh/E3EQov+Ce
5xAAoklomBlPrRKKSo5R5Ac2+45dF5l2wrt8SDrz6mi2fP1L3WUXOhBcHtMFDZisrjo0bBP27pt3
/kPqvFG2XpW4dZq8fLNORgemH/qke6u4yZ60TMRv24n8W9yJECd35p6t4QzKVqWiO3KdPvl6Pg20
OZDz0kXbghTHdERCvFcmPOvWoPeOrEN7OityJLb5NkaHgrvNj7zyiIgp66vg++SJ9d4C/je2XXdz
Hcbp2GdyD+RrsCHYPfvc6+sm6JfCADFVnMMuYKIzFApBU05nBVlSvHtZu3tIDIToMz1OvpVazIdT
clpO3NfsB3Y7/0BAxbjV+QcUnx4NfUKobvDyc6kt3k/XBgoZOXdVjSM51LnxmgF1DGqe/+cwP54O
cGm1ufQD/pbSk3QpKfNrKWWomdxOZVSDJsIshs6vJ+aMJ/W1ptKMsW1oHcsjILFBu6DmakWqYbn8
cfs+T6m0Tpy2NJtAquEPsx3aszm0f1rzI4/NrLUHSkL9XzDxYBs/Vh1WK6uLevrbIoDueAj1GdUi
ePPKyhMJpHVfmzRHmOGTNeWW6xh14JNeDeoJU7uVQUTQ21HQagZ+qbGMLVHVfmJp8udfDbLoXAxc
zok1PYLgmhPoe7S5llhs1FN7STRxpQRGOMumazytUo0rBnzl+brgnbqSdH09EbCzhlId5C/DoxYX
9rQ=
=uf+/
-----END PGP SIGNATURE-----

--------------tlxf5IiWAOtP0Z000BHSR3id--
