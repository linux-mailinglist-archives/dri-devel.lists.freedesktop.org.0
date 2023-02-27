Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6116A4001
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F1010E1C1;
	Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1D310E1C1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:10:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 387B91FD63;
 Mon, 27 Feb 2023 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677496253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sgrp7bglItceDNA5NDeN2N7hSQQ6SSeiUy5n/QEETjc=;
 b=XaPKDu0aCtd60eZbM0xeoQ0AfTW1jGS0iaarzXy1GMECLZS+o5kV/JDQpY9DzRMC/T3Y6/
 7kKGsQflwqT3haQU3L9cqY+J/RTBcpYOKnY404Ow0/AOI+daV8e3F5AoOFZeaoa8ftEZRp
 wS+/x6zx36b3m0SmmSyeq3f9JsdwJsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677496253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sgrp7bglItceDNA5NDeN2N7hSQQ6SSeiUy5n/QEETjc=;
 b=NeNbMzuncMU80Bk1bmBOQLKPRb+P68/MMlyU7ukLe42T1xHdxSIUCbIeS77OwLm4z8vQTl
 4dHz4asLrOg1GyAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14DB513912;
 Mon, 27 Feb 2023 11:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id An0QBL2P/GN/EAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Feb 2023 11:10:53 +0000
Message-ID: <cc7dea99-c346-a7f8-3cec-b2394526cabe@suse.de>
Date: Mon, 27 Feb 2023 12:10:52 +0100
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
 boundary="------------n4XmWhFeVRTENNAUCDfjcF2G"
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
--------------n4XmWhFeVRTENNAUCDfjcF2G
Content-Type: multipart/mixed; boundary="------------1Mw693b2vLG1T9LWYhTL5ItN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <error27@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Message-ID: <cc7dea99-c346-a7f8-3cec-b2394526cabe@suse.de>
Subject: Re: [PATCH v2] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
References: <Y/yG+sm2mhdJeTZW@kili>
In-Reply-To: <Y/yG+sm2mhdJeTZW@kili>

--------------1Mw693b2vLG1T9LWYhTL5ItN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDIuMjMgdW0gMTE6MzMgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBU
aGUgZXJyb3IgY29kZXMgYXJlIG5vdCBzZXQgb24gdGhlc2UgZXJyb3IgcGF0aHMuDQo+IA0K
PiBGaXhlczogMTQ1ZWVkNDhkZTI3ICgiZmJkZXY6IFJlbW92ZSBjb25mbGljdGluZyBkZXZp
Y2VzIG9uIFBDSSBidXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxlcnJv
cjI3QGdtYWlsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KPiAtLS0NCj4gdjI6IEkgYWNjaWRlbnRhbGx5IHJldHVybmVk
IC1FSU5WQUwgaW5zdGVhZCAtRU5PREVWLg0KPiAgICAgIEFkZCBUaG9tYXMncyBSZXZpZXdl
ZC1ieSB0YWcuDQoNClRoYW5rcyBhIGxvdC4gVW5sZXNzIEhlbGdlIHRha2VzIGl0IGludG8g
dGhlIGZiZGV2IGJyYW5jaCwgSSdsbCBtZXJnZSANCnlvdXIgcGF0Y2ggdGhyb3VnaCBEUk0g
dHJlZXMgd2l0aGluIHRoZSBuZXh0IGRheXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMgfCAxNCArKysrKysrKysr
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2hpcHNmYi5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMNCj4gaW5kZXggY2MzN2VjM2Y4ZmMx
Li43Nzk5ZDUyYTY1MWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2hp
cHNmYi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2hpcHNmYi5jDQo+IEBAIC0z
NTgsMTYgKzM1OCwyMSBAQCBzdGF0aWMgaW50IGNoaXBzZmJfcGNpX2luaXQoc3RydWN0IHBj
aV9kZXYgKmRwLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPiAgIAlpZiAo
cmMpDQo+ICAgCQlyZXR1cm4gcmM7DQo+ICAgDQo+IC0JaWYgKHBjaV9lbmFibGVfZGV2aWNl
KGRwKSA8IDApIHsNCj4gKwlyYyA9IHBjaV9lbmFibGVfZGV2aWNlKGRwKTsNCj4gKwlpZiAo
cmMgPCAwKSB7DQo+ICAgCQlkZXZfZXJyKCZkcC0+ZGV2LCAiQ2Fubm90IGVuYWJsZSBQQ0kg
ZGV2aWNlXG4iKTsNCj4gICAJCWdvdG8gZXJyX291dDsNCj4gICAJfQ0KPiAgIA0KPiAtCWlm
ICgoZHAtPnJlc291cmNlWzBdLmZsYWdzICYgSU9SRVNPVVJDRV9NRU0pID09IDApDQo+ICsJ
aWYgKChkcC0+cmVzb3VyY2VbMF0uZmxhZ3MgJiBJT1JFU09VUkNFX01FTSkgPT0gMCkgew0K
PiArCQlyYyA9IC1FTk9ERVY7DQo+ICAgCQlnb3RvIGVycl9kaXNhYmxlOw0KPiArCX0NCj4g
ICAJYWRkciA9IHBjaV9yZXNvdXJjZV9zdGFydChkcCwgMCk7DQo+IC0JaWYgKGFkZHIgPT0g
MCkNCj4gKwlpZiAoYWRkciA9PSAwKSB7DQo+ICsJCXJjID0gLUVOT0RFVjsNCj4gICAJCWdv
dG8gZXJyX2Rpc2FibGU7DQo+ICsJfQ0KPiAgIA0KPiAgIAlwID0gZnJhbWVidWZmZXJfYWxs
b2MoMCwgJmRwLT5kZXYpOw0KPiAgIAlpZiAocCA9PSBOVUxMKSB7DQo+IEBAIC00MTcsNyAr
NDIyLDggQEAgc3RhdGljIGludCBjaGlwc2ZiX3BjaV9pbml0KHN0cnVjdCBwY2lfZGV2ICpk
cCwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4gICANCj4gICAJaW5pdF9j
aGlwcyhwLCBhZGRyKTsNCj4gICANCj4gLQlpZiAocmVnaXN0ZXJfZnJhbWVidWZmZXIocCkg
PCAwKSB7DQo+ICsJcmMgPSByZWdpc3Rlcl9mcmFtZWJ1ZmZlcihwKTsNCj4gKwlpZiAocmMg
PCAwKSB7DQo+ICAgCQlkZXZfZXJyKCZkcC0+ZGV2LCJDJlQgNjU1NTAgZnJhbWVidWZmZXIg
ZmFpbGVkIHRvIHJlZ2lzdGVyXG4iKTsNCj4gICAJCWdvdG8gZXJyX3VubWFwOw0KPiAgIAl9
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------1Mw693b2vLG1T9LWYhTL5ItN--

--------------n4XmWhFeVRTENNAUCDfjcF2G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP8j7wFAwAAAAAACgkQlh/E3EQov+DM
JQ/+Nm8lUrqEHMgxeNTJ5NkEVzBVDbR0RtEqkwU5hhNPXn8WVTfnPsxiLNDJMOCVgdfxpWbYiSDH
M+Wk7dmnUM/Wg7IIWX4PDMo7ZhDsgYaoV5f7Ns/gIfGliU7lg1qyKuMNxvsk228N4BnMLXDwgBu9
Nsw1u8iuDoBxVwXVJt7dn+2vFvohXI29id4SAJftClL3P0PeJl6Iyq4Xqps2IF+we3NzYETVSyp3
8chRqEZu7cdr/VbM0wDXDiUIyk4t/G+2daKSudE9TWMA/VKFd71+a4BK2awr4rxvc+833KsWb4Nj
mlwGyJ6pAVl0C8sHiEB7S137vCvcZXItWsFYYcC1AiaF2EhhIMfOXETgdN3SSo6UqiKMrHRNyS5M
HNVzM5DYTMspCIFw7JznbakVdEK8W4Fte/xLWFj3z5k6QYugwkTsy9HhIvtxrGsQUZpw/pOuoj/y
WMihLfSYlxYYGBPkvL/cNx7qWY+efC2cP9CLo/ZaSf3eXt2iz2TVKTttRbQqSzqz+LxQ+pn1bcxr
4dgF8yJIFjzP3B+qBCTwjTDXwDAZD/d+pOSqlJwzttbriLzfOV+qFPTlQmiHEdAqJa2TbWnyHQQI
7y9qqvnUVntVAH420U69++/4Hq1SFhJVQ1NpODCOWhna07GenzYorien9c8CSH3rMWwvDVAGZGnF
hM4=
=zmPS
-----END PGP SIGNATURE-----

--------------n4XmWhFeVRTENNAUCDfjcF2G--
