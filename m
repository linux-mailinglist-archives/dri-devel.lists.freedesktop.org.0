Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00AD56D8C7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 10:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AA0113143;
	Mon, 11 Jul 2022 08:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27960113143
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 08:50:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C835321F54;
 Mon, 11 Jul 2022 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657529400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvPFqfKyiFIdK1AaFm8I5SaQdT4uELrcI/tqDk8uoEQ=;
 b=naZydrjLQmyMTvqCOZ6jvyglCish5w/UNgZOV2Kw+vY1znRyflwQ+AL4gaHEzRoH7ROHsG
 sOQiaYvWf4BduSa+iaKvlWtjdIbnmY6mfVZoJW3KycIg7zI+/b/pS9t4DmfItaNckEkpNh
 TMJ8j9hDC+AlyJEMMIB0VyKPE6iDpNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657529400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvPFqfKyiFIdK1AaFm8I5SaQdT4uELrcI/tqDk8uoEQ=;
 b=09rLuyvVHGQaSpTdsLMUK46nPsVqUnPxKrGTvD4plgYYsEsOCuh8gCTTBEeAzfGkZ5qfDi
 VYwiK4+40xM5KkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93CF713322;
 Mon, 11 Jul 2022 08:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w78qIzjky2IhLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 08:50:00 +0000
Message-ID: <d6e5204e-5bbb-fe51-fd29-5452198bf368@suse.de>
Date: Mon, 11 Jul 2022 10:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/10] drm: Add support for low-color frame buffer
 formats
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
 <YsmE1D8lGp4XKs99@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YsmE1D8lGp4XKs99@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ct62SAFYiBl9No95sn0kEftp"
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
Cc: linux-m68k@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ct62SAFYiBl9No95sn0kEftp
Content-Type: multipart/mixed; boundary="------------bwmKnOaXzIJOCqFUF8X28tun";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <d6e5204e-5bbb-fe51-fd29-5452198bf368@suse.de>
Subject: Re: [PATCH v3 00/10] drm: Add support for low-color frame buffer
 formats
References: <cover.1657294931.git.geert@linux-m68k.org>
 <YsmE1D8lGp4XKs99@ravnborg.org>
In-Reply-To: <YsmE1D8lGp4XKs99@ravnborg.org>

--------------bwmKnOaXzIJOCqFUF8X28tun
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDcuMjIgdW0gMTU6Mzggc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IEdlZXJ0LA0KPiANCj4gT24gRnJpLCBKdWwgMDgsIDIwMjIgYXQgMDg6MjA6NDVQTSArMDIw
MCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPj4gCUhpIGFsbCwNCj4+DQo+PiBBIGxv
bmcgb3V0c3RhbmRpbmcgaXNzdWUgd2l0aCB0aGUgRFJNIHN1YnN5c3RlbSBoYXMgYmVlbiB0
aGUgbGFjayBvZg0KPj4gc3VwcG9ydCBmb3IgbG93LWNvbG9yIGRpc3BsYXlzLCBhcyB1c2Vk
IHR5cGljYWxseSBvbiBvbGRlciBkZXNrdG9wDQo+PiBzeXN0ZW1zLCBhbmQgb24gc21hbGwg
ZW1iZWRkZWQgZGlzcGxheXMuDQoNCkZvciB0aGUgcGF0Y2hzZXQNCg0KQWNrZWQtYnk6IFRo
b21hcyBaaW1lbXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IA0KPiBJVCBpcyBz
dXBlciB0byBoYXZlIHRoaXMgYWRkcmVzc2VkIC0gdGhhbmtzIQ0KPiANCj4+DQo+PiBUaGlz
IHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGNvbG9yLWluZGV4ZWQgZnJhbWUgYnVm
ZmVyIGZvcm1hdHMNCj4+IHdpdGggMiwgNCwgYW5kIDE2IGNvbG9ycy4gIEl0IGhhcyBiZWVu
IHRlc3RlZCBvbiBBUkFueU0gdXNpbmcgYQ0KPj4gd29yay1pbi1wcm9ncmVzcyBBdGFyaSBE
Uk0gZHJpdmVyIHN1cHBvcnRpbmcgMiwgNCwgMTYsIDI1NiwgYW5kIDY1NTM2DQo+PiBjb2xv
cnMsIHdpdGggdGV4dCBjb25zb2xlIG9wZXJhdGlvbiwgZmJ0ZXN0LCBhbmQgbW9kZXRlc3Qu
DQo+Pg0KPj4gT3ZlcnZpZXc6DQo+PiAgICAtIFBhdGNoIDEgaW50cm9kdWNlcyBhIGhlbHBl
ciwgdG8gYmUgdXNlZCBieSBsYXRlciBwYXRjaGVzIGluIHRoZQ0KPj4gICAgICBzZXJpZXMs
DQo+PiAgICAtIFBhdGNoIDIgaW50cm9kdWNlcyBhIGZsYWcgdG8gaW5kaWNhdGUgY29sb3It
aW5kZXhlZCBmb3JtYXRzLA0KPj4gICAgLSBQYXRjaGVzIDMgYW5kIDQgY29ycmVjdCBjYWxj
dWxhdGlvbnMgb2YgYml0cyBwZXIgcGl4ZWwgZm9yIHN1Yi1ieXRlDQo+PiAgICAgIHBpeGVs
IGZvcm1hdHMsDQo+PiAgICAtIFBhdGNoZXMgNSBhbmQgNiBpbnRyb2R1Y2UgdGhlIG5ldyBD
WzEyNF0gZm9ybWF0cywNCj4+ICAgIC0gUGF0Y2ggNyBmaXhlcyBhbiB1bnRlc3RlZCBjb2Rl
IHBhdGgsDQo+PiAgICAtIFBhdGNoIDggZG9jdW1lbnRzIHRoZSB1c2Ugb2YgInJlZCIgZm9y
IGxpZ2h0LW9uLWRhcmsgZGlzcGxheXMsDQo+PiAgICAtIFBhdGNoZXMgOSBhbmQgMTAgYWRk
IG1vcmUgZm91cmNjIGNvZGVzIGZvciBsaWdodC1vbi1kYXJrIGFuZA0KPj4gICAgICBkYXJr
LW9uLWxpZ2h0IGZyYW1lIGJ1ZmZlciBmb3JtYXRzLCB3aGljaCBtYXkgYmUgdXNlZnVsIGZv
ciBlLmcuIHRoZQ0KPj4gICAgICBzc2QxMzB4IGFuZCByZXBhcGVyIGRyaXZlcnMuDQo+IA0K
PiBBcHBsaWVkIGFsbCBwYXRjaGVzIHRvIGRybS1taXNjIChkcm0tbWlzYy1uZXh0KSwgaW5j
bHVkaW5nIHRoZSBsYXN0IHR3bw0KPiBSRkMgcGF0Y2hlcyBhcyB3ZSB0aGVuIGhhdmUgdGhl
IGZvcm1hdHMgcmVhZHkgd2hlbiBhIHVzZXIgcG9wcyB1cC4NCg0KSSBrbm93IGl0J3MgdjMg
YWxyZWFkeSwgYnV0IGdpdmUgcGVvcGxlIGF0IGxlYXN0IGEgd29ya2RheSBmb3IgcmV2aWV3
aW5nIA0KYmVmb3JlIG1lcmdpbmcgcGF0Y2hlcyBvZiB0aGlzIHNpemUgYW5kIGltcGFjdC4g
RnJpZGF5LWV2ZW5pbmcgcGF0Y2hlcyANCmFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgbWVyZ2Vk
IG9uIFNhdHVyZGF5IGFmdGVybm9vbnMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IAlTYW0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------bwmKnOaXzIJOCqFUF8X28tun--

--------------Ct62SAFYiBl9No95sn0kEftp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL5DgFAwAAAAAACgkQlh/E3EQov+Ag
/hAAmfLI4ietyVtlvjaCUPNsT3uQiSNAvA0tw2rXP3RilWRGWaNy6anrpgo5MXFj0xgDLc4kNpBi
htfyzvhVQtdZn7MuY6fXbAMbMU8J8eQx809swJTydQtJ6puziZRA/hVaiR67kerbxSRh1ecnYjcV
2Ywl6pd7KzWM2gl93pjyAq4JB7ydymb4M1wS1vVFSTGGrMe/D4qX2ZS/4cURh5gwzpwNeGDV5nU1
/sLpk8V0sCDWxRqK/nU5Tmga60ns+ebboQjoulzZQTSh4SgVBhINgJ9ZdHG+Hq7zZOTqyXyzmJdC
3tHAIOZh88OjEiP7c/Y3uXsrPSjJWCIKOV2qcTrNQtG+484alIn+3ImoXnMndg6OBZ7USdy641YB
tMU7HRZk8mEZDHvE4tT5ZJhLEqqiMfHlgeI4ISh3uvBHBGVEVlqgUOnb26jkmIrzJrB3dVguvR/4
ElNApWGtJoFuqiXehuY/37ogOQrMLJFioSU/tQ2IEa12me9bcKULIx9CJIjOn74rt6gA1Hx//4TY
AzrH1LnXj6C7v4ryR1+YcRuw/Pkliz8VxYN5oGZi96L1/LZ7I21yiIYA72YFsjrdtUNmzbmZlPGc
wJuPSfDseGyvwcK8SmJ3x5cXn6JB4NaseBu8lLYwJ6qzcMdOO9cbyQspNbzofCBRnLGuUFx4UqN+
cbw=
=Q8GO
-----END PGP SIGNATURE-----

--------------Ct62SAFYiBl9No95sn0kEftp--
