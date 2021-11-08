Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5E4481C3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CB86E96A;
	Mon,  8 Nov 2021 14:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA366E96A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:28:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B08D41FD50;
 Mon,  8 Nov 2021 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636381729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGSAJuzDE+ow2YU8o0uvQO+L1+wARe42Qt1VZLAC+t0=;
 b=JWrnLIoplwTvpsLCB6Jyk5mViprnd5BbDXuXbKwcFQwbMZLCpgOhogAsdU5tciQzjhBV8C
 SQzw+nW4NrefyRG7/GfNpwgySmOarwrDeRpLmYi5pk+Mwo0WDb4Jp0dpqW0lDs+a2Tx0gx
 YNPDoV63nDIwnlyxEs5/qUm3X4wjjk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636381729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGSAJuzDE+ow2YU8o0uvQO+L1+wARe42Qt1VZLAC+t0=;
 b=z1rkkFNr05FDwwy++6+/JYXpS8cCbJVTGIFLhEC18cGPtncbpCPaVHnesiUfIv0HkZHGbv
 rUoxNzYM/+Vg7tCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E78913BA0;
 Mon,  8 Nov 2021 14:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yP7oHCE0iWHAJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 14:28:49 +0000
Message-ID: <2601406e-e959-5ad1-73fa-8aabd77e68c5@suse.de>
Date: Mon, 8 Nov 2021 15:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/drm_plane.h: fix a typo: not -> note
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211108132008.3631-1-15330273260@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211108132008.3631-1-15330273260@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OtlOtyfcgU6FYtxlMam1ECrF"
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
Cc: suijingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OtlOtyfcgU6FYtxlMam1ECrF
Content-Type: multipart/mixed; boundary="------------CB9JmSlVS02yw0q36kGGKf88";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>
Message-ID: <2601406e-e959-5ad1-73fa-8aabd77e68c5@suse.de>
Subject: Re: [PATCH] drm/drm_plane.h: fix a typo: not -> note
References: <20211108132008.3631-1-15330273260@189.cn>
In-Reply-To: <20211108132008.3631-1-15330273260@189.cn>

--------------CB9JmSlVS02yw0q36kGGKf88
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTQ6MjAgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEZy
b206IHN1aWppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IHN1aWppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCg0KVGhp
cyB3YXMgZml4ZWQgYSB3aGlsZSBhZ28uIFsxXSBJZiB5b3Ugd2FudCB0byB3b3JrIG9uIHRo
ZSBEUk0gDQpmcmFtZXdvcmssIHBsZWFzZSB1c2UgdGhlIGxhdGVzdCByZXBvc2l0b3J5IGZy
b20gZHJtLXRpcC4gWzJdDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBz
Oi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9NDA4N2Qy
ZmIyODZjODVhMWJkZTcyZTc1MjNjNDk2MDgwZWYzOTAzNQ0KWzJdIGh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvDQoNCj4gLS0tDQo+ICAgaW5jbHVkZS9kcm0v
ZHJtX3BsYW5lLmggfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3Bs
YW5lLmggYi9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaA0KPiBpbmRleCBmZWQ5N2UzNTYyNmYu
LjBjMTEwMmRjNGQ4OCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgNCj4gQEAgLTQzLDcgKzQzLDcgQEAg
ZW51bSBkcm1fc2NhbGluZ19maWx0ZXIgew0KPiAgIC8qKg0KPiAgICAqIHN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgLSBtdXRhYmxlIHBsYW5lIHN0YXRlDQo+ICAgICoNCj4gLSAqIFBsZWFz
ZSBub3QgdGhhdCB0aGUgZGVzdGluYXRpb24gY29vcmRpbmF0ZXMgQGNydGNfeCwgQGNydGNf
eSwgQGNydGNfaCBhbmQNCj4gKyAqIFBsZWFzZSBub3RlIHRoYXQgdGhlIGRlc3RpbmF0aW9u
IGNvb3JkaW5hdGVzIEBjcnRjX3gsIEBjcnRjX3ksIEBjcnRjX2ggYW5kDQo+ICAgICogQGNy
dGNfdyBhbmQgdGhlIHNvdXJjZSBjb29yZGluYXRlcyBAc3JjX3gsIEBzcmNfeSwgQHNyY19o
IGFuZCBAc3JjX3cgYXJlIHRoZQ0KPiAgICAqIHJhdyBjb29yZGluYXRlcyBwcm92aWRlZCBi
eSB1c2Vyc3BhY2UuIERyaXZlcnMgc2hvdWxkIHVzZQ0KPiAgICAqIGRybV9hdG9taWNfaGVs
cGVyX2NoZWNrX3BsYW5lX3N0YXRlKCkgYW5kIG9ubHkgdXNlIHRoZSBkZXJpdmVkIHJlY3Rh
bmdsZXMgaW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------CB9JmSlVS02yw0q36kGGKf88--

--------------OtlOtyfcgU6FYtxlMam1ECrF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJNCAFAwAAAAAACgkQlh/E3EQov+Dw
fw//TxnsWQDHBrQt3WhJCBD66qJQDrzNOEVXaKUIBmASL/+bfboKhezEHmbOYgaBkGX/WUkTx6lZ
VOo+lPDFibh3HufsvxlOI8cHurrvq0hACzmuwwGTmecSnGflMjs71Ex+lSwKJ6hRv199hoNGHUbA
lWTr04aNps7yGd4W2ZxY0knZRiQ3V2+6nEwKOzUqfFQmCup8t5YSygSg0c04ot3cWGVWeH4wC2Wv
1Njd1bwUFWkIJwQzGm4j4Hjz4SAC0xuvtxoyxCSYC/J08L5qgWyfbHb1MA9YT+CqvBYHEvMhjemy
glx3SrwsFqURqeUcAPoCYvQmudgcRPpZBJBSH06qFGOtfMSMEgiv34pThz62BvHSuTiFwCjZf5gL
oVkNSueuyAEAJDYxzX7icbKluf4f3Zz9iYD0FpoP8Cl15QsuD1JhimG+tfgTXjWmJKR5aoIcy6+a
Awsis4qMD+V0MJV/NQBdjHrrAFJ0u91VLpI29Vwk4KwOkOdGjEMhF7NNq5+HLOMupNJQp8xbmNEd
mwaqVmMav25uVhRoofSh+mCDMgVXTfvuVxjsYPcqNs/KkUZMjF7kOPIUqyowjvmq5aSlx2Mmj159
LOK1HHrfX2znEz6LjYbCr9+0O3NjGYvoa4rb++/luEJIc4GEyGPZ95lkAiwllxcVoebUxHDeUqWq
0zg=
=gBPj
-----END PGP SIGNATURE-----

--------------OtlOtyfcgU6FYtxlMam1ECrF--
