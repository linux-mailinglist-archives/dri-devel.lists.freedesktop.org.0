Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122944CAEBC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 20:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6A310E907;
	Wed,  2 Mar 2022 19:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031FF10E909
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 19:31:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76DD721997;
 Wed,  2 Mar 2022 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646249486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7rxsONALEiaLjKqO3W6Dc18uVqvAjQjKvEH7nCGfsyg=;
 b=DWlHJJGpViYGcTfKfJlNIArfhTs5MPw6jM6FtJ7oKvfC/ccEcAEbHVnUuybgig+sOljXHF
 gs1LwP+yftxmcVRlm1f8zMiww3aDjahm/ze4g5g9O6rXollGku4JpkkWahec4E9EEDEHNd
 TYUowOZa4oD7USLPq0vG8H93+HuonB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646249486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7rxsONALEiaLjKqO3W6Dc18uVqvAjQjKvEH7nCGfsyg=;
 b=i6ZWfO6DcVUQrsNec8xKNM24dxvJdtPTTlsrmseSMxwq9ouJFObFLypIk3mKWGuLBbg/+c
 0T0KMEHprNnsu/Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0272413AA7;
 Wed,  2 Mar 2022 19:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XOI2Ow3GH2LPcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Mar 2022 19:31:25 +0000
Message-ID: <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
Date: Wed, 2 Mar 2022 20:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
Content-Language: en-US
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20220218093334.24830-1-msuchanek@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220218093334.24830-1-msuchanek@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uYcBGhexMMGdeLiwv1iMuVNx"
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
--------------uYcBGhexMMGdeLiwv1iMuVNx
Content-Type: multipart/mixed; boundary="------------T3Eb8enHfFY730CR7hLaKh0V";
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
Message-ID: <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
References: <20220218093334.24830-1-msuchanek@suse.de>
In-Reply-To: <20220218093334.24830-1-msuchanek@suse.de>

--------------T3Eb8enHfFY730CR7hLaKh0V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCmlzIHRoaXMgcmVhZHkgdG8gYmUgbWVyZ2VkPw0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQpBbSAxOC4wMi4yMiB1bSAxMDozMyBzY2hyaWViIE1pY2hhbCBTdWNoYW5lazoN
Cj4gU2luY2Ugc3dpdGNoIHRvIHNpbXBsZWRybSBWRVNBIGdyYXBoaWMgbW9kZXMgYXJlIG5v
IGxvbmdlciBhdmFpbGFibGUNCj4gd2l0aCBsZWdhY3kgQklPUy4NCj4gDQo+IFRoZSB4ODYg
cmVhbG1vZGUgYm9vdCBjb2RlIGVuYWJsZXMgdGhlIFZFU0EgZ3JhcGhpYyBtb2RlcyB3aGVu
IG9wdGlvbg0KPiBGQl9CT09UX1ZFU0FfU1VQUE9SVCBpcyBlbmFibGVkLg0KPiANCj4gVG8g
ZW5hYmxlIHVzZSBvZiBWRVNBIG1vZGVzIHdpdGggc2ltcGxlZHJtIGluIGxlZ2FjeSBCSU9T
IGJvb3QgbW9kZSBkcm9wDQo+IGRlcGVuZGVuY3kgb2YgQk9PVF9WRVNBX1NVUFBPUlQgb24g
RkIsIGFsc28gZHJvcCB0aGUgRkJfIHByZWZpeCwgYW5kDQo+IHNlbGVjdCB0aGUgb3B0aW9u
IHdoZW4gc2ltcGxlZHJtIGlzIGJ1aWx0LWluIG9uIHg4Ni4NCj4gDQo+IEZpeGVzOiAxMWU4
ZjVmZDIyM2IgKCJkcm06IEFkZCBzaW1wbGVkcm0gZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1i
eTogTWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4NCj4gLS0tDQo+ICAgYXJj
aC94ODYvYm9vdC92aWRlby12ZXNhLmMgICB8IDQgKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS90aW55L0tjb25maWcgfCAxICsNCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcg
IHwgOSArKysrLS0tLS0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9ib290L3ZpZGVv
LXZlc2EuYyBiL2FyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jDQo+IGluZGV4IDdlMTg1OTc3
YTk4NC4uYzJjNmQzNWUzYTQzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9ib290L3ZpZGVv
LXZlc2EuYw0KPiArKysgYi9hcmNoL3g4Ni9ib290L3ZpZGVvLXZlc2EuYw0KPiBAQCAtODMs
NyArODMsNyBAQCBzdGF0aWMgaW50IHZlc2FfcHJvYmUodm9pZCkNCj4gICAJCQkgICAodm1p
bmZvLm1lbW9yeV9sYXlvdXQgPT0gNCB8fA0KPiAgIAkJCSAgICB2bWluZm8ubWVtb3J5X2xh
eW91dCA9PSA2KSAmJg0KPiAgIAkJCSAgIHZtaW5mby5tZW1vcnlfcGxhbmVzID09IDEpIHsN
Cj4gLSNpZmRlZiBDT05GSUdfRkJfQk9PVF9WRVNBX1NVUFBPUlQNCj4gKyNpZmRlZiBDT05G
SUdfQk9PVF9WRVNBX1NVUFBPUlQNCj4gICAJCQkvKiBHcmFwaGljcyBtb2RlLCBjb2xvciwg
bGluZWFyIGZyYW1lIGJ1ZmZlcg0KPiAgIAkJCSAgIHN1cHBvcnRlZC4gIE9ubHkgcmVnaXN0
ZXIgdGhlIG1vZGUgaWYNCj4gICAJCQkgICBpZiBmcmFtZWJ1ZmZlciBpcyBjb25maWd1cmVk
LCBob3dldmVyLA0KPiBAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyBpbnQgdmVzYV9zZXRf
bW9kZShzdHJ1Y3QgbW9kZV9pbmZvICptb2RlKQ0KPiAgIAlpZiAoKHZtaW5mby5tb2RlX2F0
dHIgJiAweDE1KSA9PSAweDA1KSB7DQo+ICAgCQkvKiBJdCdzIGEgc3VwcG9ydGVkIHRleHQg
bW9kZSAqLw0KPiAgIAkJaXNfZ3JhcGhpYyA9IDA7DQo+IC0jaWZkZWYgQ09ORklHX0ZCX0JP
T1RfVkVTQV9TVVBQT1JUDQo+ICsjaWZkZWYgQ09ORklHX0JPT1RfVkVTQV9TVVBQT1JUDQo+
ICAgCX0gZWxzZSBpZiAoKHZtaW5mby5tb2RlX2F0dHIgJiAweDk5KSA9PSAweDk5KSB7DQo+
ICAgCQkvKiBJdCdzIGEgZ3JhcGhpY3MgbW9kZSB3aXRoIGxpbmVhciBmcmFtZSBidWZmZXIg
Ki8NCj4gICAJCWlzX2dyYXBoaWMgPSAxOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3RpbnkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcNCj4gaW5k
ZXggNzEyZTAwMDRlOTZlLi4xYmMzMGM2NGVkMTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90aW55L0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvS2Nv
bmZpZw0KPiBAQCAtNTQsNiArNTQsNyBAQCBjb25maWcgRFJNX0dNMTJVMzIwDQo+ICAgY29u
ZmlnIERSTV9TSU1QTEVEUk0NCj4gICAJdHJpc3RhdGUgIlNpbXBsZSBmcmFtZWJ1ZmZlciBk
cml2ZXIiDQo+ICAgCWRlcGVuZHMgb24gRFJNICYmIE1NVQ0KPiArCXNlbGVjdCBCT09UX1ZF
U0FfU1VQUE9SVCBpZiBYODYgJiYgRFJNX1NJTVBMRURSTSA9IHkNCj4gICAJc2VsZWN0IERS
TV9HRU1fU0hNRU1fSEVMUEVSDQo+ICAgCXNlbGVjdCBEUk1fS01TX0hFTFBFUg0KPiAgIAlo
ZWxwDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcNCj4gaW5kZXggNmVkNWU2MDhkZDA0Li40ZjNiZTli
N2E1MjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcNCj4gQEAgLTY2LDkgKzY2LDggQEAg
Y29uZmlnIEZCX0REQw0KPiAgIAlzZWxlY3QgSTJDX0FMR09CSVQNCj4gICAJc2VsZWN0IEky
Qw0KPiAgIA0KPiAtY29uZmlnIEZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+ICtjb25maWcgQk9P
VF9WRVNBX1NVUFBPUlQNCj4gICAJYm9vbA0KPiAtCWRlcGVuZHMgb24gRkINCj4gICAJaGVs
cA0KPiAgIAkgIElmIHRydWUsIGF0IGxlYXN0IG9uZSBzZWxlY3RlZCBmcmFtZWJ1ZmZlciBk
cml2ZXIgY2FuIHRha2UgYWR2YW50YWdlDQo+ICAgCSAgb2YgVkVTQSB2aWRlbyBtb2RlcyBz
ZXQgYXQgYW4gZWFybHkgYm9vdCBzdGFnZSB2aWEgdGhlIHZnYT0gcGFyYW1ldGVyLg0KPiBA
QCAtNjI3LDcgKzYyNiw3IEBAIGNvbmZpZyBGQl9WRVNBDQo+ICAgCXNlbGVjdCBGQl9DRkJf
RklMTFJFQ1QNCj4gICAJc2VsZWN0IEZCX0NGQl9DT1BZQVJFQQ0KPiAgIAlzZWxlY3QgRkJf
Q0ZCX0lNQUdFQkxJVA0KPiAtCXNlbGVjdCBGQl9CT09UX1ZFU0FfU1VQUE9SVA0KPiArCXNl
bGVjdCBCT09UX1ZFU0FfU1VQUE9SVA0KPiAgIAloZWxwDQo+ICAgCSAgVGhpcyBpcyB0aGUg
ZnJhbWUgYnVmZmVyIGRldmljZSBkcml2ZXIgZm9yIGdlbmVyaWMgVkVTQSAyLjANCj4gICAJ
ICBjb21wbGlhbnQgZ3JhcGhpYyBjYXJkcy4gVGhlIG9sZGVyIFZFU0EgMS4yIGNhcmRzIGFy
ZSBub3Qgc3VwcG9ydGVkLg0KPiBAQCAtMTA1MSw3ICsxMDUwLDcgQEAgY29uZmlnIEZCX0lO
VEVMDQo+ICAgCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QNCj4gICAJc2VsZWN0IEZCX0NGQl9D
T1BZQVJFQQ0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVA0KPiAtCXNlbGVjdCBGQl9C
T09UX1ZFU0FfU1VQUE9SVCBpZiBGQl9JTlRFTCA9IHkNCj4gKwlzZWxlY3QgQk9PVF9WRVNB
X1NVUFBPUlQgaWYgRkJfSU5URUwgPSB5DQo+ICAgCWRlcGVuZHMgb24gIURSTV9JOTE1DQo+
ICAgCWhlbHANCj4gICAJICBUaGlzIGRyaXZlciBzdXBwb3J0cyB0aGUgb24tYm9hcmQgZ3Jh
cGhpY3MgYnVpbHQgaW4gdG8gdGhlIEludGVsDQo+IEBAIC0xMzc4LDcgKzEzNzcsNyBAQCBj
b25maWcgRkJfU0lTDQo+ICAgCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QNCj4gICAJc2VsZWN0
IEZCX0NGQl9DT1BZQVJFQQ0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVA0KPiAtCXNl
bGVjdCBGQl9CT09UX1ZFU0FfU1VQUE9SVCBpZiBGQl9TSVMgPSB5DQo+ICsJc2VsZWN0IEJP
T1RfVkVTQV9TVVBQT1JUIGlmIEZCX1NJUyA9IHkNCj4gICAJc2VsZWN0IEZCX1NJU18zMDAg
aWYgIUZCX1NJU18zMTUNCj4gICAJaGVscA0KPiAgIAkgIFRoaXMgaXMgdGhlIGZyYW1lIGJ1
ZmZlciBkZXZpY2UgZHJpdmVyIGZvciB0aGUgU2lTIDMwMCwgMzE1LCAzMzANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------T3Eb8enHfFY730CR7hLaKh0V--

--------------uYcBGhexMMGdeLiwv1iMuVNx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIfxg0FAwAAAAAACgkQlh/E3EQov+BM
Og/+PkUwDawveuvv7e4lt9SG6zB1P/gIzll2aJLoYaW4Z1T5JTXd4WVVtelzJpu5newCZaKhmRa5
ry9alPGzsNMKCOoQFb/4tBp9o9QqcWRRSVDwvQGZF5aMfqtSjWGydqtYQlz8bsxda0qg/8T0cKVX
z+1NeHrz7SWh7/4ey/cwQo2ZO+q5DZaSIyiRqOm8FdBMnDirn01GGSmNTtq1ADsb2VG4YW02Y6aZ
mw1HZm+VRpsilMHTak0K62R5U2F8WEsNQUVvv54yyoi6oJ3GN+XycKzQKDrwsR+5ZvHqZTucvmVM
dqQNdUPrqfltO8Zg7OcVNaiQeXWhRf2+wNQ/+Ha5tSfNyzsEhveCMx2FzRUPtJlAeCK7Z8m9IuN8
ZrvOmYiKnFYaN2qVkkIHGtZJxREptR9CrzpDJXboaQi1Aau3BuVJB/uSW7WG9IDGoC2XlnJmzEI2
ZEW2yKjECHlvvzpZkgPh7YHjcwRDUA5jbZMkQoHjBL6vve2vfJi7RjOpnxmk/B4WdqBNgxxWImeG
SuXjFMSixU/v9hTHlPJBaTkzIGB01D2M6gOJO5j2N5M4gR6QtwlkMIV9MDuhG+6oT8lTA8mUKtxR
HAdhe80WLV9i3jKYSDf+oEegpaZHEOvOYOyPmFfygYAPkEzILeCgWaXg5qozPlF281cZIuAqdttY
OqM=
=X9k/
-----END PGP SIGNATURE-----

--------------uYcBGhexMMGdeLiwv1iMuVNx--
