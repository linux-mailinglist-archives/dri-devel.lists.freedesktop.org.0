Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F6472233
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E36010E369;
	Mon, 13 Dec 2021 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3A510E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:16:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B35121125;
 Mon, 13 Dec 2021 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639383358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5XQcvy2yfZFFzOfJbu4X9evV3nh1OglygLrjy33yKE=;
 b=o1+h1j+hDL58ciGfw72GuG7mG/3q2tl6mocsUt4CZyqO2zYysYf11c/by5GoBnGFUGde2R
 5UfoZCR1Ly9w3F0uysWB51z+zT9F5ZmNsXKapkxfEozGNkEQEoUcrhEtbaITiUtYQg9ij4
 4o4XWO53oUiCKj4aFmWYsZmYDQ/cReU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639383358;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5XQcvy2yfZFFzOfJbu4X9evV3nh1OglygLrjy33yKE=;
 b=qSKJz0GgNT8kZ3aBhULg1D2T9G+gqOxLfOVcVw6Ey6B3zWdAcHLz/QiqI2pWyad83JtYib
 cu3gln9lNy9pFKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2962D13310;
 Mon, 13 Dec 2021 08:15:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9qgcCT4Bt2GsAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 08:15:58 +0000
Message-ID: <0d4040da-b41a-897e-0a83-460a7df49954@suse.de>
Date: Mon, 13 Dec 2021 09:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-3-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211212062407.138309-3-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hTC59p8mittGQnLGd0vkqyNe"
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
Cc: devicetree@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hTC59p8mittGQnLGd0vkqyNe
Content-Type: multipart/mixed; boundary="------------wePNJRdvmEXZm0WSD0lroXum";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <0d4040da-b41a-897e-0a83-460a7df49954@suse.de>
Subject: Re: [PATCH v3 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-3-marcan@marcan.st>
In-Reply-To: <20211212062407.138309-3-marcan@marcan.st>

--------------wePNJRdvmEXZm0WSD0lroXum
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEyLjEyLjIxIHVtIDA3OjI0IHNjaHJpZWIgSGVjdG9yIE1hcnRpbjoNCj4gQWRk
IFhSR0I4ODg4IGVtdWxhdGlvbiBzdXBwb3J0IGZvciBkZXZpY2VzIHRoYXQgY2FuIG9ubHkg
ZG8gWFJHQjIxMDEwMTAuDQo+IA0KPiBUaGlzIGlzIGNoaWVmbHkgdXNlZnVsIGZvciBzaW1w
bGVkcm0gb24gQXBwbGUgZGV2aWNlcyB3aGVyZSB0aGUNCj4gYm9vdGxvYWRlci1wcm92aWRl
ZCBmcmFtZWJ1ZmZlciBpcyAxMC1iaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWN0b3Ig
TWFydGluIDxtYXJjYW5AbWFyY2FuLnN0Pg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggICAgIHwgIDMgKysN
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+IGluZGV4IGRiZTNlODMwMDk2ZS4uMGYyOGRk
MmJkZDcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxw
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBA
QCAtNDA5LDYgKzQwOSw2MSBAQCB2b2lkIGRybV9mYl94cmdiODg4OF90b19yZ2I4ODhfdG9p
byh2b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwNCj4gICB9DQo+
ICAgRVhQT1JUX1NZTUJPTChkcm1fZmJfeHJnYjg4ODhfdG9fcmdiODg4X3RvaW8pOw0KPiAg
IA0KPiArc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX2xpbmUo
dTMyICpkYnVmLCBjb25zdCB1MzIgKnNidWYsDQo+ICsJCQkJCQl1bnNpZ25lZCBpbnQgcGl4
ZWxzKQ0KPiArew0KPiArCXVuc2lnbmVkIGludCB4Ow0KPiArCXUzMiB2YWwzMjsNCj4gKw0K
PiArCWZvciAoeCA9IDA7IHggPCBwaXhlbHM7IHgrKykgew0KPiArCQl2YWwzMiA9ICgoc2J1
Zlt4XSAmIDB4MDAwMDAwRkYpIDw8IDIpIHwNCj4gKwkJCSgoc2J1Zlt4XSAmIDB4MDAwMEZG
MDApIDw8IDQpIHwNCj4gKwkJCSgoc2J1Zlt4XSAmIDB4MDBGRjAwMDApIDw8IDYpOw0KPiAr
CQkqZGJ1ZisrID0gdmFsMzIgfCAoKHZhbDMyID4+IDgpICYgMHgwMDMwMEMwMyk7DQo+ICsJ
fQ0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGRybV9mYl94cmdiODg4OF90b194cmdiMjEw
MTAxMF90b2lvIC0gQ29udmVydCBYUkdCODg4OCB0byBYUkdCMjEwMTAxMCBjbGlwDQo+ICsg
KiBidWZmZXINCj4gKyAqIEBkc3Q6IFhSR0IyMTAxMDEwIGRlc3RpbmF0aW9uIGJ1ZmZlciAo
aW9tZW0pDQo+ICsgKiBAZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28g
Y29uc2VjdXRpdmUgc2NhbmxpbmVzIHdpdGhpbiBkc3QNCj4gKyAqIEB2YWRkcjogWFJHQjg4
ODggc291cmNlIGJ1ZmZlcg0KPiArICogQGZiOiBEUk0gZnJhbWVidWZmZXINCj4gKyAqIEBj
bGlwOiBDbGlwIHJlY3RhbmdsZSBhcmVhIHRvIGNvcHkNCj4gKyAqDQo+ICsgKiBEcml2ZXJz
IGNhbiB1c2UgdGhpcyBmdW5jdGlvbiBmb3IgWFJHQjIxMDEwMTAgZGV2aWNlcyB0aGF0IGRv
bid0IG5hdGl2ZWx5DQo+ICsgKiBzdXBwb3J0IFhSR0I4ODg4Lg0KPiArICovDQo+ICt2b2lk
IGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMF90b2lvKHZvaWQgX19pb21lbSAqZHN0
LA0KPiArCQkJCQkgdW5zaWduZWQgaW50IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqdmFkZHIs
DQo+ICsJCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCQkJ
IGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkNCj4gK3sNCj4gKwlzaXplX3QgbGluZXBp
eGVscyA9IGNsaXAtPngyIC0gY2xpcC0+eDE7DQo+ICsJc2l6ZV90IGRzdF9sZW4gPSBsaW5l
cGl4ZWxzICogc2l6ZW9mKHUzMik7DQo+ICsJdW5zaWduZWQgaW50IHksIGxpbmVzID0gY2xp
cC0+eTIgLSBjbGlwLT55MTsNCj4gKwl2b2lkICpkYnVmOw0KPiArDQo+ICsJaWYgKCFkc3Rf
cGl0Y2gpDQo+ICsJCWRzdF9waXRjaCA9IGRzdF9sZW47DQo+ICsNCj4gKwlkYnVmID0ga21h
bGxvYyhkc3RfbGVuLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWRidWYpDQo+ICsJCXJldHVy
bjsNCj4gKw0KPiArCXZhZGRyICs9IGNsaXBfb2Zmc2V0KGNsaXAsIGZiLT5waXRjaGVzWzBd
LCBzaXplb2YodTMyKSk7DQo+ICsJZm9yICh5ID0gMDsgeSA8IGxpbmVzOyB5KyspIHsNCj4g
KwkJZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX2xpbmUoZGJ1ZiwgdmFkZHIsIGxp
bmVwaXhlbHMpOw0KPiArCQltZW1jcHlfdG9pbyhkc3QsIGRidWYsIGRzdF9sZW4pOw0KPiAr
CQl2YWRkciArPSBmYi0+cGl0Y2hlc1swXTsNCj4gKwkJZHN0ICs9IGRzdF9waXRjaDsNCj4g
Kwl9DQo+ICsNCj4gKwlrZnJlZShkYnVmKTsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woZHJt
X2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX3RvaW8pOw0KPiArDQo+ICAgLyoqDQo+ICAg
ICogZHJtX2ZiX3hyZ2I4ODg4X3RvX2dyYXk4IC0gQ29udmVydCBYUkdCODg4OCB0byBncmF5
c2NhbGUNCj4gICAgKiBAZHN0OiA4LWJpdCBncmF5c2NhbGUgZGVzdGluYXRpb24gYnVmZmVy
DQo+IEBAIC01MDAsNiArNTU1LDEwIEBAIGludCBkcm1fZmJfYmxpdF90b2lvKHZvaWQgX19p
b21lbSAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCB1aW50MzJfdCBkc3RfZm9yDQo+
ICAgCQlmYl9mb3JtYXQgPSBEUk1fRk9STUFUX1hSR0I4ODg4Ow0KPiAgIAlpZiAoZHN0X2Zv
cm1hdCA9PSBEUk1fRk9STUFUX0FSR0I4ODg4KQ0KPiAgIAkJZHN0X2Zvcm1hdCA9IERSTV9G
T1JNQVRfWFJHQjg4ODg7DQo+ICsJaWYgKGZiX2Zvcm1hdCA9PSBEUk1fRk9STUFUX0FSR0Iy
MTAxMDEwKQ0KPiArCQlmYl9mb3JtYXQgPSBEUk1fRk9STUFUX1hSR0IyMTAxMDEwOw0KPiAr
CWlmIChkc3RfZm9ybWF0ID09IERSTV9GT1JNQVRfQVJHQjIxMDEwMTApDQo+ICsJCWRzdF9m
b3JtYXQgPSBEUk1fRk9STUFUX1hSR0IyMTAxMDEwOw0KPiAgIA0KPiAgIAlpZiAoZHN0X2Zv
cm1hdCA9PSBmYl9mb3JtYXQpIHsNCj4gICAJCWRybV9mYl9tZW1jcHlfdG9pbyhkc3QsIGRz
dF9waXRjaCwgdm1hcCwgZmIsIGNsaXApOw0KPiBAQCAtNTE1LDYgKzU3NCwxMSBAQCBpbnQg
ZHJtX2ZiX2JsaXRfdG9pbyh2b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9w
aXRjaCwgdWludDMyX3QgZHN0X2Zvcg0KPiAgIAkJCWRybV9mYl94cmdiODg4OF90b19yZ2I4
ODhfdG9pbyhkc3QsIGRzdF9waXRjaCwgdm1hcCwgZmIsIGNsaXApOw0KPiAgIAkJCXJldHVy
biAwOw0KPiAgIAkJfQ0KPiArCX0gZWxzZSBpZiAoZHN0X2Zvcm1hdCA9PSBEUk1fRk9STUFU
X1hSR0IyMTAxMDEwKSB7DQo+ICsJCWlmIChmYl9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YUkdC
ODg4OCkgew0KPiArCQkJZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX3RvaW8oZHN0
LCBkc3RfcGl0Y2gsIHZtYXAsIGZiLCBjbGlwKTsNCj4gKwkJCXJldHVybiAwOw0KPiArCQl9
DQo+ICAgCX0NCj4gICANCj4gICAJcmV0dXJuIC1FSU5WQUw7DQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Zvcm1h
dF9oZWxwZXIuaA0KPiBpbmRleCA5N2U0YzMyMjNhZjMuLmIzMGVkNWRlMGEzMyAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPiArKysgYi9pbmNs
dWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+IEBAIC0zMyw2ICszMyw5IEBAIHZvaWQg
ZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OCh2b2lkICpkc3QsIHVuc2lnbmVkIGludCBkc3Rf
cGl0Y2gsIGNvbnN0IHZvaWQgKnNyDQo+ICAgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdi
ODg4X3RvaW8odm9pZCBfX2lvbWVtICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsDQo+
ICAgCQkJCSAgICBjb25zdCB2b2lkICp2YWRkciwgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIsDQo+ICAgCQkJCSAgICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0K
PiArdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTBfdG9pbyh2b2lkIF9faW9t
ZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwNCj4gKwkJCQkJIGNvbnN0IHZvaWQg
KnZhZGRyLCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCQkJIGNv
bnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7DQo+ICAgdm9pZCBkcm1fZmJfeHJnYjg4ODhf
dG9fZ3JheTgodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lk
ICp2YWRkciwNCj4gICAJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YiwgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4gICANCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------wePNJRdvmEXZm0WSD0lroXum--

--------------hTC59p8mittGQnLGd0vkqyNe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG3AT0FAwAAAAAACgkQlh/E3EQov+D5
bg/+N4lgXBROxrPyzjfUIW9EEMyBGtuXHlqdyC9mDZXb+OyFjl+lZuKz+H9UxdV98OB7asJ5rWpl
4P28aZjPkYVfS12exkma+pHsX7b3xnHnj1KrfXmaN54bhhD9y99TDMiyh6tDndyjz19rjBFvlc0j
xrLKx+K8glHmkr9s1hBX9ddTG0niOVTfFW3XdsyQ4fxQTRqLVYKTF/o4WGxwZrUQa67AA8RwNIyE
u91MK3smlBEC5QKJlNOwKyyDrwnxUK7VNizziVoHtGcQ7aEzXZo55ZjlR9DYwXlcwy3H0IpiLnD3
dt8YdInYQaaPG00Snz0AnwMqTz9FEFMT3rP60UMaqLXZdXPbJBM5eze88JdQpkMNcbcRCob7pIvF
WIMQYaOrhYhaztAQY+woNQqeZ2QADSLgN39Ul6K/x6yuLxEikSDOPBrWjRKy1SAfcYFB1f+eg6LM
hjOIvc84Usz/04DUidJyzEaD1CVcSuu/wm/eIXp+5ZVyVpIIb/BUTv0+j82PVsb2lc5VA/r6X/mx
FqTeThLy7YPptGJBDL3b6M/yo6Wi/U4L2lcPFlyNBpzvLmW8jUnHDATSabeYFojIIQaZBfiKsG5z
KhjPMH5iC4uD1PsgCPN+XdjUEpxfHy48PGuaAagePGpDYEKJLCGiRg3TFArrf5tX3czy8TfppBI6
d/A=
=pE4x
-----END PGP SIGNATURE-----

--------------hTC59p8mittGQnLGd0vkqyNe--
