Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71706A54B2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA00710E658;
	Tue, 28 Feb 2023 08:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF04E10E4B4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 08:48:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6946A1FDC2;
 Tue, 28 Feb 2023 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677574097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BLSztfM44hsCyXZ+LLDqJiVS1PmJTJb1OVTq280F8R0=;
 b=KsfYhyv4BLuzV1DToVfqTyGdiHsJZda8ovv2q0h0WZ+2jN/R32hgF6z06Y/qNqvF2U7GDE
 sULgjQ8NdnyQChk0F9eFkqdDTJey6yCoc8h/5UBtYS9sg+DpUAo6AeumjCqHuX5uPinKOJ
 A1y7ZnT/YdILEOgzCCBz2Qy75G7LgPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677574097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BLSztfM44hsCyXZ+LLDqJiVS1PmJTJb1OVTq280F8R0=;
 b=FcYMoMM/2yDf/rwgd1q5vwYJzlUXqnpPdnrrxzCb66kKdBBMRigbNUZ6O4+wW62CaFcunz
 DPAOVMetaNn263BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46F4413440;
 Tue, 28 Feb 2023 08:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OydcENG//WNuIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 08:48:17 +0000
Message-ID: <af58dfc7-3957-0dad-0e8f-6deb17554f6e@suse.de>
Date: Tue, 28 Feb 2023 09:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <Y/yG+sm2mhdJeTZW@kili>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y/yG+sm2mhdJeTZW@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------htUbmMqId4a9dbpmsvnUlZ0O"
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------htUbmMqId4a9dbpmsvnUlZ0O
Content-Type: multipart/mixed; boundary="------------3Duuibyufp3t47ZR1Qe95z8g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <error27@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Message-ID: <af58dfc7-3957-0dad-0e8f-6deb17554f6e@suse.de>
Subject: Re: [PATCH v2] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
References: <Y/yG+sm2mhdJeTZW@kili>
In-Reply-To: <Y/yG+sm2mhdJeTZW@kili>

--------------3Duuibyufp3t47ZR1Qe95z8g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TWVyZ2VkIGludG8gZHJtLW1pc2MtZml4ZXMuDQoNCkFtIDI3LjAyLjIzIHVtIDExOjMzIHNj
aHJpZWIgRGFuIENhcnBlbnRlcjoNCj4gVGhlIGVycm9yIGNvZGVzIGFyZSBub3Qgc2V0IG9u
IHRoZXNlIGVycm9yIHBhdGhzLg0KPiANCj4gRml4ZXM6IDE0NWVlZDQ4ZGUyNyAoImZiZGV2
OiBSZW1vdmUgY29uZmxpY3RpbmcgZGV2aWNlcyBvbiBQQ0kgYnVzIikNCj4gU2lnbmVkLW9m
Zi1ieTogRGFuIENhcnBlbnRlciA8ZXJyb3IyN0BnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gLS0tDQo+IHYy
OiBJIGFjY2lkZW50YWxseSByZXR1cm5lZCAtRUlOVkFMIGluc3RlYWQgLUVOT0RFVi4NCj4g
ICAgICBBZGQgVGhvbWFzJ3MgUmV2aWV3ZWQtYnkgdGFnLg0KPiANCj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NoaXBzZmIuYyB8IDE0ICsrKysrKysrKystLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NoaXBzZmIuYw0KPiBpbmRleCBjYzM3ZWMzZjhmYzEuLjc3OTlkNTJhNjUxZiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMNCj4gKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMNCj4gQEAgLTM1OCwxNiArMzU4LDIxIEBAIHN0
YXRpYyBpbnQgY2hpcHNmYl9wY2lfaW5pdChzdHJ1Y3QgcGNpX2RldiAqZHAsIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+ICAgCWlmIChyYykNCj4gICAJCXJldHVybiBy
YzsNCj4gICANCj4gLQlpZiAocGNpX2VuYWJsZV9kZXZpY2UoZHApIDwgMCkgew0KPiArCXJj
ID0gcGNpX2VuYWJsZV9kZXZpY2UoZHApOw0KPiArCWlmIChyYyA8IDApIHsNCj4gICAJCWRl
dl9lcnIoJmRwLT5kZXYsICJDYW5ub3QgZW5hYmxlIFBDSSBkZXZpY2VcbiIpOw0KPiAgIAkJ
Z290byBlcnJfb3V0Ow0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKChkcC0+cmVzb3VyY2VbMF0u
ZmxhZ3MgJiBJT1JFU09VUkNFX01FTSkgPT0gMCkNCj4gKwlpZiAoKGRwLT5yZXNvdXJjZVsw
XS5mbGFncyAmIElPUkVTT1VSQ0VfTUVNKSA9PSAwKSB7DQo+ICsJCXJjID0gLUVOT0RFVjsN
Cj4gICAJCWdvdG8gZXJyX2Rpc2FibGU7DQo+ICsJfQ0KPiAgIAlhZGRyID0gcGNpX3Jlc291
cmNlX3N0YXJ0KGRwLCAwKTsNCj4gLQlpZiAoYWRkciA9PSAwKQ0KPiArCWlmIChhZGRyID09
IDApIHsNCj4gKwkJcmMgPSAtRU5PREVWOw0KPiAgIAkJZ290byBlcnJfZGlzYWJsZTsNCj4g
Kwl9DQo+ICAgDQo+ICAgCXAgPSBmcmFtZWJ1ZmZlcl9hbGxvYygwLCAmZHAtPmRldik7DQo+
ICAgCWlmIChwID09IE5VTEwpIHsNCj4gQEAgLTQxNyw3ICs0MjIsOCBAQCBzdGF0aWMgaW50
IGNoaXBzZmJfcGNpX2luaXQoc3RydWN0IHBjaV9kZXYgKmRwLCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqZW50KQ0KPiAgIA0KPiAgIAlpbml0X2NoaXBzKHAsIGFkZHIpOw0KPiAg
IA0KPiAtCWlmIChyZWdpc3Rlcl9mcmFtZWJ1ZmZlcihwKSA8IDApIHsNCj4gKwlyYyA9IHJl
Z2lzdGVyX2ZyYW1lYnVmZmVyKHApOw0KPiArCWlmIChyYyA8IDApIHsNCj4gICAJCWRldl9l
cnIoJmRwLT5kZXYsIkMmVCA2NTU1MCBmcmFtZWJ1ZmZlciBmYWlsZWQgdG8gcmVnaXN0ZXJc
biIpOw0KPiAgIAkJZ290byBlcnJfdW5tYXA7DQo+ICAgCX0NCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------3Duuibyufp3t47ZR1Qe95z8g--

--------------htUbmMqId4a9dbpmsvnUlZ0O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP9v9AFAwAAAAAACgkQlh/E3EQov+CV
RRAAqKCxwlwcoQEA1f4yZ82PJBugmN5YuUxkda1y8coB95YS0c6yrNGPbJMb9fEvWuSSJjBFO/Gc
lizEoI0u3XcUXOF9LvOaXZJFZaKfyKAi5AD8SuBByR5fO8KBGoj8ZYAXc6LpMxVssUHXFZPBRCtn
rSIYhtsNy0BADysDGg0psMw2EJxC+JTa6horGcRax9f9hQe8r+SM5yhxl7KoqK4sXOOelvAoHN7P
gsY5zlpvz/ScWJhY3r3df8ZfOv5GhwiAO4s6VnG8IsvmE4tizM0VD70BaupkjS7U+tAZGmgb0Y9f
9x+ngGzICjU2NoK0PNcglWVzWGZk8tPzH3yNF8EIFMaIwxhehmsyB6KzYK6Bu2XkBqa0+wgEUBwr
GV8VgbfQ5uuPtz9010U+QqCiw3BKFrNuczG3nXuRlagAvAWDaKXfokP7g161QihiDJLuOiGmdOIR
WQ4M4YBcNXXlmcqqXsWkJDBsH+W8h6rWyQ8pIwiatCV+qzhEBCQtm8RrjpBGw3Bo7ANOEmauNyri
B2zNHtuRhZu3qbTOF9c+FOO4r3sWyHw4qJuB3wEDs8F4DaAjAVVs4GkIbgmKTYIWIpr4IeU8oEqJ
eb3fBULRfUzLfuVNRzZOGI+ViTUOmAqHJV1MLLYdRSfzXZrw7uLngNYCzanfjbx58kEsX5p1ekk4
U6Y=
=gKwu
-----END PGP SIGNATURE-----

--------------htUbmMqId4a9dbpmsvnUlZ0O--
