Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3006D65AF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AC010E3FF;
	Tue,  4 Apr 2023 14:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430C410E3FF;
 Tue,  4 Apr 2023 14:46:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D179722B88;
 Tue,  4 Apr 2023 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680619558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bo89iT+vqMU1/0sggrwnUeQCi8ORJPC4OWWvlSHkyvA=;
 b=rV5m6/tuO8gHWBYe0mqC45CUy1fQBu+Xye8IGV/IUGU+UvML1C5fnpQFMFfalmGzlDpfHk
 RR2G19tZnEkma5Id9y3zTa54ONWU5uFtFHUmQuMbMcG42QDxq0MpWjXoiiNxQIEOhlg6KQ
 wjmOuh0qF4l4KV4b4gPKGhaSXtxvwZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680619558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bo89iT+vqMU1/0sggrwnUeQCi8ORJPC4OWWvlSHkyvA=;
 b=BzwYQYa0WnVKZaB1lqe4qCFgSbJ4MRTtJ3EW4m2WYBd2SDXMF43R9DSnGTTKIqG0eN0VAS
 6ZVGLNq2JYVZfnBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A088813920;
 Tue,  4 Apr 2023 14:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4NFAJiY4LGRGbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Apr 2023 14:45:58 +0000
Message-ID: <019d57ab-2717-25bd-897a-5301f245263c@suse.de>
Date: Tue, 4 Apr 2023 16:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------143iQ7pHwlYbcvPLb8HaN0kZ"
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------143iQ7pHwlYbcvPLb8HaN0kZ
Content-Type: multipart/mixed; boundary="------------ITOpvoQ5IguI7bqiilDuhKg7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Message-ID: <019d57ab-2717-25bd-897a-5301f245263c@suse.de>
Subject: Re: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>

--------------ITOpvoQ5IguI7bqiilDuhKg7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkZZSSBJIGhhdmUgbWVyZ2VkIHBhdGNoZXMgMSwgNiBhbmQgNyBvZiB0aGlzIHBh
dGNoc2V0LiBUaGV5IGxvb2sgZmluZSANCmFuZCBhcmUgd29ydGh3aGlsZSBmaXhlcyBvbiB0
aGVpciBvd24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFtIDExLjAxLjIzIHVtIDE2
OjQxIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gSXQncyBqdXN0IG9wZW4gY29kZWQgYW5k
IG1hdGNoZXMuDQo+IA0KPiBOb3RlIHRoYXQgVGhvbWFzIHNhaWQgdGhhdCBoaXMgdmVyc2lv
biBhcHBhcmVudGx5IGZhaWxlZCBmb3Igc29tZQ0KPiByZWFzb24sIGJ1dCBoZXkgbWF5YmUg
d2Ugc2hvdWxkIHRyeSBhZ2Fpbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxp
ZWRAcmVkaGF0LmNvbT4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPiBDYzogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhh
dC5jb20+DQo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IENjOiBsaW51
eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfZHJ2LmMgfCAxNiArLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X2Rydi5jDQo+IGluZGV4IDQyMGZjNzVjMjQwZS4uM2FjMjRhNzgwZjUwIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9kcnYuYw0KPiBAQCAtOTAsMjcgKzkwLDEzIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBhc3RfcGNpaWRsaXN0W10gPSB7DQo+ICAgDQo+ICAg
TU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIGFzdF9wY2lpZGxpc3QpOw0KPiAgIA0KPiAtc3Rh
dGljIGludCBhc3RfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4gLXsNCj4gLQlib29sIHByaW1hcnkgPSBmYWxzZTsNCj4gLQlyZXNv
dXJjZV9zaXplX3QgYmFzZSwgc2l6ZTsNCj4gLQ0KPiAtCWJhc2UgPSBwY2lfcmVzb3VyY2Vf
c3RhcnQocGRldiwgMCk7DQo+IC0Jc2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCk7
DQo+IC0jaWZkZWYgQ09ORklHX1g4Ng0KPiAtCXByaW1hcnkgPSBwZGV2LT5yZXNvdXJjZVtQ
Q0lfUk9NX1JFU09VUkNFXS5mbGFncyAmIElPUkVTT1VSQ0VfUk9NX1NIQURPVzsNCj4gLSNl
bmRpZg0KPiAtDQo+IC0JcmV0dXJuIGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rpbmdf
ZnJhbWVidWZmZXJzKGJhc2UsIHNpemUsIHByaW1hcnksICZhc3RfZHJpdmVyKTsNCj4gLX0N
Cj4gLQ0KPiAgIHN0YXRpYyBpbnQgYXN0X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4gICB7DQo+ICAgCXN0cnVj
dCBhc3RfcHJpdmF0ZSAqYXN0Ow0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Ow0KPiAg
IAlpbnQgcmV0Ow0KPiAgIA0KPiAtCXJldCA9IGFzdF9yZW1vdmVfY29uZmxpY3RpbmdfZnJh
bWVidWZmZXJzKHBkZXYpOw0KPiArCXJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxp
Y3RpbmdfcGNpX2ZyYW1lYnVmZmVycyhwZGV2LCAmYXN0X2RyaXZlcik7DQo+ICAgCWlmIChy
ZXQpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------ITOpvoQ5IguI7bqiilDuhKg7--

--------------143iQ7pHwlYbcvPLb8HaN0kZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQsOCYFAwAAAAAACgkQlh/E3EQov+D3
zxAAsSP2Tl8qekxuMnCRlOF+oiKwlEWpulXTy2JpLVj5brSFgxJexES3CnBSEbjuBRvRC/hjKpcu
0GNSA/I39iReIZ/h07ycP+RQGBw0dAwwS4vYqjfDgHRNZs0vwnB04vrbanst3rQJSXcY2gXSWGGe
PJR0CDkawhMCEq6kM4Mlme4vBE81Qot6XkN5RT0fngxv/42OOxBP8tEF91omsoogm14LEbQVjBNs
LtKGpOP6pXzHBIk/XPApIPUqY+hdh4CrfCbuaY0TPh/p9Z8nmIgJeb0UJYXNRl9lKexfXusmYPf5
vVMgeHiOSdgeKMm9a/Gv4LjOvKajis5Xce6YXzQkvbAEuy+X31i152i/vLhhmK4s7pfaI1+XltMG
RXomK5e9xaghbNKYm/RV/vVsT0m2r+JugRG/EQEUGZ7LpwnBsnMFMCqhhWy9ICoroZtK2O74yL4X
HZLrw9O4fiB5rwjGUDqVfs+3kxi98AUOlO9vXA0V2NkuZNJy0L+kMs5450dRPXxZWVkkenFPC61x
Z8X9NPChx3KG8zdS2Yqy5rXzLRmEGiYtwpmgpjbCwcexowsa8v0yMZhRiXrOhlPibTtmXgz0JMcy
WwlGxgUyq/xfWqNmDvBL/L9lIHHt5PCn1Yuo08IGUFb28tLkwb9wo4fQWZIR1cE4BaOmFNM+bU0l
XOg=
=bDQn
-----END PGP SIGNATURE-----

--------------143iQ7pHwlYbcvPLb8HaN0kZ--
