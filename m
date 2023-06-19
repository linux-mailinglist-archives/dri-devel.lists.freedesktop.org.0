Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FF735972
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D04710E20E;
	Mon, 19 Jun 2023 14:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A598710E20E;
 Mon, 19 Jun 2023 14:25:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A053B1F88B;
 Mon, 19 Jun 2023 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687184711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EmdngxdAfAdRgeTQ6brD+4mCQGX0/rNR5zaq9QX/X+g=;
 b=aATEIAOWmR+BcBidW/b6YkNuEgvYUz+VI2fuExf86NP6c1AzA34fNqFotJXEvgOFm0Fzg7
 SKyy7Exx4gPUIzdQO5cCSk47GTIQycnVnxblllTk//p5QelEsADil5/l1ifk/TdS4y0K6j
 NKKJS0c7RBybUcdFstMw3QtrcySxylA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687184711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EmdngxdAfAdRgeTQ6brD+4mCQGX0/rNR5zaq9QX/X+g=;
 b=3yt+/9EaX+EC1a12GaIJIrwU9b7EPKH/teoGEsxw4JWTypLmNrG4k0N5rlOAmOKTIFdajf
 jH/lm/X1JehVSpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BC59138E8;
 Mon, 19 Jun 2023 14:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P7VIHUdlkGQCIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 14:25:11 +0000
Message-ID: <8df0c3a6-363e-b3dc-f6e2-4a20188e29e0@suse.de>
Date: Mon, 19 Jun 2023 16:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/amdgpu: Remove struct drm_driver.gem_prime_mmap
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, jani.nikula@linux.intel.com
References: <20230619141129.2002-1-tzimmermann@suse.de>
 <74d264fe-7f76-0744-7011-56e04ad1f48a@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <74d264fe-7f76-0744-7011-56e04ad1f48a@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PYXjclUKBg4mT201Iet8I7yR"
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PYXjclUKBg4mT201Iet8I7yR
Content-Type: multipart/mixed; boundary="------------nMFW0QgY45SzlgbvahcOTeHi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Message-ID: <8df0c3a6-363e-b3dc-f6e2-4a20188e29e0@suse.de>
Subject: Re: [PATCH] drm/amdgpu: Remove struct drm_driver.gem_prime_mmap
References: <20230619141129.2002-1-tzimmermann@suse.de>
 <74d264fe-7f76-0744-7011-56e04ad1f48a@amd.com>
In-Reply-To: <74d264fe-7f76-0744-7011-56e04ad1f48a@amd.com>

--------------nMFW0QgY45SzlgbvahcOTeHi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuDQoNCkFtIDE5LjA2LjIzIHVtIDE2OjEzIHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoNCj4gDQo+IA0KPiBBbSAxOS4wNi4yMyB1bSAxNjoxMSBzY2hyaWViIFRob21h
cyBaaW1tZXJtYW5uOg0KPj4gVGhlIGNhbGxiYWNrIHN0cnVjdCBkcm1fZHJpdmVyLmdlbV9w
cmltZV9tbWFwIGFzIGJlZW4gcmVtb3ZlZCBpbg0KPj4gY29tbWl0IDBhZGVjMjI3MDJkNCAo
ImRybTogUmVtb3ZlIHN0cnVjdCBkcm1fZHJpdmVyLmdlbV9wcmltZV9tbWFwIikuDQo+PiBE
byBub3QgYXNzaWduIHRvIGl0LiBUaGUgYXNzaWduZWQgZnVuY3Rpb24sIGRybV9nZW1fcHJp
bWVfbW1hcCgpLCBpcw0KPj4gbm93IHRoZSBkZWZhdWx0IGZvciB0aGUgb3BlcmF0aW9uLCBz
byB0aGVyZSBpcyBubyBjaGFuZ2UgaW4gDQo+PiBmdW5jdGlvbmFsaXR5Lg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
Pj4gRml4ZXM6IDBhZGVjMjI3MDJkNCAoImRybTogUmVtb3ZlIHN0cnVjdCBkcm1fZHJpdmVy
LmdlbV9wcmltZV9tbWFwIikNCj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+DQo+PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+DQo+PiBDYzogIlBhbiwgWGluaHVpIiA8WGluaHVpLlBhbkBhbWQuY29tPg0KPj4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KVGhhbmtzIGZvciB0aGUgcXVpY2sg
cmVzcG9uc2UuIEknbGwgYWRkIHRoZSBwYXRjaCB0byBkcm0tbWlzYy1uZXh0IA0KaW1tZWRp
YXRlbHksIHRvIG1ha2UgdGhlIHRyZWUncyBhbWRncHUgYnVpbGQgYWdhaW4uDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDEgLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMNCj4+IGluZGV4IDQzNjEzNTY5ODAxYjYuLjA3ZTE2YWQ0NjVkMDYgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPj4g
QEAgLTI4NzksNyArMjg3OSw2IEBAIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIGFtZGdwdV9w
YXJ0aXRpb25fZHJpdmVyID0gew0KPj4gwqDCoMKgwqDCoCAucHJpbWVfaGFuZGxlX3RvX2Zk
ID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsDQo+PiDCoMKgwqDCoMKgIC5wcmltZV9m
ZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwNCj4+IMKgwqDCoMKg
wqAgLmdlbV9wcmltZV9pbXBvcnQgPSBhbWRncHVfZ2VtX3ByaW1lX2ltcG9ydCwNCj4+IC3C
oMKgwqAgLmdlbV9wcmltZV9tbWFwID0gZHJtX2dlbV9wcmltZV9tbWFwLA0KPj4gwqDCoMKg
wqDCoCAubmFtZSA9IERSSVZFUl9OQU1FLA0KPj4gwqDCoMKgwqDCoCAuZGVzYyA9IERSSVZF
Ul9ERVNDLA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------nMFW0QgY45SzlgbvahcOTeHi--

--------------PYXjclUKBg4mT201Iet8I7yR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQZUUFAwAAAAAACgkQlh/E3EQov+BV
ARAAlqDZ2WtM1dEZ5r8fxMbLkbk/Fo70POM0EiX4QqtCkxwjwRirh+XT2Ncl5BSZOwUa3g/VrfYX
y3xUZNFSFy76onNdh5t/IsoyK+ZJNrMTFGMuWeKPatA5iXcbVDn81zNP7MiKqPDY4yjUMjP1BzsZ
oC7AKg4p7ooGpW7Ncr37BgcbEanbfmQXjPojRskLg4zep4b7eA+TNGVmsY3f9HUGPdfxMJ4+pfUT
SfLrI/L6eJXHgYs/06F5mYavQjfWUbRbXLPQ5lg2cW5wIGC4HqIkSpsvrp0oofSahlmPJB2paPbq
Lp/96uTK5Ut/rvyEEYBzcCxMCDmmaJ2XUNIB0miCJuJuCQqoxP1L6DawzvoawT2bR+HbMQfqinsr
tkwbNwSedkAJdAz33yR3UjlMp1BNvec9OKHLFR8Tg7mOst5Je+L/aFrzT014TuFBqBkYqURqzMPu
gSZpkgy+M7XXSVlQ6x5O6vvXrhiflxJM10ZLGY9dMRZQX1AlFX7Videc9lmc/sKxkpWXtdYd/Ijj
GJMI+wPg5Eqm7fiRT323mB0YHehJdlD6EajVE6PvDF8t3vgD9EO3u32dyW3VZCWFteMe+K31RIdT
CkXxz8PxJLEqgevBxLviIU3ldIdZp6/pcEgN4xXYCxqBNKyjCYHi2N5F2V7xrksSypEWa9dTZIky
6Fw=
=mbzR
-----END PGP SIGNATURE-----

--------------PYXjclUKBg4mT201Iet8I7yR--
