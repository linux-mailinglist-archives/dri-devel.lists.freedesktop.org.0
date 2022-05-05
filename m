Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CB51C6CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB8510E728;
	Thu,  5 May 2022 18:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664C810E609
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 18:12:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E96A7219C7;
 Thu,  5 May 2022 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651774367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8X3W9Ytn4dWqsImj8pIPYmaMfBFyZJLTG2GtC2IpH8o=;
 b=BZSQj/PJMhCY9hBlbcjVkJbxlPmFlI9pxE7v/Kws5lnGNtK63r8qVuLqfIA4YirPUgF62F
 ialWm9hqRvqhevely1SRO9+oODoLD9UfYKuzsLhfJb5tPW9ng7oe7KZhdvg094C8IoA8P2
 evJXE9InoeZU93Ygqn8q0D4gKwr8LHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651774367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8X3W9Ytn4dWqsImj8pIPYmaMfBFyZJLTG2GtC2IpH8o=;
 b=4tvLPXVR5Nbz8nPoumeEhamD+JfVAS/wMtVqbYE++q2JDGaWFsPmA1GrfMLDq2bNlBXXTX
 3tncyK5Dl+qF1OCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C992A13B11;
 Thu,  5 May 2022 18:12:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LU9BMJ8TdGKXDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 18:12:47 +0000
Message-ID: <26a755af-623c-a3df-364a-e9e98c1e9531@suse.de>
Date: Thu, 5 May 2022 20:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] MAINTAINERS: Add simpledrm driver co-maintainer
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220505172610.338299-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220505172610.338299-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0OG3wju0NNGZbLAdgEx8s54I"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0OG3wju0NNGZbLAdgEx8s54I
Content-Type: multipart/mixed; boundary="------------DUTPjPqTdqlO2BrjEVKBrVVM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Message-ID: <26a755af-623c-a3df-364a-e9e98c1e9531@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add simpledrm driver co-maintainer
References: <20220505172610.338299-1-javierm@redhat.com>
In-Reply-To: <20220505172610.338299-1-javierm@redhat.com>

--------------DUTPjPqTdqlO2BrjEVKBrVVM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA1LjA1LjIyIHVtIDE5OjI2IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaG9tYXMgYXNrZWQgbWUgdG8gc2VydmUgYXMgY28tbWFpbnRhaW5lciBmb3Ig
dGhlIHNpbXBsZWRybSBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCg0KQWNrZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpUaGFua3MgZm9yIGFsbCB0
aGUgd29yayB5b3UncmUgZG9pbmcsIEphdmllci4NCg0KPiAtLS0NCj4gDQo+ICAgTUFJTlRB
SU5FUlMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDFhMDQ5
NTBjMWE4Zi4uYmZlNDM1NjBmOWQ1IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiAr
KysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtNjM4OSw2ICs2Mzg5LDcgQEAgRjoJaW5jbHVkZS91
YXBpL2RybS9zYXZhZ2VfZHJtLmgNCj4gICANCj4gICBEUk0gRFJJVkVSIEZPUiBTSU1QTEUg
RlJBTUVCVUZGRVJTDQo+ICAgTToJVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+ICtNOglKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCj4gICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ICAgUzoJ
TWFpbnRhaW5lZA0KPiAgIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9k
cm0vZHJtLW1pc2MNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------DUTPjPqTdqlO2BrjEVKBrVVM--

--------------0OG3wju0NNGZbLAdgEx8s54I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ0E54FAwAAAAAACgkQlh/E3EQov+DG
gw//YY9ro8N5G4++zfQ5VNG+fPgfORxj6mWf6Z8Z+ZiX9RxI9z45HEGLP3BNONPdIuqkIkZQATGm
iaAHtUP21F8v8cybgYWSAqcv/iAZN15tICguYd0h0WdJfXVeo9kdHuU7tGMwDK1xDrLbaITlicbT
Fd/t9lo+liQ2lx0HszCCxkbN8BqGQ3zW9VC7yZc9DGkdZ6fRnPB0FpK63+28QXXfEr5ZIHdYPsRB
d2BigRswOEDE5OIu455jeUD3HniJJwbowZK4MDQ/1GfyxHg+JEJFQkLuo+ZaOxXY8hzfgmmwPQGP
moPLWZl/EWU6BHRcwCSbN9THdIdmHFCefYVDcp4YLMczbCttRi1uPDHRiAfzr/lpcrvsq5ng4gUR
1Tu97fEddSY83zUhfqjx4JWxhLD1BHk1fYBznUAbMznJYxt553JFBKZ4lDw1N3hNZWPL/+eZZLy4
7zCKlK7q08DXK2aHDJmI403bvMUvbHywsi4Ce6lDpwFb5mZMeM1X+vu2L2n7o9GYDxRTMsQN3m5J
18afG2uxbDVaIIRN6BNHSDWph593zzkn8RUde8xVErJWb+uXgYhZCE5zgf0XlQ3k6fKr4pOeBcQQ
x46dVI0hw5DMjKNG82f9grevmzJDeFdGwisgYks5o5PbZNoK857Nj2IvkGTozX88R0roE8NFRxfm
a2w=
=0rre
-----END PGP SIGNATURE-----

--------------0OG3wju0NNGZbLAdgEx8s54I--
