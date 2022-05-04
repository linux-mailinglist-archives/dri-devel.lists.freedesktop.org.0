Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83C6519C77
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44D710FBE7;
	Wed,  4 May 2022 09:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6A010F627
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:58:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A47D210DC;
 Wed,  4 May 2022 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651658328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=izfN9QKn/I4IsxbMK0pyU+4Oj6CHXKfQqVbnqxqoGps=;
 b=MowCoxlSzhePbF6sw1i/4uJQHuMxLZ+XaVecjr1u0HPZB+nmZxQvYk/P9H6qtaaoFJB3dw
 +pwunJCfk5mA90czlNqKxrJ3xFoSCfo0owgOtdmygvztItpcKLrKZpf26SqgaD+YGstN0D
 IIxDldlYp0JpBYPbXE6cL3R/EivIfYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651658328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=izfN9QKn/I4IsxbMK0pyU+4Oj6CHXKfQqVbnqxqoGps=;
 b=MC0TVoOyOQlMdWq7wPF8fkgI7fnTom8GywHCFO/S4tnsrcH/MqIFQTUwMzOqVFACmD5wZ8
 W3xs0idnzBS50sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B947131BD;
 Wed,  4 May 2022 09:58:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9cKYDVhOcmLgFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 09:58:48 +0000
Message-ID: <80f302ec-1fa6-f243-9c1c-c737c8d32039@suse.de>
Date: Wed, 4 May 2022 11:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] mgag200: Add FB_DAMAGE_CLIPS support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-2-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220426164108.1051295-2-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tCCnOs88mS0rSSdaYCPVoAFk"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tCCnOs88mS0rSSdaYCPVoAFk
Content-Type: multipart/mixed; boundary="------------JFVncf0YSJE1gGH1pj1KskfU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Cc: michel@daenzer.net, lyude@redhat.com, jadahl@gmail.com
Message-ID: <80f302ec-1fa6-f243-9c1c-c737c8d32039@suse.de>
Subject: Re: [PATCH 1/4] mgag200: Add FB_DAMAGE_CLIPS support
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-2-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-2-jfalempe@redhat.com>

--------------JFVncf0YSJE1gGH1pj1KskfU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjA0LjIyIHVtIDE4OjQxIHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBU
aGUgZHJpdmVyIGRvZXMgc3VwcG9ydCBkYW1hZ2UgY2xpcHMsIGJ1dCBkb2Vzbid0IGFkdmVy
dGlzZSBpdC4NCj4gU28gd2hlbiBydW5uaW5nIGdub21lL3dheWxhbmQgb24gTWF0cm94IGhh
cmR3YXJlLCB0aGUgZnVsbCBmcmFtZSBpcw0KPiBjb3BpZWQgdG8gdGhlIHNsb3cgTWF0cm94
IG1lbW9yeSwgd2hpY2ggbGVhZHMgdG8gdmVyeSBwb29yIHBlcmZvcm1hbmNlcy4NCj4gDQo+
IEFkZCBkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygpIHRvIGFkdmVydGlzZSB0
aGlzIGNhcGFiaWxpdHkgdG8NCj4gdXNlcnNwYWNlLg0KPiANCj4gV2l0aCB0aGlzIHBhdGNo
LCBnbm9tZS93YXlsYW5kIGJlY29tZXMgdXNhYmxlIG9uIE1hdHJveCBHUFUuDQo+IA0KPiBT
dWdnZXN0ZWQtYnk6IEpvbmFzIMOFZGFobCA8amFkYWhsQGdtYWlsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KDQpSZXZp
ZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCAyICsr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4gaW5kZXggNmUxOGQzYmJkNzIwLi5j
ZmYyZTc2ZjNmYTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jDQo+IEBAIC0xMTA3LDYgKzExMDcsOCBAQCBpbnQgbWdhZzIwMF9tb2Rlc2V0X2lu
aXQoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIAl9
DQo+ICAgDQo+ICsJZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoJnBpcGUtPnBs
YW5lKTsNCj4gKw0KPiAgIAkvKiBGSVhNRTogbGVnYWN5IGdhbW1hIHRhYmxlczsgY29udmVy
dCB0byBDUlRDIHN0YXRlICovDQo+ICAgCWRybV9tb2RlX2NydGNfc2V0X2dhbW1hX3NpemUo
JnBpcGUtPmNydGMsIE1HQUcyMDBfTFVUX1NJWkUpOw0KPiAgIA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------JFVncf0YSJE1gGH1pj1KskfU--

--------------tCCnOs88mS0rSSdaYCPVoAFk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyTlcFAwAAAAAACgkQlh/E3EQov+Ac
Tg//Z/VEGYPglOscRLR2GdWYLLmqJ5O7BJ9xBAQEdzYk+jjQgHofZxNW11zSfT9QJrLSQsFUm1mm
ZMiZzeEl9sF9E5k5xESqpU/T0s4BLCcvwRo8RCE+/uMrCtDOjnoxPZjoq474Oj4l912fARHCP99P
wk26EZAR8xOsLgaiHyIUrWSQRJ0IOzUf4yAwayh8CpgjjY5N/1zY3garUCsqCeP2wXFzRGtg/Fni
2maScswu6sVlOBETc0KfFl+cL6edcyB1KNg7ktyL3vte2SFvwPb9JK/qudc7WmM0BnMZMVFm3eQI
hTOMFVrFXqhIXpwKR3f8c/qWailDdZ3Adk2C7kzvawQuQ+Wfs6LzD6fanJfLq2qWKWcN8tqx5KMF
euFzJ8x5b7dpwTFGh6Hxvw+2TyEdeFg7BRNrec0cwn3bBCuzmw49OcrqAQqQHU1WVzkk/oDvz55y
nShnGJqw9z4SXFwgKT8F2MY/iTsr9SV3et/LCWqmdDj7f9eVi8Ltu1N7ZqBZDzLAmq8ycn7GtWCG
fX2Z45A/dYJIRQBjoBa6YCAKHm66CkKxNeye9QGBW7/bMMOyX5nHXe9WqXj5dPWRf1bDN1zoH2ua
D6FRm9IuM/LwbtplvmapzhDK0bC1577JFxjr+J2yufyMtJ/wUllyHg2pi66DvZdCHPGSueZSU8YZ
73U=
=VITp
-----END PGP SIGNATURE-----

--------------tCCnOs88mS0rSSdaYCPVoAFk--
