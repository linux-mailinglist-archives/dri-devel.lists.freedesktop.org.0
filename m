Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D88432F2C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0D86EB10;
	Tue, 19 Oct 2021 07:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8036EB10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 07:17:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8247B21975;
 Tue, 19 Oct 2021 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634627867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=61XI4ewvMY5JPpY8KG858ojlpv6SnIRMkQyg9OpweSc=;
 b=Eyv3JFrrnWCieg2Y++mS+w2PSo2PWpRfXhbo/ROvdtA7ZHDPPpXIXVhSwcMswJjnbb6CzO
 kkhNiSU5otttT1S3G+0ec/2tDaTLKTwstkdfepEfdGaBATPnGxOLl2Bo7s6JYpusfCuv5K
 hSouaBzVQqruEoIdf5840G+1Jmthszk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634627867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=61XI4ewvMY5JPpY8KG858ojlpv6SnIRMkQyg9OpweSc=;
 b=B2a78AXz704Np3aj0EB4Xdlpn/j4GzibIg6Haz+9dWIngV++IS3foykpk09TZQZv5WMWvH
 zRoSUh6tsY7YF/BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 492FD13B64;
 Tue, 19 Oct 2021 07:17:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JS2aEBtxbmE0awAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Oct 2021 07:17:47 +0000
Message-ID: <f20d3359-1ec8-35ca-e885-bd35caa55c50@suse.de>
Date: Tue, 19 Oct 2021 09:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
Content-Language: en-US
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
 <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
 <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>
 <9dbd2c55-2c29-eb12-94d0-dbd5110c302e@suse.de>
 <4d573cd9-ac1b-59d6-fb97-e5c24152892b@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4d573cd9-ac1b-59d6-fb97-e5c24152892b@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0N0yv3CFk52J46vkmbvd0VhV"
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
--------------0N0yv3CFk52J46vkmbvd0VhV
Content-Type: multipart/mixed; boundary="------------J9O3N0Pm78Xm66h82sB0qHMk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <f20d3359-1ec8-35ca-e885-bd35caa55c50@suse.de>
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
 <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
 <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>
 <9dbd2c55-2c29-eb12-94d0-dbd5110c302e@suse.de>
 <4d573cd9-ac1b-59d6-fb97-e5c24152892b@gmail.com>
In-Reply-To: <4d573cd9-ac1b-59d6-fb97-e5c24152892b@gmail.com>

--------------J9O3N0Pm78Xm66h82sB0qHMk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTAuMjEgdW0gMjE6MzIgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFk
ZSBUb3JyZW50ZToNCj4gSGkgVGhvbWFzLA0KPiANCj4gT24gMTAvMTgvMjEgMzowNiBQTSwg
VGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDE4LjEwLjIxIHVt
IDE5OjQxIHNjaHJpZWIgSWdvciBNYXRoZXVzIEFuZHJhZGUgVG9ycmVudGU6DQo+Pj4gSGVs
bG8sDQo+Pj4NCj4+PiBPbiAxMC8xOC8yMSA3OjE0IEFNLCBUaG9tYXMgWmltbWVybWFubiB3
cm90ZToNCj4+Pj4gSGkNCj4+Pj4NCj4+Pj4gQW0gMDUuMTAuMjEgdW0gMjI6MTYgc2Nocmll
YiBJZ29yIE1hdGhldXMgQW5kcmFkZSBUb3JyZW50ZToNCj4+Pj4+IEN1cnJlbnRseSwgdGhl
IHZrbXMgYXRvbWljIGNoZWNrIG9ubHkgZ29lcyB0aHJvdWdoIHRoZSBmaXJzdCANCj4+Pj4+
IHBvc2l0aW9uIG9mDQo+Pj4+PiB0aGUgYHZrbXNfd2JfZm9ybWF0c2AgdmVjdG9yLg0KPj4+
Pj4NCj4+Pj4+IFRoaXMgY2hhbmdlIHByZXBhcmVzIHRoZSBhdG9taWNfY2hlY2sgdG8gY2hl
Y2sgdGhlIGVudGlyZSB2ZWN0b3IuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSWdv
ciBNYXRoZXVzIEFuZHJhZGUgVG9ycmVudGUgPGlnb3JtdG9ycmVudGVAZ21haWwuY29tPg0K
Pj4+Pj4gLS0tDQo+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFj
ay5jIHwgMTEgKysrKysrKysrKy0NCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMgDQo+Pj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMNCj4+Pj4+IGluZGV4IDVhM2UxMmYxMDVk
Yy4uNTY5NzhmNDk5MjAzIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc193cml0ZWJhY2suYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc193cml0ZWJhY2suYw0KPj4+Pj4gQEAgLTMwLDYgKzMwLDggQEAgc3RhdGljIGludCB2
a21zX3diX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCANCj4+Pj4+IGRybV9lbmNvZGVy
ICplbmNvZGVyLA0KPj4+Pj4gwqAgew0KPj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYjsNCj4+Pj4+IMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUgPSAmY3J0Y19zdGF0ZS0+bW9kZTsNCj4+Pj4+ICvCoMKgwqAgYm9v
bCBmb3JtYXRfc3VwcG9ydGVkID0gZmFsc2U7DQo+Pj4+PiArwqDCoMKgIGludCBpOw0KPj4+
Pj4gwqDCoMKgwqDCoCBpZiAoIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2IgfHwgDQo+Pj4+
PiAhY29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmIpDQo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7DQo+Pj4+PiBAQCAtNDEsNyArNDMsMTQgQEAgc3RhdGljIGludCB2
a21zX3diX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCANCj4+Pj4+IGRybV9lbmNvZGVy
ICplbmNvZGVyLA0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0K
Pj4+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4+PiAtwqDCoMKgIGlmIChmYi0+Zm9ybWF0LT5mb3Jt
YXQgIT0gdmttc193Yl9mb3JtYXRzWzBdKSB7DQo+Pj4+PiArwqDCoMKgIGZvciAoaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKHZrbXNfd2JfZm9ybWF0cyk7IGkrKykgew0KPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChmYi0+Zm9ybWF0LT5mb3JtYXQgPT0gdmttc193Yl9mb3JtYXRzW2ld
KSB7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3JtYXRfc3VwcG9ydGVkID0g
dHJ1ZTsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIH0NCj4+Pj4+ICvCoMKgwqAgfQ0KPj4+Pg0KPj4+PiBBdCBhIG1pbmlt
dW0sIHRoaXMgbG9vcCBzaG91bGQgYmUgaW4gYSBoZWxwZXIgZnVuY3Rpb24uIEJ1dCBtb3Jl
IA0KPj4+PiBnZW5lcmFsbHksIEknbSBzdXJwcmlzZWQgdGhhdCB0aGlzIGlzbid0IGFscmVh
ZHkgY292ZXJlZCBieSB0aGUgDQo+Pj4+IERSTSdzIGF0b21pYyBoZWxwZXJzLg0KPj4+DQo+
Pj4gT2ssIEkgY2FuIHdyYXAgaXQgaW4gYSBuZXcgZnVuY3Rpb24uDQo+Pj4NCj4+PiBBRkFJ
SyB0aGUgRFJNIGRvZXNuJ3QgY292ZXIgaXQuIEJ1dCBJIG1heSBiZSB3cm9uZy4uLg0KPj4N
Cj4+IEkgY291bGRuJ3QgZmluZCBhbnl0aGluZyBlaXRoZXIuDQo+Pg0KPj4gT3RoZXIgZHJp
dmVycyBkbyBzaW1pbGFyIGZvcm1hdCBhbmQgZnJhbWJ1ZmZlciBjaGVja3MuIFNvIEkgZ3Vl
c3MgYSANCj4+IGhlbHBlciBjb3VsZCBiZSBpbXBsZW1lbnRlZC4gQWxsIHBsYW5lJ3MgYXJl
IHN1cHBvc2VkIHRvIGNhbGwgDQo+PiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9z
dGF0ZSgpIGluIHRoZWlyIGF0b21pY19jaGVjaygpIGNvZGUuIA0KPj4gWW91IGNvdWxkIGFk
ZCBhIHNpbWlsYXIgaGVscGVyLCBzYXkgDQo+PiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja193
cml0ZWJhY2tfZW5jb2Rlcl9zdGF0ZSgpLCB0aGF0IHRlc3RzIGZvciB0aGUgDQo+PiBmb3Jt
YXQgYW5kIG1heWJlIG90aGVyIHRoaW5ncyBhcyB3ZWxsLg0KPiANCj4gRG8geW91IHRoaW5r
IHRoaXMgc2hvdWxkIGJlIGRvbmUgYmVmb3JlIG9yIGFmdGVyIHRoaXMgcGF0Y2ggc2VyaWVz
Pw0KDQpKdXN0IGFkZCBpdCBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzIGFuZCB1c2UgaXQgZm9y
IHZrbXMuIE90aGVyIGRyaXZlcnMgDQpjYW4gYWRvcHQgaXQgbGF0ZXIgb24uIFRoZSByY2Fy
LWR1IGNvZGUgWzFdIGxvb2tzIHNpbWlsYXIgdG8gdGhlIG9uZSBpbiANCnZrbXMuIE1heWJl
IHB1dCB0aGUgY29tbW9uIHRlc3RzIGluIHRvIHRoZSBuZXcgaGVscGVyLiBZb3UgY2FuIGV4
dHJhY3QgDQp0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgZm9ybWF0cyBmcm9tIHRoZSBwcm9wZXJ0
eSBibG9iLCBJIHRoaW5rLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNC4xMy9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYyNMMTQwDQoNCj4gDQo+Pg0KPj4g
QmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4NCj4+Pj4NCj4+Pj4gQmVzdCByZWdh
cmRzDQo+Pj4+IFRob21hcw0KPj4+Pg0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqDCoCBpZiAoIWZv
cm1hdF9zdXBwb3J0ZWQpIHsNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fREVCVUdf
S01TKCJJbnZhbGlkIHBpeGVsIGZvcm1hdCAlcDRjY1xuIiwNCj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZmYi0+Zm9ybWF0LT5mb3JtYXQpOw0KPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+Pj4NCj4+Pj4NCj4+
DQo+IA0KPiBUaGFua3MsDQo+IElnb3IgVG9ycmVudGUNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXINCg==

--------------J9O3N0Pm78Xm66h82sB0qHMk--

--------------0N0yv3CFk52J46vkmbvd0VhV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFucRoFAwAAAAAACgkQlh/E3EQov+AY
+g//UlL7Njx9WUILl5tQU5SJWc35krQzprjYxfzTvhP+LHIdynp3nVqQ8u1Mu9bjHQN8svvoPS1S
6QiJJrDyIJ6cZ9UU++lrmQNj9l4DyUSQvZz7u9HZg74AFoGhHXkKZBUXWp0F8Zvo5cFvwoiUeJzr
lMan7f5L4Nh/esX8lXRoADKAfJaez5AT2+b32i2ozIcvduMWj3Ll0c9WLo4n4hiECuX0+pZ7XgNi
l1Txet0Tc5qCSebfDKwIsmHwsdx+UIXsqnpQZZcyC4uvjb76z46h9fonu78axShjeQZTXR88442N
7MmYrCh6qWcAsDa5p1G99kZVr5bx5lyqPyrmH0+9vNCY0IYxoteiykjxYx80ssyzT3gQZeNlijcT
JPfinvLALtiW5kpNt9PYB2dmfzq712dDgY16zabMcWegKsFjdDLyoiRwBwMfLoKQpxcNjRxUpipG
yLViaJsgwGMHwiLPLMLP1cCEKMwQfO59MaDl/uryhPinfaNyFCai//4yNnjPLeusnTkdSYa83P4d
5wuIWWzdroFUvMiUIr4mudq6PEwJnMJPnIG2GtvKBnUGMo+pj7fSZVJx/eBEFovyZZBloBlTPF8n
r4BHy+71/UO20reQS+HvukgewjmXv/ADW61Q8Dc9yHP3CyTy0LO5IcoXnD3zZveVOr90jxij3Gz2
8yk=
=GJRF
-----END PGP SIGNATURE-----

--------------0N0yv3CFk52J46vkmbvd0VhV--
