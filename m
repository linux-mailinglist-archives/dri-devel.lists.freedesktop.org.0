Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2930C51A2D6
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C00210E67C;
	Wed,  4 May 2022 14:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192110E411
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 14:59:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AE22210E5;
 Wed,  4 May 2022 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651676369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jZzunA/yKhikvUmh/p6uOoCBbYPzLAmvE0IaGNIUAAw=;
 b=bHUF8eUw4fKGvdvoxoiiAUfUtgH4n3MhHBdLSWJJ7ECTMArgBj0lwOeY6TCNtxAbK2WIlx
 H54KHEdKw2WfnjkpkQheoSm0ydJhXJGRO+XTCgfxQkT35++4ToPEI2FJ+MTpcw25qeS/hH
 MVk0g84vYfU3tbcpn4l6n4ImMT5JOFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651676369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jZzunA/yKhikvUmh/p6uOoCBbYPzLAmvE0IaGNIUAAw=;
 b=N/muSm27DRsy4kljHdLxF9DstZ1GsPoQauBkOCJSvs1mAC8aTommvkxPN5D6YFzvdvZmpX
 Gg9L6TkWAmrlWdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B732132C4;
 Wed,  4 May 2022 14:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FdqVCdGUcmLOIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 14:59:29 +0000
Message-ID: <c54fe066-27df-f317-0613-a7f20168508f@suse.de>
Date: Wed, 4 May 2022 16:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 0/3] mgag200: Improve damage handling
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com
References: <20220504134026.283417-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504134026.283417-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0H0ONNRlJHdJScyEHys0m90y"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0H0ONNRlJHdJScyEHys0m90y
Content-Type: multipart/mixed; boundary="------------v6U1Dn9o3Tk1pH0ghueVhnIX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com
Cc: michel@daenzer.net, jadahl@gmail.com
Message-ID: <c54fe066-27df-f317-0613-a7f20168508f@suse.de>
Subject: Re: [PATCH v2 0/3] mgag200: Improve damage handling
References: <20220504134026.283417-1-jfalempe@redhat.com>
In-Reply-To: <20220504134026.283417-1-jfalempe@redhat.com>

--------------v6U1Dn9o3Tk1pH0ghueVhnIX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9jZWx5biwNCg0Kd2l0aCBteSBjb21tZW50IG9uIDMvMyBjb25zaWRlcmVkLCB5b3Ug
Y2FuIGFkZA0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbWVtcm1hbm4gPHR6aW1lbXJtYW5u
QHN1c2UuZGU+DQoNCnRvIHRoaXMgcGF0Y2hzZXQuDQoNCllvdSBzaG91bGQgZ2V0IGNvbW1p
dCBhY2Nlc3MgZm9yIGRybS1taXNjLCBzbyB0aGF0IHlvdSBjYW4gbGFuZCB0aGUgDQpwYXRj
aHNldCBvbiB5b3VyIG93bi4gUGxlYXNlIHNlZQ0KDQogICBodHRwczovL2RybS5wYWdlcy5m
cmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9jb21taXQtYWNjZXNzLmh0bWwNCg0K
Zm9yIGhvdyB0byBkbyB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpBbSAwNC4w
NS4yMiB1bSAxNTo0MCBzY2hyaWViIEpvY2VseW4gRmFsZW1wZToNCj4gbWdhZzIwMDogSW1w
cm92ZSBkYW1hZ2UgaGFuZGxpbmcNCj4gDQo+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBk
YW1hZ2UgaGFuZGxpbmcgb24gTWF0cm94IGdwdSwgYW5kIGFsbG93cw0KPiBHbm9tZS9XYXls
YW5kIHRvIHJ1biBtdWNoIGJldHRlci4NCj4gQWxzbyBpbmNsdWRlIHNvbWUgZHJpdmVyIGNs
ZWFudXAuDQo+IA0KPiBUZXN0ZWQgb24gYSBEZWxsIFQzMTAgd2l0aCBNYXRyb3ggTUdBIEcy
MDBlVyBXUENNNDUwIChyZXYgMGEpDQo+IA0KPiB2MjoNCj4gICBEcm9wIHJlbW92ZSBtZ2Fn
MjAwX3Byb2JlX3ZyYW0oKQ0KPiAgIFJld3JvdGUgdGhlIHBhdGNoIHRvIHdhcm4gaWYgc3Rh
cnRhZGRyIGlzIG5vdCAwLCBhbmQgaHcgZG9lc24ndA0KPiAgICBzdXBwb3J0IGl0LiAoaW5z
dGVhZCBvZiByZW1vdmluZyB0aGUgdW51c2VkIGZsYWcpLg0KPiANCj4gVGhhbmtzLA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------v6U1Dn9o3Tk1pH0ghueVhnIX--

--------------0H0ONNRlJHdJScyEHys0m90y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJylNAFAwAAAAAACgkQlh/E3EQov+DX
xA//Ytn2/iyfRmVHSMMyW50OTTT9qov0Zxq/VGpqnzN1kCC51ndgb2I5bbNH6DBVFoS9jjT2sMOi
GryUTZrIIzGAleFPKeUc+/Qg+xgVZIv6V7PrRPaqtdPSfQ6QJfZD4TwNrE7sYjkbsSPlsbR9PZm2
qXEmz3NM6iJ7MjpQDH2hvig1e1GllWdALe8n6A1yrmIiXyHTZVY1aHP6i/5YvOEiYLyUV66+O7lA
o/XvTk606CL+0OIEZIvQvJFke6f/fWTU9bcmCeM10W7ihNhuDkSlOmUpdqnSxwoSQOz/4gluGqOW
ZRSSE1IqNhtWuKfJd1ivXYP7vxLS2GWn/Yzhp1Pk3YPBcbhMbV1sF/vBmmdrIn2M0K/6pEPnRALP
HgPIBoVjf9+2XFh/ml9DWN4rIGKwN3CFqg+q30ZX2eQdbWFlG4bDBZ2MtYXZHhOYeunkyelfSIF7
mLJmu+3fPY51365k6os6HBeSpoXqckLi+EjmlPAxlvRNbA68ZsSYQ25qzGUp+FPKyE2Sd4iTsO1b
vDyB9O06z4AUl6vJ76XW1w2rqYWBL6ys0Cg6Wz0hg/BYhbmERCKBFC1xGHYhgh0gygogltnij2+5
uu/bq8Mjvux7YId98s5T96q3mXVWjoVw7FRJf8rVE8uo0njzfyllZsPel5BqpTAHNg0uJKfZ484R
vXg=
=ArCD
-----END PGP SIGNATURE-----

--------------0H0ONNRlJHdJScyEHys0m90y--
