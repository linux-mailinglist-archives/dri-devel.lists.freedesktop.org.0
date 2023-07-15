Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181BA754ABF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 20:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B0210E009;
	Sat, 15 Jul 2023 18:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBBD10E009
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 18:34:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CA3321A71;
 Sat, 15 Jul 2023 18:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689446049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RYeCd7HoR8uEw1k7ZVr0OZS9nvGsn4cIaqKR0z4Onsc=;
 b=fQJ8Ed37zO2h2xpVGJHgeXgbFlMYWZiQyR2E1Vj6U9o3crxeMk6Dolw/GHlDs3gCiDCgEg
 XjM6dYEHOsZpNig4WvurwGD2dKKAXItEsx1ugA2u1eeSyvSjJgOSdhbKIZ2/Z56MXGxR1q
 r2BHnxcno8Eubp53rXNArviIQXb9i5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689446049;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RYeCd7HoR8uEw1k7ZVr0OZS9nvGsn4cIaqKR0z4Onsc=;
 b=yP408vg2SsLg1wW8YSLEtC9aqf9lJsv3y5D2L3sOOFaAgOiRrUy+nW21jIkbG7JG9RUM9X
 Yua0AAwib+ee/1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3F5D133F7;
 Sat, 15 Jul 2023 18:34:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HExLNqDmsmQlfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:34:08 +0000
Message-ID: <317a9fd8-0ae9-daa0-012b-3908ca248b74@suse.de>
Date: Sat, 15 Jul 2023 20:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] fb: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>, Helge Deller <deller@gmx.de>,
 Michal Simek <michal.simek@amd.com>
References: <20230714175035.4065508-1-robh@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230714175035.4065508-1-robh@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fKlGCpVLu7rfpmAw9xHrErQE"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fKlGCpVLu7rfpmAw9xHrErQE
Content-Type: multipart/mixed; boundary="------------Aa0Mf3WyZj0EdxJytzy7LFbU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>, Helge Deller <deller@gmx.de>,
 Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <317a9fd8-0ae9-daa0-012b-3908ca248b74@suse.de>
Subject: Re: [PATCH] fb: Explicitly include correct DT includes
References: <20230714175035.4065508-1-robh@kernel.org>
In-Reply-To: <20230714175035.4065508-1-robh@kernel.org>

--------------Aa0Mf3WyZj0EdxJytzy7LFbU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDcuMjMgdW0gMTk6NTAgc2NocmllYiBSb2IgSGVycmluZzoNCj4gVGhl
IERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRhdGUgYmFjayB0byB0aGUgc2Vw
YXJhdGUNCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFzIG1lcmdlZCBpbnRv
IHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4NCj4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHBy
ZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQ0KPiAidGVtcG9yYXJp
bHkiIGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1ZGUgcGxhdGZvcm1fZGV2
aWNlLmgNCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2gg
cmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlDQo+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0
aGUgdHJlZS4gSW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQNCj4gcmVw
bGFjZSB0aGUgaW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVjbGFyYXRpb25zLCB1
c2VycyBuZWVkIHRvDQo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRl
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
DQpbLi4uXQ0KPiAgIA0KPiBAQCAtNDgsNyArNDgsNyBAQCBpbnQgc2J1c2ZiX21tYXBfaGVs
cGVyKHN0cnVjdCBzYnVzX21tYXBfbWFwICptYXAsDQo+ICAgCXVuc2lnbmVkIGxvbmcgbWFw
X29mZnNldCA9IDA7DQo+ICAgCXVuc2lnbmVkIGxvbmcgb2ZmOw0KPiAgIAlpbnQgaTsNCj4g
LQ0KPiArDQoNClRoZSB2YXJpb3VzIHdoaXRlc3BhY2UgZml4ZXMgc2hvdWxkIHJhdGhlciBn
byBpbnRvIGEgc2VwYXJhdGUgcGF0Y2guIFlvdSANCmNhbiBhZGQNCg0KUmV2aWV3ZWQtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQp0byB0aGUgd2hp
dGVzcGFjZSBmaXggYW5kIHRoZSBpbmNsdWRlIGNsZWFudXAuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gICAJaWYgKCEodm1hLT52bV9mbGFncyAmIChWTV9TSEFSRUQgfCBWTV9N
QVlTSEFSRSkpKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgDQo+IEBAIC03Miw3ICs3
Miw3IEBAIGludCBzYnVzZmJfbW1hcF9oZWxwZXIoc3RydWN0IHNidXNfbW1hcF9tYXAgKm1h
cCwNCj4gICAjZGVmaW5lIFBPRkZfTUFTSwkoUEFHRV9NQVNLfDB4MVVMKQ0KPiAgICNlbHNl
DQo+ICAgI2RlZmluZSBQT0ZGX01BU0sJKFBBR0VfTUFTSykNCj4gLSNlbmRpZgkJCQkNCj4g
KyNlbmRpZg0KPiAgIAkJCQltYXBfb2Zmc2V0ID0gKHBoeXNiYXNlICsgbWFwW2ldLnBvZmYp
ICYgUE9GRl9NQVNLOw0KPiAgIAkJCQlicmVhazsNCj4gICAJCQl9DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnh2cjEwMDAuYyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvc3VueHZyMTAwMC5jDQo+IGluZGV4IDQ5MGJkOWExNDc2My4uMTdkNjFlMWQxMWE2IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnh2cjEwMDAuYw0KPiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnh2cjEwMDAuYw0KPiBAQCAtOCw3ICs4LDggQEAN
Cj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Zi
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gLSNpbmNsdWRlIDxsaW51eC9v
Zl9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgIA0KPiAgIHN0cnVjdCBnZmJfaW5mbyB7DQo+
ICAgCXN0cnVjdCBmYl9pbmZvCQkqaW5mbzsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvc3VueHZyMjUwMC5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zdW54dnIyNTAw
LmMNCj4gaW5kZXggMmNhYjRiOWJlNjhhLi5lNjRlYzdkMGNhZjkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvc3VueHZyMjUwMC5jDQo+ICsrKyBiL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvc3VueHZyMjUwMC5jDQo+IEBAIC0xMCw3ICsxMCw3IEBADQo+ICAgI2luY2x1
ZGUgPGxpbnV4L2ZiLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9pbml0Lmg+DQo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+
ICsjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gICANCj4gICAjaW5jbHVkZSA8YXNtL2lvLmg+
DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnh2cjUwMC5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9zdW54dnI1MDAuYw0KPiBpbmRleCA2ZWMzNThhZjEy
NTYuLmM0ZTAxZTg3MTQ4MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9z
dW54dnI1MDAuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnh2cjUwMC5jDQo+
IEBAIC0xMCw3ICsxMCw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2ZiLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+IC0j
aW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4N
Cj4gICANCj4gICAjaW5jbHVkZSA8YXNtL2lvLmg+DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3RjeC5jIGIvZHJpdmVycy92aWRlby9mYmRldi90Y3guYw0K
PiBpbmRleCBmYzNhYzIzMDFiNDUuLjI1NWViNTdhZWZhMiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy92aWRlby9mYmRldi90Y3guYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Rj
eC5jDQo+IEBAIC0xNyw3ICsxNyw4IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvZmIuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbW0uaD4N
Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9v
Zi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgIA0KPiAg
ICNpbmNsdWRlIDxhc20vaW8uaD4NCj4gICAjaW5jbHVkZSA8YXNtL2ZiaW8uaD4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYveGlsaW54ZmIuYyBiL2RyaXZlcnMvdmlk
ZW8vZmJkZXYveGlsaW54ZmIuYw0KPiBpbmRleCAyYWEzYTUyODI3N2YuLjU0MmJhZGRkNTRh
ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi94aWxpbnhmYi5jDQo+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYveGlsaW54ZmIuYw0KPiBAQCAtMjQsMTQgKzI0LDEz
IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc3RyaW5n
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21tLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Zi
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgv
ZG1hLW1hcHBpbmcuaD4NCj4gLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gLSNp
bmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2Fk
ZHJlc3MuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC9pby5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICAgDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------Aa0Mf3WyZj0EdxJytzy7LFbU--

--------------fKlGCpVLu7rfpmAw9xHrErQE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSy5qAFAwAAAAAACgkQlh/E3EQov+DV
hg//Xw0qaGOqIuiMoHIxPoO8/jbT0356p1A2GRp52n9+r+rHkHF4HBkb7K4W9jjF+5tjpd7chkiB
8qEqheekrCWZ6Vg8ZqIDmJPes4pHsd56bExm6Jk8yTa7rShbN9Jdogm44a3TVOXcOVM+gHl0h3Jh
GbksvdQX1g+l4EzK4UlFOBJit/oLHofORyKyki0I4a0kVyPbYj6ynVvwVIlFQbocybEUVTLfTGz7
cHPzSdv7hsngyXhdqjzGNX4EMEwktcP42IXHv4Jrcxu2e4rILtJvmXvK5ku5t/FX6yMpxSU3oaaP
t13+3PS/JVSt/S3X+kyQwazL2Jx4BBrWNRNlL1Dbm80OzdntELHprVOCvB+ZTq6Yz5OUfJbdh+00
3SU6nfvCKNtOmEhaYyGE5XSlQPcjs43SABM5lqIZbdozKVB0EUPsRkOfa05ZrAykwha36qgUjDqf
z4u9moi7/bPNo7REdwXW0ogALg+q3FFq3HfW2umUmh3Pu+YdMVBr7FF0yzzdyBN4IRrv0QljXhgl
XjJgXl7r9Ize6S5GzfCVM7QUuR/LTL6vcP/wUy/Awemx6odLnVvxnKQipgrP6/dATviNyXPB5IrK
5E32NfllUy4qk3XvVBbRV8Yr7OsXq0tn6jSQFvwDbU8QpeyPt+ERYjqMD1S+hDHoars/jf8eFkUb
qtw=
=Utls
-----END PGP SIGNATURE-----

--------------fKlGCpVLu7rfpmAw9xHrErQE--
