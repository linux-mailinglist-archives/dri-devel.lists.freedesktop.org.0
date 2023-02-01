Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EEA686A71
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4824510E40A;
	Wed,  1 Feb 2023 15:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAE610E40A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:34:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E630A1F854;
 Wed,  1 Feb 2023 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675265647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRwqJ9KmLPfBzyU420hMDQ2t3ttVSShjizeZJ/Nl5rI=;
 b=0dE70U3GfpZswk0DSLSGxuN91uCe+1KEP5KicMaYHheWGENDAxgdwI3+p1dq5zoAkf7xwK
 Y+hNyK29Nl36p1JVY697dRjEn45C/KwJiqJfrL8dYb8OFUvYTEWvp13xyxq2PEX4gWafQ9
 n94MPiuXwsm+xBxZIsaF9PRR6ps07Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675265647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRwqJ9KmLPfBzyU420hMDQ2t3ttVSShjizeZJ/Nl5rI=;
 b=C8LcwnDm2JhuDLoiBRJEsmUu+GsEoaVIPhQCbbKkt4aDqY3zs1i497tVwD2EgNvGJgHZSA
 tCksv8OVnZVOMwDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3F8A13A10;
 Wed,  1 Feb 2023 15:34:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OzPYKm+G2mOlFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 15:34:07 +0000
Message-ID: <52024ed5-74cf-b615-e3da-c00659a9e84d@suse.de>
Date: Wed, 1 Feb 2023 16:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next] drm/client: fix kernel-doc warning in drm_client.h
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20230131012107.20943-1-rdunlap@infradead.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230131012107.20943-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qosXNTI011viQHFMjxyxwZAO"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qosXNTI011viQHFMjxyxwZAO
Content-Type: multipart/mixed; boundary="------------tDyWK9jatzkfa04oELHwffeL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Message-ID: <52024ed5-74cf-b615-e3da-c00659a9e84d@suse.de>
Subject: Re: [PATCH -next] drm/client: fix kernel-doc warning in drm_client.h
References: <20230131012107.20943-1-rdunlap@infradead.org>
In-Reply-To: <20230131012107.20943-1-rdunlap@infradead.org>

--------------tDyWK9jatzkfa04oELHwffeL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIzIHVtIDAyOjIxIHNjaHJpZWIgUmFuZHkgRHVubGFwOg0KPiBzY3Jp
cHRzL2tlcm5lbC1kb2MgY29tcGxhaW5zIGFib3V0IHRoZSBjb21tZW50IGZvciBob3RwbHVn
X2ZhaWxlZCwNCj4gc28gZml4IGl0Og0KPiANCj4gaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5o
OjExMTogd2FybmluZzogSW5jb3JyZWN0IHVzZSBvZiBrZXJuZWwtZG9jIGZvcm1hdDogICAg
ICAgICAgKiBAaG90cGx1ZyBmYWlsZWQ6DQo+IA0KPiBGaXhlczogNmE5ZDVhZDNhZjY1ICgi
ZHJtL2NsaWVudDogQWRkIGhvdHBsdWdfZmFpbGVkIGZsYWciKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gQ2M6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGdtYWlsLmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCg0KUmV2aWV3ZWQtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpJJ3ZlIGFkZGVkIHlv
dXIgcGF0Y2ggdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4NCg0KPiAtLS0NCj4gICBpbmNsdWRl
L2RybS9kcm1fY2xpZW50LmggfCAgICAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2NsaWVudC5oIGIvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oDQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9jbGllbnQuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgN
Cj4gQEAgLTEwOCw3ICsxMDgsNyBAQCBzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgew0KPiAgIAlz
dHJ1Y3QgZHJtX21vZGVfc2V0ICptb2Rlc2V0czsNCj4gICANCj4gICAJLyoqDQo+IC0JICog
QGhvdHBsdWcgZmFpbGVkOg0KPiArCSAqIEBob3RwbHVnX2ZhaWxlZDoNCj4gICAJICoNCj4g
ICAJICogU2V0IGJ5IGNsaWVudCBob3RwbHVnIGhlbHBlcnMgaWYgdGhlIGhvdHBsdWdnaW5n
IGZhaWxlZA0KPiAgIAkgKiBiZWZvcmUuIEl0IGlzIHVzdWFsbHkgbm90IHRyaWVkIGFnYWlu
Lg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------tDyWK9jatzkfa04oELHwffeL--

--------------qosXNTI011viQHFMjxyxwZAO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPahm8FAwAAAAAACgkQlh/E3EQov+AG
qBAAgxBAdSW3A5Zc1HWY64fFSvB/GUtgMS2A1wz9DtD7jOJWl1eHUx9n61WqR3QwJa692w/eJU/D
kyIDTKQrN8ctBvrqq0aEFz7LFmA8HBokgMVrTQMHZUrThsaRKyR1NZoboQioIM3UUnYdhf5NGqy1
jotE6SeqcWBPJxFtQGa4ZLMbwOv74vj6CyTIQ86CfECGHnddPDKwKCIbLqRZPL7YIkAhClMhUg2H
ITUu02TrQVr8p5VzwMyxcJm6VKsi9eM00UAn1knDaAZn1h/Hxlo9Cfy5AoWUKWBU59x9KMRWcCaW
VQr0R5UJk4Vv+SGJ3tO+COOvza6xRBL9vek2GYWTwaQcTcyuP5sMPYY25d8PtbVJF67cTLo8miA7
yYOG5GHjVOyppZjwnLzBafJADPrGkT9agYfENpG7KreGlylN7ogTGVLpIxLKRq8BjwtSd+e3DJdv
L2/Rprfd5L80uWX3oBvAr1jXc2Co5rbB25WiwECQJjmeIOrielLGYtVnRtH6NdzHyzxzrUKmNOKC
bFp36hVUQeLY+E6WdU940qDHbcCXp8HVD7LkzeQLi8D2I/MMbowMXrBauXgW5WYDhluqphFNLfoc
kdx+D90FfLLB4AlcOu7LuqKI1ozhluqVL+OGpHcV/W6itTNC6NtneGrn48frtKpzGcSYj235MQz4
020=
=eiBT
-----END PGP SIGNATURE-----

--------------qosXNTI011viQHFMjxyxwZAO--
