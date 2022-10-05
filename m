Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3515F5900
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 19:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FBB10E2CA;
	Wed,  5 Oct 2022 17:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA07B10E2CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 17:18:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97F581F8A3;
 Wed,  5 Oct 2022 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664990305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xd+QmsOjPp7zcrdstQMJ9W3S7p3J/v4GfLmZbr0zjhs=;
 b=UlfzyTqwEnqmQN2ViJ7cDEoMMkTzGX+HpMaN0BR2W06jjOLdy3LKmHfp2cu+3ZoqjVwZW6
 +188etKce/t71pYuYqqmbvluSE9MW3XRSARCBbp2eB38/SC/5cCSo1XuS1WhEWT3t0LHRv
 z41Tr1Pwphgi2EgFRqKXXgsuTKySGrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664990305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xd+QmsOjPp7zcrdstQMJ9W3S7p3J/v4GfLmZbr0zjhs=;
 b=JyQaNL5VoCaiTM5Y+N2aPUkLT9J2gZ211L4mysb2jie8uIqPKE9t3mnbvBJxpmWSJ/TTsX
 Xx8GF0YZ4cr50TDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 748AB13ABD;
 Wed,  5 Oct 2022 17:18:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WoF0G2G8PWPucQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Oct 2022 17:18:25 +0000
Message-ID: <9fdaaae1-982c-92e1-bc61-a6db3e94ef56@suse.de>
Date: Wed, 5 Oct 2022 19:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] drm/ssd130x: Iterate over damage clips instead of
 using a merged rect
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220930152944.2584356-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220930152944.2584356-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lPn3uMH3YT3vN88YQrmoxEKP"
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
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lPn3uMH3YT3vN88YQrmoxEKP
Content-Type: multipart/mixed; boundary="------------9UU4NfRuPAA6PnBQTNKeM18Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <9fdaaae1-982c-92e1-bc61-a6db3e94ef56@suse.de>
Subject: Re: [PATCH v2] drm/ssd130x: Iterate over damage clips instead of
 using a merged rect
References: <20220930152944.2584356-1-javierm@redhat.com>
In-Reply-To: <20220930152944.2584356-1-javierm@redhat.com>

--------------9UU4NfRuPAA6PnBQTNKeM18Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMwLjA5LjIyIHVtIDE3OjI5IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGUgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZCgpIGhlbHBlciBt
ZXJnZXMgYWxsIHRoZSBkYW1hZ2UgY2xpcHMNCj4gaW50byBvbmUgcmVjdGFuZ2xlLiBJZiB0
aGVyZSBhcmUgbXVsdGlwbGUgZGFtYWdlIGNsaXBzIHRoYXQgYXJlbid0IGNsb3NlDQo+IHRv
IGVhY2ggb3RoZXIsIHRoZSByZXN1bHRpbmcgcmVjdGFuZ2xlIGNvdWxkIGJlIHF1aXRlIGJp
Zy4NCj4gDQo+IEluc3RlYWQgb2YgdXNpbmcgdGhhdCBmdW5jdGlvbiBoZWxwZXIsIGl0ZXJh
dGUgb3ZlciBhbGwgdGhlIGRhbWFnZSBjbGlwcw0KPiBhbmQgdXBkYXRlIHRoZW0gb25lIGJ5
IG9uZS4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUBy
ZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMg
PGphdmllcm1AcmVkaGF0LmNvbT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4g
LSBNb3ZlIHRoZSBkc3RfY2xpcCBhc3NpZ25tZW50IGluc2lkZSB0aGUgZHJtX2F0b21pY19m
b3JfZWFjaF9wbGFuZV9kYW1hZ2UoKQ0KPiAgICBsb29wIChUaG9tYXMgWmltbWVybWFubiku
DQo+IC0gUGFzcyBkc3RfY2xpcCBpbnN0ZWFkIG9mIGRhbWFnZSBhcmVhIGFzIGFyZ3VtZW50
IHRvIHNzZDEzMHhfZmJfYmxpdF9yZWN0KCkNCj4gICAgZnVuY3Rpb24gKFRob21hcyBaaW1t
ZXJtYW5uKQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMgfCAx
OSArKysrKysrKysrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3NvbG9tb24vc3NkMTMweC5jIGIvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMw
eC5jDQo+IGluZGV4IGJjNDFhNWFlODEwYS4uZjQ1NmIyMzNkMmU3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+IEBAIC01NzgsMjEgKzU3OCwyNCBAQCBzdGF0
aWMgdm9pZCBzc2QxMzB4X3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY191cGRhdGUoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAgCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBs
YW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFu
ZSk7DQo+ICAgCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSA9IGRy
bV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPiAgIAlzdHJ1
Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93X3BsYW5lX3N0YXRlID0gdG9fZHJt
X3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZV9zdGF0ZSk7DQo+ICsJc3RydWN0IGRybV9hdG9t
aWNfaGVscGVyX2RhbWFnZV9pdGVyIGl0ZXI7DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpk
cm0gPSBwbGFuZS0+ZGV2Ow0KPiAtCXN0cnVjdCBkcm1fcmVjdCBzcmNfY2xpcCwgZHN0X2Ns
aXA7DQo+ICsJc3RydWN0IGRybV9yZWN0IGRzdF9jbGlwOw0KPiArCXN0cnVjdCBkcm1fcmVj
dCBkYW1hZ2U7DQo+ICAgCWludCBpZHg7DQo+ICAgDQo+IC0JaWYgKCFkcm1fYXRvbWljX2hl
bHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9wbGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUsICZzcmNf
Y2xpcCkpDQo+ICsJaWYgKCFkcm1fZGV2X2VudGVyKGRybSwgJmlkeCkpDQo+ICAgCQlyZXR1
cm47DQo+ICAgDQo+IC0JZHN0X2NsaXAgPSBwbGFuZV9zdGF0ZS0+ZHN0Ow0KPiAtCWlmICgh
ZHJtX3JlY3RfaW50ZXJzZWN0KCZkc3RfY2xpcCwgJnNyY19jbGlwKSkNCj4gLQkJcmV0dXJu
Ow0KPiArCWRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyX2luaXQoJml0ZXIsIG9sZF9w
bGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUpOw0KPiArCWRybV9hdG9taWNfZm9yX2VhY2hfcGxh
bmVfZGFtYWdlKCZpdGVyLCAmZGFtYWdlKSB7DQo+ICsJCWRzdF9jbGlwID0gcGxhbmVfc3Rh
dGUtPmRzdDsNCj4gICANCj4gLQlpZiAoIWRybV9kZXZfZW50ZXIoZHJtLCAmaWR4KSkNCj4g
LQkJcmV0dXJuOw0KPiArCQlpZiAoIWRybV9yZWN0X2ludGVyc2VjdCgmZHN0X2NsaXAsICZk
YW1hZ2UpKQ0KPiArCQkJY29udGludWU7DQo+ICAgDQo+IC0Jc3NkMTMweF9mYl9ibGl0X3Jl
Y3QocGxhbmVfc3RhdGUtPmZiLCAmc2hhZG93X3BsYW5lX3N0YXRlLT5kYXRhWzBdLCAmZHN0
X2NsaXApOw0KPiArCQlzc2QxMzB4X2ZiX2JsaXRfcmVjdChwbGFuZV9zdGF0ZS0+ZmIsICZz
aGFkb3dfcGxhbmVfc3RhdGUtPmRhdGFbMF0sICZkc3RfY2xpcCk7DQo+ICsJfQ0KPiAgIA0K
PiAgIAlkcm1fZGV2X2V4aXQoaWR4KTsNCj4gICB9DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------9UU4NfRuPAA6PnBQTNKeM18Q--

--------------lPn3uMH3YT3vN88YQrmoxEKP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM9vGEFAwAAAAAACgkQlh/E3EQov+A+
FhAAyVMxqmnZTLzleHBoz44QgfToRsJdRySXMmaaCtGnWlAEmFgdV0Ow3PZvu1EEaUU3OJdtww3L
fA/gqh4qybYt+tZioh4a9S2cVfSq6L8zpUSO3hghq6izaf7gkZmSpxTXr7UPBz7p3frTPTdJtbEX
ucusImmWi1OEvQ7hCCKpHGmhg1ggxJrWDVkjFbV6aI1GtqRkemxZUXWTK+QdpHpKOySaQV+pdrXN
STNRGjPHuqES6wTb877Ze/xuFQrefjA7GvUCI6yYo4wa+KRqdloePMfwPXSWdANIL4WitgAQgR+G
prURVhyHYWxwA0CCurJOJeYZCyl+oJ1YeRt06JYfo7RfAlUTfd/YkWa0ebwES0sMh7Vc6p6WeSUI
o5UCzWQ6CnZnOFEVcO4nG7/xCx0Mz5jsRF9q1P3yHDnwABKJgjCu+vWJves7woWgi/UKw42pw1iV
mKm0Bv6D9fwj5TjvAUO8hlcrqN5YJkZ7gDFsjGo9hBFyINNfwfxVm9yWPVLQy0Ci2ZAayJ3fza39
TRa8xyKGkI36/NzKyJFD+jepuwp/ifgT4BjRInq2mc1HDGfgNXabV6/g3MYFvtBMVOEseXC1tJJ0
FV0Dvr/8Uyx6qS6kxjbQu5orv5a986DwXzSQIN4f97h30XoqurQbCD1/X9yoRDQxh71naLn64jVa
LE0=
=raad
-----END PGP SIGNATURE-----

--------------lPn3uMH3YT3vN88YQrmoxEKP--
