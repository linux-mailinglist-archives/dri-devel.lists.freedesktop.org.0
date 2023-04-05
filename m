Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972646D769C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7968B10E866;
	Wed,  5 Apr 2023 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0010E864;
 Wed,  5 Apr 2023 08:15:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82E9722A0C;
 Wed,  5 Apr 2023 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680682558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kwcy03IAwt/j6MA5gbkQA9uJVPqeDwduNTy2ePvnbVc=;
 b=1dBEhUhTpEnCBc2fFXxTYbTAW0ckD1C2ZJq7V3CQY/cv3VlWoQQklRxPTCRFzLn/olWw1E
 clH4+Mr3Z7dwingle18Pa9LIYoE6eAIE+jDpKItGmtd8Vn9bZAVXXV52XA7bA6J9Ng70gf
 ke4nY0RdfH9zr8De09wz7YHJpXj235g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680682558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kwcy03IAwt/j6MA5gbkQA9uJVPqeDwduNTy2ePvnbVc=;
 b=YapbTBEtypxRgiQFncpMkBpvCSSf4tuUk288TpJFGxGkiikYvYiAQ+CUe1KkuDic1X0Ni+
 YOJe4FcKCHKg2/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E3A213A10;
 Wed,  5 Apr 2023 08:15:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k+QDFj4uLWR6OwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 08:15:58 +0000
Message-ID: <f00a1032-51bc-e556-6c0a-475e3ea89eb3@suse.de>
Date: Wed, 5 Apr 2023 10:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <CAMeQTsYH=gMv--qoOpQEc8-ozsW6ocN6zhw=Mjjat3L_xw=vwA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsYH=gMv--qoOpQEc8-ozsW6ocN6zhw=Mjjat3L_xw=vwA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dS9tmnWeZ4IeOWEBm0V5Yj0P"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dS9tmnWeZ4IeOWEBm0V5Yj0P
Content-Type: multipart/mixed; boundary="------------dZ3cd3vEkkD70KmHXBec7OcU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <f00a1032-51bc-e556-6c0a-475e3ea89eb3@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <CAMeQTsYH=gMv--qoOpQEc8-ozsW6ocN6zhw=Mjjat3L_xw=vwA@mail.gmail.com>
In-Reply-To: <CAMeQTsYH=gMv--qoOpQEc8-ozsW6ocN6zhw=Mjjat3L_xw=vwA@mail.gmail.com>

--------------dZ3cd3vEkkD70KmHXBec7OcU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF0cmlrDQoNCkFtIDA1LjA0LjIzIHVtIDEwOjA1IHNjaHJpZWIgUGF0cmlrIEpha29i
c3NvbjoNCj4gT24gV2VkLCBBcHIgNSwgMjAyMyBhdCA5OjQ54oCvQU0gVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4g
QW0gMDQuMDQuMjMgdW0gMjI6MTggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+IFRoaXMg
b25lIG51a2VzIGFsbCBmcmFtZWJ1ZmZlcnMsIHdoaWNoIGlzIGEgYml0IG11Y2guIEluIHJl
YWxpdHkNCj4+PiBnbWE1MDAgaXMgaWdwdSBhbmQgbmV2ZXIgc2hpcHBlZCB3aXRoIGFueXRo
aW5nIGRpc2NyZXRlLCBzbyB0aGVyZSBzaG91bGQNCj4+PiBub3QgYmUgYW55IGRpZmZlcmVu
Y2UuDQo+Pj4NCj4+PiB2MjogVW5mb3J0dW5hdGVseSB0aGUgZnJhbWVidWZmZXIgc2l0cyBv
dXRzaWRlIG9mIHRoZSBwY2kgYmFycyBmb3INCj4+PiBnbWE1MDAsIGFuZCBzbyBvbmx5IHVz
aW5nIHRoZSBwY2kgaGVscGVycyB3b24ndCBiZSBlbm91Z2guIE90b2ggaWYgd2UNCj4+PiBv
bmx5IHVzZSBub24tcGNpIGhlbHBlciwgdGhlbiB3ZSBkb24ndCBnZXQgdGhlIHZnYSBoYW5k
bGluZywgYW5kDQo+Pj4gc3Vic2VxdWVudCByZWZhY3RvcmluZyB0byB1bnRhbmdsZSB0aGVz
ZSBzcGVjaWFsIGNhc2VzIHdvbid0IHdvcmsuDQo+Pj4NCj4+PiBJdCdzIG5vdCBwcmV0dHks
IGJ1dCB0aGUgc2ltcGxlc3QgZml4IChzaW5jZSBnbWE1MDAgcmVhbGx5IGlzIHRoZSBvbmx5
DQo+Pj4gcXVpcmt5IHBjaSBkcml2ZXIgbGlrZSB0aGlzIHdlIGhhdmUpIGlzIHRvIGp1c3Qg
aGF2ZSBib3RoIGNhbGxzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+Pj4gQ2M6IFBhdHJpayBKYWtvYnNzb24g
PHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb20+DQo+Pj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+IENjOiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL3BzYl9kcnYuYyB8IDkgKysrKysrKy0tDQo+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvcHNiX2Rydi5jDQo+Pj4gaW5kZXggMmNlOTZiMWI5Yzc0Li5mMWUwZWVk
OGZlYTQgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYw0KPj4+IEBA
IC00MjIsMTIgKzQyMiwxNyBAQCBzdGF0aWMgaW50IHBzYl9wY2lfcHJvYmUoc3RydWN0IHBj
aV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpDQo+Pj4NCj4+
PiAgICAgICAgLyoNCj4+PiAgICAgICAgICogV2UgY2Fubm90IHlldCBlYXNpbHkgZmluZCB0
aGUgZnJhbWVidWZmZXIncyBsb2NhdGlvbiBpbiBtZW1vcnkuIFNvDQo+Pj4gLSAgICAgICog
cmVtb3ZlIGFsbCBmcmFtZWJ1ZmZlcnMgaGVyZS4NCj4+PiArICAgICAgKiByZW1vdmUgYWxs
IGZyYW1lYnVmZmVycyBoZXJlLiBOb3RlIHRoYXQgd2Ugc3RpbGwgd2FudCB0aGUgcGNpIHNw
ZWNpYWwNCj4+PiArICAgICAgKiBoYW5kbGluZyB0byBraWNrIG91dCB2Z2Fjb24uDQo+Pj4g
ICAgICAgICAqDQo+Pj4gICAgICAgICAqIFRPRE86IFJlZmFjdG9yIHBzYl9kcml2ZXJfbG9h
ZCgpIHRvIG1hcCB2ZGNfcmVnIGVhcmxpZXIuIFRoZW4gd2UNCj4+PiAgICAgICAgICogICAg
ICAgbWlnaHQgYmUgYWJsZSB0byByZWFkIHRoZSBmcmFtZWJ1ZmZlciByYW5nZSBmcm9tIHRo
ZSBkZXZpY2UuDQo+Pj4gICAgICAgICAqLw0KPj4+IC0gICAgIHJldCA9IGRybV9hcGVydHVy
ZV9yZW1vdmVfZnJhbWVidWZmZXJzKHRydWUsICZkcml2ZXIpOw0KPj4+ICsgICAgIHJldCA9
IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKGZhbHNlLCAmZHJpdmVyKTsNCj4+
PiArICAgICBpZiAocmV0KQ0KPj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+PiAr
DQo+Pj4gKyAgICAgcmV0ID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lf
ZnJhbWVidWZmZXJzKHBkZXYsICZkcml2ZXIpOw0KPj4NCj4+IFRoaXMgc2ltcGx5IGlzbid0
IGl0LiBJZiB5b3UgaGF2ZSB0byB3b3JrIGFyb3VuZCB5b3VyIG93biBBUEksIGl0J3MgdGlt
ZQ0KPj4gdG8gcmV0aGluayB0aGUgQVBJLg0KPiANCj4gV291bGQgaXQgaGVscCBpZiB3ZSBm
aWd1cmUgb3V0IHRoZSBzdG9sZW4gcmFuZ2UgaGVyZT8gSXQgY2FuDQo+IHN1cHBvc2VkbHkg
YmUgZm91bmQgYnkgcmVhZGluZyBwY2kgY29uZmlnIHNwYWNlLCBzbyBubyBuZWVkIHRvIG1h
cCB2ZGMNCj4gcmVncyBmaXJzdC4NCj4gDQo+IEdCU00gaXMgdGhlIHN0b2xlbiBiYXNlIGFu
ZCBUT0xVRCAtIEdCU00gPSBzdG9sZW4gc2l6ZS4gT3IgcmVhZCB0aGUNCj4gc2l6ZSBvdXQg
ZnJvbSBHR0MuIE5vdCBzdXJlIHdoaWNoIG9uZSBpcyBtb3JlIHJlbGlhYmxlLg0KDQpTZWUg
bXkgb3RoZXIgZW1haWwgaGVyZS4gV2UnZCBzdGlsbCBuZWVkIGEgbmljZSBpbnRlcmZhY2Ug
Zm9yIHRoZSANCmFwZXJ0dXJlIGhlbHBlcnMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IC1QYXRyaWsNCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+
DQo+Pj4gICAgICAgIGlmIChyZXQpDQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIHJldDsN
Cj4+Pg0KPj4NCj4+IC0tDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------dZ3cd3vEkkD70KmHXBec7OcU--

--------------dS9tmnWeZ4IeOWEBm0V5Yj0P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtLj0FAwAAAAAACgkQlh/E3EQov+CQ
8Q//UW2yp3qaPbBTXKjWBBb12ya0MkukspkCYb36VMMUAlrohvqSMbK69coLdwRm03rLswq4Ms4s
nwp0lMUNj3sqdJvj354wlGrYueRLCgTbdAvEoYIC8rab1TDgxqLVEKXyXTkk9Kfx0dC3XHw9ZgEC
+gTPCc/0fefUofpMyIczVNX/7cxWXKX97phxH6vgZUJWv1N1pUrWThKEV0OlJuY+Rq9KbxFsI1a0
vzGM2gHdHcmWz2PlxL8J6Non0dQnxeRx2pAx8as3p7+Cv8f32zBi2s3k/dfp550r56UPLO3X6fyM
SfOzq+Ejf1e4gKMzAsjlCohsKElvuxQboXgSApbctECYjfK+jRzHu1Oszwi1rFKGTn2U6pm2BNCH
+gJZdznbaQpkqm++pyJUcvtfCqo9IW3pG8pFs1QX5QaIwmJTPSoCv5//MxWcx+X2RXV/0Apcf40p
CvchaWzMFBv/BfbzDLkZxxsowk4Y/Ra/WkgEALInOdTmMhN418H5hVpGWAYDwjieRvPXphmkIQc9
hmGfJs8UXrzCb5IR2xwKnXzGGehX58ZHwGJdDYj/zUeqphsF7MeHeQcGPw0CswDE5hCFBq+oxCbw
Fd1UAZC7wj/JVkmz09ZFAJ4isZjR8vlrcy8Mkkd/vDUQSBfIpvt9nC3Qe4k6R+0q09XGRqcvkMYb
S00=
=nkqU
-----END PGP SIGNATURE-----

--------------dS9tmnWeZ4IeOWEBm0V5Yj0P--
