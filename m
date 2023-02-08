Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475F68ECBD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED710E4BD;
	Wed,  8 Feb 2023 10:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58C10E71E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 10:25:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1197A341CB;
 Wed,  8 Feb 2023 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675851902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7dRR9WnRqpA4M6r3Znn+/2TFDS5J/sWCxNtqlP+T3I=;
 b=OvR3w6/w4Gb0StpcBppEmsa335+rE+7geBgj5a+lmWm55T9jcA/ns8haCu5ucL8qhJsZ66
 cgFRZRX+rpTlY/tt1kcW1akApu91JR00yD0yDFAM6wsPfHXn2l13t/QB8O9hPhzHLh3Exo
 3c9wBYe+1tucQJsmpSx+nT9PeDnHz5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675851902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7dRR9WnRqpA4M6r3Znn+/2TFDS5J/sWCxNtqlP+T3I=;
 b=ZSuz4aLoDMI6rZe7+CxmVJ0VZ36l7T/YQSs544fJd/R0usJNEIvXlKLW6JYU7aH+/ng/yb
 EDVmIggT7MuGiQCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1F7B13425;
 Wed,  8 Feb 2023 10:25:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bv46Nn1442PNMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Feb 2023 10:25:01 +0000
Message-ID: <7eee1f67-c429-a15d-807b-27f1d28c05c8@suse.de>
Date: Wed, 8 Feb 2023 11:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
References: <20230129082856.22113-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v5CsBgs3eR0Zu6WZ0AO8wEy0"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v5CsBgs3eR0Zu6WZ0AO8wEy0
Content-Type: multipart/mixed; boundary="------------S5p5pXkzr835fgB9JljMj1Bf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Message-ID: <7eee1f67-c429-a15d-807b-27f1d28c05c8@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
References: <20230129082856.22113-1-tiwai@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>

--------------S5p5pXkzr835fgB9JljMj1Bf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoaXMgYnVnIGNvdWxkIGJlIGEgc3ltcHRvbSBvZiB0aGUgcHJvYmxlbSByZXBv
cnRlZCBhdCBbMV0uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9DQU0walNIT2N2Wm95di15NmJudkZhVXliUlFz
RHhfbWZPeWRMMXVhTk00VDRQZ2NBPUFAbWFpbC5nbWFpbC5jb20vVC8jbWZiZWY0ZGY5YjQ5
ZmM1ZmRhOWJjZmEyNmRiNWNhMTNjZGFlZjZkN2UNCg0KQW0gMjkuMDEuMjMgdW0gMDk6Mjgg
c2NocmllYiBUYWthc2hpIEl3YWk6DQo+IFdoZW4gYSBmYmRldiB3aXRoIGRlZmVycmVkIEkv
TyBpcyBvbmNlIG9wZW5lZCBhbmQgY2xvc2VkLCB0aGUgZGlydHkNCj4gcGFnZXMgc3RpbGwg
cmVtYWluIHF1ZXVlZCBpbiB0aGUgcGFnZXJlZiBsaXN0LCBhbmQgZXZlbnR1YWxseSBsYXRl
cg0KPiB0aG9zZSBtYXkgYmUgcHJvY2Vzc2VkIGluIHRoZSBkZWxheWVkIHdvcmsuICBUaGlz
IG1heSBsZWFkIHRvIGENCj4gY29ycnVwdGlvbiBvZiBwYWdlcywgaGl0dGluZyBhbiBPb3Bz
Lg0KPiANCj4gVGhpcyBwYXRjaCBtYWtlcyBzdXJlIHRvIGNhbmNlbCB0aGUgZGVsYXllZCB3
b3JrIGFuZCBjbGVhbiB1cCB0aGUNCj4gcGFnZXJlZiBsaXN0IGF0IGNsb3NpbmcgdGhlIGRl
dmljZSBmb3IgYWRkcmVzc2luZyB0aGUgYnVnLiAgQSBwYXJ0IG9mDQo+IHRoZSBjbGVhbnVw
IGNvZGUgaXMgZmFjdG9yZWQgb3V0IGFzIGEgbmV3IGhlbHBlciBmdW5jdGlvbiB0aGF0IGlz
DQo+IGNhbGxlZCBmcm9tIHRoZSBjb21tb24gZmJfcmVsZWFzZSgpLg0KPiANCj4gUmV2aWV3
ZWQtYnk6IFBhdHJpayBKYWtvYnNzb24gPHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb20+
DQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogVGFr
YXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiAtLS0NCj4gdjEtPnYyOiBGaXggYnVpbGQg
ZXJyb3Igd2l0aG91dCBDT05GSUdfRkJfREVGRVJSRURfSU8NCj4gDQo+ICAgZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMgfCAxMCArKysrKysrKystDQo+ICAgZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgICAgfCAgNCArKysrDQo+ICAgaW5jbHVkZS9s
aW51eC9mYi5oICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiBpbmRleCBjNzMwMjUzYWI4NWMuLjU4M2NiY2YwOTQ0
NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMN
Cj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4gQEAgLTMx
Myw3ICszMTMsNyBAQCB2b2lkIGZiX2RlZmVycmVkX2lvX29wZW4oc3RydWN0IGZiX2luZm8g
KmluZm8sDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKGZiX2RlZmVycmVkX2lvX29w
ZW4pOw0KPiAgIA0KPiAtdm9pZCBmYl9kZWZlcnJlZF9pb19jbGVhbnVwKHN0cnVjdCBmYl9p
bmZvICppbmZvKQ0KPiArdm9pZCBmYl9kZWZlcnJlZF9pb19yZWxlYXNlKHN0cnVjdCBmYl9p
bmZvICppbmZvKQ0KPiAgIHsNCj4gICAJc3RydWN0IGZiX2RlZmVycmVkX2lvICpmYmRlZmlv
ID0gaW5mby0+ZmJkZWZpbzsNCj4gICAJc3RydWN0IHBhZ2UgKnBhZ2U7DQo+IEBAIC0zMjcs
NiArMzI3LDE0IEBAIHZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51cChzdHJ1Y3QgZmJfaW5m
byAqaW5mbykNCj4gICAJCXBhZ2UgPSBmYl9kZWZlcnJlZF9pb19wYWdlKGluZm8sIGkpOw0K
PiAgIAkJcGFnZS0+bWFwcGluZyA9IE5VTEw7DQo+ICAgCX0NCj4gK30NCj4gK0VYUE9SVF9T
WU1CT0xfR1BMKGZiX2RlZmVycmVkX2lvX3JlbGVhc2UpOw0KPiArDQo+ICt2b2lkIGZiX2Rl
ZmVycmVkX2lvX2NsZWFudXAoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICt7DQo+ICsJc3Ry
dWN0IGZiX2RlZmVycmVkX2lvICpmYmRlZmlvID0gaW5mby0+ZmJkZWZpbzsNCj4gKw0KPiAr
CWZiX2RlZmVycmVkX2lvX3JlbGVhc2UoaW5mbyk7DQo+ICAgDQo+ICAgCWt2ZnJlZShpbmZv
LT5wYWdlcmVmcyk7DQo+ICAgCW11dGV4X2Rlc3Ryb3koJmZiZGVmaW8tPmxvY2spOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiBpbmRleCAzYTZjODQ1OGViOGQuLmFiMzU0
NWEwMGFiYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gQEAgLTE0
NTQsNiArMTQ1NCwxMCBAQCBfX3JlbGVhc2VzKCZpbmZvLT5sb2NrKQ0KPiAgIAlzdHJ1Y3Qg
ZmJfaW5mbyAqIGNvbnN0IGluZm8gPSBmaWxlLT5wcml2YXRlX2RhdGE7DQo+ICAgDQo+ICAg
CWxvY2tfZmJfaW5mbyhpbmZvKTsNCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19GQl9ERUZF
UlJFRF9JTykNCj4gKwlpZiAoaW5mby0+ZmJkZWZpbykNCj4gKwkJZmJfZGVmZXJyZWRfaW9f
cmVsZWFzZShpbmZvKTsNCj4gKyNlbmRpZg0KPiAgIAlpZiAoaW5mby0+ZmJvcHMtPmZiX3Jl
bGVhc2UpDQo+ICAgCQlpbmZvLT5mYm9wcy0+ZmJfcmVsZWFzZShpbmZvLDEpOw0KPiAgIAlt
b2R1bGVfcHV0KGluZm8tPmZib3BzLT5vd25lcik7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gaW5kZXggOTZiOTYzMjNlOWNi
Li43M2ViMWY4NWVhOGUgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0KPiAr
KysgYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gQEAgLTY2Miw2ICs2NjIsNyBAQCBleHRlcm4g
aW50ICBmYl9kZWZlcnJlZF9pb19pbml0KHN0cnVjdCBmYl9pbmZvICppbmZvKTsNCj4gICBl
eHRlcm4gdm9pZCBmYl9kZWZlcnJlZF9pb19vcGVuKHN0cnVjdCBmYl9pbmZvICppbmZvLA0K
PiAgIAkJCQlzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiAgIAkJCQlzdHJ1Y3QgZmlsZSAqZmls
ZSk7DQo+ICtleHRlcm4gdm9pZCBmYl9kZWZlcnJlZF9pb19yZWxlYXNlKHN0cnVjdCBmYl9p
bmZvICppbmZvKTsNCj4gICBleHRlcm4gdm9pZCBmYl9kZWZlcnJlZF9pb19jbGVhbnVwKHN0
cnVjdCBmYl9pbmZvICppbmZvKTsNCj4gICBleHRlcm4gaW50IGZiX2RlZmVycmVkX2lvX2Zz
eW5jKHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qgc3RhcnQsDQo+ICAgCQkJCWxvZmZfdCBl
bmQsIGludCBkYXRhc3luYyk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------S5p5pXkzr835fgB9JljMj1Bf--

--------------v5CsBgs3eR0Zu6WZ0AO8wEy0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPjeH0FAwAAAAAACgkQlh/E3EQov+Ax
oRAAgU7bhI5UC/lBlIpKhYe+KyV2VS6bOKXttffbkdjlBIhlZUE+XdBcAe2pGYvV9OOj+uhtJypl
WDw/iqcfi3oNzHd78kgVTWaYQrtnA6SlO8YRfGBVsAQ/spjq1hzLFyLLL8x54uCzaxnjxcg5qJkl
HgO0+dnqg1fofzZicEfz0w5Dia824IHlaawF/QrplpIAMmZ4w+2VPadA+5XVkyqlPAO2Bxi0Fv5g
zG1HEHoeg1uubLiBevAD4vDsmAnf9w0vJ3gmKL6ao57LXPfP+kX1Br9IOq0+dEk17MEJNJb+pVO9
IBh1uzqdnubWBKye/iarsdg+v/RhfiWKL0PKsMfx3CQmMLoE3jm8P3/clvCsjJPfKOUxk+PBCDJl
3/eqPQ0PJUyAG3YNbmWYOVFPpJae+cFFlh9XNwn3a1Nv/JWWtWI2qVTYJLebdgIPMzrnXwA0thIO
AtgjQMqFWeTwTYjECrhvJbUdsN6izzdNL0Y9ZWu9dV/sD8ppBiV/eK3ZIC6xxGiBOH29EZEVjVXl
3S+vwmhF2LpnfuOQAZmnslrzpNCWaKYYhIgiU7Fk7Fpbpo1I2C6DqQ+IYbzpLh+Z0FSjMIojIQE/
4rFXHtqph7xXgSa/FUU9uebgSTsd9NAJ+NRR13e/BKn7zKbLRyOMalkbeiox3vXhkys2vv1aCFNd
u9A=
=BLzs
-----END PGP SIGNATURE-----

--------------v5CsBgs3eR0Zu6WZ0AO8wEy0--
