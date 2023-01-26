Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC567CBA4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C510E2B0;
	Thu, 26 Jan 2023 13:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEF510E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:05:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BB2A21E37;
 Thu, 26 Jan 2023 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674738319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZ/GsfMgRhW/1fXxnIvw+dujoHIf++p4Z4X2iJFtRvg=;
 b=hiv1Mn3sT1arZKi54NXDzD/M3afihA9zhvqQiIb2qsecaZXpfrQ2VPaQT1anuwI/7Me+Ui
 Is2+gpAZE3UtSGom7iBhXENKcaWOEIjSth9NR3IxMVmvtDltVFFUZWbdeQu/I2wrmfUksb
 3NQ7ux3pflEBS3ffCVKKGiUguFOzDlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674738319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZ/GsfMgRhW/1fXxnIvw+dujoHIf++p4Z4X2iJFtRvg=;
 b=JyZ8tAAS5NgcTJ4XmTK6XzFegSVpTasYrC3B/Z39D3bXGgc20lJI5xRlRvH/spdjl3UIxj
 LJTVoJ8KjwH3dECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 334A0139B3;
 Thu, 26 Jan 2023 13:05:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6pWsC4960mOfVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 13:05:19 +0000
Message-ID: <00e614e8-4395-0aac-d613-b70b7005bd0b@suse.de>
Date: Thu, 26 Jan 2023 14:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] drm/simpledrm: Allow physical width and height
 configuration via DT
Content-Language: en-US
To: Rayyan Ansari <rayyan@ansari.sh>, dri-devel@lists.freedesktop.org
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-2-rayyan@ansari.sh>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230121153544.467126-2-rayyan@ansari.sh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hVvOHpSjJzA94kD7H70P3Lwt"
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
--------------hVvOHpSjJzA94kD7H70P3Lwt
Content-Type: multipart/mixed; boundary="------------crI3tKa4CicLouoxoKq0icJY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rayyan Ansari <rayyan@ansari.sh>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 janne@jannau.net, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Message-ID: <00e614e8-4395-0aac-d613-b70b7005bd0b@suse.de>
Subject: Re: [PATCH v2 1/2] drm/simpledrm: Allow physical width and height
 configuration via DT
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-2-rayyan@ansari.sh>
In-Reply-To: <20230121153544.467126-2-rayyan@ansari.sh>

--------------crI3tKa4CicLouoxoKq0icJY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkganVzdCB3YW50IHRvIGNvbW1lbnQgdGhhdCB0aGUgY29kZSBpbiB0aGlzIHBh
dGNoIGlzIGZpbmUsIGJ1dCBJJ20gbm90IA0KZ29pbmcgdG8gbWVyZ2UgaXQgdW50aWwgdGhl
IG90aGVyIGRpc2N1c3Npb24gYWJvdXQgdXNpbmcgdGhlIHBhbmVsJ3MgRFQgDQpub2RlcyBo
YXMgYmVlbiByZXNvbHZlZC4gSU1ITywgdGhlIHBhbmVsLWJhc2VkIHNvbHV0aW9uIHNlZW1z
IHByZWZlcmFibGUgDQp0byB0aGUgbmV3IHByb3BlcnRpZXMuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCkFtIDIxLjAxLjIzIHVtIDE2OjM1IHNjaHJpZWIgUmF5eWFuIEFuc2FyaToN
Cj4gU2lnbmVkLW9mZi1ieTogUmF5eWFuIEFuc2FyaSA8cmF5eWFuQGFuc2FyaS5zaD4NCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCA2MCArKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxl
ZHJtLmMNCj4gaW5kZXggMTYyZWI0NGRjYmE4Li43YWFiN2ZhNTcyZjAgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+IEBAIC0xMjgsNiArMTI4LDIzIEBAIHNpbXBs
ZWZiX3JlYWRfdTMyX29mKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqb2Zfbm9kZSwNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0
aWMgaW50DQo+ICtzaW1wbGVmYl9yZWFkX3UzMl9vZl9vcHQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlLA0KPiArCQkJIGNvbnN0IGNoYXIg
Km5hbWUsIHUzMiAqdmFsdWUpDQo+ICt7DQo+ICsJaW50IHJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG9mX25vZGUsIG5hbWUsIHZhbHVlKTsNCj4gKw0KPiArCWlmIChyZXQgPT0gLUVJ
TlZBTCkgew0KPiArCQkqdmFsdWUgPSAwOw0KPiArCQlyZXQgPSAwOw0KPiArCX0gZWxzZSBp
ZiAocmV0KSB7DQo+ICsJCWRybV9lcnIoZGV2LCAic2ltcGxlZmI6IGNhbm5vdCBwYXJzZSBm
cmFtZWJ1ZmZlciAlczogZXJyb3IgJWRcbiIsDQo+ICsJCQluYW1lLCByZXQpOw0KPiArCX0N
Cj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50DQo+ICAg
c2ltcGxlZmJfcmVhZF9zdHJpbmdfb2Yoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZV9ub2RlICpvZl9ub2RlLA0KPiAgIAkJCWNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0
IGNoYXIgKip2YWx1ZSkNCj4gQEAgLTE4NCw2ICsyMDEsMTkgQEAgc2ltcGxlZmJfZ2V0X2Zv
cm1hdF9vZihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9m
X25vZGUpDQo+ICAgCXJldHVybiBzaW1wbGVmYl9nZXRfdmFsaWRhdGVkX2Zvcm1hdChkZXYs
IGZvcm1hdCk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGludA0KPiArc2ltcGxlZmJfZ2V0
X21tX29mKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zf
bm9kZSwNCj4gKwkJICAgY29uc3QgY2hhciAqbmFtZSkNCj4gK3sNCj4gKwlpbnQgbW07DQo+
ICsJaW50IHJldCA9IHNpbXBsZWZiX3JlYWRfdTMyX29mX29wdChkZXYsIG9mX25vZGUsIG5h
bWUsICZtbSk7DQo+ICsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCXJl
dHVybiBzaW1wbGVmYl9nZXRfdmFsaWRhdGVkX2ludChkZXYsIG5hbWUsIG1tKTsNCj4gK30N
Cj4gKw0KPiArDQo+ICAgLyoNCj4gICAgKiBTaW1wbGUgRnJhbWVidWZmZXIgZGV2aWNlDQo+
ICAgICovDQo+IEBAIC01OTksMTYgKzYyOSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9tb2RlX2NvbmZpZ19mdW5jcyBzaW1wbGVkcm1fbW9kZV9jb25maWdfZnVuY3MgPSB7DQo+
ICAgICovDQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHNpbXBs
ZWRybV9tb2RlKHVuc2lnbmVkIGludCB3aWR0aCwNCj4gLQkJCQkJICAgICAgdW5zaWduZWQg
aW50IGhlaWdodCkNCj4gKwkJCQkJICAgICAgdW5zaWduZWQgaW50IGhlaWdodCwNCj4gKwkJ
CQkJICAgICAgdW5zaWduZWQgaW50IHdpZHRoX21tLA0KPiArCQkJCQkgICAgICB1bnNpZ25l
ZCBpbnQgaGVpZ2h0X21tKQ0KPiAgIHsNCj4gLQkvKg0KPiAtCSAqIEFzc3VtZSBhIG1vbml0
b3IgcmVzb2x1dGlvbiBvZiA5NiBkcGkgdG8NCj4gLQkgKiBnZXQgYSBzb21ld2hhdCByZWFz
b25hYmxlIHNjcmVlbiBzaXplLg0KPiAtCSAqLw0KPiAgIAljb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSBtb2RlID0gew0KPiAtCQlEUk1fTU9ERV9JTklUKDYwLCB3aWR0aCwgaGVp
Z2h0LA0KPiAtCQkJICAgICAgRFJNX01PREVfUkVTX01NKHdpZHRoLCA5NnVsKSwNCj4gLQkJ
CSAgICAgIERSTV9NT0RFX1JFU19NTShoZWlnaHQsIDk2dWwpKQ0KPiArCQlEUk1fTU9ERV9J
TklUKDYwLCB3aWR0aCwgaGVpZ2h0LCB3aWR0aF9tbSwgaGVpZ2h0X21tKQ0KPiAgIAl9Ow0K
PiAgIA0KPiAgIAlyZXR1cm4gbW9kZTsNCj4gQEAgLTYyMiw2ICs2NDgsNyBAQCBzdGF0aWMg
c3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVj
dCBkcm1fZHJpdmVyICpkcnYsDQo+ICAgCXN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2
Ow0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Ow0KPiAgIAlpbnQgd2lkdGgsIGhlaWdo
dCwgc3RyaWRlOw0KPiArCWludCB3aWR0aF9tbSA9IDAsIGhlaWdodF9tbSA9IDA7DQo+ICAg
CWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdDsNCj4gICAJc3RydWN0IHJl
c291cmNlICpyZXMsICptZW07DQo+ICAgCXZvaWQgX19pb21lbSAqc2NyZWVuX2Jhc2U7DQo+
IEBAIC02NzYsNiArNzAzLDEyIEBAIHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAq
c2ltcGxlZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwNCj4gICAJ
CWZvcm1hdCA9IHNpbXBsZWZiX2dldF9mb3JtYXRfb2YoZGV2LCBvZl9ub2RlKTsNCj4gICAJ
CWlmIChJU19FUlIoZm9ybWF0KSkNCj4gICAJCQlyZXR1cm4gRVJSX0NBU1QoZm9ybWF0KTsN
Cj4gKwkJd2lkdGhfbW0gPSBzaW1wbGVmYl9nZXRfbW1fb2YoZGV2LCBvZl9ub2RlLCAid2lk
dGgtbW0iKTsNCj4gKwkJaWYgKHdpZHRoX21tIDwgMCkNCj4gKwkJCXJldHVybiBFUlJfUFRS
KHdpZHRoX21tKTsNCj4gKwkJaGVpZ2h0X21tID0gc2ltcGxlZmJfZ2V0X21tX29mKGRldiwg
b2Zfbm9kZSwgImhlaWdodC1tbSIpOw0KPiArCQlpZiAoaGVpZ2h0X21tIDwgMCkNCj4gKwkJ
CXJldHVybiBFUlJfUFRSKGhlaWdodF9tbSk7DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQlkcm1f
ZXJyKGRldiwgIm5vIHNpbXBsZWZiIGNvbmZpZ3VyYXRpb24gZm91bmRcbiIpOw0KPiAgIAkJ
cmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQo+IEBAIC02ODYsNyArNzE5LDE2IEBAIHN0YXRp
YyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoc3Ry
dWN0IGRybV9kcml2ZXIgKmRydiwNCj4gICAJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsN
Cj4gICAJfQ0KPiAgIA0KPiAtCXNkZXYtPm1vZGUgPSBzaW1wbGVkcm1fbW9kZSh3aWR0aCwg
aGVpZ2h0KTsNCj4gKwkvKg0KPiArCSAqIEFzc3VtZSBhIG1vbml0b3IgcmVzb2x1dGlvbiBv
ZiA5NiBkcGkgaWYgcGh5c2ljYWwgZGltZW5zaW9ucw0KPiArCSAqIGFyZSBub3Qgc3BlY2lm
aWVkIHRvIGdldCBhIHNvbWV3aGF0IHJlYXNvbmFibGUgc2NyZWVuIHNpemUuDQo+ICsJICov
DQo+ICsJaWYgKCF3aWR0aF9tbSkNCj4gKwkJd2lkdGhfbW0gPSBEUk1fTU9ERV9SRVNfTU0o
d2lkdGgsIDk2dWwpOw0KPiArCWlmICghaGVpZ2h0X21tKQ0KPiArCQloZWlnaHRfbW0gPSBE
Uk1fTU9ERV9SRVNfTU0oaGVpZ2h0LCA5NnVsKTsNCj4gKw0KPiArCXNkZXYtPm1vZGUgPSBz
aW1wbGVkcm1fbW9kZSh3aWR0aCwgaGVpZ2h0LCB3aWR0aF9tbSwgaGVpZ2h0X21tKTsNCj4g
ICAJc2Rldi0+Zm9ybWF0ID0gZm9ybWF0Ow0KPiAgIAlzZGV2LT5waXRjaCA9IHN0cmlkZTsN
Cj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------crI3tKa4CicLouoxoKq0icJY--

--------------hVvOHpSjJzA94kD7H70P3Lwt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPSeo4FAwAAAAAACgkQlh/E3EQov+AF
dRAAr03P99RG0h7Bga6J3Ig+I5zFZhIR/vpS+pZUtrKKdbpGiZLR3Fvfy3yom8PRewVpuL8WoMqf
j9LM3Ji0hLWFp8DJq0U+Lt62/f2O5odJaFrTLjRJVTGlJhBhEeBxVGa1UAgfvjEWPePrVBZkXoE5
xOF5+pyMHqxlUxOEUngFEfOcQ0aW2eg7+yIBB4eVrCkTn/bRPN+rdK5RCc9mEkEYX9Psa0feob4h
03AdZF5bJ62UhH0Yz44eTMc62xgMNUycwyUqNPhklMR+JC1cRXLg2DtdM/Hajc1VaFC9qR2rDAcU
F2HPnbBzbxUAgKUD9CSdRyEYFPP1yRrTHDc99yFc2/sVMInJ03Z3Yjlmujwzq1anQfoHueqol6cn
yeKZRFMRjrFtvJeBGfr8/2CVqhdwXUoklG/QqSmafUqkv/m6aWXiJAPUQ+10h+qJT7V4zcXBiBm5
7koetQbIxew8jSoL5setXGM/YJp8YboO4FpZ429mVVII8da2kwvbCPKKlP3sjx1rFVxPsZ+mSrYX
HVVTTo7WIqOx3BzKgDOT4YRmcXJ/UUZrlYVz1WktlFRaK4kMqXb498q5dhQJ+fKdloPrqFPlLJDF
ruH7l30UKj83HMUbll8IcICGZdvgD1CJoMWU3zeTI6J4lJPYzc0DOdGwDV6dWwkBetQCyyIZAhFR
Q1Q=
=Uv5e
-----END PGP SIGNATURE-----

--------------hVvOHpSjJzA94kD7H70P3Lwt--
