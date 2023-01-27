Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255967E7F9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6910E999;
	Fri, 27 Jan 2023 14:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF5410E997;
 Fri, 27 Jan 2023 14:17:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45AE122087;
 Fri, 27 Jan 2023 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674829022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZiwNEqXmi9BMmxbKEurVmSr6ZVu3hsnB0ttl+6/ICA=;
 b=0qcyTBQQQOKH/CxrCqwb9P9oVkwGim7k3h8RYpa2tDzWXevN0nSwYEp+5Tl50KYHGUX2ke
 U6Vx5oO27btVq+HaK6Xzm/OUP0vK1Ke7qZkYWowxEdsbSlJAoWPcsx/3nGEywNpTWWzd91
 s2KWuAuMjzQ2qs9bfGvZtqmgN/X7fos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674829022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZiwNEqXmi9BMmxbKEurVmSr6ZVu3hsnB0ttl+6/ICA=;
 b=kmG488OVUQAxrLOyWPURCmSUw+tYzUfg9o/bs8+LCZHE7knvtnMlzZckXLkUHGZrC0PSdH
 liPUXgsSFgmdenDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00850138E3;
 Fri, 27 Jan 2023 14:17:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id otXBOt3c02P/PQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jan 2023 14:17:01 +0000
Message-ID: <c40df153-df30-436e-5bc6-5d039a351ffa@suse.de>
Date: Fri, 27 Jan 2023 15:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 02/10] drm/client: Add hotplug_failed flag
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-3-tzimmermann@suse.de> <Y9GXxcwSnuftoUQh@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y9GXxcwSnuftoUQh@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1TeDdi0mNx7U5w7App0566C4"
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1TeDdi0mNx7U5w7App0566C4
Content-Type: multipart/mixed; boundary="------------FL6pTeY6jOJvldwPKbDHDEf0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <c40df153-df30-436e-5bc6-5d039a351ffa@suse.de>
Subject: Re: [PATCH v3 02/10] drm/client: Add hotplug_failed flag
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-3-tzimmermann@suse.de> <Y9GXxcwSnuftoUQh@ravnborg.org>
In-Reply-To: <Y9GXxcwSnuftoUQh@ravnborg.org>

--------------FL6pTeY6jOJvldwPKbDHDEf0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDEuMjMgdW0gMjE6NTcgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFdlZCwgSmFuIDI1LCAyMDIzIGF0IDA5OjA0OjA3UE0gKzAx
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gU2lnbmFsIGZhaWxlZCBob3RwbHVn
Z2luZyB3aXRoIGEgZmxhZyBpbiBzdHJ1Y3QgZHJtX2NsaWVudF9kZXYuIElmIHNldCwNCj4+
IHRoZSBjbGllbnQgaGVscGVycyB3aWxsIG5vdCBmdXJ0aGVyIHRyeSB0byBzZXQgdXAgdGhl
IGZiZGV2IGRpc3BsYXkuDQo+Pg0KPj4gVGhpcyB1c2VkIHRvIGJlIHNpZ25hbGxlZCB3aXRo
IGEgY29tYmluYXRpb24gb2YgY2xlYXJlZCBwb2ludGVycyBpbg0KPj4gc3RydWN0IGRybV9m
Yl9oZWxwZXIsDQo+IEkgZmFpbGVkIHRvIGZpbmQgd2hlcmUgd2UgY2xlYXIgdGhlIHBvaW50
ZXJzLiBXaGF0IGRvIEkgbWlzcz8NCg0KVGhvc2UgcG9pbnRlciBmaWVsZHMsIGRldiBhbmQg
ZnVuY3MsIHdoZXJlIGFsbG9jYXRlZCB3aXRoIGt6YWxsb2MoKS4gVGhlIA0KZXJyb3IgcGF0
aCBpbiBkcm1fZmJkZXZfY2xpZW50X2hvdHBsdWcoKSBsYXRlciByZXNldCB0aGVtIHRvIE5V
TEwgYWdhaW4gDQppZiBhbiBlcnJvciBvY2N1cmVkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IChJIGhhZCBhc3N1bWVkIHdlIHdvdWxkIHN0b3AgY2xlYXJpbmcgdGhlIHBvaW50
ZXJzIGFmdGVyIHRoaXMgY2hhbmdlKS4NCj4gDQo+IAlTYW0NCj4gDQo+IHdoaWNoIHByZXZl
bnRzIHVzIGZyb20gaW5pdGlhbGl6aW5nIHRoZXNlIHBvaW50ZXJzDQo+PiBlYXJseSBhZnRl
ciBhbGxvY2F0aW9uLg0KPj4NCj4+IFRoZSBjaGFuZ2UgYWxzbyBoYXJtb25pemVzIGJlaGF2
aW9yIGFtb25nIERSTSBjbGllbnRzLiBBZGRpdGlvbmFsIERSTQ0KPj4gY2xpZW50cyB3aWxs
IG5vdyBoYW5kbGUgZmFpbGVkIGhvdHBsdWdnaW5nIGxpa2UgZmJkZXYgZG9lcy4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5j
ICAgICAgICB8IDUgKysrKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5l
cmljLmMgfCA0IC0tLS0NCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oICAgICAgICAg
ICAgfCA4ICsrKysrKysrDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMNCj4+IGluZGV4
IDA5YWMxOTFjMjAyZC4uMDA5ZTdiMTA0NTVjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jbGllbnQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnQuYw0KPj4gQEAgLTIwOCw4ICsyMDgsMTMgQEAgdm9pZCBkcm1fY2xpZW50X2Rldl9ob3Rw
bHVnKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIAkJaWYgKCFjbGllbnQtPmZ1bmNz
IHx8ICFjbGllbnQtPmZ1bmNzLT5ob3RwbHVnKQ0KPj4gICAJCQljb250aW51ZTsNCj4+ICAg
DQo+PiArCQlpZiAoY2xpZW50LT5ob3RwbHVnX2ZhaWxlZCkNCj4+ICsJCQljb250aW51ZTsN
Cj4+ICsNCj4+ICAgCQlyZXQgPSBjbGllbnQtPmZ1bmNzLT5ob3RwbHVnKGNsaWVudCk7DQo+
PiAgIAkJZHJtX2RiZ19rbXMoZGV2LCAiJXM6IHJldD0lZFxuIiwgY2xpZW50LT5uYW1lLCBy
ZXQpOw0KPj4gKwkJaWYgKHJldCkNCj4+ICsJCQljbGllbnQtPmhvdHBsdWdfZmFpbGVkID0g
dHJ1ZTsNCj4+ICAgCX0NCj4+ICAgCW11dGV4X3VubG9jaygmZGV2LT5jbGllbnRsaXN0X211
dGV4KTsNCj4+ICAgfQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJk
ZXZfZ2VuZXJpYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+
IGluZGV4IDNkNDU1YTJlM2ZiNS4uMTM1ZDU4YjgwMDdiIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+PiBAQCAtMzgyLDEwICszODIsNiBAQCBzdGF0
aWMgaW50IGRybV9mYmRldl9jbGllbnRfaG90cGx1ZyhzdHJ1Y3QgZHJtX2NsaWVudF9kZXYg
KmNsaWVudCkNCj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjbGllbnQtPmRldjsN
Cj4+ICAgCWludCByZXQ7DQo+PiAgIA0KPj4gLQkvKiBTZXR1cCBpcyBub3QgcmV0cmllZCBp
ZiBpdCBoYXMgZmFpbGVkICovDQo+PiAtCWlmICghZmJfaGVscGVyLT5kZXYgJiYgZmJfaGVs
cGVyLT5mdW5jcykNCj4+IC0JCXJldHVybiAwOw0KPj4gLQ0KPj4gICAJaWYgKGRldi0+ZmJf
aGVscGVyKQ0KPj4gICAJCXJldHVybiBkcm1fZmJfaGVscGVyX2hvdHBsdWdfZXZlbnQoZGV2
LT5mYl9oZWxwZXIpOw0KPj4gICANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Y2xpZW50LmggYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgNCj4+IGluZGV4IDRmYzgwMThl
ZGRkYS4uMzk0ODI1MjdhNzc1IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Ns
aWVudC5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgNCj4+IEBAIC0xMDYs
NiArMTA2LDE0IEBAIHN0cnVjdCBkcm1fY2xpZW50X2RldiB7DQo+PiAgIAkgKiBAbW9kZXNl
dHM6IENSVEMgY29uZmlndXJhdGlvbnMNCj4+ICAgCSAqLw0KPj4gICAJc3RydWN0IGRybV9t
b2RlX3NldCAqbW9kZXNldHM7DQo+PiArDQo+PiArCS8qKg0KPj4gKwkgKiBAaG90cGx1ZyBm
YWlsZWQ6DQo+PiArCSAqDQo+PiArCSAqIFNldCBieSBjbGllbnQgaG90cGx1ZyBoZWxwZXJz
IGlmIHRoZSBob3RwbHVnZ2luZyBmYWlsZWQNCj4+ICsJICogYmVmb3JlLiBJdCBpcyB1c3Vh
bGx5IG5vdCB0cmllZCBhZ2Fpbi4NCj4+ICsJICovDQo+PiArCWJvb2wgaG90cGx1Z19mYWls
ZWQ7DQo+PiAgIH07DQo+PiAgIA0KPj4gICBpbnQgZHJtX2NsaWVudF9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LA0KPj4gLS0g
DQo+PiAyLjM5LjANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------FL6pTeY6jOJvldwPKbDHDEf0--

--------------1TeDdi0mNx7U5w7App0566C4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPT3N0FAwAAAAAACgkQlh/E3EQov+AC
ug/9H8vDZw2mMk+LZSbgDBGq5QOE8EdwgRx3KPGGgKpmAnnEs+tcawMso6lNpTTJBG7ncch8nM5r
OfXomWJzn4Ac8+T4b8mfFIkOolaEGa94eZvRowBGjoS1b3O1Kt5Yyc6V40fxj6577oYnaCEPGAuU
0K2pQUWrciUanR744/fm7lzQnN97k5qVAywRzff0KflXPge7h0zkvtHTMtQavrztqZnXMBEHXUsJ
QgNmP9mtoKuafaBZ0Uj1v3uYPzPiAmHnGCw2kQXOrStKO8fkDCVgnTgo4z9nYkj3W+q2beCOMRHR
ym+oEElKC7Oo5l2qeEFhoqwxY1eoBqdZgpIYEi9Nb/9BcyxF7iYggPKbO2thagmQZ8tpcXxsPOI4
qSt2sJm0Uu93VK9wleA8XPLdkiHttFxjX3kNEONl7bKoeLtJ7CbmM9QITh5gXoR+kyrvbU6hl22r
/sxJ7bxH2UI0Xo1XzT1PEDq1Sh8aGGL3XcAiqXNt8XZiQc54JU++wD1QWkfI4ldFUhjGqesG6s7p
d1jez1d/AU0em3eE95wgEKyEA1kQLk9uOjNdmGvLeLAY3yPa8oHmAZVtz3Y8nW+58pRt5cH6KASI
AGAbjHPJXqNFy//YEYpeWVkHgcuRUjdFQx48+U9jbcmdgweqk6Dq2cVlpc759YhP6H/GGpL/Ivzk
hb8=
=QGfv
-----END PGP SIGNATURE-----

--------------1TeDdi0mNx7U5w7App0566C4--
