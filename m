Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378496BE2A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51410EE24;
	Fri, 17 Mar 2023 08:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC2D10EE4D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:08:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA52F21A1F;
 Fri, 17 Mar 2023 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679040490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+VZ7DGUifPoFdS7x4xWZGvBjsSRhnA4uCmbOtAELKBw=;
 b=dEIUnQ6mApp/C07e2GZQEX6F6yaoMboKlGVoXT0bGv6Tt8IvNWeKqKxqvjdfVlDeU7s/MY
 BHO96pbFROe/hIZTbehGabdps0UCbmOZYjd3sFo4WIk6TeoAmbNA3GUkpzVs/Lu8BJErFo
 uV2+EeZa/9hjQoXz7QO7N0EUKPehUK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679040490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+VZ7DGUifPoFdS7x4xWZGvBjsSRhnA4uCmbOtAELKBw=;
 b=6WDYdhdhCqtZXU4j+4J6DzgTtQ9BiYvtR33Mn3dXpNbnMwUREThkqxKTVmVgpqLATY7yvS
 mmgJ6zncFMKZXtBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E1BF1346F;
 Fri, 17 Mar 2023 08:08:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yUewHeofFGQVJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Mar 2023 08:08:10 +0000
Message-ID: <0a1a0765-8f9c-90f5-b848-2931904269a7@suse.de>
Date: Fri, 17 Mar 2023 09:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/format-helper: Use drm_format_info_min_pitch() in
 tests helper
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230316223404.102806-1-javierm@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230316223404.102806-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A9aa1GgMJw84gWsI0laIeOT5"
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A9aa1GgMJw84gWsI0laIeOT5
Content-Type: multipart/mixed; boundary="------------wyNkPOX7YXVbiCkbcZTi0zz1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>, Geert Uytterhoeven <geert@linux-m68k.org>,
 David Gow <davidgow@google.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>
Message-ID: <0a1a0765-8f9c-90f5-b848-2931904269a7@suse.de>
Subject: Re: [PATCH] drm/format-helper: Use drm_format_info_min_pitch() in
 tests helper
References: <20230316223404.102806-1-javierm@redhat.com>
In-Reply-To: <20230316223404.102806-1-javierm@redhat.com>

--------------wyNkPOX7YXVbiCkbcZTi0zz1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE2LjAzLjIzIHVtIDIzOjM0IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGVyZSdzIGEgbmljZSBtYWNybyB0byBjYWxjdWxhdGUgdGhlIGRlc3RpbmF0
aW9uIHBpdGNoIHRoYXQgYWxyZWFkeSB0YWtlcw0KPiBpbnRvIGFjY291bnQgc3ViLWJ5dGUg
cGl4ZWwgZm9ybWF0cy4gVXNlIHRoYXQgaW5zdGVhZCBvZiBvcGVuIGNvZGluZyBpdC4NCj4g
DQo+IFN1Z2dlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZp
ZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rl
c3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYyB8IDcgKystLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMNCj4gaW5k
ZXggYmZhNDdmOGZmZDA5Li40NzRiYjdhMWM0ZWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYw0KPiBAQCAtNDQwLDE1
ICs0NDAsMTIgQEAgc3RhdGljIHNpemVfdCBjb252ZXJzaW9uX2J1Zl9zaXplKHUzMiBkc3Rf
Zm9ybWF0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLA0KPiAgIAkJCQkgIGNvbnN0IHN0cnVj
dCBkcm1fcmVjdCAqY2xpcCkNCj4gICB7DQo+ICAgCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0
X2luZm8gKmRzdF9maSA9IGRybV9mb3JtYXRfaW5mbyhkc3RfZm9ybWF0KTsNCj4gLQl1bnNp
Z25lZCBpbnQgYnBwOw0KPiAgIA0KPiAgIAlpZiAoIWRzdF9maSkNCj4gICAJCXJldHVybiAt
RUlOVkFMOw0KPiAgIA0KPiAtCWlmICghZHN0X3BpdGNoKSB7DQo+IC0JCWJwcCA9IGRybV9m
b3JtYXRfaW5mb19icHAoZHN0X2ZpLCAwKTsNCj4gLQkJZHN0X3BpdGNoID0gRElWX1JPVU5E
X1VQKGRybV9yZWN0X3dpZHRoKGNsaXApICogYnBwLCA4KTsNCj4gLQl9DQo+ICsJaWYgKCFk
c3RfcGl0Y2gpDQo+ICsJCWRzdF9waXRjaCA9IGRybV9mb3JtYXRfaW5mb19taW5fcGl0Y2go
ZHN0X2ZpLCAwLCBkcm1fcmVjdF93aWR0aChjbGlwKSk7DQo+ICAgDQo+ICAgCXJldHVybiBk
c3RfcGl0Y2ggKiBkcm1fcmVjdF9oZWlnaHQoY2xpcCk7DQo+ICAgfQ0KPiANCj4gYmFzZS1j
b21taXQ6IDE2NWQ1MTMzNzMxYTJlMDQ1YWJkZDZkOWQzYzkyMjFmZGMyYTU1NmUNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------wyNkPOX7YXVbiCkbcZTi0zz1--

--------------A9aa1GgMJw84gWsI0laIeOT5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQUH+kFAwAAAAAACgkQlh/E3EQov+AL
jBAAtkIBEHnsDlmsHMUadfWBb2mXHoIimp9OywEtZvf9EPO4olGBskF7nMc8B2SKlICQfG3Xa0LD
kE2JASsa43hZ2QvcNVm2jxsuaWjechcitEwAhdzu/czAFBYzm+4Wy+2oxX9UJLkOGV/19sNdEEMd
LOk4MF/4kXVJEvb8tt0wddZ9QVwUiU029kao3GJZzg2y2UXw/zu3q4tmO3/MNp9DV53EirZlv/74
CeQVoniOeVnZLWrnqu8ZB/knNGhDhKK+PnPMLevH0jZGrRTf6q4cSw9FxV25K+ssYytgYpljgrD1
JqyrXaN0BuDCXptTAlUL7QEfQu3NqqNrHxrg3PPu49ondIm95fjPUCKCsuw1v151oI9Q2gijHZeo
QVbF6VGc90LMI7V/y7XBGTOdtWw5EyjkXzyEbY6Q4I3Qu0FEjoVH6lT7Yek9E7XbGT7lCycUzNWQ
56e6XkWsdoPx6+yv11W9i/1jAzlDk+oqjZItcZzNdAbuAsQ0U/e41zisyhH+/yQApz8y3Wa9gz/R
GahjumP5QbOlY3bt9imvPyiFGrVoZSuCLCz3CIZYcMaTeE8ikuVlQPKUta6rSHtreupWhiG348ix
MUw6y+2LUGxlmu3PI+sQ2RqcvAL8Z5UyTvAlGwkr+oaVqoEB5aK4u2rY8+WpFD1sagDfjw5NNgaF
3Uw=
=Mlfg
-----END PGP SIGNATURE-----

--------------A9aa1GgMJw84gWsI0laIeOT5--
