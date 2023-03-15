Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB436BAD9C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 11:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75F110E994;
	Wed, 15 Mar 2023 10:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E9610E994
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:25:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF1D42190B;
 Wed, 15 Mar 2023 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678875953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVdllBdZTc9TJG4FCCzyxgIwvd4EqEzACHhmFnamwno=;
 b=FHX7l7HcyvXr1n6xJlqF0y1ONaapvHcPgQYJxLMQqIzINXjoRjwY87IVYNz+qL0WQpsMbD
 6IwDgZQKqTyWiXA9O27FKSbsk8HyTO3rm7JRX2M53G0qNryaOtsRG2+E7u04pbq0oYUrXE
 M+UCa8HNQdhFObJer1Tv4QOa9B+Jl2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678875953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVdllBdZTc9TJG4FCCzyxgIwvd4EqEzACHhmFnamwno=;
 b=1XZlNg1XVHSiD7OMJWDhb12jQLh8+fmmoOI1uMuCnOKa2Zh0iRNyDxmGd/KOdIdh/ljr7l
 4fzPIJgIafAdZ2Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BD8913A2F;
 Wed, 15 Mar 2023 10:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uezKJDGdEWRuSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Mar 2023 10:25:53 +0000
Message-ID: <360b814b-40e0-5444-8d6b-1e29719e4414@suse.de>
Date: Wed, 15 Mar 2023 11:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: au1200fb: Fix potential divide by zero
To: Wei Chen <harperchen1110@gmail.com>, deller@gmx.de
References: <20230315092254.1042615-1-harperchen1110@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230315092254.1042615-1-harperchen1110@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oDSShgVebgcxBHZ6xUbeLWEI"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oDSShgVebgcxBHZ6xUbeLWEI
Content-Type: multipart/mixed; boundary="------------WDd0Lhtgw7Duf5JenF0OHZeU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wei Chen <harperchen1110@gmail.com>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <360b814b-40e0-5444-8d6b-1e29719e4414@suse.de>
Subject: Re: [PATCH] fbdev: au1200fb: Fix potential divide by zero
References: <20230315092254.1042615-1-harperchen1110@gmail.com>
In-Reply-To: <20230315092254.1042615-1-harperchen1110@gmail.com>

--------------WDd0Lhtgw7Duf5JenF0OHZeU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgbG9va2luZyB0aHJvdWdoIHRoZXNlIGRyaXZlcnMuDQoNCkFt
IDE1LjAzLjIzIHVtIDEwOjIyIHNjaHJpZWIgV2VpIENoZW46DQo+IHZhci0+cGl4Y2xvY2sg
Y2FuIGJlIGFzc2lnbmVkIHRvIHplcm8gYnkgdXNlci4gV2l0aG91dA0KPiBwcm9wZXIgY2hl
Y2ssIGRpdmlkZSBieSB6ZXJvIHdvdWxkIG9jY3VyIHdoZW4gaW52b2tpbmcNCj4gbWFjcm8g
UElDT1MyS0haIGluIGF1MTIwMGZiX2ZiX2NoZWNrX3Zhci4NCj4gDQo+IEVycm9yIG91dCBp
ZiB2YXItPnBpeGNsb2NrIGlzIHplcm8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hl
biA8aGFycGVyY2hlbjExMTBAZ21haWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2F1MTIwMGZiLmMgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTIw
MGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTIwMGZiLmMNCj4gaW5kZXggODFjMzE1
NDU0NDI4Li5iNmIyMmZhNGE4YTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXUxMjAwZmIuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTIwMGZiLmMN
Cj4gQEAgLTEwNDAsNiArMTA0MCw5IEBAIHN0YXRpYyBpbnQgYXUxMjAwZmJfZmJfY2hlY2tf
dmFyKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPiAgIAl1MzIgcGl4Y2xvY2s7
DQo+ICAgCWludCBzY3JlZW5fc2l6ZSwgcGxhbmU7DQo+ICAgDQo+ICsJaWYgKCF2YXItPnBp
eGNsb2NrKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KDQpJbnN0ZWFkIG9mIHRoZSB3
aGFsZS1hLW1vbGUgYXBwcm9hY2ggb2YgZml4aW5nIGluZGl2aWR1YWwgZHJpdmVycywgY291
bGQgDQp0aGlzIGJlIHNvbHZlZCBieSB0ZXN0aW5nIGluIGZiX3NldF92YXIgWzFdIGFuZCBm
Yl90cnlfbW9kZS4/IFsyXQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jI0w5NTgNClsyXSANCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL21v
ZGVkYi5jI0w1NjcNCg0KPiAgIAlwbGFuZSA9IGZiZGV2LT5wbGFuZTsNCj4gICANCj4gICAJ
LyogTWFrZSBzdXJlIHRoYXQgdGhlIG1vZGUgcmVzcGVjdCBhbGwgTENEIGNvbnRyb2xsZXIg
YW5kDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------WDd0Lhtgw7Duf5JenF0OHZeU--

--------------oDSShgVebgcxBHZ6xUbeLWEI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQRnTAFAwAAAAAACgkQlh/E3EQov+CR
xQ//bppyKi5hcSUvkpyLIY00pMPfYG/vWWDjMNu+3FYcg/na5v4hJj9htwg7jC3eVdq9ZoHj6Hav
zDnVw01p/kzoXcHTNczf6OiMYUzJYD0UkuQ2bgHImk+RG5UhRt+TQdwbc0D7+bBVzadVIflFhE3e
BVLU7qMXONuFb5JOSb0k66DUixE8pjO+bT8s8gUoZaIpYG3QbdoYTO6q9cX7uDGZbh93KfByTg1s
DJG8MJivfC5xj+w1tbFe6WTgRlWVfG0lGHudHnpu482JBm/4qsgsg2OVcdCRkIUwrxxNo0wz/H3a
VKG1IfEJ4YDnO12D/XQYsfox4Jbwpg8MhO2jaKZ8iqYC+Z5CTG/Hh/NAFIYlfA4P6TpUPkIOWCmG
I2zo1DLUxOIJQoSem0kVbDMw7oqRTyqfJLSFI9LnCttMXwLUbQdYdICyBIOie+pdh3NaVD1iikyx
2rri9Lied+LHsMyo5GKRSHSpuCikeNPqJ02QpqVUfk1iM1fvP7CIpb0+s6ytqz+bfwFoNo0e0Lxl
EPZf0UkfNI0yWCAwa9ewJvJNDE/aq66bAknw3UX29+3MqFMxRe/CeF43nnwWjqZQufJ6126d5YCv
Yl5LDQsVr7u9D0/l8x5Xmr4EM9oLPutcGMIHmDUBlKOYNHzDb4Eb7+HZKCQ8a/0gYTQt9iu48mDz
Qmw=
=sv0N
-----END PGP SIGNATURE-----

--------------oDSShgVebgcxBHZ6xUbeLWEI--
