Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E85B47DF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 20:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E020210E231;
	Sat, 10 Sep 2022 18:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E2010E231
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 18:11:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 539F92282E;
 Sat, 10 Sep 2022 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662833485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6UCnH+5b7J8QcaxQduLbCitDQV4To+pDJ7A+kcfIag4=;
 b=N9qDJgkljr8gasfl+S4Ju1yVDMHRlWge1MRHhQsisvYEMSkOHAfNtruTbmNKnGDqm6BJh9
 62xKP6XS3dsUDafzOwckgQmdIcu4kHcLD7qTUSjV20jO05nt1OnL2aozxhHYf7a1fzOwp5
 Epi6uPQc/WbdXDbLubEIsmFGqGHuqXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662833485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6UCnH+5b7J8QcaxQduLbCitDQV4To+pDJ7A+kcfIag4=;
 b=lFRwSMUgedQGMsJ0NuCBHpIV6bZ0A42eIAlRf8B4ZGDrzjbUS2kia2t1FT3v0sgOuaUwos
 1oxA4Y3vPJmFQKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23696133B7;
 Sat, 10 Sep 2022 18:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fn/HB03THGNZBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 10 Sep 2022 18:11:25 +0000
Message-ID: <14302178-c797-8635-4325-070f78b7f805@suse.de>
Date: Sat, 10 Sep 2022 20:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
Content-Language: en-US
To: Saurabh Sengar <ssengar@linux.microsoft.com>, ssengar@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n3RoxP0YamBvEOHUprK5slXD"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n3RoxP0YamBvEOHUprK5slXD
Content-Type: multipart/mixed; boundary="------------yyhwzZbDnmmgJCE0ens3rj6y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, ssengar@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com
Message-ID: <14302178-c797-8635-4325-070f78b7f805@suse.de>
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>

--------------yyhwzZbDnmmgJCE0ens3rj6y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDkuMjIgdW0gMTY6NDMgc2NocmllYiBTYXVyYWJoIFNlbmdhcjoNCj4g
aHlwZXJ2X3NldHVwX3ZyYW0gdHJpZXMgdG8gcmVtb3ZlIGNvbmZsaWN0aW5nIGZyYW1lYnVm
ZmVyIGJhc2VkIG9uDQo+ICdzY3JlZW5faW5mbycuIEFzIG9ic2VydmVkIGluIHBhc3QgZHVl
IHRvIHNvbWUgYnVnIG9yIHdyb25nIHNldHRpbmcNCj4gaW4gZ3J1YiwgdGhlICdzY3JlZW5f
aW5mbycgZmllbGRzIG1heSBub3QgYmUgc2V0IGZvciBHZW4xLCBhbmQgaW4gc3VjaA0KPiBj
YXNlcyBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyB3aWxs
IG5vdCBkbyBhbnl0aGluZw0KPiB1c2VmdWwuDQo+IEZvciBHZW4xIFZNcywgaXQgc2hvdWxk
IGFsd2F5cyBiZSBwb3NzaWJsZSB0byBnZXQgZnJhbWVidWZmZXINCj4gY29uZmxpY3QgcmVt
b3ZlZCB1c2luZyBQQ0kgZGV2aWNlIGluc3RlYWQuDQo+IA0KPiBGaXhlczogYTBhYjVhYmNl
ZDU1ICgiZHJtL2h5cGVydiA6IFJlbW92aW5nIHRoZSByZXN0cnVjdGlvbiBvZiBWUkFNIGFs
bG9jYXRpb24gd2l0aCBQQ0kgYmFyIHNpemUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBTYXVyYWJo
IFNlbmdhciA8c3NlbmdhckBsaW51eC5taWNyb3NvZnQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1fZHJ2LmMgfCAyNCArKysrKysrKysrKysr
KysrKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2
L2h5cGVydl9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1f
ZHJ2LmMNCj4gaW5kZXggNmQxMWU3OTM4YzgzLi5iMGNjOTc0ZWZhNDUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1fZHJ2LmMNCj4gQEAgLTczLDEyICs3
MywyOCBAQCBzdGF0aWMgaW50IGh5cGVydl9zZXR1cF92cmFtKHN0cnVjdCBoeXBlcnZfZHJt
X2RldmljZSAqaHYsDQo+ICAgCQkJICAgICBzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2KQ0KPiAg
IHsNCj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZodi0+ZGV2Ow0KPiArCXN0cnVj
dCBwY2lfZGV2ICpwZGV2Ow0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAtCWRybV9hcGVydHVy
ZV9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHNjcmVlbl9pbmZvLmxmYl9iYXNl
LA0KPiAtCQkJCQkJICAgICBzY3JlZW5faW5mby5sZmJfc2l6ZSwNCj4gLQkJCQkJCSAgICAg
ZmFsc2UsDQo+IC0JCQkJCQkgICAgICZoeXBlcnZfZHJpdmVyKTsNCj4gKwlpZiAoZWZpX2Vu
YWJsZWQoRUZJX0JPT1QpKSB7DQo+ICsJCWRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rp
bmdfZnJhbWVidWZmZXJzKHNjcmVlbl9pbmZvLmxmYl9iYXNlLA0KPiArCQkJCQkJCSAgICAg
c2NyZWVuX2luZm8ubGZiX3NpemUsDQoNClVzaW5nIHNjcmVlbl9pbmZvIGhlcmUgc2VlbXMg
d3JvbmcgaW4gYW55IGNhc2UuIFlvdSB3YW50IHRvIHJlbW92ZSB0aGUgDQpmcmFtZWJ1ZmZl
ciBkZXZpY2VzIHRoYXQgY29uZmxpY3Qgd2l0aCB5b3VyIGRyaXZlciwgd2hpY2ggbWlnaHQg
YmUgDQp1bnJlbGF0ZWQgdG8gc2NyZWVuX2luZm8uIEFGQUlDVCB0aGUgY29ycmVjdCBzb2x1
dGlvbiB3b3VsZCBhbHdheXMgDQpyZXRyaWV2ZSB0aGUgUENJIGRldmljZSBmb3IgcmVtb3Zh
bCAoaS5lLiwgYWx3YXlzIGRvIHRoZSBlbHNlIGJyYW5jaCkuDQoNCkJlc3QgcmVnYXJkDQpU
aG9tYXMNCg0KPiArCQkJCQkJCSAgICAgZmFsc2UsDQo+ICsJCQkJCQkJICAgICAmaHlwZXJ2
X2RyaXZlcik7DQo+ICsJfSBlbHNlIHsNCj4gKwkJcGRldiA9IHBjaV9nZXRfZGV2aWNlKFBD
SV9WRU5ET1JfSURfTUlDUk9TT0ZULCBQQ0lfREVWSUNFX0lEX0hZUEVSVl9WSURFTywgTlVM
TCk7DQo+ICsJCWlmICghcGRldikgew0KPiArCQkJZHJtX2VycihkZXYsICJVbmFibGUgdG8g
ZmluZCBQQ0kgSHlwZXItViB2aWRlb1xuIik7DQo+ICsJCQlyZXR1cm4gLUVOT0RFVjsNCj4g
KwkJfQ0KPiArDQo+ICsJCXJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rpbmdf
cGNpX2ZyYW1lYnVmZmVycyhwZGV2LCAmaHlwZXJ2X2RyaXZlcik7DQo+ICsJCXBjaV9kZXZf
cHV0KHBkZXYpOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlkcm1fZXJyKGRldiwgIk5vdCBh
YmxlIHRvIHJlbW92ZSBib290IGZiXG4iKTsNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJCX0N
Cj4gKwl9DQo+ICAgDQo+ICAgCWh2LT5mYl9zaXplID0gKHVuc2lnbmVkIGxvbmcpaHYtPm1t
aW9fbWVnYWJ5dGVzICogMTAyNCAqIDEwMjQ7DQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------yyhwzZbDnmmgJCE0ens3rj6y--

--------------n3RoxP0YamBvEOHUprK5slXD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMc00wFAwAAAAAACgkQlh/E3EQov+C5
1g//crmmOE4lqZdtNDgRfZACe1ffCyw4RK1uKp6Ag08jwd0Cp9KOUSokkNULTqYxGU1iM4zaxRgp
5k9nlqAaaRTaNKsNdQc/8XXbtKzk+QSLySo0p3aVz/lPYlGYma5p4htjZrRj9yIT4DppZFLkSuTz
wTnQOBwU7v77t5GeaNV3a/wdwnn4xJ49rpetKERtjtIZHdARMdhvK6z4seeFfMysOb2PcznlOhB2
+/eW5+uU4f3uwe0YSoy5ihVOta/IYwO87zOgMEqaqYnHK1PozLEAndxGl5E69wc1JF0UxGffOdxB
dhow7adOUuvbqih+E31WshS616sWzczEJNNODs5V4o4pYWlh3VLS2FKjA3wgpSN8Tb69sbyrv1OL
5aIitRybyPPHMED9BtE8x9H3ILUoiBJ+RQJ3b1lH12U3pKZapOx/ZvtlRCZeYj6JyjoHZrt0TN6J
u634IMQcH1Q/V5qtPya/ej/RCuFtYqKT2WuEen0OKvOI2NPN+soYpAusHk3X6KdGxLsvmFlYbVw2
JOvofL4Igc8Oecr871p68Z2rf1zo8w2wgtaiVlxWJlkXiJnnaAuPKnP5BaCBMWeI+uXdh8wueZD9
lL1G62wDY04XN2sHfUOrUaJQR+y7MIAr+kqWOnJmveBVtbd0xOmAZeIBFM8IfeBBWsaNOtHNTjxG
3Gs=
=el/k
-----END PGP SIGNATURE-----

--------------n3RoxP0YamBvEOHUprK5slXD--
