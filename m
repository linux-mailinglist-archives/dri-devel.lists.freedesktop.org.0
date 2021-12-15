Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6314759A5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8110E232;
	Wed, 15 Dec 2021 13:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B6110E232
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:29:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 780D51F387;
 Wed, 15 Dec 2021 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639574951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ2jyR7VN20r+seaSe1QDbMXvh1OvYB4PCD+TDYUlvA=;
 b=QpLHpTaJVVFSh6aewDo5f/rH0GBqqfLMbQJxfUptpMzyy3+LKlVUOmPd2Z/whIl6DNW6rx
 f7I1LJ62ZJzLID1rRHbO0ENivgATp3hc0bZVNY7FRK3UTIkjYA9ofzNgxg7e7sZxbQBtS3
 oTRZAVRZTrpycFPwHe5Kaio2Bfm8yes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639574951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ2jyR7VN20r+seaSe1QDbMXvh1OvYB4PCD+TDYUlvA=;
 b=eWa/RbMxgh+BjSWJYP2QdUvpkhTHBQbMGPzqHelj/Ag60L1PGcoDbYtFx+E0PlpgZvv640
 SH8WKfeZD9vaXkAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EDEC1330B;
 Wed, 15 Dec 2021 13:29:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3sZSCqftuWGhTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 13:29:11 +0000
Message-ID: <4d16ff4b-4060-49df-805f-66d293ffa186@suse.de>
Date: Wed, 15 Dec 2021 14:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 0/3] drm/simpledrm: Apple M1 / DT platform support fixes
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211212062407.138309-1-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211212062407.138309-1-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YKMJGICHJYklTHrMiV9Y0wVh"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YKMJGICHJYklTHrMiV9Y0wVh
Content-Type: multipart/mixed; boundary="------------aaASzzqf6IN1TtNz411BVreu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <4d16ff4b-4060-49df-805f-66d293ffa186@suse.de>
Subject: Re: [PATCH v3 0/3] drm/simpledrm: Apple M1 / DT platform support
 fixes
References: <20211212062407.138309-1-marcan@marcan.st>
In-Reply-To: <20211212062407.138309-1-marcan@marcan.st>

--------------aaASzzqf6IN1TtNz411BVreu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTIuMjEgdW0gMDc6MjQgc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBI
aSBEUk0gZm9sa3MsDQo+IA0KPiBUaGlzIHNob3J0IHNlcmllcyBtYWtlcyBzaW1wbGVkcm0g
d29yayBvbiBBcHBsZSBNMSAoaW5jbHVkaW5nIFByby9NYXgpDQo+IHBsYXRmb3JtcyB0aGUg
d2F5IHNpbXBsZWZiIGFscmVhZHkgZG9lcywgYnkgYWRkaW5nIFhSR0IyMTAxMDEwIHN1cHBv
cnQNCj4gYW5kIG1ha2luZyBpdCBiaW5kIHRvIGZyYW1lYnVmZmVycyBpbiAvY2hvc2VuIHRo
ZSBzYW1lIHdheSBzaW1wbGVmYg0KPiBkb2VzLg0KPiANCj4gVGhpcyBhdm9pZHMgYnJlYWtp
bmcgdGhlIGJvb3Rsb2FkZXItcHJvdmlkZWQgZnJhbWVidWZmZXIgY29uc29sZSB3aGVuDQo+
IHNpbXBsZWRybSBpcyBzZWxlY3RlZCB0byByZXBsYWNlIHNpbXBsZWZiLCBhcyB0aGVzZSBG
QnMgYWx3YXlzIHNlZW0gdG8NCj4gYmUgMTAtYml0IChhdCBsZWFzdCB3aGVuIGEgcmVhbCBz
Y3JlZW4gaXMgYXR0YWNoZWQpLg0KDQpJZiB0aGVyZSBhcmUgbm8gZnVydGhlciBjb21tZW50
cywgSSdtIGdvaW5nIHRvIGFwcGx5IHRoZSBzZXJpZXMgdG8gDQpkcm0tbWlzYy1uZXh0Lg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAt
IE1hZGUgMTAtYml0IGNvbnZlcnNpb24gY29kZSBmaWxsIHRoZSBMU0JzDQo+IC0gQWRkZWQg
QVJHQjIxMDEwMTAgdG8gc3VwcG9ydGVkIGZvcm1hdHMgbGlzdA0KPiAtIFNpbXBsaWZpZWQg
T0YgY29yZSBjb2RlIHBlciByZXZpZXcgZmVlZGJhY2sNCj4gSGVjdG9yIE1hcnRpbiAoMyk6
DQo+ICAgIG9mOiBNb3ZlIHNpbXBsZS1mcmFtZWJ1ZmZlciBkZXZpY2UgaGFuZGxpbmcgZnJv
bSBzaW1wbGVmYiB0byBvZg0KPiAgICBkcm0vZm9ybWF0LWhlbHBlcjogQWRkIGRybV9mYl94
cmdiODg4OF90b194cmdiMjEwMTAxMF90b2lvKCkNCj4gICAgZHJtL3NpbXBsZWRybTogQWRk
IFtBWF1SR0IyMTAxMDEwIGZvcm1hdHMNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9m
b3JtYXRfaGVscGVyLmMgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jICAgIHwgIDQgKy0NCj4gICBkcml2
ZXJzL29mL3BsYXRmb3JtLmMgICAgICAgICAgICAgICB8ICA0ICsrDQo+ICAgZHJpdmVycy92
aWRlby9mYmRldi9zaW1wbGVmYi5jICAgICAgfCAyMSArLS0tLS0tLS0tDQo+ICAgaW5jbHVk
ZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCAgICAgfCAgMyArKw0KPiAgIDUgZmlsZXMgY2hh
bmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------aaASzzqf6IN1TtNz411BVreu--

--------------YKMJGICHJYklTHrMiV9Y0wVh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG57aYFAwAAAAAACgkQlh/E3EQov+Dk
AxAAs8xKAuo10t0j9jgIcJcbdfBgzKEDF1wtooz9GVCjTAsoqTiz0Eq83SG2bGjv1riybTKshNYq
CriNW3gLP7LTg14Q8EXtnykoDaA4CfxuyEpAapBrM+BgAH8inkd908+cXJx776c59A7hr4YWdKTo
1qtwfToXjYNnBbURPz6Ke89GO9ca288CifBn49JgGv9WOh35W2vakTV5UAtdVbKwiBh0q6qk+66P
YvEhAl/h+p22PiRXzLN5BJMWQEWqlb19VdfBNXxGpzQ0UymLhDHeGjk0/2DKqDBG9zXRkDj8OpbD
c+dxhhjKTNDngcUjpVsO7LMG/9tYuvuXGMMBWukPGLh4u+77WKLXYm5irT+ml57gUEaUqbJ7pmNN
1AnH7rean0hmkjHteAYNO8tJW3w/LBPKNgMzrm1BLNkxX2TyocvxH6qTcS7YxHeQqX7i+VMTPu6B
9hw6ZXML0P52JzzLHvX2SLvGt2O5z0iG+SNGPBIetF+dmtlhBgKbFe/dThvHZuQSVFOX5fIy3cJL
uMLTQnWz3Gm3FscZGThDNnUGucHw7WurHZFKFsDazSjD3b24Jlw8ifD5NX05/SqpK8pv91nXtxSe
zJox/IYEwNOuO45/moc7+AZIUsmGtXY+oEQJ/l+ZKBLV9LZKEeTLOEGVHSEUuCN+FSVaRnuHOLHx
WSI=
=7Djj
-----END PGP SIGNATURE-----

--------------YKMJGICHJYklTHrMiV9Y0wVh--
