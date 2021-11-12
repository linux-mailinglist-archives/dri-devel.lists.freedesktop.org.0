Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1FD44E98A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 16:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004DE6EB4B;
	Fri, 12 Nov 2021 15:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B86F6EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 15:05:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF80B21993;
 Fri, 12 Nov 2021 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636729547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SUwYOnuOmLnzqp0uKpTZ8nTvZlIPGPGWfCv7vH5MrQ4=;
 b=B2ifuMyrjWf6eBN96poyAC3DN7hRD82jGJvXTP15o4Qfv3BvwDiOUejSE8PBifnhfoMYfL
 Kt5ccAxxpRpa8P9fuusRAEFidPRaOljIiepGvnGfeS2DCGnI8IE2gKxRdMrqWJBsG7/nvR
 Vc3ztreMiwU3nmU/mbM0l/c99nxHhE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636729547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SUwYOnuOmLnzqp0uKpTZ8nTvZlIPGPGWfCv7vH5MrQ4=;
 b=u/dVSUytay33xu+f0BbZkalkaDo8IZwhmm6FcZmlpaMbp8Y4FjgY6rBiC7S4nPCs0TTlLs
 XRoz3/zwg/TwVXDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC0C113C75;
 Fri, 12 Nov 2021 15:05:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VxoRKcuCjmE9VQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 15:05:47 +0000
Message-ID: <36f8fdd6-13dc-7a68-6365-ab2152337c33@suse.de>
Date: Fri, 12 Nov 2021 16:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()
Content-Language: en-US
To: paul@crapouillou.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@linux.ie
References: <20210708175146.10618-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210708175146.10618-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Buuj04kuYv0zv1ldzIYtN7uE"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Buuj04kuYv0zv1ldzIYtN7uE
Content-Type: multipart/mixed; boundary="------------m3aUeYjvfuR1ZKq8C3fXeATj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: paul@crapouillou.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org
Message-ID: <36f8fdd6-13dc-7a68-6365-ab2152337c33@suse.de>
Subject: Re: [PATCH] drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()
References: <20210708175146.10618-1-tzimmermann@suse.de>
In-Reply-To: <20210708175146.10618-1-tzimmermann@suse.de>

--------------m3aUeYjvfuR1ZKq8C3fXeATj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZyBmb3IgcmV2aWV3Lg0KDQpBbSAwOC4wNy4yMSB1bSAxOTo1MSBzY2hyaWViIFRob21h
cyBaaW1tZXJtYW5uOg0KPiBUaGUgR0VNIENNQSBoZWxwZXJzIGFsbG9jYXRlIG5vbi1jb2hl
cmVudCAoaS5lLiwgY2FjaGVkKSBiYWNraW5nIHN0b3JhZ2UNCj4gd2l0aCBkbWFfYWxsb2Nf
bm9uY29oZXJlbnQoKSwgYnV0IHJlbGVhc2UgaXQgd2l0aCBkbWFfZnJlZV93YygpLiBGaXgg
dGhpcw0KPiB3aXRoIGEgY2FsbCB0byBkbWFfZnJlZV9ub25jb2hlcmVudCgpLiBXcml0ZWNv
bWJpbmluZyBzdG9yYWdlIGlzIHN0aWxsDQo+IHJlbGVhc2VkIHdpdGggZG1hX2ZyZWVfd2Mo
KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPiBGaXhlczogY2Y4Y2NiYzcyZDYxICgiZHJtOiBBZGQgc3VwcG9ydCBm
b3IgR0VNIGJ1ZmZlcnMgYmFja2VkIGJ5IG5vbi1jb2hlcmVudCBtZW1vcnkiKQ0KPiBDYzog
UGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+DQo+IENjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgfCA5ICsrKysrKystLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jDQo+IGluZGV4IGQ1MzM4ODE5
OWYzNC4uOWQwNTY3NDU1MGE0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9jbWFfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21h
X2hlbHBlci5jDQo+IEBAIC0yMTAsOCArMjEwLDEzIEBAIHZvaWQgZHJtX2dlbV9jbWFfZnJl
ZV9vYmplY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1fb2JqKQ0KPiAgIAkJCWRtYV9i
dWZfdnVubWFwKGdlbV9vYmotPmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgJm1hcCk7DQo+ICAg
CQlkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3koZ2VtX29iaiwgY21hX29iai0+c2d0KTsNCj4gICAJ
fSBlbHNlIGlmIChjbWFfb2JqLT52YWRkcikgew0KPiAtCQlkbWFfZnJlZV93YyhnZW1fb2Jq
LT5kZXYtPmRldiwgY21hX29iai0+YmFzZS5zaXplLA0KPiAtCQkJICAgIGNtYV9vYmotPnZh
ZGRyLCBjbWFfb2JqLT5wYWRkcik7DQo+ICsJCWlmIChjbWFfb2JqLT5tYXBfbm9uY29oZXJl
bnQpDQo+ICsJCQlkbWFfZnJlZV9ub25jb2hlcmVudChnZW1fb2JqLT5kZXYtPmRldiwgY21h
X29iai0+YmFzZS5zaXplLA0KPiArCQkJCQkgICAgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2Jq
LT5wYWRkciwNCj4gKwkJCQkJICAgICBETUFfVE9fREVWSUNFKTsNCj4gKwkJZWxzZQ0KPiAr
CQkJZG1hX2ZyZWVfd2MoZ2VtX29iai0+ZGV2LT5kZXYsIGNtYV9vYmotPmJhc2Uuc2l6ZSwN
Cj4gKwkJCQkgICAgY21hX29iai0+dmFkZHIsIGNtYV9vYmotPnBhZGRyKTsNCj4gICAJfQ0K
PiAgIA0KPiAgIAlkcm1fZ2VtX29iamVjdF9yZWxlYXNlKGdlbV9vYmopOw0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------m3aUeYjvfuR1ZKq8C3fXeATj--

--------------Buuj04kuYv0zv1ldzIYtN7uE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGOgssFAwAAAAAACgkQlh/E3EQov+CS
uw//WONI4MmrGAJrYDSQ1ELU4ekW/DfulHW540wXQu7Ai9zWgQ2DxpjCe17RxKIAt/rO43NDeJFv
vganjb0UM/GAyxihiPHn7HHK2MJrQUzBw2CJtI+eU3nelyg50qCy31s/d8hmNmJLTj1Dixald4oN
xND/PaM7J/ZnoL1XFydFf7hHygE61ks1EkSx1aJiXpVAUyQFXuk0QnadAPpRSKTcCOS3DZM5sUFm
hcRxzo8BYTHNs+qQzqhQdByivx2TpqVksegmp+0lNFjIF5aZs8YKTXyJemPtjgzxRKf4AvTnR4cA
bBfFIpW/5/S9PtpoMdpQscOMH5/esRDveYBRPu6J49E61li1GMoIcG4ltR1i35mgcJ6CywjcXx3c
qlZaGprv/O/p6DQ8qVh6+ql1e5Ts1QK3cnRf//c41bfOQ+feYhvQf+jE2/TzlXB0BF7+1WI9T0F0
U7P3reoTzGsFtcQMrUN7PZkcf5cEmAqWiG5lIJ6nfBN6VzEeINb2HxuRDjN16XnFFZKCc3/q/im0
u1CB/5Z9NqqZFGTzrkNRUK/9uwPAtM1kHL3O+cGA8Jbq0JD3cqs6dMPnBT2jSmou+MZssA0tIgAG
yu1L1IS679MWTVSFEDGZZ75ineM00krot8j5c1oXyV6zMtIDK2DF8FH00Txb+ve4ytYNupg/1FqZ
yYE=
=Jwd1
-----END PGP SIGNATURE-----

--------------Buuj04kuYv0zv1ldzIYtN7uE--
