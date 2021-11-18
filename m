Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7754557D6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4196EC62;
	Thu, 18 Nov 2021 09:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B03C6EC62
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:16:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CD9F1FD35;
 Thu, 18 Nov 2021 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637226969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dPfEQ+LCZs0GHVttiTSVjqc3/R42HneXvcfgGTKEV68=;
 b=XgZSXQjIPkEUyY2pa6d+zsYJGbGQozAVJ9ExiD19YHstaxCa6Ic8M+oEhFRj+KKsUE9Xi5
 J6OwaHGOSndVl+II0B/DebIVhP14qa7qM3V6zmi9aUPyKptZ0lgg7VxGXQUh9YO1GDtIxS
 Fa/wZitlVQUKLj88cGTxv6GEOUPOit8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637226969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dPfEQ+LCZs0GHVttiTSVjqc3/R42HneXvcfgGTKEV68=;
 b=6/zWeJ/wjgzI0AqOR7TeWIl4KEE8XcnZ2DblleUyLmTvXpc2QsMu8ejNzpxDFbL0PnG9Ru
 Fous+ADPwtqHvTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD32013CF6;
 Thu, 18 Nov 2021 09:16:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K/yQNNgZlmFdawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Nov 2021 09:16:08 +0000
Message-ID: <b3645cf7-1a38-efa5-d32c-b4a7c56ce20b@suse.de>
Date: Thu, 18 Nov 2021 10:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_dstclip()
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-3-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211117145829.204360-3-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ukL87iCZT6J5g0D0YVHoe0i2"
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
--------------ukL87iCZT6J5g0D0YVHoe0i2
Content-Type: multipart/mixed; boundary="------------m0LWdShNKxHMQsXc0HkfrgNb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
Message-ID: <b3645cf7-1a38-efa5-d32c-b4a7c56ce20b@suse.de>
Subject: Re: [PATCH 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_dstclip()
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-3-marcan@marcan.st>
In-Reply-To: <20211117145829.204360-3-marcan@marcan.st>

--------------m0LWdShNKxHMQsXc0HkfrgNb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjEgdW0gMTU6NTggc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBB
ZGQgWFJHQjg4ODggZW11bGF0aW9uIHN1cHBvcnQgZm9yIGRldmljZXMgdGhhdCBjYW4gb25s
eSBkbyBYUkdCMjEwMTAxMC4NCj4gDQo+IFRoaXMgaXMgY2hpZWZseSB1c2VmdWwgZm9yIHNp
bXBsZWRybSBvbiBBcHBsZSBkZXZpY2VzIHdoZXJlIHRoZQ0KPiBib290bG9hZGVyLXByb3Zp
ZGVkIGZyYW1lYnVmZmVyIGlzIDEwLWJpdCwgd2hpY2ggYWxyZWFkeSB3b3JrcyBmaW5lIHdp
dGgNCj4gc2ltcGxlZmIuIFRoaXMgaXMgcmVxdWlyZWQgdG8gbWFrZSBzaW1wbGVkcm0gc3Vw
cG9ydCB0aGlzIHRvby4NCg0KQXMgbWVudGlvbmVkIGluIHRoZSBvdGhlciByZXZpZXcsIHRo
aXMgcmVxdWlyZXMgYSByZWJhc2Ugb250byB0aGUgbGF0ZXN0IA0KRFJNIHRyZWU7IHByZWZl
cmFibHkgZHJtLXRpcC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSGVjdG9yIE1hcnRpbiA8bWFyY2FuQG1hcmNhbi5zdD4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgfCA2NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgg
ICAgIHwgIDQgKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+IGluZGV4IDY5ZmRlNjBl
MzZiMy4uNTk5OGU1N2Q2ZmYyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Zvcm1hdF9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9o
ZWxwZXIuYw0KPiBAQCAtMzc4LDYgKzM3OCw2MCBAQCB2b2lkIGRybV9mYl94cmdiODg4OF90
b19yZ2I4ODhfZHN0Y2xpcCh2b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9w
aXRjaA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9mYl94cmdiODg4OF90b19yZ2I4
ODhfZHN0Y2xpcCk7DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9f
eHJnYjIxMDEwMTBfbGluZSh1MzIgKmRidWYsIHUzMiAqc2J1ZiwNCj4gKwkJCQkJCXVuc2ln
bmVkIGludCBwaXhlbHMpDQo+ICt7DQo+ICsJdW5zaWduZWQgaW50IHg7DQo+ICsNCj4gKwlm
b3IgKHggPSAwOyB4IDwgcGl4ZWxzOyB4KyspIHsNCj4gKwkJKmRidWYrKyA9ICgoc2J1Zlt4
XSAmIDB4MDAwMDAwRkYpIDw8IDIpIHwNCj4gKwkJCSAgKChzYnVmW3hdICYgMHgwMDAwRkYw
MCkgPDwgNCkgfA0KPiArCQkJICAoKHNidWZbeF0gJiAweDAwRkYwMDAwKSA8PCA2KTsNCj4g
Kwl9DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2Iy
MTAxMDEwX2RzdGNsaXAgLSBDb252ZXJ0IFhSR0I4ODg4IHRvIFhSR0IyMTAxMDEwIGNsaXAN
Cj4gKyAqIGJ1ZmZlcg0KPiArICogQGRzdDogWFJHQjIxMDEwMTAgZGVzdGluYXRpb24gYnVm
ZmVyIChpb21lbSkNCj4gKyAqIEBkc3RfcGl0Y2g6IGRlc3RpbmF0aW9uIGJ1ZmZlciBwaXRj
aA0KPiArICogQHZhZGRyOiBYUkdCODg4OCBzb3VyY2UgYnVmZmVyDQo+ICsgKiBAZmI6IERS
TSBmcmFtZWJ1ZmZlcg0KPiArICogQGNsaXA6IENsaXAgcmVjdGFuZ2xlIGFyZWEgdG8gY29w
eQ0KPiArICoNCj4gKyAqIERyaXZlcnMgY2FuIHVzZSB0aGlzIGZ1bmN0aW9uIGZvciBYUkdC
MjEwMTAxMCBkZXZpY2VzIHRoYXQgZG9uJ3QgbmF0aXZlbHkNCj4gKyAqIHN1cHBvcnQgWFJH
Qjg4ODguDQo+ICsgKg0KPiArICogVGhpcyBmdW5jdGlvbiBhcHBsaWVzIGNsaXBwaW5nIG9u
IGRzdCwgaS5lLiB0aGUgZGVzdGluYXRpb24gaXMgYQ0KPiArICogZnVsbCAoaW9tZW0pIGZy
YW1lYnVmZmVyIGJ1dCBvbmx5IHRoZSBjbGlwIHJlY3QgY29udGVudCBpcyBjb3BpZWQgb3Zl
ci4NCj4gKyAqLw0KPiArdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTBfZHN0
Y2xpcCh2b2lkIF9faW9tZW0gKmRzdCwNCj4gKwkJCQkJICAgIHVuc2lnbmVkIGludCBkc3Rf
cGl0Y2gsIHZvaWQgKnZhZGRyLA0KPiArCQkJCQkgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsDQo+ICsJCQkJCSAgICBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApDQo+ICt7DQo+ICsJ
c2l6ZV90IGxpbmVwaXhlbHMgPSBjbGlwLT54MiAtIGNsaXAtPngxOw0KPiArCXNpemVfdCBk
c3RfbGVuID0gbGluZXBpeGVscyAqIDQ7DQo+ICsJdW5zaWduZWQgaW50IHksIGxpbmVzID0g
Y2xpcC0+eTIgLSBjbGlwLT55MTsNCj4gKwl2b2lkICpkYnVmOw0KPiArDQo+ICsJZGJ1ZiA9
IGttYWxsb2MoZHN0X2xlbiwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFkYnVmKQ0KPiArCQly
ZXR1cm47DQo+ICsNCj4gKwl2YWRkciArPSBjbGlwX29mZnNldChjbGlwLCBmYi0+cGl0Y2hl
c1swXSwgc2l6ZW9mKHUzMikpOw0KPiArCWRzdCArPSBjbGlwX29mZnNldChjbGlwLCBkc3Rf
cGl0Y2gsIHNpemVvZih1MzIpKTsNCj4gKwlmb3IgKHkgPSAwOyB5IDwgbGluZXM7IHkrKykg
ew0KPiArCQlkcm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTBfbGluZShkYnVmLCB2YWRk
ciwgbGluZXBpeGVscyk7DQo+ICsJCW1lbWNweV90b2lvKGRzdCwgZGJ1ZiwgZHN0X2xlbik7
DQo+ICsJCXZhZGRyICs9IGZiLT5waXRjaGVzWzBdOw0KPiArCQlkc3QgKz0gZHN0X3BpdGNo
Ow0KPiArCX0NCj4gKw0KPiArCWtmcmVlKGRidWYpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJP
TChkcm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTBfZHN0Y2xpcCk7DQo+ICsNCj4gICAv
KioNCj4gICAgKiBkcm1fZmJfeHJnYjg4ODhfdG9fZ3JheTggLSBDb252ZXJ0IFhSR0I4ODg4
IHRvIGdyYXlzY2FsZQ0KPiAgICAqIEBkc3Q6IDgtYml0IGdyYXlzY2FsZSBkZXN0aW5hdGlv
biBidWZmZXINCj4gQEAgLTQ2NCw2ICs1MTgsMTAgQEAgaW50IGRybV9mYl9ibGl0X3JlY3Rf
ZHN0Y2xpcCh2b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwNCj4g
ICAJCWZiX2Zvcm1hdCA9IERSTV9GT1JNQVRfWFJHQjg4ODg7DQo+ICAgCWlmIChkc3RfZm9y
bWF0ID09IERSTV9GT1JNQVRfQVJHQjg4ODgpDQo+ICAgCQlkc3RfZm9ybWF0ID0gRFJNX0ZP
Uk1BVF9YUkdCODg4ODsNCj4gKwlpZiAoZmJfZm9ybWF0ID09IERSTV9GT1JNQVRfQVJHQjIx
MDEwMTApDQo+ICsJCWZiX2Zvcm1hdCA9IERSTV9GT1JNQVRfWFJHQjIxMDEwMTA7DQo+ICsJ
aWYgKGRzdF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCkNCj4gKwkJZHN0X2Zv
cm1hdCA9IERSTV9GT1JNQVRfWFJHQjIxMDEwMTA7DQo+ICAgDQo+ICAgCWlmIChkc3RfZm9y
bWF0ID09IGZiX2Zvcm1hdCkgew0KPiAgIAkJZHJtX2ZiX21lbWNweV9kc3RjbGlwKGRzdCwg
ZHN0X3BpdGNoLCB2bWFwLCBmYiwgY2xpcCk7DQo+IEBAIC00ODIsNiArNTQwLDEyIEBAIGlu
dCBkcm1fZmJfYmxpdF9yZWN0X2RzdGNsaXAodm9pZCBfX2lvbWVtICpkc3QsIHVuc2lnbmVk
IGludCBkc3RfcGl0Y2gsDQo+ICAgCQkJCQkJCSAgdm1hcCwgZmIsIGNsaXApOw0KPiAgIAkJ
CXJldHVybiAwOw0KPiAgIAkJfQ0KPiArCX0gZWxzZSBpZiAoZHN0X2Zvcm1hdCA9PSBEUk1f
Rk9STUFUX1hSR0IyMTAxMDEwKSB7DQo+ICsJCWlmIChmYl9mb3JtYXQgPT0gRFJNX0ZPUk1B
VF9YUkdCODg4OCkgew0KPiArCQkJZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX2Rz
dGNsaXAoZHN0LCBkc3RfcGl0Y2gsDQo+ICsJCQkJCQkJICAgICAgIHZtYXAsIGZiLCBjbGlw
KTsNCj4gKwkJCXJldHVybiAwOw0KPiArCQl9DQo+ICAgCX0NCj4gICANCj4gICAJcmV0dXJu
IC1FSU5WQUw7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBl
ci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPiBpbmRleCBlODY5MjVj
ZjA3YjkuLmEwZmFhNzEwODc4YiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Zv
cm1hdF9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5o
DQo+IEBAIC0yOSw2ICsyOSwxMCBAQCB2b2lkIGRybV9mYl94cmdiODg4OF90b19yZ2I4ODgo
dm9pZCAqZHN0LCB2b2lkICpzcmMsIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiAg
IHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OF9kc3RjbGlwKHZvaWQgX19pb21lbSAq
ZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLA0KPiAgIAkJCQkgICAgICAgdm9pZCAqdmFk
ZHIsIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiAgIAkJCQkgICAgICAgc3RydWN0
IGRybV9yZWN0ICpjbGlwKTsNCj4gK3ZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAx
MDEwX2RzdGNsaXAodm9pZCBfX2lvbWVtICpkc3QsDQo+ICsJCQkJCSAgICB1bnNpZ25lZCBp
bnQgZHN0X3BpdGNoLCB2b2lkICp2YWRkciwNCj4gKwkJCQkJICAgIHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiLA0KPiArCQkJCQkgICAgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4g
ICB2b2lkIGRybV9mYl94cmdiODg4OF90b19ncmF5OCh1OCAqZHN0LCB2b2lkICp2YWRkciwg
c3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+ICAgCQkJICAgICAgc3RydWN0IGRybV9y
ZWN0ICpjbGlwKTsNCj4gICANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------m0LWdShNKxHMQsXc0HkfrgNb--

--------------ukL87iCZT6J5g0D0YVHoe0i2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGWGdgFAwAAAAAACgkQlh/E3EQov+BY
YRAAz6p+nK6ksl6uUBF7XOsxsUeRcnZrr1krKuG1I/O7Q+hjNa+T9L4kEdlrsC5P0nuC3MPhz7XE
DY1R4Fmh/P3yf2Sc2udJxX/xxai7rcabnZOljNRPufpg7P9vAB2hSPn9SkoSEpaUEJv6bdnRln+J
qfJbxaeseJrYxZm84vsCA2rL1sbMR/9gLiYiVwMsnjD/rGThR68XVL11IYrnjuUfbEYbQjMz4Qt/
yO46KaI4DlTHchcOVXEpP/6KrNPxeOUUl0r7ZwKRyXt58EAeZZCkDOCTZzQiUMcXy9s3jpGP/3Z1
b1ZhlZqIbAQtqkTfhCfbrYuHJrrf1oOTczvcnJlUJlDN4Wu8CL6XGEzs1TJEPsGP09XbKZa2Llp9
6ZUKqzNt6CO2xuF8yoO6ZKsqh4AyBO2933MuMB7XHdTBOjKbxM+zjsfcDPI70jvV/W2L2lBcu0e+
/1lUZpgiBFeu0Ng77kjhrzqIZZ5GAO06QiGyaA0Duc/yZ2p5YDUzHPWo787K5k8QXVIZlL7GHo9I
E9Mwu35dfw+1/tMFQTXlElTGRK4oMpuCIgNCLMx/LFvRgvMlqd5w4J0KnBz2tsQu/1KJWuF+UvX8
h8b/YoPl4VNK4qop7wg1thhE+3cNda5lAJD1Wri6zWaCPu2OgpBD+FCCVuIWsePR0U6tW6vnfQYw
a4E=
=JJwp
-----END PGP SIGNATURE-----

--------------ukL87iCZT6J5g0D0YVHoe0i2--
