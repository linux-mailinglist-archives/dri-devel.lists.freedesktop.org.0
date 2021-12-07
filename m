Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74346B7A3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 10:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13306E4CD;
	Tue,  7 Dec 2021 09:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182716E4CD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 09:40:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ABC8D212C3;
 Tue,  7 Dec 2021 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638870008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGOwNbAQGVIBF7UmNtlxW+k8rlp9WwMteRqlEQpQndc=;
 b=1jxuTRjO5lBuEpANILgwYKy2C3YAiJJ09hb6se6vV1Eshpg3adQx/VLBKHozTMScym8MSa
 By3vzdIpCh2tgRswEC3rTEifpimuJDNyajWgcp/3+LGnpe2dwz/6kFetyxXTGJXnyEXMfZ
 q1CMaCokFGyVCOtF4LVGH4j6lxIPPo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638870008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGOwNbAQGVIBF7UmNtlxW+k8rlp9WwMteRqlEQpQndc=;
 b=9oW2IOzS9fT3jefAF9b1YtJlfSmEGwkGT1cxB9sOhUd9tncLtfvxOc4QKV2uTdPMyjfhrC
 30gaYCqx7hUwzcDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 702C1139F0;
 Tue,  7 Dec 2021 09:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Rs9BGvgrr2HSWAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 09:40:08 +0000
Message-ID: <03a52a64-7be3-b401-7711-b7b1452f433d@suse.de>
Date: Tue, 7 Dec 2021 10:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-3-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211207072943.121961-3-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Q0UzHGc5hdA1B5jj5ZE6I2GI"
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Q0UzHGc5hdA1B5jj5ZE6I2GI
Content-Type: multipart/mixed; boundary="------------v792wfspeNDV9pFwEXetWoU0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <03a52a64-7be3-b401-7711-b7b1452f433d@suse.de>
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-3-marcan@marcan.st>
In-Reply-To: <20211207072943.121961-3-marcan@marcan.st>

--------------v792wfspeNDV9pFwEXetWoU0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjEgdW0gMDg6Mjkgc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBB
ZGQgWFJHQjg4ODggZW11bGF0aW9uIHN1cHBvcnQgZm9yIGRldmljZXMgdGhhdCBjYW4gb25s
eSBkbyBYUkdCMjEwMTAxMC4NCj4gDQo+IFRoaXMgaXMgY2hpZWZseSB1c2VmdWwgZm9yIHNp
bXBsZWRybSBvbiBBcHBsZSBkZXZpY2VzIHdoZXJlIHRoZQ0KPiBib290bG9hZGVyLXByb3Zp
ZGVkIGZyYW1lYnVmZmVyIGlzIDEwLWJpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlY3Rv
ciBNYXJ0aW4gPG1hcmNhbkBtYXJjYW4uc3Q+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZm9ybWF0X2hlbHBlci5jIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gICBpbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oICAgICB8ICAzICsrDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBpbmRleCBkYmUzZTgzMDA5NmUuLmVkZDYxMWQz
YWI2YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVy
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4gQEAg
LTQwOSw2ICs0MDksNTkgQEAgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiODg4X3RvaW8o
dm9pZCBfX2lvbWVtICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsDQo+ICAgfQ0KPiAg
IEVYUE9SVF9TWU1CT0woZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OF90b2lvKTsNCj4gICAN
Cj4gK3N0YXRpYyB2b2lkIGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMF9saW5lKHUz
MiAqZGJ1ZiwgY29uc3QgdTMyICpzYnVmLA0KPiArCQkJCQkJdW5zaWduZWQgaW50IHBpeGVs
cykNCj4gK3sNCj4gKwl1bnNpZ25lZCBpbnQgeDsNCj4gKw0KPiArCWZvciAoeCA9IDA7IHgg
PCBwaXhlbHM7IHgrKykgew0KPiArCQkqZGJ1ZisrID0gKChzYnVmW3hdICYgMHgwMDAwMDBG
RikgPDwgMikgfA0KPiArCQkJICAoKHNidWZbeF0gJiAweDAwMDBGRjAwKSA8PCA0KSB8DQo+
ICsJCQkgICgoc2J1Zlt4XSAmIDB4MDBGRjAwMDApIDw8IDYpOw0KDQpUaGlzIGlzbid0IHF1
aXRlIHJpZ2h0LiBUaGUgbG93ZXN0IHR3byBkZXN0aW5hdGlvbiBiaXRzIGluIGVhY2ggDQpj
b21wb25lbnQgd2lsbCBhbHdheXMgYmUgemVyby4gWW91IGhhdmUgdG8gZG8gdGhlIHNoaWZ0
aW5nIGFzIGFib3ZlIGFuZCANCmZvciBlYWNoIGNvbXBvbmVudCB0aGUgdHdvIGhpZ2hlc3Qg
c291cmNlIGJpdHMgaGF2ZSB0byBiZSBPUidlZCBpbnRvIHRoZSANCnR3byBsb3dlc3QgZGVz
dGluYXRpb24gYml0cy4gRm9yIGV4YW1wbGUgdGhlIHNvdXJjZSBiaXRzIGluIGEgY29tcG9u
ZW50IA0KYXJlIG51bWJlcmVkIDcgdG8gMA0KDQogIHwgNyA2IDUgNCAzIDIgMSAwIHwNCg0K
dGhlbiB0aGUgZGVzdGluYXRpb24gYml0cyBzaG91bGQgYmUNCg0KICB8IDcgNiA1IDQgMyAy
IDEgMCA3IDYgfA0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsJfQ0KPiArfQ0KPiAr
DQo+ICsvKioNCj4gKyAqIGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMF90b2lvIC0g
Q29udmVydCBYUkdCODg4OCB0byBYUkdCMjEwMTAxMCBjbGlwDQo+ICsgKiBidWZmZXINCj4g
KyAqIEBkc3Q6IFhSR0IyMTAxMDEwIGRlc3RpbmF0aW9uIGJ1ZmZlciAoaW9tZW0pDQo+ICsg
KiBAZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUg
c2NhbmxpbmVzIHdpdGhpbiBkc3QNCj4gKyAqIEB2YWRkcjogWFJHQjg4ODggc291cmNlIGJ1
ZmZlcg0KPiArICogQGZiOiBEUk0gZnJhbWVidWZmZXINCj4gKyAqIEBjbGlwOiBDbGlwIHJl
Y3RhbmdsZSBhcmVhIHRvIGNvcHkNCj4gKyAqDQo+ICsgKiBEcml2ZXJzIGNhbiB1c2UgdGhp
cyBmdW5jdGlvbiBmb3IgWFJHQjIxMDEwMTAgZGV2aWNlcyB0aGF0IGRvbid0IG5hdGl2ZWx5
DQo+ICsgKiBzdXBwb3J0IFhSR0I4ODg4Lg0KPiArICovDQo+ICt2b2lkIGRybV9mYl94cmdi
ODg4OF90b194cmdiMjEwMTAxMF90b2lvKHZvaWQgX19pb21lbSAqZHN0LA0KPiArCQkJCQkg
dW5zaWduZWQgaW50IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqdmFkZHIsDQo+ICsJCQkJCSBj
b25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCQkJIGNvbnN0IHN0cnVj
dCBkcm1fcmVjdCAqY2xpcCkNCj4gK3sNCj4gKwlzaXplX3QgbGluZXBpeGVscyA9IGNsaXAt
PngyIC0gY2xpcC0+eDE7DQo+ICsJc2l6ZV90IGRzdF9sZW4gPSBsaW5lcGl4ZWxzICogc2l6
ZW9mKHUzMik7DQo+ICsJdW5zaWduZWQgeSwgbGluZXMgPSBjbGlwLT55MiAtIGNsaXAtPnkx
Ow0KPiArCXZvaWQgKmRidWY7DQo+ICsNCj4gKwlpZiAoIWRzdF9waXRjaCkNCj4gKwkJZHN0
X3BpdGNoID0gZHN0X2xlbjsNCj4gKw0KPiArCWRidWYgPSBrbWFsbG9jKGRzdF9sZW4sIEdG
UF9LRVJORUwpOw0KPiArCWlmICghZGJ1ZikNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJdmFk
ZHIgKz0gY2xpcF9vZmZzZXQoY2xpcCwgZmItPnBpdGNoZXNbMF0sIHNpemVvZih1MzIpKTsN
Cj4gKwlmb3IgKHkgPSAwOyB5IDwgbGluZXM7IHkrKykgew0KPiArCQlkcm1fZmJfeHJnYjg4
ODhfdG9feHJnYjIxMDEwMTBfbGluZShkYnVmLCB2YWRkciwgbGluZXBpeGVscyk7DQo+ICsJ
CW1lbWNweV90b2lvKGRzdCwgZGJ1ZiwgZHN0X2xlbik7DQo+ICsJCXZhZGRyICs9IGZiLT5w
aXRjaGVzWzBdOw0KPiArCQlkc3QgKz0gZHN0X3BpdGNoOw0KPiArCX0NCj4gKw0KPiArCWtm
cmVlKGRidWYpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1fZmJfeHJnYjg4ODhfdG9f
eHJnYjIxMDEwMTBfdG9pbyk7DQo+ICsNCj4gICAvKioNCj4gICAgKiBkcm1fZmJfeHJnYjg4
ODhfdG9fZ3JheTggLSBDb252ZXJ0IFhSR0I4ODg4IHRvIGdyYXlzY2FsZQ0KPiAgICAqIEBk
c3Q6IDgtYml0IGdyYXlzY2FsZSBkZXN0aW5hdGlvbiBidWZmZXINCj4gQEAgLTUwMCw2ICs1
NTMsMTAgQEAgaW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lvbWVtICpkc3QsIHVuc2ln
bmVkIGludCBkc3RfcGl0Y2gsIHVpbnQzMl90IGRzdF9mb3INCj4gICAJCWZiX2Zvcm1hdCA9
IERSTV9GT1JNQVRfWFJHQjg4ODg7DQo+ICAgCWlmIChkc3RfZm9ybWF0ID09IERSTV9GT1JN
QVRfQVJHQjg4ODgpDQo+ICAgCQlkc3RfZm9ybWF0ID0gRFJNX0ZPUk1BVF9YUkdCODg4ODsN
Cj4gKwlpZiAoZmJfZm9ybWF0ID09IERSTV9GT1JNQVRfQVJHQjIxMDEwMTApDQo+ICsJCWZi
X2Zvcm1hdCA9IERSTV9GT1JNQVRfWFJHQjIxMDEwMTA7DQo+ICsJaWYgKGRzdF9mb3JtYXQg
PT0gRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCkNCj4gKwkJZHN0X2Zvcm1hdCA9IERSTV9GT1JN
QVRfWFJHQjIxMDEwMTA7DQo+ICAgDQo+ICAgCWlmIChkc3RfZm9ybWF0ID09IGZiX2Zvcm1h
dCkgew0KPiAgIAkJZHJtX2ZiX21lbWNweV90b2lvKGRzdCwgZHN0X3BpdGNoLCB2bWFwLCBm
YiwgY2xpcCk7DQo+IEBAIC01MTUsNiArNTcyLDExIEBAIGludCBkcm1fZmJfYmxpdF90b2lv
KHZvaWQgX19pb21lbSAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCB1aW50MzJfdCBk
c3RfZm9yDQo+ICAgCQkJZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OF90b2lvKGRzdCwgZHN0
X3BpdGNoLCB2bWFwLCBmYiwgY2xpcCk7DQo+ICAgCQkJcmV0dXJuIDA7DQo+ICAgCQl9DQo+
ICsJfSBlbHNlIGlmIChkc3RfZm9ybWF0ID09IERSTV9GT1JNQVRfWFJHQjIxMDEwMTApIHsN
Cj4gKwkJaWYgKGZiX2Zvcm1hdCA9PSBEUk1fRk9STUFUX1hSR0I4ODg4KSB7DQo+ICsJCQlk
cm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTBfdG9pbyhkc3QsIGRzdF9waXRjaCwgdm1h
cCwgZmIsIGNsaXApOw0KPiArCQkJcmV0dXJuIDA7DQo+ICsJCX0NCj4gICAJfQ0KPiAgIA0K
PiAgIAlyZXR1cm4gLUVJTlZBTDsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9m
b3JtYXRfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+IGlu
ZGV4IDk3ZTRjMzIyM2FmMy4uYjMwZWQ1ZGUwYTMzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mb3Jt
YXRfaGVscGVyLmgNCj4gQEAgLTMzLDYgKzMzLDkgQEAgdm9pZCBkcm1fZmJfeHJnYjg4ODhf
dG9fcmdiODg4KHZvaWQgKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwgY29uc3Qgdm9p
ZCAqc3INCj4gICB2b2lkIGRybV9mYl94cmdiODg4OF90b19yZ2I4ODhfdG9pbyh2b2lkIF9f
aW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwNCj4gICAJCQkJICAgIGNvbnN0
IHZvaWQgKnZhZGRyLCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gICAJ
CQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7DQo+ICt2b2lkIGRybV9mYl94
cmdiODg4OF90b194cmdiMjEwMTAxMF90b2lvKHZvaWQgX19pb21lbSAqZHN0LCB1bnNpZ25l
ZCBpbnQgZHN0X3BpdGNoLA0KPiArCQkJCQkgY29uc3Qgdm9pZCAqdmFkZHIsIGNvbnN0IHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiArCQkJCQkgY29uc3Qgc3RydWN0IGRybV9y
ZWN0ICpjbGlwKTsNCj4gICB2b2lkIGRybV9mYl94cmdiODg4OF90b19ncmF5OCh2b2lkICpk
c3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnZhZGRyLA0KPiAgIAkJ
CSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBjb25zdCBzdHJ1Y3Qg
ZHJtX3JlY3QgKmNsaXApOw0KPiAgIA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------v792wfspeNDV9pFwEXetWoU0--

--------------Q0UzHGc5hdA1B5jj5ZE6I2GI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvK/cFAwAAAAAACgkQlh/E3EQov+Dk
9Q/+IVYFrIGR74l7jxASmZjVJOOHr4GtH4FmubenyKBtXtHesWuIoCZwX0zMAKnZUdsN+7buIrIO
qx8wl8gGKe9jDgcOJ5qxnR5RiLAoLHx+SWgfeZ+tWWlRdF8EJuUEWYIwhDnCdyPR38P20EhWwcVI
oAyzyE5ynL3v/eNexXZH6oF5z9zaPcwWYMPUzICxCA2RNVZMzj1Mi5cLmRiep++eBsrloxW2Vn5T
S2ISylsbeeEECDdJOHassbaYYBXfk4qC3kJfTyqaNb09Z08hsPCvWl9PbXa6eOQpMia49cHR+bE8
CAu3MWx4KXP59sOI920Elvw9B7stOydq76cYN0Zr5VPWtEBvJYIND//SBABaH2fC1aZV3JBbshxk
wb+cC++L6FFbPBrlFiW/3XyaPcVkVGDpcf82M7WvU2FH6rgR3Pj4BJi0cX5kWME2dAEgEOjPSu5V
oC56mV9pgNwfYo/SLOXdeBKkDTLnsdgD+yJQL7RWACYCzUEQS9G1U/b0M5DSPqJzqXW4gj+8w7o+
rP7yOyRifMolxYS6Ug/jzNKc/pPK2rYcnzQFp4p1JDY+587JBk6PM3iLxnC9YrlEcvImQOKdGlme
D7TpQIzzYp8zh4CHHj/BWByi1TOdNWAdL2/3UJrDCS+VTU5hkCGxsrI5rgyCvslNJXo4EpxZf42y
GoM=
=3rvo
-----END PGP SIGNATURE-----

--------------Q0UzHGc5hdA1B5jj5ZE6I2GI--
