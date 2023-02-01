Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05D8686051
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 08:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA5D10E167;
	Wed,  1 Feb 2023 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B3F10E167
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 07:10:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9E4620AA6;
 Wed,  1 Feb 2023 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675235412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mRTlrwYbdrMUY0WQUrGG2U/ZgJtZwXD2hvOgZJ2LYw=;
 b=sg8W1R7WU+XzCLvW3ycvG08ZrXz9q0cBn540cwZAVyOIoLQcN59S6l1Agc+Ze9XUcrwuQ4
 gb4as8E+oDIxkJYSNBRPqP27OX7v4kfZr3MgM8O5iOVtV9YOC1yblJ/T2z0bYAcFan5k+w
 PB95DwgFdxf8p9x/Uo7yTzgp/pfftKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675235412;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mRTlrwYbdrMUY0WQUrGG2U/ZgJtZwXD2hvOgZJ2LYw=;
 b=O8diecCFvt4jMgzb3d2y6Nx2d2XaDzbBwpytsjCvYM3VwmQ9knqOiGcCySAUEIM1g5e6hy
 37JZRlhW9jZABtDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B19861348C;
 Wed,  1 Feb 2023 07:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U66IKlQQ2mNLJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 07:10:12 +0000
Message-ID: <cb9ab0de-ce2c-e062-ebac-196103fd2f1b@suse.de>
Date: Wed, 1 Feb 2023 08:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230130125554.363481-1-mairacanal@riseup.net>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230130125554.363481-1-mairacanal@riseup.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p90e5E8FtzPV9I062vFefz0U"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p90e5E8FtzPV9I062vFefz0U
Content-Type: multipart/mixed; boundary="------------ebBDmtAl0Gr0BePxBGG6rUvo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <cb9ab0de-ce2c-e062-ebac-196103fd2f1b@suse.de>
Subject: Re: [PATCH] drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
References: <20230130125554.363481-1-mairacanal@riseup.net>
In-Reply-To: <20230130125554.363481-1-mairacanal@riseup.net>

--------------ebBDmtAl0Gr0BePxBGG6rUvo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMwLjAxLjIzIHVtIDEzOjU1IHNjaHJpZWIgTWHDrXJhIENhbmFsOg0KPiBDb21t
aXQgYjhhOTI2YmVhOGIxICgia3VuaXQ6IEludHJvZHVjZSBLVU5JVF9FWFBFQ1RfTUVNRVEg
YW5kDQo+IEtVTklUX0VYUEVDVF9NRU1ORVEgbWFjcm9zIikgaW50cm9kdWNlZCBhIG5ldyBt
YWNybyB0byBjb21wYXJlIGJsb2NrcyBvZg0KPiBtZW1vcnkgYW5kLCBpZiB0aGUgdGVzdCBm
YWlscywgcHJpbnQgdGhlIHJlc3VsdCBpbiBhIGh1bWFuLWZyaWVuZGx5DQo+IGZvcm1hdC4g
VGhlcmVmb3JlLCB1c2UgS1VOSVRfRVhQRUNUX01FTUVRIHRvIGNvbXBhcmUgbWVtb3J5IGJs
b2NrcyBpbg0KPiByZXBsYWNlbWVudCBvZiB0aGUgS1VOSVRfRVhQRUNUX0VRIG1hY3JvLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWHDrXJhIENhbmFsIDxtYWlyYWNhbmFsQHJpc2V1cC5u
ZXQ+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9o
ZWxwZXJfdGVzdC5jIHwgMTAgKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMNCj4gaW5kZXggMzRlODBlYjZk
OTZlLi45NTM2ODI5YzZlM2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0
cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rl
c3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYw0KPiBAQCAtNTk3LDcgKzU5Nyw3IEBAIHN0
YXRpYyB2b2lkIGRybV90ZXN0X2ZiX3hyZ2I4ODg4X3RvX3hyZ2IxNTU1KHN0cnVjdCBrdW5p
dCAqdGVzdCkNCj4gICANCj4gICAJZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IxNTU1KCZkc3Qs
ICZyZXN1bHQtPmRzdF9waXRjaCwgJnNyYywgJmZiLCAmcGFyYW1zLT5jbGlwKTsNCj4gICAJ
YnVmID0gbGUxNmJ1Zl90b19jcHUodGVzdCwgKF9fZm9yY2UgY29uc3QgX19sZTE2ICopYnVm
LCBkc3Rfc2l6ZSAvIHNpemVvZihfX2xlMTYpKTsNCj4gLQlLVU5JVF9FWFBFQ1RfRVEodGVz
dCwgbWVtY21wKGJ1ZiwgcmVzdWx0LT5leHBlY3RlZCwgZHN0X3NpemUpLCAwKTsNCj4gKwlL
VU5JVF9FWFBFQ1RfTUVNRVEodGVzdCwgYnVmLCByZXN1bHQtPmV4cGVjdGVkLCBkc3Rfc2l6
ZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGRybV90ZXN0X2ZiX3hyZ2I4ODg4
X3RvX2FyZ2IxNTU1KHN0cnVjdCBrdW5pdCAqdGVzdCkNCj4gQEAgLTYyOCw3ICs2MjgsNyBA
QCBzdGF0aWMgdm9pZCBkcm1fdGVzdF9mYl94cmdiODg4OF90b19hcmdiMTU1NShzdHJ1Y3Qg
a3VuaXQgKnRlc3QpDQo+ICAgDQo+ICAgCWRybV9mYl94cmdiODg4OF90b19hcmdiMTU1NSgm
ZHN0LCAmcmVzdWx0LT5kc3RfcGl0Y2gsICZzcmMsICZmYiwgJnBhcmFtcy0+Y2xpcCk7DQo+
ICAgCWJ1ZiA9IGxlMTZidWZfdG9fY3B1KHRlc3QsIChfX2ZvcmNlIGNvbnN0IF9fbGUxNiAq
KWJ1ZiwgZHN0X3NpemUgLyBzaXplb2YoX19sZTE2KSk7DQo+IC0JS1VOSVRfRVhQRUNUX0VR
KHRlc3QsIG1lbWNtcChidWYsIHJlc3VsdC0+ZXhwZWN0ZWQsIGRzdF9zaXplKSwgMCk7DQo+
ICsJS1VOSVRfRVhQRUNUX01FTUVRKHRlc3QsIGJ1ZiwgcmVzdWx0LT5leHBlY3RlZCwgZHN0
X3NpemUpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBkcm1fdGVzdF9mYl94cmdi
ODg4OF90b19yZ2JhNTU1MShzdHJ1Y3Qga3VuaXQgKnRlc3QpDQo+IEBAIC02NTksNyArNjU5
LDcgQEAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9fcmdiYTU1NTEoc3Ry
dWN0IGt1bml0ICp0ZXN0KQ0KPiAgIA0KPiAgIAlkcm1fZmJfeHJnYjg4ODhfdG9fcmdiYTU1
NTEoJmRzdCwgJnJlc3VsdC0+ZHN0X3BpdGNoLCAmc3JjLCAmZmIsICZwYXJhbXMtPmNsaXAp
Ow0KPiAgIAlidWYgPSBsZTE2YnVmX3RvX2NwdSh0ZXN0LCAoX19mb3JjZSBjb25zdCBfX2xl
MTYgKilidWYsIGRzdF9zaXplIC8gc2l6ZW9mKF9fbGUxNikpOw0KPiAtCUtVTklUX0VYUEVD
VF9FUSh0ZXN0LCBtZW1jbXAoYnVmLCByZXN1bHQtPmV4cGVjdGVkLCBkc3Rfc2l6ZSksIDAp
Ow0KPiArCUtVTklUX0VYUEVDVF9NRU1FUSh0ZXN0LCBidWYsIHJlc3VsdC0+ZXhwZWN0ZWQs
IGRzdF9zaXplKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfZmJf
eHJnYjg4ODhfdG9fcmdiODg4KHN0cnVjdCBrdW5pdCAqdGVzdCkNCj4gQEAgLTcyNCw3ICs3
MjQsNyBAQCBzdGF0aWMgdm9pZCBkcm1fdGVzdF9mYl94cmdiODg4OF90b19hcmdiODg4OChz
dHJ1Y3Qga3VuaXQgKnRlc3QpDQo+ICAgDQo+ICAgCWRybV9mYl94cmdiODg4OF90b19hcmdi
ODg4OCgmZHN0LCAmcmVzdWx0LT5kc3RfcGl0Y2gsICZzcmMsICZmYiwgJnBhcmFtcy0+Y2xp
cCk7DQo+ICAgCWJ1ZiA9IGxlMzJidWZfdG9fY3B1KHRlc3QsIChfX2ZvcmNlIGNvbnN0IF9f
bGUzMiAqKWJ1ZiwgZHN0X3NpemUgLyBzaXplb2YodTMyKSk7DQo+IC0JS1VOSVRfRVhQRUNU
X0VRKHRlc3QsIG1lbWNtcChidWYsIHJlc3VsdC0+ZXhwZWN0ZWQsIGRzdF9zaXplKSwgMCk7
DQo+ICsJS1VOSVRfRVhQRUNUX01FTUVRKHRlc3QsIGJ1ZiwgcmVzdWx0LT5leHBlY3RlZCwg
ZHN0X3NpemUpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBkcm1fdGVzdF9mYl94
cmdiODg4OF90b194cmdiMjEwMTAxMChzdHJ1Y3Qga3VuaXQgKnRlc3QpDQo+IEBAIC03ODYs
NyArNzg2LDcgQEAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9fYXJnYjIx
MDEwMTAoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiAgIA0KPiAgIAlkcm1fZmJfeHJnYjg4ODhf
dG9fYXJnYjIxMDEwMTAoJmRzdCwgJnJlc3VsdC0+ZHN0X3BpdGNoLCAmc3JjLCAmZmIsICZw
YXJhbXMtPmNsaXApOw0KPiAgIAlidWYgPSBsZTMyYnVmX3RvX2NwdSh0ZXN0LCAoX19mb3Jj
ZSBjb25zdCBfX2xlMzIgKilidWYsIGRzdF9zaXplIC8gc2l6ZW9mKHUzMikpOw0KPiAtCUtV
TklUX0VYUEVDVF9FUSh0ZXN0LCBtZW1jbXAoYnVmLCByZXN1bHQtPmV4cGVjdGVkLCBkc3Rf
c2l6ZSksIDApOw0KPiArCUtVTklUX0VYUEVDVF9NRU1FUSh0ZXN0LCBidWYsIHJlc3VsdC0+
ZXhwZWN0ZWQsIGRzdF9zaXplKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBr
dW5pdF9jYXNlIGRybV9mb3JtYXRfaGVscGVyX3Rlc3RfY2FzZXNbXSA9IHsNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------ebBDmtAl0Gr0BePxBGG6rUvo--

--------------p90e5E8FtzPV9I062vFefz0U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaEFMFAwAAAAAACgkQlh/E3EQov+A+
jxAAi+gCUy6idnrCW4/hCORIWAPams8asJeJ5J4v86AHvSdFHSWheTrivBcVReiGo3YP9LaRf+vM
bCyFL8kWVb81dHC1I11cGgmEia17BiSkEahic+HESaBnypGK81vNwwI5fNYGpHwB5Tf9vy9Xki61
mWI3BmTpFxjnCnvcl/ASm4NTxUH2iY1kY9K0qUFaePDA87bSk+51h2mpXTFmofz1yYx66bzUvxu/
088zsCTGIqmCFxPOwMcahkAv8Fc7qTpabnErTUUdUp91ZtnDqald0GVkeyhmQ0x3QCjXnVybM0ti
6RkXiJcNmpVEmiiBsxBA/oPc5PLAN5XJm1ypsaCMU1bCE5RK1WrEXbTaDZ0Ozu56PVKusqGLO3GX
IpAdaUdpASPYJxsT74wCUjlBZfAn1lwkeVCEY4vCMl5Ar/gAA5jUFT/bz1MLNWOIMLla75GpLdmf
JindptVw+sqkq1EBCOx/ggBuH4tPJxt8qmELKNvrasfsQES26y2HNAhVsYlYPjDWoBtzFISdgpH5
swmQH7LKbnePjhNhzwZF2CU/CPC7bkJN8kZuKeR/sz4vtdZKgmrw+3ji2vgf8oeCGeGOlL7tanGo
JD36pzgNGsZwiTT3olMMFJt8mdRffJVizNq/W5Jf70wZPGn3fYo8023sxsGmbty8GJ287Kx8jkxT
Uis=
=V9+a
-----END PGP SIGNATURE-----

--------------p90e5E8FtzPV9I062vFefz0U--
