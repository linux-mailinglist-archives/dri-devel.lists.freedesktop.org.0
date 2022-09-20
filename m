Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F398D5BE082
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B1610E2AF;
	Tue, 20 Sep 2022 08:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC8A10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:42:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C5881F8B9;
 Tue, 20 Sep 2022 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663663343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUYVCigNAZypCRnPthW9VdMz2Z6vxsGXV8gfir7NL8w=;
 b=YHh+EDxwzdnvu7j6Jf4ubvifRgI2T6t8VohlRpni/Gw0lszzZdPIXRKkT6kj72c+mA4HNL
 w+dwfgizatb6bmbWowNqxYKtYs+GsAWf37YWnfz4PFIpjds7FEnABOhZb/BxqxDST+cy5S
 iL9QoOZJ3eZCvCjPgWBO8q1QDw6DSlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663663343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUYVCigNAZypCRnPthW9VdMz2Z6vxsGXV8gfir7NL8w=;
 b=5C3JXzRXYp4dy3i61AYs1ndmUBpJ852p3zra6VyWk6V7ArPm4M+jJTtl5e+sdAYbVjAHXx
 2h3CutxrWPLbuBCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 499E113ABB;
 Tue, 20 Sep 2022 08:42:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8GIcEe98KWOScAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 08:42:23 +0000
Message-ID: <98d172c3-c1ee-ecad-5a13-17699519520f@suse.de>
Date: Tue, 20 Sep 2022 10:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] drm/ast: Add resolution support for 1152x864@75
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220916085058.3386-1-jammy_huang@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220916085058.3386-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rksSzG05pGUxFgGAw0ouGZ0W"
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
--------------rksSzG05pGUxFgGAw0ouGZ0W
Content-Type: multipart/mixed; boundary="------------PfBfKwyyq8J0vgLKiw7O4nle";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <98d172c3-c1ee-ecad-5a13-17699519520f@suse.de>
Subject: Re: [PATCH v2] drm/ast: Add resolution support for 1152x864@75
References: <20220916085058.3386-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20220916085058.3386-1-jammy_huang@aspeedtech.com>

--------------PfBfKwyyq8J0vgLKiw7O4nle
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDkuMjIgdW0gMTA6NTAgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gQWRk
IDExNTJ4ODY0IGludG8gc3VwcG9ydCBsaXN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFt
bXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVlZHRlY2guY29tPg0KDQpBcHBsaWVkIHRvIGRy
bS1taXNjLW5leHQuIFRoYW5rcyENCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0N
Cj4gdjIgY2hhbmdlczoNCj4gICAtIGFkZCBjaGVjayBpbiBtb2RlX3ZhbGlkDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgIHwgOSArKysrKysrKysNCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF90YWJsZXMuaCB8IDcgKysrKysrKw0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYw0KPiBpbmRleCAyMTRiMTAxNzg0NTQuLmQzMjdkY2JhZjAzMiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBAQCAtMTE0LDYgKzExNCw5IEBAIHN0YXRpYyBi
b29sIGFzdF9nZXRfdmJpb3NfbW9kZV9pbmZvKGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2lu
Zm8gKmZvcm1hdCwNCj4gICAJY2FzZSAxMDI0Og0KPiAgIAkJdmJpb3NfbW9kZS0+ZW5oX3Rh
YmxlID0gJnJlc18xMDI0eDc2OFtyZWZyZXNoX3JhdGVfaW5kZXhdOw0KPiAgIAkJYnJlYWs7
DQo+ICsJY2FzZSAxMTUyOg0KPiArCQl2Ymlvc19tb2RlLT5lbmhfdGFibGUgPSAmcmVzXzEx
NTJ4ODY0W3JlZnJlc2hfcmF0ZV9pbmRleF07DQo+ICsJCWJyZWFrOw0KPiAgIAljYXNlIDEy
ODA6DQo+ICAgCQlpZiAobW9kZS0+Y3J0Y192ZGlzcGxheSA9PSA4MDApDQo+ICAgCQkJdmJp
b3NfbW9kZS0+ZW5oX3RhYmxlID0gJnJlc18xMjgweDgwMFtyZWZyZXNoX3JhdGVfaW5kZXhd
Ow0KPiBAQCAtMTA1OCw2ICsxMDYxLDggQEAgYXN0X2NydGNfaGVscGVyX21vZGVfdmFsaWQo
c3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZQ0K
PiAgIAkJCXJldHVybiBNT0RFX09LOw0KPiAgIAkJaWYgKChtb2RlLT5oZGlzcGxheSA9PSAx
NjAwKSAmJiAobW9kZS0+dmRpc3BsYXkgPT0gOTAwKSkNCj4gICAJCQlyZXR1cm4gTU9ERV9P
SzsNCj4gKwkJaWYgKChtb2RlLT5oZGlzcGxheSA9PSAxMTUyKSAmJiAobW9kZS0+dmRpc3Bs
YXkgPT0gODY0KSkNCj4gKwkJCXJldHVybiBNT0RFX09LOw0KPiAgIA0KPiAgIAkJaWYgKChh
c3QtPmNoaXAgPT0gQVNUMjEwMCkgfHwgKGFzdC0+Y2hpcCA9PSBBU1QyMjAwKSB8fA0KPiAg
IAkJICAgIChhc3QtPmNoaXAgPT0gQVNUMjMwMCkgfHwgKGFzdC0+Y2hpcCA9PSBBU1QyNDAw
KSB8fA0KPiBAQCAtMTA5MCw2ICsxMDk1LDEwIEBAIGFzdF9jcnRjX2hlbHBlcl9tb2RlX3Zh
bGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUNCj4gICAJCWlmIChtb2RlLT52ZGlzcGxheSA9PSA3NjgpDQo+ICAgCQkJc3RhdHVzID0g
TU9ERV9PSzsNCj4gICAJCWJyZWFrOw0KPiArCWNhc2UgMTE1MjoNCj4gKwkJaWYgKG1vZGUt
PnZkaXNwbGF5ID09IDg2NCkNCj4gKwkJCXN0YXR1cyA9IE1PREVfT0s7DQo+ICsJCWJyZWFr
Ow0KPiAgIAljYXNlIDEyODA6DQo+ICAgCQlpZiAobW9kZS0+dmRpc3BsYXkgPT0gMTAyNCkN
Cj4gICAJCQlzdGF0dXMgPSBNT0RFX09LOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfdGFibGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF90YWJsZXMu
aA0KPiBpbmRleCBkYmUxY2M2MjBmNmUuLjAzNzhjOWJjMDc5YiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdGFibGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfdGFibGVzLmgNCj4gQEAgLTI3Miw2ICsyNzIsMTMgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBhc3RfdmJpb3NfZW5odGFibGUgcmVzXzE2MDB4MTIwMFtdID0gew0KPiAg
IAkgKFN5bmNQUCB8IENoYXJ4OERvdCksIDB4RkYsIDEsIDB4MzMgfSwNCj4gICB9Ow0KPiAg
IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhc3RfdmJpb3NfZW5odGFibGUgcmVzXzExNTJ4
ODY0W10gPSB7DQo+ICsJezE2MDAsIDExNTIsIDY0LCAxMjgsICA5MDAsICA4NjQsIDEsIDMs
IFZDTEsxMDgsCS8qIDc1SHogKi8NCj4gKwkgKFN5bmNQUCB8IENoYXJ4OERvdCB8IE5ld01v
ZGVJbmZvKSwgNzUsIDEsIDB4M0IgfSwNCj4gKwl7MTYwMCwgMTE1MiwgNjQsIDEyOCwgIDkw
MCwgIDg2NCwgMSwgMywgVkNMSzEwOCwJLyogZW5kICovDQo+ICsJIChTeW5jUFAgfCBDaGFy
eDhEb3QgfCBOZXdNb2RlSW5mbyksIDB4RkYsIDEsIDB4M0IgfSwNCj4gK307DQo+ICsNCj4g
ICAvKiAxNjo5ICovDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3RfdmJpb3NfZW5odGFi
bGUgcmVzXzEzNjB4NzY4W10gPSB7DQo+ICAgCXsxNzkyLCAxMzYwLCA2NCwgMTEyLCA3OTUs
IDc2OCwgMywgNiwgVkNMSzg1XzUsCQkvKiA2MEh6ICovDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------PfBfKwyyq8J0vgLKiw7O4nle--

--------------rksSzG05pGUxFgGAw0ouGZ0W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMpfO4FAwAAAAAACgkQlh/E3EQov+Du
pBAAx1UMbZVzY41WKO5WY4CmbepxPF7sv7my1tGVZTYGldbWcQKYPvMzCox/FLMKwqPV/on5RPTp
2X2UzHN3ubJ26Gu2styJ8xmld9OwOudzbIpauh13pNqYVkLVNXXPm/o/Xd21d2vRIkEHd7ixeSnD
4OaKbLksqetZQoGpEfCi0nsGKunkEd6xFM+pTH+Qa0xYNudZ2qo66Ora5DGBlEdPP0p2+U93XdX+
z1M1imBaaYPdSArkuI4ZK+rV2nIp0uKSyNmUXf8b1HwCHuj796vL9Ujg17HE9DCX6DzC7QjLe1Qe
Q/ePhk8Feimm7tTd7ZcMLxxSthaozRPgIc2BAVrdtr6DsY/6l70aAcRlH4B0P+ut+qmO0OoJ55rW
lvFeJutzoYRscuk/tSWo4A3Q8m6+jbHxyIW8e71bc5qcbwOBm/83R0/A8FynslfFOwg1aOtfybNA
CLGuIehIDM1hM9Gm+DlfAFZrZhA6dZlxh7VQQKLsQpR/mS44XPb+RayoOIYmIB3U+8LsNgDzs4OE
qt5vGB/GFRqq+201sAeKGaPDEJL6G71djii8iBEGlQDVLS2KSq+6XwHnf6OYgaLeYHQCNetaW40s
83vmFByml/42CUEKWzNE5USkhI2X2+cL6i2J8ssYlnCz2zz48BxOakfXk3JPrzY30heTB6vu/To+
nC8=
=aMEa
-----END PGP SIGNATURE-----

--------------rksSzG05pGUxFgGAw0ouGZ0W--
