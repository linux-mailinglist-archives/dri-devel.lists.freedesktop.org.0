Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAB750A3D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD4510E540;
	Wed, 12 Jul 2023 13:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2E110E540
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:59:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B45D1F8D9;
 Wed, 12 Jul 2023 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689170387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rdgbb/ScCQV3K+DBiDskAKzgjyYPI2HkN3vXQrluaLw=;
 b=wU0JhZp/Wts9mBv4KLI4kt4t79564ybItuWOhexB+74x/XOV8ZhTwd9PHHBPxcsdtE8ncL
 /RRYsSONPPfAtOlk+oTByWixI3K9DxVF0Qs+t5XsIdgvoF05fygrCNxVBdFTNByxG4xWzP
 nuabiFAl2lLUACmxO2URGf4qKoX7Rto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689170387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rdgbb/ScCQV3K+DBiDskAKzgjyYPI2HkN3vXQrluaLw=;
 b=0jU56iU86Hm4XtrQPthVJ7crgx3Ku7rDn07DPxMQ3ikYKv33wJ18kfW3HjIGRaRAi1hTJF
 ESqIZuxTm/l+OzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65E52133DD;
 Wed, 12 Jul 2023 13:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7/24F9OxrmQ6fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jul 2023 13:59:47 +0000
Message-ID: <d498ca60-828f-e035-ceff-df495bec765d@suse.de>
Date: Wed, 12 Jul 2023 15:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/2] drm/ast: Add BMC virtual connector
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230712132826.287126-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230712132826.287126-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dVdPHaybMAzM9qSJvnTtuDuB"
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
--------------dVdPHaybMAzM9qSJvnTtuDuB
Content-Type: multipart/mixed; boundary="------------1Nd0roYT8xNpoHXelI9hyU0m";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d498ca60-828f-e035-ceff-df495bec765d@suse.de>
Subject: Re: [PATCH v4 1/2] drm/ast: Add BMC virtual connector
References: <20230712132826.287126-1-jfalempe@redhat.com>
In-Reply-To: <20230712132826.287126-1-jfalempe@redhat.com>

--------------1Nd0roYT8xNpoHXelI9hyU0m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDcuMjMgdW0gMTU6Mjcgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE1vc3QgYXNwZWVkIGRldmljZXMgaGF2ZSBhIEJNQywgd2hpY2ggYWxsb3dzIHRvIHJlbW90
ZWx5IHNlZSB0aGUgc2NyZWVuLg0KPiBBbHNvIGluIHRoZSBjb21tb24gdXNlIGNhc2UsIHRo
b3NlIHNlcnZlcnMgZG9uJ3QgaGF2ZSBhIGRpc3BsYXkgY29ubmVjdGVkLg0KPiBTbyBhZGQg
YSBWaXJ0dWFsIGNvbm5lY3RvciwgdG8gcmVmbGVjdCB0aGF0IGV2ZW4gaWYgbm8gZGlzcGxh
eSBpcw0KPiBjb25uZWN0ZWQsIHRoZSBmcmFtZWJ1ZmZlciBjYW4gc3RpbGwgYmUgc2VlbiBy
ZW1vdGVseS4NCj4gVGhpcyBwcmVwYXJlcyB0aGUgd29yayB0byBpbXBsZW1lbnQgYSBkZXRl
Y3RfY3R4KCkgZm9yIHRoZSBEaXNwbGF5IHBvcnQNCj4gY29ubmVjdG9yLg0KPiANCj4gdjQ6
IGNhbGwgZHJtX2FkZF9tb2Rlc19ub2VkaWQoKSB3aXRoIDQwOTZ4NDA5NiAoVGhvbWFzIFpp
bW1lcm1hbm4pDQo+ICAgICAgcmVtb3ZlIHVzZWxlc3Mgc3RydWN0IGZpZWxkIGluaXQgdG8g
MCAoVGhvbWFzIFppbW1lcm1hbm4pDQo+ICAgICAgZG9uJ3QgdXNlIGRybV9zaW1wbGVfZW5j
b2Rlcl9pbml0KCkgKFRob21hcyBaaW1tZXJtYW5uKQ0KPiAgICAgIGlubGluZSBhc3RfYm1j
X2Nvbm5lY3Rvcl9pbml0KCkgKFRob21hcyBaaW1tZXJtYW5uKQ0KPiANCj4gRml4ZXM6IGZh
ZTdkMTg2NDAzZSAoImRybS9wcm9iZS1oZWxwZXI6IERlZmF1bHQgdG8gNjQweDQ4MCBpZiBu
byBFRElEIG9uIERQIikNCj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFs
ZW1wZUByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuaCAgfCAgNCArKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA1
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA2MiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPiBp
bmRleCAzZjZlMGM5ODQ1MjMuLmM5NjU5ZTcyMDAyZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmgNCj4gQEAgLTIxNCw2ICsyMTQsMTAgQEAgc3RydWN0IGFzdF9kZXZpY2Ugew0K
PiAgIAkJCXN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOw0KPiAgIAkJCXN0cnVjdCBkcm1f
Y29ubmVjdG9yIGNvbm5lY3RvcjsNCj4gICAJCX0gYXN0ZHA7DQo+ICsJCXN0cnVjdCB7DQo+
ICsJCQlzdHJ1Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsNCj4gKwkJCXN0cnVjdCBkcm1fY29u
bmVjdG9yIGNvbm5lY3RvcjsNCj4gKwkJfSBibWM7DQo+ICAgCX0gb3V0cHV0Ow0KPiAgIA0K
PiAgIAlib29sIHN1cHBvcnRfd2lkZV9zY3JlZW47DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4gaW5kZXggZjcxMWQ1OTJkYTUyLi4xYTgyOTMxNjJmZWMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tb2RlLmMNCj4gQEAgLTE3MzUsNiArMTczNSw2MSBAQCBzdGF0aWMgaW50
IGFzdF9hc3RkcF9vdXRwdXRfaW5pdChzdHJ1Y3QgYXN0X2RldmljZSAqYXN0KQ0KPiAgIAly
ZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICsvKg0KPiArICogQk1DIHZpcnR1YWwgQ29ubmVj
dG9yDQo+ICsgKi8NCj4gKw0KPiArc3RhdGljIGludCBhc3RfYm1jX2Nvbm5lY3Rvcl9oZWxw
ZXJfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICt7DQo+
ICsJcmV0dXJuIGRybV9hZGRfbW9kZXNfbm9lZGlkKGNvbm5lY3RvciwgNDA5NiwgNDA5Nik7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MgYXN0X2JtY19jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gew0KPiArCS5nZXRf
bW9kZXMgPSBhc3RfYm1jX2Nvbm5lY3Rvcl9oZWxwZXJfZ2V0X21vZGVzLA0KPiArfTsNCj4g
Kw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGFzdF9ibWNf
Y29ubmVjdG9yX2Z1bmNzID0gew0KPiArCS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl9yZXNldCwNCj4gKwkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2lu
Z2xlX2Nvbm5lY3Rvcl9tb2RlcywNCj4gKwkuZGVzdHJveSA9IGRybV9jb25uZWN0b3JfY2xl
YW51cCwNCj4gKwkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVy
X2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsDQo+ICsJLmF0b21pY19kZXN0cm95X3N0YXRl
ID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsDQo+ICt9Ow0K
PiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGFzdF9ibWNf
ZW5jb2Rlcl9mdW5jcyA9IHsNCj4gKwkuZGVzdHJveSA9IGRybV9lbmNvZGVyX2NsZWFudXAs
DQo+ICt9Ow0KDQpQZWRhbnRpYyBjb21tZW50OiBUaGUgZW5jb2RlciBnb2VzIHJpZ2h0IGJl
Zm9yZSB0aGUgY29ubmVjdG9yIGNvZGUuIFRoZSANCm9yZGVyIHRocm91Z2ggdGhlIGZpbGUg
aXMgcGxhbmVzLT5jcnRjLT5lbmNvZGVyLT5jb25uZWN0b3IsIGFzIHRoYXQncyANCnRoZSBv
cmRlciBpbiB0aGUgcGlwZWxpbmUgYW5kIHRoZSBvcmRlciBpbiB3aGljaCB0aGUgcGlwZWxp
bmUgaXMgYmVpbmcgDQpzZXQgdXAuIFdpdGggdGhpcyBsaXR0bGUgZml4Og0KDQpSZXZpZXdl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gKw0KPiArc3RhdGljIGludCBhc3RfYm1jX291dHB1dF9p
bml0KHN0cnVjdCBhc3RfZGV2aWNlICphc3QpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9kZXZp
Y2UgKmRldiA9ICZhc3QtPmJhc2U7DQo+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjID0gJmFz
dC0+Y3J0YzsNCj4gKwlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIgPSAmYXN0LT5vdXRw
dXQuYm1jLmVuY29kZXI7DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9
ICZhc3QtPm91dHB1dC5ibWMuY29ubmVjdG9yOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKw0K
PiArCXJldCA9IGRybV9lbmNvZGVyX2luaXQoZGV2LCBlbmNvZGVyLA0KPiArCQkJCSZhc3Rf
Ym1jX2VuY29kZXJfZnVuY3MsDQo+ICsJCQkJRFJNX01PREVfRU5DT0RFUl9WSVJUVUFMLCAi
YXN0X2JtYyIpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsJZW5jb2Rl
ci0+cG9zc2libGVfY3J0Y3MgPSBkcm1fY3J0Y19tYXNrKGNydGMpOw0KPiArDQo+ICsJcmV0
ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmYXN0X2JtY19jb25uZWN0
b3JfZnVuY3MsDQo+ICsJCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMKTsNCj4gKwlp
ZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJZHJtX2Nvbm5lY3Rvcl9oZWxw
ZXJfYWRkKGNvbm5lY3RvciwgJmFzdF9ibWNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+
ICsNCj4gKwlyZXQgPSBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGNvbm5lY3Rvciwg
ZW5jb2Rlcik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJl
dHVybiAwOw0KPiArfQ0KPiArDQo+ICAgLyoNCj4gICAgKiBNb2RlIGNvbmZpZw0KPiAgICAq
Lw0KPiBAQCAtMTg0Miw2ICsxODk3LDkgQEAgaW50IGFzdF9tb2RlX2NvbmZpZ19pbml0KHN0
cnVjdCBhc3RfZGV2aWNlICphc3QpDQo+ICAgCQlpZiAocmV0KQ0KPiAgIAkJCXJldHVybiBy
ZXQ7DQo+ICAgCX0NCj4gKwlyZXQgPSBhc3RfYm1jX291dHB1dF9pbml0KGFzdCk7DQo+ICsJ
aWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gICANCj4gICAJZHJtX21vZGVfY29uZmln
X3Jlc2V0KGRldik7DQo+ICAgDQo+IA0KPiBiYXNlLWNvbW1pdDogYjMyZDVhNTFmM2MyMTg0
MzAxMWQ2OGE1OGU2YWMwYjg5N2JjZTlmMg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------1Nd0roYT8xNpoHXelI9hyU0m--

--------------dVdPHaybMAzM9qSJvnTtuDuB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSusdIFAwAAAAAACgkQlh/E3EQov+AB
ZQ//XJivKBJYZsiD3pq4VW5YNYZ9HPPZL6AeuexOPZ/UbYT9gHJI5xLxbtZPo4nUrj1W2+3y6XhA
oJQlthG9M7c1I7jZkOyrAUtsg6O46o+zr3w8joIxKpV346XoTleSctoUBPAC+jS4IT/oOx1PYbeF
TuFMqZm2o9BIHGQQs0Hi04YnZTA4OOiwn/FBxIzH08jXrPNDy7V+nG31f1UTkqKykh5pRCHAI4Vy
zj2uR4xt7XN3whguc+vUMNL30ynt13/+8sDq+O/n5dWIEnJUnAEKk+tzohi0l1+7pXhpzTdHWCVl
SUscdfLWEPO6MoUXasGksU2gsXkbOHW/i3gT9o8yNuvpg2hFcRPUvN5q9MwBMNvzNwip1jIpi7tj
PSNW/qFWlc6CrmQiOxFUjyvGxpPLbho3JKNPB+y53Qc95/FVhEkl9Y/v1p0rSxPr6jT5yKP5cPpK
RngC+9nGSAUPyMgea0pGUzrP0+84+WNnwgulby+4djwXbQe+tZV23pB/bbZQwj5muKKEJskXN04M
K0YVp81NTTqj5ajK9XItQDeehr/aC7evRIkdYx+chGyl6TdHdGFNP3CGFNsglcG2umDKa5HQul9b
2ntyCZWXKdx2qXmls7DShVnNk7ETZDsMCsFMIKjPZDZ+z41hVGgortneVJE5iBPx4bJt/akTGVsT
b7I=
=ew/6
-----END PGP SIGNATURE-----

--------------dVdPHaybMAzM9qSJvnTtuDuB--
