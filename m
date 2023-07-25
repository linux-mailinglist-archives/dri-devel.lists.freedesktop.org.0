Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F0762294
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 21:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB28F10E119;
	Tue, 25 Jul 2023 19:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D18310E119
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 19:43:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C87BB1F8D6;
 Tue, 25 Jul 2023 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690314225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWxaxfh4fZMBg36nTQymMEDMB3AyPNxL0wSzMXf7Ur8=;
 b=vrDjNVmXS4f5fQoHjfQ6k/NKkwVtf+qqOOwHjEgXLRWN3j3/nb//3W4+bFFFG0eh9P2pp6
 DHNWMmVSpfyEbaQA6vhvDfgRW1G7dYn6YoB6F4MLvR5OmyR9UyYi/xxIS5Mf8ZGVgry9CO
 urw+PSATasWtG31Ugxb+bCGQH5lzNcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690314225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWxaxfh4fZMBg36nTQymMEDMB3AyPNxL0wSzMXf7Ur8=;
 b=C9MzR6FT0hgDPwhX70pSSsw32xnoj9t/5v43aP+Qyg0KWE/dpXyLAgqhb2qWpsvTSvxplm
 ekvJ5K5YbpjWFYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B6F413342;
 Tue, 25 Jul 2023 19:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lpNoJPElwGT1EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jul 2023 19:43:45 +0000
Message-ID: <c3f4a520-38b2-ac19-3fb9-f222022f4bdc@suse.de>
Date: Tue, 25 Jul 2023 21:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drm/ast: Do not enable PCI resources multiple times
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>, jfalempe@redhat.com,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
References: <20230712130826.3318-1-tzimmermann@suse.de>
 <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>
 <bb3b4288-9ee0-8d24-4a77-50630a76ac7c@suse.de>
 <bd866246-6b98-44fd-55f6-64e9e6fa22ba@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <bd866246-6b98-44fd-55f6-64e9e6fa22ba@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e0SqyTpYuC9qqkNzQhj0wnpP"
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
--------------e0SqyTpYuC9qqkNzQhj0wnpP
Content-Type: multipart/mixed; boundary="------------pH0qYkKLvzhS4apBy4ik9Esl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>, jfalempe@redhat.com,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <c3f4a520-38b2-ac19-3fb9-f222022f4bdc@suse.de>
Subject: Re: drm/ast: Do not enable PCI resources multiple times
References: <20230712130826.3318-1-tzimmermann@suse.de>
 <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>
 <bb3b4288-9ee0-8d24-4a77-50630a76ac7c@suse.de>
 <bd866246-6b98-44fd-55f6-64e9e6fa22ba@loongson.cn>
In-Reply-To: <bd866246-6b98-44fd-55f6-64e9e6fa22ba@loongson.cn>

--------------pH0qYkKLvzhS4apBy4ik9Esl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjMgdW0gMDM6MTIgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gSGks
DQo+IA0KPiBPbiAyMDIzLzcvMjUgMDI6MzQsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+PiBBbSAxOC4wNy4yMyB1bSAwNzo0MCBzY2hyaWViIHN1aWppbmdmZW5n
Og0KPj4+IEhpLA0KPj4+DQo+Pj4NCj4+PiBBY3R1YWxseSzCoCBJJ20gb25seSBhIGxpdHRs
ZSBiaXQgd29ycnkgYWJvdXQgdGhlIGFzdF9wbV90aGF3KCkgY29kZSANCj4+PiBwYXRoLg0K
Pj4+DQo+Pj4gfC0gYXN0X3BtX3RoYXcoKQ0KPj4+DQo+Pj4gfC0tIGFzdF9kcm1fdGhhdygp
DQo+Pj4NCj4+PiB8LS0tIGFzdF9wb3N0X2dwdSgpDQo+Pg0KPiANCj4+IEknbSBub3QgcXVp
dGUgc3VyZSB3aGF0IG1lYW4gaGVyZSwgYmVjYXVzZSB0aGUgcG9zdC1HUFUgY29kZSBpcyBu
b3QgDQo+PiBpbnZvbHZlZCBpbiB0aGlzIHBhdGNoLg0KPiANCj4gDQo+IEFoLCBJJ20gZ2V0
IGNvbmZ1c2VkIHdpdGggYSBwcmV2aW91cyBwYXRjaC4NCg0KT2ssIG5vIHByb2JsZW0uIEkn
dmUgbm93IG1lcmdlZCB0aGF0IHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPiBQcmV2aW91c2x5LCB0aGUgZHJtL2FzdCBkcml2ZXIgY2FsbCBhc3RfaW5pdF9wY2lf
Y29uZmlnKCkgZnVuY3Rpb24gaW4gDQo+IGFzdF9wb3N0X2dwdSgpLg0KPiANCj4gSSBhbHNv
IGRvbid0IGtub3cgd2h5IGl0IG5lZWQgdG8gZG8gc28uDQo+IA0KPiBPayB0aGVuLCBqdXN0
IHJlbW92ZSBpdC4NCj4gDQo+IA0KPj4gQWxsIHRoaXMgcGF0Y2ggZG9lcyBpcyB0byByZW1v
dmUgZHVwbGljYXRlZCBjb2RlLg0KPj4NCj4gDQo+IFllcywgdGhpcyBwYXRjaCBoYXMgbm90
aGluZyB0byBkbyB3aXRoIHRoZSBhc3RfcG9zdF9ncHUoKSBmdW5jdGlvbi4NCj4gDQo+IA0K
Pj4gSXMgdGhlcmUgYSBidWcgaW4gdGhlIHBvc3QtR1BVIGhhbmRsaW5nPw0KPj4NCj4gDQo+
IE5vLCBJJ20gbm90IGZpbmQgb25lIHNvIGZhci4NCj4gDQo+IA0KPj4gQmVzdCByZWdhcmRz
DQo+PiBUaG9tYXMNCj4+DQo+Pj4NCj4+Pg0KPj4+IEV4Y2VwdCB0aGlzLCBhbGwgb3RoZXIg
Y29kZSBwYXRoIGhhdmUgcGNpX2VuYWJsZV9kZXZpY2UoKSBvciANCj4+PiBwY2ltX2VuYWJs
ZV9kZXZpY2UoKSBjYWxsZWQuDQo+Pj4NCj4+PiBTbywgdGhpcyBwYXRjaCBzZWVtcyBPSy4N
Cj4+Pg0KPj4+DQo+Pj4gT24gMjAyMy83LzEyIDIxOjA4LCBUaG9tYXMgWmltbWVybWFubiB3
cm90ZToNCj4+Pj4gUmVtb3ZlIGFzdF9pbml0X3BjaV9jb25maWcoKSBhcyB0aGUgYXN0IGRy
aXZlciBhbHJlYWR5IGVuYWJsZXMgdGhlIFBDSQ0KPj4+PiByZXNvdXJjZXMgYnkgY2FsbGlu
ZyBwY2ltX2VuYWJsZV9kZXZpY2UoKS4NCj4+Pj4NCj4+Pj4gU3VnZ2VzdGVkLWJ5OiBTdWkg
SmluZ2ZlbmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNuPg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4gUmV2aWV3
ZWQtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyB8IDIxIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjEgZGVsZXRpb25zKC0p
DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWlu
LmMgDQo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+Pj4+IGluZGV4
IDhiZmJkZmQ4NmQ3Ny4uZGFlMzY1ZWQzOTY5IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbWFpbi5jDQo+Pj4+IEBAIC0zNSwyMyArMzUsNiBAQA0KPj4+PiDCoCAjaW5jbHVk
ZSAiYXN0X2Rydi5oIg0KPj4+PiAtc3RhdGljIGludCBhc3RfaW5pdF9wY2lfY29uZmlnKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiAtew0KPj4+PiAtwqDCoMKgIGludCBlcnI7DQo+
Pj4+IC3CoMKgwqAgdTE2IHBjaXMwNDsNCj4+Pj4gLQ0KPj4+PiAtwqDCoMKgIGVyciA9IHBj
aV9yZWFkX2NvbmZpZ193b3JkKHBkZXYsIFBDSV9DT01NQU5ELCAmcGNpczA0KTsNCj4+Pj4g
LcKgwqDCoCBpZiAoZXJyKQ0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+Pj4+
IC0NCj4+Pj4gLcKgwqDCoCBwY2lzMDQgfD0gUENJX0NPTU1BTkRfTUVNT1JZIHwgUENJX0NP
TU1BTkRfSU87DQo+Pj4+IC0NCj4+Pj4gLcKgwqDCoCBlcnIgPSBwY2lfd3JpdGVfY29uZmln
X3dvcmQocGRldiwgUENJX0NPTU1BTkQsIHBjaXMwNCk7DQo+Pj4+IC0NCj4+Pj4gLW91dDoN
Cj4+Pj4gLcKgwqDCoCByZXR1cm4gcGNpYmlvc19lcnJfdG9fZXJybm8oZXJyKTsNCj4+Pj4g
LX0NCj4+Pj4gLQ0KPj4+PiDCoCBzdGF0aWMgYm9vbCBhc3RfaXNfdmdhX2VuYWJsZWQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikNCj4+Pj4gwqAgew0KPj4+PiDCoMKgwqDCoMKgIHN0cnVj
dCBhc3RfZGV2aWNlICphc3QgPSB0b19hc3RfZGV2aWNlKGRldik7DQo+Pj4+IEBAIC00ODMs
MTAgKzQ2Niw2IEBAIHN0cnVjdCBhc3RfZGV2aWNlICphc3RfZGV2aWNlX2NyZWF0ZShjb25z
dCANCj4+Pj4gc3RydWN0IGRybV9kcml2ZXIgKmRydiwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVJTyk7DQo+Pj4+IMKgwqDCoMKgwqAgfQ0K
Pj4+PiAtwqDCoMKgIHJldCA9IGFzdF9pbml0X3BjaV9jb25maWcocGRldik7DQo+Pj4+IC3C
oMKgwqAgaWYgKHJldCkNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKHJl
dCk7DQo+Pj4+IC0NCj4+Pj4gwqDCoMKgwqDCoCBpZiAoIWFzdF9pc192Z2FfZW5hYmxlZChk
ZXYpKSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1faW5mbyhkZXYsICJWR0Egbm90
IGVuYWJsZWQgb24gZW50cnksIHJlcXVlc3RpbmcgY2hpcCANCj4+Pj4gUE9TVFxuIik7DQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBuZWVkX3Bvc3QgPSB0cnVlOw0KPj4+DQo+Pg0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------pH0qYkKLvzhS4apBy4ik9Esl--

--------------e0SqyTpYuC9qqkNzQhj0wnpP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTAJfAFAwAAAAAACgkQlh/E3EQov+Az
6A/+Oi45pWFcNqxi18U3R0IefuK8cy8fR8H/k/k7q2MSGcMZNapQELpHuVkWVDK6SF8bXhAB4TBt
ArVvhXHhcCLpXoKCwAKz2VekaUzXlZwAK9iV1SzTzP6Riwx/TE32Ie+ApKwksNy37RZBPQfJUgRl
KzL5Hva5Snuhkr16aplw2tM0Vn+n0AsIflnaShZF1Pvovrgo0qUfvG85nyccTQjZqJa65PVbm/zO
o4T1mxSm865mZFoJSwGAfG0VfTDiy2FLSlDysjCbXnbRqRnCMy6Rv1ZteqrwArElLxGZVPaMsQhQ
qsmGHMVlmSKkKeG/we9PFKdi9I5KlCAvniG5DwIslOn9tvd0evjpkbbMhx3eT6TswffSEZqsi498
6MdOlo/giBedkDKDdc2C5o/OKgR+WtVREvqbNrlO0GP7Ja00QAX22c93WKioCiA+orqZOzB0F6E9
mCwbnBKvzz1HG0/yVXTZvbFPw4XY5Kq5+Ik6A4emvfUDYUBWhquu5agkZi8J/qTAip55CYPSMrQl
hc0nkYT7jehHieV3ugUyV6sddFVTKCUyzCBstRKiDsJ2MwrQtLfoK7eZJF+fSgWP+0z1aWuzukRd
NKY27TVoBjy9QqF6taJ4F2bF7CghPziWE6gGcWD41Ma7ORDOYsRAvYNi8H2PdsY0d9WNSqb7rX9U
oUk=
=6IeW
-----END PGP SIGNATURE-----

--------------e0SqyTpYuC9qqkNzQhj0wnpP--
