Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C95BFE7B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 14:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A45210E91F;
	Wed, 21 Sep 2022 12:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537C10E91F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 12:55:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01AF91F88D;
 Wed, 21 Sep 2022 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663764924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KoZGBoaFxZPTmEkKRwEqifkfWr8iC0r3ozJsZIDMqOM=;
 b=Ka07vDM8K1km2hMng59LbUvZwrw8/msv6neHJTsQnazag5oU/ZFa5DO0x7zodAvoPLbEza
 hnw7lGVsUcDLMrv5ymFu/DvOMRO/mkKHeK1WDiSmEKJwMr6MEv8VRENpXPkHCcbUTLH7Dv
 kpekC/Unl34vuGbSCVVdp1bnyv89YUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663764924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KoZGBoaFxZPTmEkKRwEqifkfWr8iC0r3ozJsZIDMqOM=;
 b=9ndm+mIdGZF7Q045YkYqcwIoESP9MgkrBJuJBK4PD+greHpjg8MtRvSyKpwAsyyBa9D4gN
 gGxa7EmP6Z6DuxDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A462913A89;
 Wed, 21 Sep 2022 12:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOMWJrsJK2O+LAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Sep 2022 12:55:23 +0000
Message-ID: <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
Date: Wed, 21 Sep 2022 14:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org,
 geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AG7Z9AOHsuDY2uOy5F4SArY8"
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AG7Z9AOHsuDY2uOy5F4SArY8
Content-Type: multipart/mixed; boundary="------------Xmfdjl4UiEJQ0soLPwFr76ao";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org,
 geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
In-Reply-To: <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>

--------------Xmfdjl4UiEJQ0soLPwFr76ao
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDguMjIgdW0gMDI6MTkgc2NocmllYiBCZW5qYW1pbiBIZXJyZW5zY2ht
aWR0Og0KPiBPbiBXZWQsIDIwMjItMDctMjAgYXQgMTY6MjcgKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gKyNpZiAhZGVmaW5lZChDT05GSUdfUFBDKQ0KPj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBvdXRfOCh2b2lkIF9faW9tZW0gKmFkZHIsIGludCB2YWwpDQo+PiAr
eyB9DQo+PiArc3RhdGljIGlubGluZSB2b2lkIG91dF9sZTMyKHZvaWQgX19pb21lbSAqYWRk
ciwgaW50IHZhbCkNCj4+ICt7IH0NCj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBp
bl9sZTMyKGNvbnN0IHZvaWQgX19pb21lbSAqYWRkcikNCj4+ICt7DQo+PiArICAgICAgIHJl
dHVybiAwOw0KPj4gK30NCj4+ICsjZW5kaWYNCj4gDQo+IFRoZXNlIGd1eXMgY291bGQganVz
dCBiZSByZXBsYWNlZCB3aXRoIHJlYWRiL3dyaXRlbC9yZWFkbCByZXNwZWN0aXZlbHkNCj4g
KGJld2FyZSBvZiB0aGUgYXJndW1lbnQgc3dhcCkuDQoNCkkgb25seSBhZGRlZCB0aGVtIGZv
ciBDT01QSUxFX1RFU1QuIFRoZXJlIGFwcGVhcnMgdG8gYmUgbm8gcG9ydGFibGUgDQppbnRl
cmZhY2UgdGhhdCBpbXBsZW1lbnRzIG91dF9sZTMyKCkgYW5kIGluX2xlMzIoKT8NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQ2hlZXJzLA0KPiBCZW4uDQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Xmfdjl4UiEJQ0soLPwFr76ao--

--------------AG7Z9AOHsuDY2uOy5F4SArY8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMrCbsFAwAAAAAACgkQlh/E3EQov+DE
9Q//ckxi55KFvAJ4UA6WPGS3cdi+g8bzAosXAU3ixBEO19e0UGZfB/W0dRjZ3sN9c9g5IH6wuboY
57s8qJe84uVFNPMNsRO51fywFN6hQOUsGK86lrAauRNn2iUMEUhAo0INU6LAANJ4bmgk2iDAHoj+
QkbFfymf844Rjqrtp7meFDhrtCtZAeBOIDCDl5WTUsuzg2kLEpy+3N397SOtvxVZNOZYYL80NBi3
dnnplHgjuFK7vB0t2d99+8Ggd44B0FCHk+wKdZEhb5uSXTYYNkmSFNtkjzLJSPVR7ThWsTFTiyf3
/1m+czrzL0iVQy+buexGvIfO8W863bYhs/HkkfXJaVYhHFq6R1xAT1TdaYiADGsq5OjUs8ytJ/+N
s1LZoGaxKqsfKM1ho14rvCCMTa7wMX72sRDKJewga5usfDyJbVpAEC5DfZLwHd2xL+sOgscoICRS
6czwZJ5zrwDzXNwmYM7CkiK5hV+ghOAxESjZnb1OMXFb6/IVAgDJ+5d7yFhD4FU+y1QIZFmTDBLb
ZIDKxJP7mlVHfQo5mePpe0BqfmucsWU0MIIoyika5waxlhkYnTweiWgA6Jkgs5Ah1pDt7HSXtjPG
cmcY4tSKCbzJDw7tsdn5fKxpFZbYXpZBZG1L/Pmplf66LSh1HXUNE8Yxh7rNbHXoEt0Folk6xiFq
Nvs=
=mw0X
-----END PGP SIGNATURE-----

--------------AG7Z9AOHsuDY2uOy5F4SArY8--
