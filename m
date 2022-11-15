Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0ED62933E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 09:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0751810E0B6;
	Tue, 15 Nov 2022 08:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E8210E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:27:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AEFE31F8C4;
 Tue, 15 Nov 2022 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668500841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=im+8qe3VL+sLTIeUF1CPgTQVSl31YO+nIa1X4aZlxno=;
 b=blkh/BM0H4ig3+HBAaxbD0ssoEvZNTIJ+KGPkJI2VXBhb1MAd99HeUTgHzqOazhFG4z5/l
 f9Lpz5fSVAE9SQ/QTxEpVkd2UJKz1l2+L7QcJBanYLZ6wlEU4ZhrXnmInYVRUO2yeyL3iA
 GwRV3T5aTFKx8V8zXNhuIo6G7ksjMH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668500841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=im+8qe3VL+sLTIeUF1CPgTQVSl31YO+nIa1X4aZlxno=;
 b=NE0VFcQP/iIPoMEraivrxHL6XHVlR8Crn8xtlJ8mFbEGTZmbvtzSYoAsQVpte5ay/Lf9l3
 gKVM+OiSZJDbEQAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5687713A91;
 Tue, 15 Nov 2022 08:27:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QBT7E2lNc2NKPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 08:27:21 +0000
Message-ID: <fbefbea3-ce34-0cfd-df90-65bc46e73e26@suse.de>
Date: Tue, 15 Nov 2022 09:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
To: Robert Swindells <rjs@fdy2.co.uk>, noralf@tronnes.org,
 liuzixian4@huawei.com, airlied@redhat.com, lucas.demarchi@intel.com,
 kraxel@redhat.com, robh@kernel.org, kuba@kernel.org,
 marcel.ziswiler@toradex.com, sfr@canb.auug.org.au, daniel.vetter@ffwll.ch,
 cai.huoqing@linux.dev, nroberts@igalia.com, m.szyprowski@samsung.com,
 emil.velikov@collabora.com, sam@ravnborg.org, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dA4vVrHWCHXk8w8Mn3Xzsj1w"
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
--------------dA4vVrHWCHXk8w8Mn3Xzsj1w
Content-Type: multipart/mixed; boundary="------------jbKRzdMs2xgYcR1uksz0qYRM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Robert Swindells <rjs@fdy2.co.uk>, noralf@tronnes.org,
 liuzixian4@huawei.com, airlied@redhat.com, lucas.demarchi@intel.com,
 kraxel@redhat.com, robh@kernel.org, kuba@kernel.org,
 marcel.ziswiler@toradex.com, sfr@canb.auug.org.au, daniel.vetter@ffwll.ch,
 cai.huoqing@linux.dev, nroberts@igalia.com, m.szyprowski@samsung.com,
 emil.velikov@collabora.com, sam@ravnborg.org, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <fbefbea3-ce34-0cfd-df90-65bc46e73e26@suse.de>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>

--------------jbKRzdMs2xgYcR1uksz0qYRM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTEuMjIgdW0gMjA6NDIgc2NocmllYiBSb2JlcnQgU3dpbmRlbGxzOg0K
PiBDb250cmlidXRvcnMgdG8gdGhlc2UgZmlsZXMgYXJlOg0KPiANCj4gTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+DQo+IExpdSBaaXhpYW4gPGxpdXppeGlhbjRAaHVh
d2VpLmNvbT4NCj4gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IEx1Y2FzIERlIE1hcmNoaSA8
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4NCj4gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gSmFrdWIgS2lj
aW5za2kgPGt1YmFAa2VybmVsLm9yZz4NCj4gTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlz
d2lsZXJAdG9yYWRleC5jb20+DQo+IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcu
b3JnLmF1Pg0KPiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBD
YWkgSHVvcWluZyA8Y2FpLmh1b3FpbmdAbGludXguZGV2Pg0KPiBOZWlsIFJvYmVydHMgPG5y
b2JlcnRzQGlnYWxpYS5jb20+DQo+IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBz
YW1zdW5nLmNvbT4NCj4gRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4NCj4gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPg0KPiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
U3dpbmRlbGxzIDxyanNAZmR5Mi5jby51az4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAyICstDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2dl
bV9zaG1lbV9oZWxwZXIuaCAgICAgfCAyICstDQoNCllvdSdyZSB3ZWxjb21lIHRvIGR1YWwt
bGljZW5zZSBteSBjb250cmlidXRpb25zIHRvIHRoZXNlIGZpbGVzIHVuZGVyIA0KR1BMLTIu
MCBhbmQgTUlULg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQoNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBl
ci5jDQo+IGluZGV4IDM1MTM4ZjhhMzc1Yy4uZjFhNjhhNzFmODc2IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiBAQCAtMSw0ICsxLDQgQEAN
Cj4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBvciBNSVQNCg0KSURLIGZvciBzdXJlLCBidXQg
SSB0aGluayAnb3InIHNob3VsZCBiZSB3cml0dGVuIGluIGNhcGl0YWwgbGV0dGVycyBieSAN
CmNvbW1vbiBjb252ZW50aW9uLiBbMV0NCg0KPiAgIC8qDQo+ICAgICogQ29weXJpZ2h0IDIw
MTggTm9yYWxmIFRyw7hubmVzDQo+ICAgICovDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9o
ZWxwZXIuaA0KPiBpbmRleCBhMjIwMWIyNDg4YzUuLjU2YWMzMjk0N2QxYyAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaA0KPiArKysgYi9pbmNs
dWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oDQo+IEBAIC0xLDQgKzEsNCBAQA0KPiAt
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIG9yIE1JVCAqLw0KDQpPUg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2RhdmlkLWEtd2hlZWxlci9z
cGR4LXR1dG9yaWFsI3NwZHgtdHV0b3JpYWwNCg0KPiAgIA0KPiAgICNpZm5kZWYgX19EUk1f
R0VNX1NITUVNX0hFTFBFUl9IX18NCj4gICAjZGVmaW5lIF9fRFJNX0dFTV9TSE1FTV9IRUxQ
RVJfSF9fDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------jbKRzdMs2xgYcR1uksz0qYRM--

--------------dA4vVrHWCHXk8w8Mn3Xzsj1w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNzTWgFAwAAAAAACgkQlh/E3EQov+CK
8xAAlMOYq+qf2ZL5e4GYKa9GVSg0umzA8/aEy76yxa+Hm7Jb5tsHaQNb70oW+qASKGD0WCOIAxES
CwhySMMwGnRmuFriGlhccQIF3xXYn8VRZG/3y25dEOyQ06jgcxxq6bdKo/JJwuaIldgenu7WiwhB
nxpJvsm0bSjM8QxFN9Z0TQIEWqXPYNMyamqtFq9DTCFldXk5MzWdUlTXeSyh/IJSIPREIH73jaey
GYSVs4x7ZcgZrgWBoUjrlMLYMugA+TPGtGW1NU+JocUSOqXfKMgy+WQjhBk92qGdu4+uYfhs7aWy
Rzvx+dX/gMO0rZG5lRhfYxGXgYwTvDB6iqOpyF2f2rxh9c1fzTeZTMx+M9UYnUc4/40py1ZlDBtk
wY1gdklkHkt8ixfcYfm1fdGWzT5VVVHvu2yJLwUNba4rqE1BX3ZRreA2PP4m3JAw4QjKJOFMPRhi
IPleeelP4AuUqPhhyPEdC1PUk4QuAD/3uSiwvXFfzqs+EPR+9Gmw5g1b7vDlf1pHS0zCYNTFHzSo
hkAQYwuLo+O4EcUyfNT6olGRS3eGs7SsCopKpbFYXmcvFWY2JQuISejcCMvDcOIDPjw/aN62du6R
6g73drTuTJngCZgdqrr7NkNm2KjI7xzgL4R0zQHU4dJSNXHyCU+sL4SwJ76jJJP7ma+kUkvGhc8c
T7g=
=Ja0M
-----END PGP SIGNATURE-----

--------------dA4vVrHWCHXk8w8Mn3Xzsj1w--
