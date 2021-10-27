Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266243D0C3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 20:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6356A89C56;
	Wed, 27 Oct 2021 18:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C566E89C56
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 18:30:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 285DF1FD47;
 Wed, 27 Oct 2021 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635359435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZMfINNzPE6pHkEjnDunLstZlbAYeAixrrZvtYFj0Hk=;
 b=enQcVm5/bI1fZrAiZCXx1PQ8EWmEgqrHYFTe02dBOj19NX0FxxZZVD5TqdQLYKbVdhnjU0
 RyGS4nMkzK1EoHWi/BPgJUweNwOfgvSS2HHZHO+KO8QEhzAzrotcilX49pw2NKN2ghm+eT
 O2Q89BznTdppQcM2QR+JuidScIIjpzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635359435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZMfINNzPE6pHkEjnDunLstZlbAYeAixrrZvtYFj0Hk=;
 b=0tDjn3+FOpuiGCgpAvRQAzbuW5+DwAJYNMkbWdROxf8pq2fqXCKOKfvBg1Vr+vwJSR8UYY
 PviTArgsX/oWhPAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C736B14068;
 Wed, 27 Oct 2021 18:30:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pg5/L8qaeWETLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Oct 2021 18:30:34 +0000
Message-ID: <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
Date: Wed, 27 Oct 2021 20:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] drm: import DMA_BUF module namespace
Content-Language: en-US
To: Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20211027152534.3366799-1-marcel@ziswiler.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211027152534.3366799-1-marcel@ziswiler.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F01O19CvWQNgrIzOLOyiFHsr"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------F01O19CvWQNgrIzOLOyiFHsr
Content-Type: multipart/mixed; boundary="------------gna0B3soxyr33E0wIY0PXBNH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Message-ID: <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
Subject: Re: [PATCH v1] drm: import DMA_BUF module namespace
References: <20211027152534.3366799-1-marcel@ziswiler.com>
In-Reply-To: <20211027152534.3366799-1-marcel@ziswiler.com>

--------------gna0B3soxyr33E0wIY0PXBNH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpBbSAyNy4xMC4yMSB1bSAxNzoyNSBz
Y2hyaWViIE1hcmNlbCBaaXN3aWxlcjoNCj4gRnJvbTogTWFyY2VsIFppc3dpbGVyIDxtYXJj
ZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQo+IA0KPiBUb2RheSdzIC1uZXh0IGZhaWxzIGJ1
aWxkaW5nIGFybTY0IGRlZmNvbmZpZyBhcyBmb2xsb3dzOg0KPiANCj4gRVJST1I6IG1vZHBv
c3Q6IG1vZHVsZSBkcm1fY21hX2hlbHBlciB1c2VzIHN5bWJvbCBkbWFfYnVmX3Z1bm1hcCBm
cm9tDQo+ICAgbmFtZXNwYWNlIERNQV9CVUYsIGJ1dCBkb2VzIG5vdCBpbXBvcnQgaXQuDQo+
IEVSUk9SOiBtb2Rwb3N0OiBtb2R1bGUgZHJtX2NtYV9oZWxwZXIgdXNlcyBzeW1ib2wgZG1h
X2J1Zl92bWFwIGZyb20NCj4gICBuYW1lc3BhY2UgRE1BX0JVRiwgYnV0IGRvZXMgbm90IGlt
cG9ydCBpdC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBU
ZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+DQo+IEZpeGVzOiBjb21taXQgNGIyYjVlMTQyZmY0
ICgiZHJtOiBNb3ZlIEdFTSBtZW1vcnkgbWFuYWdlcnMgaW50byBtb2R1bGVzIikNCj4gU2ln
bmVkLW9mZi1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5j
b20+DQo+IA0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hl
bHBlci5jIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMNCj4gaW5kZXggNmY3YjNm
OGVjMDRkMy4uNjlmODU2NGFkMTFjZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fY21hX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X2NtYV9oZWxwZXIuYw0KPiBAQCAtMjMsNiArMjMsOCBAQA0KPiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2dlbV9jbWFfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fdm1hX21hbmFn
ZXIuaD4NCj4gICANCj4gK01PRFVMRV9JTVBPUlRfTlMoRE1BX0JVRik7DQoNCkNvdWxkIHRo
aXMgbGluZSBiZSBtb3ZlZCB0byB0aGUgYm90dG9tIG9mIHRoZSBmaWxlLCB3aGVyZSB0aGUg
b3RoZXIgDQpNT0RVTEUgc3RhdGVtZW50cyBhcmU/DQoNCkluIHRoZSBmaXhlZCBjb21taXQg
NGIyYjVlMTQyZmY0LCB0aGVyZSdzIGEgc2ltaWxhciBjaGFuZ2UgZm9yIA0KZHJtX2dlbV9z
aG1lbV9oZWxwZXIuYy4gSXQgdXNlcyBkbWEtYnVmX3ZtYXAgYXMgd2VsbC4gRG9lcyB0aGF0
IG1vZHVsZSANCnJlcXVpcmUgdGhlIHNhbWUgZml4Pw0KDQpEbyB5b3UgaGF2ZSBhbnkgaWRl
YSB3aHkgSSBkb24ndCBzZWUgdGhlc2UgZXJyb3JzIGluIG15IGJ1aWxkcz8NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiArDQo+ICAgLyoqDQo+ICAgICogRE9DOiBjbWEgaGVscGVy
cw0KPiAgICAqDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------gna0B3soxyr33E0wIY0PXBNH--

--------------F01O19CvWQNgrIzOLOyiFHsr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF5msoFAwAAAAAACgkQlh/E3EQov+D/
IRAAsSnYvDWGk/IsOQXPm8nwU8S0Lw3lf2x0lAd/jKuZu1hnd06+b71mLGsjEyRE0uuRFoQRzyeI
xRjRQsMsriT6ECDLnyflluze07ycoqbB+JIBHvE36CdO+dP53AiSlsKO0ayatAilbn9kGO5Q5dk+
6zfw9ZcNvQhGYVXNULlTw17S4azAKOtaghLTDIxhDHioeI1Kwx+2UPLtDlJfcnmt2OxByvqo5Tcy
pjgDG5loMJ7EavtyapzaW9GE8YMMywlBoFjWP15rgv6MrmZy1om5cHWboxPD7eHkjIPycGz8DfJh
MuQ1isGBsFoyJsBliGFDYjgFL4DRXtgpeuwZWD326P0VCf7Ulw/6jjpQOjZVzZ55iJ2lkiC/aNxk
kBNWOyKWB2ijiWaV8OXldks5yYUtc9dhLsPriN4CHL7Iqw+n6E+Cka/1n6QN79IHRBGrsEdQ7Z1f
oXgX0RPlqvOKdi5fpVY+LoujBiDUErloQswEDbq5TZmOBpKO/Gl79qFPjCQH/qhVtx3SxeO0iP9a
CQnYXJwDlecsXPFFXcGC+YqEFaJTK0hAmA087a/uCmJy7MUDJxIEmQs1ji+7/ov+ZxdPy+v7hhd4
sn8ks+4UToYiOc6phkxbd752FKTZmTgqnUN//kQz2Y9g61Ah0BJKv/z7NqZiw6wJwKUv5nwhXO9r
xx8=
=hPKg
-----END PGP SIGNATURE-----

--------------F01O19CvWQNgrIzOLOyiFHsr--
