Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD3F7504FF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3568E10E4CC;
	Wed, 12 Jul 2023 10:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7EE10E4CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:44:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84CA71FECA;
 Wed, 12 Jul 2023 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689158655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3pbP7NRrovh3msgP6E5AFfMLVN0Yrx846HgMmCs1VzM=;
 b=xik21io1nJtybc4u+VLEPHwJkLcN02Gwgggdm8Hay4Pl99325q2E/1+TUoGnviJm5itcTx
 8PeXMuFC/Na2dRiL8gfd97mu3fWl/iAauaITbLjDpZbyc0yB+0u4VkSaeHS4rQ6rQelv4Y
 EKkR6p1JSZZIWYCZSjV0qCIck7MUD20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689158655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3pbP7NRrovh3msgP6E5AFfMLVN0Yrx846HgMmCs1VzM=;
 b=vyBJx0m8VDvO6zJZyvl/5sJBxHATKs1+IfuYMlxzMZT0khKZdGxqWj93YhpTghI4pLtfCK
 6FkBcoFzXUt2bnAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A54313336;
 Wed, 12 Jul 2023 10:44:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QQS+FP+DrmSCEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jul 2023 10:44:15 +0000
Message-ID: <964a01c5-5db3-7fe0-a8fa-7f6bbbbba8a3@suse.de>
Date: Wed, 12 Jul 2023 12:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/2] drm/ast: Add BMC virtual connector
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230712083733.223275-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230712083733.223275-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------497J24gZsc0N1E7JsT9OQLYV"
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
--------------497J24gZsc0N1E7JsT9OQLYV
Content-Type: multipart/mixed; boundary="------------Tz0Tv1Gw8Jxe5HEEROBFNv0T";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <964a01c5-5db3-7fe0-a8fa-7f6bbbbba8a3@suse.de>
Subject: Re: [PATCH v3 1/2] drm/ast: Add BMC virtual connector
References: <20230712083733.223275-1-jfalempe@redhat.com>
In-Reply-To: <20230712083733.223275-1-jfalempe@redhat.com>

--------------Tz0Tv1Gw8Jxe5HEEROBFNv0T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhpcyBwYXRjaC4NCg0KQW0gMTIuMDcuMjMgdW0gMTA6MzUg
c2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+IE1vc3QgYXNwZWVkIGRldmljZXMgaGF2ZSBh
IEJNQywgd2hpY2ggYWxsb3dzIHRvIHJlbW90ZWx5IHNlZSB0aGUgc2NyZWVuLg0KPiBBbHNv
IGluIHRoZSBjb21tb24gdXNlIGNhc2UsIHRob3NlIHNlcnZlcnMgZG9uJ3QgaGF2ZSBhIGRp
c3BsYXkgY29ubmVjdGVkLg0KPiBTbyBhZGQgYSBWaXJ0dWFsIGNvbm5lY3RvciwgdG8gcmVm
bGVjdCB0aGF0IGV2ZW4gaWYgbm8gZGlzcGxheSBpcw0KPiBjb25uZWN0ZWQsIHRoZSBmcmFt
ZWJ1ZmZlciBjYW4gc3RpbGwgYmUgc2VlbiByZW1vdGVseS4NCj4gVGhpcyBwcmVwYXJlcyB0
aGUgd29yayB0byBpbXBsZW1lbnQgYSBkZXRlY3RfY3R4KCkgZm9yIHRoZSBEaXNwbGF5IHBv
cnQNCj4gY29ubmVjdG9yLg0KPiANCj4gRml4ZXM6IGZhZTdkMTg2NDAzZSAoImRybS9wcm9i
ZS1oZWxwZXI6IERlZmF1bHQgdG8gNjQweDQ4MCBpZiBubyBFRElEIG9uIERQIikNCj4gU2ln
bmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgfCAgNCArKw0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+IGluZGV4IDNmNmUwYzk4NDUyMy4uYzk2
NTllNzIwMDJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPiBAQCAtMjE0LDYg
KzIxNCwxMCBAQCBzdHJ1Y3QgYXN0X2RldmljZSB7DQo+ICAgCQkJc3RydWN0IGRybV9lbmNv
ZGVyIGVuY29kZXI7DQo+ICAgCQkJc3RydWN0IGRybV9jb25uZWN0b3IgY29ubmVjdG9yOw0K
PiAgIAkJfSBhc3RkcDsNCj4gKwkJc3RydWN0IHsNCj4gKwkJCXN0cnVjdCBkcm1fZW5jb2Rl
ciBlbmNvZGVyOw0KPiArCQkJc3RydWN0IGRybV9jb25uZWN0b3IgY29ubmVjdG9yOw0KPiAr
CQl9IGJtYzsNCj4gICAJfSBvdXRwdXQ7DQo+ICAgDQo+ICAgCWJvb2wgc3VwcG9ydF93aWRl
X3NjcmVlbjsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBpbmRleCBmNzExZDU5MmRh
NTIuLjg4OTZiMjJlYjVjZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBA
QCAtMTczNSw2ICsxNzM1LDcwIEBAIHN0YXRpYyBpbnQgYXN0X2FzdGRwX291dHB1dF9pbml0
KHN0cnVjdCBhc3RfZGV2aWNlICphc3QpDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICAN
Cj4gKy8qDQo+ICsgKiBCTUMgdmlydHVhbCBDb25uZWN0b3INCj4gKyAqLw0KPiArDQo+ICtz
dGF0aWMgaW50IGFzdF9ibWNfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gK3sNCj4gKwlyZXR1cm4gZHJtX2FkZF9tb2Rl
c19ub2VkaWQoY29ubmVjdG9yLCAxMDI0LCA3NjgpOw0KDQpUaGF0J3MgcHJvYmFibHkgdG9v
IHNtYWxsLiBUaGUgQ1JUQyBsaXN0cyByZXNvbHV0aW9ucyB1cCB0byAxOTIweDEyMDAuIA0K
UmV0dXJuaW5nIDEwMjR4NzY4IGNvdWxkIGVhc2lseSBmaWx0ZXIgb3V0IHRob3NlIGhpZ2hl
ci1yZXMgbW9kZXMuDQoNClRoZSBCTUMgY2FuIHByb2JhYmx5IGp1c3QgdXNlIHdoYXRldmVy
IHRoZSBDUlRDIG9mZmVycy4gU28gcmF0aGVyIGNhbGwgDQpkcm1fYWRkX21vZGVzX25vZWRp
ZCgpIHdpdGggNDA5Nng0MDk2LiBBdCAzMiBicHAsIHRoaXMgY292ZXJzIHRoZSBtYXggDQpt
ZW1vcnkgb2YgNjQgTWlCLiAgVGhlIENSVEMgd2lsbCBmaWx0ZXIgb3V0IHVuc3VwcG9ydGVk
IG1vZGVzLg0KDQoNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29u
bmVjdG9yX2hlbHBlcl9mdW5jcyBhc3RfYm1jX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7
DQo+ICsJLmdldF9tb2RlcyA9IGFzdF9ibWNfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMs
DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVu
Y3MgYXN0X2JtY19jb25uZWN0b3JfZnVuY3MgPSB7DQo+ICsJLnJlc2V0ID0gZHJtX2F0b21p
Y19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0LA0KPiArCS5maWxsX21vZGVzID0gZHJtX2hlbHBl
cl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLA0KPiArCS5kZXN0cm95ID0gZHJtX2Nv
bm5lY3Rvcl9jbGVhbnVwLA0KPiArCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gZHJtX2F0
b21pY19oZWxwZXJfY29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwNCj4gKwkuYXRvbWljX2Rl
c3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVzdHJveV9zdGF0
ZSwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgYXN0X2JtY19jb25uZWN0b3JfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiArCQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikNCj4gK3sNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gZHJtX2Nv
bm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmYXN0X2JtY19jb25uZWN0b3JfZnVuY3Ms
DQo+ICsJCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMKTsNCj4gKwlpZiAocmV0KQ0K
PiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNv
bm5lY3RvciwgJmFzdF9ibWNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+ICsNCj4gKwlj
b25uZWN0b3ItPmludGVybGFjZV9hbGxvd2VkID0gMDsNCj4gKwljb25uZWN0b3ItPmRvdWJs
ZXNjYW5fYWxsb3dlZCA9IDA7DQo+ICsJY29ubmVjdG9yLT5wb2xsZWQgPSAwOw0KDQpJdCdz
IHplcm8tYWxsb2NhdGVkIG1lbW9yeS4gUGxlYXNlIGRvbid0IGNsZWFyIHRoZXNlIGZpZWxk
cyBtYW51YWxseS4gKEkgDQprbm93IHRoYXQgYXN0IGRvZXNuJ3QgZ2V0IHRoaXMgcmlnaHQu
KQ0KDQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBhc3Rf
Ym1jX291dHB1dF9pbml0KHN0cnVjdCBhc3RfZGV2aWNlICphc3QpDQo+ICt7DQo+ICsJc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiA9ICZhc3QtPmJhc2U7DQo+ICsJc3RydWN0IGRybV9jcnRj
ICpjcnRjID0gJmFzdC0+Y3J0YzsNCj4gKwlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIg
PSAmYXN0LT5vdXRwdXQuYm1jLmVuY29kZXI7DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciA9ICZhc3QtPm91dHB1dC5ibWMuY29ubmVjdG9yOw0KPiArCWludCByZXQ7
DQo+ICsNCj4gKwlyZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdChkZXYsIGVuY29kZXIs
IERSTV9NT0RFX0VOQ09ERVJfVklSVFVBTCk7DQoNCkFkZGluZyB0aGUgc2ltcGxlX2VuY29k
ZXIgaGVscGVyIHdhcyBhIG1pc3Rha2UuIFBsZWFzZSBvcGVuLWNvZGUgaXRzIA0KZnVuY3Rp
b25hbGl0eSBpbiBhc3QuIChBbHNvIHNvbWV0aGluZyB0aGF0IGFzdCBjdXJyZW50bHkgZG9l
cyBub3QuKQ0KDQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwllbmNvZGVy
LT5wb3NzaWJsZV9jcnRjcyA9IGRybV9jcnRjX21hc2soY3J0Yyk7DQo+ICsNCj4gKwlyZXQg
PSBhc3RfYm1jX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yKTsNCg0KTWF5YmUganVz
dCBpbmxpbmUgdGhpcyBjYWxsLiBJdCdzIHNpbXBsZSBlbm91Z2guDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJ
cmV0ID0gZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIp
Ow0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiAgIC8qDQo+ICAgICogTW9kZSBjb25maWcNCj4gICAgKi8NCj4gQEAg
LTE4NDIsNiArMTkwNiw5IEBAIGludCBhc3RfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgYXN0
X2RldmljZSAqYXN0KQ0KPiAgIAkJaWYgKHJldCkNCj4gICAJCQlyZXR1cm4gcmV0Ow0KPiAg
IAl9DQo+ICsJcmV0ID0gYXN0X2JtY19vdXRwdXRfaW5pdChhc3QpOw0KPiArCWlmIChyZXQp
DQo+ICsJCXJldHVybiByZXQ7DQo+ICAgDQo+ICAgCWRybV9tb2RlX2NvbmZpZ19yZXNldChk
ZXYpOw0KPiAgIA0KPiANCj4gYmFzZS1jb21taXQ6IGIzMmQ1YTUxZjNjMjE4NDMwMTFkNjhh
NThlNmFjMGI4OTdiY2U5ZjINCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------Tz0Tv1Gw8Jxe5HEEROBFNv0T--

--------------497J24gZsc0N1E7JsT9OQLYV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSug/4FAwAAAAAACgkQlh/E3EQov+CU
Qg/+NteOuBzlGAKZNTnFOKueBILfZLB4jaM9BUyCqQgmGbfwxUMRIVOC9Odko4WdCC68Ek8n5Llr
qAwpGksUDsXiHKgN8A9ssBXE4zxGnCldBP6krVzpDlHekKA6lSU3U7tViM+idHR1UH2B8y/XqEF1
t7A1e2O262Mg/dxct8efsp+Y5dIqwpenxbyFsleZDUlcO8jJbTgkGUGozIMemXpH8KySEYIdHFKk
FNocYuZTevYQ02geKc63/E7iNLVlE3se/Mb9+gHLoBNX1xdGvlSqfWXxG4tC6HMyNWGg15REfBiK
qNVMSVr5U16APZ85kbYJRGwwI+DaScd1uFew1tfQyjBofokvcDGQmxYMJQJyrfu/pLl0/R20wHk0
mr/i+gQtoZHej8qmXwd1LPi4odImznTRTcljPsptLgR6bgQbhYzHGSZFuAr5KSMXJmjhWjQFmH8y
JhnQkW8z6MnUndPgNhaBx2/HGLbwwi0DOgfYcDYJw5151nhRAA/cJu357Jr5Li+657H0I8qkhAXj
UCp0CuchJulSjyxPR4FN2hO9T+hyk/9ujbpx5nhx53n6Jv/obwkFLndMUhj1sdCdPclvF5uKMwbe
VZxqLPFWFheC65kWvf2CGr1WSDWrI4QMAl4y6HsOXEi3f9wPvA6P/92iHkElj1jvpZCw1JsSho0i
Oy4=
=pMbM
-----END PGP SIGNATURE-----

--------------497J24gZsc0N1E7JsT9OQLYV--
