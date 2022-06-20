Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A75515AB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA671123D5;
	Mon, 20 Jun 2022 10:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FE91123D5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:21:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A59A821BA3;
 Mon, 20 Jun 2022 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655720494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XVcNmF2E+DVKnK4/pnE8z3ircSG0fJHMq6fVlgfgr3g=;
 b=ZcS8ZBJOdgvveWtpJQP2N5K3rwZgAp78fDJif6mWqNriD/v+rErZFhNPXupqaEXNd1g53e
 JjpymhjzSN4Nr99sU1Ycxzxk+QoHVFw1gR0rJTiC8VVukD+zDBGj3TVXFRTUyEOtKy9ESt
 iYkNSpwY+q2qBAIbiDT14KhnFWX+uXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655720494;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XVcNmF2E+DVKnK4/pnE8z3ircSG0fJHMq6fVlgfgr3g=;
 b=pnbB3qn++IuScJII4HSY9pfJwtQ68m+xmBgaOSf2ctZZ4fpsogWd0NDZfcHp+/o4kaljAE
 xl0dRtkRS6Z9neCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 245EA13638;
 Mon, 20 Jun 2022 10:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZGvdAy5KsGJOXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 10:21:34 +0000
Message-ID: <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
Date: Mon, 20 Jun 2022 12:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-6-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0PKtBvArJRIKgGhdSdFzWvxB"
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
--------------0PKtBvArJRIKgGhdSdFzWvxB
Content-Type: multipart/mixed; boundary="------------tBoVh03YwUzpKrJtalKlcD48";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-6-maxime@cerno.tech>

--------------tBoVh03YwUzpKrJtalKlcD48
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDYuMjIgdW0gMTE6Mjggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBV
bmxpa2UgZW5jb2RlcnMgYW5kIENSVENzLCB0aGUgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgYW5k
DQo+IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpIGRvbid0IG1lbnRpb24gaG93IHRo
ZSBjbGVhbnVwIGlzIHN1cHBvc2VkIHRvDQo+IGJlIGRvbmUuIExldCdzIGFkZCBpdC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMTAgKysrKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gaW5kZXggMzUzZDgzYWUwOWQzLi4yYTc4YTIzODM2
ZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYw0KPiBAQCAtMjIyLDYgKzIy
MiwxMSBAQCB2b2lkIGRybV9jb25uZWN0b3JfZnJlZV93b3JrX2ZuKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykNCj4gICAgKiBJbml0aWFsaXNlcyBhIHByZWFsbG9jYXRlZCBjb25uZWN0
b3IuIENvbm5lY3RvcnMgc2hvdWxkIGJlDQo+ICAgICogc3ViY2xhc3NlZCBhcyBwYXJ0IG9m
IGRyaXZlciBjb25uZWN0b3Igb2JqZWN0cy4NCj4gICAgKg0KPiArICogQXQgZHJpdmVyIHVu
bG9hZCB0aW1lIHRoZSBkcml2ZXIncyAmZHJtX2Nvbm5lY3Rvcl9mdW5jcy5kZXN0cm95IGhv
b2sNCj4gKyAqIHNob3VsZCBjYWxsIGRybV9jb25uZWN0b3JfdW5yZWdpc3RlcigpLCBkcm1f
Y29ubmVjdG9yX2NsZWFudXAoKSBhbmQNCj4gKyAqIGtmcmVlKCkgdGhlIGNvbm5lY3RvciBz
dHJ1Y3R1cmUuIFRoZSBjb25uZWN0b3Igc3RydWN0dXJlIHNob3VsZCBub3QNCg0KVGhpcyBz
b3VuZHMgb2RkLiBNYXliZQ0KDQonLi4uIHRvIHJlbGVhc2UuLi4gdGhlIGNvbm5lY3RvciBz
dHJ1Y3R1cmUnID8NCg0KPiArICogYmUgYWxsb2NhdGVkIHdpdGggZGV2bV9remFsbG9jKCku
DQo+ICsgKg0KPiAgICAqIFJldHVybnM6DQo+ICAgICogWmVybyBvbiBzdWNjZXNzLCBlcnJv
ciBjb2RlIG9uIGZhaWx1cmUuDQo+ICAgICovDQo+IEBAIC0zNDUsNiArMzUwLDExIEBAIEVY
UE9SVF9TWU1CT0woZHJtX2Nvbm5lY3Rvcl9pbml0KTsNCj4gICAgKiBJbml0aWFsaXNlcyBh
IHByZWFsbG9jYXRlZCBjb25uZWN0b3IuIENvbm5lY3RvcnMgc2hvdWxkIGJlDQo+ICAgICog
c3ViY2xhc3NlZCBhcyBwYXJ0IG9mIGRyaXZlciBjb25uZWN0b3Igb2JqZWN0cy4NCj4gICAg
Kg0KPiArICogQXQgZHJpdmVyIHVubG9hZCB0aW1lIHRoZSBkcml2ZXIncyAmZHJtX2Nvbm5l
Y3Rvcl9mdW5jcy5kZXN0cm95IGhvb2sNCj4gKyAqIHNob3VsZCBjYWxsIGRybV9jb25uZWN0
b3JfdW5yZWdpc3RlcigpLCBkcm1fY29ubmVjdG9yX2NsZWFudXAoKSBhbmQNCj4gKyAqIGtm
cmVlKCkgdGhlIGNvbm5lY3RvciBzdHJ1Y3R1cmUuIFRoZSBjb25uZWN0b3Igc3RydWN0dXJl
IHNob3VsZCBub3QNCj4gKyAqIGJlIGFsbG9jYXRlZCB3aXRoIGRldm1fa3phbGxvYygpLg0K
PiArICoNCg0KU2FtZSBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgICog
RW5zdXJlcyB0aGF0IHRoZSBkZGMgZmllbGQgb2YgdGhlIGNvbm5lY3RvciBpcyBjb3JyZWN0
bHkgc2V0Lg0KPiAgICAqDQo+ICAgICogUmV0dXJuczoNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------tBoVh03YwUzpKrJtalKlcD48--

--------------0PKtBvArJRIKgGhdSdFzWvxB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwSi0FAwAAAAAACgkQlh/E3EQov+C9
4hAAs1re3O6NcDMpSWDsWYS84WXuaD08xXegRRYqz1svUpbv/dqseI5pM6DJ3w1A0wxn5jjXcedd
3KCmVokopTkxn3L7hIXW+UY2o3ISj5BNsKM6YIRMRLO0/loTvRVDaPuCL+ZoxPEVPgA6Kk/MKY2U
9FFORPRt9jSNTpI5dXlXc1hFNJWRcwMvtm8rYBdcfKp421TJYhDiTy8azQj41GbLcLKyYmABKBcQ
weXGfPoOLRuUlHb1unJNndkIs7IryNWCEizXCH29X5oJq1ZXzGzaEQz8wUP+lFR9k9v22869Xpy6
p3yTijQkZb2u032IxgqHY85Zcfg93XtH6GBuXU8sErtkvUd1HfxmcGbWku/Mhm6NeaU3hKCkVuvs
xm6HX05wul8nWeRXcZQGTxmbcQIknK165bWw4mK9IQ0DG7i2eVULSS6mbCbD1qHx8Vp3LG/nixqc
OESCaKjL0OGA5c5E1BOUfkLCkwIoXmi0l0SVr/rLBoBLFjdnF00b5xMG4KlETTUFH8VymRluxoYQ
ABAtrCvH7jR2zitHbShyD5sdH7cvrDVslmBl4w5hi5t8Si8RWAQ37iH4gvw9kO1O2vepi7eeAmMR
VQnul8UF07nWov9s8ML+Wy27MWYkQtScIj96rF2TFWWRP6nuENE5DV0hDmLvRDDQFvnACQY1xgj/
0xQ=
=Nwp9
-----END PGP SIGNATURE-----

--------------0PKtBvArJRIKgGhdSdFzWvxB--
