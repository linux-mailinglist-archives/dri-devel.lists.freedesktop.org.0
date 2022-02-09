Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B64AF258
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6AD10E319;
	Wed,  9 Feb 2022 13:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D4E10E319
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:07:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB5871F390;
 Wed,  9 Feb 2022 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644412027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oi3J9H27Vcg1jDaeM3WF1JcC1V+b8NgG0yELLIkOT8I=;
 b=wXGFlQuBb8E6IJ49GLrLjZXGeglVpAAWgZDatjIQiaRQ/MZBHgWDFoi+RRoNcJ82GIDsrM
 HNkJpBF461RW80BKcGvgYWqcKEkflYU3lRghga9eI9+/qNUD4ObrDyQksMDypOUvnF3FDL
 JFlZUiufpyJ6rNw3a80cUbMqlI+wzN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644412027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oi3J9H27Vcg1jDaeM3WF1JcC1V+b8NgG0yELLIkOT8I=;
 b=7KbZthKArcpownQbDu/XZ+PrrsM10WVqCetNyxIEqr5lcQaXp3UBG7CRXLmFrhcpdBqeiN
 +3G/Ymuyvxm4HoDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0FF213D2F;
 Wed,  9 Feb 2022 13:07:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E8M+Lnu8A2KvPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 13:07:07 +0000
Message-ID: <b5d16a42-d8d6-e78e-7089-2163e2066f6b@suse.de>
Date: Wed, 9 Feb 2022 14:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] drm/fb-helper: Clip damage area to written memory
 range
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-5-tzimmermann@suse.de>
 <5234738a-fce6-6df1-1200-94ae1ad1f5b9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5234738a-fce6-6df1-1200-94ae1ad1f5b9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3MK5PcUpbJW5gZOKzNNKVG9O"
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
--------------3MK5PcUpbJW5gZOKzNNKVG9O
Content-Type: multipart/mixed; boundary="------------KeLxaUzhpCy9TgqXlZsMTDnn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b5d16a42-d8d6-e78e-7089-2163e2066f6b@suse.de>
Subject: Re: [PATCH 4/5] drm/fb-helper: Clip damage area to written memory
 range
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-5-tzimmermann@suse.de>
 <5234738a-fce6-6df1-1200-94ae1ad1f5b9@redhat.com>
In-Reply-To: <5234738a-fce6-6df1-1200-94ae1ad1f5b9@redhat.com>

--------------KeLxaUzhpCy9TgqXlZsMTDnn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDIuMjIgdW0gMTI6MDkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDIvNi8yMiAyMDoyOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBXcml0ZSBoZWxwZXJzIHVzZWQgdG8gbWFyayB0aGUgY29tcGxldGUgc2NyZWVuIGFzIGRp
cnR5LiBUaGlzIGlzDQo+PiB3YXN0ZWZ1bCBmb3Igd3JpdGVzIHRoYXQgb25seSBjaGFuZ2Ug
YSBzbWFsbCBwb3J0aW9uIG9mIHRoZSBzY3JlZW4uDQo+PiBGaXggdGhlIHByb2JsZW0gYnkg
Y29tcHV0aW5nIHRoZSBkYW1hZ2VkIGFyZWEgZnJvbSB0aGUgd3JpdHRlbg0KPj4gbWVtb3J5
IHJhbmdlIGFuZCBwZXJmb3JtIGRhbWFnZSBoYW5kbGluZyBhY2NvcmRpbmdseS4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4+IC0tLQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxh
cyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9m
Yl9oZWxwZXIuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+PiBpbmRleCBhZTk4OTkwYzdiNjYuLmJlZDU4
YmUxYjIwNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVy
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+IEBAIC03
NTQsMTEgKzc1NCwxOCBAQCBFWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfc3lzX3JlYWQp
Ow0KPj4gICBzc2l6ZV90IGRybV9mYl9oZWxwZXJfc3lzX3dyaXRlKHN0cnVjdCBmYl9pbmZv
ICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLA0KPj4gICAJCQkJc2l6ZV90IGNvdW50
LCBsb2ZmX3QgKnBwb3MpDQo+PiAgIHsNCj4+ICsJbG9mZl90IHBvcyA9ICpwcG9zOw0KPj4g
ICAJc3NpemVfdCByZXQ7DQo+PiArCXN0cnVjdCBkcm1fcmVjdCBkYW1hZ2VfYXJlYTsNCj4+
ICAgDQo+PiAgIAlyZXQgPSBmYl9zeXNfd3JpdGUoaW5mbywgYnVmLCBjb3VudCwgcHBvcyk7
DQo+PiAtCWlmIChyZXQgPiAwKQ0KPj4gLQkJZHJtX2ZiX2hlbHBlcl9kYW1hZ2UoaW5mbywg
MCwgMCwgaW5mby0+dmFyLnhyZXMsIGluZm8tPnZhci55cmVzKTsNCj4+ICsJaWYgKHJldCA8
PSAwKQ0KPj4gKwkJcmV0dXJuIHJldDsNCj4+ICsNCj4gDQo+IEkgYWxzbyBsaWtlIGhvdyB5
b3UgY2xlYW5lZCB1cCB0aGUgZXJyb3IgY2hlY2tpbmcgaGVyZSBhbmQgYmVsb3cNCj4gdG8g
anVzdCByZXR1cm4gZWFybHksIGluc3RlYWQgb2YgY2hlY2tpbmcgaWYgcmV0ID4gMCB0byBw
ZXJmb3JtDQo+IHRoZSBkYW1hZ2UgaGFuZGxpbmcuDQoNCkl0J3MgbW9yZSByZWFkYWJsZSBu
b3cgSU1ITy4gQW5kIEkgdGhpbmsgSSByZWFkIHRoYXQgY29tcGlsZXJzIG9yIENQVXMgDQpl
eHBlY3QgdGhpcyB0ZXN0IHRvIGZhaWwgYnkgZGVmYXVsdCBpbiB0aGVpciBicmFuY2ggcHJl
ZGljdGlvbi4gU28gaXQgDQptaWdodCBldmVuIGJlIGZhc3RlciBieSBhIGZldyBjeWNsZXMu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------KeLxaUzhpCy9TgqXlZsMTDnn--

--------------3MK5PcUpbJW5gZOKzNNKVG9O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIDvHsFAwAAAAAACgkQlh/E3EQov+CZ
VRAAzAqGATyqkRTjbD/bd0KOIPHiPoqcKZi5gjO6x4Iru+7ZJ32oy10DVsv04IDNHyerTDDEXxmx
R9mQ6PqBl7UydMaf6FGF5bOKE6JNgslh8y5IOvJniUxy4nd533fB+K0Pc8pMQ8d+fQoFRSX2s+em
TWT/9RPgzf+m+S9v0KEbUANKVt+lOaugg1Zgb7hCyqe1/rme6DbGaPuirBIkNZOAL52tNm49fhUt
3drj8cw2/JGnDObzZrdhf4+x++5cREinUqq7HM7rRrORJcD5F8eq6sxp7nOfN0kf2AbbTRgmc8ON
8I4lUjXB+IhTPOM2D4ASN0v0Cjq/kloouYFmQPFh7T1+fMsRj3ZMI8UMTEQkNWVWl4XiQ3WxMwrq
Th15vMANQRbweU0igXz3cdkRgLjcaFvM7o+Dhr97F9GJaVvPK7DMTQB6RMyJTEifLrxo319gSv1x
MXVu7lEWy0BXr5oUYLG7KiXKAMrB+lMA/65Uej8QtUwO6mgX4+1/zCelYoU82DMHmrxmJRHCqokI
3YtROBhdeEtu1bYenAdB0xih0e7EH08536iAxn+Jo6/YM/eLe4PrAwe7yD7JOUoJ/KdTCQHWE5gs
qov2vNXayz3OksWTe9pBvyq7lvmMWBuq7ER1fkVGFFFxFcmxvj9WOK9f6XzUgiO8PNY3OyrIh4ab
Bo4=
=Bznv
-----END PGP SIGNATURE-----

--------------3MK5PcUpbJW5gZOKzNNKVG9O--
