Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA762F391
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 12:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04A10E0EF;
	Fri, 18 Nov 2022 11:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9C610E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 11:21:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBBAC1F8D7;
 Fri, 18 Nov 2022 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668770494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L3euMKBmPhMy8xs+0Iz9hve6/klsRgyszk94snpweik=;
 b=wYAotX1b18h44sn2hYO2syv7V4WJnWy4DjyZ6FSE11VpBhJ6yYSPC72B5hOMgiWUFUnLGn
 aA0AJagr8b1nfmGWgRxRGojh13kAfzPrNJDESaJimUQ6GrPQ02EqoScNQp7P1gG1t9FBL+
 7PLuEl+nznaW0NTHwL/IzQ9rpFTFanA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668770494;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L3euMKBmPhMy8xs+0Iz9hve6/klsRgyszk94snpweik=;
 b=+wzYH9HXa+M0Ptzkq7AV2wFHscud2W2D1O0r2WSm1IZk7OHfagWckSJPILwt5IzoGOnNWc
 XzQMc1kGGl3CkTAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CC8A13A66;
 Fri, 18 Nov 2022 11:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AFSGIb5qd2MpYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 11:21:34 +0000
Message-ID: <b4681075-ea53-637f-0df5-3cc5891a102e@suse.de>
Date: Fri, 18 Nov 2022 12:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
To: Chunyou Tang <tangchunyou@163.com>
References: <20221111033817.366-1-tangchunyou@163.com>
 <2b4e38d8-d0ea-e85c-88f1-bb6a714ee0eb@suse.de>
 <20221118183232.00007638@163.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221118183232.00007638@163.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XgM8ETXUekg0EOJsfaSYemnJ"
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
Cc: linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XgM8ETXUekg0EOJsfaSYemnJ
Content-Type: multipart/mixed; boundary="------------C0QJjKI0qwoGRcl2Yt0IOPHd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chunyou Tang <tangchunyou@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <b4681075-ea53-637f-0df5-3cc5891a102e@suse.de>
Subject: Re: [PATCH v2] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
References: <20221111033817.366-1-tangchunyou@163.com>
 <2b4e38d8-d0ea-e85c-88f1-bb6a714ee0eb@suse.de>
 <20221118183232.00007638@163.com>
In-Reply-To: <20221118183232.00007638@163.com>

--------------C0QJjKI0qwoGRcl2Yt0IOPHd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjIgdW0gMTE6MzIgc2NocmllYiBDaHVueW91IFRhbmc6DQo+IEhp
IFRob21hcywNCj4gICAgIENhbiBJIGRpc2NhcmQgdGhlIGZpcnN0IHR3byBwYXRjaHMsIGFu
ZCBwdWxsIHRoZSBuZXcgY29kZSwgdGhlbg0KPiAgICAgbW9kaWZ5IGFuZCBnaXQgc2VuZC1l
bWFpbCB0aGlzIHBhdGNoPw0KDQpZZXMsIG9mIGNvdXJzZS4gSnVzdCBtYWtlIHN1cmUgdGhh
dCB0aGUgbmV4dCB2ZXJzaW9uIGlzIG1hcmtlZCBhcyB2Mywgc28gDQppdCdzIG9idmlvdXMg
d2hhdCBpdCBiZWxvbmdzIHRvLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAN
Cj4g5LqOIFRodSwgMTcgTm92IDIwMjIgMTQ6NDI6MzYgKzAxMDANCj4gVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IOWGmemBkzoNCj4gDQo+PiBIaQ0KPj4NCj4+
IEFtIDExLjExLjIyIHVtIDA0OjM4IHNjaHJpZWIgQ2h1bnlvdVRhbmc6DQo+Pj4gd2hlbiBn
b3RvIGVycl9mcmVlLCB0aGUgb2JqZWN0IGhhZCBpbml0LCBzbyBpdCBzaG91bGQgYmUgcmVs
ZWFzZQ0KPj4+IHdoZW4gZmFpbC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENodW55b3VU
YW5nIDx0YW5nY2h1bnlvdUAxNjMuY29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKy0tLQ0K
Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgIDQgKysr
LQ0KPj4+ICAgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAgICAgICAgIHwgIDEg
Kw0KPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPj4+IGluZGV4IDhiNjhhM2MxZTZhYi4u
Y2JhMzJjNDZiYjA1IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+Pj4gQEAgLTE2OSw2
ICsxNjksMjEgQEAgdm9pZCBkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoc3RydWN0DQo+
Pj4gZHJtX2RldmljZSAqZGV2LCB9DQo+Pj4gICAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3By
aXZhdGVfb2JqZWN0X2luaXQpOw0KPj4+ICAgIA0KPj4+ICsvKioNCj4+PiArICogZHJtX2dl
bV9wcml2YXRlX29iamVjdF9maW5pIC0gRmluYWxpemUgYSBmYWlsZWQgZHJtX2dlbV9vYmpl
Y3QNCj4+PiArICogQG9iajogZHJtX2dlbV9vYmplY3QNCj4+PiArICoNCj4+PiArICogVW5p
bml0aWFsaXplIGFuIGFscmVhZHkgYWxsb2NhdGVkIEdFTSBvYmplY3Qgd2hlbiBpdA0KPj4+
IGluaXRpYWxpemVkIGZhaWxlZA0KPj4+ICsgKi8NCj4+PiArdm9pZCBkcm1fZ2VtX3ByaXZh
dGVfb2JqZWN0X2Zpbmkoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+Pj4gK3sNCj4+
PiArCVdBUk5fT04ob2JqLT5kbWFfYnVmKTsNCj4+DQo+PiBSYXRoZXIgbGVhc2UgdGhpcyBp
biBpdHMgb3JpZ2luYWwgcGxhY2UuDQo+Pg0KPj4+ICsNCj4+PiArCWRtYV9yZXN2X2Zpbmko
Jm9iai0+X3Jlc3YpOw0KPj4+ICsJZHJtX2dlbV9scnVfcmVtb3ZlKG9iaik7DQo+Pg0KPj4g
QUZBSUNUIGRybV9nZW1fbHJ1X3JlbW92ZSgpIGRvZXNuJ3QgYmVsb25nIGludG8gdGhpcyBm
dW5jdGlvbi4NCj4+DQo+Pj4gK30NCj4+PiArRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ByaXZh
dGVfb2JqZWN0X2ZpbmkpOw0KPj4+ICsNCj4+PiAgICAvKioNCj4+PiAgICAgKiBkcm1fZ2Vt
X29iamVjdF9oYW5kbGVfZnJlZSAtIHJlbGVhc2UgcmVzb3VyY2VzIGJvdW5kIHRvDQo+Pj4g
dXNlcnNwYWNlIGhhbmRsZXMNCj4+PiAgICAgKiBAb2JqOiBHRU0gb2JqZWN0IHRvIGNsZWFu
IHVwLg0KPj4+IEBAIC05MzAsMTQgKzk0NSwxMiBAQCBkcm1fZ2VtX3JlbGVhc2Uoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwNCj4+PiBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdmF0ZSkg
dm9pZA0KPj4+ICAgIGRybV9nZW1fb2JqZWN0X3JlbGVhc2Uoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmopDQo+Pj4gICAgew0KPj4+IC0JV0FSTl9PTihvYmotPmRtYV9idWYpOw0KPj4+
ICsJZHJtX2dlbV9wcml2YXRlX29iamVjdF9maW5pKG9iaik7DQo+Pj4gICAgDQo+Pj4gICAg
CWlmIChvYmotPmZpbHApDQo+Pj4gICAgCQlmcHV0KG9iai0+ZmlscCk7DQo+Pj4gICAgDQo+
Pj4gLQlkbWFfcmVzdl9maW5pKCZvYmotPl9yZXN2KTsNCj4+DQo+PiBQbGVhc2UgY2FsbCBk
cm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2ZpbmkoKSBoZXJlLg0KPj4NCj4+PiAgICAJZHJtX2dl
bV9mcmVlX21tYXBfb2Zmc2V0KG9iaik7DQo+Pj4gLQlkcm1fZ2VtX2xydV9yZW1vdmUob2Jq
KTsNCj4+DQo+PiBQbGVhc2Uga2VlcCB0aGlzIGxpbmUgaGVyZS4NCj4+DQo+PiBCZXN0IHJl
Z2FyZHMNCj4+IFRob21hcw0KPj4NCj4+PiAgICB9DQo+Pj4gICAgRVhQT1JUX1NZTUJPTChk
cm1fZ2VtX29iamVjdF9yZWxlYXNlKTsNCj4+PiAgICANCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIGluZGV4DQo+Pj4gMzUxMzhmOGEzNzVjLi44
NDVlM2Q1ZDcxZWIgMTAwNjQ0IC0tLQ0KPj4+IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
c2htZW1faGVscGVyLmMgKysrDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1l
bV9oZWxwZXIuYyBAQCAtNzksOCArNzksMTAgQEANCj4+PiBfX2RybV9nZW1fc2htZW1fY3Jl
YXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCBib29sDQo+Pj4gcHJp
dmF0ZSkgfSBlbHNlIHsgcmV0ID0gZHJtX2dlbV9vYmplY3RfaW5pdChkZXYsIG9iaiwgc2l6
ZSk7DQo+Pj4gICAgCX0NCj4+PiAtCWlmIChyZXQpDQo+Pj4gKwlpZiAocmV0KSB7DQo+Pj4g
KwkJZHJtX2dlbV9wcml2YXRlX29iamVjdF9maW5pKG9iaikNCj4+PiAgICAJCWdvdG8gZXJy
X2ZyZWU7DQo+Pj4gKwl9DQo+Pj4gICAgDQo+Pj4gICAgCXJldCA9IGRybV9nZW1fY3JlYXRl
X21tYXBfb2Zmc2V0KG9iaik7DQo+Pj4gICAgCWlmIChyZXQpDQo+Pj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPj4+IGlu
ZGV4IGJkNDJmMjVlNDQ5Yy4uOWIxZmViMDMwNjlkIDEwMDY0NA0KPj4+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9nZW0uaA0KPj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPj4+
IEBAIC00MDUsNiArNDA1LDcgQEAgaW50IGRybV9nZW1fb2JqZWN0X2luaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwNCj4+PiAgICAJCQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwg
c2l6ZV90IHNpemUpOw0KPj4+ICAgIHZvaWQgZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4gICAgCQkJCSBzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwNCj4+PiBzaXplX3Qgc2l6ZSk7ICt2b2lkIGRybV9nZW1fcHJpdmF0ZV9v
YmplY3RfZmluaShzdHJ1Y3QNCj4+PiBkcm1fZ2VtX29iamVjdCAqb2JqKTsgdm9pZCBkcm1f
Z2VtX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0DQo+Pj4gKnZtYSk7IHZvaWQgZHJt
X2dlbV92bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+Pj4gICAgaW50
IGRybV9nZW1fbW1hcF9vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHVuc2lnbmVk
IGxvbmcNCj4+PiBvYmpfc2l6ZSwNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------C0QJjKI0qwoGRcl2Yt0IOPHd--

--------------XgM8ETXUekg0EOJsfaSYemnJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3ar0FAwAAAAAACgkQlh/E3EQov+AQ
cxAAj0bf/fYJ3JvbpYSlat9Qo5WZ+4xZ1ypD0on92QLSIWGejH5cUbRoQLhuql2LEWLHThXyM0CG
P4QMnK2vS8mVyGqVScRQ47LljkmJN9Qd+TomGP5vvMUoHtovhyKDd/yDWZmkGjHw16yJtEon0SBH
m5vODEgxtB9aK5xex+6MiDJkZg22Div6Pewr1MGTYx4Smu7pxs1SjC7Qzwwf7bDzPhgIVmPsJFVB
VatoAVlpx9pOFxL79TLR2+6wBCssNK/f+e4BDdObFxnK/zO31oHZ/uf17Ibmxxyak1i0LybQpLvX
T3Vmh/yvOGDPRuTuTLiASANnJTGR9l1i23rtldVLPAenl9jG3RX4CWmaO7PJCNEBPQbE+rjPLz+U
/xU/vQoZe3VdX3L44FdS6gMTh4ddqZYgRB+xu9ml9rs6uXiSqRT5dXNwq7/2FppblKqme8FmjKJR
ts4jfPiS36QkCp8vnsLW+AJ5kzwZU+/giXRUiZVGEIFA//SUB8LHVn1jddfuBLlZHy5Ul0zz4H+G
Uqmyd24JbbVzm9Nq6ZzXF3ODBln9r351bsY2vjDXaj46JL2kI+rIt9tH2IQi9OWRsilJ9taWafGY
dngwZ1p7uDmsbBXjslP2wVRGFVxd0n13eA9Sd252mueqomLVtiuvvw+WCK+83XAkbNIkiv2NMaNr
9ew=
=SGdM
-----END PGP SIGNATURE-----

--------------XgM8ETXUekg0EOJsfaSYemnJ--
