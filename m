Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82F48D3D7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D3710E611;
	Thu, 13 Jan 2022 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9409010E611
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 08:52:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 069D421637;
 Thu, 13 Jan 2022 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642063924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=whydE7yJE4jxKVc+8U38NPk2fNZs4f5bKOAaqaqQCgM=;
 b=jydVH6ZAfwFZKAiYz1dUTL+aLtiNhBqBq5UDV4CXYMNSzRPjvoDnrXmAOIXtoXFWBdeDSZ
 PzM4cM3EiD+DstiQX35WMpWFr7ArPB4Wj0hvzpdwTOremIUzypKtPJruK659SLRt17hHiZ
 ZvOk51OkhGHYalRNI0atWAmWzXSjYvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642063924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=whydE7yJE4jxKVc+8U38NPk2fNZs4f5bKOAaqaqQCgM=;
 b=r6nW9pf32wQjNjCuMOoi0+VVlP1YwAPfUh+SnIkEFfePwISnHG6lnyZEBZXnRrD4IzIoVS
 7CPqTusb2pIPu9Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA6D913B87;
 Thu, 13 Jan 2022 08:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YypQMDPo32EgWAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jan 2022 08:52:03 +0000
Message-ID: <aba1a416-cfec-dadb-fff6-48b95346173d@suse.de>
Date: Thu, 13 Jan 2022 09:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 0/7] agp: Various minor fixes
Content-Language: en-US
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
References: <20211201114645.15384-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211201114645.15384-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LetDfMpvKdMeP0CUdLSUjzFd"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LetDfMpvKdMeP0CUdLSUjzFd
Content-Type: multipart/mixed; boundary="------------0kUBlabxWxOfnm3eXBUN3X0e";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <aba1a416-cfec-dadb-fff6-48b95346173d@suse.de>
Subject: Re: [PATCH v2 0/7] agp: Various minor fixes
References: <20211201114645.15384-1-tzimmermann@suse.de>
In-Reply-To: <20211201114645.15384-1-tzimmermann@suse.de>

--------------0kUBlabxWxOfnm3eXBUN3X0e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZyENCg0KVGhpcyBwYXRjaHNldCBnb3QgbG9zdC4gUGF0Y2hlcyA0IGFuZCA1IHN0aWxs
IG5lZWQgYSByZXZpZXcuDQoNCkFtIDAxLjEyLjIxIHVtIDEyOjQ2IHNjaHJpZWIgVGhvbWFz
IFppbW1lcm1hbm46DQo+IEZpeCBhIG51bWJlciBvZiBjb21waWxlciB3YXJuaW5ncyBpbiB0
aGUgQUdQIGRyaXZlcnMuIE5vIGZ1bmN0aW9uYWwNCj4gY2hhbmdlcy4NCj4gDQo+IHYyOg0K
PiAJKiBhdGktYWdwOiBmcmVlIHBhZ2UgaW4gZXJyb3IgYnJhbmNoIChIZWxnZSkNCj4gCSog
bnZpZGlhLWFncDogTWFyayB0ZW1wIGFzIF9fbWF5YmVfdW51c2VkIChIZWxnZSkNCj4gDQo+
IFRob21hcyBaaW1tZXJtYW5uICg3KToNCj4gICAgYWdwOiBSZW1vdmUgdHJhaWxpbmcgd2hp
dGVzcGFjZXMNCj4gICAgYWdwOiBJbmNsdWRlICJjb21wYXRfaW9jdGwuaCIgd2hlcmUgbmVj
ZXNzYXJ5DQo+ICAgIGFncDogRG9jdW1lbnRhdGlvbiBmaXhlcw0KPiAgICBhZ3AvYXRpOiBS
ZXR1cm4gZXJyb3IgZnJvbSBhdGlfY3JlYXRlX3BhZ2VfbWFwKCkNCj4gICAgYWdwL252aWRp
YTogRGVjbGFyZSB2YWx1ZSByZXR1cm5lZCBieSByZWFkbCgpIGFzIHVudXNlZA0KPiAgICBh
Z3Avc3dvcmtzOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdjdXJyZW50X3NpemUnDQo+ICAg
IGFncC92aWE6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ2N1cnJlbnRfc2l6ZScNCj4gDQo+
ICAgZHJpdmVycy9jaGFyL2FncC9hdGktYWdwLmMgICAgfCA4ICsrKysrKy0tDQo+ICAgZHJp
dmVycy9jaGFyL2FncC9iYWNrZW5kLmMgICAgfCAyICsrDQo+ICAgZHJpdmVycy9jaGFyL2Fn
cC9mcm9udGVuZC5jICAgfCA0ICsrKy0NCj4gICBkcml2ZXJzL2NoYXIvYWdwL252aWRpYS1h
Z3AuYyB8IDMgKystDQo+ICAgZHJpdmVycy9jaGFyL2FncC9zd29ya3MtYWdwLmMgfCA1ICst
LS0tDQo+ICAgZHJpdmVycy9jaGFyL2FncC92aWEtYWdwLmMgICAgfCAzIC0tLQ0KPiAgIDYg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0K
PiANCj4gYmFzZS1jb21taXQ6IDZhOGY5MGVjNDMzZTJmNWRlNWZjMTZkN2E0ODM5NzcxYjcw
MjdjYzANCj4gLS0NCj4gMi4zNC4wDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------0kUBlabxWxOfnm3eXBUN3X0e--

--------------LetDfMpvKdMeP0CUdLSUjzFd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHf5/wFAwAAAAAACgkQlh/E3EQov+CY
9RAAmlzwdhLBgz7oOQqqtKCg++qXuvOyaBdjdIXpYL+pI6fPmq8nOgLbYl4Ra77ZRfLdAfxeOEEK
JFh/yOprI4c6SgTCO73ziKals9Q5klrHfK23ob3T0+fgmOWoKGVEraENmDzcLAjKGDBHchXJykj0
PXszBJ0AHs3ub6LYNj0Wc8Q8M4UyMuwnQ+N1kTsfPzpiqsBvugPSpR0iiSK4rbri/woNaytuBX6P
yiDe99ZmmgTwyPs1cZN2AOgh8/BjzO3wc5Ha2+WI1mvl4C0r+NMuWNDT3W2K5v+qNC3QQQhBSXV+
i42F8ykH9fptXxxUlXIab+QWgp4+g65W0jcADBju2gKkXyw1J02ddyc9KVemeZEaV/j3Lfs1kGJ7
aafvMW53GSjlBpkgERaJXTDi/VMIXftoTeQTzpfROyokfPzvgAASzqtm7YtMtQS9ZK38oo0Drpcz
Te43aP1y58+EIm2YIZl2LXYmFXwhWDm7oaU3e36kbHHJbHHCfNdUR7+4xWjZaQvZ4bZn89HQB02X
GfqEQaurBsSzIbu/xaEnPq+LpUSeSI/JH44i5odTXEXxfWN1ZSyZs2PPPtfjRnueAmztYz64TMmz
kZ4RQrAb65GBHWMFTKaAOBodsXFiLUT36drALOCFgu/aJwDkGXt2wnAaxWGCuMItyF1QLdzA+4np
G+s=
=OkbL
-----END PGP SIGNATURE-----

--------------LetDfMpvKdMeP0CUdLSUjzFd--
