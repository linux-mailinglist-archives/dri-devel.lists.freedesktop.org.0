Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B66E152F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 21:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D9410EBF7;
	Thu, 13 Apr 2023 19:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1510EBF7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 19:29:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFF882193C;
 Thu, 13 Apr 2023 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681414164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0XGhTAuXt3lkg+9KaS+ZpjFXeUZHgFOqMY9q75cZyiw=;
 b=zu7JQzPqNosKg5Y/lu5YDV2v8fHYK3fWYKa6Sm14NOCEbDyetggkXUedGoVTvXNWiebP/W
 /a5UO21NHpkBAnpwms30is+ugmNqN/tF4dM4Gnf7cEASQTP7XA8PGvVz997QZa20HG74Mn
 ekbqIy7NhwkVPOkuGdmU9HmGZYdN19s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681414164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0XGhTAuXt3lkg+9KaS+ZpjFXeUZHgFOqMY9q75cZyiw=;
 b=76wZX7j50CXnvVUQQClJwK9lQxwjdfb3Pi4ICpVaVH2tF7dFr/gMlgBpOmKWSsMHYXAmtB
 MqRjTpq4aGLRsoDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FE721390E;
 Thu, 13 Apr 2023 19:29:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YtOmJRRYOGQ9SQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Apr 2023 19:29:24 +0000
Message-ID: <3f060f42-3b8e-2296-eeb9-0f774b5ae3b6@suse.de>
Date: Thu, 13 Apr 2023 21:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/2] drm/mgag200: Use 24bit format in VRAM
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230412133912.610294-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230412133912.610294-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2AqT6L0GDYFienpCGdsmsQyo"
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
--------------2AqT6L0GDYFienpCGdsmsQyo
Content-Type: multipart/mixed; boundary="------------UAantKwZvMmDPy2jGMyuBbv0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
Message-ID: <3f060f42-3b8e-2296-eeb9-0f774b5ae3b6@suse.de>
Subject: Re: [RFC PATCH 0/2] drm/mgag200: Use 24bit format in VRAM
References: <20230412133912.610294-1-jfalempe@redhat.com>
In-Reply-To: <20230412133912.610294-1-jfalempe@redhat.com>

--------------UAantKwZvMmDPy2jGMyuBbv0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDQuMjMgdW0gMTU6Mzkgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFRoZSBiYW5kd2lkdGggYmV0d2VlbiBzeXN0ZW0gbWVtb3J5IGFuZCBWUkFNIGlzIHZlcnkg
bGltaXRlZA0KPiBvbiBHMjAwLg0KPiBTbyB3aGVuIHVzaW5nIGEgMzJiaXQgZnJhbWVidWZm
ZXIgb24gc3lzdGVtIG1lbW9yeSwgY29udmVydCBpdCB0byAyNGJpdA0KPiB3aGVuIGNvcHlp
bmcgdGhlIGZyYW1lIHRvIHRoZSBWUkFNLCB0aGlzIGFsbG93cyB0byBnbyAzMyUgZmFzdGVy
Lg0KPiBDb252ZXJ0aW5nIHRoZSBmb3JtYXQgb24gdGhlIGZseSBpcyBuZWdsaWdpYmxlLCBl
dmVuIG9uIGxvdyBlbmQgQ1BVLg0KDQpJJ20gc2tlcHRpY2FsIGFib3V0IHRoaXMgaWRlYS4g
V2UgZW11bGF0ZWQgYSBudW1iZXIgb2YgZm9ybWF0cyBpbiANCnNpbXBsZWRybSBhbmQgZ290
IGEgbG90IG9mIGZsYW1lcyBhbmQgcHVzaGJhY2suIFRoZSBhcmd1bWVudCB3YXMgdGhhdCB3
ZSANCnNob3VsZCBleHBvcnQgdGhlIGZvcm1hdHMgdGhhdCBoYXJkd2FyZSBzdXBwb3J0cyBh
bmQgbm90IHByZXRlbmQgdG8gDQpzdXBwb3J0IGFueXRoaW5nIGVsc2UuIFRoZSBvbmx5IGV4
Y2VwdGlvbiBhbGxvd2VkIHdhcyBlbXVsYXRpbmcgDQpYUkdCODg4OCwgYmVjYXVzZSBpdCdz
IHRoZSBjb21tb24gZ3JvdW5kIGhhdCBldmVyeXRoaW5nIGluIHVzZXJzcGFjZSANCnN1cHBv
cnRzLg0KDQpJIHNlZSB0aGF0IHRoaXMgaXMgYSBiaXQgZGlmZmVyZW50IGZyb20geW91ciBw
YXRjaGVzLCBidXQgbm90IHNvIG11Y2guIA0KV2hlbiB1c2Vyc3BhY2Ugd2FudHMgMzItYml0
IFhSR0IsIGl0IHNob3VsZCBnZXQgaXQgaWYgcG9zc2libGUuDQoNCkknZCByYXRoZXIgc3Vn
Z2VzdCB0byBzZXQgdGhlIGNvbnNvbGUgdG8gMTYgYml0IGFuZCBhbHNvIHJlc29ydCB0aGUg
DQpmb3JtYXRzIGFycmF5LiBJdCBpcyBzdXBwb3NlZCB0byBiZSBzb3J0ZWQgYnkgcHJlZmVy
ZW5jZS4gUkdCNTY1IHNob3VsZCANCm1heWJlIGJlIHRoZSB0b3AgbW9zdCBlbnRyeSwgZm9s
bG93ZWQgYnkgUkdCODg4LiBUaGVuIHlvdSdkIGhhdmUgdG8gDQp0ZWFjaCB1c2Vyc3BhY2Ug
dG8gcmVzcGVjdCB0aGVzZSBzZXR0aW5ncy4gSSdtIG5vdCBzdXJlIGlmIGFsbCANCmNvbXBv
c2l0b3JzIGRvLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBbUEFUQ0ggMS8y
XSBkcm0vbWdhZzIwMDogc2ltcGxpZnkgb2Zmc2V0IGFuZCBzY2FsZSBjb21wdXRhdGlvbi4N
Cj4gW1BBVENIIDIvMl0gZHJtL21nYWcyMDA6IFVzZSAyNGJpdCBmb3JtYXQgaW4gVlJBTQ0K
PiANCj4gZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCA4NyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------UAantKwZvMmDPy2jGMyuBbv0--

--------------2AqT6L0GDYFienpCGdsmsQyo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ4WBQFAwAAAAAACgkQlh/E3EQov+Bu
+xAAxCECCLZDt43ceLPyL9piGQH6SlqLVV9TD/BGB5wdMb84aC8TqSgvEKYiOEmjLJwR15IwjfSw
ODi+cRc7uGnUHkixg3RSY+icyXFN6DCAzN4kHKCrcra4xxD71TXp6f+Rk1jv9cmnLMpBnmxsesNM
NSuUEVCVRafoawQEyfJdffmoNu/EZaYXIvVS4wt9inMJQKAZFNYtO/b1ED+USaMYLx0hLXNyGTRL
SoXAd+QDEQDsX2IZYgyWt+PbKueoJ0xEej2HJeittDGVEywYgFxPaD9IwiJuPj5w9mmPh6n/gRo0
7TfXUTUGw/Ilc1H95Pc6WP4EGTvAwH+IKLQA5fKP23Rcc0MN3AkFjWAbPMP4DTM1IimABFvM56El
RiPeHinBFXfIA9lNTiOdtcAeL3boP+S0KMAKTackJvNv1Hn23IwB5oPtdplD55s3TrjhQCLO3n6O
Ox22HaM707qi10wRqTZgn6JgbpsIgQKhYK7LdVc9HlMv7aj+K6pJf+14R8EiYuuw7mWS2GipQ4mt
IbZVtKzXWcLDDBBbn8q2g1ynJK5eYIVxXBYViGp8VIzs0X2/aXVduHvgELRHE9KJ8nijYP5Dp1he
mIQNA5ocgbA1VYHLGnkP7rMMmcW0AP+kdlDhFm3buFPQgaCKsqpZY32I0FjFpFJypS4WG6m9dMaJ
t2I=
=OPq4
-----END PGP SIGNATURE-----

--------------2AqT6L0GDYFienpCGdsmsQyo--
