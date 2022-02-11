Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EA4B262A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0630110EBC4;
	Fri, 11 Feb 2022 12:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1D010EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:46:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A730B2113A;
 Fri, 11 Feb 2022 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644583610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+slQW1mVxtLZnGNIO+PCLy/Omno/FWxTRdp0Yt9v0I=;
 b=DLTWC1YzwRCBXVeQY4SWKbgFLwcVADocgFd0dPIO03bdttJn+tGMhUot7tAIv44/nV9SHp
 rLtCQHweOrZ4fuYjYHpQgij2TrOC6B0CIp5ZCN+jMk35GFMODncGK1RhkIY5vb9lAfm15e
 jMEyUGu8bGcZk0uXROrHKTe9ES+hiKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644583610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+slQW1mVxtLZnGNIO+PCLy/Omno/FWxTRdp0Yt9v0I=;
 b=qFbZy3xK9lFG5p+Zql3nkeL26F0OveBBUfqOZ8TzOBqMsU8j/9SV7MsUSzaLfI5Mj3Jgx0
 uNo9ECcDv14qlYAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5487613C72;
 Fri, 11 Feb 2022 12:46:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kMsLE7paBmIEeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 12:46:50 +0000
Message-ID: <3b5b2b1e-0375-cbe4-5e55-a783480e6ebb@suse.de>
Date: Fri, 11 Feb 2022 13:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220211091927.2988283-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MBff9comIPrzKVkl5gT20c0e"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MBff9comIPrzKVkl5gT20c0e
Content-Type: multipart/mixed; boundary="------------w0qr4Eok71HjKmm68VtNFjrJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <3b5b2b1e-0375-cbe4-5e55-a783480e6ebb@suse.de>
Subject: Re: [PATCH v4 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-3-javierm@redhat.com>
In-Reply-To: <20220211091927.2988283-3-javierm@redhat.com>

--------------w0qr4Eok71HjKmm68VtNFjrJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDIuMjIgdW0gMTA6MTkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEFkZCBzdXBwb3J0IHRvIGNvbnZlcnQgZnJvbSBYUjI0IHRvIHJldmVyc2Vk
IG1vbm9jaHJvbWUgZm9yIGRyaXZlcnMgdGhhdA0KPiBjb250cm9sIG1vbm9jaHJvbWF0aWMg
ZGlzcGxheSBwYW5lbHMsIHRoYXQgb25seSBoYXZlIDEgYml0IHBlciBwaXhlbC4NCj4gDQo+
IFRoZSBmdW5jdGlvbiBkb2VzIGEgbGluZS1ieS1saW5lIGNvbnZlcnNpb24gZG9pbmcgYW4g
aW50ZXJtZWRpYXRlIHN0ZXANCj4gZmlyc3QgZnJvbSBYUjI0IHRvIDgtYml0IGdyYXlzY2Fs
ZSBhbmQgdGhlbiB0byByZXZlcnNlZCBtb25vY2hyb21lLg0KPiANCj4gVGhlIGRybV9mYl9n
cmF5OF90b19tb25vX3JldmVyc2VkX2xpbmUoKSBoZWxwZXIgd2FzIGJhc2VkIG9uIGNvZGUg
ZnJvbQ0KPiBkcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgZHJpdmVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhh
dC5jb20+DQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIFJlbmFtZSBlbmRf
b2Zmc2V0IHRvIGVuZF9sZW4gKFRob21hcyBaaW1tZXJtYW5uKQ0KPiAtIFdhcm4gb25jZSBp
ZiBkc3RfcGl0Y2ggaXMgbm90IGEgbXVsdGlwbGUgb2YgOCAoVGhvbWFzIFppbW1lcm1hbm4p
DQo+IC0gRHJvcCBkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZCgpIHRoYXQncyBub3Qg
dXNlZCAoVGhvbWFzIFppbW1lcm1hbm4pDQo+IC0gQWxsb2NhdGUgc2luZ2xlIGJ1ZmZlciBm
b3IgYm90aCBjb3B5IGNtYSBtZW1vcnkgYW5kIGdyYXk4IChUaG9tYXMgWmltbWVybWFubikN
Cj4gLSBBZGQgVGhvbWFzIFppbW1lcm1hbm4gUmV2aWV3ZWQtYnkgdGFnIHRvIHBhdGNoIGFk
ZGluZyBYUjI0IC0+IG1vbm8gaGVscGVyLg0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBB
bHNvIGFkZCBhIGRybV9mYl94cmdiODg4OF90b19tb25vX3JldmVyc2VkKCkgaGVscGVyIChU
aG9tYXMgWmltbWVybWFubikNCj4gLSBTcGxpdCBsaW5lcyBjb3B5IHRvIGRybV9mYl9ncmF5
OF90b19tb25vX3JldmVyc2VkX2xpbmUoKSAoVGhvbWFzIFppbW1lcm1hbm4pDQo+IC0gSGFu
ZGxlIGNhc2Ugd2hlcmUgdGhlIHNvdXJjZSBidWZmZXIgaXMgbm90IGFsaWduZWQgdG8gOCAo
VGhvbWFzIFppbW1lcm1hbm4pDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0
X2hlbHBlci5jIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBpbmNs
dWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oICAgICB8ICAgNCArKw0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTExIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9y
bWF0X2hlbHBlci5jDQo+IGluZGV4IGI5ODE3MTI2MjNkMy4uZWM0ZTM3MjRlZTc5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBAQCAtNTkxLDMgKzU5
MSwxMTAgQEAgaW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lvbWVtICpkc3QsIHVuc2ln
bmVkIGludCBkc3RfcGl0Y2gsIHVpbnQzMl90IGRzdF9mb3INCj4gICAJcmV0dXJuIC1FSU5W
QUw7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2ZiX2JsaXRfdG9pbyk7DQo+ICsN
Cj4gK3N0YXRpYyB2b2lkIGRybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2VkX2xpbmUodTgg
KmRzdCwgY29uc3QgdTggKnNyYywgdW5zaWduZWQgaW50IHBpeGVscywNCj4gKwkJCQkJICAg
ICAgIHVuc2lnbmVkIGludCBzdGFydF9vZmZzZXQsIHVuc2lnbmVkIGludCBlbmRfbGVuKQ0K
PiArew0KPiArCXVuc2lnbmVkIGludCB4YiwgaTsNCj4gKw0KPiArCWZvciAoeGIgPSAwOyB4
YiA8IHBpeGVsczsgeGIrKykgew0KPiArCQl1bnNpZ25lZCBpbnQgc3RhcnQgPSAwLCBlbmQg
PSA4Ow0KPiArCQl1OCBieXRlID0gMHgwMDsNCj4gKw0KPiArCQlpZiAoeGIgPT0gMCAmJiBz
dGFydF9vZmZzZXQpDQo+ICsJCQlzdGFydCA9IHN0YXJ0X29mZnNldDsNCj4gKw0KPiArCQlp
ZiAoeGIgPT0gcGl4ZWxzIC0gMSAmJiBlbmRfbGVuKQ0KPiArCQkJZW5kID0gZW5kX2xlbjsN
Cj4gKw0KPiArCQlmb3IgKGkgPSBzdGFydDsgaSA8IGVuZDsgaSsrKSB7DQo+ICsJCQl1bnNp
Z25lZCBpbnQgeCA9IHhiICogOCArIGk7DQo+ICsNCj4gKwkJCWJ5dGUgPj49IDE7DQo+ICsJ
CQlpZiAoc3JjW3hdID4+IDcpDQo+ICsJCQkJYnl0ZSB8PSBCSVQoNyk7DQo+ICsJCX0NCj4g
KwkJKmRzdCsrID0gYnl0ZTsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogZHJt
X2ZiX3hyZ2I4ODg4X3RvX21vbm9fcmV2ZXJzZWQgLSBDb252ZXJ0IFhSR0I4ODg4IHRvIHJl
dmVyc2VkIG1vbm9jaHJvbWUNCj4gKyAqIEBkc3Q6IHJldmVyc2VkIG1vbm9jaHJvbWUgZGVz
dGluYXRpb24gYnVmZmVyDQo+ICsgKiBAZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0
d2VlbiB0d28gY29uc2VjdXRpdmUgc2NhbmxpbmVzIHdpdGhpbiBkc3QNCj4gKyAqIEBzcmM6
IFhSR0I4ODg4IHNvdXJjZSBidWZmZXINCj4gKyAqIEBmYjogRFJNIGZyYW1lYnVmZmVyDQo+
ICsgKiBAY2xpcDogQ2xpcCByZWN0YW5nbGUgYXJlYSB0byBjb3B5DQo+ICsgKg0KPiArICog
RFJNIGRvZXNuJ3QgaGF2ZSBuYXRpdmUgbW9ub2Nocm9tZSBzdXBwb3J0Lg0KPiArICogU3Vj
aCBkcml2ZXJzIGNhbiBhbm5vdW5jZSB0aGUgY29tbW9ubHkgc3VwcG9ydGVkIFhSMjQgZm9y
bWF0IHRvIHVzZXJzcGFjZQ0KPiArICogYW5kIHVzZSB0aGlzIGZ1bmN0aW9uIHRvIGNvbnZl
cnQgdG8gdGhlIG5hdGl2ZSBmb3JtYXQuDQo+ICsgKg0KPiArICogVGhpcyBmdW5jdGlvbiB1
c2VzIGRybV9mYl94cmdiODg4OF90b19ncmF5OCgpIHRvIGNvbnZlcnQgdG8gZ3JheXNjYWxl
IGFuZA0KPiArICogdGhlbiB0aGUgcmVzdWx0IGlzIGNvbnZlcnRlZCBmcm9tIGdyYXlzY2Fs
ZSB0byByZXZlcnNlZCBtb25vaHJvbWUuDQo+ICsgKi8NCj4gK3ZvaWQgZHJtX2ZiX3hyZ2I4
ODg4X3RvX21vbm9fcmV2ZXJzZWQodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNo
LCBjb25zdCB2b2lkICp2YWRkciwNCj4gKwkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiwgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPiArew0KPiAr
CXVuc2lnbmVkIGludCBsaW5lcGl4ZWxzID0gZHJtX3JlY3Rfd2lkdGgoY2xpcCk7DQo+ICsJ
dW5zaWduZWQgaW50IGxpbmVzID0gY2xpcC0+eTIgLSBjbGlwLT55MTsNCj4gKwl1bnNpZ25l
ZCBpbnQgY3BwID0gZmItPmZvcm1hdC0+Y3BwWzBdOw0KPiArCXVuc2lnbmVkIGludCBsZW5f
c3JjMzIgPSBsaW5lcGl4ZWxzICogY3BwOw0KPiArCXVuc2lnbmVkIGludCBzdGFydF9vZmZz
ZXQsIGVuZF9sZW47DQo+ICsJdW5zaWduZWQgaW50IHk7DQo+ICsJdTggKm1vbm8gPSBkc3Qs
ICpncmF5ODsNCj4gKwl1MzIgKnNyYzMyOw0KPiArDQo+ICsJaWYgKFdBUk5fT04oZmItPmZv
cm1hdC0+Zm9ybWF0ICE9IERSTV9GT1JNQVRfWFJHQjg4ODgpKQ0KPiArCQlyZXR1cm47DQoN
ClRoZXNlIFdBUk4gbWFjcm9zIGFyZSBkZXByZWNhdGVkLiBVc2UgZHJtX3dhcm4sIGRybV9X
QVJOX09OQ0UsIGV0YyBpbnN0ZWFkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsN
Cj4gKwkvKg0KPiArCSAqIFRoZSByZXZlcnNlZCBtb25vIGRlc3RpbmF0aW9uIGJ1ZmZlciBj
b250YWlucyAxIGJpdCBwZXIgcGl4ZWwNCj4gKwkgKiBhbmQgZGVzdGluYXRpb24gc2Nhbmxp
bmVzIGhhdmUgdG8gYmUgaW4gbXVsdGlwbGUgb2YgOCBwaXhlbHMuDQo+ICsJICovDQo+ICsJ
aWYgKCFkc3RfcGl0Y2gpDQo+ICsJCWRzdF9waXRjaCA9IERJVl9ST1VORF9VUChsaW5lcGl4
ZWxzLCA4KTsNCj4gKw0KPiArCVdBUk5fT05DRShkc3RfcGl0Y2ggJSA4ICE9IDAsICJkc3Rf
cGl0Y2ggaXMgbm90IGEgbXVsdGlwbGUgb2YgOFxuIik7DQo+ICsNCj4gKwkvKg0KPiArCSAq
IFRoZSBjbWEgbWVtb3J5IGlzIHdyaXRlLWNvbWJpbmVkIHNvIHJlYWRzIGFyZSB1bmNhY2hl
ZC4NCj4gKwkgKiBTcGVlZCB1cCBieSBmZXRjaGluZyBvbmUgbGluZSBhdCBhIHRpbWUuDQo+
ICsJICoNCj4gKwkgKiBBbHNvLCBmb3JtYXQgY29udmVyc2lvbiBmcm9tIFhSMjQgdG8gcmV2
ZXJzZWQgbW9ub2Nocm9tZQ0KPiArCSAqIGFyZSBkb25lIGxpbmUtYnktbGluZSBidXQgYXJl
IGNvbnZlcnRlZCB0byA4LWJpdCBncmF5c2NhbGUNCj4gKwkgKiBhcyBhbiBpbnRlcm1lZGlh
dGUgc3RlcC4NCj4gKwkgKg0KPiArCSAqIEFsbG9jYXRlIGEgYnVmZmVyIHRvIGJlIHVzZWQg
Zm9yIGJvdGggY29weWluZyBmcm9tIHRoZSBjbWENCj4gKwkgKiBtZW1vcnkgYW5kIHRvIHN0
b3JlIHRoZSBpbnRlcm1lZGlhdGUgZ3JheXNjYWxlIGxpbmUgcGl4ZWxzLg0KPiArCSAqLw0K
PiArCXNyYzMyID0ga21hbGxvYyhsZW5fc3JjMzIgKyBsaW5lcGl4ZWxzLCBHRlBfS0VSTkVM
KTsNCj4gKwlpZiAoIXNyYzMyKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlncmF5OCA9ICh1
OCAqKXNyYzMyICsgbGVuX3NyYzMyOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBGb3IgZGFtYWdl
IGhhbmRsaW5nLCBpdCBpcyBwb3NzaWJsZSB0aGF0IG9ubHkgcGFydHMgb2YgdGhlIHNvdXJj
ZQ0KPiArCSAqIGJ1ZmZlciBpcyBjb3BpZWQgYW5kIHRoaXMgY291bGQgbGVhZCB0byBzdGFy
dCBhbmQgZW5kIHBpeGVscyB0aGF0DQo+ICsJICogYXJlIG5vdCBhbGlnbmVkIHRvIG11bHRp
cGxlIG9mIDguDQo+ICsJICoNCj4gKwkgKiBDYWxjdWxhdGUgaWYgdGhlIHN0YXJ0IGFuZCBl
bmQgcGl4ZWxzIGFyZSBub3QgYWxpZ25lZCBhbmQgc2V0IHRoZQ0KPiArCSAqIG9mZnNldHMg
Zm9yIHRoZSByZXZlcnNlZCBtb25vIGxpbmUgY29udmVyc2lvbiBmdW5jdGlvbiB0byBhZGp1
c3QuDQo+ICsJICovDQo+ICsJc3RhcnRfb2Zmc2V0ID0gY2xpcC0+eDEgJSA4Ow0KPiArCWVu
ZF9sZW4gPSBjbGlwLT54MiAlIDg7DQo+ICsNCj4gKwl2YWRkciArPSBjbGlwX29mZnNldChj
bGlwLCBmYi0+cGl0Y2hlc1swXSwgY3BwKTsNCj4gKwlmb3IgKHkgPSAwOyB5IDwgbGluZXM7
IHkrKykgew0KPiArCQlzcmMzMiA9IG1lbWNweShzcmMzMiwgdmFkZHIsIGxlbl9zcmMzMik7
DQo+ICsJCWRybV9mYl94cmdiODg4OF90b19ncmF5OF9saW5lKGdyYXk4LCBzcmMzMiwgbGlu
ZXBpeGVscyk7DQo+ICsJCWRybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2VkX2xpbmUobW9u
bywgZ3JheTgsIGRzdF9waXRjaCwNCj4gKwkJCQkJCSAgIHN0YXJ0X29mZnNldCwgZW5kX2xl
bik7DQo+ICsJCXZhZGRyICs9IGZiLT5waXRjaGVzWzBdOw0KPiArCQltb25vICs9IGRzdF9w
aXRjaDsNCj4gKwl9DQo+ICsNCj4gKwlrZnJlZShzcmMzMik7DQo+ICt9DQo+ICtFWFBPUlRf
U1lNQk9MKGRybV9mYl94cmdiODg4OF90b19tb25vX3JldmVyc2VkKTsNCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
Zm9ybWF0X2hlbHBlci5oDQo+IGluZGV4IGIzMGVkNWRlMGEzMy4uMGIwOTM3YzBiMmY2IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgNCj4gQEAgLTQzLDQgKzQzLDggQEAg
aW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lvbWVtICpkc3QsIHVuc2lnbmVkIGludCBk
c3RfcGl0Y2gsIHVpbnQzMl90IGRzdF9mb3INCj4gICAJCSAgICAgY29uc3Qgdm9pZCAqdm1h
cCwgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+ICAgCQkgICAgIGNvbnN0
IHN0cnVjdCBkcm1fcmVjdCAqcmVjdCk7DQo+ICAgDQo+ICt2b2lkIGRybV9mYl94cmdiODg4
OF90b19tb25vX3JldmVyc2VkKHZvaWQgKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwg
Y29uc3Qgdm9pZCAqc3JjLA0KPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKmZiLA0KPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7
DQo+ICsNCj4gICAjZW5kaWYgLyogX19MSU5VWF9EUk1fRk9STUFUX0hFTFBFUl9IICovDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------w0qr4Eok71HjKmm68VtNFjrJ--

--------------MBff9comIPrzKVkl5gT20c0e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIGWrkFAwAAAAAACgkQlh/E3EQov+DU
vRAAySXjWt/gwKxNCjPRiNTDkjoYSLCN0f/3Mtf5yZ35DI9PqxQL8Ryov/Fi7Ilb2DSvZ/QGBYdQ
DsAKo1tKUGZfWduUdVtuKteszsndoQ3JdfXSa+SFinCNBayiBgF3wytUY2opyBlLaaYvek7cpmCq
lYRgsRReJ+HCYufRcqbG+tU5fC5BVWxZsCYXxEzIGLMccEAQqP3+NhrQwDdcAwKrKCg/NiWqsEwA
N13LPXH1VJwL3/jqb1aFy9AfJP0NHRpxVLjB6xjTPT5bV3162R4/JkBNuEIouocP6UTiZ2RW17m9
GwawMdJ8djg+uEzUMN3wM5Nx149lt/m7bPZR/BU1BXuEeU0QjtqL0pfBV5DUF1f0+djQT0ygb3oy
HKcvf1BmHFFZlUOZAEW4w1rFsx2/6vjkWvNECJOaVaGhUxZdPf9rbZPh9/QimBXqPU3UjabTmOBF
kfbqMxJnKrGuBlp1nbCe4QjF0Qpr/b4h6STdbXrO71zM/PaZ/p9qggBxBEL2GiVLnZT3KtqXAf/f
WPEdlTHSmx8QTLt6NkdCyARlIDXq2+8tytWaSeWLsjwKFwGVCJk2Ws78/dCzeyoC60BKGKMwx5wX
cZ95imikXWSl7wBaV52FHrbBpUqEWUvwkziUvoivZXE7ViDJgDjko8Kay46KI+5zu9UHrNbcCLeN
Xv0=
=6Iky
-----END PGP SIGNATURE-----

--------------MBff9comIPrzKVkl5gT20c0e--
