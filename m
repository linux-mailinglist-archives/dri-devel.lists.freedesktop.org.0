Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A06E73BE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 09:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244710E0A5;
	Wed, 19 Apr 2023 07:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E6C10E0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:14:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8350C2198F;
 Wed, 19 Apr 2023 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681888443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rz+Hn077Yo3kPFhUAFdbkJbkADKkrlMPX0EwRrAGNsw=;
 b=1fD5wgmiThlJOx0yt3xZv7iZOELP9U1zd3RaFCpqW5rgBvpHWxPvZJ14s3UGFmGomBkPlG
 faBrLRD/QVGXhKZNbltkb5N9Q+Cc62qHqJLGNfgWHaBc8wqPsVzcJ5TX+uX/+yqrda/Ukr
 XiRxcR5Mzwbm+5WJt/Eit6DhkW7dTC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681888443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rz+Hn077Yo3kPFhUAFdbkJbkADKkrlMPX0EwRrAGNsw=;
 b=76YeVVr+NXo/2Xzxg/r0XPnYrCQCdyiTumht9RO2OfOf4IuBOMWB+5vbmLzszSBkUY4uw/
 GfQWhUMh4Lsd0vBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58F5E13580;
 Wed, 19 Apr 2023 07:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E/p9FLuUP2RAPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Apr 2023 07:14:03 +0000
Message-ID: <26277a0c-abda-c13a-80bf-528b9e167c21@suse.de>
Date: Wed, 19 Apr 2023 09:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] firmware/sysfb: Fix VESA format selection
Content-Language: en-US
To: Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
References: <20230419044834.10816-1-pa@panix.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230419044834.10816-1-pa@panix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8hFjLRHSEtUGM507fAL0vDGP"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8hFjLRHSEtUGM507fAL0vDGP
Content-Type: multipart/mixed; boundary="------------uEqFfAA6VaqII6pN10crJEvB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Message-ID: <26277a0c-abda-c13a-80bf-528b9e167c21@suse.de>
Subject: Re: [PATCH v2] firmware/sysfb: Fix VESA format selection
References: <20230419044834.10816-1-pa@panix.com>
In-Reply-To: <20230419044834.10816-1-pa@panix.com>

--------------uEqFfAA6VaqII6pN10crJEvB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDQuMjMgdW0gMDY6NDggc2NocmllYiBQaWVycmUgQXNzZWxpbjoNCj4g
U29tZSBsZWdhY3kgQklPU2VzIHJlcG9ydCBubyByZXNlcnZlZCBiaXRzIGluIHRoZWlyIDMy
LWJpdCByZ2IgbW9kZSwNCj4gYnJlYWtpbmcgdGhlIGNhbGN1bGF0aW9uIG9mIGJpdHNfcGVy
X3BpeGVsIGluIGNvbW1pdCBmMzVjZDNmYTc3MjkNCj4gW2Zpcm13YXJlL3N5c2ZiOiBGaXgg
RUZJL1ZFU0EgZm9ybWF0IHNlbGVjdGlvbl0uICBIb3dldmVyIHRoZXkgcmVwb3J0DQo+IGxm
Yl9kZXB0aCBjb3JyZWN0bHkgZm9yIHRob3NlIG1vZGVzLiAgS2VlcCB0aGUgY29tcHV0YXRp
b24gYnV0DQo+IHNldCBiaXRzX3Blcl9waXhlbCB0byBsZmJfZGVwdGggaWYgdGhlIGxhdHRl
ciBpcyBsYXJnZXIuDQo+IA0KPiB2MiBmaXhlcyB0aGUgd2FybmluZ3MgZnJvbSBhIG1heDMo
KSBtYWNybyB3aXRoIGFyZ3VtZW50cyBvZiBkaWZmZXJlbnQNCj4gdHlwZXM7ICBzcGxpdCB0
aGUgYml0c19wZXJfcGl4ZWwgYXNzaWdubWVudCB0byBhdm9pZCB1Z2x5ZmluZyB0aGUgY29k
ZQ0KPiB3aXRoIHRvbyBtYW55IHR5cGVjYXN0cy4NCg0KV2hhdCBleGFjdGx5IHdhcyB0aGF0
IHdhcm5pbmc/DQoNCj4gDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvNFBz
bTZCNkxxa3oxUVhNQHBhbml4My5wYW5peC5jb20NCj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIzMDQxMjE1MDIyNS4zNzU3MjIzLTEtamF2aWVybUByZWRoYXQuY29t
DQo+IEZpeGVzOiBmMzVjZDNmYTc3MjkgW2Zpcm13YXJlL3N5c2ZiOiBGaXggRUZJL1ZFU0Eg
Zm9ybWF0IHNlbGVjdGlvbl0NCj4gU2lnbmVkLW9mZi1ieTogUGllcnJlIEFzc2VsaW4gPHBh
QHBhbml4LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVm
Yi5jIHwgNCArKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJf
c2ltcGxlZmIuYyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYw0KPiBpbmRl
eCA4MmM2NGNiOWY1MzEuLjM1OGI3OTJhODg0NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9m
aXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jDQo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvc3lz
ZmJfc2ltcGxlZmIuYw0KPiBAQCAtNTEsNyArNTEsOCBAQCBfX2luaXQgYm9vbCBzeXNmYl9w
YXJzZV9tb2RlKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksDQo+ICAgCSAqDQo+ICAg
CSAqIEl0J3Mgbm90IGVhc2lseSBwb3NzaWJsZSB0byBmaXggdGhpcyBpbiBzdHJ1Y3Qgc2Ny
ZWVuX2luZm8sDQo+ICAgCSAqIGFzIHRoaXMgY291bGQgYnJlYWsgVUFQSS4gVGhlIGJlc3Qg
c29sdXRpb24gaXMgdG8gY29tcHV0ZQ0KPiAtCSAqIGJpdHNfcGVyX3BpeGVsIGhlcmUgYW5k
IGlnbm9yZSBsZmJfZGVwdGguIEluIHRoZSBsb29wIGJlbG93LA0KPiArCSAqIGJpdHNfcGVy
X3BpeGVsIGZyb20gdGhlIGNvbG9yIGJpdHMsIHJlc2VydmVkIGJpdHMgYW5kDQo+ICsJICog
cmVwb3J0ZWQgbGZiX2RlcHRoLCB3aGljaGV2ZXIgaXMgaGlnaGVzdC4gIEluIHRoZSBsb29w
IGJlbG93LA0KPiAgIAkgKiBpZ25vcmUgc2ltcGxlZmIgZm9ybWF0cyB3aXRoIGFscGhhIGJp
dHMsIGFzIEVGSSBhbmQgVkVTQQ0KPiAgIAkgKiBkb24ndCBzcGVjaWZ5IGFscGhhIGNoYW5u
ZWxzLg0KPiAgIAkgKi8NCj4gQEAgLTYwLDYgKzYxLDcgQEAgX19pbml0IGJvb2wgc3lzZmJf
cGFyc2VfbW9kZShjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpLA0KPiAgIAkJCQkJICBz
aS0+Z3JlZW5fc2l6ZSArIHNpLT5ncmVlbl9wb3MsDQo+ICAgCQkJCQkgIHNpLT5ibHVlX3Np
emUgKyBzaS0+Ymx1ZV9wb3MpLA0KPiAgIAkJCQkgICAgIHNpLT5yc3ZkX3NpemUgKyBzaS0+
cnN2ZF9wb3MpOw0KPiArCQliaXRzX3Blcl9waXhlbD0gbWF4KGJpdHNfcGVyX3BpeGVsLCAo
dTMyKXNpLT5sZmJfZGVwdGgpOw0KDQpJIGxpa2VkIHRoZSBhbGwtaW4tb25lIGFzc2lnbm1l
bnQgb2YgdGhlIG9yaWdpbmFsIHBhdGNoLiBTbyBJJ2QgcmF0aGVyIA0KZ28gYmFjayB0byB2
MSBhbmQgY29weSBzaS0+bGZiX2RlcHRoIHRvIHRoZSBjb3JyZWN0IHR5cGUsIGxpa2UgdGhp
czoNCg0KICAgdTMyIGRlcHRoID0gc2ktPmxmYl9kZXB0aDsNCg0KICAgYml0c19wZXJfcGl4
ZWwgPSBtYXgzKG1heDMoY29sb3JzKSwNCiAgIAkJICAgICAgICByc3ZkLA0KICAgICAgICAg
ICAgICAgICAgICAgICAgIGRlcHRoKTsNCg0KT3IsIGlmIHlvdSB3YW50IHRvIGdldCBmYW5j
eSwgeW91IGNvdWxkIGFkZCBtYXgzX3QoKSB0byA8bGludXgvbWlubWF4Lmg+DQoNCiAgICNk
ZWZpbmUgbWF4M190KHR5cGUsIHgsIHksIHopICAgbWF4X3QodHlwZSwgbWF4X3QodHlwZSwg
eCwgeSksIHopDQoNCmFuZCBkbw0KDQogICBiaXRzX3Blcl9waXhlbCA9IG1heDNfdCh1MzIs
DQogICAgICAgICAgICAgICAgICAgICAgICAgICBtYXgzKGNvbG9ycyksDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICByc3ZkLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgc2kt
PmxmYl9kZXB0aCkNCg0KWW91IGNvdWxkIGFsc28gYWRkIGEgbWF4NF90KHR5cGUsIHgsIHks
IHosIHcpIHRvIDxsaW51eC9taW5tYXguaD4gYW5kIA0KY29tcGFyZSBhbGwgdmFsdWVzIHdp
dGggbWF4NF90KCkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiAgIAl9IGVsc2Ug
ew0KPiAgIAkJYml0c19wZXJfcGl4ZWwgPSBzaS0+bGZiX2RlcHRoOw0KPiAgIAl9DQo+IA0K
PiBiYXNlLWNvbW1pdDogNmE4ZjU3YWUyZWIwN2FiMzlhNmYwY2NhZDYwYzc2MDc0MzA1MTAy
Ng0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------uEqFfAA6VaqII6pN10crJEvB--

--------------8hFjLRHSEtUGM507fAL0vDGP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ/lLoFAwAAAAAACgkQlh/E3EQov+BY
oxAAzjC6iA2t7ZP+PBptKOIzS5c43hAl0mIxLUL9lmAdJ61FCpJqZOXl2D/TmJZZBZ/bLOlLwUoh
SdeY2HtpHE5OZ1GStAfIKcH5Kv6+j2xI6mpk17jCiFw30LyAt+IRwPF71Be82+ApvMyYxdtBpK99
9WX5F9Rjw5Jv2WS1wTFYA7tYl/UEVyBVPbwE7jau/W6Wtz//r2h7FZ6XyIAQPGrNvVoO7leVomgB
lOQqSxbtc0erSvgTAYGS5I9NYIlZMcFupN1K1aaQREMdGLjDzIl0MQnb/X2FpYKcfQ4nYCP4Vq3+
aY2JQZc4IPZUDa1cok2n6YoKlemjdIdIEwdcf9WdC8PPr9MJamXEUEfG5FtTOqyP5SJlic4ClwLm
Y1hI6vzGalq/r0YgJq7AtJtSOjGAPPaGDd1NxoZIq7sBy5lnrsod6uimyMQt5rLTPRiXW10zqBx/
KXkJPGf6v5QPurxVFLJX3fpuikVqZJH9Gc1zH0WyA7M6i0G2f8XE0F41G83z95qe18VnTB7KZOZF
sbjMQj+gstUPVuMtSgqFQUCpJqsbDhlDj0wX9g6WtWhDH5jVFZt28IrvmTN9zJCQNrxel6CC0d/m
7IYDrcbXhnUmdXA9YLttz93Yr1h0xSxNRd9vrUUXavGAvb2ocHvKslYTsCF4f2iuxiijhX0whAIk
s60=
=eP7d
-----END PGP SIGNATURE-----

--------------8hFjLRHSEtUGM507fAL0vDGP--
