Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47556D752
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 10:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166B18D05A;
	Mon, 11 Jul 2022 08:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36288D06E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 08:01:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7263122753;
 Mon, 11 Jul 2022 08:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657526500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oj4BVtCIFwbYSA0H36xrqE/nkLuOWXMajd12Fdl0pKA=;
 b=Y/dHjK00pk4kaK1VV4b9LzmEkHUOgHKDCzBZulmplOAvDNAaNmBWHrMQk5gFa7Z1Dpce1P
 kszSrAGX9CfNyS/yvTpESqJTQbm8BUEpD7Guvjqxvx0aQWhLp3tv1QSGLKe52at/nHk5YO
 UaY3bUkfTItThCNCuvSrN/sUYmbSJ7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657526500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oj4BVtCIFwbYSA0H36xrqE/nkLuOWXMajd12Fdl0pKA=;
 b=ILoE4i6DbJ9SvGBXycITzs52ScE0vajzPSQTT4bypZTnjzJsKDfCE85ahN5k6tj57w1EoJ
 lYSDxPL94lKJhFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4802313524;
 Mon, 11 Jul 2022 08:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tZl6EOTYy2IPGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 08:01:40 +0000
Message-ID: <8f90b0d4-5d8b-b06d-4736-7807e013ee7f@suse.de>
Date: Mon, 11 Jul 2022 10:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] fbdev/vga16fb: Auto-generate module init/exit code
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-4-tzimmermann@suse.de>
 <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------btjT0uL0k4hdPYfTFxKt7aSE"
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------btjT0uL0k4hdPYfTFxKt7aSE
Content-Type: multipart/mixed; boundary="------------iQqzbT9BTmQsQYSTaTNJCSHr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Message-ID: <8f90b0d4-5d8b-b06d-4736-7807e013ee7f@suse.de>
Subject: Re: [PATCH 03/11] fbdev/vga16fb: Auto-generate module init/exit code
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-4-tzimmermann@suse.de>
 <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>
In-Reply-To: <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>

--------------iQqzbT9BTmQsQYSTaTNJCSHr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDcuMjIgdW0gMTU6MTYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvNy8yMiAxNzozOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBNb3ZlIHZnYWcxNmZiJ3Mgb3B0aW9uIHBhcnNpbmcgaW50byB0aGUgZHJpdmVyJ3MgcHJv
YmUgZnVuY3Rpb24gYW5kDQo+PiBnZW5lcmF0ZSB0aGUgcmVzdCBvZiB0aGUgbW9kdWxlJ3Mg
aW5pdC9leGl0IGZ1bmN0aW9ucyBmcm9tIG1hY3Jvcy4NCj4+IEtlZXAgdGhlIG9wdGlvbnMg
Y29kZSwgYWx0aG91Z2ggdGhlcmUgYXJlIG5vIG9wdGlvbnMgZGVmaW5lZC4NCj4+DQo+IA0K
PiBBaCwgSSBzZWUgbm93IHdoeSB5b3Ugd2FudGVkIHRvIG1vdmUgdGhlIGNoZWNrIHRvIHRo
ZSBwcm9iZSBmdW5jdGlvbi4gSWYNCj4gaXMgdG8gYWxsb3cgdGhpcyBjbGVhbnVwIHRoZW4g
ZGlzY2FyZCB0aGF0IGNvbW1lbnQgZnJvbSBwcmV2aW91cyBwYXRjaA0KPiBhbmQgSSdtIE9L
IHdpdGggdGhlIG1vdmUuDQo+IA0KPiBNYXliZSB5b3UgY291bGQgY29tbWVudCBpbiBwYXRj
aCAwMi8xMSBjb21taXQgbWVzc2FnZSB0aGF0IHRoZSBjaGVjayBpcw0KPiBtb3ZlZCB0byB0
aGUgcHJvYmUgaGFuZGxlciB0byBhbGxvdyB0aGlzIGNsZWFudXAgYXMgYSBmb2xsb3ctdXAg
cGF0Y2ggPw0KDQpTdXJlLg0KDQpJIG1vc3RseSB3YW50ZWQgdG8gdXNlIG1vZHVsZV9wbGF0
Zm9ybV9kcml2ZXIoKS4gVGhlIG9wdGlvbnMgaGFuZGxpbmcgaXMgDQppbiB0aGUgd2F5Lg0K
DQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi92Z2ExNmZiLmMg
fCAzNSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmdhMTZmYi5jIGIvZHJpdmVycy92aWRl
by9mYmRldi92Z2ExNmZiLmMNCj4+IGluZGV4IGY3YzFiYjAxODg0My4uZTc3NjdlZDUwYzVi
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi92Z2ExNmZiLmMNCj4+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmdhMTZmYi5jDQo+PiBAQCAtMTMyMSwxMiArMTMy
MSwyMSBAQCBzdGF0aWMgaW50IF9faW5pdCB2Z2ExNmZiX3NldHVwKGNoYXIgKm9wdGlvbnMp
DQo+PiAgIA0KPj4gICBzdGF0aWMgaW50IHZnYTE2ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqZGV2KQ0KPj4gICB7DQo+PiArI2lmbmRlZiBNT0RVTEUNCj4+ICsJY2hhciAq
b3B0aW9uID0gTlVMTDsNCj4+ICsjZW5kaWYNCj4+ICAgCXN0cnVjdCBzY3JlZW5faW5mbyAq
c2k7DQo+PiAgIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbzsNCj4+ICAgCXN0cnVjdCB2Z2ExNmZi
X3BhciAqcGFyOw0KPj4gICAJaW50IGk7DQo+PiAgIAlpbnQgcmV0ID0gMDsNCj4+ICAgDQo+
PiArI2lmbmRlZiBNT0RVTEUNCj4+ICsJaWYgKGZiX2dldF9vcHRpb25zKCJ2Z2ExNmZiIiwg
Jm9wdGlvbikpDQo+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4+ICsJdmdhMTZmYl9zZXR1cChv
cHRpb24pOw0KPj4gKyNlbmRpZg0KPj4gKw0KPiANCj4gSSB3b3VsZCBqdXN0IGRyb3AgdGhl
c2UgaWZkZWZlcnkgYW5kIGhhdmUgdGhlIG9wdGlvbiB1bmNvbmRpdGlvbmFsbHkuDQo+IEl0
IHNlZW1zIHRoYXQncyB3aGF0IG1vc3QgZmJkZXYgZHJpdmVycyBkbyBBRkFJQ1QuDQoNCk9y
IGNhbiB3ZSBraWxsIGl0IGVudGlyZWx5PyBUaGVyZSBhcmUgbm8gYWN0dWFsIG9wdGlvbnMu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------iQqzbT9BTmQsQYSTaTNJCSHr--

--------------btjT0uL0k4hdPYfTFxKt7aSE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL2OMFAwAAAAAACgkQlh/E3EQov+Aw
xQ//TzDsUm8TalbmQRyOlLD3xwy/87rKDjeCgx5n9G9H1M+JV9V3OzCl9yaC1oBY+NobVdiS80dx
2O8y3I7Stow4zYwo2ly5oUhHnyxT9Hy6i68AZHq9epWpLwNPyGCoyH7Gk7a4zxI7UmEiVS/jSoR9
4bXFvGnB6n7mAswavsedNlvhVErxrpStKoZ6vTzQX9+H9r5Ho+8mB2ppyeWb9wp9OeFbzWBsBmIS
sMS1L9ZnAMOgGRp0B5cE+6EoU3bUFplGjWWkPWytGiRxDy/bjYV0/c4X+dehSz6j5V6vTAokZeIg
q6PjNFrwGP7zz18LmDAg53/cWmV+UAw+xOj7XxSpjh77cW8xSCLUWQxp5Dsai5FbhC6SUwP8DIA9
l8vgFhQmxSaTMEl5N4zWc2LWeOh5M2toaz7OwB/SZtJ8o1oyaWmEupMUqA/Q3u1QNLCwCdbtu5fV
yTczL7CP2gvlynH3W6xRlz5uMQJfqbWNowcqnJ6ryPkOM8CNqV/Xm489sskV2Z0O4rqVJ3NhuVR9
1bdBFt+gXFaVvZDJ4c3KpMOSjfOrWcaASEcQMStyqVSiLRzgVID1xqqf3YLZ03v1XxmKDp/J4Vp6
E1MHtBeh92WrrQbXfYzs8pvAvlm7oolMfQanmGQmg7jkRzuGs+eH/FPbYQOJOda/gGEvnEg+wcrX
4DQ=
=EQIp
-----END PGP SIGNATURE-----

--------------btjT0uL0k4hdPYfTFxKt7aSE--
