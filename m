Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9166D5DBB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D010E657;
	Tue,  4 Apr 2023 10:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBFF10E651
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:41:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D91A2052C;
 Tue,  4 Apr 2023 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680604891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Q3liumwADVIt8viORjLk5wjw0MZ1XlH5+muMt7t6i4=;
 b=Vn9vw+vlsgFhzo0DAHsgWGTN7F5TVh+eJBAAJjSLiKTq47WHagK3gpHXqW8N78aLUZj4Kt
 +2usJ1Fo+NG26+V5Hvwl6o5JEyzLotH4nwiYUofceqrCTn7//7rlOiKDvH0ZxHeG3LKcUa
 KECA6NKMr71aEEzwizBiEYwm4x6TXBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680604891;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Q3liumwADVIt8viORjLk5wjw0MZ1XlH5+muMt7t6i4=;
 b=ygLpCde//3kEX0AXZeija4uzeZm6qnsu7u5fhQpCgr3l1NA+jmB5BKuypizf2v4aaikM4d
 XkoKcPXPUziJRXDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C324A13920;
 Tue,  4 Apr 2023 10:41:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eeB6Ltr+K2QXZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Apr 2023 10:41:30 +0000
Message-ID: <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
Date: Tue, 4 Apr 2023 12:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] video/aperture: fix typos
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230404040101.2165600-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k5qw9zj1HfkAOmVZFDp25xmu"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k5qw9zj1HfkAOmVZFDp25xmu
Content-Type: multipart/mixed; boundary="------------kTqiOeqe0QtHA5YylnZbJp1A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
Subject: Re: [PATCH] video/aperture: fix typos
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
In-Reply-To: <20230404040101.2165600-1-suijingfeng@loongson.cn>

--------------kTqiOeqe0QtHA5YylnZbJp1A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDQuMjMgdW0gMDY6MDEgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+ICAg
RUZJIEZCLCBWRVNBIEZCIG9yIFZHQSBGQiBldGMgYXJlIGJlbG9uZyB0byBmaXJtd2FyZSBi
YXNlZCBmcmFtZWJ1ZmZlcg0KPiAgIGRyaXZlci4NCg0KTm8gd2hpdGVzcGFjZXMgYXQgdGhl
IGJlZ2lubmluZyBvZiB0aGUgbGluZXMuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN1aSBK
aW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vYXBlcnR1cmUuYyB8IDggKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYXBlcnR1cmUuYyBiL2RyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYw0KPiBpbmRl
eCA0MWU3N2RlMWVhODIuLmIwMDk0NjhmZmRmZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92
aWRlby9hcGVydHVyZS5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYw0KPiBA
QCAtMjAsNyArMjAsNyBAQA0KPiAgICAqIGRyaXZlciBjYW4gYmUgYWN0aXZlIGF0IGFueSBn
aXZlbiB0aW1lLiBNYW55IHN5c3RlbXMgbG9hZCBhIGdlbmVyaWMNCj4gICAgKiBncmFwaGlj
cyBkcml2ZXJzLCBzdWNoIGFzIEVGSS1HT1Agb3IgVkVTQSwgZWFybHkgZHVyaW5nIHRoZSBi
b290IHByb2Nlc3MuDQo+ICAgICogRHVyaW5nIGxhdGVyIGJvb3Qgc3RhZ2VzLCB0aGV5IHJl
cGxhY2UgdGhlIGdlbmVyaWMgZHJpdmVyIHdpdGggYSBkZWRpY2F0ZWQsDQo+IC0gKiBoYXJk
d2FyZS1zcGVjaWZpYyBkcml2ZXIuIFRvIHRha2Ugb3ZlciB0aGUgZGV2aWNlIHRoZSBkZWRp
Y2F0ZWQgZHJpdmVyDQo+ICsgKiBoYXJkd2FyZS1zcGVjaWZpYyBkcml2ZXIuIFRvIHRha2Ug
b3ZlciB0aGUgZGV2aWNlLCB0aGUgZGVkaWNhdGVkIGRyaXZlcg0KPiAgICAqIGZpcnN0IGhh
cyB0byByZW1vdmUgdGhlIGdlbmVyaWMgZHJpdmVyLiBBcGVydHVyZSBmdW5jdGlvbnMgbWFu
YWdlDQo+ICAgICogb3duZXJzaGlwIG9mIGZyYW1lYnVmZmVyIG1lbW9yeSBhbmQgaGFuZC1v
dmVyIGJldHdlZW4gZHJpdmVycy4NCj4gICAgKg0KPiBAQCAtNzYsNyArNzYsNyBAQA0KPiAg
ICAqIGdlbmVyaWMgRUZJIG9yIFZFU0EgZHJpdmVycywgaGF2ZSB0byByZWdpc3RlciB0aGVt
c2VsdmVzIGFzIG93bmVycyBvZiB0aGVpcg0KPiAgICAqIGZyYW1lYnVmZmVyIGFwZXJ0dXJl
cy4gT3duZXJzaGlwIG9mIHRoZSBmcmFtZWJ1ZmZlciBtZW1vcnkgaXMgYWNoaWV2ZWQNCj4g
ICAgKiBieSBjYWxsaW5nIGRldm1fYXBlcnR1cmVfYWNxdWlyZV9mb3JfcGxhdGZvcm1fZGV2
aWNlKCkuIElmIHN1Y2Nlc3NmdWwsIHRoZQ0KPiAtICogZHJpdmVyaXMgdGhlIG93bmVyIG9m
IHRoZSBmcmFtZWJ1ZmZlciByYW5nZS4gVGhlIGZ1bmN0aW9uIGZhaWxzIGlmIHRoZQ0KPiAr
ICogZHJpdmVyIGlzIHRoZSBvd25lciBvZiB0aGUgZnJhbWVidWZmZXIgcmFuZ2UuIFRoZSBm
dW5jdGlvbiBmYWlscyBpZiB0aGUNCj4gICAgKiBmcmFtZWJ1ZmZlciBpcyBhbHJlYWR5IG93
bmVkIGJ5IGFub3RoZXIgZHJpdmVyLiBTZWUgYmVsb3cgZm9yIGFuIGV4YW1wbGUuDQo+ICAg
ICoNCj4gICAgKiAuLiBjb2RlLWJsb2NrOjogYw0KPiBAQCAtMTI2LDcgKzEyNiw3IEBADQo+
ICAgICogZXQgYWwgZm9yIHRoZSByZWdpc3RlcmVkIGZyYW1lYnVmZmVyIHJhbmdlLCB0aGUg
YXBlcnR1cmUgaGVscGVycyBjYWxsDQo+ICAgICogcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0
ZXIoKSBhbmQgdGhlIGdlbmVyaWMgZHJpdmVyIHVubG9hZHMgaXRzZWxmLiBUaGUNCj4gICAg
KiBnZW5lcmljIGRyaXZlciBhbHNvIGhhcyB0byBwcm92aWRlIGEgcmVtb3ZlIGZ1bmN0aW9u
IHRvIG1ha2UgdGhpcyB3b3JrLg0KPiAtICogT25jZSBob3QgdW5wbHVnZ2VkIGZybyBtaGFy
ZHdhcmUsIGl0IG1heSBub3QgYWNjZXNzIHRoZSBkZXZpY2Uncw0KPiArICogT25jZSBob3Qg
dW5wbHVnZ2VkIGZyb20gaGFyZHdhcmUsIGl0IG1heSBub3QgYWNjZXNzIHRoZSBkZXZpY2Un
cw0KPiAgICAqIHJlZ2lzdGVycywgZnJhbWVidWZmZXIgbWVtb3J5LCBST00sIGV0YyBhZnRl
cndhcmRzLg0KPiAgICAqLw0KPiAgIA0KPiBAQCAtMjAzLDcgKzIwMyw3IEBAIHN0YXRpYyB2
b2lkIGFwZXJ0dXJlX2RldGFjaF9wbGF0Zm9ybV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBSZW1vdmUgdGhlIGRldmljZSBmcm9tIHRoZSBk
ZXZpY2UgaGllcmFyY2h5LiBUaGlzIGlzIHRoZSByaWdodCB0aGluZw0KPiAtCSAqIHRvIGRv
IGZvciBmaXJtd2FyZS1iYXNlZCBEUk0gZHJpdmVycywgc3VjaCBhcyBFRkksIFZFU0Egb3Ig
VkdBLiBBZnRlcg0KPiArCSAqIHRvIGRvIGZvciBmaXJtd2FyZS1iYXNlZCBmYiBkcml2ZXJz
LCBzdWNoIGFzIEVGSSwgVkVTQSBvciBWR0EuIEFmdGVyDQoNClRoYXQgc2VudGVuY2VzIGlz
IG5vdCB3ZWxsIHBocmFzZWQuIE1heWJlIHNheSAnVGhpcyBpcyByZXF1aXJlZCBmb3IgDQpm
aXJtd2FyZS1wcm92aWRlZCBncmFwaGljcywgc3VjaCBhcyBFRkksIFZFU0Egb3IgVkdBLicN
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIAkgKiB0aGUgbmV3IGRyaXZlciB0YWtl
cyBvdmVyIHRoZSBoYXJkd2FyZSwgdGhlIGZpcm13YXJlIGRldmljZSdzIHN0YXRlDQo+ICAg
CSAqIHdpbGwgYmUgbG9zdC4NCj4gICAJICoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------kTqiOeqe0QtHA5YylnZbJp1A--

--------------k5qw9zj1HfkAOmVZFDp25xmu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQr/toFAwAAAAAACgkQlh/E3EQov+Cy
axAAtwSMxX4K+xQL2C9mdmOsMfq/bKIT9iPUXb3f78UFh6j2ZHJ3R7V+N0nqKsDoondQw1fJL0BB
p5zvfQdL25ggQbUXNvtLGR0JevQPV5QEHJ0oFsoZivAYIYjCEu6VA5hipEDa1q1Sf2pRbBNl4Hmj
+kS45ovxCfGMrfpObncCzXdCQrQravqozGd7vRqpZ+mSstcI26dWxHkS5tAfAJ3zm83C/h28NXr6
LXlJcOujqmxZ9fDrj/8VMkWw79eKy9eyv+U3zfNKXk4gBsRdd5dJ19PuihRMVfNr0NuZ+7iaJ5f8
YKWxhEZy6BLPM70vhhxAxF1l1bIXKUjVJj8P0QuGIlWp9fEk6Z+xbN4MRBhL1fEJjA290xup3697
U14Y9Y6QCyg5iRylK2EDFdFilARFSll+WZjWyEdhkqGSi8soXrJDl+YP4lCAAhW4Tz6M7XiCTVzL
5DKmgw6IV+NFaX+GLBwXEf1boCuuuS9wiZ2T0wfBxCh2s4L3JeZsqwuY0y+iYO58Wbxup+3uxGsj
D/33dbD96hmLkgloYe2He92E4LoeyDjE9tFAMVVwD25pEFVIB0BFG36flrQb1Wf2YLmzsz1q16b5
ID/51GtW6kUmdHT7o625QDUJDBcFB4U4M/8MNhVrjXTwJFw6JmaIxemUKkZQcXoHl6t4U+PtNDQA
TlU=
=gbOP
-----END PGP SIGNATURE-----

--------------k5qw9zj1HfkAOmVZFDp25xmu--
