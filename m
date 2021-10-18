Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF4543140E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 12:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF5B6E9CC;
	Mon, 18 Oct 2021 10:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9496E9CC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 10:04:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0D961FD6D;
 Mon, 18 Oct 2021 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634551478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SO6/e1pGjpZVghTITM/5NtebYb4B66r1ZebYoFwOPk=;
 b=UZR/HLa70oC/5d0kw4WaoNcfx7LOw0NfqgroUQ+FQVKKQw1gBCe7xIrIXIPS5Yzadvf2Cv
 hTyTIT+qBKXOpG/FqZFJME+r6Lt0jnfU/pV2O9P99OePKLV73kGwvK/r08iM9LUxoOOVNv
 C9nKfUf041frLn+mkXsr6r+WoDtAukk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634551478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SO6/e1pGjpZVghTITM/5NtebYb4B66r1ZebYoFwOPk=;
 b=pWoAQmsg3q9KpEFB/t1ZxH/uDeUE2tUR3oz/pHamFyplV/ftdWGryHAGdPNXHKsmifdL+b
 g6GRXbudTJROqUDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6E7313CC9;
 Mon, 18 Oct 2021 10:04:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id brKsK7VGbWGGZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Oct 2021 10:04:37 +0000
Message-ID: <c48d311b-26c9-7d0e-69f9-364f39abb209@suse.de>
Date: Mon, 18 Oct 2021 12:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/6] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Content-Language: en-US
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-4-igormtorrente@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211005201637.58563-4-igormtorrente@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zghGq0Fej4rJyWjPLcfDw5U4"
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
--------------zghGq0Fej4rJyWjPLcfDw5U4
Content-Type: multipart/mixed; boundary="------------6j0uD9DZedw4PHIHEqDv8xZc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Message-ID: <c48d311b-26c9-7d0e-69f9-364f39abb209@suse.de>
Subject: Re: [PATCH 3/6] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-4-igormtorrente@gmail.com>
In-Reply-To: <20211005201637.58563-4-igormtorrente@gmail.com>

--------------6j0uD9DZedw4PHIHEqDv8xZc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjEgdW0gMjI6MTYgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFk
ZSBUb3JyZW50ZToNCj4gVGhlIGBtYXBgIHZlY3RvciBhdCBgdmttc19jb21wb3NlcmAgdXNl
cyBhIGhhcmRjb2RlZCB2YWx1ZSB0byBkZWZpbmUgaXRzDQo+IHNpemUuDQo+IA0KPiBJZiBz
b21lZGF5IHRoZSBtYXhpbXVtIG51bWJlciBvZiBwbGFuZXMgaW5jcmVhc2VzLCB0aGlzIGhh
cmRjb2RlZCB2YWx1ZQ0KPiBjYW4gYmUgYSBwcm9ibGVtLg0KPiANCj4gVGhpcyB2YWx1ZSBp
cyBiZWluZyByZXBsYWNlZCB3aXRoIHRoZSBEUk1fRk9STUFUX01BWF9QTEFORVMgbWFjcm8u
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIE1hdGhldXMgQW5kcmFkZSBUb3JyZW50ZSA8
aWdvcm10b3JyZW50ZUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92
a21zL3ZrbXNfZHJ2LmggfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZrbXMvdmttc19kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgNCj4g
aW5kZXggZDQ4YzIzZDQwY2U1Li42NGU2Mjk5M2IwNmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19kcnYuaA0KPiBAQCAtMjgsNyArMjgsNyBAQCBzdHJ1Y3Qgdmttc193cml0ZWJh
Y2tfam9iIHsNCj4gICBzdHJ1Y3Qgdmttc19jb21wb3NlciB7DQo+ICAgCXN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgZmI7DQo+ICAgCXN0cnVjdCBkcm1fcmVjdCBzcmMsIGRzdDsNCj4gLQlz
dHJ1Y3QgZG1hX2J1Zl9tYXAgbWFwWzRdOw0KPiArCXN0cnVjdCBkbWFfYnVmX21hcCBtYXBb
RFJNX0ZPUk1BVF9NQVhfUExBTkVTXTsNCg0KSSBzdXNwZWN0IHRoYXQgSSBzaW1wbHkgbWlz
c2VkIHRoaXMgaW5zdGFuY2Ugd2hpbGUgaW50cm9kdWNpbmcgDQpEUk1fRk9STUFUX01BWF9Q
TEFORVMuIFRoYW5rcyBmb3IgZml4aW5nLg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gICAJdW5zaWduZWQgaW50IG9mZnNldDsN
Cj4gICAJdW5zaWduZWQgaW50IHBpdGNoOw0KPiAgIAl1bnNpZ25lZCBpbnQgY3BwOw0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------6j0uD9DZedw4PHIHEqDv8xZc--

--------------zghGq0Fej4rJyWjPLcfDw5U4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFtRrUFAwAAAAAACgkQlh/E3EQov+Bx
1g/7BEeB0q/QiRLZNNeknFPCAFs9R6BHV/kp1AvAppmkTuDnOrxfHwRHQzFbBSicXDjfyQm83k57
NYCHM8u6ejvubSyfLMz6vzjMQeC/06s5SyUyk+30bkZp5Vndt6RWmBysceTr76bGf8KWSJSS2ivv
9ybFtrpTtUDw6RUAekJaiKnd0SLkl9OsLlWt5uJjH4Gbu8Qu9OekQONal+werrGNRMVOzs8/rmxp
1BWb8AbcdixW2Y6WuEP4gsWFQSucC6eG1XhRGDWIugYQ9SZUBFuEtzFtaFr6HqlEw1shrZS+BPKZ
Z84btVm9tB3NQQChKDRSqHotY0jLt9kBb5wNyYEkXF94Xsd6y8giQIfSIPU60uuiElhemDHTPJBE
jqLfW5XB1xYaQx2nCg8E08qjT6ggBqO/7AiuM0QsAuFvrEUzR35vv6W7HRHCmcEgOvBvuFGqW9O4
GMeTYBplkTtI4F2QndCFa5jt/mfV5kgjtWL+Y6F/DWweFv0Q4Zl4N1F/ppCgC6bl3rWQDQ9f994k
S57wuGLWVfbX4P3UVbIuNFfleBlN9hQckXRjr2gGGhAPEp9eJObT6EQH5C6grZPeMbovNdCi1odx
gHZ12nyaS+kuNapH+93rdQ16QbRJPJlmtclC1sW6Qgr2lFVMQYZOAa8Cm4f6O1LmT7tAobfTutdc
H+4=
=VuBj
-----END PGP SIGNATURE-----

--------------zghGq0Fej4rJyWjPLcfDw5U4--
