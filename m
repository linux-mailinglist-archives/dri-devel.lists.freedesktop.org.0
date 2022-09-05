Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB65ACD6D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8BF10E209;
	Mon,  5 Sep 2022 08:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8571410E209
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:09:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 461175FC08;
 Mon,  5 Sep 2022 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662365369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o6Rk5ALDqwlE94C3Voh82QcVjOVhQ+ciXULHNmvzoUk=;
 b=kRV09M5jju9eFDIPZxeRoTdR+Ed3uiTX68nBvPK92nMWToIs6X8KiWgOe5kiqNnq3Dv1cJ
 O5yRddh4iShYZYWF8OCNJlMhdXDP/n9N8Jw5Bw+VxJC9a0gqTUS8FP3A1lL6wgl4H+UQUo
 ch7v+NyqBx7p3h8gkT8/107f/nNKgjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662365369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o6Rk5ALDqwlE94C3Voh82QcVjOVhQ+ciXULHNmvzoUk=;
 b=2OoZLn/910ccBQX+mLoGzu9FsXcmJZQW2hpLJfcICDOqMj92Tg35bDoNpQ4wg6SZP6WePj
 wCGPMt7rFLL+eDDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FA6413A66;
 Mon,  5 Sep 2022 08:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XNexCrmuFWMVAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:09:29 +0000
Message-ID: <d7abbe06-6e0b-0939-a162-2583d7600b83@suse.de>
Date: Mon, 5 Sep 2022 10:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 07/12] drm/udl: Add parameter to set number of URBs
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-8-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-8-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PdPzT4DBtzO7K33JqmtzXQqx"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PdPzT4DBtzO7K33JqmtzXQqx
Content-Type: multipart/mixed; boundary="------------ZCIfbFQZfOMQBZ12ufSuK08k";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d7abbe06-6e0b-0939-a162-2583d7600b83@suse.de>
Subject: Re: [PATCH 07/12] drm/udl: Add parameter to set number of URBs
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-8-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-8-tiwai@suse.de>

--------------ZCIfbFQZfOMQBZ12ufSuK08k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEZy
b206IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gRm9y
IGZ1cnRoZXIgZGVidWdnaW5nIGFuZCBvcHRpbWl6YXRpb24gcHVycG9zZSwgYWxsb3cgdXNl
cnMgdG8gYWRqdXN0DQo+IHRoZSBudW1iZXIgb2YgVVJCcyB2aWEgYSBuZXcgbW9kdWxlIHBh
cmFtZXRlciwgbnVtdXJicy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3
YWkgPHRpd2FpQHN1c2UuZGU+DQoNCkkgbWFkZSB0aGlzIHBhdGNoIGZvciBkZWJ1Z2dpbmcs
IGJ1dCBJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBiZSBhZGRlZCB0byANCnRoZSB1cHN0cmVh
bSBrZXJuZWwuIFBsZWFzZSBkb24ndCBtZXJnZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgfCA5ICsrKysr
KysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gaW5kZXggMmI3ZWFmZDQ4ZWMy
Li4zYzk3ZjY0Nzg4M2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gQEAg
LTgsNiArOCw4IEBADQo+ICAgICogQ29weXJpZ2h0IChDKSAyMDA5IEJlcm5pZSBUaG9tcHNv
biA8YmVybmllQHBsdWdhYmxlLmNvbT4NCj4gICAgKi8NCj4gICANCj4gKyNpbmNsdWRlIDxs
aW51eC9tb2R1bGVwYXJhbS5oPg0KPiArDQo+ICAgI2luY2x1ZGUgPGRybS9kcm0uaD4NCj4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3By
b2JlX2hlbHBlci5oPg0KPiBAQCAtMjMsNiArMjUsOSBAQA0KPiAgICNkZWZpbmUgV1JJVEVT
X0lOX0ZMSUdIVCAoMjApDQo+ICAgI2RlZmluZSBNQVhfVkVORE9SX0RFU0NSSVBUT1JfU0la
RSAyNTYNCj4gICANCj4gK3N0YXRpYyB1aW50IHVkbF9udW1fdXJicyA9IFdSSVRFU19JTl9G
TElHSFQ7DQo+ICttb2R1bGVfcGFyYW1fbmFtZWQobnVtdXJicywgdWRsX251bV91cmJzLCB1
aW50LCAwNjAwKTsNCj4gKw0KPiAgIHN0YXRpYyBpbnQgdWRsX3BhcnNlX3ZlbmRvcl9kZXNj
cmlwdG9yKHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgdXNi
X2RldmljZSAqdWRldiA9IHVkbF90b191c2JfZGV2aWNlKHVkbCk7DQo+IEBAIC0yOTQsNiAr
Mjk5LDggQEAgaW50IHVkbF9pbml0KHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpDQo+ICAgCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmdWRsLT5kcm07DQo+ICAgCWludCByZXQgPSAtRU5P
TUVNOw0KPiAgIA0KPiArCWRybV9pbmZvKGRldiwgInByZS1hbGxvY2F0aW5nICVkIFVSQnNc
biIsIHVkbF9udW1fdXJicyk7DQo+ICsNCj4gICAJRFJNX0RFQlVHKCJcbiIpOw0KPiAgIA0K
PiAgIAl1ZGwtPmRtYWRldiA9IHVzYl9pbnRmX2dldF9kbWFfZGV2aWNlKHRvX3VzYl9pbnRl
cmZhY2UoZGV2LT5kZXYpKTsNCj4gQEAgLTMxMSw3ICszMTgsNyBAQCBpbnQgdWRsX2luaXQo
c3RydWN0IHVkbF9kZXZpY2UgKnVkbCkNCj4gICAJaWYgKHVkbF9zZWxlY3Rfc3RkX2NoYW5u
ZWwodWRsKSkNCj4gICAJCURSTV9FUlJPUigiU2VsZWN0aW5nIGNoYW5uZWwgZmFpbGVkXG4i
KTsNCj4gICANCj4gLQlpZiAoIXVkbF9hbGxvY191cmJfbGlzdChkZXYsIFdSSVRFU19JTl9G
TElHSFQsIE1BWF9UUkFOU0ZFUikpIHsNCj4gKwlpZiAoIXVkbF9hbGxvY191cmJfbGlzdChk
ZXYsIHVkbF9udW1fdXJicywgTUFYX1RSQU5TRkVSKSkgew0KPiAgIAkJRFJNX0VSUk9SKCJ1
ZGxfYWxsb2NfdXJiX2xpc3QgZmFpbGVkXG4iKTsNCj4gICAJCWdvdG8gZXJyOw0KPiAgIAl9
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ZCIfbFQZfOMQBZ12ufSuK08k--

--------------PdPzT4DBtzO7K33JqmtzXQqx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVrrgFAwAAAAAACgkQlh/E3EQov+C9
2A/+Mfe4AnRxK1eStWNIc5kMWU7Gow1Gm+LfXj8dDpl25EOjQgG1iPvnKywdMzboycQW9h1LDXPc
QjIiHpaSgAXj0JPLpBvoEqG/Q7a40OecAu/YrRrlF14K50SIOGb49xxL6emG9pRgbZe3ix0UDW74
Vu//X59ldjkqNOQ//0iv/jJmzdPYyOgNoDwqqvSZJz8Tg9JQ5eBu5KAg9gOuuJCP/IBk34tB+SUE
k95mED+tAGxb2h58+Hr9iGwtVexDEQCP7hLvWwRAbkMpjhZqj83C7Udz+Wo9GmH0mt4fAy5VeHJp
eISvSh4bnrQR0tHP1ASTB9FpwitE9vHjpG1Y6MDI0YTjUxjs0b6nlwMLk/GOxdewXKvi/Sf7sBwp
9KP20WhbANKBtHNybC3Qvl3fW8G/vV7WtLr40a7G9Uk/zhuliTQ4kBagmznqaTbffBLIhUosc8Wz
ui4WGl0rE2HzyZFhN+UNGVI8/fFrarZXgYGkLUPwimLI9intEaQ4NbYwGEu+fILpLBv+9NZkL7UN
cIrj1IRj57HUr+wQSdUrtyjZae1ib4GVn5cI/mNkfCbjmbcDqkMGzSot5fh/sdoZfn2PZXtmGsms
ixKWL7B1orBvX5bQ9jZN/rFV08gBMBdxUju/xgR2yb+0YNU698ufV0i64J2m8gyjRkDkMm8g6dc/
/Kw=
=OMuU
-----END PGP SIGNATURE-----

--------------PdPzT4DBtzO7K33JqmtzXQqx--
