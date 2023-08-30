Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85278D3B5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4DB10E4C9;
	Wed, 30 Aug 2023 07:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5E10E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:45:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE8DC21860;
 Wed, 30 Aug 2023 07:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693381533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rlOhTM8qn8nUusPqbqTzlvkQzSG2Kzjv6l57XcmdfKg=;
 b=coB5HRdigoPR0Afia21f7kYdnqZK3gmHvFRLfu/qcw2rZSbXzPW4+8XnkaaLP9bce8NTQ9
 KIjR/7Krk0+NSowgBt9R+vuu39Lx7n2FxJ7EYGiaBW2YIPU4FUNzUn9a7KMxYgM5BOArbt
 aGmmjFtQ3dDTeQZm4O18pKYrWYK1mzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693381533;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rlOhTM8qn8nUusPqbqTzlvkQzSG2Kzjv6l57XcmdfKg=;
 b=yrY0znueUxRmeOhd3B01YiPaoFt9bSyDS3qIDTI5pu9tXmAMwd4XR9eEVwGb5ihX0wo2fU
 FvUwqR7FviC1RhBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C00CB1353E;
 Wed, 30 Aug 2023 07:45:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S67xLZ3z7mRHYQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Aug 2023 07:45:33 +0000
Message-ID: <f661c179-893a-8d1f-5a90-59410f739811@suse.de>
Date: Wed, 30 Aug 2023 09:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230830062546.720679-1-javierm@redhat.com>
 <6a43a18a-bdef-5595-e9f4-38f2d1eac12e@suse.de>
 <CAMuHMdVpC6YajGOf7XzkFfs618-WyeMNdpmpDjGrSpG7egSW6Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVpC6YajGOf7XzkFfs618-WyeMNdpmpDjGrSpG7egSW6Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jBRvdn6zZHzZuPCu00N3oD6J"
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jBRvdn6zZHzZuPCu00N3oD6J
Content-Type: multipart/mixed; boundary="------------072dWv9l0KJyDWnoGBKf0qDX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <f661c179-893a-8d1f-5a90-59410f739811@suse.de>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
References: <20230830062546.720679-1-javierm@redhat.com>
 <6a43a18a-bdef-5595-e9f4-38f2d1eac12e@suse.de>
 <CAMuHMdVpC6YajGOf7XzkFfs618-WyeMNdpmpDjGrSpG7egSW6Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVpC6YajGOf7XzkFfs618-WyeMNdpmpDjGrSpG7egSW6Q@mail.gmail.com>

--------------072dWv9l0KJyDWnoGBKf0qDX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMzAuMDguMjMgdW0gMDk6NDAgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDk6
MDjigK9BTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6
DQo+PiBBbSAzMC4wOC4yMyB1bSAwODoyNSBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5p
bGxhczoNCj4+PiBUaGUgY29tbWl0IDQ1YjU4NjY5ZTUzMiAoImRybS9zc2QxMzB4OiBBbGxv
Y2F0ZSBidWZmZXIgaW4gdGhlIHBsYW5lJ3MNCj4+PiAuYXRvbWljX2NoZWNrKCkgY2FsbGJh
Y2siKSBtb3ZlZCB0aGUgYWxsb2NhdGlvbiBvZiB0aGUgaW50ZXJtZWRpYXRlIGFuZA0KPj4+
IEhXIGJ1ZmZlcnMgZnJvbSB0aGUgZW5jb2RlcidzIC5hdG9taWNfZW5hYmxlIGNhbGxiYWNr
IHRvIHByaW1hcnkgcGxhbmUncw0KPj4+IC5hdG9taWNfY2hlY2sgY2FsbGJhY2suDQo+Pj4N
Cj4+PiBUaGlzIHdhcyBzdWdnZXN0ZWQgYnkgTWF4aW1lIFJpcGFyZCBiZWNhdXNlIGRyaXZl
cnMgYXJlbid0IGFsbG93ZWQgdG8gZmFpbA0KPj4+IGFmdGVyIGRybV9hdG9taWNfaGVscGVy
X3N3YXBfc3RhdGUoKSBoYXMgYmVlbiBjYWxsZWQsIGFuZCB0aGUgZW5jb2RlcidzDQo+Pj4g
LmF0b21pY19lbmFibGUgaGFwcGVucyBhZnRlciB0aGUgbmV3IGF0b21pYyBzdGF0ZSBoYXMg
YmVlbiBzd2FwcGVkLg0KPj4+DQo+Pj4gQnV0IHRoYXQgY2hhbmdlIGNhdXNlZCBhIHBlcmZv
cm1hbmNlIHJlZ3Jlc3Npb24gaW4gdmVyeSBzbG93IHBsYXRmb3JtcywNCj4+PiBzaW5jZSBu
b3cgdGhlIGFsbG9jYXRpb24gaGFwcGVucyBmb3IgZXZlcnkgcGxhbmUncyBhdG9taWMgc3Rh
dGUgY29tbWl0Lg0KPj4+IEZvciBleGFtcGxlLCBHZWVydCBVeXR0ZXJob2V2ZW4gcmVwb3J0
cyB0aGF0IGlzIHRoZSBjYXNlIG9uIGEgVmV4UmlzY1YNCj4+PiBzb2Z0Y29yZSAoUklTQy1W
IENQVSBpbXBsZW1lbnRhdGlvbiBvbiBhbiBGUEdBKS4NCj4+Pg0KPj4+IFRvIHByZXZlbnQg
dGhhdCwgbW92ZSB0aGUgbW92ZSB0aGUgYnVmZmVycycgYWxsb2NhdGlvbiBhbmQgZnJlZSB0
byB0aGUNCj4+DQo+PiBEb3VibGUgJ21vdmUgdGhlJw0KPj4NCg0KPj4gQW5kIG1heWJlIGJ1
ZmZlcidzIHJhdGhlciB0aGFuIGJ1ZmZlcnMnDQoNClNjcmF0Y2ggdGhhdCByZW1hcmsuDQoN
Cj4+DQo+Pj4gQ1JUQydzIC5hdG9taWNfY2hlY2sgYW5kIC5hdG9taWNfZGVzdHJveV9zdGF0
ZSBjYWxsYmFja3MsIHNvIHRoYXQgb25seQ0KPj4+IGhhcHBlbnMgb24gYSBtb2Rlc2V0LiBT
aW5jZSB0aGUgaW50ZXJtZWRpYXRlIGJ1ZmZlciBpcyBvbmx5IG5lZWRlZCB3aGVuDQo+Pj4g
bm90IHVzaW5nIHRoZSBjb250cm9sbGVyIG5hdGl2ZSBmb3JtYXQgKFIxKSwgZG9pbmcgdGhl
IGJ1ZmZlciBhbGxvY2F0aW9uDQo+Pj4gYXQgdGhhdCBDUlRDJ3MgLmF0b21pY19jaGVjayB0
aW1lIHdvdWxkIGJlIGVub3VnaC4NCj4+Pg0KPj4+IEZpeGVzOiA0NWI1ODY2OWU1MzIgKCJk
cm0vc3NkMTMweDogQWxsb2NhdGUgYnVmZmVyIGluIHRoZSBwbGFuZSdzIC5hdG9taWNfY2hl
Y2soKSBjYWxsYmFjayIpDQo+Pj4gU3VnZ2VzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0
aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4gSmF2aWVyOiB0aGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPj4gQmVzaWRlcyB0aGUgcG9pbnRlcnMsIHRoZSBD
UlRDIHN0YXRlIGNhbiBhbHNvIHN0b3JlIHRoZSBwcmltYXJ5IHBsYW5lDQo+PiBmb3JtYXQs
IHdoaWNoIHlvdSB1cGRhdGUgZnJvbSB0aGUgcGxhbmUncyBhdG9taWMgY2hlY2suIEJ5IGRv
aW5nIHNvLCB5b3UNCj4+IHdvbnQgbmVlZCB0byByZWZlciB0byB0aGUgcGxhbmUgc3RhdGUg
ZnJvbSB0aGUgQ1JUQydzIGF0b21pY19jaGVjay4gVGhlDQo+PiBwbGFuZSdzIGF0b21pY19j
aGVjayBydW5zIGJlZm9yZSB0aGUgQ1JUQydzIGF0b21pY19jaGVjay4gWzFdDQo+IA0KPiBJ
IGhhdmVuJ3QgdGVzdGVkIEphdmllcidzIHBhdGNoIHlldCwgYnV0IGRvZXMgdGhpcyBtZWFu
IHRoYXQgaGlzIHBhdGNoDQo+IHdvbid0IGhlbHA/DQo+IA0KPiBUaGUgcHJvYmxlbSBJIHNh
dyB3YXMgdGhhdCB0aGVzZSBidWZmZXJzIHdlcmUgYWxsb2NhdGVkIGFuZCBmcmVlZA0KPiBv
dmVyIGFuZCBvdmVyIGFnYWluIG9uIGVhY2ggZmxhc2ggb2YgdGhlIGN1cnNvciBvZiB0aGUg
dGV4dCBjb25zb2xlDQo+IG9uIHRvcCBvZiB0aGUgZW11bGF0ZWQgZnJhbWUgYnVmZmVyIGRl
dmljZS4NCg0KSmF2aWVyJ3MgY3VycmVudCBwYXRjaCBzaG91bGQgcmVzb2x2ZSB0aGlzIHBy
b2JsZW0uIFRoZSB0ZW1wb3JhcnkgDQpidWZmZXJzIGFyZSBub3cgb25seSBhbGxvY2F0ZWQg
b24gZGlzcGxheS1tb2RlL2Zvcm1hdCBjaGFuZ2VzLCBidXQgbm90IA0Kb24gZWFjaCBzaW5n
bGUgc2NyZWVuIHVwZGF0ZS4gTXkgcmV2aWV3IGNvbmNlcm5zIG9ubHkgdGhlIGltcGxlbWVu
dGF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkw
NDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBB
bmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJl
cmcpDQo=

--------------072dWv9l0KJyDWnoGBKf0qDX--

--------------jBRvdn6zZHzZuPCu00N3oD6J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTu850FAwAAAAAACgkQlh/E3EQov+CI
fA/8Dtg+AITgcZARJkNVxNx5xb84A1CcKBEbu2GF994uAXHR1t90m3ZJSF0M+FoXxMpWGW3VRC0m
TpZgQnZ3GINmiTHOpaxmBp0zlj1SqJNa7HTGXsunO39mzzGe1uAnHNy6CW0NVQlLew7RrFf6IJ9Z
fOafFVDcU5qVmhQhIkFqtoLCx5cDHSSW8AhpidICv8aBmPVrcJPnZbxeUwOQPDXZSvfb3hKGsoYO
x9Hm7B52uiP6csQiPMARw94bgN4nAgN0VIVVyqj6ZtGX9mIdGe1TyggVXsmhhudQZkgAvBj6DHsI
a+weZ7nWlhx8bYdIXAQgPnNGCH4e6uNfektpUqxob1rOzWxABsch5qEdVaYZxU0Jm2v1Bob24LX5
EiALkq+Vr6sTIiZ9mcPZzr+i6se6rASGUrp/Chw7fq7brUNCxzVweK4iiXaNOcaMGKd4xCr6xG30
0WaV4qVmKGGJkawB0710zRZWKpBvBGnsoQT1kuuvk3fKXce6aF1UY6LK85JzpqNzJZqLip6RQik3
FwjdSKJGO6WxfZVDh+UXiHLb4jvIbQAI20jceouYL9GWjwvPwV4qZB6MpfV64feOOo9J3AeJ52u+
GQH3FxXigJ/V+y8RaxOnh2JrC48xFiHKheRYOBajAvRzZLOlN608QieYaXPUJXhyisC+Unq19x5h
5kg=
=TEeu
-----END PGP SIGNATURE-----

--------------jBRvdn6zZHzZuPCu00N3oD6J--
