Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FC653089
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 13:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9002A10E013;
	Wed, 21 Dec 2022 12:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8FA10E013;
 Wed, 21 Dec 2022 12:05:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C01C5FBB0;
 Wed, 21 Dec 2022 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671624308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=btWJ8A8DQeRgX4kZ7d9k8AnnNSyTfM0oRM6/F/bfFgw=;
 b=fotngBKEcbSw0ZEpKn/gp59MUWDEHe5oDaife7T5b7zYio6jRsXpScUX5wb5lzaQQCLDox
 exVPa1W/P8T+Ca2yUHfdvLnegyQaY4yK/GZ9NjNspD0Zf7F2dNj/d4wbQkOQJ9a8h2wH6c
 5KuBaAlSIusfAigkmZU6HJAXdug9QsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671624308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=btWJ8A8DQeRgX4kZ7d9k8AnnNSyTfM0oRM6/F/bfFgw=;
 b=Kcqz7Q3AQvAgrTjnVaBGObRwk9aLYA2W0idjSaAWuiG5OvvCczkdqgRiqE1+kH2CxHUPmd
 Hb2XhTluwE8PrsCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DCB213913;
 Wed, 21 Dec 2022 12:05:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tIhWBnT2omOZUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Dec 2022 12:05:08 +0000
Message-ID: <f534e1be-50d5-47e9-acb7-8c00a6119d3c@suse.de>
Date: Wed, 21 Dec 2022 13:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/fbdev: Move damage clip check to higher level
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20221221111902.1742095-1-jouni.hogander@intel.com>
 <20221221111902.1742095-3-jouni.hogander@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221221111902.1742095-3-jouni.hogander@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NkWJcNzgFbcdmsnoMwWh2MH5"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NkWJcNzgFbcdmsnoMwWh2MH5
Content-Type: multipart/mixed; boundary="------------f0vlPtR3avjFUUmxHfx7r30C";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Message-ID: <f534e1be-50d5-47e9-acb7-8c00a6119d3c@suse.de>
Subject: Re: [PATCH 2/2] drm/fbdev: Move damage clip check to higher level
References: <20221221111902.1742095-1-jouni.hogander@intel.com>
 <20221221111902.1742095-3-jouni.hogander@intel.com>
In-Reply-To: <20221221111902.1742095-3-jouni.hogander@intel.com>

--------------f0vlPtR3avjFUUmxHfx7r30C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTIuMjIgdW0gMTI6MTkgc2NocmllYiBKb3VuaSBIw7ZnYW5kZXI6DQo+
IENoZWNraW5nIGlmIGRhbWFnZSBjbGlwIGlzIHZhbGlkIGlzIGNvbW1vbiB0byBhbGwgZmIg
aGVscGVycy4NCj4gTWFrZXMgbW9yZSBzZW5zZSB0byBjaGVjayBpdCBpbiBoaWdoZXIgbGV2
ZWwgdGhhbiBhZGRpbmcgaW50bw0KPiBhbGwgaGVscGVycy4NCg0KSXQgd2FzIGEgZGVsaWJl
cmF0ZSBkZWNpc2lvbiB0byBzZXBhcmF0ZSBkYW1hZ2UgY2xpcHBpbmcgYW5kIGRpcnR5IA0K
dXBkYXRlczsgZG9uZSBpbiBbMV0uIENsaXBwaW5nIGlzIGFuIG9wdGlvbmFsIGhpbnQgaW4g
b3VyIHJlZ3VsYXIgZGFtYWdlIA0KaGFuZGxpbmcgdmlhIGRybV9mcmFtZWJ1ZmZlcl9mdW5j
cy5kaXJ0eS4gVGhlIGZiX2RpcnR5IGNhbGxiYWNrIG5vdyANCmZvbGxvd3MgdGhhdCBzZW1h
bnRpY3MuDQoNCkkgbWVudGlvbmVkIHRoYXQgaXQgd291bGQgYmUgYmV0dGVyIHRvIGltcGxl
bWVudCB0aG9zZSBmYl9vcHMgY2FsbGJhY2tzIA0KZm9yIGk5MTUuIEJ1dCBpZiB5b3UgZ28g
d2l0aCBmYl9kaXJ0eSwgcGxlYXNlIGltcGxlbWVudCB0aGUgY2xpcHBpbmcgDQp0ZXN0IGlu
IHlvdXIgY2FsbGJhY2suDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTA5OTU4Lz9zZXJpZXM9MTA5OTQz
JnJldj0zDQoNCj4gDQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgICAgfCA0
ICsrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDQgLS0t
LQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IGluZGV4IGIzYTczMWI5MTcw
YS4uNzhjODg5ZGJjNjEwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4g
QEAgLTM4NCw2ICszODQsMTAgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9mYl9kaXJ0
eShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyKQ0KPiAgIAljbGlwLT54MiA9IGNsaXAt
PnkyID0gMDsNCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGVscGVyLT5kYW1hZ2Vf
bG9jaywgZmxhZ3MpOw0KPiAgIA0KPiArCS8qIENhbGwgZGFtYWdlIGhhbmRsZXJzIG9ubHkg
aWYgbmVjZXNzYXJ5ICovDQo+ICsJaWYgKCEoY2xpcF9jb3B5LngxIDwgY2xpcF9jb3B5Lngy
ICYmIGNsaXBfY29weS55MSA8IGNsaXBfY29weS55MikpDQo+ICsJCXJldHVybjsNCj4gKw0K
PiAgIAlyZXQgPSBoZWxwZXItPmZ1bmNzLT5mYl9kaXJ0eShoZWxwZXIsICZjbGlwX2NvcHkp
Ow0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJZ290byBlcnI7DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJkZXZfZ2VuZXJpYy5jDQo+IGluZGV4IDBhNGMxNjBlMGU1OC4uNmM2YmIwZGQyZWE4IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiBAQCAtMzM0LDEw
ICszMzQsNiBAQCBzdGF0aWMgaW50IGRybV9mYmRldl9mYl9kaXJ0eShzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqaGVscGVyLCBzdHJ1Y3QgZHJtX2NsaXBfcmVjdA0KPiAgIAlpZiAoIWRybV9m
YmRldl91c2Vfc2hhZG93X2ZiKGhlbHBlcikpDQo+ICAgCQlyZXR1cm4gMDsNCj4gICANCj4g
LQkvKiBDYWxsIGRhbWFnZSBoYW5kbGVycyBvbmx5IGlmIG5lY2Vzc2FyeSAqLw0KPiAtCWlm
ICghKGNsaXAtPngxIDwgY2xpcC0+eDIgJiYgY2xpcC0+eTEgPCBjbGlwLT55MikpDQo+IC0J
CXJldHVybiAwOw0KPiAtDQo+ICAgCWlmIChoZWxwZXItPmJ1ZmZlcikgew0KPiAgIAkJcmV0
ID0gZHJtX2ZiZGV2X2RhbWFnZV9ibGl0KGhlbHBlciwgY2xpcCk7DQo+ICAgCQlpZiAoZHJt
X1dBUk5fT05DRShkZXYsIHJldCwgIkRhbWFnZSBibGl0dGVyIGZhaWxlZDogcmV0PSVkXG4i
LCByZXQpKQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------f0vlPtR3avjFUUmxHfx7r30C--

--------------NkWJcNzgFbcdmsnoMwWh2MH5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOi9nMFAwAAAAAACgkQlh/E3EQov+Bi
CQ/8Cc9dIvBhiaMCJ8/edDhalyXSpoBJ9CO0yr7O68KFq6bg/XvS+yGhXQ67Ii66kZzgiGi5+Rbm
RkGueUSv65TpXWWx+DTc6TqS9pLik5lMHDt+CRH+AZ5exqkbNcZC+7xUF3JfqANK6SByC39FSRzo
hOrs6cRgTkeDCPZ8FRgsXVJEEVoDa7O7eAFZtXFLWoEuUWuTiK++WSr3QGLEXUCUxHgNjAvYdih8
ZJeUDTMR4Z2neDFztK5LIUt2XUf3BLunBNSd46DTLPD8x0o8Z8bNM+Sxs2E4fRU9KqtpNWh3OaBj
zeJRP0DwKeWhpSguZqV0MTUyuGrGfdCJRhlb1MJUXJgTDQha/gA4e5fMuTIzrTM2Y6jvz6HIYSo+
lFLnE1Z3Z1ASaaXPZQsEvkacW9igwl/BUwdDTPprsyOnVJQuFJiyX0C82VEf9mdzqFf1bcDBYRnH
HdgqKZnEH6BmY4TgfRkGaGXkm61M81yI7Du27FoMroSTOU80BZtY5mEygWFL6oqbuamT9m5miq4Q
+zlQ9e1YsTh7QFzIhGYK5IW2Y/60fRnOHyz/klp3zEHryF9xZ9CSa2aRd72aFu1swJY0K6eN4Kzc
qlge0kQs8R04A2EMhS5eib7MgoSJ7Jr9aoCXQTB9SgXCGAcGeiU2ElIsh5+WkKpWkRa44nDQkQ7C
EZM=
=ZKSS
-----END PGP SIGNATURE-----

--------------NkWJcNzgFbcdmsnoMwWh2MH5--
