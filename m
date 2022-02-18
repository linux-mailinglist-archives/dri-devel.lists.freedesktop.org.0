Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F454BB602
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8A210EEF5;
	Fri, 18 Feb 2022 09:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14D510EEF5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:57:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31DFF1F383;
 Fri, 18 Feb 2022 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645178254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meHXPrizPyCIEzFx7pcREbA6tkmm7SE3B2g/xsTKkOA=;
 b=bfr91BoF3RgLC/XuIYXAKcQZvo/5W4/c9b+O/QthcAZIti5QY4vMFWoI6q/NvPJrrW5P68
 aa5N1ZGskApJH6hGZiKneH1RJhoF7pGy7ABe95hi65yPZjfZgGwcaT7cgcSEcGUt2pnvSk
 JPtX4uhfTRywZT/dJBZqzrZBqHrwcYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645178254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meHXPrizPyCIEzFx7pcREbA6tkmm7SE3B2g/xsTKkOA=;
 b=2okevh2hNmK62/Hpzu0J2NWSA1jn6WRze/gKWdqn7IsOYoMXH+CAb/3zTlMW6MotAX6gzL
 bye2d8F61V9rS3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEB7B13C53;
 Fri, 18 Feb 2022 09:57:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9V+DLY1tD2LAeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Feb 2022 09:57:33 +0000
Message-ID: <4c6e1d15-3bb3-5a69-972f-592cc33ac0cd@suse.de>
Date: Fri, 18 Feb 2022 10:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
Content-Language: en-US
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20220218093334.24830-1-msuchanek@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220218093334.24830-1-msuchanek@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JYUW0XBHt0CzH6KJ0KeaIqyV"
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
Cc: x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Martin Mares <mj@ucw.cz>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Maxime Ripard <maxime@cerno.tech>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-video@atrey.karlin.mff.cuni.cz,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JYUW0XBHt0CzH6KJ0KeaIqyV
Content-Type: multipart/mixed; boundary="------------6m9UmIRdykpjFkIQiBQka1kg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Martin Mares <mj@ucw.cz>,
 linux-video@atrey.karlin.mff.cuni.cz, Daniel Mack <daniel@zonque.org>
Message-ID: <4c6e1d15-3bb3-5a69-972f-592cc33ac0cd@suse.de>
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
References: <20220218093334.24830-1-msuchanek@suse.de>
In-Reply-To: <20220218093334.24830-1-msuchanek@suse.de>

--------------6m9UmIRdykpjFkIQiBQka1kg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWljaGFsDQoNCkFtIDE4LjAyLjIyIHVtIDEwOjMzIHNjaHJpZWIgTWljaGFsIFN1Y2hh
bmVrOg0KPiBTaW5jZSBzd2l0Y2ggdG8gc2ltcGxlZHJtIFZFU0EgZ3JhcGhpYyBtb2RlcyBh
cmUgbm8gbG9uZ2VyIGF2YWlsYWJsZQ0KPiB3aXRoIGxlZ2FjeSBCSU9TLg0KPiANCj4gVGhl
IHg4NiByZWFsbW9kZSBib290IGNvZGUgZW5hYmxlcyB0aGUgVkVTQSBncmFwaGljIG1vZGVz
IHdoZW4gb3B0aW9uDQo+IEZCX0JPT1RfVkVTQV9TVVBQT1JUIGlzIGVuYWJsZWQuDQo+IA0K
PiBUbyBlbmFibGUgdXNlIG9mIFZFU0EgbW9kZXMgd2l0aCBzaW1wbGVkcm0gaW4gbGVnYWN5
IEJJT1MgYm9vdCBtb2RlIGRyb3ANCj4gZGVwZW5kZW5jeSBvZiBCT09UX1ZFU0FfU1VQUE9S
VCBvbiBGQiwgYWxzbyBkcm9wIHRoZSBGQl8gcHJlZml4LCBhbmQNCj4gc2VsZWN0IHRoZSBv
cHRpb24gd2hlbiBzaW1wbGVkcm0gaXMgYnVpbHQtaW4gb24geDg2Lg0KDQpUaGFua3MgZm9y
IHNlbmRpbmcgdGhlIHBhdGNoLg0KDQpJIHRlc3RlZCBzaW1wbGVkcm0gb24gYSBWRVNBLWJh
c2VkIHN5c3RlbXMgYW5kIGl0IHdvcmsuIERvIHlvdSBoYXZlIGEgDQpjb25jcmV0ZSBleGFt
cGxlIG9mIGEgbW9kZSB0aGF0IGRvZXNuJ3Qgd29yayBhbnkgbG9uZ2VyPw0KDQo+IA0KPiBG
aXhlczogMTFlOGY1ZmQyMjNiICgiZHJtOiBBZGQgc2ltcGxlZHJtIGRyaXZlciIpDQo+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+DQo+IC0t
LQ0KPiAgIGFyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jICAgfCA0ICsrLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vdGlueS9LY29uZmlnIHwgMSArDQo+ICAgZHJpdmVycy92aWRlby9mYmRl
di9LY29uZmlnICB8IDkgKysrKy0tLS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
Ym9vdC92aWRlby12ZXNhLmMgYi9hcmNoL3g4Ni9ib290L3ZpZGVvLXZlc2EuYw0KPiBpbmRl
eCA3ZTE4NTk3N2E5ODQuLmMyYzZkMzVlM2E0MyAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYv
Ym9vdC92aWRlby12ZXNhLmMNCj4gKysrIGIvYXJjaC94ODYvYm9vdC92aWRlby12ZXNhLmMN
Cj4gQEAgLTgzLDcgKzgzLDcgQEAgc3RhdGljIGludCB2ZXNhX3Byb2JlKHZvaWQpDQo+ICAg
CQkJICAgKHZtaW5mby5tZW1vcnlfbGF5b3V0ID09IDQgfHwNCj4gICAJCQkgICAgdm1pbmZv
Lm1lbW9yeV9sYXlvdXQgPT0gNikgJiYNCj4gICAJCQkgICB2bWluZm8ubWVtb3J5X3BsYW5l
cyA9PSAxKSB7DQo+IC0jaWZkZWYgQ09ORklHX0ZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+ICsj
aWZkZWYgQ09ORklHX0JPT1RfVkVTQV9TVVBQT1JUDQo+ICAgCQkJLyogR3JhcGhpY3MgbW9k
ZSwgY29sb3IsIGxpbmVhciBmcmFtZSBidWZmZXINCj4gICAJCQkgICBzdXBwb3J0ZWQuICBP
bmx5IHJlZ2lzdGVyIHRoZSBtb2RlIGlmDQo+ICAgCQkJICAgaWYgZnJhbWVidWZmZXIgaXMg
Y29uZmlndXJlZCwgaG93ZXZlciwNCj4gQEAgLTEyMSw3ICsxMjEsNyBAQCBzdGF0aWMgaW50
IHZlc2Ffc2V0X21vZGUoc3RydWN0IG1vZGVfaW5mbyAqbW9kZSkNCj4gICAJaWYgKCh2bWlu
Zm8ubW9kZV9hdHRyICYgMHgxNSkgPT0gMHgwNSkgew0KPiAgIAkJLyogSXQncyBhIHN1cHBv
cnRlZCB0ZXh0IG1vZGUgKi8NCj4gICAJCWlzX2dyYXBoaWMgPSAwOw0KPiAtI2lmZGVmIENP
TkZJR19GQl9CT09UX1ZFU0FfU1VQUE9SVA0KPiArI2lmZGVmIENPTkZJR19CT09UX1ZFU0Ff
U1VQUE9SVA0KPiAgIAl9IGVsc2UgaWYgKCh2bWluZm8ubW9kZV9hdHRyICYgMHg5OSkgPT0g
MHg5OSkgew0KPiAgIAkJLyogSXQncyBhIGdyYXBoaWNzIG1vZGUgd2l0aCBsaW5lYXIgZnJh
bWUgYnVmZmVyICovDQo+ICAgCQlpc19ncmFwaGljID0gMTsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9LY29u
ZmlnDQo+IGluZGV4IDcxMmUwMDA0ZTk2ZS4uMWJjMzBjNjRlZDE1IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGlueS9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90aW55L0tjb25maWcNCj4gQEAgLTU0LDYgKzU0LDcgQEAgY29uZmlnIERSTV9HTTEyVTMy
MA0KPiAgIGNvbmZpZyBEUk1fU0lNUExFRFJNDQo+ICAgCXRyaXN0YXRlICJTaW1wbGUgZnJh
bWVidWZmZXIgZHJpdmVyIg0KPiAgIAlkZXBlbmRzIG9uIERSTSAmJiBNTVUNCj4gKwlzZWxl
Y3QgQk9PVF9WRVNBX1NVUFBPUlQgaWYgWDg2ICYmIERSTV9TSU1QTEVEUk0gPSB5DQoNCldl
IHNob3VsZG4ndCBzZWxlY3QgdGhpcyBvcHRpb24gaW4gZHJpdmVycyBJTUhPLiBTaW1wbGUt
ZnJhbWVidWZmZXIgDQpkZXZpY2VzIHdpdGggVkVTQSBhcmUgZW5hYmxlZCB3aXRoIFsxXSBh
bmQgdGhhdCBzaG91bGQgYWxzbyBzZWxlY3QgdGhlIA0KQk9PVF9WRVNBX1NVUFBPUlQuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjE2LjEwL3NvdXJjZS9kcml2ZXJzL2Zpcm13YXJlL0tjb25maWcjTDIy
NA0KDQo+ICAgCXNlbGVjdCBEUk1fR0VNX1NITUVNX0hFTFBFUg0KPiAgIAlzZWxlY3QgRFJN
X0tNU19IRUxQRVINCj4gICAJaGVscA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9m
YmRldi9LY29uZmlnIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+IGluZGV4IDZl
ZDVlNjA4ZGQwNC4uNGYzYmU5YjdhNTIwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L0tjb25maWcNCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+
IEBAIC02Niw5ICs2Niw4IEBAIGNvbmZpZyBGQl9EREMNCj4gICAJc2VsZWN0IEkyQ19BTEdP
QklUDQo+ICAgCXNlbGVjdCBJMkMNCj4gICANCj4gLWNvbmZpZyBGQl9CT09UX1ZFU0FfU1VQ
UE9SVA0KPiArY29uZmlnIEJPT1RfVkVTQV9TVVBQT1JUDQo+ICAgCWJvb2wNCj4gLQlkZXBl
bmRzIG9uIEZCDQo+ICAgCWhlbHANCj4gICAJICBJZiB0cnVlLCBhdCBsZWFzdCBvbmUgc2Vs
ZWN0ZWQgZnJhbWVidWZmZXIgZHJpdmVyIGNhbiB0YWtlIGFkdmFudGFnZQ0KPiAgIAkgIG9m
IFZFU0EgdmlkZW8gbW9kZXMgc2V0IGF0IGFuIGVhcmx5IGJvb3Qgc3RhZ2UgdmlhIHRoZSB2
Z2E9IHBhcmFtZXRlci4NCj4gQEAgLTYyNyw3ICs2MjYsNyBAQCBjb25maWcgRkJfVkVTQQ0K
PiAgIAlzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+ICAgCXNlbGVjdCBGQl9DRkJfQ09QWUFS
RUENCj4gICAJc2VsZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4gLQlzZWxlY3QgRkJfQk9PVF9W
RVNBX1NVUFBPUlQNCj4gKwlzZWxlY3QgQk9PVF9WRVNBX1NVUFBPUlQNCj4gICAJaGVscA0K
PiAgIAkgIFRoaXMgaXMgdGhlIGZyYW1lIGJ1ZmZlciBkZXZpY2UgZHJpdmVyIGZvciBnZW5l
cmljIFZFU0EgMi4wDQo+ICAgCSAgY29tcGxpYW50IGdyYXBoaWMgY2FyZHMuIFRoZSBvbGRl
ciBWRVNBIDEuMiBjYXJkcyBhcmUgbm90IHN1cHBvcnRlZC4NCj4gQEAgLTEwNTEsNyArMTA1
MCw3IEBAIGNvbmZpZyBGQl9JTlRFTA0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+
ICAgCXNlbGVjdCBGQl9DRkJfQ09QWUFSRUENCj4gICAJc2VsZWN0IEZCX0NGQl9JTUFHRUJM
SVQNCj4gLQlzZWxlY3QgRkJfQk9PVF9WRVNBX1NVUFBPUlQgaWYgRkJfSU5URUwgPSB5DQo+
ICsJc2VsZWN0IEJPT1RfVkVTQV9TVVBQT1JUIGlmIEZCX0lOVEVMID0geQ0KPiAgIAlkZXBl
bmRzIG9uICFEUk1fSTkxNQ0KPiAgIAloZWxwDQo+ICAgCSAgVGhpcyBkcml2ZXIgc3VwcG9y
dHMgdGhlIG9uLWJvYXJkIGdyYXBoaWNzIGJ1aWx0IGluIHRvIHRoZSBJbnRlbA0KPiBAQCAt
MTM3OCw3ICsxMzc3LDcgQEAgY29uZmlnIEZCX1NJUw0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0ZJ
TExSRUNUDQo+ICAgCXNlbGVjdCBGQl9DRkJfQ09QWUFSRUENCj4gICAJc2VsZWN0IEZCX0NG
Ql9JTUFHRUJMSVQNCj4gLQlzZWxlY3QgRkJfQk9PVF9WRVNBX1NVUFBPUlQgaWYgRkJfU0lT
ID0geQ0KPiArCXNlbGVjdCBCT09UX1ZFU0FfU1VQUE9SVCBpZiBGQl9TSVMgPSB5DQo+ICAg
CXNlbGVjdCBGQl9TSVNfMzAwIGlmICFGQl9TSVNfMzE1DQo+ICAgCWhlbHANCj4gICAJICBU
aGlzIGlzIHRoZSBmcmFtZSBidWZmZXIgZGV2aWNlIGRyaXZlciBmb3IgdGhlIFNpUyAzMDAs
IDMxNSwgMzMwDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------6m9UmIRdykpjFkIQiBQka1kg--

--------------JYUW0XBHt0CzH6KJ0KeaIqyV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIPbY0FAwAAAAAACgkQlh/E3EQov+Bn
2BAAjAwq+emgN48PSmawYbRBCYumLASLcliK2o74cowEUlmTldLrEiGiUcMfFD5dHEUbbs9KOkbw
6pekDAoYR0IrDYl0DLKFUiYYP+n0ikZJPj7YhUytfHmEi2/Eict1rK13PNQZx3uI9ROUrIOnlhVM
O9O/VVQw9ssEODyEkPnNN6wSM+2cmncMahXoffje3S8pl7ug2Blw+vYOnTWMXA5WPk9dYmyNTSTM
HuUUAC16qvtSpbSGWDx/Ga27ySY1u7Fpq/cW319iSm7thrMsGYWb3yqZoK4p5F4GEMn5M2JuU2Q0
vkyBOGcYBfnbQuNIxZHsMoPUmCGnLP3ixhT1uYaNDt6UuSwz5B3i3yxkg+7Heu0T836efpznGBjf
j8SqVxFRCD1cK5h2gyMsiAc/axD+N6OH6n7ZHMr99mCg9Th4VTmN8853mwxjQZOdZC0kBWun0JM2
7J62hCYcFd4yt7o3FhQtAhHXeyyDWnXOCyKakMoa1yJci8iFSYQVDRAbwKjvtrSh2U7QBNe7MbLo
dnU08NZ3ch8U3nIIMobv5fWzXm1leJkN9JdIooHMIy9TC0GKgFV1k++zyvxXT1AdaYoAerPb1p6V
IahTXTiMNtRFJPfJ31NRtXcwTncAQUa5HC+veTbY2skpGuU29tknU+nH6NYknLf9bExXYIGXlNqM
dyM=
=X4vd
-----END PGP SIGNATURE-----

--------------JYUW0XBHt0CzH6KJ0KeaIqyV--
