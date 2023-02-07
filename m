Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70368D54B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 12:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B90210E038;
	Tue,  7 Feb 2023 11:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A00210E038
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 11:17:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64B4238D98;
 Tue,  7 Feb 2023 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675768669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6Ny18LTnWv/DAu9COD3MfIOk03Bx1VXBoc2zNPQgVI=;
 b=V+F2mBbYt/OnkVxHeZcF5aNiC1XDAc+feMyrQxdoVcDA6uzM59dkx/UC3T02rgk80JCIL2
 7YI7tLmv6VMTElge2srtBFXv9oH5HjL54/P2zwm3QyNrQ9Szc5zEgel4mxDdWfqBgWBVp1
 m/iszCj/SmjeODl0B2NsXVzSEXQuDpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675768669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6Ny18LTnWv/DAu9COD3MfIOk03Bx1VXBoc2zNPQgVI=;
 b=6czxj3yPIoZiyR/OjjmYO35bBT/aS0gO+cOTHQbaMRh+1qjUp0Xux17VFfc9iNYJsYwnzA
 uPl+HQgNNFUQySCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CA66139ED;
 Tue,  7 Feb 2023 11:17:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8wcYDV0z4mMXOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Feb 2023 11:17:49 +0000
Message-ID: <125d895f-7837-1ded-f121-ef0c5879bc2e@suse.de>
Date: Tue, 7 Feb 2023 12:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/ast: Fix start address computation
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230207105317.224277-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230207105317.224277-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e0KOnjF7ec0Xg8cBWRUhvzRB"
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
--------------e0KOnjF7ec0Xg8cBWRUhvzRB
Content-Type: multipart/mixed; boundary="------------rIDElZnmrRfr3PJHe9hJhkbc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Message-ID: <125d895f-7837-1ded-f121-ef0c5879bc2e@suse.de>
Subject: Re: [PATCH] drm/ast: Fix start address computation
References: <20230207105317.224277-1-jfalempe@redhat.com>
In-Reply-To: <20230207105317.224277-1-jfalempe@redhat.com>

--------------rIDElZnmrRfr3PJHe9hJhkbc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDIuMjMgdW0gMTE6NTMgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IER1cmluZyB0aGUgZHJpdmVyIGNvbnZlcnNpb24gdG8gc2htZW0sIHRoZXJlIGlzIGEgbWlz
c2luZyBwYWdlIHNoaWZ0IHdoZW4NCj4gY29tcHV0aW5nIHRoZSBzdGFydCBhZGRyZXNzIGlu
IEdQVSBtZW1vcnkuDQo+IFRoaXMgbGVhZHMgdG8gZ3JhcGhpYyBnYXJiYWdlIHdoZW4gY29u
bmVjdGluZyB0byB0aGUgcmVtb3RlIEJNQywgZGVwZW5kaW5nDQo+IG9uIHRoZSBQQ0kgc3Rh
cnQgYWRkcmVzcy4NCj4gDQo+IFRlc3RlZCBvbiBhIHNyNjQ1IGFmZmVjdGVkIGJ5IHRoaXMg
YnVnLg0KPiANCj4gRml4ZXM6IGYyZmE1YTk5Y2E4MSAoImRybS9hc3Q6IENvbnZlcnQgYXN0
IHRvIFNITUVNIikNCj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1w
ZUByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IGluZGV4IGM3NDQzMzE3
Yzc0Ny4uZDc1ZTRhNzYxMWIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+
IEBAIC03MTQsNyArNzE0LDcgQEAgc3RhdGljIGludCBhc3RfcHJpbWFyeV9wbGFuZV9pbml0
KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0KQ0KPiAgIAlzdHJ1Y3QgYXN0X3BsYW5lICphc3Rf
cHJpbWFyeV9wbGFuZSA9ICZhc3QtPnByaW1hcnlfcGxhbmU7DQo+ICAgCXN0cnVjdCBkcm1f
cGxhbmUgKnByaW1hcnlfcGxhbmUgPSAmYXN0X3ByaW1hcnlfcGxhbmUtPmJhc2U7DQo+ICAg
CXZvaWQgX19pb21lbSAqdmFkZHIgPSBhc3QtPnZyYW07DQo+IC0JdTY0IG9mZnNldCA9IGFz
dC0+dnJhbV9iYXNlOw0KPiArCXU2NCBvZmZzZXQgPSBhc3QtPnZyYW1fYmFzZSA8PCBQQUdF
X1NISUZUOw0KDQpUaGF0IGNhbid0IGJlIHRoZSBwcm9ibGVtLCBJIHRoaW5rLiB2cmFtX2Jh
c2UgaXMgYWxyZWFkeSBhbiBhZGRyZXNzLiANClsxXSBJbiB0aGUgb2xkIGNvZGUsIGRybV9n
ZW1fdnJhbV9wZ19vZmZzZXQoKSByZXR1cm5lZCBhIHBhZ2UgaW5kZXguIFNvIA0Kc2hpZnRp
bmcgaXQgdG8gdGhlIGxlZnQgaGVyZSBpcyBtb3N0IGxpa2VseSBpbmNvcnJlY3QuDQoNCkNh
biB5b3UgdmVyaWZ5IHRoYXQgdGhlIG5ldyBvZmZzZXQgaXMgdGhlIHNhbWUgYXMgdGhlIG9s
ZCBvbmU/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjItcmM3L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tbS5jI0w5Ng0KDQo+ICAgCXVuc2lnbmVkIGxvbmcgY3Vyc29yX3NpemUgPSByb3Vu
ZHVwKEFTVF9IV0NfU0laRSArIEFTVF9IV0NfU0lHTkFUVVJFX1NJWkUsIFBBR0VfU0laRSk7
DQo+ICAgCXVuc2lnbmVkIGxvbmcgc2l6ZSA9IGFzdC0+dnJhbV9mYl9hdmFpbGFibGUgLSBj
dXJzb3Jfc2l6ZTsNCj4gICAJaW50IHJldDsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------rIDElZnmrRfr3PJHe9hJhkbc--

--------------e0KOnjF7ec0Xg8cBWRUhvzRB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPiM1wFAwAAAAAACgkQlh/E3EQov+B6
aw//Szx0Icu6FJe1hvREWMw9D8zMsclXotcEgd0v864fXdPkXnA4OCVoM6SOEIZj7xrt7Cp4wwoh
vUZ9vW9D6aY+j08T6l+ERdI6BC0YOFd3h4pxjFvfd0cfm0QtlvD45/vszY39mWWEd2kUv1eEzLIK
meM1+cfG8HmzMhojxBxVwFRN/lwReU5cbEBm/aDH/bPIgi84UBkew0tXS40LExz58XSRFqqaaUV+
AekuXIi2EKo/Vlk0P+IzDi3zuMQfqOblaj1WV9GCCfWlTKpQT86lqHoT3hQmNWg1LsBxamUAo7/n
3osgCj7MMNyoN5O5v/0/8aGwYOsVeC+lOc1NCV/iqY83lQ7Y6wg4FTzJbLl78ofaw9CtJmX2qqsE
WvL1sk/hRsQTt5sHIQ/R5wxe3/2qHOMPGvVtRkmnZQ2xez8Cfhtf3j3hnW6jYh9Tt0S79bi2NoaK
m6K/fZD+xMACFVdZK7wI1+BihInpvx1h2oC78l3b+bQEXd854PZxoF71YmtENYJf8DPlIFRLNFnD
TNCH2MWP29YkbusO8IbBE3qOEV8JWyCDINAUgbEy82uuCqKE6uEOt4y6qJKyGg/blLrm5dF3Ydjp
lvUMy1MdZl9HypG7KSDsGabEgxaDKj+K1hNPgzXW+0amI2Z1CM1QTcmZsOdG16TSumh+kM70Ig5v
6/4=
=wTJB
-----END PGP SIGNATURE-----

--------------e0KOnjF7ec0Xg8cBWRUhvzRB--
