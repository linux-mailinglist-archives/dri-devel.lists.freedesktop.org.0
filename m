Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F154110D0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750EF89FD4;
	Mon, 20 Sep 2021 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D3489FD4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:17:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A472D20040;
 Mon, 20 Sep 2021 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632125832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlvArk2LrzTX1DFBLWBhfR1GWQExq1j7zO7vLtNwSg0=;
 b=XWVTsrGfIQ4VokqkS8eL9uSMtjVe0Nt01sbv9FkNAVMSIiCvSamb3FwPhdQXe90cdzdrDi
 2gnJbKOPx5aYBefKzF9Wynm+S3rTvG0E39m5zmKQMmS09ci7hYGCUuEek19GGH5iAXMdtL
 oO/KtuXYa4N7tacpOQP1kfA/oQqAspY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632125832;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlvArk2LrzTX1DFBLWBhfR1GWQExq1j7zO7vLtNwSg0=;
 b=2XUKdDGKaw/5Jz1QjQ/7tSljLVSSbLKajYfC6RdxJnAXZFLBqD8pi9R1YUpBB3VGxh9fB+
 /IFPew5xU8A3meAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69AC913ACC;
 Mon, 20 Sep 2021 08:17:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O+K1GIhDSGE7FgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 08:17:12 +0000
Message-ID: <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
Date: Mon, 20 Sep 2021 10:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] drm/ast: Atomic CR/SR reg R/W
Content-Language: en-US
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J0tzjfeHbIuZ7U4SSOmk2mP1"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J0tzjfeHbIuZ7U4SSOmk2mP1
Content-Type: multipart/mixed; boundary="------------fwHSHDrLxK530AXw5btAj8YY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com
Message-ID: <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
Subject: Re: [PATCH] drm/ast: Atomic CR/SR reg R/W
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>

--------------fwHSHDrLxK530AXw5btAj8YY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDkuMjEgdW0gMDk6MjIgc2NocmllYiBLdW9Ic2lhbmcgQ2hvdToNCj4g
MS4gQXZvaWQgSU8taW5kZXggcmFjaW5nDQo+IDIuIElPLWluZGV4IHJhY2luZyBoYXBwZW5l
ZCBvbiByZXNvbHVzdGlvbiBzd2l0Y2hpbmcNCj4gICAgIGFuZCBtb3VzZSBtb3ZpbmcgYXQg
dGhlIHNhbWUgdGltZQ0KPiAzLiBTeXN0ZW0gaHVuZyB3aGlsZSBJTy1pbmRleCByYWNpbmcg
b2NjdXJyZWQuDQoNCkknZCBzYXkgdGhhdCB0aGVyZSdzIHNvbWV0aGluZyBlbHNlIGdvaW5n
IG9uZSBoZXJlLiBNb2RlIHNldHRpbmcgYW5kIA0KY3Vyc29yIG1vdmVtZW50IHNob3VsZCBi
ZSBwcm90ZWN0ZWQgYWdhaW5zdCBlYWNoIG90aGVyIGJ5IERSTSBsb2NraW5nLiANCkNoYW5n
aW5nIHRoZXNlIGxvdy1sZXZlbCBmdW5jdGlvbnMgd291bGQgbm90IHNvbHZlIHRoZSBpc3N1
ZXMuIEknbGwgdHJ5IA0KdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIEFTQVAuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEt1b0hzaWFuZyBDaG91
IDxrdW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfbWFpbi5jIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
YWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gaW5kZXggNzlhMzYx
ODY3Li4xZDhmYTcwYzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gQEAg
LTQxLDI4ICs0MSw1MiBAQCB2b2lkIGFzdF9zZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFz
dF9wcml2YXRlICphc3QsDQo+ICAgCQkJICAgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5k
ZXgsDQo+ICAgCQkJICAgIHVpbnQ4X3QgbWFzaywgdWludDhfdCB2YWwpDQo+ICAgew0KPiAt
CXU4IHRtcDsNCj4gLQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPiAtCXRt
cCA9IChhc3RfaW9fcmVhZDgoYXN0LCBiYXNlICsgMSkgJiBtYXNrKSB8IHZhbDsNCj4gLQlh
c3Rfc2V0X2luZGV4X3JlZyhhc3QsIGJhc2UsIGluZGV4LCB0bXApOw0KPiArCXVpbnQxNl90
IHZvbGF0aWxlIHVzRGF0YTsNCj4gKwl1aW50OF90ICB2b2xhdGlsZSBqRGF0YTsNCj4gKw0K
PiArCWRvIHsNCj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4gKwkJ
dXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPiArCX0gd2hpbGUgKCh1aW50
OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4gKw0KPiArCWpEYXRhICA9ICh1aW50OF90KSh1
c0RhdGEgPj4gOCk7DQo+ICsJakRhdGEgJj0gbWFzazsNCj4gKwlqRGF0YSB8PSB2YWw7DQo+
ICsJdXNEYXRhID0gKCh1aW50MTZfdCkgakRhdGEgPDwgOCkgfCAodWludDE2X3QpIGluZGV4
Ow0KPiArCWFzdF9pb193cml0ZTE2KGFzdCwgYmFzZSwgdXNEYXRhKTsNCj4gICB9DQo+IA0K
PiAgIHVpbnQ4X3QgYXN0X2dldF9pbmRleF9yZWcoc3RydWN0IGFzdF9wcml2YXRlICphc3Qs
DQo+ICAgCQkJICB1aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4KQ0KPiAgIHsNCj4gLQl1
aW50OF90IHJldDsNCj4gLQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPiAt
CXJldCA9IGFzdF9pb19yZWFkOChhc3QsIGJhc2UgKyAxKTsNCj4gLQlyZXR1cm4gcmV0Ow0K
PiArCXVpbnQxNl90IHZvbGF0aWxlIHVzRGF0YTsNCj4gKwl1aW50OF90ICB2b2xhdGlsZSBq
RGF0YTsNCj4gKw0KPiArCWRvIHsNCj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGlu
ZGV4KTsNCj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPiArCX0g
d2hpbGUgKCh1aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4gKw0KPiArCWpEYXRhICA9
ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+ICsNCj4gKwlyZXR1cm4gakRhdGE7DQo+ICAg
fQ0KPiANCj4gICB1aW50OF90IGFzdF9nZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9w
cml2YXRlICphc3QsDQo+ICAgCQkJICAgICAgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5k
ZXgsIHVpbnQ4X3QgbWFzaykNCj4gICB7DQo+IC0JdWludDhfdCByZXQ7DQo+IC0JYXN0X2lv
X3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4gLQlyZXQgPSBhc3RfaW9fcmVhZDgoYXN0
LCBiYXNlICsgMSkgJiBtYXNrOw0KPiAtCXJldHVybiByZXQ7DQo+ICsJdWludDE2X3Qgdm9s
YXRpbGUgdXNEYXRhOw0KPiArCXVpbnQ4X3QgIHZvbGF0aWxlIGpEYXRhOw0KPiArDQo+ICsJ
ZG8gew0KPiArCQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPiArCQl1c0Rh
dGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwgYmFzZSk7DQo+ICsJfSB3aGlsZSAoKHVpbnQ4X3Qp
KHVzRGF0YSkgIT0gaW5kZXgpOw0KPiArDQo+ICsJakRhdGEgID0gKHVpbnQ4X3QpKHVzRGF0
YSA+PiA4KTsNCj4gKwlqRGF0YSAmPSBtYXNrOw0KPiArDQo+ICsJcmV0dXJuIGpEYXRhOw0K
PiAgIH0NCj4gDQo+ICAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9jb25maWdfbW9kZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIgKnNjdV9yZXYpDQo+IC0tDQo+IDIuMTguNA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------fwHSHDrLxK530AXw5btAj8YY--

--------------J0tzjfeHbIuZ7U4SSOmk2mP1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFIQ4cFAwAAAAAACgkQlh/E3EQov+DI
/A/8D9ziwgXT1JJnyk7haI/HX8w/TemA5X9WGNrid06BGeU7hIlZWWka2IZlg3y1MB/8e9TFaEoF
pgBlOWk8Husm/zKe0N7OFvf/xiYe4PzLCf89L2cOVY4noxe1fazntVxYPjexW8H5Ah7lZLAdoZTw
Gb1LcP1zQ2Ngg3KB5O8wwzBoNYBpz+8gNKhW/jl51KSRr7jdTgKSQaFJMoGzUCsxvcl9QRBSgRVx
UGQyDnXtngLpv/GzrkeLqxe1DLm8xZvYMfdAaOCxeBrzMQW7bRZJdfaoBSsdurGwQwqoSmKHx7Yj
QMmVUxB660801Bw3X1p995SUsdR1rQje1X6MyJ8GnUckUlMExpM8s0yNuerCqsdov/v6cb/pdjEL
ekP34oDpu58RQH3J2wRCENWmrViJrPtJb3NDvnhLSjvnUjKq7+6CY65cFIyH+QwQCn41KZL4+cbg
ngrQglMWs3gxXxrxTpI9RYtOFk8K1NuvBKJgrD3+i1yWkERYgFWISpSuyFXHAnBrQzJrLnWMx9xU
VG6HIhhSbgTh5BzFShawHGPPgwjxgj0lZtnLFaOR8Yb4TD+mlLrUOvi98/XdksepEKlGy7z97mho
3EWaFd4ByC1WNaTg5GT1QARwLpG/vUCEOK8PVv0Ek/WgT3st8ANq6s1z/2SOtmGKVXBCPZsiJNcR
nPA=
=GHkq
-----END PGP SIGNATURE-----

--------------J0tzjfeHbIuZ7U4SSOmk2mP1--
