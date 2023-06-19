Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAD735966
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C114710E20C;
	Mon, 19 Jun 2023 14:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A91C10E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:22:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E46C2189A;
 Mon, 19 Jun 2023 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687184547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywjVukmToU8k6hdCdSSEnWj9wcqGQTjDhK/qRMDRYos=;
 b=Ql+MwzwIQNf/VBcGuKV3L3rRd/qQBmSBH2D57o/k3hSkP/8UxE/dfnIGU373Oc7J7iQGEC
 hGhlKQz8n3jKmpjeKtw9jc//GbF5l3hKoCqRVXcNJ1MtkXrkgGXZ2pGZ3lACN8v/50/c18
 tcEhvXOHtcbqRvUU4kLcCV6GdIV7f6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687184547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywjVukmToU8k6hdCdSSEnWj9wcqGQTjDhK/qRMDRYos=;
 b=fuXJtLQR5Czn4lK2ttgweKxBT7d09EJ8h3rlcWfUn4tkmHo1vbZOnIjvyhM0zsH/iqBoS7
 sX1iT0zmCCsFtpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7915138E8;
 Mon, 19 Jun 2023 14:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id caG0M6JkkGTRIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 14:22:26 +0000
Message-ID: <f7ded369-e384-db01-dc8c-6a5183f20409@suse.de>
Date: Mon, 19 Jun 2023 16:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/9] drm/verisilicon: Add gem driver for JH7110 SoC
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-5-keith.zhao@starfivetech.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230602074043.33872-5-keith.zhao@starfivetech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AQmo0XbTycWWIDd2erzQxco5"
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
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jagan Teki <jagan@edgeble.ai>, Jack Zhu <jack.zhu@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AQmo0XbTycWWIDd2erzQxco5
Content-Type: multipart/mixed; boundary="------------nV5DH2JaYJn29RZXOOhf0f8I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Message-ID: <f7ded369-e384-db01-dc8c-6a5183f20409@suse.de>
Subject: Re: [PATCH 4/9] drm/verisilicon: Add gem driver for JH7110 SoC
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-5-keith.zhao@starfivetech.com>
In-Reply-To: <20230602074043.33872-5-keith.zhao@starfivetech.com>

--------------nV5DH2JaYJn29RZXOOhf0f8I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDYuMjMgdW0gMDk6NDAgc2NocmllYiBLZWl0aCBaaGFvOg0KPiBUaGlz
IHBhdGNoIGltcGxlbWVudHMgZ2VtIHJlbGF0ZWQgQVBJcyBmb3IgSkg3MTAwIFNvQy4NCg0K
cGxlYXNlIGFsc28gc2VlIG15IG90aGVyIHJlcGx5IHRvIHRoaXMgcGF0Y2guIE15IG1haWwg
Y2xpZW50IGhhZCBhIGJ1ZyANCmJlZm9yZSBJIGNvdWxkIGZpbmlzaCBpdC4gQmVsb3cgYXJl
IHNvbWUgbW9yZSBjb21tZW50cy4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2VpdGggWmhh
byA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPg0KPiAtLS0NClsuLi5dDQo+ICsjaWZu
ZGVmIF9fVlNfR0VNX0hfXw0KPiArI2RlZmluZSBfX1ZTX0dFTV9IX18NCj4gKw0KPiArI2lu
Y2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4NCj4gKw0KPiArI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
Lmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5oPg0KPiArDQo+ICsjaW5jbHVkZSAi
dnNfZHJ2LmgiDQo+ICsvKg0KPiArICoNCj4gKyAqIEBiYXNlOiBkcm0gZ2VtIG9iamVjdC4N
Cj4gKyAqIEBzaXplOiBzaXplIHJlcXVlc3RlZCBmcm9tIHVzZXINCj4gKyAqIEBjb29raWU6
IGNvb2tpZSByZXR1cm5lZCBieSBkbWFfYWxsb2NfYXR0cnMNCj4gKyAqCS0gbm90IGtlcm5l
bCB2aXJ0dWFsIGFkZHJlc3Mgd2l0aCBETUFfQVRUUl9OT19LRVJORUxfTUFQUElORw0KPiAr
ICogQGRtYV9hZGRyOiBidXMgYWRkcmVzcyhhY2Nlc3NlZCBieSBkbWEpIHRvIGFsbG9jYXRl
ZCBtZW1vcnkgcmVnaW9uLg0KPiArICoJLSB0aGlzIGFkZHJlc3MgY291bGQgYmUgcGh5c2lj
YWwgYWRkcmVzcyB3aXRob3V0IElPTU1VIGFuZA0KPiArICoJZGV2aWNlIGFkZHJlc3Mgd2l0
aCBJT01NVS4NCj4gKyAqIEBkbWFfYXR0cnM6IGF0dHJpYnV0ZSBmb3IgRE1BIEFQSQ0KPiAr
ICogQGdldF9wYWdlczogZmxhZyBmb3IgbWFudWFsbHkgYXBwbHlpbmcgZm9yIG5vbi1jb250
aWd1b3VzIG1lbW9yeS4NCj4gKyAqIEBwYWdlczogQXJyYXkgb2YgYmFja2luZyBwYWdlcy4N
Cj4gKyAqIEBzZ3Q6IEltcG9ydGVkIHNnX3RhYmxlLg0KPiArICoNCj4gKyAqLw0KPiArc3Ry
dWN0IHZzX2dlbV9vYmplY3Qgew0KPiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdAliYXNlOw0K
PiArCXNpemVfdAkJCXNpemU7DQo+ICsJdm9pZAkJCSpjb29raWU7DQo+ICsJZG1hX2FkZHJf
dAkJZG1hX2FkZHI7DQo+ICsJdTMyCQkJCWlvdmE7DQo+ICsJdW5zaWduZWQgbG9uZwlkbWFf
YXR0cnM7DQo+ICsJYm9vbAkJCWdldF9wYWdlczsNCj4gKwlzdHJ1Y3QgcGFnZQkJKipwYWdl
czsNCj4gKwlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBp
bmxpbmUNCj4gK3N0cnVjdCB2c19nZW1fb2JqZWN0ICp0b192c19nZW1fb2JqZWN0KHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqKQ0KPiArew0KPiArCXJldHVybiBjb250YWluZXJfb2Yo
b2JqLCBzdHJ1Y3QgdnNfZ2VtX29iamVjdCwgYmFzZSk7DQo+ICt9DQo+ICsNCj4gK3N0cnVj
dCB2c19nZW1fb2JqZWN0ICp2c19nZW1fY3JlYXRlX29iamVjdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LA0KPiArCQkJCQkgICBzaXplX3Qgc2l6ZSk7DQo+ICsNCj4gK2ludCB2c19nZW1f
cHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGlvc3lzX21h
cCAqbWFwKTsNCj4gK3ZvaWQgdnNfZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwgc3RydWN0IGlvc3lzX21hcCAqbWFwKTsNCg0KSSdkIGNvbnNpZGVyIHRo
aXMgYmFkIHN0eWxlLiBZb3VyIGZ1bmN0aW9ucyBhcmUgaW4gdGhlIHZzXyBuYW1lc3BhY2Us
IHNvIA0KdGhleSBzaG91bGQgdGFrZSBhIHZzX2dlbV9vYmplY3QgYXMgZmlyc3QgYXJndW1l
bnQuIFJhdGhlciBpbXBsZW1lbnQgDQp2c19nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgdnNfZ2Vt
X29iamVjdCAqdnNfb2JqLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXApDQphbmQgX3Z1bm1hcCgp
IGFuZCBfbW1hcCgpLg0KDQpGb3IgdGhlIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2dlbW9i
amVjdF9mdW5jcywgeW91IGNhbiB3cml0ZSBzbWFsbCANCndyYXBwZXJzIGFyb3VuZCB0aGUg
aGVscGVycyB0byBkbyB0aGUgdHlwZSBjYXN0aW5nLiBTZWUgDQpkcm1fZ2VtX3NobWVtX29i
amVjdF9tbWFwKCkgYW5kIGRybV9nZW1fc2htZW1fbW1hcCgpIGZvciBhbiBleGFtcGxlLg0K
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2luY2x1
ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgjTDIzMw0KDQoNCg0KPiArDQo+ICtpbnQg
dnNfZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosDQo+ICsJCSAg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsNCj4gKw0KPiAraW50IHZzX2dlbV9k
dW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4gKwkJICAgICAgIHN0
cnVjdCBkcm1fZGV2aWNlICpkcm0sDQo+ICsJCSAgICAgICBzdHJ1Y3QgZHJtX21vZGVfY3Jl
YXRlX2R1bWIgKmFyZ3MpOw0KPiArDQo+ICtpbnQgdnNfZ2VtX21tYXAoc3RydWN0IGZpbGUg
KmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsNCj4gKw0KPiArc3RydWN0IHNn
X3RhYmxlICp2c19nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqKTsNCj4gKw0KPiArc3RydWN0IGRybV9nZW1fb2JqZWN0ICp2c19nZW1fcHJpbWVf
aW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkJCSAgIHN0cnVjdCBkbWFf
YnVmICpkbWFfYnVmKTsNCj4gK3N0cnVjdCBkcm1fZ2VtX29iamVjdCAqDQo+ICt2c19nZW1f
cHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkg
ICAgIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4gKwkJCSAgICAgc3Ry
dWN0IHNnX3RhYmxlICpzZ3QpOw0KPiArDQo+ICsjZW5kaWYgLyogX19WU19HRU1fSF9fICov
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2Ug
MTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBN
eWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0K

--------------nV5DH2JaYJn29RZXOOhf0f8I--

--------------AQmo0XbTycWWIDd2erzQxco5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQZKIFAwAAAAAACgkQlh/E3EQov+Dh
sg/9FK6lyEoYAw1QEf7gjCF9MaR0OxJb/gGkeJsLnmfPwbjmHytGMUlUQEOkKo9BUdQHBx8wH7Sl
6FCw7hCTHTSHVXb/I7IE/TsSbPijqFOeMdQAvUMdy1g/EV/K3U3DE3YtqX4/IYCYna+wPduHzxOJ
r5VSgWZfZVskQxqAUPaTLbWlt9JoXlGB+KfoMFX02kJA5yu0Gag1q60C88eyvUGehuhSkTe4aEfq
CewqJ6+qGUGCStV81G9WJM0swEoFH+yThuNylfOR3KDcibC1zsUoQ1EJgZv4Zu9CjDgNOv1dNBeM
yqcRO9VZnTunJ2QK8v8c1po0XyZnDgx/JbqGvKFcbpOng30ODvk9qDnVw/oY+I3tCwT07pgDTlOc
FpyyBH56sdhwiLQ4kQMF/K6CEomDvudttRBURlZ758SbmQcLgEq8wLqnaMfYdKIl+YWiIl9sFb5o
y5Zu8OT7RMdockxADbi44cWyZ9u0A2k/AqQBItNwSf+j0KPVzQd6FSCejMSynDFRp55ggLXu5XdF
QlFAzCDD6eUw0zbOa93PQir5cFH4RpXMDcNDSNFRc9cmJP8mXLklM+oCmIeLq8B8qJFet+FDLm4C
YgGLzd/sjr59jNjS2BQ0fVeJGFID5bJY6FPyho9xUirldXVdJJhHf4NB6hLNo4dGy8W/r4H5s1MS
qZM=
=yGOr
-----END PGP SIGNATURE-----

--------------AQmo0XbTycWWIDd2erzQxco5--
