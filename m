Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A430B6E46D1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A9510E45A;
	Mon, 17 Apr 2023 11:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1A10E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 11:51:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2FE0121A3C;
 Mon, 17 Apr 2023 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681732297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WXcct5Jwk3kDdZkZbBJILP05CKGIib1zG64kGUmJuY8=;
 b=hXzch/+MJ14mjZ9L0X6lFfqgigJcVWnHNg9u+maNO8d9sP0ykKVjkFZqAl9MOORa2y39qM
 CsqeFPRMVyKlUaHlP1ZuFw2Toxe49HmbOajV6bH0wNhZtvo18oETIHSSORwYb3+RyDNhs0
 S/fR/SBMC2EMakSQJY7AIdlBYvC8X1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681732297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WXcct5Jwk3kDdZkZbBJILP05CKGIib1zG64kGUmJuY8=;
 b=8JM2qKojd5w4MGX2LjUIau5nNvQiNqS0yWtlnm1YFq0vJt1zXY4QzTY9xjw5Ihv5+Dtzd7
 aaygZEjTXcOI0KDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0902413319;
 Mon, 17 Apr 2023 11:51:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PPBAAckyPWR1NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 11:51:37 +0000
Message-ID: <24987cff-02e4-aa4a-449f-fd48accf7365@suse.de>
Date: Mon, 17 Apr 2023 13:51:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/ast: Fix ARM compatibility
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230302021905.2777-1-jammy_huang@aspeedtech.com>
 <d72b0fd9-844e-a422-45b6-261d73dbad18@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d72b0fd9-844e-a422-45b6-261d73dbad18@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rAWpLCXudHguBnouVkh2O2h0"
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
Cc: giantl@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rAWpLCXudHguBnouVkh2O2h0
Content-Type: multipart/mixed; boundary="------------np0KLFlInK0tgsugHXDm03Q4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: giantl@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <24987cff-02e4-aa4a-449f-fd48accf7365@suse.de>
Subject: Re: [PATCH] drm/ast: Fix ARM compatibility
References: <20230302021905.2777-1-jammy_huang@aspeedtech.com>
 <d72b0fd9-844e-a422-45b6-261d73dbad18@aspeedtech.com>
In-Reply-To: <d72b0fd9-844e-a422-45b6-261d73dbad18@aspeedtech.com>

--------------np0KLFlInK0tgsugHXDm03Q4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDQuMjMgdW0gMDQ6MDkgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gSGkg
VGhvbWFzLA0KPiANCj4gQ291bGQgeW91IGhlbHAgcmV2aWV3IHRoaXMgcGF0Y2g/Pw0KPiAN
Cj4gV2UgbWV0IHNvbWUgcHJvYmxlbSBvbiBudmlkaWEncyBBUk0gcGxhdGZyb20gYW5kIG5l
ZWQgdGhpcyBwYXRjaCB0byBmaXggaXQuDQo+IA0KPiBPbiAyMDIzLzMvMiDkuIrljYggMTA6
MTksIEphbW15IEh1YW5nIHdyb3RlOg0KPj4gQVJNIGFyY2hpdGVjdHVyZSBvbmx5IGhhcyAn
bWVtb3J5Jywgc28gYWxsIGRldmljZXMgYXJlIGFjY2Vzc2VkIGJ5IE1NSU8uDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogSmFtbXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVlZHRlY2guY29t
Pg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCAxNyAr
LS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbWFpbi5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMN
Cj4+IGluZGV4IDc5NGZmZDRhMjljNS4uZjg2ZDAxZTlmMDI0IDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tYWluLmMNCj4+IEBAIC00MjQsMjIgKzQyNCw3IEBAIHN0cnVjdCBhc3Rf
ZGV2aWNlICphc3RfZGV2aWNlX2NyZWF0ZShjb25zdCBzdHJ1Y3QgDQo+PiBkcm1fZHJpdmVy
ICpkcnYsDQo+PiDCoMKgwqDCoMKgIGlmICghYXN0LT5yZWdzKQ0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBFUlJfUFRSKC1FSU8pOw0KPj4gLcKgwqDCoCAvKg0KPj4gLcKgwqDC
oMKgICogSWYgd2UgZG9uJ3QgaGF2ZSBJTyBzcGFjZSBhdCBhbGwsIHVzZSBNTUlPIG5vdyBh
bmQNCj4+IC3CoMKgwqDCoCAqIGFzc3VtZSB0aGUgY2hpcCBoYXMgTU1JTyBlbmFibGVkIGJ5
IGRlZmF1bHQgKHJldiAweDIwDQo+PiAtwqDCoMKgwqAgKiBhbmQgaGlnaGVyKS4NCj4+IC3C
oMKgwqDCoCAqLw0KPj4gLcKgwqDCoCBpZiAoIShwY2lfcmVzb3VyY2VfZmxhZ3MocGRldiwg
MikgJiBJT1JFU09VUkNFX0lPKSkgew0KPj4gLcKgwqDCoMKgwqDCoMKgIGRybV9pbmZvKGRl
diwgInBsYXRmb3JtIGhhcyBubyBJTyBzcGFjZSwgdHJ5aW5nIE1NSU9cbiIpOw0KPj4gLcKg
wqDCoMKgwqDCoMKgIGFzdC0+aW9yZWdzID0gYXN0LT5yZWdzICsgQVNUX0lPX01NX09GRlNF
VDsNCj4+IC3CoMKgwqAgfQ0KPj4gLQ0KPj4gLcKgwqDCoCAvKiAibWFwIiBJTyByZWdzIGlm
IHRoZSBhYm92ZSBoYXNuJ3QgZG9uZSBzbyBhbHJlYWR5ICovDQo+PiAtwqDCoMKgIGlmICgh
YXN0LT5pb3JlZ3MpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBhc3QtPmlvcmVncyA9IHBjaW1f
aW9tYXAocGRldiwgMiwgMCk7DQoNCldoYXQgaGFwcGVucyBvbiBzeXN0ZW1zIHRoYXQgdXNl
IHRoaXMgYnJhbmNoPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+PiAtwqDCoMKgwqDC
oMKgwqAgaWYgKCFhc3QtPmlvcmVncykNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBFUlJfUFRSKC1FSU8pOw0KPj4gLcKgwqDCoCB9DQo+PiArwqDCoMKgIGFzdC0+aW9y
ZWdzID0gYXN0LT5yZWdzICsgQVNUX0lPX01NX09GRlNFVDsNCj4+IMKgwqDCoMKgwqAgYXN0
X2RldGVjdF9jaGlwKGRldiwgJm5lZWRfcG9zdCk7DQo+Pg0KPj4gYmFzZS1jb21taXQ6IDI1
NDk4NmUzMjRhZGQ4YTMwZDAwMTljNmRhNTlmODFhZGM4YjU2NWYNCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------np0KLFlInK0tgsugHXDm03Q4--

--------------rAWpLCXudHguBnouVkh2O2h0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ9MsgFAwAAAAAACgkQlh/E3EQov+DW
KxAAnzBQz5MGU/izy6O5BACuQ0159fKkk5Jc2Edjqydou8iAtVEVYK77K69xOmjxex0ZvQHVGKFN
z3FKl3SDacrSOfRTgxxLnC3eauHjGnWdH00Nml8E8EV9pHYHXMoBe12UxAtulN4tvsMsxRv56xRa
r3zXTP5Gp44qml3xR+2eQQIn9Let2G9wcz4rmSwCPh5Vp4cmgKHz0EpzC3oQihXVTDZnG46b3y0m
kcVBUBcSyZyQZhzb0n58cntl3StvCGFvqsE5kBmpfWtCLt6aQiarmt7D6XbPQkgPsVrHFcR+8XJr
Br4ZY2rsCEeWF+PMtiM0WKWsAUnWIAyYixphb5GHZj9ZdL1lYJSoJVJ5pIxHweqz2L1WnfmxY2tj
FPiaNg9e9xNa0QMraYxoac/oXtJhRtcdtyLnaXJERLGJgRKKkDLOuKz+Fxi9DUsOcYVSxprzBarA
nIxnV3Xv1jxV3miFlOLLDelDyQ6bi0b72+tm29suBChNaz3R2kBLhlcX7pe2D9dZCIn3jyIJnuJa
KcZbVrSAJxAc6OD00x1TIaYrQxvuYfALGN3GR3NSxwzgFj2wR3MufFYZOaIpCH8ht1rS4VTJatkF
qn/QoQ1LYzScfwHcecktdzgLtYjHtcv+MSi+Y6EdQt2iKgo0GIU6S1NMvSLVozsF696BjPB04FO9
B8w=
=eyUP
-----END PGP SIGNATURE-----

--------------rAWpLCXudHguBnouVkh2O2h0--
