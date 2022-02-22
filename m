Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA44C01DD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 20:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800C10E13D;
	Tue, 22 Feb 2022 19:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5DD10E13D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 19:14:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2386A21102;
 Tue, 22 Feb 2022 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645557281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HLWAdRWjbaN9Hk7S+eHCaiaj6wcD4eWlF4Oa8b8xRY0=;
 b=jT/QUvPBBw8gYMLa+BYGylVzykQ1o2ZypDkmREqq/nSihAXm/p4fO/EOe7anaDoxv2IvMF
 OT05U2DqmIuArObeNUybJWDF/+cboxqsnspdEWky7Ln/EC/+ar9K5jF3Wj3vdP0dZsxA5+
 Cl9vOnpp6El3BUAk3yq3QVVxgEtk1AY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645557281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HLWAdRWjbaN9Hk7S+eHCaiaj6wcD4eWlF4Oa8b8xRY0=;
 b=5QO12kRfcBjZ9NbETmGg0A5Xxpv6eVgq62BOsRkwxeLfdQeNJsePeJvP1TPgaOw5E8LqJ1
 jeZc+yJkcCc6RZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E937C13BD8;
 Tue, 22 Feb 2022 19:14:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3v8NNyA2FWKJCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Feb 2022 19:14:40 +0000
Message-ID: <99294308-3d33-f24c-1292-20a88980e973@suse.de>
Date: Tue, 22 Feb 2022 20:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
References: <20220221220045.11958-1-hdegoede@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220221220045.11958-1-hdegoede@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OHwD5DlUIhOpdA1nnYPzK7dq"
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OHwD5DlUIhOpdA1nnYPzK7dq
Content-Type: multipart/mixed; boundary="------------D0UmP90yEC3h99eAZ70ktEVP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <99294308-3d33-f24c-1292-20a88980e973@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
References: <20220221220045.11958-1-hdegoede@redhat.com>
In-Reply-To: <20220221220045.11958-1-hdegoede@redhat.com>

--------------D0UmP90yEC3h99eAZ70ktEVP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDIuMjIgdW0gMjM6MDAgc2NocmllYiBIYW5zIGRlIEdvZWRlOg0KPiBT
b21lIGRldmljZXMgdXNlIGUuZy4gYSBwb3J0cmFpdCBwYW5lbCBpbiBhIHN0YW5kYXJkIGxh
cHRvcCBjYXNpbmcgbWFkZQ0KPiBmb3IgbGFuZHNjYXBlIHBhbmVscy4gZWZpZmIgY2FsbHMg
ZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbl9xdWlyaygpIGFuZA0KPiBzZXRzIGZiX2luZm8u
ZmJjb25fcm90YXRlX2hpbnQgdG8gbWFrZSBmYmNvbiByb3RhdGUgdGhlIGNvbnNvbGUgc28g
dGhhdA0KPiBpdCBzaG93cyB1cC1yaWdodCBpbnN0ZWFkIG9mIG9uIGl0cyBzaWRlLg0KPiAN
Cj4gV2hlbiBzd2l0Y2hpbmcgdG8gc2ltcGxlZHJtIHRvIGZiY29uIHJlbmRlcnMgb24gaXRz
IHNpZGUuIENhbGwgdGhlDQoNCk1heWJlICcuLi4gZmJjb24gcmVuZGVycyBzaWRld2FyZHMu
Jw0KDQo+IGRybV9jb25uZWN0b3Jfc2V0X3BhbmVsX29yaWVudGF0aW9uX3dpdGhfcXVpcmso
KSBoZWxwZXIgdG8gYWRkDQo+IGEgInBhbmVsIG9yaWVudGF0aW9uIiBwcm9wZXJ0eSBvbiBk
ZXZpY2VzIGxpc3RlZCBpbiB0aGUgcXVpcmsgdGFibGUsDQo+IHRvIG1ha2UgdGhlIGZiY29u
IChhbmQgYXdhcmUgdXNlcnNwYWNlIGFwcHMpIHJvdGF0ZSB0aGUgaW1hZ2UgdG8NCj4gZGlz
cGxheSBwcm9wZXJseS4NCj4gDQo+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRl
Z29lZGVAcmVkaGF0LmNvbT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jIHwgMyArKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVk
cm0uYw0KPiBpbmRleCAwNDE0NmRhMmQxZDguLjExNTc2ZTAyOTdlNCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTc5OCw2ICs3OTgsOSBAQCBzdGF0aWMg
aW50IHNpbXBsZWRybV9kZXZpY2VfaW5pdF9tb2Rlc2V0KHN0cnVjdCBzaW1wbGVkcm1fZGV2
aWNlICpzZGV2KQ0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJnNpbXBsZWRybV9jb25uZWN0b3Jf
aGVscGVyX2Z1bmNzKTsNCj4gKwlkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmllbnRhdGlv
bl93aXRoX3F1aXJrKGNvbm5lY3RvciwNCj4gKwkJCQkJCSAgICAgICBEUk1fTU9ERV9QQU5F
TF9PUklFTlRBVElPTl9VTktOT1dOLA0KPiArCQkJCQkJICAgICAgIG1vZGUtPmhkaXNwbGF5
LCBtb2RlLT52ZGlzcGxheSk7DQo+ICAgDQo+ICAgCWZvcm1hdHMgPSBzaW1wbGVkcm1fZGV2
aWNlX2Zvcm1hdHMoc2RldiwgJm5mb3JtYXRzKTsNCj4gICANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------D0UmP90yEC3h99eAZ70ktEVP--

--------------OHwD5DlUIhOpdA1nnYPzK7dq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIVNiAFAwAAAAAACgkQlh/E3EQov+Be
rA//V+j7umthH+T8htjkNFdZaA4BKzOer9yvffWTGvob/Z0h9bNQOkUISxVyW0Iy+C6r9uP9vrB2
6r3qCP9s9DaPWbwp1/m0eWNMduAEVetzBgJnHAyproXiPq/o7c4HwmjWB8TgIFqgEwI3C4k1rgAz
XMTt9yFKDdmJyUGPMXHPLcXbZOIf/bCjo/rd40jUBrTBAPWl9z0iy8NonIfevDSkmYFN3F/GrPYz
NBveBku18O82IxjLZLFZMa3C7J/xFLPPAI+PYtglzcYnD+/sdt6P8GA6kWtlreRXh49jmokA7fOH
plZWgOr4nb6j6HGva51/rEyqHtC50ggjBjh+V0dk/z+gn+bfQBCvjIImnypNh8P9jJJReA0uCmr3
IbmZ4EhbKs/ZfALj65Byk+c3/7moXR+5jZTUE7+UUAigz1fSNuxirY3kwN1iC5T0RdhIJzhn8TA5
QTy5fdFTyKdD9Bm/wAlJwz4Vvp+etf/Rkio2pYAN8iSE8O1ysRT89k6Ecbid9zgi/JO4RJAiVSlq
6FpbRNHnZ/zLAyoSJl18vFg5QH/r6pO46TnGpq13XWYTU0pjc1JKKE90gK0OwkIVtlOstdyxA1s7
4lWtwRvagrST0ZgSdBmvlF8EkkaW67joo8TBjyVqjq79IitP5KW3+ZEfvYVjAx0oYf32jo30yOBF
FIk=
=cDFW
-----END PGP SIGNATURE-----

--------------OHwD5DlUIhOpdA1nnYPzK7dq--
