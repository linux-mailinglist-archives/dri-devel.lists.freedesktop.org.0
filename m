Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5A632278
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 13:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41BA10E2BF;
	Mon, 21 Nov 2022 12:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2F10E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 12:41:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03BDB21CF4;
 Mon, 21 Nov 2022 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669034474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Sg20YjFdHsCdXs8OXaGgU51HC0eApYM2tMX90JZz2o=;
 b=W9E0Z3VGfO0PasYZTDAyRoFKLbOn5cvZpRMPlzM7ue8pdaaF0IKq7u57QSUzIER5uQ7ZLe
 kY58YXO2f0Pu96g4lAt65RjSiJfpqYIYPoYeQTMrhtP1Y1t3SqatNWEXtzDvADxJCG2u9l
 RnwckmQtJoZWmXW93bGD9DWSuyXfq38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669034474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Sg20YjFdHsCdXs8OXaGgU51HC0eApYM2tMX90JZz2o=;
 b=PB8+QyVEcyf6A7MXhpTpwilHOWEeh6OJqkGkE405MweAo/wsDIfvrt+2+cLYbJz9W6YxL5
 4wwx/43P1OddcsCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC0591376E;
 Mon, 21 Nov 2022 12:41:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4yrTLOlxe2MfXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 12:41:13 +0000
Message-ID: <98ed3b6c-bca1-c184-faab-c8d7b5771fb0@suse.de>
Date: Mon, 21 Nov 2022 13:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------itVXnD2yU6Mlsex0qNO20Ll9"
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
--------------itVXnD2yU6Mlsex0qNO20Ll9
Content-Type: multipart/mixed; boundary="------------lpkSbpJ0PWH0Nt8crf3iGCB1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <98ed3b6c-bca1-c184-faab-c8d7b5771fb0@suse.de>
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
In-Reply-To: <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>

--------------lpkSbpJ0PWH0Nt8crf3iGCB1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTEuMjIgdW0gMTM6Mjcgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDIxLjExLjIwMjIgMTEuNDUsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gQ29udmVydCB0aGUgTUlQSS1EQkktYmFzZWQgZHJpdmVycyB0byBzaGFkb3ctcGxh
bmUgaGVscGVycy4gVGhlDQo+PiBkcml2ZXJzIHZtYXAvdnVubWFwIEdFTSBidWZmZXIgbWVt
b3J5IGR1cmluZyB0aGUgYXRvbWljIGNvbW1pdC4NCj4+IFNoYWRvdy1wbGFuZSBoZWxwZXJz
IGF1dG9tYXRlIHRoaXMgcHJvY2Vzcy4NCj4+DQo+PiBQYXRjaGVzIDEgdG8gNCBwcmVwYXJl
IHRoZSBNSVBJIGNvZGUgZm9yIHRoZSBjaGFuZ2UgYW5kIHNpbXBsaWZ5DQo+PiB0aGUgcmVz
dG9mIHRoZSBwYXRjaHNldC4NCj4+DQo+PiBQYXRjaGVzIDUgdG8gNyByZXdvcmsgdGhlIHZt
YXAgY29kZSBpbiB0aGUgTUlQSS1EQkkgZHJpdmVycyBhbmQgYWRkDQo+PiBzaGFkb3ctcGxh
bmUgaGVscGVycy4gTW9zdCBvZiB0aGUgYWZmZWN0ZWQgZHJpdmVycyBjYWxsIE1JUEktREJJ
DQo+PiBoZWxwZXJzIGFuZCBnZXQgdGhlIHVwZGF0ZSBhdXRvbWF0aWNhbGx5LiBPbmx5IGls
aTkyMjUgYW5kIHN0NzU4Ng0KPj4gcmVxdWlyZSBjaGFuZ2VzIHRvIHRoZWlyIHNvdXJjZSBj
b2RlLg0KPj4NCj4+IFBhdGNoIDggc2ltcGxpZmllcyBkcm1fZGV2X2VudGVyKCkgYW5kIF9l
eGl0KCkuIEl0J3Mgbm90IHN0cmljdGx5DQo+PiBuZWVkZWQsIGJ1dCBzdHJlYW1saW5lcyB0
aGUgZHJpdmVyIGNvZGUgYW5kIG1ha2Ugc2Vuc2Ugb3ZlcmFsbC4NCj4+DQo+PiBUZXN0aW5n
IGlzIHdlbGNvbWUsIGFzIEkgZG9uJ3QgaGF2ZSBhbnkgaGFyZHdhcmUgdG8gdGVzdCB0aGVz
ZQ0KPj4gY2hhbmdlcyBteXNlbGYuDQo+Pg0KPiANCj4gSSBjYW4gZG8gYSB0ZXN0IHRoaXMg
d2Vla2VuZC4NCg0KVGhhbmtzIGEgbG90Lg0KDQo+IA0KPiBCdHcgSSd2ZSBjb252ZXJ0ZWQg
ZHJtL2d1ZCB0byB0aGUgc2hhZG93IHBsYW5lIGhlbHBlciwgSSBqdXN0IG5lZWQgdG8NCj4g
c29sdmUgYW4gc210cCBwcm9ibGVtWzFdIHNvIEkgY2FuIHNlbmQgb3V0IHRoZSBwYXRjaHNl
dC4NCg0KSG93IHNvPyAgV2hlbiBJIGxvb2tlZCBhdCBpdCwgdGhlIHZtYXAvdnVubWFwIGhh
cHBlbmVkIG9uIGEgc2VwYXJhdGUgDQp3b3JrZXIgdGhhbiB0aGUgY29tbWl0IElJUkMuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFsxXQ0KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9kcmktZGV2ZWwvMWJjNDU3NzUtMDY2Ny0wMWY4LTM2ZTEtOWY2NWQzMDgxMDky
QHRyb25uZXMub3JnL1QvI3UNCj4gDQo+IE5vcmFsZi4NCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------lpkSbpJ0PWH0Nt8crf3iGCB1--

--------------itVXnD2yU6Mlsex0qNO20Ll9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN7cegFAwAAAAAACgkQlh/E3EQov+An
uhAA0f4UX3GTPyikNzrf9pz4WL8cT0UDNc8Tz1wUalAWXUDYom24tspM3xB+PTUBf6lltWwQ6VOL
PL8nw3Mgy8nhJjq0Km7hEYPNH4y3oBAXC7kj5lsCPRjm+KOt84jo6x8ye9cJLrU0ZfieRIaW9Ygw
RyM//fTBIt26lA+4rwBXKydAAswzcK/nKdFR8uN/G3kvjF+99CKEFmuu9bd/wq7jvk6UepjIPmrZ
uDFrlZqd2mEbbvlY8IZO/K3i8118WbZ1BZeLmhW90nmWY8ndvTrjDsQ3anTvQvMGm4jSQuSSjivP
UHMQ4qKvRb00DzKOrycff2OPyh2kpCbNzsTtL2aweejdZ16qG3zysIIN3qRZ75u0ifnDDLeVuuuS
/MX5F7w9mtgdrMiCh6cB27+ZA2/Y7g7ljBK8HRL6py5IMcH3OJzAAMGquL0OEjrfpQyjXG+yigu3
9y/IJOJvxisu49maqgd/HYK/AlwfTcjGtGQeLICKRgUHx8pHlDz0e4tc1WtqEvsj4qMLmpeNt9gF
3kaZqdkRxQ7Ga/YnWDmYut7mdmHHcwrc5mrIamVLkjjFG+Hm6lOC7Tx6rT5Rm2zncoLBRzKb+lJK
C0v99Z09EGtbNsbaVueDdc1D15iIPAEv9F7CpZKAqVupLQ0sqQ0H/AjK/buh0BG8C2wSb4BV4P2h
FsE=
=YPFC
-----END PGP SIGNATURE-----

--------------itVXnD2yU6Mlsex0qNO20Ll9--
