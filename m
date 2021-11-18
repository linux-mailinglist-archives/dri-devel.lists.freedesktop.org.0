Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F84557DF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6E6EC63;
	Thu, 18 Nov 2021 09:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190D96EC64
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:19:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B1F34212C2;
 Thu, 18 Nov 2021 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637227168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k5XhXCzclyhcVE8AjIG3BE7vkD2TC2zFZ/VwltR3irU=;
 b=wF7cVZ858YKrbrkdxVua/OtfvD5QSr/RyZwTmxS5Hc7PWDIehwTTp12UsoWm52vW4TkdDA
 6Jg9PUS9LK8nyo8dTCBkiyLbXzkexXA2TcjXP0ThG0+Us6qMWJ7huhsBpqXc+DGV4RD7Z8
 YFE8shVJQ9lhXcHtkJZFdeBb0SaCUAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637227168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k5XhXCzclyhcVE8AjIG3BE7vkD2TC2zFZ/VwltR3irU=;
 b=nQMUHlJ884txvEMvZOmj/V68RO6jO4Bf4d3R1LrlSSLIk8keOWpaiGpRRYf5Pxdmgz1wN3
 XHx3ac4A5g4w4KAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85B6413CD1;
 Thu, 18 Nov 2021 09:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dvmlH6AalmEnbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Nov 2021 09:19:28 +0000
Message-ID: <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
Date: Thu, 18 Nov 2021 10:19:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211117145829.204360-2-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8G201RrpdX3UKhxq9YevExVN"
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8G201RrpdX3UKhxq9YevExVN
Content-Type: multipart/mixed; boundary="------------r3WiQVl2QMmlYdYcpCUMni8j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
Message-ID: <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
In-Reply-To: <20211117145829.204360-2-marcan@marcan.st>

--------------r3WiQVl2QMmlYdYcpCUMni8j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjEgdW0gMTU6NTggc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBU
aGlzIG1hdGNoZXMgdGhlIHNpbXBsZWZiIGJlaGF2aW9yOyB0aGVzZSBub2RlcyBhcmUgbm90
IG1hdGNoZWQgYnkgdGhlDQo+IHN0YW5kYXJkIE9GIG1hY2hpbmVyeS4gVGhpcyBmaXhlcyBh
IHJlZ3Jlc3Npb24gd2hlbiBzaW1wbGVkcm0gcmVwbGFjZXMNCj4gc2ltZXBsZWZiLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSGVjdG9yIE1hcnRpbiA8bWFyY2FuQG1hcmNhbi5zdD4NCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAxNyArKysrKysr
KysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCA0ODFiNDhiZGUwNDcuLjJj
ODRmMmVhMWZhMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxl
ZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAg
LTIsNiArMiw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgICNp
bmNsdWRlIDxsaW51eC9vZl9jbGsuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9y
bS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL3NpbXBsZWZiLmg+DQo+
ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gQEAgLTg5Nyw1ICs4OTgsMjEgQEAgc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc2ltcGxlZHJtX3BsYXRmb3JtX2RyaXZlciA9
IHsNCj4gICANCj4gICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNpbXBsZWRybV9wbGF0Zm9y
bV9kcml2ZXIpOw0KPiAgIA0KPiArc3RhdGljIGludCBfX2luaXQgc2ltcGxlZHJtX2luaXQo
dm9pZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPiArDQo+ICsJaWYg
KElTX0VOQUJMRUQoQ09ORklHX09GX0FERFJFU1MpICYmIG9mX2Nob3Nlbikgew0KPiArCQlm
b3JfZWFjaF9jaGlsZF9vZl9ub2RlKG9mX2Nob3NlbiwgbnApIHsNCj4gKwkJCWlmIChvZl9k
ZXZpY2VfaXNfY29tcGF0aWJsZShucCwgInNpbXBsZS1mcmFtZWJ1ZmZlciIpKQ0KPiArCQkJ
CW9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobnAsIE5VTEwsIE5VTEwpOw0KPiArCQl9DQo+
ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK2ZzX2luaXRjYWxsKHNp
bXBsZWRybV9pbml0KTsNCj4gKw0KDQpTaW1wbGVkcm0gaXMganVzdCBhIGRyaXZlciwgYnV0
IHRoaXMgaXMgcGxhdGZvcm0gc2V0dXAgY29kZS4gV2h5IGlzIHRoaXMgDQpjb2RlIGxvY2F0
ZWQgaGVyZSBhbmQgbm90IHVuZGVyIGFyY2gvIG9yIGRyaXZlcnMvZmlybXdhcmUvPw0KDQpJ
IGtub3cgdGhhdCBvdGhlciBkcml2ZXJzIGRvIHNpbWlsYXIgdGhpbmdzLCBpdCBkb2Vzbid0
IHNlZW0gdG8gYmVsb25nIGhlcmUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICBN
T0RVTEVfREVTQ1JJUFRJT04oRFJJVkVSX0RFU0MpOw0KPiAgIE1PRFVMRV9MSUNFTlNFKCJH
UEwgdjIiKTsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------r3WiQVl2QMmlYdYcpCUMni8j--

--------------8G201RrpdX3UKhxq9YevExVN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGWGp8FAwAAAAAACgkQlh/E3EQov+Df
AA//d29Lm+N4jaqtOFjLSFNPTH/hwnKnHLS5HTBgba6+JqufwccDkAaO71jK/V+GnRO+88jFK574
HzqqAojrPbbA/AqQAEa/slUHNfpm+osScRbyhWryrtCftPZCYARu+hvrDam0reKZbmHgZN4fFfQb
id4D25rNfVj6EjIBifM7DjZULTZ4rhBbsn9FnBshRMW5E2KKw2ps5BRV9oFMggHfhr0xUr8R2ozA
q8FAY8YKlBjzgwvqYt63wUfKI4QEidsLVMDe9WcU0nXwfWuSfAfGaAXWGKH2xOlQxKtX1eCqlaih
p1klIdlpbqQrifWl7kRUfJ6YQ8LlLMihcqBI8Ov132qN7yAs7KCMtJv9JKGQGxC8nSdBLllk4lsr
tQ9HEQmxdMV9uW/toL+M4+uLeEV0Q96e6abF1y0YKNwd4h9UBpiLJCNB+oodvU5Vwj415qfMpLv8
Y1g1U5Yg08mysU2K+rEXWtG0xsFpzw5x8TYuSNbhAH6W4n6Oc0Ww+JbsqUpOZdJfHb2cl9Yn+1Pi
NZ1paN0fA++U9o4DrFaKHpA1S77BJ/oa5ZrvNk0hiCV9bbxwFDMdVWDLgKvkgla4DYjj7UfIZGNW
wWa8nPaGgcXUrht66GdafHRpkR2eJu1LaYdkOyD0gvAQxkm/LBfkRaMQ/exbwQcujA5rD9zevj8l
Z1U=
=s9yZ
-----END PGP SIGNATURE-----

--------------8G201RrpdX3UKhxq9YevExVN--
