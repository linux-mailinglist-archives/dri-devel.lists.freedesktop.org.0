Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A862DD05
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 14:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751F10E5F5;
	Thu, 17 Nov 2022 13:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8AF10E5F5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:42:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 919F2218CE;
 Thu, 17 Nov 2022 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668692557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rv7KIu+zKpnF/dI4dgBfOe6okZ4ai9mwlqyxMzSKe5E=;
 b=YEtjOkcfAC7ikJYWXPgrtTv7RSpioOqDpeNKgkv5PRde0WLTpfQ385HqtpsUpr9aerHrGb
 JfOeSS8Qwc4Nop+FqVksXGOZdSt8wuYpLMYouPO5NInf6/iDm3TtARjJVm+FppklB1f1nW
 b35LP5Ws3ByV9bPOlffxS96fDQdMnSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668692557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rv7KIu+zKpnF/dI4dgBfOe6okZ4ai9mwlqyxMzSKe5E=;
 b=LbAxeefDmhdmIng2KqbjOvs6ew2xrpdLACYeIgFh4XlvS1XfveUaAfrqSNWORt0AN7uYZ4
 5ksUuwBRiun4q2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5303B13A12;
 Thu, 17 Nov 2022 13:42:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1tMsE006dmMmdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Nov 2022 13:42:37 +0000
Message-ID: <2b4e38d8-d0ea-e85c-88f1-bb6a714ee0eb@suse.de>
Date: Thu, 17 Nov 2022 14:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
Content-Language: en-US
To: ChunyouTang <tangchunyou@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com
References: <20221111033817.366-1-tangchunyou@163.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221111033817.366-1-tangchunyou@163.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YymBv3bYm0qkK0gbQfw5E2wE"
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YymBv3bYm0qkK0gbQfw5E2wE
Content-Type: multipart/mixed; boundary="------------i1OebnKEfkH1cksuJ70L0WZn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ChunyouTang <tangchunyou@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <2b4e38d8-d0ea-e85c-88f1-bb6a714ee0eb@suse.de>
Subject: Re: [PATCH v2] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
References: <20221111033817.366-1-tangchunyou@163.com>
In-Reply-To: <20221111033817.366-1-tangchunyou@163.com>

--------------i1OebnKEfkH1cksuJ70L0WZn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTEuMjIgdW0gMDQ6Mzggc2NocmllYiBDaHVueW91VGFuZzoNCj4gd2hl
biBnb3RvIGVycl9mcmVlLCB0aGUgb2JqZWN0IGhhZCBpbml0LCBzbyBpdCBzaG91bGQgYmUg
cmVsZWFzZSB3aGVuIGZhaWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHVueW91VGFuZyA8
dGFuZ2NodW55b3VAMTYzLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYyAgICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysrKysrLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAgNCArKystDQo+ICAgaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jDQo+IGluZGV4IDhiNjhhM2MxZTZhYi4uY2JhMzJjNDZiYjA1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMNCj4gQEAgLTE2OSw2ICsxNjksMjEgQEAgdm9pZCBkcm1fZ2VtX3ByaXZh
dGVfb2JqZWN0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICB9DQo+ICAgRVhQ
T1JUX1NZTUJPTChkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQpOw0KPiAgIA0KPiArLyoq
DQo+ICsgKiBkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2ZpbmkgLSBGaW5hbGl6ZSBhIGZhaWxl
ZCBkcm1fZ2VtX29iamVjdA0KPiArICogQG9iajogZHJtX2dlbV9vYmplY3QNCj4gKyAqDQo+
ICsgKiBVbmluaXRpYWxpemUgYW4gYWxyZWFkeSBhbGxvY2F0ZWQgR0VNIG9iamVjdCB3aGVu
IGl0IGluaXRpYWxpemVkIGZhaWxlZA0KPiArICovDQo+ICt2b2lkIGRybV9nZW1fcHJpdmF0
ZV9vYmplY3RfZmluaShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4gK3sNCj4gKwlX
QVJOX09OKG9iai0+ZG1hX2J1Zik7DQoNClJhdGhlciBsZWFzZSB0aGlzIGluIGl0cyBvcmln
aW5hbCBwbGFjZS4NCg0KPiArDQo+ICsJZG1hX3Jlc3ZfZmluaSgmb2JqLT5fcmVzdik7DQo+
ICsJZHJtX2dlbV9scnVfcmVtb3ZlKG9iaik7DQoNCkFGQUlDVCBkcm1fZ2VtX2xydV9yZW1v
dmUoKSBkb2Vzbid0IGJlbG9uZyBpbnRvIHRoaXMgZnVuY3Rpb24uDQoNCj4gK30NCj4gK0VY
UE9SVF9TWU1CT0woZHJtX2dlbV9wcml2YXRlX29iamVjdF9maW5pKTsNCj4gKw0KPiAgIC8q
Kg0KPiAgICAqIGRybV9nZW1fb2JqZWN0X2hhbmRsZV9mcmVlIC0gcmVsZWFzZSByZXNvdXJj
ZXMgYm91bmQgdG8gdXNlcnNwYWNlIGhhbmRsZXMNCj4gICAgKiBAb2JqOiBHRU0gb2JqZWN0
IHRvIGNsZWFuIHVwLg0KPiBAQCAtOTMwLDE0ICs5NDUsMTIgQEAgZHJtX2dlbV9yZWxlYXNl
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2YXRl
KQ0KPiAgIHZvaWQNCj4gICBkcm1fZ2VtX29iamVjdF9yZWxlYXNlKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKQ0KPiAgIHsNCj4gLQlXQVJOX09OKG9iai0+ZG1hX2J1Zik7DQo+ICsJ
ZHJtX2dlbV9wcml2YXRlX29iamVjdF9maW5pKG9iaik7DQo+ICAgDQo+ICAgCWlmIChvYmot
PmZpbHApDQo+ICAgCQlmcHV0KG9iai0+ZmlscCk7DQo+ICAgDQo+IC0JZG1hX3Jlc3ZfZmlu
aSgmb2JqLT5fcmVzdik7DQoNClBsZWFzZSBjYWxsIGRybV9nZW1fcHJpdmF0ZV9vYmplY3Rf
ZmluaSgpIGhlcmUuDQoNCj4gICAJZHJtX2dlbV9mcmVlX21tYXBfb2Zmc2V0KG9iaik7DQo+
IC0JZHJtX2dlbV9scnVfcmVtb3ZlKG9iaik7DQoNClBsZWFzZSBrZWVwIHRoaXMgbGluZSBo
ZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1C
T0woZHJtX2dlbV9vYmplY3RfcmVsZWFzZSk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+IGluZGV4IDM1MTM4ZjhhMzc1Yy4uODQ1ZTNkNWQ3
MWViIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0K
PiBAQCAtNzksOCArNzksMTAgQEAgX19kcm1fZ2VtX3NobWVtX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgYm9vbCBwcml2YXRlKQ0KPiAgIAl9IGVsc2Ug
ew0KPiAgIAkJcmV0ID0gZHJtX2dlbV9vYmplY3RfaW5pdChkZXYsIG9iaiwgc2l6ZSk7DQo+
ICAgCX0NCj4gLQlpZiAocmV0KQ0KPiArCWlmIChyZXQpIHsNCj4gKwkJZHJtX2dlbV9wcml2
YXRlX29iamVjdF9maW5pKG9iaikNCj4gICAJCWdvdG8gZXJyX2ZyZWU7DQo+ICsJfQ0KPiAg
IA0KPiAgIAlyZXQgPSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldChvYmopOw0KPiAgIAlp
ZiAocmV0KQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oDQo+IGluZGV4IGJkNDJmMjVlNDQ5Yy4uOWIxZmViMDMwNjlkIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgNCj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2dlbS5oDQo+IEBAIC00MDUsNiArNDA1LDcgQEAgaW50IGRybV9nZW1fb2JqZWN0
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJCQlzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwgc2l6ZV90IHNpemUpOw0KPiAgIHZvaWQgZHJtX2dlbV9wcml2YXRlX29i
amVjdF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCQkJCSBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwgc2l6ZV90IHNpemUpOw0KPiArdm9pZCBkcm1fZ2VtX3ByaXZh
dGVfb2JqZWN0X2Zpbmkoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiAgIHZvaWQg
ZHJtX2dlbV92bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsNCj4gICB2b2lk
IGRybV9nZW1fdm1fY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOw0KPiAgIGlu
dCBkcm1fZ2VtX21tYXBfb2JqKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB1bnNpZ25l
ZCBsb25nIG9ial9zaXplLA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------i1OebnKEfkH1cksuJ70L0WZn--

--------------YymBv3bYm0qkK0gbQfw5E2wE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN2OkwFAwAAAAAACgkQlh/E3EQov+Bz
2BAAmCiDIxrYLK4mniJvoGUcNGv0Nii+v7XTRavBTxixQHTSWU3OySdYUry9BuJ6OyK5ppA7/vgU
fScR6/a3paG5OBul2worzFrVZ3Yz6qHBkoVSUX1nPqQ6Wzg0KVZDRJ5KN0iIHV8fPJw4rMbkAifq
kx6d3S6VUfuDJGi/qLgDN5iW+mmSos+hpv5m71IJYtSYOa7pNE0Of4qRCoTQBOPPy3Vfl840nNI4
Cc4Bjopho3Fm4sNr7Yd5PKyU2XV6A3/Ux4DBcguQZzsUnFzXRZq4ezasNiNqWs5uOENGLYT5Nn+Z
+T+HnWf0VxstaQ+WpnkomOOOVpH8R9s6zIG4y1SZ//Bvbd5D70PNaMmJKVEZW/cB2H2T/Vlxqwxa
JMYeLpQnVmir5YoUW3lhD7mf8xBlDVtUq2hgBeA78Pkon/44vvE+tG18qVPWTp4IrYs/4P07YKhm
kRtb04+V38jn7QVWve9+IocqgqTydCmyyYkOMZ5DxtOMjHFtBakJGzYOKwchCfIOrP6xu/A0i2lY
lk+TXqc/QPfGPrwxbSQV4djg0MQeI1hMpffWJigS41yumw0rL3SAvuMDFpC91uDezMcxdht2jtjA
rht+y0gQnb+1uLJ7QQuhUpRGkI9T/gE/bTC5TlnmgCpr+0GzqIlZq4kvZUibf1uSL6Ck0CiJEOfq
AXY=
=+j9m
-----END PGP SIGNATURE-----

--------------YymBv3bYm0qkK0gbQfw5E2wE--
