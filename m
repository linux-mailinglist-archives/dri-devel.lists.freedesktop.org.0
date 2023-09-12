Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0E79C962
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D29210E3B1;
	Tue, 12 Sep 2023 08:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B89F89083
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:11:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E197D1F85D;
 Tue, 12 Sep 2023 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694506304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXdqCK7IJxe5rTLnJmNveWbh8pP8IIVl6oZz8TWuo30=;
 b=Dnq0OX99SWDBkUkg4NqR285fXpw4UtUQlC6v6a33Ld3VUqbE+ogQNgvnc36ojM+/vAOfZl
 vyLPpPnn2hmNSxGQIYeG/vaoMBLilloT1NUP1xWVzdHqV5QwEkzocdSeHw70rravqQPclW
 n0IR3a0JOIQatXAf91xoKGe3m//O16c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694506304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXdqCK7IJxe5rTLnJmNveWbh8pP8IIVl6oZz8TWuo30=;
 b=p0yWx0VB92CYyXAsKozfKBHpAE6R93eb0u1c7uIHhEX1LSkA7doJgxsHUL6n1OqW0P/6S2
 ZTFWluW+UjUrp1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 818FA13A39;
 Tue, 12 Sep 2023 08:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XQU5G0AdAGVIFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Sep 2023 08:11:44 +0000
Message-ID: <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
Date: Tue, 12 Sep 2023 10:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z16WFs9halpjk3MPJ08ovkgt"
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z16WFs9halpjk3MPJ08ovkgt
Content-Type: multipart/mixed; boundary="------------0NR9gq0a3l3oFllEsTkfW0tM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Message-ID: <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>

--------------0NR9gq0a3l3oFllEsTkfW0tM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDkuMjMgdW0gMDk6MTQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQpbLi4uXQ0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+PiBAQCAtMTM1LDcgKzEzNSw3IEBAIGNvbmZpZyBE
Uk1fRkJERVZfRU1VTEFUSU9ODQo+PiAgICAgICAgICBib29sICJFbmFibGUgbGVnYWN5IGZi
ZGV2IHN1cHBvcnQgZm9yIHlvdXIgbW9kZXNldHRpbmcgZHJpdmVyIg0KPj4gICAgICAgICAg
ZGVwZW5kcyBvbiBEUk0NCj4+ICAgICAgICAgIHNlbGVjdCBGUkFNRUJVRkZFUl9DT05TT0xF
X0RFVEVDVF9QUklNQVJZIGlmIEZSQU1FQlVGRkVSX0NPTlNPTEUNCj4+IC0gICAgICAgZGVm
YXVsdCB5DQo+PiArICAgICAgIGRlZmF1bHQgRkINCj4gDQo+IFdoaWxlIHRoaXMgaXMgdHJ1
ZSBmb3IgZXhpc3RpbmcgY29uZmlncywgaXQgaXMgbm8gbG9uZ2VyIHRydWUgaW4gZ2VuZXJh
bCwNCj4gYXMgRFJNX0ZCREVWX0VNVUxBVElPTiBpcyBubyBsb25nZXIgcmVsYXRlZCB0byBG
Qi4NCg0KV291bGQgaXQgbWFrZSBzZW5zZSB0byBtYWtlIEZSQU1FQlVGRkVSX0NPTlNPTEUg
YW4gaW5kZXBlbmRlbnQgb3B0aW9uIA0KYW5kIGhhdmUgRkJERVZfRU1VTEFUSU9OIGRlcGVu
ZCBvbiBpdD8gU29tZXRoaW5nIGxpa2UgdGhpczoNCg0KRlJBTUVCVUZGRVJfQ09OU09MRQ0K
CWRlcGVuZHMgb24gRFJNIHx8IEZCDQoJc2VsZWN0IEZCX0NPUkUNCg0KRkJERVZfRU1VTEFU
SU9ODQoJZGVwZW5kcyBvbiBEUk0NCglkZXBlbmRzIG9uIEZSQU1FQlVGRkVSX0NPTlNPTEUN
CglkZWZhdWx0IHkNCg0KU28gaWYgYW55IGdyYXBoaWNzIHN1YnN5c3RlbXMgYXJlIGVuYWJs
ZWQsIEZSQU1FQlVGRkVSX0NPTlNPTEUgaXMgDQpzZWxlY3QtYWJsZS4gQnV0IGZvciBEUk0s
IEZCREVWX0VNVUxBVElPTiBkaXNhYmxlcyB0aGUgY29uc29sZS4gVGhhdCANCm9wdGlvbiBy
ZW1haW5zIG1vcmUgZm9yIGhpc3RvcmljYWwgcmVhc29ucyB0aGFuIGFjdHVhbCB1c2VmdWxu
ZXNzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gICAgICAgICAgaGVscA0K
Pj4gICAgICAgICAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYSBuZWVkIGZv
ciB0aGUgbGVnYWN5IGZiZGV2DQo+PiAgICAgICAgICAgIHN1cHBvcnQuIE5vdGUgdGhhdCB0
aGlzIHN1cHBvcnQgYWxzbyBwcm92aWRlcyB0aGUgbGludXggY29uc29sZQ0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9LY29uZmlnIGIvZHJpdmVycy92aWRlby9j
b25zb2xlL0tjb25maWcNCj4+IGluZGV4IGI1NzVjZjU0MTc0YWYuLjgzYzJkNzMyOWNhNTgg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvS2NvbmZpZw0KPj4gKysr
IGIvZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcNCj4+IEBAIC03NCw2ICs3NCw3IEBA
IGNvbmZpZyBEVU1NWV9DT05TT0xFX1JPV1MNCj4+ICAgY29uZmlnIEZSQU1FQlVGRkVSX0NP
TlNPTEUNCj4+ICAgICAgICAgIGJvb2wgIkZyYW1lYnVmZmVyIENvbnNvbGUgc3VwcG9ydCIN
Cj4+ICAgICAgICAgIGRlcGVuZHMgb24gRkJfQ09SRSAmJiAhVU1MDQo+PiArICAgICAgIGRl
ZmF1bHQgRFJNX0ZCREVWX0VNVUxBVElPTg0KPiANCj4gU291bmRzIGdvb2QgdG8gbWUsIGFs
dGhvdWdoIGl0IGxvb2tzIGEgYml0IHN0cmFuZ2UgYXQgZmlyc3Qgc2lnaHQNCj4gKEZSQU1F
QlVGRkVSX0NPTlNPTEUgZGVmYXVsdHMgdG8gbiBvbiBhIHN5c3RlbSB3aXRoIHJlYWwgZmJk
ZXYsIGJ1dA0KPiB5IG9uIGVtdWxhdGVkIGZiZGV2PykuDQo+IFNvIHRoaXMgaXMgdGhlIGZp
eCBmb3IgY29tbWl0IGE1YWUzMzFlZGIwMmIgKCJkcm06IERyb3Agc2VsZWN0DQo+IEZSQU1F
QlVGRkVSX0NPTlNPTEUgZm9yIERSTV9GQkRFVl9FTVVMQVRJT04iKS4NCj4gDQo+PiAgICAg
ICAgICBzZWxlY3QgVlRfSFdfQ09OU09MRV9CSU5ESU5HDQo+PiAgICAgICAgICBzZWxlY3Qg
Q1JDMzINCj4+ICAgICAgICAgIHNlbGVjdCBGT05UX1NVUFBPUlQNCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9LY29uZmlnDQo+PiBpbmRleCAxMTRjYjhhYTZjOGZkLi44MDRjMmJlYzliNDNj
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL0tjb25maWcNCj4+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9LY29uZmlnDQo+PiBAQCAtMjgsNyAr
MjgsNyBAQCBjb25maWcgRklSTVdBUkVfRURJRA0KPj4gICBjb25maWcgRkJfREVWSUNFDQo+
PiAgICAgICAgICBib29sICJQcm92aWRlIGxlZ2FjeSAvZGV2L2ZiKiBkZXZpY2UiDQo+PiAg
ICAgICAgICBkZXBlbmRzIG9uIEZCX0NPUkUNCj4+IC0gICAgICAgZGVmYXVsdCB5DQo+PiAr
ICAgICAgIGRlZmF1bHQgRkINCj4gDQo+IENoYW5naW5nIHRoaXMgbWVhbnMgcG9zc2libHkg
Y2F1c2luZyByZWdyZXNzaW9ucyBvbiBzeXN0ZW1zIHJ1bm5pbmcNCj4gYW4gZmJkZXYgdXNl
cnNwYWNlLg0KPiANCj4+ICAgICAgICAgIGhlbHANCj4+ICAgICAgICAgICAgU2F5IFkgaGVy
ZSBpZiB5b3Ugd2FudCB0aGUgbGVnYWN5IC9kZXYvZmIqIGRldmljZSBmaWxlIGFuZA0KPj4g
ICAgICAgICAgICBpbnRlcmZhY2VzIHdpdGhpbiBzeXNmcyBhbmMgcHJvY2ZzLiBJdCBpcyBv
bmx5IHJlcXVpcmVkIGlmIHlvdQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcs
IEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxk
LCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------0NR9gq0a3l3oFllEsTkfW0tM--

--------------z16WFs9halpjk3MPJ08ovkgt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUAHT8FAwAAAAAACgkQlh/E3EQov+DU
Pw//bjtTKDkr6zUHhIzruyB3IaL13aLU4GbkVUM6gBsYTyrv99UrVpdnzbI1yip0ayia3l4IuuLi
zheiwC/0NQAZa6E5l9AqXv5eGMyuBpD9jUy9BYGojo/TfcV/uRq1eBj1ZzJo7TIPEkCC+7zfQ1W4
pX9oiLPsmkgSvZ2U7C647XcX1SzNRj8lG9ZpoDHJpslEe377rkUJcIY+E2GeUTt7sExDnJlf3q3u
AHWUWmCyQesHKqiq0KjqOCtQOlm4Q3RrCuswJWKvJR7i76s9qx0RWQCoRbAIh3BWhHrXWQKKTOJ+
73YcyJtmk8pBbyoUEawWWkaeKVhWFPxR8EEcXF+OOWynRxeP7yZIyxYPffkoFFVcR7uPoMoqhDUe
J1olUE+hiHc5znxx3QKRNc1+JRkKMTEu2yfP63aKnHAoCsPoTkomSPytLQiCQwdsKCmOjdP1jHSS
uvR8yNY5NpveaOz8yG7T1s9dxpy1WQbNSiCFQOy07oVB0et459pORhn1PrKVcMy+k+XAvNNLzhCe
it8aCsF8dmxiqoqAYX/3niD3U7IG9IxZ9xilXi0KlI8RaLz+L+tqwPgjtxn9vXxiiziYzuG+C1A7
vq36g6rKNNAopoGR7Vh4sUWmlzVt5FS4GK7PbiuuzGwGm6/9Ou8hLQ0lWKbzms5Xf1YYvvz7oEpG
unM=
=5E0s
-----END PGP SIGNATURE-----

--------------z16WFs9halpjk3MPJ08ovkgt--
