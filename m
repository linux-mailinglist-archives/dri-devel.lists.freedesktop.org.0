Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04A476BC6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DE510E729;
	Thu, 16 Dec 2021 08:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF0010E729
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 08:20:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 803D9210FD;
 Thu, 16 Dec 2021 08:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639642843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1MEtPyU/D2PkANCH6wQEIbPHzWEZ/Tp0+Q3ym56Xpk=;
 b=q3ieCT8WcpnuQ/0iwOM1cgRGfIHnVfaKUgtByWe+69Xa/6P8On0J95FuXccdqTUzDPegy8
 MbDHDgEHUUy3D5C7JH63A91bSUeVV4XcT3xSNUJUN1+oQ8iyfmYJOd8DENnGLhWX9gwcd0
 LhyzjuIXmL6//YsXNHMA9PW31UQpqJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639642843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1MEtPyU/D2PkANCH6wQEIbPHzWEZ/Tp0+Q3ym56Xpk=;
 b=6H4hpGldWIZLVYhsx+YCTIH0LnBTUK9y3Yrwd+Q3JhAdsx6Fu00SNfWpWeOrR/YZQf1tBy
 I7CRd1OmX92kAlDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 639BD13C0C;
 Thu, 16 Dec 2021 08:20:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id peVCF9v2umFEQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Dec 2021 08:20:43 +0000
Message-ID: <041430de-c0a0-d0eb-81d5-eeee3204ce23@suse.de>
Date: Thu, 16 Dec 2021 09:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 11/60] drm/gud: Add support for the nomodeset kernel
 parameter
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-12-javierm@redhat.com>
 <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OuCp2pMrpe0bCrN8DB8Atd5e"
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
--------------OuCp2pMrpe0bCrN8DB8Atd5e
Content-Type: multipart/mixed; boundary="------------1crH0C4rSftW08LJ0e6ypRRP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <041430de-c0a0-d0eb-81d5-eeee3204ce23@suse.de>
Subject: Re: [PATCH 11/60] drm/gud: Add support for the nomodeset kernel
 parameter
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-12-javierm@redhat.com>
 <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
In-Reply-To: <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>

--------------1crH0C4rSftW08LJ0e6ypRRP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMjI6Mzcgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDE1LjEyLjIwMjEgMDEuNTksIHNrcmV2IEphdmllciBNYXJ0aW5leiBD
YW5pbGxhczoNCj4+IEFjY29yZGluZyB0byBkaXNhYmxlIERvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0LCB0aGlzDQo+PiBwYXJhbWV0ZXIgY2FuIGJl
IHVzZWQgdG8gZGlzYWJsZSBrZXJuZWwgbW9kZXNldHRpbmcuDQo+Pg0KPj4gRFJNIGRyaXZl
cnMgd2lsbCBub3QgcGVyZm9ybSBkaXNwbGF5LW1vZGUgY2hhbmdlcyBvciBhY2NlbGVyYXRl
ZCByZW5kZXJpbmcNCj4+IGFuZCBvbmx5IHRoZSBzeXN0ZXdtIHN5c3RlbSBmcmFtZWJ1ZmZl
ciB3aWxsIGJlIGF2YWlsYWJsZSBpZiBpdCB3YXMgc2V0LXVwLg0KPj4NCj4+IEJ1dCBvbmx5
IGEgZmV3IERSTSBkcml2ZXJzIGN1cnJlbnRseSBjaGVjayBmb3Igbm9tb2Rlc2V0LCBtYWtl
IHRoaXMgZHJpdmVyDQo+PiB0byBhbHNvIHN1cHBvcnQgdGhlIGNvbW1hbmQgbGluZSBwYXJh
bWV0ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+DQo+IA0KPiBJIGRvbid0IHVuZGVy
c3RhbmQgd2h5IHRoaXMgaXMgYXBwbGljYWJsZSB0byBVU0IgZHJpdmVycywgdGhlcmUncyBu
byB3YXkNCj4gdGhlIGZpcm13YXJlIGNhbiBzZXR1cCBhIGZyYW1lYnVmZmVyIGFuZCBjb250
aW51ZSBwdXNoaW5nIHBpeGVscyBvdmVyDQo+IFVTQiB3aGVuIExpbnV4IGhhcyBiZWVuIGdp
dmVuIGNvbnRyb2wgb3ZlciB0aGUgVVNCIGJ1cz8NCj4gDQo+IFRoZSBzYW1lIGFyZ3VtZW50
IGdvZXMgZm9yIHRoZSBTUEkgZHJpdmVycyBpbiBkcm0vdGlueS8gYXMgd2VsbC4NCg0KVGhl
IGludGVuZGVkIHNlbWFudGljcyBvZiB0aGUgb3B0aW9uIGlzIHRvIGRpc2FibGUgZXZlcnkg
ZGlzcGxheSBvdXRwdXQgDQpleGNlcHQgZm9yIHRoZSBidWZmZXIgcHJvdmlkZWQgYnkgdGhl
IGZpcm13YXJlLg0KDQpXaXRoIFVTQiBpdCBzdGlsbCB3b3VsZCBzdGlsbCBkaXNhYmxlIHRo
ZSBkcml2ZXIuIFRoYXQncyB1c2VmdWwgaWYgb25seSANCmZvciBkZWJ1Z2dpbmcuIFRoZXJl
IGFyZSBhbHNvIHN5c3RlbXMgd2l0aCBoYXJkLXdpcmVkIFVTQiBkaXNwbGF5cyB3aGVyZSAN
Cm9uZSBjYW5ub3QganVzdCB1bnBsdWcgdGhlIGFkYXB0ZXIuDQoNCkFkbWl0dGVkbHksIFVT
QiBncmFwaGljcyBpcyBhIGJpdCBvZiBhbiBvZGQgdXNlIGNhc2UsIGJ1dCBuZWl0aGVyIGlz
IGl0IA0KdG9vIGZhciBmZXRjaGVkIElNSE8uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IE5vcmFsZi4NCj4gDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5j
IHwgMyArKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ndWQvZ3VkX2Rydi5jDQo+PiBpbmRleCAzZjlkNGI5YTFlM2QuLjRkMjUzZDI0
OTUxMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYw0KPj4gQEAgLTQ0Niw2ICs0
NDYsOSBAQCBzdGF0aWMgaW50IGd1ZF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50
ZiwgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgKmlkKQ0KPj4gICAJdTMyICpmb3JtYXRz
Ow0KPj4gICAJaW50IHJldCwgaTsNCj4+ICAgDQo+PiArCWlmIChkcm1fZmlybXdhcmVfZHJp
dmVyc19vbmx5KCkpDQo+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4+ICsNCj4+ICAgCXJldCA9
IHVzYl9maW5kX2J1bGtfb3V0X2VuZHBvaW50KGludGYtPmN1cl9hbHRzZXR0aW5nLCAmYnVs
a19vdXQpOw0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4NCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------1crH0C4rSftW08LJ0e6ypRRP--

--------------OuCp2pMrpe0bCrN8DB8Atd5e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG69toFAwAAAAAACgkQlh/E3EQov+CC
/A/+P2sDtTtuGwMGG08kv3L3bMnRYIrT3fx54SxznXWvPfb3BjpPn46CEZZprdelueBfDaPFxyyV
XxPJxU2IXBet7++pYW1y+gQf5IlqA0+GcvTq9PlqmcyAayd7tGF6mLbzz+xJuCVomRfyUrM/OKWN
QHPDOGvuUG+wSYx5QRYI47KtRYY6st+KXEy9VE2GW3c/klNPU85j9lV2aDwWBczN9/Wfh1CInpuK
uJGx23JdvVuOADInKSEdvBvcrfoT4uGBm085tDwt3mqI8l0+Z9b2Rkz/2mTLNnqLrKSkzSuaWmHh
rwIZNc5IFybk8rJ40Nig/yT7C1JjnwebAQlRLBcW11C/iOkOOFyHNCDco0P1/jmAJpiPPCPo48UJ
wkuqjM8Ws1O4nhtTPoqGVNBpsHUwL+mj6IUkurvv6npgNv4ZLC4Tzw4PPCVimq5bdNpooCAgXlON
IZQOCVLgWy3HqhnaFNJ4OIjhJXSy8vsF56U/h/JR7Py0FATIAOj8qNcVSuSe8A5pdMHzFvR4CvMS
4/Uk8/RofMorOQWiYeHp1EeWvOOKjvW9DzmRWdBl6ri73qAT0RUi0QL6j68QnVwzZAnGRE0k9Zps
tu1fiqbqVBJxh54WsiEq2hTGMWloaPqO6W6DkNSOcUl4EGGLk0dOHdOPeDJBi6DprPWcPfak1WBW
h4o=
=0cvI
-----END PGP SIGNATURE-----

--------------OuCp2pMrpe0bCrN8DB8Atd5e--
