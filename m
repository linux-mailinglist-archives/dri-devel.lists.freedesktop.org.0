Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A154C2BA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 09:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A8989AC6;
	Wed, 15 Jun 2022 07:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D179410EF45
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:39:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80DAA21BF5;
 Wed, 15 Jun 2022 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655278740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dN7k5Pts97lQ1NbGpxnqKsOox4NFeiyKlIZh0sRVwP8=;
 b=PNaU8RMe5mJ0M0hs9si1S9fUp9gS1JR+5Lne3mniWhgMnrCiopZ33dIzy/uh3S/TnKNdmv
 OlJkyCo5wgBmvaKHMAuKA3boodsHZE9OsYqNMZ4Npez58G+BevQsBbBZHRcpqgq377tVOs
 InwRW7oz1uO1YSbwziE/DSrkPX7aRLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655278740;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dN7k5Pts97lQ1NbGpxnqKsOox4NFeiyKlIZh0sRVwP8=;
 b=dpPqTQNAuW5B7wH3afuRNi4REAfpmyoiDUig1hSk0/FXqBtILRE/VPvgvKRdo15TweaDKh
 2Xxqzj5XC+GWaACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6552E139F3;
 Wed, 15 Jun 2022 07:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kSjQF5SMqWKwCgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jun 2022 07:39:00 +0000
Message-ID: <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
Date: Wed, 15 Jun 2022 09:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m6CAjokMTg4dxOdBqynbXq0X"
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m6CAjokMTg4dxOdBqynbXq0X
Content-Type: multipart/mixed; boundary="------------7PN6KzKO8mRSni4N6KEZnE6U";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
In-Reply-To: <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>

--------------7PN6KzKO8mRSni4N6KEZnE6U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDYuMjIgdW0gMjM6MDYgc2NocmllYiBSb2JpbiBNdXJwaHk6DQo+IE9u
IDIwMjItMDYtMTQgMTQ6NDgsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+
DQo+PiBBbSAxNC4wNi4yMiB1bSAxNTowNCBzY2hyaWViIFJvYmluIE11cnBoeToNCj4+PiBU
aGUgQXJtIEp1bm8gYm9hcmQgRURLMiBwb3J0IGhhcyBwcm92aWRlZCBhbiBFRkkgR09QIGRp
c3BsYXkgdmlhIEhETENEMA0KPj4+IGZvciBzb21lIHRpbWUgbm93LCB3aGljaCB3b3JrcyBu
aWNlbHkgYXMgYW4gZWFybHkgZnJhbWVidWZmZXIuIEhvd2V2ZXIsDQo+Pj4gb25jZSB0aGUg
SERMQ0QgZHJpdmVyIHByb2JlcyBhbmQgdGFrZXMgb3ZlciB0aGUgaGFyZHdhcmUsIGl0IHNo
b3VsZA0KPj4+IHRha2Ugb3ZlciB0aGUgbG9naWNhbCBmcmFtZWJ1ZmZlciBhcyB3ZWxsLCBv
dGhlcndpc2UgdGhlIG5vdy1kZWZ1bmN0IEdPUA0KPj4+IGRldmljZSBoYW5ncyBhYm91dCBh
bmQgdmlydHVhbCBjb25zb2xlIG91dHB1dCBpbmV2aXRhYmx5IGRpc2FwcGVhcnMgaW50bw0K
Pj4+IHRoZSB3cm9uZyBwbGFjZSBtb3N0IG9mIHRoZSB0aW1lLg0KPj4+DQo+Pj4gU2lnbmVk
LW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4NCj4+PiAtLS0N
Cj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jIHwgMiArKw0KPj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jIA0KPj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9oZGxjZF9kcnYuYw0KPj4+IGluZGV4IGFmNTkwNzdhNTQ4MS4uYTVkMDQ4ODQ2
NThiIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMN
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jDQo+Pj4gQEAgLTMz
MSw2ICszMzEsOCBAQCBzdGF0aWMgaW50IGhkbGNkX2RybV9iaW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfdmJsYW5rOw0KPj4+IMKg
wqDCoMKgwqAgfQ0KPj4+ICvCoMKgwqAgZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29uZmxpY3Rp
bmdfZnJhbWVidWZmZXJzKE5VTEwsICJoZGxjZCIsIA0KPj4+IGZhbHNlKTsNCj4+PiArDQo+
Pg0KPj4gSW4gYWRkaXRpb24gdG8gd2hhdCBKYXZpZXIgc2FpZCwgaXQgYXBwZWFycyB0byBi
ZSB0b28gbGF0ZSB0byBjYWxsIA0KPj4gdGhpcyBmdW5jdGlvbi4gSWYgYW55dGhpbmcgaGVy
IGV0b3VjaGVzIGhhcmR3YXJlLCB5b3UgbWlnaHQgDQo+PiBhY2NpZGVudGFsbHkgaW50ZXJm
ZXJlIHdpdGggdGhlIEVGSS1yZWxhdGVkIGRyaXZlci4gUmF0aGVyIGNhbGwgaXQgYXQgDQo+
PiB0aGUgdG9wIG9mIGxkbGNkX2RybV9iaW5kKCkuDQo+IA0KPiBPSywgdGhhbmtzIGZvciB0
aGUgaW5mby4gSSBtb3N0bHkganVzdCBjb3BpZWQgdGhlIHBhdHRlcm4gZnJvbSB0aGUgDQo+
IHNpbXBsZXN0LWxvb2tpbmcgb3RoZXIgdXNlcnMgKHN1bjRpLCB0ZWdyYSwgdmM0KSB3aG8g
YWxsIHNlZW1lZCB0byBjYWxsIA0KPiBpdCBmYWlybHkgbGF0ZSwgYW5kIGluZGVlZCBuYWl2
ZWx5IGl0IHNlZW1lZCBsb2dpY2FsIG5vdCB0byBkbyBpdCAqdG9vKiANCj4gZWFybHkgd2hl
biB0aGVyZSdzIG1vcmUgY2hhbmNlIHdlIG1pZ2h0IGZhaWwgdG8gYmluZCBhbmQgbGVhdmUg
dGhlIHVzZXIgDQo+IHdpdGggbm8gZnJhbWVidWZmZXIgYXQgYWxsLiBJbiBwYXJ0aWN1bGFy
LCB3YWl0aW5nIHVudGlsIHdlJ3ZlIGJvdW5kIHRoZSANCj4gSERNSSBlbmNvZGVyIHNlZW1z
IGxpa2UgYSBnb29kIGlkZWEgaW4gdGhlIGNhc2Ugb2YgdGhlIEp1bm8gYm9hcmQgKHdoaWNo
IA0KPiBpcyB0aGUgb25seSByZWFsIEhETENEIHVzZXIpLCBhcyB0aGUgSTJDIGJ1cyBvZnRl
biBnZXRzIHN0dWNrIGlmIHRoZSANCj4gU3lzdGVtIENvbnRyb2wgUHJvY2Vzc29yIGlzIGhh
dmluZyBhIGJhZCBkYXkuIEkgYWxzbyBkb24ndCBiZWxpZXZlIA0KPiB0aGVyZSdzIGFueXRo
aW5nIGhlcmUgdGhhdCB3b3VsZCBhZmZlY3QgZWZpZmIgbW9yZSB0aGFuIHRoZSBmYWN0IHRo
YXQgDQo+IG9uY2UgdGhlIERSTSBDUlRDIGlzIGFsaXZlIHdlIHNpbXBseSBzdG9wIHNjYW5u
aW5nIG91dCBmcm9tIHRoZSByZWdpb24gDQo+IG9mIG1lbW9yeSB0aGF0IGVmaWZiIGlzIG1h
bmFnaW5nLCBidXQgaWYgaXQncyBjb25zaWRlcmVkIGdvb2QgcHJhY3RpY2UgDQo+IHRvIGRv
IHRoaXMgZWFybHkgdGhlbiBJIGNhbiBjZXJ0YWlubHkgbWFrZSB0aGF0IGNoYW5nZSB0b28u
DQpXZSd2ZSBiZWVuIHN0cnVnZ2xpbmcgd2l0aCB0aGlzIGEgYml0LiBJZiBpdCB3b3JrcyBy
ZWxpYWJseSwgeW91J3JlIA0Kd2VsY29tZSB0byBsZWF2ZSBpdCB3aGVyZSBpdCBpcy4NCg0K
SGlzdG9yaWNhbGx5LCBtb3N0IGRyaXZlcnMgY2FsbCB0aGlzIGZ1bmN0aW9uIHZlcnkgZWFy
bHkuIEJ1dCBmb3IgZXJyb3IgDQpyZWNvdmVyeSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZG8g
aXQgYXMgbGF0ZSBhcyBwb3NzaWJsZS4gIElkZWFsbHksIA0KZHJpdmVycyB3b3VsZCBmaXJz
dCBpbml0aWFsaXplIHRoZWlyIERSTSBzb2Z0d2FyZSBzdGF0ZSwgdGhlbiBraWNrb3V0IA0K
dGhlIGdlbmVyaWMgZHJpdmVyLCBhbmQgZmluYWxseSB0YWtlIG92ZXIgaGFyZHdhcmUuIEJ1
dCB0aGF0IHdvdWxkIA0KcmVxdWlyZSBhIGNhcmVmdWwgcmV2aWV3IG9mIGVhY2ggZHJpdmVy
LiA6Lw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBDaGVlcnMsDQo+IFJvYmlu
Lg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------7PN6KzKO8mRSni4N6KEZnE6U--

--------------m6CAjokMTg4dxOdBqynbXq0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKpjJQFAwAAAAAACgkQlh/E3EQov+DO
RhAAj+UvBYzfP2dccMdqm1W6eGxrQxXFvUGYkaeCyy/j94fODahd9pPwzhxmNaNUUEw6hnYn3VbY
Y1egFEw0I6yd2BCT9qX+LEnhoIt1oBFkkBVCWwpaa3/2lKbZWRSBQbOBFkfsz3M8LelzJKSLrHJV
TYuS1xvWCVD5I1KXJmWCiSlXh0mfrcx9inHIQJZVtU4iIjAURL1EO45b0mHm15eP29UC80O+D712
hJkDB22X0JUgxcTrlFe/TLmaDgGiPl2QEj8D1QJx82KX7pe3ZhGNulH084Utubj4dT3BA7+weHRC
xzZONkGXZ2zcMjmvqRrF5yEYuswzn/EIqrEUiX7Ertk0UNeOrpCD1WDgUl+CXGIc+R8fBeOMa761
Ws3YszHxryIwexajgSERlkhUufGa/cyTypRxoHsyzkaAhepnSwHo14YK4arfMY4yN6ul7ZiV+XJY
mtOytz+r9Vz1mau+tKZzVZDcMIXudEfM/bdShCPOyc+ORC4mwrmg9d0ZOKl8xhU3llgPzb+96xut
eGnMbanoy1ePl5wqQsoxEtaIhKXxjkKxzWeQFCui45phxUYeEaiA3nCqKxYwssECB+pBrvi9rAz0
rdt/Gqp8TiJy/tuNNu/Sa6oCPwSL3CF3qptBNymTNpAW44J1xqp8rsf/dz13xUe2oc+tcrDIpdPt
UGs=
=DRSi
-----END PGP SIGNATURE-----

--------------m6CAjokMTg4dxOdBqynbXq0X--
