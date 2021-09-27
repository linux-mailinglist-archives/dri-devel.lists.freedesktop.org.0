Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449874190DE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 10:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90935894E0;
	Mon, 27 Sep 2021 08:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2779896ED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 08:31:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC952200A6;
 Mon, 27 Sep 2021 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632731515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nT0lR7QqvaSFSqj96KUOYmzwku/omQrxbWcZe/Sp17g=;
 b=a6ng4581eAtB46YH4dxiH+ilF61Zx5HmZi5X9zcrLQ4usNW0z5YndcSMG1UJYFMwrxyz/T
 OY8OhTQWLoyNhK2xyTcz1MzgqDf1BUhjMv2o5NzXYSYjG2MvemnpYTHOMy7TiC2ATLTsZG
 YSz21egD51cvFqViYIFjvxnbEEaWz7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632731515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nT0lR7QqvaSFSqj96KUOYmzwku/omQrxbWcZe/Sp17g=;
 b=DFANtufkEVCTQBdflBi4DzxO1bmcxW00kjukz4VBH69OjBA+545anIz2yPBEog5oGPU55j
 +kOkOQumsmQaPKBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A930113A42;
 Mon, 27 Sep 2021 08:31:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uW0/KHuBUWGdTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Sep 2021 08:31:55 +0000
Message-ID: <fa0d3435-c7d4-eff8-525d-1e02a4392d17@suse.de>
Date: Mon, 27 Sep 2021 10:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/gma500: Fix error code in probe()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20210927081628.GA10186@kili>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210927081628.GA10186@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vXiheHO58cm9apZBSkNbwV1D"
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
--------------vXiheHO58cm9apZBSkNbwV1D
Content-Type: multipart/mixed; boundary="------------pe82A0VHqXeYWivGoLI5UxG4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Message-ID: <fa0d3435-c7d4-eff8-525d-1e02a4392d17@suse.de>
Subject: Re: [PATCH] drm/gma500: Fix error code in probe()
References: <20210927081628.GA10186@kili>
In-Reply-To: <20210927081628.GA10186@kili>

--------------pe82A0VHqXeYWivGoLI5UxG4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDkuMjEgdW0gMTA6MTYgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBU
aGUgZXJyb3IgY29kZSBpcyBzdG9yZWQgaW4gImRldl9wcml2Iiwgbm90ICJkZXYiLiAgVGhl
ICJkZXYiIHBvaW50ZXINCj4gaXNuJ3QgaW5pdGlhbGl6ZWQgeWV0Lg0KPiANCj4gRml4ZXM6
IGMyZjE3ZTYwY2JlMSAoImRybS9nbWE1MDA6IEVtYmVkIHN0cnVjdCBkcm1fZGV2aWNlIGlu
IHN0cnVjdCBkcm1fcHNiX3ByaXZhdGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQoNClRoYW5rcyBmb3IgdGhlIHBhdGNo
LiBUaGVyZSdzIGFscmVhZHkgYSBmaXggZm9yIHRoaXMgYnVnIGluIA0KZHJtLW1pc2MtbmV4
dC4gWzFdDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9ZWJlMTgwZDM3NmE1Zjdi
MmU1MzRiNjlkMjM3YWE2ZmFiNDMwMDhlZQ0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2Rydi5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvcHNiX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2
LmMNCj4gaW5kZXggM2QwMzZkMmEzYjI5Li43YTEwYmIzOWVmMGIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvcHNiX2Rydi5jDQo+IEBAIC00NTQsNyArNDU0LDcgQEAgc3RhdGljIGlu
dCBwc2JfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqZW50KQ0KPiAgIA0KPiAgIAlkZXZfcHJpdiA9IGRldm1fZHJtX2Rldl9h
bGxvYygmcGRldi0+ZGV2LCAmZHJpdmVyLCBzdHJ1Y3QgZHJtX3BzYl9wcml2YXRlLCBkZXYp
Ow0KPiAgIAlpZiAoSVNfRVJSKGRldl9wcml2KSkNCj4gLQkJcmV0dXJuIFBUUl9FUlIoZGV2
KTsNCj4gKwkJcmV0dXJuIFBUUl9FUlIoZGV2X3ByaXYpOw0KPiAgIAlkZXYgPSAmZGV2X3By
aXYtPmRldjsNCj4gICANCj4gICAJcGNpX3NldF9kcnZkYXRhKHBkZXYsIGRldik7DQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------pe82A0VHqXeYWivGoLI5UxG4--

--------------vXiheHO58cm9apZBSkNbwV1D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFRgXsFAwAAAAAACgkQlh/E3EQov+BL
QRAAtAUg19orZTv5SFycwjg6KOsGwK6pn4AAqE70mYzftZwQRVDzcn9Tv/ES/wH3h6wbO808Ln5L
3EDKAWgXf8bajE7uAekt2WCsUdeYa4FT96yCGVkVX8PgBcKdAtC+zEsdh7zKpumP23AfSdweeNj7
PN3LZ+h/XIis8QFBGWEHTfc5AsOzoLvt0WKiWSZXbbw85O+KYARuuZJjsYgmt2qaIn0CcIp9+qVo
Eychs+CzMlCRYJHSv+Hvq6x8QvzNyIhKlXAwMQeW84Yp8934h6fYDjStllf3n3BJR2HeoWbGX6mt
71kYkxK3dyzCWJ3Y0XxfWKA+G/dXxhsK/PE1bw0ZOS9pUbGg9AM59/Q7vn5QYq3tQItaE3VcWU+A
rqI9j+rUvtQCJh/x0bBipBHX0VM/HOnipaKo/HBtnptASLscJDx+pIS8fnu5S2kpAJeWwZ9OMUcg
F8hKeM3FPZQDs21KUeW0p3W6WgFhv9WCSF7ezOIig0Q7y51J0tvA62cbw5HQM7fj2gh4g5uAVVBw
2mwTJNtpg9J5ds8RdBE/yfQ2ozNvXQlv7dN7vQ+FAE/CofWdW4q1QTx8kksZhA9bnK0BVRZHEMrX
hOxUUibAyC7UjskBTP+CsaGEvKoq+jTXmW8Om3gJWbTc7y4mpVD0OdaAkUG3thQxCo8a8ZoPrlKd
Slk=
=Xu0S
-----END PGP SIGNATURE-----

--------------vXiheHO58cm9apZBSkNbwV1D--
