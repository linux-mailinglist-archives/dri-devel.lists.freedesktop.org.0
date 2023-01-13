Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB98669682
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 13:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC810EA05;
	Fri, 13 Jan 2023 12:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC210E9F8;
 Fri, 13 Jan 2023 12:10:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2120B6AF4B;
 Fri, 13 Jan 2023 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673611836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sXpapRuX916Le+bJNj5IyZ3za3IyLIEyf+ZchkfgtPU=;
 b=nmihVpa8mYRVJH7OXWFvnHHE40gzYLmUktrtmnYos+FvV7CZ/gu6L5xpCm+uQNJgNPLe7x
 vcHD4ObtKcGprs5ym0hpDH7HhDrFhkTQ287XQUKEddp6cubx1w+46cRA+br8YlQkZM2aNS
 LA65D7dn6qbMgzKqSw0AXGejCynz6+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673611836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sXpapRuX916Le+bJNj5IyZ3za3IyLIEyf+ZchkfgtPU=;
 b=6XbabrpdxspIXnKCfpYCnNt9YDv6oTZ1GeAlVXqO4NJVkI85PihJ9W+iiamz9xuNkPYlOv
 pjgqL2OEA/FM6HAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC4021358A;
 Fri, 13 Jan 2023 12:10:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PhGqNDtKwWP6SwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jan 2023 12:10:35 +0000
Message-ID: <6043efee-7b52-2be8-6fca-13c11e0e946e@suse.de>
Date: Fri, 13 Jan 2023 13:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/5] drm: Do not include <linux/fb.h> unnecessarily
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230109101243.26995-1-tzimmermann@suse.de>
 <20230113103604.bh6ey24ehpufwuab@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230113103604.bh6ey24ehpufwuab@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TpAfTuHW6zhmfUyhhkbNq8qp"
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
Cc: f.fainelli@gmail.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, sam@ravnborg.org,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TpAfTuHW6zhmfUyhhkbNq8qp
Content-Type: multipart/mixed; boundary="------------hghfHyrdK0FB5Pr05Det0N8j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, sam@ravnborg.org,
 thierry.reding@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Message-ID: <6043efee-7b52-2be8-6fca-13c11e0e946e@suse.de>
Subject: Re: [PATCH 0/5] drm: Do not include <linux/fb.h> unnecessarily
References: <20230109101243.26995-1-tzimmermann@suse.de>
 <20230113103604.bh6ey24ehpufwuab@houat>
In-Reply-To: <20230113103604.bh6ey24ehpufwuab@houat>

--------------hghfHyrdK0FB5Pr05Det0N8j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEzLjAxLjIzIHVtIDExOjM2IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gT24g
TW9uLCBKYW4gMDksIDIwMjMgYXQgMTE6MTI6MzhBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6DQo+PiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBzdGF0ZW1lbnRzIGZv
ciA8bGludXgvZmIuaD4uIEkgcmVjZW50bHkNCj4+IGNoYW5nZWQgdGhpcyBoZWFkZXIgYW5k
IGhhZCB0byByZWJ1aWxkIGEgZ29vZCBwYXJ0IG9mIERSTS4gU28gYXZvaWQNCj4+IHRoaXMg
YnkgcmVtb3ZpbmcgdGhlIGRlcGVuZGVuY3kuDQo+Pg0KPj4gU29tZSBzb3VyY2UgZmlsZXMg
cmVxdWlyZSB0aGUgT0Ygb3IgYmFja2xpZ2h0IGhlYWRlcnMuIEluY2x1ZGUgdGhvc2UNCj4+
IGluc3RlYWQuDQo+IA0KPiBGb3IgdGhlIHNlcmllczoNCj4gQWNrZWQtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KDQpwZXIgaXJjIGRpc2N1c3Npb24sIGFja2Vk
IGZvciBhbGwgb2YgdjIgYXMgd2VsbA0KDQo+IA0KPiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------hghfHyrdK0FB5Pr05Det0N8j--

--------------TpAfTuHW6zhmfUyhhkbNq8qp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPBSjsFAwAAAAAACgkQlh/E3EQov+A2
Jw/7BNND+t1Q54sWZe1MTEjrDibY/BBs6jY+i+004NhWPU7enGrmfwkRJroiYZ0f71X+3rHeveE3
uEkfK+dvdgquB25V+NP1oQjccOn+YJxqfnc5bDiomY42km0t/Ajcjxuziwa6DW9mijJdvAtBAeWq
tTFVy+66BA7fW/rvXV2wCNNITkxpEdp+skVWXno85nABlE2Gkp/icfQGPhf4A7OyuTpn/7anW2JS
NvvWWJSeE32scsht/TSWokUZCSkzQX3IQRjJsOtMTrdnDIE5mCQbdop2KKdk/pzumMRUONNhE/aR
mQ6A1qgsUsW29FCrD5e7LKT6gLi39u6Zss+k8Fe7Y4X9bhzUeqr1xWHLuel5YCs9bl7o1zxyc3ro
vuJ1NKRIOP7HLVYuWj9WkRwF+5u1+E0DpH7LlErCwTVYNchztyjfuEbDzNtGKJFxlsdB1SOPhCoc
lepqbVmuqukh+SZrSFEsJGdoTCmyYrbAIt4lu70CyE2tnRKO9MX4CSdCdf7kJAOMpDV1rt2slwWz
wbyNd9ZGi0zD7f4V860MAUBGoxoKNslHRZSmEq2VloE+gXQ5Ju5192BZIwptyV/aJ0NuKTrdzy3L
XPl/HowSZvTF0pBsYxSK5OtQOgRALkI2WQKSm9dvktmC3SgaIXiI5017gavLnYpdfWgburzh2EmK
Wo8=
=dkAk
-----END PGP SIGNATURE-----

--------------TpAfTuHW6zhmfUyhhkbNq8qp--
