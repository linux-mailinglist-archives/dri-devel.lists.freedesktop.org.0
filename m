Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61C751A33
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8304810E611;
	Thu, 13 Jul 2023 07:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE2610E611
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:45:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67C761F893;
 Thu, 13 Jul 2023 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689234329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tX5LvjGDgH5yI9x+uQh+A5rsQGjO0pMY4DIdtHxlXgA=;
 b=LMaa6mh3CUR4mrqmjrK4y90tlhqA0BGdZXnm4kYAeW0sKluV0zWaXjgSZsKYfr6NKrX6AO
 TPCae0jzJcw+ieKlks74CpV92uBMUeyw7EFJKJpKWKHcThC3KAZrmAblmEo7YawrAhfUUU
 ZGRm/Z0pNWriR0jEYlMTDaexZDiWTgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689234329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tX5LvjGDgH5yI9x+uQh+A5rsQGjO0pMY4DIdtHxlXgA=;
 b=wK4cL3+OM98QOGPQonh1BVtm2ZZ4+kxl16d6p8rstVQKc2j/60+sGz5Z2wcv1suu91oFa7
 dK9swqDySluvQ/DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BB34133D6;
 Thu, 13 Jul 2023 07:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Yj9YEZmrr2R+FgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 07:45:29 +0000
Message-ID: <ecb43bcd-6907-e1e8-3c8c-63bde258c739@suse.de>
Date: Thu, 13 Jul 2023 09:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/doc: document that PRIME import/export is always
 supported
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230712183156.191445-1-contact@emersion.fr>
 <69a71fab-2407-49ed-d445-5dccc126c64b@suse.de>
 <F07F7XO3_lxljay8DZbVRbLevY3p4np8Pt11PsA_RWIV9Hkc1QKGlby5uBZPcCiQtEdLFBOjG0c2Sy528P3G3yNreQckRzFjWkNuPa-CNKY=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <F07F7XO3_lxljay8DZbVRbLevY3p4np8Pt11PsA_RWIV9Hkc1QKGlby5uBZPcCiQtEdLFBOjG0c2Sy528P3G3yNreQckRzFjWkNuPa-CNKY=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZEPpfudtK9BHsdUBXTi8Qxdb"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZEPpfudtK9BHsdUBXTi8Qxdb
Content-Type: multipart/mixed; boundary="------------nWA9KGEdzPGlGVRSQSs0i3x8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Message-ID: <ecb43bcd-6907-e1e8-3c8c-63bde258c739@suse.de>
Subject: Re: [PATCH] drm/doc: document that PRIME import/export is always
 supported
References: <20230712183156.191445-1-contact@emersion.fr>
 <69a71fab-2407-49ed-d445-5dccc126c64b@suse.de>
 <F07F7XO3_lxljay8DZbVRbLevY3p4np8Pt11PsA_RWIV9Hkc1QKGlby5uBZPcCiQtEdLFBOjG0c2Sy528P3G3yNreQckRzFjWkNuPa-CNKY=@emersion.fr>
In-Reply-To: <F07F7XO3_lxljay8DZbVRbLevY3p4np8Pt11PsA_RWIV9Hkc1QKGlby5uBZPcCiQtEdLFBOjG0c2Sy528P3G3yNreQckRzFjWkNuPa-CNKY=@emersion.fr>

--------------nWA9KGEdzPGlGVRSQSs0i3x8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEzLjA3LjIzIHVtIDA5OjE3IHNjaHJpZWIgU2ltb24gU2VyOg0KPiBPbiBUaHVy
c2RheSwgSnVseSAxM3RoLCAyMDIzIGF0IDA3OjA5LCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4+ICsgKiBTdGFydGluZyBmcm9tIGtl
cm5lbCB2ZXJzaW9uIDYuNiwgYm90aCAmRFJNX1BSSU1FX0NBUF9JTVBPUlQgYW5kDQo+Pj4g
KyAqICZEUk1fUFJJTUVfQ0FQX0VYUE9SVCBhcmUgYWx3YXlzIGFkdmVydGlzZWQuDQo+Pj4g
KyAqDQo+Pg0KPj4gV2hlbiBwZW9wbGUgcG9ydCB0aGVzZSBjaGFuZ2VzIGludG8gdGhlaXIg
dHJlZXMgdGhlIHZlcnNpb24gYmVjb21lcw0KPj4gbWVhbmluZ2xlc3MuIFRoZXJlIGFyZSBz
byBtYW55ICJlbnRlcnByaXNlIGtlcm5lbHMiIHRoYXQgY29tYmluZSB3aG9sZQ0KPj4gc3Vi
c3lzdGVtcyBmcm9tIGRpZmZlcmVudCB1cHN0cmVhbSByZWxlYXNlcy4NCj4+DQo+PiBUaGF0
IG1ha2VzIG1lIHdvbmRlciBpZiBzdWNoIGRvY3VtZW50YXRpb24gbWFrZXMgc2Vuc2UuIFdl
IHdhbnQgdG8gYXZvaWQNCj4+IGEgc2l0dWF0aW9uIHdoZXJlIHVzZXJzcGFjZSBkb2VzDQo+
Pg0KPj4gaWYgKHY2LjYpDQo+PiBkbygpDQo+PiBlbHNlIGlmICh0ZXN0X2ZsYWdzKCkpDQo+
PiBkbygpDQo+IA0KPiBEYW5pZWwgVmV0dGVyIGFza2VkIGZvciBzcGVjaWZpYyBrZXJuZWwg
dmVyc2lvbnMgaW4gYjYwM2U4MTBmNzQwDQo+ICgiZHJtL3VhcGk6IGRvY3VtZW50IGtlcm5l
bCBjYXBhYmlsaXRpZXMiKS4gSXQgYWxsb3dzIHVzZXItc3BhY2UgdG8NCj4gZmlndXJlIG91
dCBob3cgd2lkZXNwcmVhZCBhIGNhcCBpcy4NCg0KV2VsbCwgT0sgdGhlbi4uLiA6KQ0KDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------nWA9KGEdzPGlGVRSQSs0i3x8--

--------------ZEPpfudtK9BHsdUBXTi8Qxdb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvq5gFAwAAAAAACgkQlh/E3EQov+C9
ihAAodYIUZnNEDSgF2h8ZgbYrHOWErxdgQWZ96ZAp+2WCb2VbSghHF3tddTvNgGFp+xaLYQ2yGzH
Aq5uRkMLvsovbaIB2RMW4PvLvyV8vzuWWGAZ6pVJ+2xJVdcrRieA5KER0AkxKP1bVyKAyPzwS6EM
vVVm12lEKM+U0WsJ1SIFaqomns3Y1NpWYzk+Qs30gOMVWVst3v6kX3V6oWpcc+Fq3aRVltVR3RX8
EcKsyYRxNnOSo6IaaVcWYoJPUBfhMGe+MtKx/HdOOiMPQKov6UcFEVq1G4faOLzJtOijET1C8WGh
N0AwpnW5N6NOidRTqXgFTkR++GptqEbEGfozPZGj5VUbjpQGBbojfKnETsNUwkziw6X2z791fjrJ
6iLOJoGuo+sxO02v5vhrA7wtDJDO1FNpagY1ou78eWUwK1PglTKjun3HCqKnnhdyWetuwsi9RDit
Yohu9hj5lb34VQVNcOKSFETAqmVeOfmi8ymX67FJIL61xASlhMgryqiY56CH/kGu/wXo/lxUlest
fbXU9c4apX1K6NIZOlmuOtH2wXdE+ta5lYN/KNTXcKw3DuZyWCW9xvKLIe4AoXg66UF0bwB7Vn8o
uNtzMXbDL4sMCFJZ926+Xw0KfOXP1Mod/POUnNCf4H89lTrh7teH5xvnednx3A1B885RvEVW5FKo
P8A=
=Dw5J
-----END PGP SIGNATURE-----

--------------ZEPpfudtK9BHsdUBXTi8Qxdb--
