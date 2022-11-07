Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97D61F134
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA96C10E2D5;
	Mon,  7 Nov 2022 10:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4240 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 10:53:37 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5E48999E;
 Mon,  7 Nov 2022 10:53:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6DF4E1F896;
 Mon,  7 Nov 2022 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667818416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8aKoy36HqoqsHtMgEJMVF5dQfLdTpJI5ECtpxFKcIU4=;
 b=Aj3N17wfQ1F22ugvAo2fvRixez2brrNmTAgAomDt6XWzt+vHSZ/I7mucIoqyngs4rvX7dy
 El0lPnEkjE8tIwJ/sXL2oG8xarKG+JGsdUyMCAJHBmyuL67o6bgMit8/FxwX3a1hrH+Gbj
 piiv9xP0obhDueVKIof+jBxX3FJOSMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667818416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8aKoy36HqoqsHtMgEJMVF5dQfLdTpJI5ECtpxFKcIU4=;
 b=BuuqZN4Jw1cldDr1PkgP2x0W18qIcctnt4ETc5oJEIS6ZgiczLMCI8nHckBBdubrpmPVa6
 pKxEgiBLH8tQ6qBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 339DE13494;
 Mon,  7 Nov 2022 10:53:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h9umC7DjaGOjfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 10:53:36 +0000
Message-ID: <a51ae3be-bcb2-9ae9-f7a7-31270d3b8979@suse.de>
Date: Mon, 7 Nov 2022 11:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
 <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
 <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K3RacQH1NV7Fs6nOwXZDW0yM"
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K3RacQH1NV7Fs6nOwXZDW0yM
Content-Type: multipart/mixed; boundary="------------ZE41jiI9vYeBmzZi1dSoSH4j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Message-ID: <a51ae3be-bcb2-9ae9-f7a7-31270d3b8979@suse.de>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
 <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
 <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
In-Reply-To: <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>

--------------ZE41jiI9vYeBmzZi1dSoSH4j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTEuMjIgdW0gMTE6MjYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBNb24sIDcgTm92IDIwMjIgYXQgMTA6NDMsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBIaQ0KPj4NCj4+IEFtIDA3LjExLjIyIHVt
IDEwOjMwIHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4+PiBIaSBUaG9tYXMsDQo+Pj4NCj4+
PiBPbiBGcmksIE9jdCAyOCwgMjAyMiBhdCAwOTozMTozOEFNICswMjAwLCBUaG9tYXMgWmlt
bWVybWFubiB3cm90ZToNCj4+Pj4gQW0gMjQuMTAuMjIgdW0gMTQ6NDMgc2NocmllYiBtYXhp
bWVAY2Vybm8udGVjaDoNCj4+Pj4+IEkndmUgZGlzY3Vzc2luZyB0aGUgaWRlYSBmb3IgdGhl
IHBhc3QgeWVhciB0byBhZGQgYW4gSUdUIHRlc3Qgc3VpdGUgdGhhdA0KPj4+Pj4gYWxsIHdl
bGwtYmVoYXZlZCBLTVMgZHJpdmVycyBtdXN0IHBhc3MuDQo+Pj4+Pg0KPj4+Pj4gVGhlIG1h
aW4gaWRlYSBiZWhpbmQgaXQgY29tZXMgZnJvbSB2NGwyLWNvbXBsaWFuY2UgYW5kIGNlYy1j
b21wbGlhbmNlLA0KPj4+Pj4gdGhhdCBhcmUgYmVpbmcgdXNlZCB0byB2YWxpZGF0ZSB0aGF0
IHRoZSBkcml2ZXJzIGFyZSBzYW5lLg0KPj4+Pj4NCj4+Pj4+IFdlIHNob3VsZCBwcm9iYWJs
eSBzdGFydCBidWlsZGluZyB1cCB0aGUgdGVzdCBsaXN0LCBhbmQgZXZlbnR1YWxseQ0KPj4+
Pj4gbWFuZGF0ZSB0aGF0IGFsbCB0ZXN0cyBwYXNzIGZvciBhbGwgdGhlIG5ldyBLTVMgZHJp
dmVycyB3ZSB3b3VsZCBtZXJnZQ0KPj4+Pj4gaW4gdGhlIGtlcm5lbCwgYW5kIGJlIHJ1biBi
eSBLQ2kgb3Igc2ltaWxhci4NCj4+Pj4+DQo+Pj4+PiBJIGRpZCBhIGZpcnN0IHBhc3MgdG8g
Y3JlYXRlIGEgZHJhZnQgb2Ygc3VjaCBhIHRlc3Qtc3VpdGUsIHdoaWNoIHdvdWxkDQo+Pj4+
PiBjb250YWluOg0KPj4+Pj4NCj4+Pj4+IGlndEBjb3JlX2F1dGhAYmFzaWMtYXV0aA0KPj4+
Pj4gaWd0QGNvcmVfYXV0aEBnZXRjbGllbnQtbWFzdGVyLWRyb3ANCj4+Pj4+IGlndEBjb3Jl
X2F1dGhAZ2V0Y2xpZW50LXNpbXBsZQ0KPj4+Pj4gaWd0QGNvcmVfYXV0aEBtYW55LW1hZ2lj
cw0KPj4+Pj4gaWd0QGNvcmVfZ2V0Y2xpZW50DQo+Pj4+PiBpZ3RAY29yZV9nZXRzdGF0cw0K
Pj4+Pj4gaWd0QGNvcmVfZ2V0dmVyc2lvbg0KPj4+Pj4gaWd0QGNvcmVfaG90dW5wbHVnQGhv
dHJlYmluZC1sYXRlY2xvc2UNCj4+Pj4+IGlndEBjb3JlX2hvdHVucGx1Z0Bob3R1bmJpbmQt
cmViaW5kDQo+Pj4+PiBpZ3RAY29yZV9ob3R1bnBsdWdAdW5iaW5kLXJlYmluZA0KPj4+Pj4g
aWd0QGNvcmVfc2V0bWFzdGVyDQo+Pj4+PiBpZ3RAY29yZV9zZXRtYXN0ZXJfdnNfYXV0aA0K
Pj4+Pj4gaWd0QGRldmljZV9yZXNldEB1bmJpbmQtcmVzZXQtcmViaW5kDQo+Pj4+PiBpZ3RA
ZHJtX3JlYWQNCj4+Pj4+IGlndEBkdW1iX2J1ZmZlcg0KPj4+Pj4gaWd0QGZiZGV2DQo+Pj4+
DQo+Pj4+IE1heWJlIHdlIG1ha2UgdGhpcyB0ZXN0IG9wdGlvbmFsPyBBdCBsZWFzdCBzcHJk
IGRlY2lkZWQgdG8gbm90IHN1cHBvcnQgZmJkZXYNCj4+Pj4gYXQgYWxsLg0KPj4+DQo+Pj4g
SSdtIG5vdCBzdXJlIHdlIG5lZWQgdG8gbWFrZSB0aGF0IHRlc3Qgb3B0aW9uYWwsIG9yIGF0
IGxlYXN0LCB3ZSBzaG91bGQNCj4+PiBydW4gaXQgYWxsIHRoZSB0aW1lLCBidXQgc2tpcCBp
dCBpZiB0aGVyZSdzIG5vIGZiZGV2IGVtdWxhdGlvbiwgYW5kIG5vdA0KPj4+IHJlcG9ydCBp
dCBhcyBhIGZhaWx1cmU/DQo+Pg0KPj4gU3VyZS4gSSBqdXN0IG1lYW50IHRoYXQgZmJkZXYg
c3VwcG9ydCBzaG91bGRuJ3QgYmUgYSBibG9ja2VyLiBJZiB0aGVyZSwNCj4+IGl0IHNob3Vs
ZCB3b3JrIG9mIGNvdXJzZS4NCj4gDQo+IE5vdCBzdXBwb3J0aW5nIGZiZGV2IGxvb2tzIG1v
cmUgbGlrZSBhbiBhY2NpZGVudCB0aGFuIGludGVudGlvbiBoZXJlLA0KPiBhbmQgbWF5YmUg
YSBnb29kIHJlYXNvbiB0byBoYXZlIHRoZXNlIGtpbmQgb2YgbXVzdC1wYXN0IGxpc3RzLg0K
DQpOby4gQmFjayB0aGVuLCBJIHNwZWNpZmljYWxseSBhc2tlZCB0aGUgZGV2ZWxvcGVyLCBL
ZXZpbiBUYW5nIElJUkMsIA0KYWJvdXQgZmJkZXYvY29uc29sZSBzdXBwb3J0IGFuZCBoZSBy
ZXBsaWVkIHRoYXQgaGUgaGFzIG5vIGludGVudGlvbiBvZiANCmFkZGluZyBpdC4NCg0KSXQn
cyB0aGUgb25seSBkcml2ZXIgd2l0aG91dCBmYmRldiwgYnV0IGFzIHdlIGRvbid0IGhhdmUg
c3VjaCBhIA0KcmVxdWlyZW1lbnRzIEFGQUlLLCBJIGxlZnQgaXQgYXQgdGhhdC4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiBFdmVudHVhbGx5LCBvbmNlIHRoZSBpOTE1LWlzbSBp
cyB3b3JrZWQgb3V0IG9mIGlndCB3ZWxsIGVub3VnaCBmb3IgYQ0KPiBzZXQgb2YgdGVzdHMg
YXQgbGVhc3QuIFRoZSBkcm0vY2kgZWZmb3J0IHNob3VsZCBoZWxwIGluIGJ1aWxkaW5nIHVw
DQo+IHRoYXQgbGlzdCAoYnkgZXNzZW50aWFsbHkgZXh0cmFjdGluZyB0aGUgY29tbW9uIHNl
dCBvZiB0ZXN0cyB0aGF0DQo+IGV2ZXJ5b25lIHBhc3NlcyBhbmQgZ3JhZHVhdGluZyB0aGF0
IHRvIHRoZSBtdXN0LXBhc3MgbGlzdCBmb3Iga21zDQo+IGNvbmZvcm1hbmNlIG9yIHdoYXRl
dmVyIHdlJ2xsIGNhbGwgaXQpLg0KPiAtRGFuaWVsDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJk
cw0KPj4gVGhvbWFzDQo+Pg0KPj4+DQo+Pj4gTWF4aW1lDQo+Pg0KPj4gLS0NCj4+IFRob21h
cyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4g
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------ZE41jiI9vYeBmzZi1dSoSH4j--

--------------K3RacQH1NV7Fs6nOwXZDW0yM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNo468FAwAAAAAACgkQlh/E3EQov+Cf
2RAAjIz4Wsj891a8ERT462jTdJoYpbHhl/l6PUsYc9Af4b/AbE0ooHGuPKRbwvkc0hKie29Fv7gZ
iPyyq9klcypABmxjyElM3GpGxpaymDBsIyYzr6i4acrLh30PageFrRaLIJTgyyXo5K1v6X2Jv7J5
mW8PQAw7GB+coix0g0toG2WfrUnwAgT0lx2nspSPCiJHj/Fyof/KjV6suDsN8xlWemPU09lqjJhZ
kya7UQs5tFSeb2TmMkSAs+LqVU4g+O6OUackrRpmaFr2EzgkRs7eQyEasOBsT5gEDHuNU1N3889C
4W7urNtWYpQCXNyPzrBBKG8Ypul0cErOmBXcknVUVCLhA0EUWPVNrillz6MHdosmWeXQP4iGFva8
27nlkohZfhqFuoq8BmPZV6xuiVpwm7C2bUSKbtr1S9KwMFJe41WmYYGhxQXy6PAGtCuFfL2u0w4g
9WbJ/vcnTWG64vaMe65CBKUEKr2GbA3AY3olvZ9ZwV0MU5zpmE2GBAFt8xEfxaAoxYd8wyVAaLbS
w+j8vYezbsorv9PgUi651rtchXQ0gRwM+OoCYuui4EzNuC2XrmoXB7uYU58U5WSYf9X1jnKHeRQh
RIcRs9wHseAuqaTBALc93F2nhIo/aF2kbfz/eDHmxye5CXni2tZHecPWFzqZeo5cWeYq8LOd/GXZ
Yd8=
=jbYI
-----END PGP SIGNATURE-----

--------------K3RacQH1NV7Fs6nOwXZDW0yM--
