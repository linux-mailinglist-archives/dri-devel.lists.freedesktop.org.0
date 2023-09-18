Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E07A4240
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827710E1B7;
	Mon, 18 Sep 2023 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40B510E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:25:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94A24219A6;
 Mon, 18 Sep 2023 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695021953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vKwk4cXuwZ+0Bj7BBjjpxp8mqSTp942qI/Lfi+RSh3Y=;
 b=aNlUXcE+6l0DLWDufFGtgMi7BIIZnO3kmUK+2v7ouknq21uUpcyryHhCEKt99Hhp3bQSrG
 7309HJpXBTgRzlhPhyXwx8Iich7D5P9+FFCoybmmbhOPIrW/Hno4ZO08/MB8rTpwhGPJpC
 /MpMJMzC0cWCAOW33YgogMoyYWky+R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695021953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vKwk4cXuwZ+0Bj7BBjjpxp8mqSTp942qI/Lfi+RSh3Y=;
 b=nhxcWdZle4mmQcc6UHeCykb/zwbMht8WdkBl7EtaEAIfT4PYOkVmJZiRug4R5Whb6DCLpj
 aEhyWMrD4SMz6ODw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F72813480;
 Mon, 18 Sep 2023 07:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rCOKDoH7B2VlUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Sep 2023 07:25:53 +0000
Message-ID: <971f1e86-bcc4-4462-81c7-571a05748b46@suse.de>
Date: Mon, 18 Sep 2023 09:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
References: <20230911205338.2385278-1-arnd@kernel.org>
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
In-Reply-To: <20230911205338.2385278-1-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e0LwbSQiUoDLxKh4O0uZGxrf"
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
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e0LwbSQiUoDLxKh4O0uZGxrf
Content-Type: multipart/mixed; boundary="------------HBdjsAFyOEkIfku9Yw1VdQhm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jim Cromie <jim.cromie@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-ID: <971f1e86-bcc4-4462-81c7-571a05748b46@suse.de>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
References: <20230911205338.2385278-1-arnd@kernel.org>
In-Reply-To: <20230911205338.2385278-1-arnd@kernel.org>

--------------HBdjsAFyOEkIfku9Yw1VdQhm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDkuMjMgdW0gMjI6NTIgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBG
cm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gQXMgYSByZXN1bHQg
b2YgdGhlIHJlY2VudCBLY29uZmlnIHJld29ya3MsIHRoZSBkZWZhdWx0IHNldHRpbmdzIGZv
ciB0aGUNCj4gZnJhbWVidWZmZXIgaW50ZXJmYWNlcyBjaGFuZ2VkIGluIHVuZXhwZWN0ZWQg
d2F5czoNCj4gDQo+IENvbmZpZ3VyYXRpb25zIHRoYXQgbGVhdmUgQ09ORklHX0ZCIGRpc2Fi
bGVkIGJ1dCB1c2UgRFJNIG5vdyBnZXQNCj4gRFJNX0ZCREVWX0VNVUxBVElPTiBieSBkZWZh
dWx0LiBUaGlzIGFsc28gdHVybnMgb24gdGhlIGRlcHJlY2F0ZWQgL2Rldi9mYg0KPiBkZXZp
Y2Ugbm9kZXMgZm9yIG1hY2hpbmVzIHRoYXQgZG9uJ3QgYWN0dWFsbHkgd2FudCBpdC4NCj4g
DQo+IEluIHR1cm4sIGNvbmZpZ3VyYXRpb25zIHRoYXQgcHJldmlvdXNseSBoYWQgRFJNX0ZC
REVWX0VNVUxBVElPTiBlbmFibGVkDQo+IG5vdyBvbmx5IGdldCB0aGUgL2Rldi9mYiBmcm9u
dC1lbmQgYnV0IG5vdCB0aGUgbW9yZSB1c2VmdWwgZnJhbWVidWZmZXINCj4gY29uc29sZSwg
d2hpY2ggaXMgbm90IHNlbGVjdGVkIGFueSBtb3JlLg0KPiANCj4gV2UgaGFkIHByZXZpb3Vz
bHkgZGVjaWRlZCB0aGF0IGFueSBjb21iaW5hdGlvbiBvZiB0aGUgdGhyZWUgZnJvbnRlbmRz
DQo+IChGQl9ERVZJQ0UsIEZSQU1FQlVGRkVSX0NPTlNPTEUgYW5kIExPR08pIHNob3VsZCBi
ZSBzZWxlY3RhYmxlLCBidXQgdGhlDQo+IG5ldyBkZWZhdWx0IHNldHRpbmdzIG1lYW4gdGhh
dCBhIGxvdCBvZiBkZWZjb25maWcgZmlsZXMgd291bGQgaGF2ZSB0bw0KPiBnZXQgYWRhcHRl
ZC4NCj4gDQo+IENoYW5nZSB0aGUgZGVmYXVsdHMgYmFjayB0byB3aGF0IHRoZXkgd2VyZSBp
biBMaW51eCA2LjU6DQo+IA0KPiAgIC0gTGVhdmUgRFJNX0ZCREVWX0VNVUxBVElPTiB0dXJu
ZWQgb2ZmIHVubGVzcyBDT05GSUdfRkINCj4gICAgIGlzIGVuYWJsZWQuIFByZXZpb3VzbHkg
dGhpcyB3YXMgYSBoYXJkIGRlcGVuZGVuY3kgYnV0IG5vdyB0aGUgdHdvIGFyZQ0KPiAgICAg
aW5kZXBlbmRlbnQuIEhvd2V2ZXIsIGNvbmZpZ3VyYXRpb25zIHRoYXQgZW5hYmxlIENPTkZJ
R19GQiBwcm9iYWJseQ0KPiAgICAgYWxzbyB3YW50IHRvIGtlZXAgdGhlIGVtdWxhdGlvbiBm
b3IgRFJNLCB3aGlsZSB0aG9zZSB3aXRob3V0IEZCDQo+ICAgICBwcmVzdW1hYmx5IGRpZCB0
aGF0IGludGVudGlvbmFsbHkgaW4gdGhlIHBhc3QuDQo+IA0KPiAgIC0gTGVhdmUgRkJfREVW
SUNFIHR1cm5lZCBvZmYgZm9yIEZCPW4uIEZvbGxvd2luZyB0aGUgc2FtZQ0KPiAgICAgbG9n
aWMsIHRoZSBkZXByZWNhdGVkIG9wdGlvbiBzaG91bGQgbm90IGF1dG9tYXRpY2FsbHkgZ2V0
IGVuYWJsZWQNCj4gICAgIGhlcmUsIG1vc3QgdXNlcnMgdGhhdCBoYWQgRkIgdHVybmVkIG9m
ZiBpbiB0aGUgcGFzdCBkbyBub3Qgd2FudCBpdCwNCj4gICAgIGV2ZW4gaWYgdGhleSB3YW50
IHRoZSBjb25zb2xlDQo+IA0KPiAgIC0gVHVybiB0aGUgRlJBTUVCVUZGRVJfQ09OU09MRSBv
cHRpb24gb24gaWYNCj4gICAgIERSTV9GQkRFVl9FTVVMQVRJT04gaXMgc2V0IHRvIGF2b2lk
IGhhdmluZyB0byBjaGFuZ2UgZGVmY29uZmlnDQo+ICAgICBmaWxlcyB0aGF0IHJlbGllZCBv
biBpdCBiZWluZyBzZWxlY3RlZCB1bmNvbmRpdGlvbmFsbHkgaW4gdGhlIHBhc3QuDQo+ICAg
ICBUaGlzIGFsc28gbWFrZXMgc2Vuc2Ugc2luY2UgYm90aCBMT0dPIGFuZCBGQl9ERVZJQ0Ug
YXJlIG5vdyBkaXNhYmxlZA0KPiAgICAgYnkgZGVmYXVsdCBmb3IgYnVpbGRzIHdpdGhvdXQg
Q09ORklHX0ZCLCBidXQgRFJNX0ZCREVWX0VNVUxBVElPTg0KPiAgICAgd291bGQgbWFrZSBu
byBzZW5zZSBpZiBhbGwgdGhyZWUgYXJlIGRpc2FibGVkLg0KPiANCj4gRml4ZXM6IGE1YWUz
MzFlZGIwMmIgKCJkcm06IERyb3Agc2VsZWN0IEZSQU1FQlVGRkVSX0NPTlNPTEUgZm9yIERS
TV9GQkRFVl9FTVVMQVRJT04iKQ0KPiBGaXhlczogNzAxZDIwNTRmYTMxNyAoImZiZGV2OiBN
YWtlIHN1cHBvcnQgZm9yIHVzZXJzcGFjZSBpbnRlcmZhY2VzIGNvbmZpZ3VyYWJsZSIpDQo+
IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KDQpB
Y2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgfCAyICstDQo+ICAg
ZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcgICAgfCAxICsNCj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZyB8IDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+IGluZGV4
IDdkZjhiNjg3NWIxMjEuLjE0NGE5YTFkMzFjZWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+IEBA
IC0xMzUsNyArMTM1LDcgQEAgY29uZmlnIERSTV9GQkRFVl9FTVVMQVRJT04NCj4gICAJYm9v
bCAiRW5hYmxlIGxlZ2FjeSBmYmRldiBzdXBwb3J0IGZvciB5b3VyIG1vZGVzZXR0aW5nIGRy
aXZlciINCj4gICAJZGVwZW5kcyBvbiBEUk0NCj4gICAJc2VsZWN0IEZSQU1FQlVGRkVSX0NP
TlNPTEVfREVURUNUX1BSSU1BUlkgaWYgRlJBTUVCVUZGRVJfQ09OU09MRQ0KPiAtCWRlZmF1
bHQgeQ0KPiArCWRlZmF1bHQgRkINCj4gICAJaGVscA0KPiAgIAkgIENob29zZSB0aGlzIG9w
dGlvbiBpZiB5b3UgaGF2ZSBhIG5lZWQgZm9yIHRoZSBsZWdhY3kgZmJkZXYNCj4gICAJICBz
dXBwb3J0LiBOb3RlIHRoYXQgdGhpcyBzdXBwb3J0IGFsc28gcHJvdmlkZXMgdGhlIGxpbnV4
IGNvbnNvbGUNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9LY29uZmln
IGIvZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcNCj4gaW5kZXggYjU3NWNmNTQxNzRh
Zi4uODNjMmQ3MzI5Y2E1OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9jb25zb2xl
L0tjb25maWcNCj4gKysrIGIvZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcNCj4gQEAg
LTc0LDYgKzc0LDcgQEAgY29uZmlnIERVTU1ZX0NPTlNPTEVfUk9XUw0KPiAgIGNvbmZpZyBG
UkFNRUJVRkZFUl9DT05TT0xFDQo+ICAgCWJvb2wgIkZyYW1lYnVmZmVyIENvbnNvbGUgc3Vw
cG9ydCINCj4gICAJZGVwZW5kcyBvbiBGQl9DT1JFICYmICFVTUwNCj4gKwlkZWZhdWx0IERS
TV9GQkRFVl9FTVVMQVRJT04NCj4gICAJc2VsZWN0IFZUX0hXX0NPTlNPTEVfQklORElORw0K
PiAgIAlzZWxlY3QgQ1JDMzINCj4gICAJc2VsZWN0IEZPTlRfU1VQUE9SVA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL0tjb25maWcgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvS2NvbmZpZw0KPiBpbmRleCAxMTRjYjhhYTZjOGZkLi44MDRjMmJlYzli
NDNjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZw0K
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZw0KPiBAQCAtMjgsNyAr
MjgsNyBAQCBjb25maWcgRklSTVdBUkVfRURJRA0KPiAgIGNvbmZpZyBGQl9ERVZJQ0UNCj4g
ICAJYm9vbCAiUHJvdmlkZSBsZWdhY3kgL2Rldi9mYiogZGV2aWNlIg0KPiAgIAlkZXBlbmRz
IG9uIEZCX0NPUkUNCj4gLQlkZWZhdWx0IHkNCj4gKwlkZWZhdWx0IEZCDQo+ICAgCWhlbHAN
Cj4gICAJICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHRoZSBsZWdhY3kgL2Rldi9mYiogZGV2
aWNlIGZpbGUgYW5kDQo+ICAgCSAgaW50ZXJmYWNlcyB3aXRoaW4gc3lzZnMgYW5jIHByb2Nm
cy4gSXQgaXMgb25seSByZXF1aXJlZCBpZiB5b3UNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------HBdjsAFyOEkIfku9Yw1VdQhm--

--------------e0LwbSQiUoDLxKh4O0uZGxrf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUH+4AFAwAAAAAACgkQlh/E3EQov+Bw
cg/8DWmNIhrNugq7VIusUlgLb6hmXZrVDMNb5EAhIQ3zPoRvX5GDYQNioIelPIvlmI/4ziemLPjb
MQt5GI8YJhslppBtw4JCxIh+YJfj1rsE0ihEh331Z9uPfSXfAx9S30MTOjReq1BpliuwsVyKvdz/
yJOrciEJ2ulB/bKsyA+zs7YKuftt/rQxuFg6iNt0kX3sppFvM7o9bO82cG0+CvnZTRGA0slqI+t1
cAdMAicf/CcMvPNXpz4/xpusB0jb3cbVnsK1mQb8+aJ2Ae1EiV7w1Brpw37NSBuOw0WL9qp0hx73
vxijfAqaEmKSXfgEvQJ36b5SbIVP0vtKLG75wm+j8cv9WCiOA82WXw5YOJpd2Hyebe0Dl+RP1FQ5
hGviM1jZTM4cSXmMPFSt5kNItlaK3WLzl7cmJDV1nEJ3vhcRSrgGiLcsG5xxhctdziPhaWfAQmYr
g09UbDuYhblPe0WttEL2ReXv4IgRCZpmro5AlvDv4VKj5zToI541zF9NBWnrOgtPPi9YxMSQt0cK
N3wz9G72qxDNKu+7t2pE0u9XMRGtB/IAUQvmRfEXi+MNMbaR5PbpvxxYgVEzr/yeXIC5DGfnfM4c
t5gjkkzFYXKKcuBwqyrbGhJbyu0tSJ0TmjplCyTE/BZ9jmHza/lETjSk20rRAFmXpLENvaGKuNfL
ST4=
=tLSR
-----END PGP SIGNATURE-----

--------------e0LwbSQiUoDLxKh4O0uZGxrf--
