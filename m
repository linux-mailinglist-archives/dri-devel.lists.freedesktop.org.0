Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B265A48AAAB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDFF11B8F6;
	Tue, 11 Jan 2022 09:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B8211AB23
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:38:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 618F3212C3;
 Tue, 11 Jan 2022 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641893917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z93sKfKQ07Pt/Qn6w692k2EIInexJQ8NAUx3YhibQDw=;
 b=Hz9RtDwWE0VpkFzuVxo09EdYTuUcSYorrQkiLW+rTYVtT2s7S6AgigdT1A4f+ANOOpFdPJ
 IKqVZ4gqiefrLDClERMdbcGzekECLcxkMb6OYMIFfEEHk3C8iwiyMlFXwh6Bsaur+xsroW
 qda8aDtsiJ2Yhe73UsxSOK26K/ZCNYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641893917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z93sKfKQ07Pt/Qn6w692k2EIInexJQ8NAUx3YhibQDw=;
 b=V8JkimMfVJR7/UbzV2i8fvzHZEKklkkgRSioL5hSAceVH/ATj+a6bWgqaN97cVhaF7KoNi
 XpNzDCvlBCJL6uBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04CC013AC9;
 Tue, 11 Jan 2022 09:38:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ijUoAB1Q3WHePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 09:38:37 +0000
Message-ID: <1a42431d-59bc-53e0-199b-815c96f97a29@suse.de>
Date: Tue, 11 Jan 2022 10:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH RESEND v4 v5 4/4] drm/vc4: Notify the firmware when DRM is
 in charge
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Florian Fainelli
 <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20211215095117.176435-1-maxime@cerno.tech>
 <20211215095117.176435-5-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211215095117.176435-5-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ckPvaYMSG2ZwI06HkxwcfV8"
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ckPvaYMSG2ZwI06HkxwcfV8
Content-Type: multipart/mixed; boundary="------------XGrhO0zzjfqVd01hvM5y0HID";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Florian Fainelli
 <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <1a42431d-59bc-53e0-199b-815c96f97a29@suse.de>
Subject: Re: [PATCH RESEND v4 v5 4/4] drm/vc4: Notify the firmware when DRM is
 in charge
References: <20211215095117.176435-1-maxime@cerno.tech>
 <20211215095117.176435-5-maxime@cerno.tech>
In-Reply-To: <20211215095117.176435-5-maxime@cerno.tech>

--------------XGrhO0zzjfqVd01hvM5y0HID
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMTA6NTEgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
bmNlIHRoZSBjYWxsIHRvIGRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1l
YnVmZmVycygpIGhhcw0KPiBiZWVuIG1hZGUsIHNpbXBsZWZiIGhhcyBiZWVuIHVucmVnaXN0
ZXJlZCBhbmQgdGhlIEtNUyBkcml2ZXIgaXMgZW50aXJlbHkNCj4gaW4gY2hhcmdlIG9mIHRo
ZSBkaXNwbGF5Lg0KPiANCj4gVGh1cywgd2UgY2FuIG5vdGlmeSB0aGUgZmlybXdhcmUgaXQg
Y2FuIGZyZWUgd2hhdGV2ZXIgcmVzb3VyY2UgaXQgd2FzDQo+IHVzaW5nIHRvIG1haW50YWlu
IHNpbXBsZWZiIGZ1bmN0aW9uYWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlw
YXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfZHJ2LmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jDQo+
IGluZGV4IDg2YzYxZWUxMjBiNy4uYTAzMDUzYzhlMjJjIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9kcnYuYw0KPiBAQCAtMzcsNiArMzcsOCBAQA0KPiAgICNpbmNsdWRlIDxkcm0vZHJt
X2ZiX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPg0KPiAgIA0K
PiArI2luY2x1ZGUgPHNvYy9iY20yODM1L3Jhc3BiZXJyeXBpLWZpcm13YXJlLmg+DQo+ICsN
Cj4gICAjaW5jbHVkZSAidWFwaS9kcm0vdmM0X2RybS5oIg0KPiAgIA0KPiAgICNpbmNsdWRl
ICJ2YzRfZHJ2LmgiDQo+IEBAIC0yMTUsNiArMjE3LDcgQEAgc3RhdGljIHZvaWQgdmM0X21h
dGNoX2FkZF9kcml2ZXJzKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICBzdGF0aWMgaW50IHZj
NF9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ICsJc3Ry
dWN0IHJwaV9maXJtd2FyZSAqZmlybXdhcmUgPSBOVUxMOw0KPiAgIAlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtOw0KPiAgIAlzdHJ1Y3QgdmM0X2RldiAqdmM0Ow0KPiAgIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGU7DQo+IEBAIC0yNTEsMTAgKzI1NCwyOSBAQCBzdGF0aWMgaW50IHZj
NF9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgCWlmIChyZXQpDQo+ICAgCQly
ZXR1cm4gcmV0Ow0KPiAgIA0KPiArCW5vZGUgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShO
VUxMLCBOVUxMLCAicmFzcGJlcnJ5cGksYmNtMjgzNS1maXJtd2FyZSIpOw0KPiArCWlmIChu
b2RlKSB7DQo+ICsJCWZpcm13YXJlID0gcnBpX2Zpcm13YXJlX2dldChub2RlKTsNCj4gKwkJ
b2Zfbm9kZV9wdXQobm9kZSk7DQo+ICsNCj4gKwkJaWYgKCFmaXJtd2FyZSkNCj4gKwkJCXJl
dHVybiAtRVBST0JFX0RFRkVSOw0KPiArCX0NCj4gKw0KDQpUaGUgY29kZSBpcw0KDQpBY2tl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkp1c3Qg
Zm9yIG15IHVuZGVyc3RhbmRpbmc6DQoNCllvdSByZXRyaWV2ZSB0aGUgZmlybXdhcmUgYmVm
b3JlIGtpbGxpbmcgc2ltcGxlZHJtIHNpbXBseSB0byBrZWVwIHRoZSANCmRpc3BsYXkgb24g
aWYgaXQgZmFpbHMsIHJpZ2h0Pw0KDQpXaGF0J3MgdGhlIHBvc3NpYmxlIGVycm9yIHRoYXQg
d291bGQganVzdGlmeSBhIHJldHJ5ICh2aWEgRVBST0JFX0RFRkVSKT8NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiAgIAlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVm
ZmVycyhmYWxzZSwgJnZjNF9kcm1fZHJpdmVyKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCXJl
dHVybiByZXQ7DQo+ICAgDQo+ICsJaWYgKGZpcm13YXJlKSB7DQo+ICsJCXJldCA9IHJwaV9m
aXJtd2FyZV9wcm9wZXJ0eShmaXJtd2FyZSwNCj4gKwkJCQkJICAgIFJQSV9GSVJNV0FSRV9O
T1RJRllfRElTUExBWV9ET05FLA0KPiArCQkJCQkgICAgTlVMTCwgMCk7DQo+ICsJCWlmIChy
ZXQpDQo+ICsJCQlkcm1fd2Fybihkcm0sICJDb3VsZG4ndCBzdG9wIGZpcm13YXJlIGRpc3Bs
YXkgZHJpdmVyOiAlZFxuIiwgcmV0KTsNCj4gKw0KPiArCQlycGlfZmlybXdhcmVfcHV0KGZp
cm13YXJlKTsNCj4gKwl9DQo+ICsNCj4gICAJcmV0ID0gY29tcG9uZW50X2JpbmRfYWxsKGRl
diwgZHJtKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------XGrhO0zzjfqVd01hvM5y0HID--

--------------3ckPvaYMSG2ZwI06HkxwcfV8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHdUBwFAwAAAAAACgkQlh/E3EQov+Ab
pBAAiyhoDJmZZ7t4/K0UxdjnGe/p76oqGk4+QyM1lBpu+D4VVqkpqmmr1DHDwMfZ6WXKeJMMWxD8
V/Wbz8lt0QE/gPHtcSL84X+3ZucugTA8n4B2X4I0jJR09HhT6Lm9Se0X9Kt9p2riMSqXpBVoBzBa
9B085UC/Te5ifHzvFlOeYzVq39E58ujt1dRIl5F3Jc2ts01mMnf+EeZgvk442ruf9jVneSWNoRWW
DmcGRH30/UNZtXuqw+QCxtg8iQ8kSbvQwQwQQb7qMJ0dYFoylK9S7CRskQ9NU0BD+l3a+h21Zzda
0FO2t5xL2Vz6Qpch0SfDuqWu3BrXpvjAF9Y31qD135K6Gx/e6xjLk4ditTc959q0lLULJ9QPb+Rq
yIywnW711FV58WBMhk4mqDAmFekYU4v1SsIrPJU80widkGRRTPmi66e2rGbQ+u54Z8TII8T41vzw
PWn0G7FLvmiz7clS/HxQTfxes4j6CfZCqNiIChlE05RLNE3loFzkL1ajpApKtEmKd6Th3Je6SpMr
c5/EJLBxHKuee61thzgbwyI4WK73ax36AKkkUKT7y6ljp/CpBKn/uM3LVQF8AY7bxIPdRvzEbvh7
1r05+oLjlAU8BdSuSDJHR+P0sXggeRvy+ZVCdwYimN0dXdD9M5mVV9aDDnco8lH1N+cC74m+BJW2
wfI=
=RVQQ
-----END PGP SIGNATURE-----

--------------3ckPvaYMSG2ZwI06HkxwcfV8--
