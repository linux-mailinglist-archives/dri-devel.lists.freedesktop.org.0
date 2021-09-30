Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46041D608
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B736EB47;
	Thu, 30 Sep 2021 09:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B516F6EB47
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:10:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3985F1FE4E;
 Thu, 30 Sep 2021 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632993030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikGJSGxtLpZDPXBXwOrYQiD9LoYmlSo77RwuSPNYq6g=;
 b=0yRnJb/o7q00u11dChbI6VcAqH3YBag+QZi0UJ67/RbywwnI9BwzhTC6YYancpyOl52T22
 xBt7oZfZQYxBYNLtFAumxd6KKwASr21BsRjCT6CjAnbuyRnZTGkWsi6mpNvuYI5n9ZD07i
 ePnXXEJaJs3eZa50C+DZQA9mt93N4A0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632993030;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikGJSGxtLpZDPXBXwOrYQiD9LoYmlSo77RwuSPNYq6g=;
 b=g+RAB1yqih9r5cpf7Bk0I9W0MNWtUHC9bGGi6Ynu6nO4JrvFCqJ4oXFQFRO0WXlcg1B7gk
 kVsH3y4Q8H8VC3CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A55A13B05;
 Thu, 30 Sep 2021 09:10:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S9vSBAZ/VWHkSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Sep 2021 09:10:30 +0000
Message-ID: <84f5f16b-91c3-2e82-b7f2-9e9c49983d3c@suse.de>
Date: Thu, 30 Sep 2021 11:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/6] drm/gud: Add some more pixel formats
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: peter@stuge.se
References: <20210929191201.34456-1-noralf@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210929191201.34456-1-noralf@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZwWiEZlSh0PiNWOffdn6AWe8"
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
--------------ZwWiEZlSh0PiNWOffdn6AWe8
Content-Type: multipart/mixed; boundary="------------kgky5O5PQ0l0D1TN7npUZQSL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: peter@stuge.se
Message-ID: <84f5f16b-91c3-2e82-b7f2-9e9c49983d3c@suse.de>
Subject: Re: [PATCH v3 0/6] drm/gud: Add some more pixel formats
References: <20210929191201.34456-1-noralf@tronnes.org>
In-Reply-To: <20210929191201.34456-1-noralf@tronnes.org>

--------------kgky5O5PQ0l0D1TN7npUZQSL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDkuMjEgdW0gMjE6MTEgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IEhpLA0KPiANCj4gSSdkIGFwcHJlY2lhdGUgaWYgc29tZW9uZSBjb3VsZCByZXZpZXcgdGhl
IDMgc21hbGwgZHJpdmVyIHBhdGNoZXMuDQoNClNlcmllcyBpcw0KDQpBY2tlZC1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IENoYW5nZXMgc2luY2UgdmVyc2lvbiAyOg0KPiAtIERyb3AgdGhl
IHBhdGNoIGFkZGluZyBtb2R1bGUgcGFyYW1ldGVyICd4cmdiODg4OCcuIEJvdGggRGFuaWVs
IGFuZA0KPiBUaG9tYXMgaGFkIHNvbWUgY29tbWVudHMgdGhhdCBldmVudHVhbGx5IGxlZCBt
ZSB0byB0byBkcm9wIHRoaXMgZm9yIG5vdy4NCj4gDQo+IE5vcmFsZi4NCj4gDQo+IA0KPiBO
b3JhbGYgVHLDuG5uZXMgKDYpOg0KPiAgICBkcm0vZm91cmNjOiBBZGQgUjggdG8gZHJtX2Zv
cm1hdF9pbmZvDQo+ICAgIGRybS9mb3JtYXQtaGVscGVyOiBBZGQgZHJtX2ZiX3hyZ2I4ODg4
X3RvX3JnYjMzMigpDQo+ICAgIGRybS9mb3JtYXQtaGVscGVyOiBBZGQgZHJtX2ZiX3hyZ2I4
ODg4X3RvX3JnYjg4OCgpDQo+ICAgIGRybS9ndWQ6IEFkZCBHVURfUElYRUxfRk9STUFUX1I4
DQo+ICAgIGRybS9ndWQ6IEFkZCBHVURfUElYRUxfRk9STUFUX1JHQjMzMg0KPiAgICBkcm0v
Z3VkOiBBZGQgR1VEX1BJWEVMX0ZPUk1BVF9SR0I4ODgNCj4gDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgfCA4OCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgICAgICAgIHwgIDEgKw0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5jICAgICAgIHwgIDYgKysNCj4gICBk
cml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9pbnRlcm5hbC5oICB8IDEyICsrKysNCj4gICBkcml2
ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgICAgICB8ICA2ICsrDQo+ICAgaW5jbHVkZS9k
cm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCAgICAgfCAgNCArKw0KPiAgIGluY2x1ZGUvZHJtL2d1
ZC5oICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCj4gICA3IGZpbGVzIGNoYW5nZWQsIDEy
MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------kgky5O5PQ0l0D1TN7npUZQSL--

--------------ZwWiEZlSh0PiNWOffdn6AWe8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFVfwUFAwAAAAAACgkQlh/E3EQov+B7
lRAAtyVJVXDiMTxNPqbiXEdgQeNgqanlEGt/sn2qv2LwOsmmI85EjYuTXYuySsklpdglZjeyA26G
G9TgZDW6gwXpXusZ6bFqLAnI14eFNZCS1Abb+yZpQ1/BciHg9YEnoEI8s7JGIBwkfoUOPCKngWT3
RTF+ZovBFhNtibqN4ORaXxtEPyeFdF6s80eR+xNOoCh9+DUz1I7+xZMGp+DuUYULBjR1R2g7A752
2GaFD+VqOtvtT2J14XLKbmzZAX6zkm5r6NCy1TchdsCdjDHk4xajnqznRGhFNRikK2SWS6NOMAPO
oGDbO1+F1BKSM7QVEjANa01XWIIDc4hB4RF5Jvm080YtfM2HvL3/6y6TshZ6r/0sdL+3Qw5MyTqp
X9Sbp9Y8R+YmVfWZpFZeeymJ+w3pHGBzFOW007g8bGja/hzaqXm2bugVb/zC+PkOruNjsDWGtr6O
IbInU2NVswP+udAME7P7bSlG1cFXblCRJoxSH82s1oC0o5DVrXAVXz0d/iaY+khxqtvkjqZVWe2e
h7T6q2iv4BZ8yXiQo1PRV2yKQtwMSOFMONXGt7hgSWLOZrK2pjpsDB70T4uIvNmvB1nuoarwDk+I
AzWbZhNm8p5keyDc/oUWO5HSKFVS7XiWmS6QXF3tbrqZUG3gEE37MxKOFMx4CcXR1M/EzSQeqHsr
ay8=
=3xl2
-----END PGP SIGNATURE-----

--------------ZwWiEZlSh0PiNWOffdn6AWe8--
