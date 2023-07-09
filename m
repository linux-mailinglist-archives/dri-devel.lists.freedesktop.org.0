Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6874C4B2
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 16:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7783B10E0D5;
	Sun,  9 Jul 2023 14:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F9A10E0D5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 14:31:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3B131FD6B;
 Sun,  9 Jul 2023 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688913082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tN0LHnnSjkAP2j5EB5e8Rs6iUE+RQTShXwLNOT9BX2k=;
 b=VMQMtqEekKuXOEaMmUWOAyVxU02rFiWyuZjzlU1ng+QJdhUxKNa16D7b8D+BrQSgGI7fij
 SIOt0XGy0gEZrdD4efm55+wyXAsZDowXvyGX/D0zHKheaxD4ERzQyXiRjCqrLxnjcn6UjO
 LEhbJhaujVvEqNAsitSBWCa7I4u3WT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688913082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tN0LHnnSjkAP2j5EB5e8Rs6iUE+RQTShXwLNOT9BX2k=;
 b=bW8RthYT1yR06VCNQqxJUt0YA+BfrE7iLb1j5Ni7O5dOIo5zF3g2aqIbCedNSdyunF/YnR
 OvyabsnsbDb0kMBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C50613A63;
 Sun,  9 Jul 2023 14:31:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SBUgIbrEqmTIfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 09 Jul 2023 14:31:22 +0000
Message-ID: <d9c3d059-5a4a-b4d8-247a-d3aa83dd1760@suse.de>
Date: Sun, 9 Jul 2023 16:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/hyperv: Fix a compilation issue because of not
 including screen_info.h
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michael Kelley <mikelley@microsoft.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann <arnd@arndb.de>
References: <20230709100514.703759-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230709100514.703759-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MqEY5s9snjkfxasjEzVl93KA"
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
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MqEY5s9snjkfxasjEzVl93KA
Content-Type: multipart/mixed; boundary="------------uEbgZYOhAvN0XAFfRQcdXHRr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michael Kelley <mikelley@microsoft.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Message-ID: <d9c3d059-5a4a-b4d8-247a-d3aa83dd1760@suse.de>
Subject: Re: [PATCH] drm/hyperv: Fix a compilation issue because of not
 including screen_info.h
References: <20230709100514.703759-1-suijingfeng@loongson.cn>
In-Reply-To: <20230709100514.703759-1-suijingfeng@loongson.cn>

--------------uEbgZYOhAvN0XAFfRQcdXHRr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDcuMjMgdW0gMTI6MDUgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+ICAg
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jOiBJbiBmdW5jdGlvbiAnaHZmYl9n
ZXRtZW0nOg0KPj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmM6MTAzMzoyNDog
ZXJyb3I6ICdzY3JlZW5faW5mbycgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVu
Y3Rpb24pDQo+ICAgICAgMTAzMyB8ICAgICAgICAgICAgICAgICBiYXNlID0gc2NyZWVuX2lu
Zm8ubGZiX2Jhc2U7DQo+ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn4NCj4gICAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmM6MTAzMzoy
NDogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBv
bmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4NCj4gLS0NCj4gICAgIGRyaXZl
cnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYzogSW4gZnVuY3Rpb24gJ2h5cGVy
dl9zZXR1cF92cmFtJzoNCj4+PiBkcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1f
ZHJ2LmM6NzU6NTQ6IGVycm9yOiAnc2NyZWVuX2luZm8nIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPiAgICAgICAgNzUgfCAgICAgICAgIGRybV9hcGVydHVy
ZV9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHNjcmVlbl9pbmZvLmxmYl9iYXNl
LA0KPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+DQo+ICAgICBkcml2ZXJzL2dwdS9kcm0vaHlw
ZXJ2L2h5cGVydl9kcm1fZHJ2LmM6NzU6NTQ6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVu
dGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBl
YXJzIGluDQo+IA0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFs
bC8yMDIzMDcwOTA4MjMubnhuVDhLazUtbGtwQGludGVsLmNvbS8NCj4gRml4ZXM6IDgxZDIz
OTM0ODVmMCAoImZiZGV2L2h5cGVydi1mYjogRG8gbm90IHNldCBzdHJ1Y3QgZmJfaW5mby5h
cGVydHVyZXMiKQ0KPiBGaXhlczogOGIwZDEzNTQ1YjA5ICgiZWZpOiBEbyBub3QgaW5jbHVk
ZSA8bGludXgvc2NyZWVuX2luZm8uaD4gZnJvbSBFRkkgaGVhZGVyIikNCj4gU2lnbmVkLW9m
Zi1ieTogU3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCg0KUmV2aWV3
ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpUaGFu
a3MgZm9yIHRoZSBwYXRjaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYyB8IDEgKw0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYw0KPiBpbmRleCBhN2QyYzkyZDZjNmEuLjgwMjYx
MThjNmUwMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZf
ZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9k
cnYuYw0KPiBAQCAtNyw2ICs3LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvaHlwZXJ2Lmg+
DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9w
Y2kuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zY3JlZW5faW5mby5oPg0KPiAgIA0KPiAgICNp
bmNsdWRlIDxkcm0vZHJtX2FwZXJ0dXJlLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRv
bWljX2hlbHBlci5oPg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------uEbgZYOhAvN0XAFfRQcdXHRr--

--------------MqEY5s9snjkfxasjEzVl93KA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSqxLgFAwAAAAAACgkQlh/E3EQov+Ba
3w//cAjZxj80zW1N7R2U3p3kK0UBxeKegaZvHyPNwA8DmWN6D+9gbsnLrxcTVQlfBNbmEBasrJMY
0Y/eyt8iaO0hdh33mwhxu1i1pjl+jRT5xuqpcsFD7p83IXMY8daVGweju+bo4ufRi7vtPsTMVZPW
7T5KIyR0FiAZilPsrPtOdPTHkB5sWXJTdHJTQ2ozUUG0MUvOZjZZBkDrUD15N019SO3ChtcetWrP
XIBPrTiwyE5fZbAU4G71PIFzIuiLV6SlcJ2fmNefJWkqyb9DDTzHOfzzgAksBhDdMJHW4zKB+nrr
HKzymY/KtS7CWVLH8gFm2y8peh5tr67/GH0yojLtch90sdkWr03onAr/kS8SXvzn8p47Hmnt5UnX
kVHqwSyfAH/v5zlJEYLLrnQjzfpLd6v7tqvGfq6oneZOBmCCxj8q/wJRj7QPPC4rrp+Xfe1vIU1g
gnseYrQ2HN8Diw1feQVX63vAM0Q9bRR0yLIU2jKvZSXQcWtkG5h2P8qdHQa9BHmNKAMFLfK4X1YH
kWMSk7t1tFJZwj0cDzewvQdGnEoEA+1d9SDTXeGtihcf0C+bQYgUubltavbEEA/F2rz2cPzL+G8Z
D//tqg8ifCObrvD7WzeU3s3tnwBBOyHl5D9WnGnf3ooK4fsGsyGF/D6qL1y9sf7oZe2d1kkCtSrx
JvY=
=Ee/q
-----END PGP SIGNATURE-----

--------------MqEY5s9snjkfxasjEzVl93KA--
