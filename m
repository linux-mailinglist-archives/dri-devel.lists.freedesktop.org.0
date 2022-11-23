Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800A6351E5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3557A10E4FB;
	Wed, 23 Nov 2022 08:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D37710E4FD;
 Wed, 23 Nov 2022 08:07:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1BA8A1F8B6;
 Wed, 23 Nov 2022 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669190833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0cjmS+udMSbgxNMsc1o3sW/B0GiTGtv0qAm247CAou4=;
 b=RQ7ZlmIJYuWajiKS0mg/SSVZWW9drHUVO/sWndiBnL90W/C3nMDld51tDqq2Sx9anoeN1V
 qU3xLxLnH9o8LQxdOgP36NuhsWSePW/Q1JOoC65eztS8oJpxBXpQ9UBb4wrFDocRbWyHBe
 Qi+1EwTC3D8NBRpQhQZOzHPCeKepK/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669190833;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0cjmS+udMSbgxNMsc1o3sW/B0GiTGtv0qAm247CAou4=;
 b=kP8t1LRkVt5SR/WqjT5pC+jq6U0OZ0oPEaUlXpJ8vhHHm/cTvdpdBro4FfUyiPsc0PVqdW
 hYMQgp4ntWV5w4Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFA1313AE7;
 Wed, 23 Nov 2022 08:07:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r52LNbDUfWNZZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 08:07:12 +0000
Message-ID: <5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de>
Date: Wed, 23 Nov 2022 09:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rp2ZIBTiErka0zmyDjiI3F1l"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Rp2ZIBTiErka0zmyDjiI3F1l
Content-Type: multipart/mixed; boundary="------------zMKZ34VgLvfI5y0CD2ukgoa8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Stultz <john.stultz@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Message-ID: <5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20221122170801.842766-1-daniel.vetter@ffwll.ch>

--------------zMKZ34VgLvfI5y0CD2ukgoa8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMTEuMjIgdW0gMTg6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiB0
bGRyOyBETUEgYnVmZmVycyBhcmVuJ3Qgbm9ybWFsIG1lbW9yeSwgZXhwZWN0aW5nIHRoYXQg
eW91IGNhbiB1c2UNCj4gdGhlbSBsaWtlIHRoYXQgKGxpa2UgY2FsbGluZyBnZXRfdXNlcl9w
YWdlcyB3b3Jrcywgb3IgdGhhdCB0aGV5J3JlDQo+IGFjY291bnRpbmcgbGlrZSBhbnkgb3Ro
ZXIgbm9ybWFsIG1lbW9yeSkgY2Fubm90IGJlIGd1YXJhbnRlZWQuDQo+IA0KPiBTaW5jZSBz
b21lIHVzZXJzcGFjZSBvbmx5IHJ1bnMgb24gaW50ZWdyYXRlZCBkZXZpY2VzLCB3aGVyZSBh
bGwNCj4gYnVmZmVycyBhcmUgYWN0dWFsbHkgYWxsIHJlc2lkZW50IHN5c3RlbSBtZW1vcnks
IHRoZXJlJ3MgYSBodWdlDQo+IHRlbXB0YXRpb24gdG8gYXNzdW1lIHRoYXQgYSBzdHJ1Y3Qg
cGFnZSBpcyBhbHdheXMgcHJlc2VudCBhbmQgdXNlYWJsZQ0KPiBsaWtlIGZvciBhbnkgbW9y
ZSBwYWdlY2FjaGUgYmFja2VkIG1tYXAuIFRoaXMgaGFzIHRoZSBwb3RlbnRpYWwgdG8NCj4g
cmVzdWx0IGluIGEgdWFwaSBuaWdodG1hcmUuDQo+IA0KPiBUbyBzdG9wIHRoaXMgZ2FwIHJl
cXVpcmUgdGhhdCBETUEgYnVmZmVyIG1tYXBzIGFyZSBWTV9QRk5NQVAsIHdoaWNoDQo+IGJs
b2NrcyBnZXRfdXNlcl9wYWdlcyBhbmQgYWxsIHRoZSBvdGhlciBzdHJ1Y3QgcGFnZSBiYXNl
ZA0KPiBpbmZyYXN0cnVjdHVyZSBmb3IgZXZlcnlvbmUuIEluIHNwaXJpdCB0aGlzIGlzIHRo
ZSB1YXBpIGNvdW50ZXJwYXJ0IHRvDQo+IHRoZSBrZXJuZWwtaW50ZXJuYWwgQ09ORklHX0RN
QUJVRl9ERUJVRy4NCj4gDQo+IE1vdGl2YXRlZCBieSBhIHJlY2VudCBwYXRjaCB3aGljaCB3
YW50ZWQgdG8gc3dpY2ggdGhlIHN5c3RlbSBkbWEtYnVmDQo+IGhlYXAgdG8gdm1faW5zZXJ0
X3BhZ2UgaW5zdGVhZCBvZiB2bV9pbnNlcnRfcGZuLg0KPiANCj4gdjI6DQo+IA0KPiBKYXNv
biBicm91Z2h0IHVwIHRoYXQgd2UgYWxzbyB3YW50IHRvIGd1YXJhbnRlZSB0aGF0IGFsbCBw
dGVzIGhhdmUgdGhlDQo+IHB0ZV9zcGVjaWFsIGZsYWcgc2V0LCB0byBjYXRjaCBmYXN0IGdl
dF91c2VyX3BhZ2VzIChvbiBhcmNoaXRlY3R1cmVzDQo+IHRoYXQgc3VwcG9ydCB0aGlzKS4g
QWxsb3dpbmcgVk1fTUlYRURNQVAgKGxpa2UgVk1fU1BFQ0lBTCBkb2VzKSB3b3VsZA0KPiBz
dGlsbCBhbGxvdyB2bV9pbnNlcnRfcGFnZSwgYnV0IGxpbWl0aW5nIHRvIFZNX1BGTk1BUCB3
aWxsIGNhdGNoIHRoYXQuDQo+IA0KPiAgRnJvbSBhdWRpdGluZyB0aGUgdmFyaW91cyBmdW5j
dGlvbnMgdG8gaW5zZXJ0IHBmbiBwdGUgZW50aXJlcw0KPiAodm1faW5zZXJ0X3Bmbl9wcm90
LCByZW1hcF9wZm5fcmFuZ2UgYW5kIGFsbCBpdCdzIGNhbGxlcnMgbGlrZQ0KPiBkbWFfbW1h
cF93YykgaXQgbG9va3MgbGlrZSBWTV9QRk5NQVAgaXMgYWxyZWFkeSByZXF1aXJlZCBhbnl3
YXksIHNvDQo+IHRoaXMgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IGZsYWcgdG8gY2hlY2sgZm9y
Lg0KPiANCj4gdjM6IENoYW5nZSB0byBXQVJOX09OX09OQ0UgKFRob21hcyBaaW1tZXJtYW5u
KQ0KPiANCj4gUmVmZXJlbmNlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUtN
Szd1SGkrbUcwejBIVW1OdDEzUUNDdnV0dVJWanBjUjBOalJMMTJrLVdiV3prUmdAbWFpbC5n
bWFpbC5jb20vDQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+DQo+IENjOiBTdXJl
biBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPg0KPiBDYzogTWF0dGhldyBXaWxj
b3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+DQo+IENjOiBKb2huIFN0dWx0eiA8am9obi5zdHVs
dHpAbGluYXJvLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPg0KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxp
bmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZw0KPiAtLQ0KPiBPayBJIGVudGlyZWx5IGZv
cmdvdCBhYm91dCB0aGlzIHBhdGNoIGJ1dCBzdHVtYmxlZCBvdmVyIGl0IGFuZCBjaGVja2Vk
DQo+IHdoYXQncyB1cCB3aXRoIGl0IG5vLiBJIHRoaW5rIGl0J3MgcmVhZHkgbm93IGZvciBt
ZXJnaW5nOg0KPiAtIHNobWVtIGhlbHBlciBwYXRjaGVzIHRvIGZpeCB1cCB2Z2VtIGxhbmRl
ZA0KPiAtIHR0bSBoYXMgYmVlbiBmaXhlZCBzaW5jZSBhIHdoaWxlDQo+IC0gSSBkb24ndCB0
aGluayB3ZSd2ZSBoYWQgYW55IG90aGVyIG9wZW4gaXNzdWVzDQo+IA0KPiBUaW1lIHRvIGxv
Y2sgZG93biB0aGlzIHVhcGkgY29udHJhY3QgZm9yIHJlYWw/DQo+IC1EYW5pZWwNCj4gLS0t
DQo+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPiBpbmRleCBi
NmMzNjkxNGU3YzYuLjg4NzE4NjY1YzNjMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+IEBA
IC0xNTAsNiArMTUwLDggQEAgc3RhdGljIGludCBkbWFfYnVmX21tYXBfaW50ZXJuYWwoc3Ry
dWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPiAgIAlyZXQg
PSBkbWFidWYtPm9wcy0+bW1hcChkbWFidWYsIHZtYSk7DQo+ICAgCWRtYV9yZXN2X3VubG9j
ayhkbWFidWYtPnJlc3YpOw0KPiAgIA0KPiArCVdBUk5fT05fT05DRSghKHZtYS0+dm1fZmxh
Z3MgJiBWTV9QRk5NQVApKTsNCg0KV2VsbCAsIEkgYWxyZWFkeSBhLWInZWQgdGhpcywgYnV0
IGRvZXMgaXQgd29yayB3aXRoIERNYSBoZWxwZXJzLiBJJ20gDQphc2tpbmcgYmVjYXVzZSBv
ZiBbMV0uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEtcmM2L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9kbWFfaGVscGVyLmMjTDUzMw0KDQo+ICsNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9
DQo+ICAgDQo+IEBAIC0xNDk1LDYgKzE0OTcsOCBAQCBpbnQgZG1hX2J1Zl9tbWFwKHN0cnVj
dCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIAly
ZXQgPSBkbWFidWYtPm9wcy0+bW1hcChkbWFidWYsIHZtYSk7DQo+ICAgCWRtYV9yZXN2X3Vu
bG9jayhkbWFidWYtPnJlc3YpOw0KPiAgIA0KPiArCVdBUk5fT05fT05DRSghKHZtYS0+dm1f
ZmxhZ3MgJiBWTV9QRk5NQVApKTsNCj4gKw0KPiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4g
ICBFWFBPUlRfU1lNQk9MX05TX0dQTChkbWFfYnVmX21tYXAsIERNQV9CVUYpOw0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------zMKZ34VgLvfI5y0CD2ukgoa8--

--------------Rp2ZIBTiErka0zmyDjiI3F1l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN91LAFAwAAAAAACgkQlh/E3EQov+AA
bxAAyOBQUadySKbFCJKIlYzOHIc27SwEfG+pDzSQOfOraE7AW0uPC0tMNo7U38LI8eXH2LVg/DwH
ouU8y6RhSfsPRBb7ibiBTcrfruR1dUDVnMpY0BQV1hMMbhZklIz1Ozqg8RPpy1lBezDsW4KGIwYH
Y0tfHEyQ1c5EKPYcJpTP5spLVZkywYVipQ8+80r1eP7fVFQdwm9LD9XDnPRh6dRWJPKIspEqjA5C
DIw/uatyaHDAAc2HpSNPgrYgGd2c+GceTblbHYztmmm8Vd3+pPyXEsyd0V6RCxD/Ey/pznUI98RJ
qvcolQ5RugvixJosrogwY/dM0Cb9ynY7Cohu39ZfACqkOLew3kvK6qLHtU2GsxpYFIfa3UX7mC2d
+J9fq37Hgi+9ciSTfrIXM0NziTyXUpSdNKC3W9KOWjDTLz6McwNRSe1L0qO2V/BP83BfcL6jrr9o
6d4UxepTWNKJsPPrzVa/10P6QPJEQkayVAEBl6PYMnzWlyZ/jTv9hlRgbhHWbcc+FUxsTuVirUYP
xNRvEn0z+gh4Z0ZwpANklrmA9W1xOLWseXkrRl21+aMP+dri8KlkGNJpljkO/9JKI7Cz2UB3aKrC
+PThdMs23m3MNCYYH/NbucZlzTGiUd8xk4E1XC/b/2dAN6JEp1f/0uTH066zDo1tDH5k/WlqPFSa
piM=
=WIMX
-----END PGP SIGNATURE-----

--------------Rp2ZIBTiErka0zmyDjiI3F1l--
