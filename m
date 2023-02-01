Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CA686451
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 11:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6C10E3EF;
	Wed,  1 Feb 2023 10:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427C10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:34:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96D7933BC2;
 Wed,  1 Feb 2023 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675247640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGJdFzf4ps4BDGCIGezmvQsHjQ3rJq4fZ/rhG9iRHLI=;
 b=QHOgv0BoI7QTsY8gbItAWekqvWnwkktFUVwGBCKiRt31PpleO2wUKw18xMih0/rAUadQTJ
 bZotIvT87sDJJEmli37D5uqNh6GkThs4e3jqNDlURqdCQvtXzKGdeBuNtgtfrurUFQJ03D
 OwZR4bYOh7rRrThTwpK3PF9c5+H21aU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675247640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGJdFzf4ps4BDGCIGezmvQsHjQ3rJq4fZ/rhG9iRHLI=;
 b=PycLh9UGVZMwRgJEIEWW1hJgeZlOJYzV7Ip2KRaGzgxwr9BTeMRG/HMgn4gI592cl+lkOM
 PMzhouZaaKgcFVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CB3113A10;
 Wed,  1 Feb 2023 10:34:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /fmLGRhA2mPpAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 10:34:00 +0000
Message-ID: <5633a014-c9dd-6b35-41a8-fcf3cd4aef53@suse.de>
Date: Wed, 1 Feb 2023 11:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dma-buf: actually set signaling bit for private sub fences
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Arvind.Yadav@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org
References: <20230126002844.339593-1-dakr@redhat.com>
 <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
 <5caf64b6-0e3c-4c24-4fe8-9ed2caf43822@redhat.com>
 <081122e1-ecfe-9441-fb91-e1887f148529@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <081122e1-ecfe-9441-fb91-e1887f148529@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HvdzHt700mu082Ws00MCzqE8"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HvdzHt700mu082Ws00MCzqE8
Content-Type: multipart/mixed; boundary="------------xKda4rKqIiM4e5wJoyqcqcsQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Arvind.Yadav@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Message-ID: <5633a014-c9dd-6b35-41a8-fcf3cd4aef53@suse.de>
Subject: Re: [PATCH] dma-buf: actually set signaling bit for private sub
 fences
References: <20230126002844.339593-1-dakr@redhat.com>
 <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
 <5caf64b6-0e3c-4c24-4fe8-9ed2caf43822@redhat.com>
 <081122e1-ecfe-9441-fb91-e1887f148529@amd.com>
In-Reply-To: <081122e1-ecfe-9441-fb91-e1887f148529@amd.com>

--------------xKda4rKqIiM4e5wJoyqcqcsQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjAxLjIzIHVtIDA4OjQ5IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4g
QW0gMjYuMDEuMjMgdW0gMjM6MjUgc2NocmllYiBEYW5pbG8gS3J1bW1yaWNoOg0KPj4gT24g
MS8yNi8yMyAwNzo1OCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+PiBBbSAyNi4wMS4y
MyB1bSAwMToyOCBzY2hyaWViIERhbmlsbyBLcnVtbXJpY2g6DQo+Pj4+IEluIGRtYV9mZW5j
ZV9hbGxvY2F0ZV9wcml2YXRlX3N0dWIoKSBzZXQgdGhlIHNpZ25hbGluZyBiaXQgb2YgdGhl
IG5ld2x5DQo+Pj4+IGFsbG9jYXRlZCBwcml2YXRlIHN0dWIgZmVuY2UgcmF0aGVyIHRoYW4g
dGhlIHNpZ25hbGluZyBiaXQgb2YgdGhlDQo+Pj4+IHNoYXJlZCBkbWFfZmVuY2Vfc3R1Yi4N
Cj4+Pj4NCj4+Pj4gRml4ZXM6IGM4NWQwMGQ0ZmQ4YiAoImRtYS1idWY6IHNldCBzaWduYWxp
bmcgYml0IGZvciB0aGUgc3R1YiBmZW5jZSIpDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IERhbmls
byBLcnVtbXJpY2ggPGRha3JAcmVkaGF0LmNvbT4NCj4+Pg0KPj4+IEdvb2QgY2F0Y2gsIFJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+Pj4NCj4+PiBTaG91bGQgSSBwdXNoIGl0IHVwc3RyZWFtIGFzIHdlbGwgb3IgZG8geW91
IGhhdmUgY29tbWl0IGFjY2Vzcz8NCj4+DQo+PiBUaGFua3MsIEkgY2FuIHB1c2ggaXQgdG8g
ZHJtLW1pc2MtbmV4dC4NCj4gDQo+IFRoaXMgaXMgY2xlYXJseSBhIGJ1ZyBmaXggc28gYmV0
dGVyIHB1c2ggdGhpcyB0byBkcm0tbWlzYy1maXhlcyBhbmQgDQo+IG1heWJlIGV2ZW4gYWRk
IGEgQ0M6c3RhYmxlIHRhZy4NCg0KSSBoYXZlIGNoZXJyeS1waWNrZWQgdGhlIHBhdGNoIGlu
dG8gZHJtLW1pc2MtbmV4dC1maXhlcy4NCg0KPiANCj4gQ2hyaXN0aWFuLg0KPiANCj4+DQo+
Pj4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyB8IDIg
Ky0NCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCj4+Pj4gaW5kZXggNDA2YjRlMjZm
NTM4Li4wZGUwNDgyY2QzNmUgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UuYw0KPj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCj4+
Pj4gQEAgLTE2Nyw3ICsxNjcsNyBAQCBzdHJ1Y3QgZG1hX2ZlbmNlIA0KPj4+PiAqZG1hX2Zl
bmNlX2FsbG9jYXRlX3ByaXZhdGVfc3R1Yih2b2lkKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAwLCAwKTsNCj4+Pj4gwqDCoMKgwqDCoCBzZXRfYml0KERNQV9G
RU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULA0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgJmRt
YV9mZW5jZV9zdHViLmZsYWdzKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgICZmZW5jZS0+Zmxh
Z3MpOw0KPj4+PiDCoMKgwqDCoMKgIGRtYV9mZW5jZV9zaWduYWwoZmVuY2UpOw0KPj4+DQo+
Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------xKda4rKqIiM4e5wJoyqcqcsQ--

--------------HvdzHt700mu082Ws00MCzqE8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaQBgFAwAAAAAACgkQlh/E3EQov+BM
JA/+O15Wvl+lS9etL0WABcExyBnaxUtCk63izXw0lDWFfn3KJOTM9rsH+H1n7ok8hF+c74bOFW8Q
87nnPDHEaOQARUYO8EZCy4BYptIMpumjTuARKa2QRfOyKmys3+sReV4mvSr4SBr2otx9RvdlnEC1
yj5i31VqAuPSsjxVncCg1RfFuogARsAD3CWr69TeLXztVyLouwyKWke2veRmMVaMTReNEN1/7Hs6
rkcTQ3thzKMdH71P4eaXimxHGhIyFemie6jrKTl9BhO54f3uIRYqMxXF0QF5eNWJVO7R4B9Sxoio
UjddGKVpYHXiVsWCWtXWyXVN9wRQSpKx9v916//3BU4Pgs5yNBLDTXGg0OrgKcYs5psPzuRsC5H3
rAqJXMfMGISfC0NQpN7TpmA1qGkl5aFGDhtLftETnYS9yv++ESYesi5WtyU2Z3FVw+L1ZGAlZ135
yUqUrrdT5uvWL/3dp6fR7OzTaK4zWnVEBKApVI6LqfpNNtt0CLNYumc+7PmVggrQxgTD4uhusI63
YnvwHQvROE8KQHnvgnWSLEwcr5NW26gzxEMb/6fLgAzjXU0/siQ9Gbhxmi0Wb9/vF6OgePYbIrtf
XAFFizb1D4nCviXhfOhBcldzdbvcCm6qaDqpABd3ElhHaPa8X4Lkey3uZsRF2z6sThawMTwJdN5H
z6E=
=yjOE
-----END PGP SIGNATURE-----

--------------HvdzHt700mu082Ws00MCzqE8--
