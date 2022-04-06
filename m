Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077DF4F5831
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB2A10F289;
	Wed,  6 Apr 2022 09:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4E210F289
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:10:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2996A210DE;
 Wed,  6 Apr 2022 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649236214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zw5om9VLPHJOOBX0Qlh+9XRHLGzW7CNyc/w3e75MEVk=;
 b=mNWMW4tn7GIMgGo7k+NqbOgFD11SsmOkUTfBAS72Uu5XAxF35wJU/CyMLg1EHvKTX7Woba
 34tuV/6Nc/02oX1TLCGlb8BaFPsDfs3F+1WCDAMlk8Wd3reS4o0azFJTx36oOizLmxAyBa
 rNW7Ir/UPxcmTtIS77QDeEODyLFdavc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649236214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zw5om9VLPHJOOBX0Qlh+9XRHLGzW7CNyc/w3e75MEVk=;
 b=2RYPmRt3tnShjd+SUY4kmUfSe19LDDEohtvafCnPuhJ7woAN8dAplhubhTG0DNXiT+VFIt
 Y5g10hWKuM+dvSBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9C71139F5;
 Wed,  6 Apr 2022 09:10:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kJrrM/VYTWJifQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 09:10:13 +0000
Message-ID: <165a2746-29a7-6749-08d7-f0c7086378ee@suse.de>
Date: Wed, 6 Apr 2022 11:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/6] drm/vc4: Fixes for the writeback
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220328153659.2382206-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220328153659.2382206-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jwvdKmpAj1wh08tGJuM2Xdbd"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jwvdKmpAj1wh08tGJuM2Xdbd
Content-Type: multipart/mixed; boundary="------------w3QWWbfAtgVZIIwkGeODdwIP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <165a2746-29a7-6749-08d7-f0c7086378ee@suse.de>
Subject: Re: [PATCH 0/6] drm/vc4: Fixes for the writeback
References: <20220328153659.2382206-1-maxime@cerno.tech>
In-Reply-To: <20220328153659.2382206-1-maxime@cerno.tech>

--------------w3QWWbfAtgVZIIwkGeODdwIP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDMuMjIgdW0gMTc6MzYgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IFRoaXMgc2VyaWVzIGFkZHJlc3MgbXVsdGlwbGUgaXNzdWVzIHdpdGggdGhl
IHRyYW5zcG9zZXIgc3VwcG9ydCwgYW5kIHRodXMgdGhlDQo+IHdyaXRlYmFjayBzdXBwb3J0
Lg0KDQpXaXRoIG15IGNvbW1lbnRzIGNvbnNpZGVyZWQsIGZlZWwgZnJlZSB0byBhZGQNCg0K
QWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpJ
IGNhbm5vdCByZWFsbHkgY2hlY2sgdGhlIGNvcnJlY3RuZXNzIG9mIHRoZSBpbmRpdmlkdWFs
IEhXIG9wZXJhdGlvbnMgDQp0aG91Z2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IExldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLA0KPiBNYXhpbWUNCj4gDQo+IE1heGlt
ZSBSaXBhcmQgKDYpOg0KPiAgICBkcm0vdmM0OiBodnM6IFJlc2V0IG11eGVzIGF0IHByb2Jl
IHRpbWUNCj4gICAgZHJtL3ZjNDogdHhwOiBEb24ndCBzZXQgVFhQX1ZTVEFSVF9BVF9FT0YN
Cj4gICAgZHJtL3ZjNDogdHhwOiBGb3JjZSBhbHBoYSB0byBiZSAweGZmIGlmIGl0J3MgZGlz
YWJsZWQNCj4gICAgZHJtL3ZjNDoga21zOiBTdG9yZSBjaGFubmVsIGluIGxvY2FsIHZhcmlh
YmxlDQo+ICAgIGRybS92YzQ6IGttczogV2FybiBpZiB3ZSBoYXZlIGFuIGluY29tcGF0aWJs
ZSBtdXhpbmcgc2V0dXANCj4gICAgZHJtL3ZjNDoga21zOiBJbXByb3ZlIGxvZ2dpbmcNCj4g
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaHZzLmMgfCAyNiArKysrKysrKysrKysr
KysrKysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9rbXMuYyB8IDM4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfdHhwLmMgfCAgNCArKystDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------w3QWWbfAtgVZIIwkGeODdwIP--

--------------jwvdKmpAj1wh08tGJuM2Xdbd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNWPQFAwAAAAAACgkQlh/E3EQov+BU
IhAArm/65Uvk16tXBhKoEL0yztdLlDkCKsMrbH/GZ7wDeOPdUoXtZIk1YbRO2C1zid0BNammii23
gbCBYKM2GAeUdN9+Lrsp5PB+ioP7uk0z0MVsL+FOxCGCwRQV2JoLWN06FsPu2GxO2nzK7ByForMn
tMb8fAAuaFsuWM8p1NJof5lWQu92fF8QakioO1v/hHyyDd8P5Nev1BYV7EZ8ghKQ05wewdmFMncc
OSeX+ujVR8N8E3qXT2tyBlps0V7h83zl3T5qoj5EQHzrSj+hzkmOasV5KqGlhhiz+VyGwiR0fWge
X8uJMxpU73B6TLQx+b4PKsyxQdLzIKFRajNQPgV/pKz1NmDTaxlnh0pb0bguu2UFWoOWLEvB140F
6wo53qXNxYv47lAIWwuLCTXi0d7t4r0uV39R5Ykr7kfBGsbq6S4ft41XQGHIZtrFWtjDNV9cKx3l
1fjyOq6tXOdO2qVjErQN6CLeVBvVqBVqpV44NOblIhe5oWRC7N3MqQ7962BgUM+DXvcH4PPH4nUw
pr5hgD89X4nzcGCVHjcDIhYCV4ipNrDtiXyg9LgkKC75VWx9fJwBevCezqeEiZvF3ahOaN9QR7/W
eYLvtnfo3qgaZvDMRyT+43q7gDg498ByvlrOCNL0gEiyPeYxdCPGtp4GF96MICgNpAmyQXsap6Ua
gIY=
=a8gM
-----END PGP SIGNATURE-----

--------------jwvdKmpAj1wh08tGJuM2Xdbd--
