Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D715E769A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBD810E7D0;
	Fri, 23 Sep 2022 09:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4C10E7CB;
 Fri, 23 Sep 2022 09:15:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 89A171FA43;
 Fri, 23 Sep 2022 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663924547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dOgHSR6L9/sAQP747SXyuwSUWLbnQN93Hcy4rKUWDik=;
 b=PzrMK1JQsNJgHlbUaPjxS8RpAod5fgeQhzLz2ZFRoNhJuo/UgPGaJlLDxWe6Mbv75k9yXh
 ZJU9Blz4FMzeZArcEcugv/jvwdy0Gbw5PdeSzvkwMVV9d+HsKhr+tOPPn09zyWZc47+CTo
 rF7RDB4Gk4F8oMc+F8qk1AP9hV0mCtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663924547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dOgHSR6L9/sAQP747SXyuwSUWLbnQN93Hcy4rKUWDik=;
 b=odkaX8+gK+QzvFYocogwgVIalLwy61XCfK48AHcoft0y+zuoZZ1DThN34fVcBXZ9FHTnvA
 BiW1/Bdk2paheiDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0624613A00;
 Fri, 23 Sep 2022 09:15:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jL1EAEN5LWN3HwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 09:15:47 +0000
Message-ID: <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
Date: Fri, 23 Sep 2022 11:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gYSD1CrS0NtLnYVeqBMoYpXb"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gYSD1CrS0NtLnYVeqBMoYpXb
Content-Type: multipart/mixed; boundary="------------D7EKyNDKkzbNvyOfOSRONq0Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>

--------------D7EKyNDKkzbNvyOfOSRONq0Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDkuMjIgdW0gMTY6MjUgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBk
cm1fY29ubmVjdG9yX3BpY2tfY21kbGluZV9tb2RlKCkgaXMgaW4gY2hhcmdlIG9mIGZpbmRp
bmcgYSBwcm9wZXINCj4gZHJtX2Rpc3BsYXlfbW9kZSBmcm9tIHRoZSBkZWZpbml0aW9uIHdl
IGdvdCBpbiB0aGUgdmlkZW89IGNvbW1hbmQgbGluZQ0KPiBhcmd1bWVudC4NCj4gDQo+IExl
dCdzIGFkZCBzb21lIHVuaXQgdGVzdHMgdG8gbWFrZSBzdXJlIHdlJ3JlIG5vdCBnZXR0aW5n
IGFueSByZWdyZXNzaW9ucw0KPiB0aGVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y2xpZW50X21vZGVzZXQuYw0KPiBpbmRleCBiYmM1MzVjYzUwZGQuLmQ1NTNlNzkzZTY3MyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYw0KPiBAQCAtMTIz
NywzICsxMjM3LDcgQEAgaW50IGRybV9jbGllbnRfbW9kZXNldF9kcG1zKHN0cnVjdCBkcm1f
Y2xpZW50X2RldiAqY2xpZW50LCBpbnQgbW9kZSkNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9
DQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X21vZGVzZXRfZHBtcyk7DQo+ICsNCj4g
KyNpZmRlZiBDT05GSUdfRFJNX0tVTklUX1RFU1QNCj4gKyNpbmNsdWRlICJ0ZXN0cy9kcm1f
Y2xpZW50X21vZGVzZXRfdGVzdC5jIg0KPiArI2VuZGlmDQoNCkkgc3Ryb25nbHkgZGlzbGlr
ZSB0aGlzIHN0eWxlIG9mIGluY2x1ZGluZyBzb3VyY2UgZmlsZXMgaW4gZWFjaCBvdGhlci4g
DQpJdCdzIGEgcmVjaXBlIGZvciBhbGwga2luZCBvZiBidWlsZCBlcnJvcnMuIENhbiB5b3Ug
ZG8gc29tZXRoaW5nIGVsc2U/DQoNCkFzIHRoZSB0ZXN0ZWQgZnVuY3Rpb24gaXMgYW4gaW50
ZXJuYWwgaW50ZXJmYWNlLCBtYXliZSBleHBvcnQgYSB3cmFwcGVyIA0KaWYgdGVzdHMgYXJl
IGVuYWJsZWQsIGxpa2UgdGhpczoNCg0KI2lmZGVmIENPTkZJR19EUk1fS1VOSVRfVEVTVA0K
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKg0KZHJtX2Nvbm5lY3Rvcl9waWNrX2NtZGxpbmVf
bW9kZV9rdW5pdChkcm1fY29uZW5jdG9yKQ0Kew0KICAgcmV0dXJuIGRybV9jb25uZWN0b3Jf
cGlja19jbWRsaW5lX21vZGUoY29ubmVjdG9yKQ0KfQ0KRVhQT1JUX1NZTUJPTChkcm1fY29u
bmVjdG9yX3BpY2tfY21kbGluZV9tb2RlX2t1bml0KQ0KI2VuZGlmDQoNClRoZSB3cmFwcGVy
J3MgZGVjbGFyYXRpb24gY2FuIGJlIGxvY2F0ZWQgaW4gdGhlIGt1bml0IHRlc3QgZmlsZS4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Rlc3RzL2RybV9jbGllbnRfbW9kZXNldF90ZXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
dGVzdHMvZHJtX2NsaWVudF9tb2Rlc2V0X3Rlc3QuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ2MzM1ZGU3YmM2Yg0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fY2xpZW50X21vZGVzZXRfdGVz
dC5jDQo+IEBAIC0wLDAgKzEsMTE0IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGt1
bml0L3Rlc3QuaD4NCj4gKw0KPiArI2luY2x1ZGUgPGRybS9kcm1fY29ubmVjdG9yLmg+DQo+
ICsjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcnYu
aD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcm9i
ZV9oZWxwZXIuaD4NCj4gKw0KPiArI2luY2x1ZGUgImRybV9rdW5pdF9oZWxwZXJzLmgiDQo+
ICsNCj4gK3N0cnVjdCBkcm1fY2xpZW50X21vZGVzZXRfdGVzdF9wcml2IHsNCj4gKwlzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtOw0KPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yIGNvbm5lY3Rv
cjsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2Nvbm5l
Y3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gK3sN
Cj4gKwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsNCj4gKwlpbnQgY291bnQ7DQo+
ICsNCj4gKwljb3VudCA9IGRybV9hZGRfbW9kZXNfbm9lZGlkKGNvbm5lY3RvciwgMTkyMCwg
MTIwMCk7DQo+ICsNCj4gKwlyZXR1cm4gY291bnQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgZHJtX2NsaWVudF9tb2Rl
c2V0X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7DQo+ICsJLmdldF9tb2RlcyA9IGRybV9j
bGllbnRfbW9kZXNldF9jb25uZWN0b3JfZ2V0X21vZGVzLA0KPiArfTsNCj4gKw0KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRybV9jbGllbnRfbW9kZXNl
dF9jb25uZWN0b3JfZnVuY3MgPSB7DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IGRybV9j
bGllbnRfbW9kZXNldF90ZXN0X2luaXQoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiArew0KPiAr
CXN0cnVjdCBkcm1fY2xpZW50X21vZGVzZXRfdGVzdF9wcml2ICpwcml2Ow0KPiArCWludCBy
ZXQ7DQo+ICsNCj4gKwlwcml2ID0ga3VuaXRfa3phbGxvYyh0ZXN0LCBzaXplb2YoKnByaXYp
LCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXByaXYpDQo+ICsJCXJldHVybiAtRU5PTUVNOw0K
PiArCXRlc3QtPnByaXYgPSBwcml2Ow0KPiArDQo+ICsJcHJpdi0+ZHJtID0gZHJtX2t1bml0
X2RldmljZV9pbml0KCJkcm0tY2xpZW50LW1vZGVzZXQtdGVzdCIpOw0KPiArCWlmIChJU19F
UlIocHJpdi0+ZHJtKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIocHJpdi0+ZHJtKTsNCj4gKw0K
PiArCXJldCA9IGRybW1fY29ubmVjdG9yX2luaXQocHJpdi0+ZHJtLCAmcHJpdi0+Y29ubmVj
dG9yLA0KPiArCQkJCSAgJmRybV9jbGllbnRfbW9kZXNldF9jb25uZWN0b3JfZnVuY3MsDQo+
ICsJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93biwNCj4gKwkJCQkgIE5VTEwpOw0K
PiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsJZHJtX2Nvbm5lY3Rvcl9oZWxw
ZXJfYWRkKCZwcml2LT5jb25uZWN0b3IsICZkcm1fY2xpZW50X21vZGVzZXRfY29ubmVjdG9y
X2hlbHBlcl9mdW5jcyk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHZvaWQgZHJtX2NsaWVudF9tb2Rlc2V0X3Rlc3RfZXhpdChzdHJ1Y3Qga3VuaXQgKnRl
c3QpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9jbGllbnRfbW9kZXNldF90ZXN0X3ByaXYgKnBy
aXYgPSB0ZXN0LT5wcml2Ow0KPiArDQo+ICsJZHJtX2t1bml0X2RldmljZV9leGl0KHByaXYt
PmRybSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGRybV9waWNrX2NtZGxpbmVfcmVz
XzE5MjBfMTA4MF82MChzdHJ1Y3Qga3VuaXQgKnRlc3QpDQo+ICt7DQo+ICsJc3RydWN0IGRy
bV9jbGllbnRfbW9kZXNldF90ZXN0X3ByaXYgKnByaXYgPSB0ZXN0LT5wcml2Ow0KPiArCXN0
cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBwcml2LT5kcm07DQo+ICsJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciA9ICZwcml2LT5jb25uZWN0b3I7DQo+ICsJc3RydWN0IGRybV9j
bWRsaW5lX21vZGUgKmNtZGxpbmVfbW9kZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsN
Cj4gKwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZXhwZWN0ZWRfbW9kZSwgKm1vZGU7DQo+
ICsJY29uc3QgY2hhciAqY21kbGluZSA9ICIxOTIweDEwODBANjAiOw0KPiArCWludCByZXQ7
DQo+ICsNCj4gKwlleHBlY3RlZF9tb2RlID0gZHJtX21vZGVfZmluZF9kbXQocHJpdi0+ZHJt
LCAxOTIwLCAxMDgwLCA2MCwgZmFsc2UpOw0KPiArCUtVTklUX0FTU0VSVF9QVFJfTkUodGVz
dCwgZXhwZWN0ZWRfbW9kZSwgTlVMTCk7DQo+ICsNCj4gKwlLVU5JVF9BU1NFUlRfVFJVRSh0
ZXN0LA0KPiArCQkJICBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rv
cihjbWRsaW5lLA0KPiArCQkJCQkJCQkgICAgY29ubmVjdG9yLA0KPiArCQkJCQkJCQkgICAg
Y21kbGluZV9tb2RlKSk7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZkcm0tPm1vZGVfY29uZmln
Lm11dGV4KTsNCj4gKwlyZXQgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3Jf
bW9kZXMoY29ubmVjdG9yLCAxOTIwLCAxMDgwKTsNCj4gKwltdXRleF91bmxvY2soJmRybS0+
bW9kZV9jb25maWcubXV0ZXgpOw0KPiArCUtVTklUX0FTU0VSVF9HVCh0ZXN0LCByZXQsIDAp
Ow0KPiArDQo+ICsJbW9kZSA9IGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGUoY29u
bmVjdG9yKTsNCj4gKwlLVU5JVF9BU1NFUlRfUFRSX05FKHRlc3QsIG1vZGUsIE5VTEwpOw0K
PiArDQo+ICsJS1VOSVRfRVhQRUNUX1RSVUUodGVzdCwgZHJtX21vZGVfZXF1YWwoZXhwZWN0
ZWRfbW9kZSwgbW9kZSkpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGt1bml0X2Nh
c2UgZHJtX3BpY2tfY21kbGluZV90ZXN0c1tdID0gew0KPiArCUtVTklUX0NBU0UoZHJtX3Bp
Y2tfY21kbGluZV9yZXNfMTkyMF8xMDgwXzYwKSwNCj4gKwl7fQ0KPiArfTsNCj4gKw0KPiAr
c3RhdGljIHN0cnVjdCBrdW5pdF9zdWl0ZSBkcm1fcGlja19jbWRsaW5lX3Rlc3Rfc3VpdGUg
PSB7DQo+ICsJLm5hbWUgPSAiZHJtX3BpY2tfY21kbGluZSIsDQo+ICsJLmluaXQgPSBkcm1f
Y2xpZW50X21vZGVzZXRfdGVzdF9pbml0LA0KPiArCS5leGl0ID0gZHJtX2NsaWVudF9tb2Rl
c2V0X3Rlc3RfZXhpdCwNCj4gKwkudGVzdF9jYXNlcyA9IGRybV9waWNrX2NtZGxpbmVfdGVz
dHMNCj4gK307DQo+ICsNCj4gK2t1bml0X3Rlc3Rfc3VpdGUoZHJtX3BpY2tfY21kbGluZV90
ZXN0X3N1aXRlKTsNCj4gK01PRFVMRV9BVVRIT1IoIk1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4iKTsNCj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------D7EKyNDKkzbNvyOfOSRONq0Y--

--------------gYSD1CrS0NtLnYVeqBMoYpXb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMteUIFAwAAAAAACgkQlh/E3EQov+BE
LA//SR8nzg5q5gyfYVZPMY2Zf9OfwmS9YHSNDsEwpYPXQ//r520wgxU1A3C+sdSM2Fjd4p0n6o8r
/YftMsvQpHBozPl0M8Krrz1jIaCtQO/IYuWkumkurlP9003BN+9oF/sz04lrBUxWYN1cT9JF3e20
g2rJzetQpEygdY/tenfR9LbQDPvbuuOgAHHP8kdLdwtVWZ6jpEW2nP9dg1WJOAIX7gzvsErDAvjS
Irzn8rt8G94m4DieyGQRYchvrNWTdSNTwJmI1HfRIp6pSZYLeuGEzAHfQBbr2K+qzcVgAwNNoSvg
VbUieZNgDLsWMBxHyuSXn4BHey3pTiiA/F2WcW4+bAb/hsd7A8yeVyU5Ir0lI0QSxXf3a0JbeaLB
xK8R7uPxQWyAAyNn8/Xbpp06v2zobkwlPWd5M5FmGV7ETvMYx1/gQ1GVfMowPfjaO3ltQJagMwxV
9jLl34MIozk4/o3C47TaEsqLxio/4/flKU+etW20vLoFg63NNnPf7IFH4fvzwkcf0L496FvzWE0s
VSBqZunzmSRClzH6MGsi/UJd2rxrv/4DciAZ20gKtPxVIjBUrjROJOFdxu532P5xTtKhNU5/NNNd
5EmEjgYP2kT5XVnoeUxqFhkl4AQWE44yUWPwvswQxWPzGRMTUdXFiuXbAK9QH8xNK98Ld1Qc3+pS
B18=
=Va7L
-----END PGP SIGNATURE-----

--------------gYSD1CrS0NtLnYVeqBMoYpXb--
