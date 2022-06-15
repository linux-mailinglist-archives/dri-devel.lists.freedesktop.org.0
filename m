Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D356754C2E5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 09:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9410EF45;
	Wed, 15 Jun 2022 07:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D5C10F2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:53:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 357F721C0A;
 Wed, 15 Jun 2022 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655279599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/T9eCBq3CXqG3FOXrArMCCUoXgyMIql8DYODd00asA=;
 b=vPbWTmP3gxQBbAfk1GOpUxIuL4kS4BMZLvxnY+JXS4Gh1CTc9bD6K1IBN2gqOaGe1o4vMB
 0iuinbwVcWq4+VXbEGL6PlwL/qtKXZFQcFF7RCYSYiwGInhr7DtquSqwSWhe+pAm4gkbRc
 kNJHvg7AzVN4YpB+4v+SEPurwsa2Z+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655279599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/T9eCBq3CXqG3FOXrArMCCUoXgyMIql8DYODd00asA=;
 b=YZ/wh51mKMWZs+isqxFXbp33IF+75XKZyL0pzZPK5VYepssFGHbfOomzCVLtfCZpypds8T
 QHaksisgKuwEC1Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1647F13A35;
 Wed, 15 Jun 2022 07:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bjhOBO+PqWLNFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jun 2022 07:53:19 +0000
Message-ID: <0b6426ec-b436-29b4-43d8-cf6449b3a202@suse.de>
Date: Wed, 15 Jun 2022 09:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
 <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
 <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6oS7Yf6Pnn94E5VmBjNS0zao"
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6oS7Yf6Pnn94E5VmBjNS0zao
Content-Type: multipart/mixed; boundary="------------xNH3C5bX2X6Kg8JvykM6y0XG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <0b6426ec-b436-29b4-43d8-cf6449b3a202@suse.de>
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
 <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
 <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>
In-Reply-To: <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>

--------------xNH3C5bX2X6Kg8JvykM6y0XG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE1LjA2LjIyIHVtIDA5OjUwIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KWy4uLl0NCj4+IEhpc3RvcmljYWxseSwgbW9zdCBkcml2ZXJzIGNhbGwgdGhpcyBm
dW5jdGlvbiB2ZXJ5IGVhcmx5LiBCdXQgZm9yIGVycm9yDQo+PiByZWNvdmVyeSBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gZG8gaXQgYXMgbGF0ZSBhcyBwb3NzaWJsZS4gIElkZWFsbHksDQo+
PiBkcml2ZXJzIHdvdWxkIGZpcnN0IGluaXRpYWxpemUgdGhlaXIgRFJNIHNvZnR3YXJlIHN0
YXRlLCB0aGVuIGtpY2tvdXQNCj4+IHRoZSBnZW5lcmljIGRyaXZlciwgYW5kIGZpbmFsbHkg
dGFrZSBvdmVyIGhhcmR3YXJlLiBCdXQgdGhhdCB3b3VsZA0KPj4gcmVxdWlyZSBhIGNhcmVm
dWwgcmV2aWV3IG9mIGVhY2ggZHJpdmVyLiA6Lw0KPj4NCj4gDQo+IFdlIGdvdCBidWcgcmVw
b3J0cyBvbiBGZWRvcmEgYWJvdXQgcmVncmVzc2lvbnMgY2F1c2VkIGJ5IHRoZSBmYWN0IHRo
YXQgc29tZQ0KPiBwcm9ncmFtcyBtYWRlIHRoZSAod3JvbmcpIGFzc3VtcHRpb24gdGhhdCAv
ZGV2L2RyaS9jYXJkMCB3b3VsZCBiZSB0aGUgIm1haW4iDQo+IGRpc3BsYXkgYW5kIGp1c3Qg
aGFyZC1jb2RlZCB0aGF0IHBhdGguDQoNClNoaCEgRG9uJ3QgdGVsbCBhbnlvbmUuDQoNCj4g
DQo+IEJ1dCByZW1vdmluZyB0aGUgY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzIGFmdGVyIGNh
bGxpbmcgZGV2bV9kcm1fZGV2X2FsbG9jKCkNCj4gYnJlYWtzIHRoaXMgYXNzdW1wdGlvbiwg
c2luY2UgdGhlIHJlZ2lzdGVyZWQgZGV2aWNlIHdpbGwgYmUgL2Rldi9kcmkvY2FyZDEuDQo+
IA0KPiBBbGwgdGhpcyBpcyB0byBzYXkgdGhhdCBkb2luZyBpdCB0b28gbGF0ZSwgZXZlbiBp
ZiBub3RoaW5nIGlzIHRvdWNoaW5nIHRoZSBIVw0KPiB5ZXQsIGNvdWxkIHN0aWxsIGhhdmUg
dW5leHBlY3RlZCBjb25zZXF1ZW5jZXMgYWNyb3NzIHlvdXIgZ3JhcGhpY3Mgc3RhY2suDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------xNH3C5bX2X6Kg8JvykM6y0XG--

--------------6oS7Yf6Pnn94E5VmBjNS0zao
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKpj+4FAwAAAAAACgkQlh/E3EQov+Co
nw//S58OK0qF57zN9ZkjzDK4k6CA395LG4iBQ6TT+BwQNEe92DP/+cNzWu8JyG0hNBKv5jyXOTXu
DPXeFy1a8w1ea4ID/dQDjQshSDZ4tNlnkjyfmEm2nSIqTzZ1PRfbkTX9RcoIIdf/y5BXp0H2hcZD
kJoTZ+7sHeTeLNvlpMCzCbStENP44DaX90vIDEu2O7bFYDmGedA7L/fALFteMuYl+DSFCA+cdN8K
uarEQedwbjL2Zsn5qbatsOQttxigfuvsBLQx73zvGLAgr3T75O1M9El6je8z/GUofV2eHQVMS8li
u0pPYvsujO85bcIzkJ5eQeGXTKlE2D+YxsL7NFfX52g3DLyYHwWOkWCqJrv4LRsaP8Kugdsqui1J
rsZRzpDeRxBKWi3xzqZxi4t6589SyglZVZH29E+/WIEm6gbdKG/xdpOOjbRYq5wVUkNWEl3nxODS
bPPURZkQqXZ2MUvOKHZhGa/0k2fY8eV2SSmDscgJSQjJgDJJQbZgeVEXoABv0bCp3TyuvNdKww1I
hhgqekpTNMpZgjfSPjDg3fDdbubKR42n/XKMRQ3vu6hQF2scLy2mEU5upwoh7tHFTTv9Nuu7Ax9o
vHHNVekjRcDstabmltjqFNm4CkeDpNMKoBcYnBrrJOx9CLzVHDIX3ImX/+e/un5MTYJeHO641MZL
/5k=
=DWoJ
-----END PGP SIGNATURE-----

--------------6oS7Yf6Pnn94E5VmBjNS0zao--
