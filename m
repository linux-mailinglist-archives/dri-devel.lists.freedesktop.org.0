Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFF1737152
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 18:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBED10E08D;
	Tue, 20 Jun 2023 16:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F6510E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 16:18:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F73F1F37E;
 Tue, 20 Jun 2023 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687277912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NpOMWoEW4pXe7i9/tC2HwtlusNqni+9aJsD0xiu39ZE=;
 b=RNPvnF1eY02idMR17FNOho23Z+ouJTHn2QWhVTARYFpUmvu+OJj94987yvpKU3bCmRkKpS
 D2jxVud/mdmRPA6Wk3gilC062sjGfkiwjmaL4xBmUj9hrjTns0vGe6p/iTaVSNULvajmbu
 LnkAnpdIam1IHTx4oT0kNOdurAbRfHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687277912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NpOMWoEW4pXe7i9/tC2HwtlusNqni+9aJsD0xiu39ZE=;
 b=Z4z3a26EwUEXpj5y6nItk1ps16PjyCn6owKSPAnzl9vUcK9BtKlxvPbnLFLYuDIE/WtEiL
 4Fl7ioXAZnkz/UBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8B06133A9;
 Tue, 20 Jun 2023 16:18:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iC6RN1fRkWRDDAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 16:18:31 +0000
Message-ID: <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
Date: Tue, 20 Jun 2023 18:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, liyi <liyi@loongson.cn>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XECJcNB95CHGTgv4UzeA4Xf7"
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
--------------XECJcNB95CHGTgv4UzeA4Xf7
Content-Type: multipart/mixed; boundary="------------UovRTmpFe7ChStNzzonz6T8f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, liyi <liyi@loongson.cn>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
In-Reply-To: <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>

--------------UovRTmpFe7ChStNzzonz6T8f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjMgdW0gMTg6MDYgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyMy82LzIwIDIyOjQzLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpDQo+Pg0KPj4gQW0gMjAuMDYuMjMgdW0gMDY6MDggc2NocmllYiBTdWkgSmluZ2Zl
bmc6DQo+Pj4gcGluZyA/DQo+Pj4NCj4+PiBPbiAyMDIzLzMvMTQgMjA6NTMsIFN1aSBKaW5n
ZmVuZyB3cm90ZToNCj4+Pj4gwqAgZWxzZSBpcyBub3QgZ2VuZXJhbGx5IHVzZWZ1bCBhZnRl
ciByZXR1cm4NCj4+DQo+PiBObyBpbmRlbnRpb24gcGxlYXNlLg0KPj4NCj4gT0ssIHdpbGwg
YmUgZml4ZWQgYXQgdGhlIG5leHQgdmVyc2lvbi4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogU3VpIEppbmdmZW5nIDwxNTMzMDI3MzI2MEAxODkuY24+DQo+Pj4+IC0tLQ0KPj4+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIHwgNyArKysrLS0tDQo+Pj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW0uYw0KPj4+PiBpbmRleCBhNjIwOGUyYzA4OWIuLjM2NGUzNzMzYWY5OCAx
MDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+Pj4+IEBAIC0xMTUwLDggKzExNTAsOCBA
QCBpbnQgZHJtX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+Pj4+IMKg
IHsNCj4+Pj4gwqDCoMKgwqDCoCBpZiAob2JqLT5mdW5jcy0+cGluKQ0KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIG9iai0+ZnVuY3MtPnBpbihvYmopOw0KPj4+PiAtwqDCoMKg
IGVsc2UNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+PiArDQo+Pj4+ICvC
oMKgwqAgcmV0dXJuIDA7DQo+Pg0KPj4gVGhpcyBjaGFuZ2UgaXMgb2suDQo+Pg0KPj4+PiDC
oCB9DQo+Pj4+IMKgIHZvaWQgZHJtX2dlbV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikNCj4+Pj4gQEAgLTExNzIsNyArMTE3Miw4IEBAIGludCBkcm1fZ2VtX3ZtYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIA0KPj4+PiBzdHJ1Y3QgaW9zeXNfbWFwICptYXAp
DQo+Pj4+IMKgwqDCoMKgwqAgcmV0ID0gb2JqLT5mdW5jcy0+dm1hcChvYmosIG1hcCk7DQo+
Pj4+IMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biByZXQ7DQo+Pj4+IC3CoMKgwqAgZWxzZSBpZiAoaW9zeXNfbWFwX2lzX251bGwobWFwKSkN
Cj4+Pj4gKw0KPj4+PiArwqDCoMKgIGlmIChpb3N5c19tYXBfaXNfbnVsbChtYXApKQ0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07DQo+Pg0KPj4gVGhpcyBpcyBu
b3QgY29ycmVjdC4gQ2FsbGluZyBpb3N5c19tYXBfaXNfbnVsbCgpIGlzIHBhcnQgb2YgaGFu
ZGxpbmcgDQo+PiB0aGUgcmV0dXJuIHZhbHVlIGZyb20gdm1hcCwgc28gdGhlIGVsc2UgaXMg
ZmluZS4NCj4+DQo+IEFyZSB5b3Ugc2VyaW91cyA/DQo+IA0KPiANCj4gMS4gQmVmb3JlIGFw
cGx5IHRoaXMgcGF0Y2g6DQo+IA0KPiANCj4gSWYgdGhlICdyZXQnIGlzIDAswqAgaXQgc3Rh
bmQgZm9yIG9iai0+ZnVuY3MtPnZtYXAoKSBpcyBzdWNjZXNzZnVsLCB0aGVuIA0KPiBpZiAo
aW9zeXNfbWFwX2lzX251bGwobWFwKSkgd2lsbCBiZSBydW4uDQo+IA0KPiBJZiB0aGUgJ3Jl
dCcgaXMgTk9UIDAsIHRoZW4gaXQgcmV0dXJuIGltbWVkaWF0ZWx5Lg0KPiANCj4gDQo+IDIu
IEFmdGVyIGFwcGx5IHRoaXMgcGF0Y2g6DQo+IA0KPiANCj4gSWYgdGhlICdyZXQnIGlzIE5P
VCAwLCBpdCBzdGFuZCBmb3Igb2JqLT5mdW5jcy0+dm1hcCgpIGZhaWxlZCwgdGhlbiBpdCAN
Cj4gcmV0dXJuIGltbWVkaWF0ZWx5Lg0KPiANCj4gSWYgdGhlICdyZXQnIGlzIDAsIGl0IHN0
YW5kIGZvciBvYmotPmZ1bmNzLT52bWFwKCkgaXMgc3VjY2Vzc2Z1bCwgdGhlbiANCj4gdGhl
IGNoZWNrIGlmIChpb3N5c19tYXBfaXNfbnVsbChtYXApKQ0KPiANCj4gd2lsbCBiZSBydW4h
DQo+IA0KPiANCj4gSSBmZWVsIHN0cmFuZ2UgYWJvdXQgdGhlIGNvcmUgaGVyZSwgSSB0aGlu
ayB0aGUgY2hlY2sgJyBpZiANCj4gKGlvc3lzX21hcF9pc19udWxsKG1hcCkpJyBpcyBub3Qg
bmVlZGVkLA0KPiANCj4gdGhlIGltcGxlbWVudCBzaG91bGQgcmVzcG9uc2libGUgdG8gaGFu
ZGxlIGFsbCBvZiBwb3NzaWJsZSBlcnJvcnMuDQoNClRoZSAtPnZtYXAoKSBjYWxsYmFjayBj
YW4gc3VjY2VlZCB3aXRoIHJldD0wLCBidXQgd2Ugc3RpbGwgaGF2ZSBubyANCm1lbW9yeS4g
VGhlbiB3ZSByZXR1cm4gLUVOT01FTS4gVGhlIGNhbGwgdG8gX2lzX251bGwobWFwKSBpcyBw
YXJ0IG9mIHRoZSANCmVycm9yIGhhbmRsaW5nIGZvciAtPnZtYXAoKS4gVGhhdCBpcyBhIGJp
dCBzdHJhbmdlLCBidXQgaXQgYXMgYWx3YXlzIA0Kd29ya2VkIGxpa2UgdGhhdC4gS2VlcGlu
ZyBhbGwgZXJyb3IgaGFuZGxpbmcgaW4gdGhlIHNhbWUgaWYtZWxzZSBibG9jayANCm1ha2Ug
YWxsIHRoaXMgbW9yZSBvYnZpb3VzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiANCj4gQnV0IGJvdGggY2FzZSAoMS4gYW5kIDIuKSBhcmUgc2FtZSBpbiB0aGUgc2VtYW50
aWMsIHJpZ2h0Pw0KPiANCj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+
Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+Pg0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywg
R2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------UovRTmpFe7ChStNzzonz6T8f--

--------------XECJcNB95CHGTgv4UzeA4Xf7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSR0VcFAwAAAAAACgkQlh/E3EQov+Cl
/hAAnEWC5OQegpdai0DOv0dKS5NHzMmep/j5s/d16+lPeb99ZqvoiktXQUkRuAFCSNNcUW17pRoB
9vrPhsqZs45I7+ZuA+94n6/HRp6Kmlc3OFQfccTgBUe8bywXE06xnLwPVMdvi2UyfhdDk6FUS94U
AnZyvvLh+zEiYF6PBuzIfQK3LZc9EAfaia2MYpknppzoqY8ofsO5Bago4794wTO4hPX6hhE1UfNB
pi+PhXzkRltmCVRX5geAt1RIHSXy1F/Um79T4Bh+Ol356MHlcLjudZ/BjsVszmoKgnAgA5dOWs4e
q3PY+ZD7mGEIdLeg5d7W/BoNI/h7kbTuBoNbpy1QeeP3Na5RE/72uL4Ro1yXOKqq8HGpfotkQu6X
7+qy1BGSP4L/hfAwG6LSjYdYt4xOvvqceJ32OSJYj7GTc8GFKwl7QnXnULIhCUnh89d3wl7s/NQl
0cBHHiRh/blS6M1TcaGsfuTwpb9pfLE5f8qBB8IwbkMNFbuzEpJM7EMTPKvZd0RoKOJz+dPlrKNB
qrdefEG/H+bCMl90ChnKG7EPvwCHK9p5QtZMwiWahM9IBWoAc2dtB/oRXsL96VgDZpAeIiT0T5LA
9R8vyfCUmvXnqOlV9iG9iNjqjgARtnivKXTEzemzlymADevyb+2EKBTPwm9oCrzwYqZMTUIM5VYN
0YA=
=DwkN
-----END PGP SIGNATURE-----

--------------XECJcNB95CHGTgv4UzeA4Xf7--
