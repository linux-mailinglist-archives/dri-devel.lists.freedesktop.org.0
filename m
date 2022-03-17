Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D14DCF03
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 20:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB9910E0CC;
	Thu, 17 Mar 2022 19:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD5C10E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 19:49:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B18461F38E;
 Thu, 17 Mar 2022 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647546591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7y3TkUbnaChUVnmyUwmgHvcoZWrm+FG4McYeVEhLopI=;
 b=TGuw+ZMBzhG/lpJysOq/YKZ+0hQEN920a6N/+aGlnZHIGsL1GSAoapseuxm8ybmIKxwf07
 Ba7hzpsOv97vyqXucPZj06jCXNWKNcbMrp4vMOQmmzweIM4ftUr7996zbibXXTpu69E5V1
 96VF/dqSW4wE7fN9+T+FW2oMpdj0mjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647546591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7y3TkUbnaChUVnmyUwmgHvcoZWrm+FG4McYeVEhLopI=;
 b=Py3ObPDw+bO1ylTZVx7x1i3AdayWCBA8FmnlKi+zHSV8nvzI7EaMBBjCbngGRueSdhKgaY
 giFTMCi/iC1PvBBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A19F13BCA;
 Thu, 17 Mar 2022 19:49:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LGEbIN+QM2KKPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Mar 2022 19:49:51 +0000
Message-ID: <fa7d115d-e89e-f7fd-c72e-3fdfbab3bd2f@suse.de>
Date: Thu, 17 Mar 2022 20:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/4] drm/gma500: Don't store crtc_funcs in psb_ops
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220317092555.17882-3-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220317092555.17882-3-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NcHwCvMt05w8XCc0IVNVaqVq"
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NcHwCvMt05w8XCc0IVNVaqVq
Content-Type: multipart/mixed; boundary="------------VqTnTD4AkC9HkJ5jIhhiB8kj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Message-ID: <fa7d115d-e89e-f7fd-c72e-3fdfbab3bd2f@suse.de>
Subject: Re: [PATCH 3/4] drm/gma500: Don't store crtc_funcs in psb_ops
References: <20220317092555.17882-3-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220317092555.17882-3-patrik.r.jakobsson@gmail.com>

--------------VqTnTD4AkC9HkJ5jIhhiB8kj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE3LjAzLjIyIHVtIDEwOjI1IHNjaHJpZWIgUGF0cmlrIEpha29ic3NvbjoNCj4g
VGhlIGRybV9jcnRjX2Z1bmNzIGFyZSBhbGwgZ2VuZXJpYyBhbmQgbm8gY2hpcCBzcGVjaWZp
YyBmdW5jdGlvbnMgYXJlDQo+IG5lY2Vzc2FyeS4gV2UgY2FuIHRoZXJlZm9yZSBkaXJlY3Rs
eSBwdXQgZ21hX2NydGNfZnVuY3MgaW50byB0aGUNCj4gZHJtX2NydGMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwu
Y29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfZGV2aWNl
LmMgICAgICAgIHwgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9k
ZXZpY2UuYyAgIHwgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZGV2aWNl
LmMgICAgICAgIHwgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2Lmgg
ICAgICAgICAgIHwgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfaW50ZWxf
ZGlzcGxheS5jIHwgMyArLS0NCj4gICA1IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvY2R2X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfZGV2aWNl
LmMNCj4gaW5kZXggODg3YzE1N2Q3NWY0Li5mODU0ZjU4YmNiYjMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvY2R2X2RldmljZS5jDQo+IEBAIC02MDMsNyArNjAzLDYgQEAgY29u
c3Qgc3RydWN0IHBzYl9vcHMgY2R2X2NoaXBfb3BzID0gew0KPiAgIAkuZXJyYXRhID0gY2R2
X2VycmF0YSwNCj4gICANCj4gICAJLmNydGNfaGVscGVyID0gJmNkdl9pbnRlbF9oZWxwZXJf
ZnVuY3MsDQo+IC0JLmNydGNfZnVuY3MgPSAmZ21hX2NydGNfZnVuY3MsDQo+ICAgCS5jbG9j
a19mdW5jcyA9ICZjZHZfY2xvY2tfZnVuY3MsDQo+ICAgDQo+ICAgCS5vdXRwdXRfaW5pdCA9
IGNkdl9vdXRwdXRfaW5pdCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvb2FrdHJhaWxfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWls
X2RldmljZS5jDQo+IGluZGV4IDQwZjFiYzczNjEyNS4uNTkyM2E5Yzg5MzEyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2RldmljZS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfZGV2aWNlLmMNCj4gQEAgLTU0
NSw3ICs1NDUsNiBAQCBjb25zdCBzdHJ1Y3QgcHNiX29wcyBvYWt0cmFpbF9jaGlwX29wcyA9
IHsNCj4gICAJLmNoaXBfc2V0dXAgPSBvYWt0cmFpbF9jaGlwX3NldHVwLA0KPiAgIAkuY2hp
cF90ZWFyZG93biA9IG9ha3RyYWlsX3RlYXJkb3duLA0KPiAgIAkuY3J0Y19oZWxwZXIgPSAm
b2FrdHJhaWxfaGVscGVyX2Z1bmNzLA0KPiAtCS5jcnRjX2Z1bmNzID0gJmdtYV9jcnRjX2Z1
bmNzLA0KPiAgIA0KPiAgIAkub3V0cHV0X2luaXQgPSBvYWt0cmFpbF9vdXRwdXRfaW5pdCwN
Cj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZGV2aWNlLmMNCj4gaW5kZXggZTkz
ZTQxOTFjMGNhLi41OWYzMjUxNjU2NjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAv
cHNiX2RldmljZS5jDQo+IEBAIC0zMjksNyArMzI5LDYgQEAgY29uc3Qgc3RydWN0IHBzYl9v
cHMgcHNiX2NoaXBfb3BzID0gew0KPiAgIAkuY2hpcF90ZWFyZG93biA9IHBzYl9jaGlwX3Rl
YXJkb3duLA0KPiAgIA0KPiAgIAkuY3J0Y19oZWxwZXIgPSAmcHNiX2ludGVsX2hlbHBlcl9m
dW5jcywNCj4gLQkuY3J0Y19mdW5jcyA9ICZnbWFfY3J0Y19mdW5jcywNCj4gICAJLmNsb2Nr
X2Z1bmNzID0gJnBzYl9jbG9ja19mdW5jcywNCj4gICANCj4gICAJLm91dHB1dF9pbml0ID0g
cHNiX291dHB1dF9pbml0LA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9wc2JfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuaA0KPiBpbmRl
eCA4OGY0NGRiYmM0ZWIuLmFlZDE2N2FmMTNjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9wc2JfZHJ2LmgNCj4gQEAgLTU3OCw3ICs1NzgsNiBAQCBzdHJ1Y3QgcHNiX29wcyB7DQo+
ICAgDQo+ICAgCS8qIFN1YiBmdW5jdGlvbnMgKi8NCj4gICAJc3RydWN0IGRybV9jcnRjX2hl
bHBlcl9mdW5jcyBjb25zdCAqY3J0Y19oZWxwZXI7DQo+IC0Jc3RydWN0IGRybV9jcnRjX2Z1
bmNzIGNvbnN0ICpjcnRjX2Z1bmNzOw0KPiAgIAljb25zdCBzdHJ1Y3QgZ21hX2Nsb2NrX2Z1
bmNzICpjbG9ja19mdW5jczsNCj4gICANCj4gICAJLyogU2V0dXAgaG9va3MgKi8NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2Rpc3BsYXkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2Rpc3BsYXkuYw0KPiBpbmRleCA2
ZGY2MmZlN2MxZTAuLmE5OTg1OWI1YjEzYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9wc2JfaW50ZWxfZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2ludGVsX2Rpc3BsYXkuYw0KPiBAQCAtNDg4LDggKzQ4OCw3IEBAIHZv
aWQgcHNiX2ludGVsX2NydGNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgcGlw
ZSwNCj4gICAJCXJldHVybjsNCj4gICAJfQ0KPiAgIA0KPiAtCS8qIFNldCB0aGUgQ1JUQyBv
cGVyYXRpb25zIGZyb20gdGhlIGNoaXAgc3BlY2lmaWMgZGF0YSAqLw0KPiAtCWRybV9jcnRj
X2luaXQoZGV2LCAmZ21hX2NydGMtPmJhc2UsIGRldl9wcml2LT5vcHMtPmNydGNfZnVuY3Mp
Ow0KPiArCWRybV9jcnRjX2luaXQoZGV2LCAmZ21hX2NydGMtPmJhc2UsICZnbWFfY3J0Y19m
dW5jcyk7DQo+ICAgDQo+ICAgCS8qIFNldCB0aGUgQ1JUQyBjbG9jayBmdW5jdGlvbnMgZnJv
bSBjaGlwIHNwZWNpZmljIGRhdGEgKi8NCj4gICAJZ21hX2NydGMtPmNsb2NrX2Z1bmNzID0g
ZGV2X3ByaXYtPm9wcy0+Y2xvY2tfZnVuY3M7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------VqTnTD4AkC9HkJ5jIhhiB8kj--

--------------NcHwCvMt05w8XCc0IVNVaqVq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIzkN4FAwAAAAAACgkQlh/E3EQov+AZ
yBAAh9SscWZ10vcVHvwD06C6mFoQzUw7Tlk9piUrFGa6Dw2rec7eZH7afA+3eRMVE10nhNZBp9Y9
1VdNKhBgpZLSmkNy9LK0FxCaCoCLnu6aKBD3eY884qsk9h9o+zXmUIXVfs9fWb8KZAmS7PB64Knl
IRASnFGD1cbxRWI8aWC8o+XGceiO1Yxvh3dZZhz82WVO/vGrm7HHfMoP5eeivNv5grgNgvhydLsk
OMU87gyooh1VIyY6MHFkQwzdepSevuEYJJYvqVPA6tPaHyZRxN2jYk+qT1iJd1liqFc5xxtiFW/A
npmjPgg4QQkKX9c1vSPPRVKzMSEwRSvzeUMZVEKftrwxz2cidhPo+s9hCaYsANBMizT7o9JG4m3q
V8ux8RCKdMnVmTY4HoTRpHn8gkocCUC1ed6pWeZ0PDx4A/J8kRC5loVkCJHxc4oKVO3wGGOBVNOW
/Zhdy4pUqAxpxnDzgfNkKUgeFU9E2ZeK0DFS22GdCmRobvBv0Ubnvfc6ISrZ2b3Q4RXGludXW+we
ekAqYulA4bziyFzlVPmjZCS0HalILEIRcD6gp2LZXuuCDFMC4yXiC9TOwsauMLYJsTKS/JL3LpsT
aEQwEVQjv/8v1Hy4bQHR1b4IGqlA+89YlACyZN3G9lSe+7i//MJfxwaRsJJjt+EqKjMy50Ci7r8c
J5M=
=7B20
-----END PGP SIGNATURE-----

--------------NcHwCvMt05w8XCc0IVNVaqVq--
