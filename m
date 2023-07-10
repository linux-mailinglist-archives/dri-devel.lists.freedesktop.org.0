Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2974D3B7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9C710E266;
	Mon, 10 Jul 2023 10:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1D10E266
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:39:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDE9D2189D;
 Mon, 10 Jul 2023 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688985562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CYxrrYnUqrkMy59GTjELve4cJ3+ZVeFvdL7z1zpjvkY=;
 b=uz0YFn4CeP6lKsNjbqQROnOqL+V0G7gRIEXTnEXfg5hF/N/LxIToBI9g9eRO0nOJXn7FBe
 VDttgRpBlSHdIS82z3NdQ3Nz8JUEwBaAl5oxT2vS44D+CTt4hJJVz5APzYaJty8kJRibwf
 FsZeEnPn2GMt932m6OcfRAUDqm6Q/tM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688985562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CYxrrYnUqrkMy59GTjELve4cJ3+ZVeFvdL7z1zpjvkY=;
 b=LXZpglhQB1Z4Hol7lzeZKTYfjLkf4FMw5iA1Vj9D67B5RXhN7GhGdYzdwDfuqCCrhUfQnb
 KuRTJ9RKcQR2wqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B128813A05;
 Mon, 10 Jul 2023 10:39:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s6kgKtrfq2Q4SQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 10:39:22 +0000
Message-ID: <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
Date: Mon, 10 Jul 2023 12:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230710102411.257970-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4NzYHQ0meXnyjp5NUHEctiO8"
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
Cc: loongson-kernel@lists.loongnix.cn, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4NzYHQ0meXnyjp5NUHEctiO8
Content-Type: multipart/mixed; boundary="------------gHC0UBfbZfbysQI57TF0upCZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
In-Reply-To: <20230710102411.257970-1-suijingfeng@loongson.cn>

--------------gHC0UBfbZfbysQI57TF0upCZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA3LjIzIHVtIDEyOjI0IHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiBCZWNh
dXNlIHNtYXRjaCB3YXJuaW5nczoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9sb29uZ3Nvbi9s
c2RjX3BsYW5lLmM6MTk5DQo+IGxzZGNfY3Vyc29yX3BsYW5lX2F0b21pY19hc3luY19jaGVj
aygpDQo+IHdhcm46IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJ3N0YXRl
JyAoc2VlIGxpbmUgMTgwKQ0KPiANCj4gdmltICsvc3RhdGUgKzE5OSBkcml2ZXJzL2dwdS9k
cm0vbG9vbmdzb24vbHNkY19wbGFuZS5jDQo+IA0KPiAxNzQgIHN0YXRpYyBpbnQNCj4gICAg
ICAgbHNkY19jdXJzb3JfcGxhbmVfYXRvbWljX2FzeW5jX2NoZWNrKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLA0KPiAxNzUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+IDE3NiAgew0KPiAxNzcgICAg
ICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3N0YXRlOw0KPiAxNzggICAgICAg
ICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOw0KPiAxNzkNCj4gMTgwICAg
ICAgICAgIG5ld19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0
ZSwgcGxhbmUpOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeXl5eXg0KPiBzdGF0ZSBpcyBkZXJlZmVyZW5jZWQgaW5zaWRl
IHRoaXMgZnVuY3Rpb24NCj4gDQo+IDE4MQ0KPiAxODIgIGlmICghcGxhbmUtPnN0YXRlIHx8
ICFwbGFuZS0+c3RhdGUtPmZiKSB7DQo+IDE4MyAgICAgICAgICBkcm1fZGJnKHBsYW5lLT5k
ZXYsICIlczogc3RhdGUgaXMgTlVMTFxuIiwgcGxhbmUtPm5hbWUpOw0KPiAxODQgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gMTg1ICB9DQo+IDE4Ng0KPiAxODcgIGlm
IChuZXdfc3RhdGUtPmNydGNfdyAhPSBuZXdfc3RhdGUtPmNydGNfaCkgew0KPiAxODggICAg
ICAgICAgZHJtX2RiZyhwbGFuZS0+ZGV2LCAidW5zdXBwb3J0ZWQgY3Vyc29yIHNpemU6ICV1
eCV1XG4iLA0KPiAxODkgICAgICAgICAgICAgICAgICBuZXdfc3RhdGUtPmNydGNfdywgbmV3
X3N0YXRlLT5jcnRjX2gpOw0KPiAxOTAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IDE5
MSAgfQ0KPiAxOTINCj4gMTkzICBpZiAobmV3X3N0YXRlLT5jcnRjX3cgIT0gNjQgJiYgbmV3
X3N0YXRlLT5jcnRjX3cgIT0gMzIpIHsNCj4gMTk0ICAgICAgICAgIGRybV9kYmcocGxhbmUt
PmRldiwgInVuc3VwcG9ydGVkIGN1cnNvciBzaXplOiAldXgldVxuIiwNCj4gMTk1ICAgICAg
ICAgICAgICAgICAgbmV3X3N0YXRlLT5jcnRjX3csIG5ld19zdGF0ZS0+Y3J0Y19oKTsNCj4g
MTk2ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAxOTcgIH0NCj4gMTk4DQo+IDE5OSAg
aWYgKHN0YXRlKSB7DQo+ICAgICAgICAgICBeXl5eXg0KPiBDaGVja2VkIHRvbyBsYXRlIQ0K
PiANCj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJv
Lm9yZz4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNzEwMDQy
My5yVjdEMDVVcS1sa3BAaW50ZWwuY29tLw0KPiBTaWduZWQtb2ZmLWJ5OiBTdWkgSmluZ2Zl
bmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNuPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJUVywgeW91J3JlIHBvc3RpbmcgdGhl
c2UgcGF0Y2hlcyBmb3IgbG9vbmdzb24sIGJ1dCB0aGF0IGRyaXZlciBpcyBub3QgDQp5ZXQg
aW4gb3VyIHRyZWU/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbG9vbmdzb24vbHNkY19wbGFuZS5jIHwgOCArLS0tLS0tLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbG9vbmdzb24vbHNkY19wbGFuZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2xvb25nc29uL2xzZGNfcGxhbmUuYw0KPiBpbmRleCAyYWIzZGI5
ODJhYTMuLjBkNTA5NDYzMzIyMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xv
b25nc29uL2xzZGNfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbG9vbmdzb24v
bHNkY19wbGFuZS5jDQo+IEBAIC0xOTYsMTMgKzE5Niw3IEBAIHN0YXRpYyBpbnQgbHNkY19j
dXJzb3JfcGxhbmVfYXRvbWljX2FzeW5jX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LA0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgCX0NCj4gICANCj4gLQlpZiAoc3RhdGUp
IHsNCj4gLQkJY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2V4aXN0aW5nX2NydGNfc3Rh
dGUoc3RhdGUsIG5ld19zdGF0ZS0+Y3J0Yyk7DQo+IC0JfSBlbHNlIHsNCj4gLQkJY3J0Y19z
dGF0ZSA9IHBsYW5lLT5jcnRjLT5zdGF0ZTsNCj4gLQkJZHJtX2RiZyhwbGFuZS0+ZGV2LCAi
JXM6IGF0b21pYyBzdGF0ZSBpcyBOVUxMXG4iLCBwbGFuZS0+bmFtZSk7DQo+IC0JfQ0KPiAt
DQo+ICsJY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2V4aXN0aW5nX2NydGNfc3RhdGUo
c3RhdGUsIG5ld19zdGF0ZS0+Y3J0Yyk7DQo+ICAgCWlmICghY3J0Y19zdGF0ZS0+YWN0aXZl
KQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdl
cm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBC
b3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------gHC0UBfbZfbysQI57TF0upCZ--

--------------4NzYHQ0meXnyjp5NUHEctiO8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSr39kFAwAAAAAACgkQlh/E3EQov+AG
YBAApa6MqDvII6lUjrhDQf7muKdgzsn40UQB/YfdsvISa2AhZ9fu/hbns/alX/fwVJNqUJcQoMVw
XiGVgbhxsqlTUIaP0EaftZGsAItfzMEWm0NF/JE3vKHTm8xca6RItiWmXbW/U2o0mqv7E4etmmOH
2OCnRTSwTpNAxiBwclThu0NWoxBF6mc4JT+dPghIMuu32f3bkjPmzwvEb1cbvvvdWBLH2icl+CBy
mH6N1GmlPwFR2vFWM9+E8ChgbJrCR2D9jE5lGDnRRNm7OMmMQBTD2cppKLzmn7KP/le5ZUmWUriZ
EupfNIA3Bxz7rMAxddqoY/FjF7jYo54yU1gCzqmRGpHtkOpbCkh8XdifGCTeCDzeymGoqG5HX4Qj
IX4Ep21g1xp/W6D/j04DwGgA3Kq5tnTnbE+H62CT0Dr45JjQY/kscrwyiUB9YykEpAKVh3ffPf4r
Dg07H1IqunB+ABgkqTXCBAaPrsRdUDGItaWB+ke+ndMbOn9e5TwEtidG0dP6Iqjiuc0yA6Iz4rW5
QWf2xT/XJeU8Ep8qTnHNTPrVOr240pPcypnmZYNnmx862WkDkAFwTNMG6p6MTR0W6OiHtFb2IBWm
zx5zWnnVo6vHq4J2UKGmQAImkCVyw5lN3whkB2t9ZsHtTVYiYcXeTpHOZ/d8HwvHC7DGbA6DZApv
zm4=
=7Co2
-----END PGP SIGNATURE-----

--------------4NzYHQ0meXnyjp5NUHEctiO8--
