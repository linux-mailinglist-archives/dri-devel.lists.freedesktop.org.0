Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CBF793BC1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909310E617;
	Wed,  6 Sep 2023 11:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0D410E617
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:50:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38AE92240E;
 Wed,  6 Sep 2023 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694001004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srEHtrw1vxgf6RLyNFIk62u1dAa2534DFtpm4MUN3iU=;
 b=vvBDaYK5gBuI0aXYe/UXdHPTZ0G84MC2hqbm0EYy63L7bl0+SvcLF5rZQzd5OQgHSD8OWq
 R20pvUYszqbjen7wiOq3efP0dWPi8S2a2a6vrW29w/ErRKimkYnGylhPqEW7TdSBH0+tAe
 SJ0OSJrWIiU6GvL0SrSGSnHKyTvZ3so=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694001004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srEHtrw1vxgf6RLyNFIk62u1dAa2534DFtpm4MUN3iU=;
 b=thDnHi5ASZwzu2YRp+YAIQQqqwRTy5oQdQ7I+FDPLp/YzI8H5dGlOKCRu1nSdaCenbEQOD
 fBDrS9eBo3yln9DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD3141333E;
 Wed,  6 Sep 2023 11:50:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ao/KWtn+GQsYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 11:50:03 +0000
Message-ID: <1f055418-1bfe-6b7d-3972-7b433661e731@suse.de>
Date: Wed, 6 Sep 2023 13:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 v1 4/7] drm/fourcc: Add drm/vs tiled modifiers
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-5-keith.zhao@starfivetech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230801101030.2040-5-keith.zhao@starfivetech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x8RZV0Luikz7jTH2pG1swqua"
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x8RZV0Luikz7jTH2pG1swqua
Content-Type: multipart/mixed; boundary="------------YObmTMDzrOw3nXo9vvd00TM2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Message-ID: <1f055418-1bfe-6b7d-3972-7b433661e731@suse.de>
Subject: Re: [PATCH v1 v1 4/7] drm/fourcc: Add drm/vs tiled modifiers
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-5-keith.zhao@starfivetech.com>
In-Reply-To: <20230801101030.2040-5-keith.zhao@starfivetech.com>

--------------YObmTMDzrOw3nXo9vvd00TM2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDguMjMgdW0gMTI6MTAgc2NocmllYiBLZWl0aCBaaGFvOg0KPiBUaGVz
ZSBhcmUgbWFpbmx5IHVzZWQgaW50ZXJuYWxseSBpbiB2cy1kcm0sDQo+IEknbSBub3Qgc3Vy
ZSBpZiB0aGUgbmV3IG1vZGlmaWVycyBjYW4gYmUgdXNlZCB3aXRoIHRoZSBleGlzdGluZyBv
bmVzLg0KPiBJZiB0aGVyZSBpcyBhIHByb2JsZW0sIEkgd2lsbCBpbXByb3ZlIGl0IGZ1cnRo
ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLZWl0aCBaaGFvIDxrZWl0aC56aGFvQHN0YXJm
aXZldGVjaC5jb20+DQo+IC0tLQ0KPiAgIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5o
IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oDQo+IGluZGV4
IDhkYjdmZDNmNy4uMGI4ODRjZjUwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaA0K
PiBAQCAtNDE5LDYgKzQxOSw3IEBAIGV4dGVybiAiQyIgew0KPiAgICNkZWZpbmUgRFJNX0ZP
Uk1BVF9NT0RfVkVORE9SX0FSTSAgICAgMHgwOA0KPiAgICNkZWZpbmUgRFJNX0ZPUk1BVF9N
T0RfVkVORE9SX0FMTFdJTk5FUiAweDA5DQo+ICAgI2RlZmluZSBEUk1fRk9STUFUX01PRF9W
RU5ET1JfQU1MT0dJQyAweDBhDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZFTkRPUl9W
UyAgICAgIDB4MGINCj4gICANCj4gICAvKiBhZGQgbW9yZSB0byB0aGUgZW5kIGFzIG5lZWRl
ZCAqLw0KPiAgIA0KPiBAQCAtMTU2Miw2ICsxNTYzLDMyIEBAIGRybV9mb3VyY2NfY2Fub25p
Y2FsaXplX252aWRpYV9mb3JtYXRfbW9kKF9fdTY0IG1vZGlmaWVyKQ0KPiAgICNkZWZpbmUg
QU1EX0ZNVF9NT0RfQ0xFQVIoZmllbGQpIFwNCj4gICAJKH4oKF9fdTY0KUFNRF9GTVRfTU9E
XyMjZmllbGQjI19NQVNLIDw8IEFNRF9GTVRfTU9EXyMjZmllbGQjI19TSElGVCkpDQo+ICAg
DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1RZUEVfTk9STUFMICAgICAgICAweDAw
DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1RZUEVfQ09NUFJFU1NFRCAgICAweDAx
DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1RZUEVfQ1VTVE9NXzEwQklUICAweDAy
DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1RZUEVfTUFTSyAgICAgKChfX3U2NCkw
eDMgPDwgNTQpDQo+ICsNCj4gKyNkZWZpbmUgZm91cmNjX21vZF92c19jb2RlKHR5cGUsIHZh
bCkgXA0KPiArCWZvdXJjY19tb2RfY29kZShWUywgKCgoKF9fdTY0KXR5cGUpIDw8IDU0KSB8
ICh2YWwpKSkNCj4gKw0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19OT1JNX01PREVf
TUFTSyAgICAgICAgMHgxRg0KDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0xJTkVB
UiAgICAgICAgICAgICAgICAweDAwDQoNClRoaXMgZGVmaW5lIHNob3VsZCBiZSByZW1vdmVk
IGlmIGl0IGRvZXMgdGhlIHNhbWUgYXMgRFJNX0ZPUk1BVF9NT0RFX0xJTkVBUi4NCg0KPiAr
I2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19TVVBFUl9USUxFRF9YTUFKT1IgICAgMHgwMg0K
PiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19TVVBFUl9USUxFRF9ZTUFKT1IgICAgMHgw
Mw0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19USUxFXzhYOCAgICAgICAgICAgICAg
MHgwNA0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19USUxFXzhYNCAgICAgICAgICAg
ICAgMHgwNw0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19TVVBFUl9USUxFRF9YTUFK
T1JfOFg0ICAgIDB4MEINCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfU1VQRVJfVElM
RURfWU1BSk9SXzRYOCAgICAweDBDDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1RJ
TEVfTU9ERTRYNCAgICAgICAgICAweDE1DQo+ICsNCg0KVGhlIGV4aXN0aW5nIGZvcm1hdHMg
aW4gdGhpcyBmaWxlIGhhdmUgZG9jdW1lbnRhdGlvbiBvbiB0aGVpciBlZmZlY3RzIA0KYW5k
IG1lYW5pbmcuIFlvdSBzaG91bGQgaW5jbHVkZSBzaW1pbGFyIGNvbW1lbnRzIGhlcmUuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKyNkZWZpbmUgZm91cmNjX21vZF92c19ub3Jt
X2NvZGUodGlsZSkgXA0KPiArCWZvdXJjY19tb2RfdnNfY29kZShEUk1fRk9STUFUX01PRF9W
U19UWVBFX05PUk1BTCwgXA0KPiArCQkJCSh0aWxlKSkNCj4gKw0KPiArI2RlZmluZSBmb3Vy
Y2NfbW9kX3ZzX2N1c3RvbV9jb2RlKHRpbGUpIFwNCj4gKwlmb3VyY2NfbW9kX3ZzX2NvZGUo
RFJNX0ZPUk1BVF9NT0RfVlNfVFlQRV9DVVNUT01fMTBCSVQsIFwNCj4gKwkJCQkodGlsZSkp
DQo+ICsNCj4gICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4gICB9DQo+ICAgI2VuZGlm
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2Ug
MTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBN
eWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0K

--------------YObmTMDzrOw3nXo9vvd00TM2--

--------------x8RZV0Luikz7jTH2pG1swqua
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT4Z2oFAwAAAAAACgkQlh/E3EQov+CH
mg//SpaTKVtkes9IwmSFYLCrsiGY+ENdlyEWqYOT+L1v0I8ah3YSFn9u5dNexysMSX7yFh/CfJI5
IYn7INPHVjDxiHMki2RJa2MXXIAqN/6tP3Cx7gy4fhOIk5PdhrI9Jydme5BuHsN0CunyMjCS0Cb6
ZOH7WDzyoo3xNkLH1K49DRQec1K6mJnkGvlYoA2GVpNRW33C7+lraipvfCWLGji3kJ2T3H/joTJe
/Js8Z2fMJKgXOtFv2Th3fTknEKye0vJVKUc7TG1XBdmGlxMLblZz2d1GKePqD09qbS2iD7qmS4dN
7qSvdsXXnKAzACVZxQ6Bmfv/xzLGZu7MdbRl+cBjOHiJ9JjLXHVJFy3+peRHPMVggH+8itsDSEEK
ERnwOlynxwtDW/foZgz1MJDCyeYc2sUfBvdQdO5qj0PVK7Dwx6Wee6eWvX+Jr/gkqmAkzSjIsP36
yY7igKuDKhnM+uzHppYrNZgRmJRjLP7+wLy9IMWunu79cdkbtt/Erxc9jI138Yi+Y7Spz+kxAGls
hoPtQilGWoPSoBRGEU3UmqBgcettLrv4E4b1Zf7TDEXkHg3ntkMMS7Fovjj8T1HVXhmAnho+Kpos
K4hqdisKjyPy0XvnecYbrU+tJBc97MjMeRN36wRZjZdKXW8I4SWSEFmyoVMzH0V6vjMrARAfQMCG
Sro=
=Jw1c
-----END PGP SIGNATURE-----

--------------x8RZV0Luikz7jTH2pG1swqua--
