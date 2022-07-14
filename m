Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B865747AE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74714A3A4D;
	Thu, 14 Jul 2022 09:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4FA3A4B;
 Thu, 14 Jul 2022 09:06:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D11F34B34;
 Thu, 14 Jul 2022 09:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657789561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rneVqqvNkU1lCsrVXJD1UQj3t+VTBR1nfRYfa7CJYkc=;
 b=XAXw75Kpvt6MYf8zjtDns5sH8nc1XRjWnZgYouFAIv6UdyVllA/XP0u6JkPd3LM/O6onlu
 VHaCM2KR3AFSfFU3PLDkpP0TJpMrnKJXi5XHQ3rpQ27/BlQSaokQyeHezwDED63eAvbO6d
 CxZxNAFKf04DvM2n/uvxuNO0Ds2fA74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657789561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rneVqqvNkU1lCsrVXJD1UQj3t+VTBR1nfRYfa7CJYkc=;
 b=Sgv+AWlNIFtInavpZbj4fthznhh7tsGClBQDLdjxlIGMxXw9YI44nzukq5230fAfXh6ons
 WTQTmyrrrrDw7oCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 349D213A61;
 Thu, 14 Jul 2022 09:06:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LsD3C3ncz2KqIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Jul 2022 09:06:01 +0000
Message-ID: <b16e783a-e7a2-09d5-a8c0-b3b8d18a3e1f@suse.de>
Date: Thu, 14 Jul 2022 11:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
 <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XPkFX4C3NVZnEzUkxuc2ZhXD"
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
--------------XPkFX4C3NVZnEzUkxuc2ZhXD
Content-Type: multipart/mixed; boundary="------------SsqBmTukjqEeBF0GrExtPvTL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Message-ID: <b16e783a-e7a2-09d5-a8c0-b3b8d18a3e1f@suse.de>
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
 <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
In-Reply-To: <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>

--------------SsqBmTukjqEeBF0GrExtPvTL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDcuMjIgdW0gMTA6NDkgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBBbSAxNC4wNy4yMiB1bSAxMDo0MCBzY2hyaWViIFRob21h
cyBaaW1tZXJtYW5uOg0KPj4gSGkgQ2hyaXN0aWFuDQo+Pg0KPj4gQW0gMTIuMDcuMjIgdW0g
MTI6Mjggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPj4+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgOGY2MTk3MzcxODQ4NWYzZTg5YmM0ZjQwOGY5MjkwNDhiN2I0N2M4My4NCj4+DQo+PiBJ
IG9ubHkgZm91bmQgdGhpcyBjb21taXQgaW4gZHJtLW1pc2MtbmV4dC4gU2hvdWxkIHRoZSBy
ZXZlcnQgYmUgDQo+PiBjaGVycnktcGlja2VkIGludG8gZHJtLW1pc2MtbmV4dC1maXhlcz8N
Cj4gDQo+IHllcyBmb3IgYWxsIHRocmVlIHBhdGNoZXMgeW91IGp1c3QgcGluZ2VkIG1lLg0K
PiANCj4gSSd2ZSBhbHJlYWR5IHRyaWVkIHRvIHB1c2ggdGhlbSB0byBkcm0tbWlzYy1uZXh0
LWZpeGVzLCBidXQgdGhlIHBhdGNoZXMgDQo+IHNvbWVob3cgd291bGRuJ3QgYXBwbHkuIEkg
dGhpbmsgdGhlIC1uZXh0LWZpeGVzIGJyYW5jaCB3YXMgc29tZWhvdyANCj4gbGFnZ2luZyBi
ZWhpbmQuDQoNCkkganVzdCBmb3J3YXJkZWQgZHJtLW1pc2MtbmV4dC1maXhlcyB0byB0aGUg
bGF0ZXN0IHN0YXRlIG9mIGRybS1uZXh0LiANCkNoYW5jZXMgYXJlLCB0aGVzZSBwYXRjaGVz
IHdpbGwgYXBwbHkgbm93Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGFu
a3MsDQo+IENocmlzdGlhbi4NCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMN
Cj4+DQo+Pj4NCj4+PiBJdCB0dXJuZWQgb3V0IHRoYXQgdGhpcyBpcyBub3QgY29ycmVjdC4g
RXNwZWNpYWxseSB0aGUgc3luY19maWxlIGluZm8NCj4+PiBJT0NUTCBuZWVkcyB0byBzZWUg
ZXZlbiBzaWduYWxlZCBmZW5jZXMgdG8gY29ycmVjdGx5IHJlcG9ydCBiYWNrIHRoZWlyDQo+
Pj4gc3RhdHVzIHRvIHVzZXJzcGFjZS4NCj4+Pg0KPj4+IEluc3RlYWQgYWRkIHRoZSBmaWx0
ZXIgaW4gdGhlIG1lcmdlIGZ1bmN0aW9uIGFnYWluIHdoZXJlIGl0IG1ha2VzIHNlbnNlLg0K
Pj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UtdW53cmFwLmMgfCAzICsrLQ0KPj4+IMKgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLXVu
d3JhcC5owqDCoCB8IDYgKy0tLS0tDQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYyANCj4+PiBiL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UtdW53cmFwLmMNCj4+PiBpbmRleCA1MDJhNjVlYTZkNDQuLjcwMDJiY2E3OTJm
ZiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLXVud3JhcC5j
DQo+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYw0KPj4+IEBA
IC03Miw3ICs3Miw4IEBAIHN0cnVjdCBkbWFfZmVuY2UgKl9fZG1hX2ZlbmNlX3Vud3JhcF9t
ZXJnZSh1bnNpZ25lZCANCj4+PiBpbnQgbnVtX2ZlbmNlcywNCj4+PiDCoMKgwqDCoMKgIGNv
dW50ID0gMDsNCj4+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBudW1fZmVuY2VzOyAr
K2kpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3Vud3JhcF9mb3JfZWFj
aCh0bXAsICZpdGVyW2ldLCBmZW5jZXNbaV0pDQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKytjb3VudDsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWRtYV9mZW5j
ZV9pc19zaWduYWxlZCh0bXApKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKytjb3VudDsNCj4+PiDCoMKgwqDCoMKgIH0NCj4+PiDCoCDCoMKgwqDCoMKgIGlmIChj
b3VudCA9PSAwKQ0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS11
bndyYXAuaCANCj4+PiBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLXVud3JhcC5oDQo+Pj4g
aW5kZXggMzkwZGUxZWU5ZDM1Li42NmIxZTU2ZmJiODEgMTAwNjQ0DQo+Pj4gLS0tIGEvaW5j
bHVkZS9saW51eC9kbWEtZmVuY2UtdW53cmFwLmgNCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS11bndyYXAuaA0KPj4+IEBAIC00MywxNCArNDMsMTAgQEAgc3RydWN0IGRt
YV9mZW5jZSAqZG1hX2ZlbmNlX3Vud3JhcF9uZXh0KHN0cnVjdCANCj4+PiBkbWFfZmVuY2Vf
dW53cmFwICpjdXJzb3IpOw0KPj4+IMKgwqAgKiBVbndyYXAgZG1hX2ZlbmNlX2NoYWluIGFu
ZCBkbWFfZmVuY2VfYXJyYXkgY29udGFpbmVycyBhbmQgZGVlcCANCj4+PiBkaXZlIGludG8g
YWxsDQo+Pj4gwqDCoCAqIHBvdGVudGlhbCBmZW5jZXMgaW4gdGhlbS4gSWYgQGhlYWQgaXMg
anVzdCBhIG5vcm1hbCBmZW5jZSBvbmx5IA0KPj4+IHRoYXQgb25lIGlzDQo+Pj4gwqDCoCAq
IHJldHVybmVkLg0KPj4+IC0gKg0KPj4+IC0gKiBOb3RlIHRoYXQgc2lnbmFsbGVkIGZlbmNl
cyBhcmUgb3Bwb3J0dW5pc3RpY2FsbHkgZmlsdGVyZWQgb3V0LCB3aGljaA0KPj4+IC0gKiBt
ZWFucyB0aGUgaXRlcmF0aW9uIGlzIHBvdGVudGlhbGx5IG92ZXIgbm8gZmVuY2UgYXQgYWxs
Lg0KPj4+IMKgwqAgKi8NCj4+PiDCoCAjZGVmaW5lIGRtYV9mZW5jZV91bndyYXBfZm9yX2Vh
Y2goZmVuY2UsIGN1cnNvciwgaGVhZCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+PiDC
oMKgwqDCoMKgIGZvciAoZmVuY2UgPSBkbWFfZmVuY2VfdW53cmFwX2ZpcnN0KGhlYWQsIGN1
cnNvcik7IGZlbmNlO8KgwqDCoCBcDQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgZmVuY2UgPSBk
bWFfZmVuY2VfdW53cmFwX25leHQoY3Vyc29yKSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwN
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2Up
KQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgIGZlbmNlID0gZG1hX2ZlbmNlX3Vud3JhcF9uZXh0
KGN1cnNvcikpDQo+Pj4gwqAgwqAgc3RydWN0IGRtYV9mZW5jZSAqX19kbWFfZmVuY2VfdW53
cmFwX21lcmdlKHVuc2lnbmVkIGludCBudW1fZmVuY2VzLA0KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICoq
ZmVuY2VzLA0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------SsqBmTukjqEeBF0GrExtPvTL--

--------------XPkFX4C3NVZnEzUkxuc2ZhXD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLP3HgFAwAAAAAACgkQlh/E3EQov+DO
1BAAr//wC7+MDlw1XMfSpY716SwTDnRvi+lkaDDsG6T0opDlsNxXPKg82cBh+gHtwIaHGnkRE+Kv
ElYicLXZ5rIPwwlT+C0Sp2Co77/Hsyq0sCuzqrhG4rTRHcYvPh0yqnMcrTA5u4rWKp3u0JAdDjGV
rWwCzjAdAeoDrakm+auvna6rO++f2sK2KVnQ4vXdSP0901Y3py7i2JIKM9oEIdB9TlCXKKUx/gzF
UafCAnZEQUKHQLtOTWM2YLXSDyKZ94EoQmYev0SoYXBKYxBR9wBr3yzbHB6mH3f8BmsealEr8+kZ
R5GuHK+lPLJjGo8LjAkj8F4ayr28urS/dAmX5dRPgSyGIo14qFb0WeSrHuVRISCLUZmxrjxqIMIe
P5CcAihULw5m01kVRvBTrsuTIZG05jBlms4I4gtKcsMg0MT7EwiRre13mfpODR9/qhE9u5yjBhsd
0uuADYtnz3kkKDKMygF0FOMjOmPNlmUKnlyXAFpTUgHpxEgm1/NfUdTXTEP140YI1vpLI/CW94+W
1X30lYCE2YySMPQLFeNheTodA8Es3h9Kgc03FR/L7nfV7fy5/gQ8F4QqSk9v2WA4zhQynA4lwhry
0KWYGEd2Yyec3rBSouNIS+nVh77yuJvYUtbQ88Was6xXaEHeKPiHjvB9yubz4Gh2yo4BmaLH1ds5
v9Y=
=croK
-----END PGP SIGNATURE-----

--------------XPkFX4C3NVZnEzUkxuc2ZhXD--
