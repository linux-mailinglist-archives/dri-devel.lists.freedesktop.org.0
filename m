Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5426827CB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 09:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD2210E31E;
	Tue, 31 Jan 2023 08:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BA310E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:57:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B03F82046E;
 Tue, 31 Jan 2023 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675155440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9lYs5UJZfSHr2t4Wtw9DA3HI1a+TliioCEJTazPDmBI=;
 b=bA+0TxU5KVGKEiKpY/6B3Q8kqEO5kn64Imfo7/b/JH+XDI+DUVae1YYDb3OAE4JzHs5bRt
 qZ/ONa+yJUHZawPITmFNLR1Q+aGz0wIuB47xUEDJRIEmDd8rCGZWMs82NIusNslVIlRZ3h
 0Lne6cVg6PexXZXMtXvZkmwx/2AgYAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675155440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9lYs5UJZfSHr2t4Wtw9DA3HI1a+TliioCEJTazPDmBI=;
 b=YCZxt1WNOOdG3I3E6EsObVdiRobRZgNHqi4me0W782HBmM9MAnhYEfb8OvgRJfhPeg5hgu
 DJl1UzE1sx0KHjAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 722B513585;
 Tue, 31 Jan 2023 08:57:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H7ruGvDX2GNlJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 Jan 2023 08:57:20 +0000
Message-ID: <ee4af5cb-6f2b-fde4-b81c-ef088d3272a8@suse.de>
Date: Tue, 31 Jan 2023 09:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/2] drm/simpledrm: Allow physical width and height
 configuration via panel node
Content-Language: en-US
To: Rayyan Ansari <rayyan@ansari.sh>, dri-devel@lists.freedesktop.org
References: <20230126182435.70544-1-rayyan@ansari.sh>
 <20230126182435.70544-2-rayyan@ansari.sh>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230126182435.70544-2-rayyan@ansari.sh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VRDBOmJ1uHgwfQWzhxmFFfyZ"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VRDBOmJ1uHgwfQWzhxmFFfyZ
Content-Type: multipart/mixed; boundary="------------BhqH5e0Wj40xoBWNu7IsO9dU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rayyan Ansari <rayyan@ansari.sh>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 janne@jannau.net, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Message-ID: <ee4af5cb-6f2b-fde4-b81c-ef088d3272a8@suse.de>
Subject: Re: [PATCH v4 1/2] drm/simpledrm: Allow physical width and height
 configuration via panel node
References: <20230126182435.70544-1-rayyan@ansari.sh>
 <20230126182435.70544-2-rayyan@ansari.sh>
In-Reply-To: <20230126182435.70544-2-rayyan@ansari.sh>

--------------BhqH5e0Wj40xoBWNu7IsO9dU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjAxLjIzIHVtIDE5OjI0IHNjaHJpZWIgUmF5eWFuIEFuc2FyaToNCj4gUGFy
c2UgdGhlIHdpZHRoLW1tIGFuZCBoZWlnaHQtbW0gZGV2aWNldHJlZSBwcm9wZXJ0aWVzIG9m
IHRoZSBwYW5lbCBub2RlLA0KPiBhbmQgdXNlIHRoaXMgdG8gc2V0IHRoZSBEUk0gRGlzcGxh
eSBNb2RlIGluc3RlYWQgb2YgY2FsY3VsYXRpbmcgaXQNCj4gYmFzZWQgb24gYSBoYXJkY29k
ZWQgRFBJLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmF5eWFuIEFuc2FyaSA8cmF5eWFuQGFu
c2FyaS5zaD4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS90aW55L3NpbXBsZWRybS5jDQo+IGluZGV4IDE2MmViNDRkY2JhOC4uZjhiMTg0NDFj
ZmNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBAQCAtNTk5LDE2
ICs1OTksMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3Mg
c2ltcGxlZHJtX21vZGVfY29uZmlnX2Z1bmNzID0gew0KPiAgICAqLw0KPiAgIA0KPiAgIHN0
YXRpYyBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzaW1wbGVkcm1fbW9kZSh1bnNpZ25lZCBp
bnQgd2lkdGgsDQo+IC0JCQkJCSAgICAgIHVuc2lnbmVkIGludCBoZWlnaHQpDQo+ICsJCQkJ
CSAgICAgIHVuc2lnbmVkIGludCBoZWlnaHQsDQo+ICsJCQkJCSAgICAgIHVuc2lnbmVkIGlu
dCB3aWR0aF9tbSwNCj4gKwkJCQkJICAgICAgdW5zaWduZWQgaW50IGhlaWdodF9tbSkNCj4g
ICB7DQo+IC0JLyoNCj4gLQkgKiBBc3N1bWUgYSBtb25pdG9yIHJlc29sdXRpb24gb2YgOTYg
ZHBpIHRvDQo+IC0JICogZ2V0IGEgc29tZXdoYXQgcmVhc29uYWJsZSBzY3JlZW4gc2l6ZS4N
Cj4gLQkgKi8NCj4gICAJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbW9kZSA9IHsN
Cj4gLQkJRFJNX01PREVfSU5JVCg2MCwgd2lkdGgsIGhlaWdodCwNCj4gLQkJCSAgICAgIERS
TV9NT0RFX1JFU19NTSh3aWR0aCwgOTZ1bCksDQo+IC0JCQkgICAgICBEUk1fTU9ERV9SRVNf
TU0oaGVpZ2h0LCA5NnVsKSkNCj4gKwkJRFJNX01PREVfSU5JVCg2MCwgd2lkdGgsIGhlaWdo
dCwgd2lkdGhfbW0sIGhlaWdodF9tbSkNCj4gICAJfTsNCj4gICANCj4gICAJcmV0dXJuIG1v
ZGU7DQo+IEBAIC02MjIsNiArNjE4LDggQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2
aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0K
PiAgIAlzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2RldjsNCj4gICAJc3RydWN0IGRybV9k
ZXZpY2UgKmRldjsNCj4gICAJaW50IHdpZHRoLCBoZWlnaHQsIHN0cmlkZTsNCj4gKwlpbnQg
d2lkdGhfbW0gPSAwLCBoZWlnaHRfbW0gPSAwOw0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAq
cGFuZWxfbm9kZTsNCj4gICAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0
Ow0KPiAgIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlcywgKm1lbTsNCj4gICAJdm9pZCBfX2lvbWVt
ICpzY3JlZW5fYmFzZTsNCj4gQEAgLTY3Niw2ICs2NzQsMTMgQEAgc3RhdGljIHN0cnVjdCBz
aW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2Ry
aXZlciAqZHJ2LA0KPiAgIAkJZm9ybWF0ID0gc2ltcGxlZmJfZ2V0X2Zvcm1hdF9vZihkZXYs
IG9mX25vZGUpOw0KPiAgIAkJaWYgKElTX0VSUihmb3JtYXQpKQ0KPiAgIAkJCXJldHVybiBF
UlJfQ0FTVChmb3JtYXQpOw0KPiArDQo+ICsJCXBhbmVsX25vZGUgPSBvZl9wYXJzZV9waGFu
ZGxlKG9mX25vZGUsICJwYW5lbCIsIDApOw0KPiArCQlpZiAocGFuZWxfbm9kZSkgew0KPiAr
CQkJc2ltcGxlZmJfcmVhZF91MzJfb2YoZGV2LCBwYW5lbF9ub2RlLCAid2lkdGgtbW0iLCAm
d2lkdGhfbW0pOw0KPiArCQkJc2ltcGxlZmJfcmVhZF91MzJfb2YoZGV2LCBwYW5lbF9ub2Rl
LCAiaGVpZ2h0LW1tIiwgJmhlaWdodF9tbSk7DQo+ICsJCQlvZl9ub2RlX3B1dChwYW5lbF9u
b2RlKTsNCj4gKwkJfQ0KPiAgIAl9IGVsc2Ugew0KPiAgIAkJZHJtX2VycihkZXYsICJubyBz
aW1wbGVmYiBjb25maWd1cmF0aW9uIGZvdW5kXG4iKTsNCj4gICAJCXJldHVybiBFUlJfUFRS
KC1FTk9ERVYpOw0KPiBAQCAtNjg2LDcgKzY5MSwxNiBAQCBzdGF0aWMgc3RydWN0IHNpbXBs
ZWRybV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVy
ICpkcnYsDQo+ICAgCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICAgCX0NCj4gICAN
Cj4gLQlzZGV2LT5tb2RlID0gc2ltcGxlZHJtX21vZGUod2lkdGgsIGhlaWdodCk7DQo+ICsJ
LyoNCj4gKwkgKiBBc3N1bWUgYSBtb25pdG9yIHJlc29sdXRpb24gb2YgOTYgZHBpIGlmIHBo
eXNpY2FsIGRpbWVuc2lvbnMNCj4gKwkgKiBhcmUgbm90IHNwZWNpZmllZCB0byBnZXQgYSBz
b21ld2hhdCByZWFzb25hYmxlIHNjcmVlbiBzaXplLg0KPiArCSAqLw0KPiArCWlmICghd2lk
dGhfbW0pDQo+ICsJCXdpZHRoX21tID0gRFJNX01PREVfUkVTX01NKHdpZHRoLCA5NnVsKTsN
Cj4gKwlpZiAoIWhlaWdodF9tbSkNCj4gKwkJaGVpZ2h0X21tID0gRFJNX01PREVfUkVTX01N
KGhlaWdodCwgOTZ1bCk7DQo+ICsNCj4gKwlzZGV2LT5tb2RlID0gc2ltcGxlZHJtX21vZGUo
d2lkdGgsIGhlaWdodCwgd2lkdGhfbW0sIGhlaWdodF9tbSk7DQo+ICAgCXNkZXYtPmZvcm1h
dCA9IGZvcm1hdDsNCj4gICAJc2Rldi0+cGl0Y2ggPSBzdHJpZGU7DQo+ICAgDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------BhqH5e0Wj40xoBWNu7IsO9dU--

--------------VRDBOmJ1uHgwfQWzhxmFFfyZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPY1+8FAwAAAAAACgkQlh/E3EQov+Ap
rBAAnNb0+xGgF6wok0+sXTo9yTCeKShTFhLJ1H3IdFpTlCuyIGLDZJILtQWGjCKGmiEpa2qYtGi6
UB05X+m+A/b9njDjJEMS+dXbqbyZ6c/tb+yLDKQyNFjvDEPVo3YPM4eu8xBWpBFPx5XR/zWTWf3J
czs9CjrjdAm4uKMwxq8Vp8mkJ1AJgPil5B0JUEmLDxtyzrZzXye2griD11G9GG7QzOFQnMzU5R+j
z2Eh3xsHYtqY573xdra/BTsYiQAUMyn+k0+yd7Pc0t+p3oUdZbpv6FuERJCQGx8OugrmumMut0pQ
C0nobpiGh6s6urgsUMlo7eDkpAd3xE0xUr4HBB1/UIGUkxyHB4NSJyNBXSL27cSjsFE94XlDKczh
MZCStOZ0CoBkbqxRNRYGenUH5hAbVkA0mWVE8Sr3WJGT/ZeSannsh8LkZDPNwgmOxBE5LgIQhiUa
ILPJtUw7pVxFeDYSetjM5/QFi6nov4uXIBhFRXACxM+Pjs4bjYa6uiJFTZXbZWNP4NPM1NZBR2PE
UGK7rvSOSneETQGHHKK6puuZV0r9iK81rjAa7VmjH3Eusy9QhmtdKKMKIEwxzKWwrZNAgd0C7Hix
kwhvGdglHntlQ0+eskQ+779Q09DTFHgrlo2yq4+D0hVoKR93DXMMaA1orXOrZkOZzb6L7BKEVI1/
SUI=
=rZGJ
-----END PGP SIGNATURE-----

--------------VRDBOmJ1uHgwfQWzhxmFFfyZ--
