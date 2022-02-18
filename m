Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B14BB6CE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABE610F291;
	Fri, 18 Feb 2022 10:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4D610F28E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:24:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF51A219A4;
 Fri, 18 Feb 2022 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645179880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pEW6tURx/EzwxI4FUVurCKiPgw0jrsrJlPXVlnXp/HE=;
 b=SeoCtDNR2wsBLJTj900OTN3n7fC0g/p+HrcnzV651Qw3Pas8MIHw+vT5WvcTm8cLyvPUB4
 pZ3+tmcKMwEhG3y8TeMQq2Q5Mq08k+tIGoZ6RDCRfv5KLQaOKU+X2GPFB77h7e+fayDkW9
 DfTgYnjOlJcVmQOmBEJTunTHBHmr7lQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645179880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pEW6tURx/EzwxI4FUVurCKiPgw0jrsrJlPXVlnXp/HE=;
 b=gZ6C1Ocahxs4eYt0MvA84lXhjcbaOMrU+ICWDeayObwpAJxjPofiuEeRLkIFUO7dEhbQ+F
 3goJdrfmlLmkMCAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B4F913C47;
 Fri, 18 Feb 2022 10:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zuG3IOhzD2LxCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Feb 2022 10:24:40 +0000
Message-ID: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
Date: Fri, 18 Feb 2022 11:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220218093334.24830-1-msuchanek@suse.de>
 <4c6e1d15-3bb3-5a69-972f-592cc33ac0cd@suse.de>
 <20220218100841.GV3113@kunlun.suse.cz>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220218100841.GV3113@kunlun.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LTgM6u0q34vOjsOnn7OEejJ0"
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-video@atrey.karlin.mff.cuni.cz,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Maxime Ripard <maxime@cerno.tech>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LTgM6u0q34vOjsOnn7OEejJ0
Content-Type: multipart/mixed; boundary="------------TPm4NPg2Cxx7x1oIMonTxg69";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Martin Mares <mj@ucw.cz>,
 linux-video@atrey.karlin.mff.cuni.cz, Daniel Mack <daniel@zonque.org>
Message-ID: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
References: <20220218093334.24830-1-msuchanek@suse.de>
 <4c6e1d15-3bb3-5a69-972f-592cc33ac0cd@suse.de>
 <20220218100841.GV3113@kunlun.suse.cz>
In-Reply-To: <20220218100841.GV3113@kunlun.suse.cz>

--------------TPm4NPg2Cxx7x1oIMonTxg69
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDIuMjIgdW0gMTE6MDggc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOg0K
PiBIZWxsbywNCj4gDQo+IE9uIEZyaSwgRmViIDE4LCAyMDIyIGF0IDEwOjU3OjMzQU0gKzAx
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkgTWljaGFsDQo+Pg0KPj4gQW0g
MTguMDIuMjIgdW0gMTA6MzMgc2NocmllYiBNaWNoYWwgU3VjaGFuZWs6DQo+Pj4gU2luY2Ug
c3dpdGNoIHRvIHNpbXBsZWRybSBWRVNBIGdyYXBoaWMgbW9kZXMgYXJlIG5vIGxvbmdlciBh
dmFpbGFibGUNCj4+PiB3aXRoIGxlZ2FjeSBCSU9TLg0KPj4+DQo+Pj4gVGhlIHg4NiByZWFs
bW9kZSBib290IGNvZGUgZW5hYmxlcyB0aGUgVkVTQSBncmFwaGljIG1vZGVzIHdoZW4gb3B0
aW9uDQo+Pj4gRkJfQk9PVF9WRVNBX1NVUFBPUlQgaXMgZW5hYmxlZC4NCj4+Pg0KPj4+IFRv
IGVuYWJsZSB1c2Ugb2YgVkVTQSBtb2RlcyB3aXRoIHNpbXBsZWRybSBpbiBsZWdhY3kgQklP
UyBib290IG1vZGUgZHJvcA0KPj4+IGRlcGVuZGVuY3kgb2YgQk9PVF9WRVNBX1NVUFBPUlQg
b24gRkIsIGFsc28gZHJvcCB0aGUgRkJfIHByZWZpeCwgYW5kDQo+Pj4gc2VsZWN0IHRoZSBv
cHRpb24gd2hlbiBzaW1wbGVkcm0gaXMgYnVpbHQtaW4gb24geDg2Lg0KPj4NCj4+IFRoYW5r
cyBmb3Igc2VuZGluZyB0aGUgcGF0Y2guDQo+Pg0KPj4gSSB0ZXN0ZWQgc2ltcGxlZHJtIG9u
IGEgVkVTQS1iYXNlZCBzeXN0ZW1zIGFuZCBpdCB3b3JrLiBEbyB5b3UgaGF2ZSBhDQo+IA0K
PiBJbiBFRkkgb3IgbGVnYWN5IG1vZGU/DQoNCkl0IHdhcyBhIDMyLWJpdCBBdGhsb25YUC4g
U28gYXMgbGVnYWN5IGFzIGl0IGdldHMuDQoNCj4gDQo+PiBjb25jcmV0ZSBleGFtcGxlIG9m
IGEgbW9kZSB0aGF0IGRvZXNuJ3Qgd29yayBhbnkgbG9uZ2VyPw0KPiANCj4gQXMgcGVyIGRp
c2N1c3Npb24gaW4NCj4gaHR0cHM6Ly9idWd6aWxsYS5vcGVuc3VzZS5vcmcvc2hvd19idWcu
Y2dpP2lkPTExOTMyNTAgdmdhPTc5MSBkb2VzIG5vdC4NCg0KSSB3b25kZXIgaWYgdGhpcyBm
aXhlcyBhIGZldyBtb3JlIG9mIHRoZSBjb21wbGFpbnMgd2UndmUgc2VlbiBhYm91dCANCm1p
c3NpbmcgcmVzb2x1dGlvbnMuDQoNCj4gDQo+IEFsc28gaXQgaXMgY2xlYXIgZXhhbWluaWcg
dGhlIHJlYWxtb2RlIGNvZGUgdGhhdCB0aGlzIG9wdGlvbiBpcyBuZWVkZWQNCj4gdG8gZW5h
YmxlIGdyYXBoaWMgbW9kZSBzZWxlY3Rpb24uDQo+IA0KPiBJIGRvbid0IGhhdmUgYSBzeXN0
ZW0gd2l0aCBsZWdhY3kgQklPUyBhdCBoYW5kIGJ1dCBmcm9tIHVzZXIgdGVzdGluZw0KPiB0
aGlzIGltcHJvdmVzIHRoZSBzaXR1YXRpb24gLSBrZXJuZWwgZG9lcyBub3QgcmVlamVjdCB0
aGUgdmlkZW9tb2RlDQo+IGFyZ3VtZW50LCBhbmQgc2ltcGxlZHJtIGlzIGluaXRpYWxpemVk
IGR1cmluZyBib290Lg0KDQpObyBkb3VidCBhYm91dCB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBUaGFua3MNCj4gDQo+IE1pY2hhbA0KPiANCj4+DQo+Pj4NCj4+
PiBGaXhlczogMTFlOGY1ZmQyMjNiICgiZHJtOiBBZGQgc2ltcGxlZHJtIGRyaXZlciIpDQo+
Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4N
Cj4+PiAtLS0NCj4+PiAgICBhcmNoL3g4Ni9ib290L3ZpZGVvLXZlc2EuYyAgIHwgNCArKy0t
DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvS2NvbmZpZyB8IDEgKw0KPj4+ICAgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyAgfCA5ICsrKystLS0tLQ0KPj4+ICAgIDMgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jIGIvYXJjaC94ODYvYm9v
dC92aWRlby12ZXNhLmMNCj4+PiBpbmRleCA3ZTE4NTk3N2E5ODQuLmMyYzZkMzVlM2E0MyAx
MDA2NDQNCj4+PiAtLS0gYS9hcmNoL3g4Ni9ib290L3ZpZGVvLXZlc2EuYw0KPj4+ICsrKyBi
L2FyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jDQo+Pj4gQEAgLTgzLDcgKzgzLDcgQEAgc3Rh
dGljIGludCB2ZXNhX3Byb2JlKHZvaWQpDQo+Pj4gICAgCQkJICAgKHZtaW5mby5tZW1vcnlf
bGF5b3V0ID09IDQgfHwNCj4+PiAgICAJCQkgICAgdm1pbmZvLm1lbW9yeV9sYXlvdXQgPT0g
NikgJiYNCj4+PiAgICAJCQkgICB2bWluZm8ubWVtb3J5X3BsYW5lcyA9PSAxKSB7DQo+Pj4g
LSNpZmRlZiBDT05GSUdfRkJfQk9PVF9WRVNBX1NVUFBPUlQNCj4+PiArI2lmZGVmIENPTkZJ
R19CT09UX1ZFU0FfU1VQUE9SVA0KPj4+ICAgIAkJCS8qIEdyYXBoaWNzIG1vZGUsIGNvbG9y
LCBsaW5lYXIgZnJhbWUgYnVmZmVyDQo+Pj4gICAgCQkJICAgc3VwcG9ydGVkLiAgT25seSBy
ZWdpc3RlciB0aGUgbW9kZSBpZg0KPj4+ICAgIAkJCSAgIGlmIGZyYW1lYnVmZmVyIGlzIGNv
bmZpZ3VyZWQsIGhvd2V2ZXIsDQo+Pj4gQEAgLTEyMSw3ICsxMjEsNyBAQCBzdGF0aWMgaW50
IHZlc2Ffc2V0X21vZGUoc3RydWN0IG1vZGVfaW5mbyAqbW9kZSkNCj4+PiAgICAJaWYgKCh2
bWluZm8ubW9kZV9hdHRyICYgMHgxNSkgPT0gMHgwNSkgew0KPj4+ICAgIAkJLyogSXQncyBh
IHN1cHBvcnRlZCB0ZXh0IG1vZGUgKi8NCj4+PiAgICAJCWlzX2dyYXBoaWMgPSAwOw0KPj4+
IC0jaWZkZWYgQ09ORklHX0ZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+Pj4gKyNpZmRlZiBDT05G
SUdfQk9PVF9WRVNBX1NVUFBPUlQNCj4+PiAgICAJfSBlbHNlIGlmICgodm1pbmZvLm1vZGVf
YXR0ciAmIDB4OTkpID09IDB4OTkpIHsNCj4+PiAgICAJCS8qIEl0J3MgYSBncmFwaGljcyBt
b2RlIHdpdGggbGluZWFyIGZyYW1lIGJ1ZmZlciAqLw0KPj4+ICAgIAkJaXNfZ3JhcGhpYyA9
IDE7DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9LY29uZmlnDQo+Pj4gaW5kZXggNzEyZTAwMDRlOTZlLi4x
YmMzMGM2NGVkMTUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvS2Nv
bmZpZw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcNCj4+PiBAQCAt
NTQsNiArNTQsNyBAQCBjb25maWcgRFJNX0dNMTJVMzIwDQo+Pj4gICAgY29uZmlnIERSTV9T
SU1QTEVEUk0NCj4+PiAgICAJdHJpc3RhdGUgIlNpbXBsZSBmcmFtZWJ1ZmZlciBkcml2ZXIi
DQo+Pj4gICAgCWRlcGVuZHMgb24gRFJNICYmIE1NVQ0KPj4+ICsJc2VsZWN0IEJPT1RfVkVT
QV9TVVBQT1JUIGlmIFg4NiAmJiBEUk1fU0lNUExFRFJNID0geQ0KPj4NCj4+IFdlIHNob3Vs
ZG4ndCBzZWxlY3QgdGhpcyBvcHRpb24gaW4gZHJpdmVycyBJTUhPLiBTaW1wbGUtZnJhbWVi
dWZmZXIgZGV2aWNlcw0KPj4gd2l0aCBWRVNBIGFyZSBlbmFibGVkIHdpdGggWzFdIGFuZCB0
aGF0IHNob3VsZCBhbHNvIHNlbGVjdCB0aGUNCj4+IEJPT1RfVkVTQV9TVVBQT1JULg0KPiAN
Cj4gU291bmRzIG9rIHRvIHNlbGVjdCBmcm9tIHRoZXJlLCBpdCBzaG91bGQgYWxzbyBjb3Zl
ciBzaW1wbGVmYiB0aGVuLg0KPiANCj4gVGhhbmtzDQo+IA0KPiBNaWNoYWwNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------TPm4NPg2Cxx7x1oIMonTxg69--

--------------LTgM6u0q34vOjsOnn7OEejJ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIPc+cFAwAAAAAACgkQlh/E3EQov+BH
gQ//RgDCqtQlenbOA0fCUdGHC+oXuhOec33RIYsU23am8QOxThWrmV4RIP12S+6kpvH9+c32lG/c
HTIyxmE3T3igD5asQ29orKnxz2uOIuvC3lBW85zmantd4CZAFfMiFOZc/ZfZnFv+uWSlI8wcdxAQ
kROUTY5N3brxOuidBSgTHwQtUW6SNP2ycxaD6aq8bKofX0dq1y28zkLby7UO1BUp+FnlIKFYYATv
nkhxAiqfxBhbzjJQD90MsTqa3OJIXAyTO9CW0oHHHf0m42k+2bW9gLPwo3syv9VuRyCz4uDKmevO
kjR208vGQyYBoYoarkbLLqyhcI1Kbgeky7s855+tiF9cpRZ1Up6+fKmOhHtd0gyJoy2Nnj0J3lf3
amBhaTDVYqZl0p/WSRXz2bsCInRAz7Dl9w20SuiZDAXhVf7D4q6QmDKHL49eEwCFqgr+sXJnzbYz
GJUh6YrKjsOps6+boxGHf5rMzvCL5iLiFaQ/91N98vBu+/p3UnUcUlBcWzdO3tA4rjY1bfkAkOcJ
qNtGPQmczDWCtmRGJo2Fbl+ID9ILNMLdE0t9Oh/FSVpvwIdmTjs2/rFav9zkDVDkeKqzeBn6y1Iv
QhLCt/52wf1XunOOqN6ljgppebY2PXgfLvt8hCgq4VfPPc3dJ40KuXP2xMYX98K7DbFrvMdASFfL
v9w=
=U2ec
-----END PGP SIGNATURE-----

--------------LTgM6u0q34vOjsOnn7OEejJ0--
