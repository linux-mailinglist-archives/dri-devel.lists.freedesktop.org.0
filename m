Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A85AFD2F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8210E3A8;
	Wed,  7 Sep 2022 07:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66B810E3A8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:12:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85BBE200BC;
 Wed,  7 Sep 2022 07:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662534722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2HAYhk17/+K75QvuJRvHwKkGd6LMny/6Cmr5wiK+Bz0=;
 b=rZccwBDN85RW8XyO0bmOoXZP65PvV6JjWNaHk0c1AWc2snrwirrs/cdkgp2gOR4vSj0V1j
 ZjPxEs/sc7TuI7ELU299bHf7OFTP0axl16vMIzBOPUt1uFGAe07w8StZEdjV+nrTwH51zX
 T800JDAuVNEbsJXsVEL7UkrPWa4FzFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662534722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2HAYhk17/+K75QvuJRvHwKkGd6LMny/6Cmr5wiK+Bz0=;
 b=gvMaXCszgDptJjAkO2wpK+A5d3L0ZQUBl/F0mpBRbQIi1VIDT969z6xu/iRH9/rYB8P9mh
 adR/LS6sjjmlP7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52ABC13B2B;
 Wed,  7 Sep 2022 07:12:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4vEIE0JEGGNLcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:12:02 +0000
Message-ID: <d63ab0e3-d726-8782-855b-d466f3b50907@suse.de>
Date: Wed, 7 Sep 2022 09:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/6] drm/simpledrm: Support the AB24 format
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-6-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220905163300.391692-6-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YW4bpv6by8WWVaKSP6LngkP0"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YW4bpv6by8WWVaKSP6LngkP0
Content-Type: multipart/mixed; boundary="------------tEGBBsAAWe1Um02ddPSMYoDZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d63ab0e3-d726-8782-855b-d466f3b50907@suse.de>
Subject: Re: [PATCH 5/6] drm/simpledrm: Support the AB24 format
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-6-thierry.reding@gmail.com>
In-Reply-To: <20220905163300.391692-6-thierry.reding@gmail.com>

--------------tEGBBsAAWe1Um02ddPSMYoDZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjIgdW0gMTg6MzIgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEFkZCBB
QjI0IHRvIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBmb3JtYXRzLiBUaGUgZm9ybWF0IGhlbHBl
cnMgc3VwcG9ydA0KPiBjb252ZXJzaW9uIHRvIHRoYXQgZm9ybWF0IGFuZCBpdCBpcyBkb2N1
bWVudGVkIGluIHRoZSBzaW1wbGUtZnJhbWVidWZmZXINCj4gZGV2aWNlIHRyZWUgYmluZGlu
Z3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Budmlk
aWEuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJt
LmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+IGluZGV4IDE2Mzc3YjM5ZjAxMi4uNzgyOWEx
MmJhM2RkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0u
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBAQCAtNTYz
LDYgKzU2Myw3IEBAIHN0YXRpYyBpbnQgc2ltcGxlZHJtX2RldmljZV9pbml0X21tKHN0cnVj
dCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2KQ0KPiAgIHN0YXRpYyBjb25zdCB1aW50MzJfdCBz
aW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9mb3JtYXRzW10gPSB7DQo+ICAgCURSTV9GT1JNQVRf
WFJHQjg4ODgsDQo+ICAgCURSTV9GT1JNQVRfQVJHQjg4ODgsDQo+ICsJRFJNX0ZPUk1BVF9B
QkdSODg4OCwNCj4gICAJRFJNX0ZPUk1BVF9SR0I1NjUsDQo+ICAgCS8vRFJNX0ZPUk1BVF9Y
UkdCMTU1NSwNCj4gICAJLy9EUk1fRk9STUFUX0FSR0IxNTU1LA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------tEGBBsAAWe1Um02ddPSMYoDZ--

--------------YW4bpv6by8WWVaKSP6LngkP0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYREEFAwAAAAAACgkQlh/E3EQov+Ag
ew/+NyKeM/FnATB4qvnowFnAZ8V8BUdVRzfSwJkVjGG3uSqnOrBScNtyj6EqQvyRtyhxmcCp4+S0
csKj+3RaoBaKXSQxAHZVfPZA6xxcPKNI+FQNUeng/Bj8O0Sv1PHhtL4P2YEtAchu+3WRKFuTezsm
9f0+5rinTnQvA6ILXZYji0XK9ubqxLiA3jbuGxVXFGNZhANSFXMHZgy8R0LHFfTSLZNbj35SV2jg
xqq+JiCF1EItYWqOAIUSImsQ31N85PyGCct+JTwcm7K9Ft75wJwhrICk55MjyMeypjH6mkNPiRNU
9qoD/Z7sVqb8if1q+c9fRyOlDBfnK4yX6R2CvEDJrwfHxOYSGklELx+Ng46QPEh/Imxd0diCJvaZ
ugmvbbfZwl/UMSm+mpfmgtl2dXp2tS8eBpdPDluEnHbGaAnO9X96LHf7KBf3Ww5ndIH21+nR+PCI
v53qjas04FMv4UvzpU//RY9An8JF7rCBpmdMkcGTbygIMBo2D8A8BYWX/ZgdNCtUqwY1oQRYl+mh
fwDcTTuSLs/UxNzSawycu2Em7FGrMz8sKy9JWgMLpVM/zkAGganMubvlJU0bSfpYDKgq/YJ6VCqC
wvG4Qj57D2eqZno/X68BhWmZQcwHCLjBrmh9yTPZ0cUJpDGQ7pG4kaGUnkmYVmLTyl3V62crDAyy
86c=
=bMvV
-----END PGP SIGNATURE-----

--------------YW4bpv6by8WWVaKSP6LngkP0--
