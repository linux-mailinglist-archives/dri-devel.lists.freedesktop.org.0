Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1741C53B798
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 13:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21E610E265;
	Thu,  2 Jun 2022 11:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5F710E265
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 11:07:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A4851FB20;
 Thu,  2 Jun 2022 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654168023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZX+NC1trfZWT0s95LtOEf5M6063KbgNhJ9a1Q76vzsE=;
 b=Zkp1KoZ4pwtl/RlnGXnGeB2y208yDjuaWN3jC6lTLVHW0OWFstuXzsOP96qaTuy5ec8nBA
 cnIMqwurwbLbq7etjbHBA2vLF8tCYxQRSDdsoWhtVO945TKNluXE8MKw1DlqGs0Pky1hsI
 tFE6RpPjUqy5Y+LFyW+jGbiKuK5oqXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654168023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZX+NC1trfZWT0s95LtOEf5M6063KbgNhJ9a1Q76vzsE=;
 b=DOa7KobnmyxixQ1cP6NeqgndsIwf+Wpqra9vDkNYcKrqIC5CI5EbCn10bqFLTIJjM02Elo
 u5g5l5U7821yJ8Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A8A613AC8;
 Thu,  2 Jun 2022 11:07:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cu0sEdeZmGJscwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Jun 2022 11:07:03 +0000
Message-ID: <074a4bbd-d3d8-01ef-1df2-a697cf819285@suse.de>
Date: Thu, 2 Jun 2022 13:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 00/10] drm/mgag200: Convert device init to use device-info
 structure
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220601112522.5774-1-tzimmermann@suse.de>
 <e67e7d9c-5b90-bf2a-f59a-4267d6b4ac59@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e67e7d9c-5b90-bf2a-f59a-4267d6b4ac59@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i1o6GDKkRAmXOfuVjq7pn2t0"
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
--------------i1o6GDKkRAmXOfuVjq7pn2t0
Content-Type: multipart/mixed; boundary="------------jYcm4C82VyNBslsMXYRuxlGN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <074a4bbd-d3d8-01ef-1df2-a697cf819285@suse.de>
Subject: Re: [PATCH 00/10] drm/mgag200: Convert device init to use device-info
 structure
References: <20220601112522.5774-1-tzimmermann@suse.de>
 <e67e7d9c-5b90-bf2a-f59a-4267d6b4ac59@redhat.com>
In-Reply-To: <e67e7d9c-5b90-bf2a-f59a-4267d6b4ac59@redhat.com>

--------------jYcm4C82VyNBslsMXYRuxlGN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDYuMjIgdW0gMTE6NTIgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDAxLzA2LzIwMjIgMTM6MjUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQ29u
dmVydCB0aGUgZGV2aWNlLWluaXQgY29kZSB0byB1c2UgYSBkZXZpY2UtaW5mbyBzdHJ1Y3R1
cmUgZm9yIGVhY2gNCj4+IG1vZGVsLiBUaGUgZGV2aWNlIGluZm8gY29udGFpbnMgY29uc3Rh
bnRzIGFuZCBmbGFncyB0aGF0IHdlcmUgcHJldmlvdXNseQ0KPj4gbG9jYXRlZCBpbiBkaWZm
ZXJlbnQgcGxhY2VzIG9mIHRoZSBjb2RlLg0KPj4NCj4+IEFsc28gcmVmYWN0b3IgdGhlIFBD
SSBhbmQgVlJBTSBpbml0aWFsaXphdGlvbiBoYW5kbGluZy4gQSBsYXRlciBwYXRjaHNldA0K
Pj4gY291bGQgY29udmVydCB0aGUgUENJIG1hZ2ljIG51bWJlcnMgaW50byBjb25zdGFudHMu
DQo+Pg0KPj4gRm9yIG1vZGVzZXR0aW5nLCB0aGUgcGVyLW1vZGVsIGluaXQgZnVuY3Rpb25z
IGN1cnJlbnRseSBkb24ndCBkbyBtdWNoLg0KPj4gVGhpcyB3aWxsIGNoYW5nZSB3aGVuIG1v
cmUgbW9kZWwtc3BlY2lmaWMgY29kZSBnZXRzIG1vdmVkIHRoZXJlLiBUaGUNCj4+IG1vZGVz
ZXR0aW5nIGFuZCBQTEwgY29kZSBjb250YWlucyBtb2RlbC1zcGVjaWZpYyBoYW5kbGluZyB0
aGF0IHNob3VsZA0KPj4gYmUgcmVmYWN0b3JlZC4NCj4+DQo+PiBUZXN0ZWQgd2l0aCBHMjAw
IGFuZCBHMjAwRVYgaGFyZHdhcmUuDQo+IA0KPiBUaGFua3MgZm9yIHRoaXMgcmVmYWN0b3Jp
bmcuDQo+IEkndmUgYWxzbyB0ZXN0ZWQgdGhpcyBwYXRjaHNldCBvbiBhIEcyMDBlVywgYW5k
IGhhdmUgc2VlbiBubyByZWdyZXNzaW9uLg0KPiANCj4gRm9yIHRoZSB3aG9sZSBzZXJpZXM6
DQo+IA0KPiBSZXZpZXdlZC1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQu
Y29tPg0KPiBUZXN0ZWQtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNv
bT4NCg0KVGhhbmtzIGEgbG90Lg0KDQpGWUkgSSBoYXZlIGFub3RoZXIgcGF0Y2hzZXQgaW4g
dGhlIHF1ZXVlIHRoYXQgcmVtb3ZlcyB0aGUgdHlwZS1yZWxhdGVkIA0KYnJhbmNoaW5nIHRo
cm91Z2hvdXQgdGhlIGRyaXZlci4gSXQgY292ZXJzIG1vZGVzZXR0aW5nIGFuZCBQTEwgc2V0
dXAgYW5kIA0Kd2lsbCBzcGxpdCB0aGUgZHJpdmVyIGludG8gcGVyLW1vZGVsIGFuZCBmdWxs
eS1nZW5lcmljIGNvZGUuIEl0J3MgZmFpcmx5IA0KbGFyZ2UgYnV0IG1vc3RseSByZWZhY3Rv
cmluZyBvZiBleGlzdGluZyBjb2RlLiBJJ2xsIHBvc3QgaXQgd2hlbiB0aGVzZSANCnBhdGNo
ZXMgaGF2ZSBsYW5kZWQgd2l0aG91dCBtYWpvciByZWdyZXNzaW9ucy4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4+DQo+PiBUaG9tYXMgWmltbWVybWFubiAoMTApOg0KPj4g
wqDCoCBkcm0vbWdhZzIwMDogUmVtb3ZlIHNwZWNpYWwgY2FzZSBmb3IgRzIwMFNFIHdpdGgg
PDIgTWlCDQo+PiDCoMKgIGRybS9tZ2FnMjAwOiBJbml0aWFsaXplIGVhY2ggbW9kZWwgaW4g
c2VwYXJhdGUgZnVuY3Rpb24NCj4+IMKgwqAgZHJtL21nYWcyMDA6IE1vdmUgUENJLW9wdGlv
biBzZXR1cCBpbnRvIG1vZGVsLXNwZWNpZmljIGNvZGUNCj4+IMKgwqAgZHJtL21nYWcyMDA6
IENhbGwgbWdhZzIwMF9kZXZpY2VfcHJvYmVfdnJhbSgpIGZyb20gcGVyLW1vZGVsIGluaXQN
Cj4+IMKgwqAgZHJtL21nYWcyMDA6IEltcGxlbWVudCBuZXcgaW5pdCBsb2dpYw0KPj4gwqDC
oCBkcm0vbWdhZzIwMDogQWRkIHN0cnVjdCBtZ2FnMjAwX2RldmljZV9pbmZvDQo+PiDCoMKg
IGRybS9tZ2FnMjAwOiBTdG9yZSBIV19CVUdfTk9fU1RBUlRBREQgZmxhZyBpbiBkZXZpY2Ug
aW5mbw0KPj4gwqDCoCBkcm0vbWdhZzIwMDogU3RvcmUgbWF4aW11bSByZXNvbHV0aW9uIGFu
ZCBtZW1vcnkgYmFuZHdpdGggaW4gZGV2aWNlDQo+PiDCoMKgwqDCoCBpbmZvDQo+PiDCoMKg
IGRybS9tZ2FnMjAwOiBTdG9yZSB2aWRyc3QgZmxhZyBpbiBkZXZpY2UgaW5mbw0KPj4gwqDC
oCBkcm0vbWdhZzIwMDogU3RvcmUgcG9zaXRpb25zIG9mIEkyQyBkYXRhIGFuZCBjbG9jayBi
aXRzIGluIGRldmljZSBpbmZvDQo+Pg0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
TWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE0ICstDQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jwqDCoMKgwqAgfCAzODYgKysrKysrKystLS0t
LS0tLS0tLS0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
aMKgwqDCoMKgIHwgMTM1ICsrKysrKy0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2cyMDAuY8KgwqDCoCB8IDIwMCArKysrKysrKysrKw0KPj4gwqAgZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwZWguY8KgIHzCoCA1MCArKysNCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMGVoMy5jIHzCoCA1MSArKysN
Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMGVyLmPCoCB8wqAg
NDYgKysrDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBldi5j
wqAgfMKgIDUwICsrKw0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9n
MjAwZXczLmMgfMKgIDYwICsrKysNCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfZzIwMHNlLmPCoCB8IDEzMCArKysrKysrKw0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9nMjAwd2IuY8KgIHzCoCA1MCArKysNCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfaTJjLmPCoMKgwqDCoCB8wqAgMjcgKy0NCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW0uY8KgwqDCoMKgwqAgfCAxMTYg
LS0tLS0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmPC
oMKgwqAgfCAxMDAgKystLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX3BsbC5jwqDCoMKgwqAgfMKgIDEyICstDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX3JlZy5owqDCoMKgwqAgfMKgwqAgMiArDQo+PiDCoCAxNiBmaWxlcyBj
aGFuZ2VkLCA5NDIgaW5zZXJ0aW9ucygrKSwgNDg3IGRlbGV0aW9ucygtKQ0KPj4gwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMC5j
DQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9nMjAwZWguYw0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfZzIwMGVoMy5jDQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwZXIuYw0KPj4gwqAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMGV2LmMN
Cj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2cyMDBldzMuYw0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNlLmMNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDB3Yi5jDQo+PiDCoCBkZWxldGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tbS5jDQo+Pg0K
Pj4NCj4+IGJhc2UtY29tbWl0OiAyYzhjYzVjZDIwZTI4YWZlNmI2M2FjYjI4ODkwZTVmNTdk
OWJmMDU1DQo+PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGMyYjJmMDhmMGVjY2M5ZjVkZjBj
MGRhNDlmYTFkMzYyNjdkZWIxMWQNCj4+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYzY3ZTVk
ODg2YTQ3YjdkMDI2NmQ4MTEwMDgzNzU1N2ZkYTM0Y2IyNA0KPiANCj4gDQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------jYcm4C82VyNBslsMXYRuxlGN--

--------------i1o6GDKkRAmXOfuVjq7pn2t0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKYmdYFAwAAAAAACgkQlh/E3EQov+D3
kQ//Tj1+daYM+KBRl5g1afZEPuSI5U0qCZ/wOew2aaJB31Qv+sWUxGSgucpR51uM7n65ksC/b+OX
ZIbSa0vhyXKKRxUrNyxDie58CaOeFNAngR7LuY2xiSwH/Uv1Zos1RtFWIY/HOVhV8q0QWrfxYCqR
Y20DTr5Mkq80UVhfanpiEvyH+fVYalh16AEXqrKebTl7Vam52yshe5Y5eh7Ul1sN/miyBVlcAw0c
1EJUC41MpZzZZRQJmF4IRNJE4TQ4MRzDgoEcbnSFyucKCnTM/SeTkcMJ1GzWDTJQ5HS5APeCEY0Q
QYBWzsM4OTSySs0wdz2dTKRoiF+n2c2/GjJyLppkM4kXs59TgWMycZFP6cEjCBLSzW6gk0bcF8DB
xYUuUAK99DZfTBcAM4Oms03QlfdKF0krChlmbBbTk96EQJ7spApKO5yz9rKRgPYH9qFFaqkgEg5w
xakyNoSmfPhby7Mj78QtCyHcYs1ouzb6lYrhl7A/FFFCEwvO94r50oHfuiVB3dkOF0QPxK8Dj0tz
JVj6tsD29CVEQ6uS6ugUBs0avsU7rO/B5xP4BR/JjmP8OX9r9/xbM6hKNsO34OMErCVhGeaFw5f5
owPiV90jiYPxdAuYPQn4xOsoJ4ccl9uBuRgKmfnk0EHzCVI4TBZAvFkimhHVyF2c38eFCG2F1IT5
p40=
=R0q1
-----END PGP SIGNATURE-----

--------------i1o6GDKkRAmXOfuVjq7pn2t0--
