Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689879CA2D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B910E3BC;
	Tue, 12 Sep 2023 08:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622F710E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:38:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10FBD218E6;
 Tue, 12 Sep 2023 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694507891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1DRhswA9Oc577HWoSVr73gljwdQoTk0suajRh1T64sQ=;
 b=aNekBEb/222FZJQkKnOGpTZNF/m4/yTJuIMYLqlMMFkq/UE8+ZJu9llLhdwvTWKupBAKwS
 2qiCbqv4fhgEmB3rpSieRpNRfGEvZiAQ17v+/1olRNwNk+iRZTR3dm4dUM11QJHaBQd0J3
 zT6DlR5DZTd69McdAUTadnmxWHTNt/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694507891;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1DRhswA9Oc577HWoSVr73gljwdQoTk0suajRh1T64sQ=;
 b=4Zft+j6P4ljOBpqwRK5WXxCIgui0LqP9CHs/INnVTzA2NafThC2fOFJezdob+g02ztU2jP
 h1YJLqd8n8ThhNBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFF1C13A39;
 Tue, 12 Sep 2023 08:38:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SMIlKnIjAGUkIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Sep 2023 08:38:10 +0000
Message-ID: <bf4a1cbd-c24e-4def-a523-1a707a1ca5a1@suse.de>
Date: Tue, 12 Sep 2023 10:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
 <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RarGNkMvgomjmopc3ithYrAM"
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RarGNkMvgomjmopc3ithYrAM
Content-Type: multipart/mixed; boundary="------------Jg001PUZ7GquGyoR0gf0QAih";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jim Cromie <jim.cromie@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-ID: <bf4a1cbd-c24e-4def-a523-1a707a1ca5a1@suse.de>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
 <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
In-Reply-To: <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>

--------------Jg001PUZ7GquGyoR0gf0QAih
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMTIuMDkuMjMgdW0gMTA6MTggc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFR1ZSwgU2VwIDEyLCAyMDIzIGF0IDEw
OjEx4oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3Rl
Og0KPj4gQW0gMTIuMDkuMjMgdW0gMDk6MTQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+PiBbLi4uXQ0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4+PiBAQCAtMTM1LDcgKzEzNSw3IEBA
IGNvbmZpZyBEUk1fRkJERVZfRU1VTEFUSU9ODQo+Pj4+ICAgICAgICAgICBib29sICJFbmFi
bGUgbGVnYWN5IGZiZGV2IHN1cHBvcnQgZm9yIHlvdXIgbW9kZXNldHRpbmcgZHJpdmVyIg0K
Pj4+PiAgICAgICAgICAgZGVwZW5kcyBvbiBEUk0NCj4+Pj4gICAgICAgICAgIHNlbGVjdCBG
UkFNRUJVRkZFUl9DT05TT0xFX0RFVEVDVF9QUklNQVJZIGlmIEZSQU1FQlVGRkVSX0NPTlNP
TEUNCj4+Pj4gLSAgICAgICBkZWZhdWx0IHkNCj4+Pj4gKyAgICAgICBkZWZhdWx0IEZCDQo+
Pj4NCj4+PiBXaGlsZSB0aGlzIGlzIHRydWUgZm9yIGV4aXN0aW5nIGNvbmZpZ3MsIGl0IGlz
IG5vIGxvbmdlciB0cnVlIGluIGdlbmVyYWwsDQo+Pj4gYXMgRFJNX0ZCREVWX0VNVUxBVElP
TiBpcyBubyBsb25nZXIgcmVsYXRlZCB0byBGQi4NCj4+DQo+PiBXb3VsZCBpdCBtYWtlIHNl
bnNlIHRvIG1ha2UgRlJBTUVCVUZGRVJfQ09OU09MRSBhbiBpbmRlcGVuZGVudCBvcHRpb24N
Cj4+IGFuZCBoYXZlIEZCREVWX0VNVUxBVElPTiBkZXBlbmQgb24gaXQ/IFNvbWV0aGluZyBs
aWtlIHRoaXM6DQo+Pg0KPj4gRlJBTUVCVUZGRVJfQ09OU09MRQ0KPj4gICAgICAgICAgZGVw
ZW5kcyBvbiBEUk0gfHwgRkINCj4+ICAgICAgICAgIHNlbGVjdCBGQl9DT1JFDQo+Pg0KPj4g
RkJERVZfRU1VTEFUSU9ODQo+PiAgICAgICAgICBkZXBlbmRzIG9uIERSTQ0KPj4gICAgICAg
ICAgZGVwZW5kcyBvbiBGUkFNRUJVRkZFUl9DT05TT0xFDQo+PiAgICAgICAgICBkZWZhdWx0
IHkNCj4gDQo+IE9vcHMsIG5vdyB5b3UgY2FuIG5vIGxvbmdlciBoYXZlIEZCREVWX0VNVUxB
VElPTiB3aXRob3V0DQo+IEZSQU1FQlVGRkVSX0NPTlNPTEUsIHdoaWNoIGlzIHVzZWZ1bCB0
byBiZSBhYmxlIHRvIGVuYWJsZQ0KPiBGQl9ERVZJQ0UuLi4NCg0KQW5kIGlmIGl0IGRlcGVu
ZHMgb24gRkJfQ09SRSBpbnN0ZWFkIG9mIEZSQU1FQlVGRkVSX0NPTlNPTEU/IEknbSBhd2Fy
ZSANCnRoYXQgdGhpcyB3b3VsZCByZXF1aXJlIG1vcmUgS2NvbmZpZyBjaGFuZ2VzIHRoYW4g
b3V0bGluZWQgaGVyZS4NCg0KDQo+IA0KPiBBbmQgd2hhdCdzIHRoZSBwb2ludCAoaWYgRFJN
IGlzIGVuYWJsZWQpIG9mIGhhdmluZyBGQl9DT1JFIHdpdGgNCj4gRkJERVZfRU1VTEFUSU9O
IGRpc2FibGVkPw0KPiANCj4+IFNvIGlmIGFueSBncmFwaGljcyBzdWJzeXN0ZW1zIGFyZSBl
bmFibGVkLCBGUkFNRUJVRkZFUl9DT05TT0xFIGlzDQo+PiBzZWxlY3QtYWJsZS4gQnV0IGZv
ciBEUk0sIEZCREVWX0VNVUxBVElPTiBkaXNhYmxlcyB0aGUgY29uc29sZS4gVGhhdA0KPiAN
Cj4gSHVoPw0KPiANCj4gL21lIGxvb2tzIGF0IGhpcyBtb3JuaW5nIGNvZmZlZSwgYW5kIGNv
bmZpcm1zIHRoZSBjdXAgaXMgZW1wdHkuLi4NCg0KRGVjYWYgbWF5YmU/DQoNCkJ1dCB0aGVy
ZSdzIHJlYWxseSBubyBuZWVkIHRvIGdldCBzbmFya3kuIE15IHRob3VnaCBpcyB0aGF0IA0K
RlJBTUVCVUZGRVJfQ09OU09MRSBjb25maWd1cmVzIGFuIGVuZC11c2VyIGZlYXR1cmUuIFRo
ZSB1c2VyIHNpdHMgdGhlcmUgDQphbiB0aGlua3MgIkkgd2FudCBhIGNvbnNvbGUiLiBGQkRF
Vl9FTVVMQVRJT04gY29udHJvbHMgYSBkcml2ZXIgDQpmdW5jdGlvbmFsaXR5LiBJdCdzIG5v
dCB1c2VmdWwgYnkgaXRzZWxmLCBidXQgZW5hYmxlcyB0aGUgZW5kdXNlciANCmZlYXR1cmUu
IFRoZSBmZWF0dXJlcyB3b3VsZCBiZSBGUkFNRUJVRkZFUl9DT05TT0xFIGFuZCBGUkFNRUJV
RkZFUl9ERVZJQ0UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiBvcHRpb24g
cmVtYWlucyBtb3JlIGZvciBoaXN0b3JpY2FsIHJlYXNvbnMgdGhhbiBhY3R1YWwgdXNlZnVs
bmVzcy4NCj4gDQo+Pj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9LY29uZmlnDQo+
Pj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9LY29uZmlnDQo+Pj4+IEBAIC03NCw2
ICs3NCw3IEBAIGNvbmZpZyBEVU1NWV9DT05TT0xFX1JPV1MNCj4+Pj4gICAgY29uZmlnIEZS
QU1FQlVGRkVSX0NPTlNPTEUNCj4+Pj4gICAgICAgICAgIGJvb2wgIkZyYW1lYnVmZmVyIENv
bnNvbGUgc3VwcG9ydCINCj4+Pj4gICAgICAgICAgIGRlcGVuZHMgb24gRkJfQ09SRSAmJiAh
VU1MDQo+Pj4+ICsgICAgICAgZGVmYXVsdCBEUk1fRkJERVZfRU1VTEFUSU9ODQo+Pj4NCj4+
PiBTb3VuZHMgZ29vZCB0byBtZSwgYWx0aG91Z2ggaXQgbG9va3MgYSBiaXQgc3RyYW5nZSBh
dCBmaXJzdCBzaWdodA0KPj4+IChGUkFNRUJVRkZFUl9DT05TT0xFIGRlZmF1bHRzIHRvIG4g
b24gYSBzeXN0ZW0gd2l0aCByZWFsIGZiZGV2LCBidXQNCj4+PiB5IG9uIGVtdWxhdGVkIGZi
ZGV2PykuDQo+Pj4gU28gdGhpcyBpcyB0aGUgZml4IGZvciBjb21taXQgYTVhZTMzMWVkYjAy
YiAoImRybTogRHJvcCBzZWxlY3QNCj4+PiBGUkFNRUJVRkZFUl9DT05TT0xFIGZvciBEUk1f
RkJERVZfRU1VTEFUSU9OIikuDQo+Pj4NCj4+Pj4gICAgICAgICAgIHNlbGVjdCBWVF9IV19D
T05TT0xFX0JJTkRJTkcNCj4+Pj4gICAgICAgICAgIHNlbGVjdCBDUkMzMg0KPj4+PiAgICAg
ICAgICAgc2VsZWN0IEZPTlRfU1VQUE9SVA0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL0tjb25maWcgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2Nv
bmZpZw0KPj4+PiBpbmRleCAxMTRjYjhhYTZjOGZkLi44MDRjMmJlYzliNDNjIDEwMDY0NA0K
Pj4+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZw0KPj4+PiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZw0KPj4+PiBAQCAtMjgsNyArMjgs
NyBAQCBjb25maWcgRklSTVdBUkVfRURJRA0KPj4+PiAgICBjb25maWcgRkJfREVWSUNFDQo+
Pj4+ICAgICAgICAgICBib29sICJQcm92aWRlIGxlZ2FjeSAvZGV2L2ZiKiBkZXZpY2UiDQo+
Pj4+ICAgICAgICAgICBkZXBlbmRzIG9uIEZCX0NPUkUNCj4+Pj4gLSAgICAgICBkZWZhdWx0
IHkNCj4+Pj4gKyAgICAgICBkZWZhdWx0IEZCDQo+Pj4NCj4+PiBDaGFuZ2luZyB0aGlzIG1l
YW5zIHBvc3NpYmx5IGNhdXNpbmcgcmVncmVzc2lvbnMgb24gc3lzdGVtcyBydW5uaW5nDQo+
Pj4gYW4gZmJkZXYgdXNlcnNwYWNlLg0KPj4+DQo+Pj4+ICAgICAgICAgICBoZWxwDQo+Pj4+
ICAgICAgICAgICAgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdGhlIGxlZ2FjeSAvZGV2L2Zi
KiBkZXZpY2UgZmlsZSBhbmQNCj4+Pj4gICAgICAgICAgICAgaW50ZXJmYWNlcyB3aXRoaW4g
c3lzZnMgYW5jIHByb2Nmcy4gSXQgaXMgb25seSByZXF1aXJlZCBpZiB5b3UNCj4gDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJh
c3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRy
ZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkg
KEFHIE51ZXJuYmVyZykNCg==

--------------Jg001PUZ7GquGyoR0gf0QAih--

--------------RarGNkMvgomjmopc3ithYrAM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUAI3IFAwAAAAAACgkQlh/E3EQov+AB
Gw/4+zuzOcmZhLjYn+1nx9xxI6Uy6Tr5+G1nIXxelgLgaAe7b5zwAt6aPLPnUJnP2vFEaPIsLKF8
8FkQmtRdsnb4gfkDrW9XHOjDmZ/MDujHQW4wUk30NZWbXpFPg4nLoy0Q+K7v1FppgJaLtfLnAIoW
49eHC7jIrtox1cXFWB8FE8QIzvfnwHZZyFmamWKd8wP4zDVd9UKlDjst/v5AUB3bF+7yPE/aSHUC
4C1WjP7kinaoGYWLLEvR3r2ddqAtQ8/RVcHYho1OHWO3gHxXRUlzEYaUbT1S2dvjQBPHK5bhtmii
zGq4L1iBKFc0UPbr0lGovM9mpB6G4jwcD1rh2HwBz13n4Wttv96Cq/tMTvV2DiHcfhMpsC3GGe/F
eX6U22p/MjiD2RFlQOLYy60I5xSV6xB8sb8syLOMRAJspdYh4uxMIUDMvLxiE9ZuwCEukeGBMoAH
P2mwCDT7Vq/0f0ErUC1Qx2cnDfunOOBqpQ+PuXi6oXkduGUCLTIRvsB9p+TSiI6Qw7fDEY33NV73
Zcxox0/EB7DqAN1RvRzkaZS4hKTWog0IUHTpHRm/8fjEHbeg0/b+82blsz5/7KcuEqBU0um5uhyE
GGclt+Y9ojCgnr8LNeaufbXcC71bTXwCN0bM4SVRi+hLwmB8fASxHAOKC6l98qPLkBPhZMXX0c6k
EA==
=7UAm
-----END PGP SIGNATURE-----

--------------RarGNkMvgomjmopc3ithYrAM--
