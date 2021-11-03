Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4084444BE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059D673786;
	Wed,  3 Nov 2021 15:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D1973786
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:40:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9FCC1FD38;
 Wed,  3 Nov 2021 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635954025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEXwPmbup3VKjNoPrPaeSNnvC0tpPQ82sWholKmVaM0=;
 b=pyobZLtVe7hf3QC+nRNwi/JdmWYxwT+fNL7DvCSN+tndDLa2VMaxhb3w7bmZf0wCC1Q0V5
 sp3xWohxiV8k5xMVU2Ot527ns5ZywjamwQmV/5NKcp+aZWzcZptanHHGu1QRe7moH4+qF2
 B9r/ePlu9d4W7J8bdyWGdJapWD6Dzm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635954025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEXwPmbup3VKjNoPrPaeSNnvC0tpPQ82sWholKmVaM0=;
 b=Vu4696Imu2DmWyCzcYCCzGqUHwE2K9JVy4Usl140/8WlH15PNFBcoXhyp6GsIM3ahebVcU
 7ik50ib4PG9iOmAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BBA513C91;
 Wed,  3 Nov 2021 15:40:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OxbQIGmtgmGUPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Nov 2021 15:40:25 +0000
Message-ID: <2d332630-eab1-1049-e308-a267456c0740@suse.de>
Date: Wed, 3 Nov 2021 16:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/8] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Content-Language: en-US
To: Igor Torrente <igormtorrente@gmail.com>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-4-igormtorrente@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211026113409.7242-4-igormtorrente@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wcQqFeZ4UJOfEy7QMIfAPevq"
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 leandro.ribeiro@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wcQqFeZ4UJOfEy7QMIfAPevq
Content-Type: multipart/mixed; boundary="------------000aMQ3crL75e27ZaYOKtCpu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Torrente <igormtorrente@gmail.com>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org
Message-ID: <2d332630-eab1-1049-e308-a267456c0740@suse.de>
Subject: Re: [PATCH v2 3/8] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-4-igormtorrente@gmail.com>
In-Reply-To: <20211026113409.7242-4-igormtorrente@gmail.com>

--------------000aMQ3crL75e27ZaYOKtCpu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMTAuMjEgdW0gMTM6MzQgc2NocmllYiBJZ29yIFRvcnJlbnRlOg0KPiBU
aGUgYG1hcGAgdmVjdG9yIGF0IGB2a21zX2NvbXBvc2VyYCB1c2VzIGEgaGFyZGNvZGVkIHZh
bHVlIHRvIGRlZmluZSBpdHMNCj4gc2l6ZS4NCj4gDQo+IElmIHNvbWVkYXkgdGhlIG1heGlt
dW0gbnVtYmVyIG9mIHBsYW5lcyBpbmNyZWFzZXMsIHRoaXMgaGFyZGNvZGVkIHZhbHVlDQo+
IGNhbiBiZSBhIHByb2JsZW0uDQo+IA0KPiBUaGlzIHZhbHVlIGlzIGJlaW5nIHJlcGxhY2Vk
IHdpdGggdGhlIERSTV9GT1JNQVRfTUFYX1BMQU5FUyBtYWNyby4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IElnb3IgVG9ycmVudGUgPGlnb3JtdG9ycmVudGVAZ21haWwuY29tPg0KDQpBY2tl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCldlIGNh
biBtZXJnZSB0aGF0IGltbWVkaWF0ZWx5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmggfCAyICstDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfZHJ2LmgNCj4gaW5kZXggZDQ4YzIzZDQwY2U1Li42NGU2Mjk5
M2IwNmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaA0KPiBAQCAtMjgsNyAr
MjgsNyBAQCBzdHJ1Y3Qgdmttc193cml0ZWJhY2tfam9iIHsNCj4gICBzdHJ1Y3Qgdmttc19j
b21wb3NlciB7DQo+ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgZmI7DQo+ICAgCXN0cnVj
dCBkcm1fcmVjdCBzcmMsIGRzdDsNCj4gLQlzdHJ1Y3QgZG1hX2J1Zl9tYXAgbWFwWzRdOw0K
PiArCXN0cnVjdCBkbWFfYnVmX21hcCBtYXBbRFJNX0ZPUk1BVF9NQVhfUExBTkVTXTsNCj4g
ICAJdW5zaWduZWQgaW50IG9mZnNldDsNCj4gICAJdW5zaWduZWQgaW50IHBpdGNoOw0KPiAg
IAl1bnNpZ25lZCBpbnQgY3BwOw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------000aMQ3crL75e27ZaYOKtCpu--

--------------wcQqFeZ4UJOfEy7QMIfAPevq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGCrWgFAwAAAAAACgkQlh/E3EQov+Ci
WhAAtGOg9KXlrGrZXrljE4ajU+5JEA1w2oI/J0pk6sSw/KUzCHhKZOdFhdPbYwpr7a5cETFTHIfq
1m65urhaCcSEhrBM2wzFQIcwwU0KEOR2DWa5k9zgSmMXx9klVmDbuq2RRn2Gv049rqmwz5D/o2Sd
DX+Di4EkJwQgB6BrZ2msBDiKu/uXtKWEdHk2S2ZZvmy23EjVoxQoGvURH9pPiGlxOMVwyis7mglT
GTiTOYUloSTEgn7bPPlzkwOjhmKa1pKyH8GmxSnTxcxHXtyep670tmOzjJ/IzWQk+oRwg6JGf+sn
NeprOtRvGknCIPVGhX4eSpbzsZbM4Q8euO7oxv7xasjm34nQi4f4QBgEFkXTlWaT3F/dlfho1NxC
WcP3P0yrKelBcSXPloFF+6iBIUYAeJB7+OEKrtXx3caoNIK3JFt6Ll5/i7xD3UC3A4Fhm2tGrN1i
wcWxyDXKrICXEoOGUe13ZYQi2nuCGyVD+P4KA4gouHgg8mt8sSG/52buX8KM3KzhCXvzH8CO3kn4
C9wOLut/SQtuflavmGPzYng37PUX038qZ82edltPWmMz7k0EE+4zqlh8vvZP1NpdGb8H40RCOz8V
xRwH4328bjJeYx7tAuC6Ft9livpdGP7SAT19HeYficFW7s9l/W88QwZqtZklQ7lAalSY6yyYKRS9
q7E=
=e1Ob
-----END PGP SIGNATURE-----

--------------wcQqFeZ4UJOfEy7QMIfAPevq--
