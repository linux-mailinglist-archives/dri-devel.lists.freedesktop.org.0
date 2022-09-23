Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE305E7570
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5839C10E172;
	Fri, 23 Sep 2022 08:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB3F10E172;
 Fri, 23 Sep 2022 08:09:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A97751F86C;
 Fri, 23 Sep 2022 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663920556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvEwe7fja3fkLNF8GHLI8AdCafBOYcULDJ6qQjMJKVo=;
 b=jQ4Q8PjlMVvcCttclSj4l1baMHRgvQfcdrKlhPrSO/pG+0O81MTD/Y1p2FmY2Eqq614BhH
 45ErjvIBvhN77SbieSgPKfdrR3pe4rOKWbpP37myTx8aEUT/H8GzVO4oh1jzpoqXiUFkWf
 IYwSlna9x23jhypSENnRpO2PI+VsTCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663920556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvEwe7fja3fkLNF8GHLI8AdCafBOYcULDJ6qQjMJKVo=;
 b=+cayjvtsYGwb/zhxWiWhtqJja4hPsCca70w4tJkje857i+ga772ZZWyUky0jMFMMZ9c3NK
 j7p2sx2C4azSOlAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 262B113AA5;
 Fri, 23 Sep 2022 08:09:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GGs+CKxpLWMCAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 08:09:16 +0000
Message-ID: <2d1ba30b-81bc-f243-43ec-28e75193f6a5@suse.de>
Date: Fri, 23 Sep 2022 10:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/33] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
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
 <20220728-rpi-analog-tv-properties-v2-3-f733a0ed9f90@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-3-f733a0ed9f90@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------crmHgbBp40YYj23mxP0D6wRy"
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
--------------crmHgbBp40YYj23mxP0D6wRy
Content-Type: multipart/mixed; boundary="------------a0IpnFel1PYpN0GMyyqoIFv6";
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
Message-ID: <2d1ba30b-81bc-f243-43ec-28e75193f6a5@suse.de>
Subject: Re: [PATCH v2 03/33] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-3-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-3-f733a0ed9f90@cerno.tech>

--------------a0IpnFel1PYpN0GMyyqoIFv6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDkuMjIgdW0gMTY6MjUgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBX
ZSBjdXJyZW50bHkgaGF2ZSB0d28gc2V0cyBvZiBUViBwcm9wZXJ0aWVzLg0KPiANCj4gVGhl
IGZpcnN0IG9uZSBpcyB0aGVyZSB0byBkZWFsIHdpdGggYW5hbG9nIFRWIHByb3BlcnRpZXMs
IGNyZWF0aW5nDQo+IHByb3BlcnRpZXMgc3VjaCBhcyB0aGUgVFYgbW9kZSwgc3ViY29ubmVj
dG9ycywgc2F0dXJhdGlvbiwgaHVlIGFuZCBzbyBvbi4NCj4gSXQncyBjcmVhdGVkIGJ5IGNh
bGxpbmcgdGhlIGRybV9tb2RlX2NyZWF0ZV90dl9wcm9wZXJ0aWVzKCkgZnVuY3Rpb24uDQo+
IA0KPiBUaGUgc2Vjb25kIG9uZSBpcyB0aGVyZSB0byBkZWFsIHdpdGggcHJvcGVydGllcyB0
aGF0IG1pZ2h0IGJlIHVzZWZ1bCBvbiBhDQo+IFRWLCBjcmVhdGluZyB0aGUgb3ZlcnNjYW4g
bWFyZ2lucyBmb3IgZXhhbXBsZS4gSXQncyBjcmVhdGVkIGJ5IGNhbGxpbmcgdGhlDQo+IGRy
bV9tb2RlX2NyZWF0ZV90dl9tYXJnaW5fcHJvcGVydGllcygpLg0KPiANCj4gSG93ZXZlciwg
d2UgYWxzbyBoYXZlIGEgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X3Jlc2V0KCkg
ZnVuY3Rpb24NCj4gdGhhdCB3aWxsIHJlc2V0IHRoZSBUViBtYXJnaW4gcHJvcGVydGllcyB0
byB0aGVpciBkZWZhdWx0IHZhbHVlcywgYW5kIHRodXMNCj4gaXMgc3VwcG9zZWQgdG8gYmUg
Y2FsbGVkIGZvciB0aGUgbGF0dGVyIHNldC4gVGhpcyBjcmVhdGVzIGFuIGFtYmlndWl0eSBk
dWUNCj4gdG8gdGhlIGluY29uc2lzdGVudCBuYW1pbmcuDQo+IA0KPiBXZSBjYW4gdGh1cyBy
ZW5hbWUgdGhlIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldCgpIGZ1bmN0
aW9uIHRvDQo+IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9tYXJnaW5zX3Jlc2V0
KCkgdG8gcmVtb3ZlIHRoYXQgYW1iaWd1aXR5DQo+IGFuZCBob3BlZnVsbHkgbWFrZSBpdCBt
b3JlIG9idmlvdXMuDQo+IA0KPiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGlt
ZUBjZXJuby50ZWNoPg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX3N0YXRlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3Rh
dGVfaGVscGVyLmMNCj4gaW5kZXggYmYzMWI5ZDkyMDk0Li5kZmI1NzIxNzI1M2IgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jDQo+IEBA
IC00NjQsMTIgKzQ2NCwxMiBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9y
ZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiAgIEVYUE9SVF9TWU1C
T0woZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KTsNCj4gICANCj4gICAvKioN
Cj4gLSAqIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldCAtIFJlc2V0cyBU
ViBjb25uZWN0b3IgcHJvcGVydGllcw0KPiArICogZHJtX2F0b21pY19oZWxwZXJfY29ubmVj
dG9yX3R2X21hcmdpbnNfcmVzZXQgLSBSZXNldHMgVFYgY29ubmVjdG9yIHByb3BlcnRpZXMN
Cj4gICAgKiBAY29ubmVjdG9yOiBEUk0gY29ubmVjdG9yDQo+ICAgICoNCj4gICAgKiBSZXNl
dHMgdGhlIFRWLXJlbGF0ZWQgcHJvcGVydGllcyBhdHRhY2hlZCB0byBhIGNvbm5lY3Rvci4N
Cj4gICAgKi8NCj4gLXZvaWQgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X3Jlc2V0
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICt2b2lkIGRybV9hdG9taWNf
aGVscGVyX2Nvbm5lY3Rvcl90dl9tYXJnaW5zX3Jlc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2NtZGxpbmVfbW9kZSAqY21k
bGluZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsNCj4gICAJc3RydWN0IGRybV9jb25u
ZWN0b3Jfc3RhdGUgKnN0YXRlID0gY29ubmVjdG9yLT5zdGF0ZTsNCj4gQEAgLTQ3OSw3ICs0
NzksNyBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiAgIAlzdGF0ZS0+dHYubWFyZ2lucy50
b3AgPSBjbWRsaW5lLT50dl9tYXJnaW5zLnRvcDsNCj4gICAJc3RhdGUtPnR2Lm1hcmdpbnMu
Ym90dG9tID0gY21kbGluZS0+dHZfbWFyZ2lucy5ib3R0b207DQo+ICAgfQ0KPiAtRVhQT1JU
X1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfcmVzZXQpOw0KPiArRVhQ
T1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfbWFyZ2luc19yZXNl
dCk7DQo+ICAgDQo+ICAgLyoqDQo+ICAgICogX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0
b3JfZHVwbGljYXRlX3N0YXRlIC0gY29weSBhdG9taWMgY29ubmVjdG9yIHN0YXRlDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5lY3Rvci5jDQo+IGluZGV4IGQwYWRkZDQ3ODgxNS4u
ZmE2MzYyMDZmMjMyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9j
b25uZWN0b3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3Iu
Yw0KPiBAQCAtMzU1LDcgKzM1NSw3IEBAIHN0YXRpYyB2b2lkIGd1ZF9jb25uZWN0b3JfcmVz
ZXQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gICAJZHJtX2F0b21pY19o
ZWxwZXJfY29ubmVjdG9yX3Jlc2V0KGNvbm5lY3Rvcik7DQo+ICAgCWNvbm5lY3Rvci0+c3Rh
dGUtPnR2ID0gZ2Nvbm4tPmluaXRpYWxfdHZfc3RhdGU7DQo+ICAgCS8qIFNldCBtYXJnaW5z
IGZyb20gY29tbWFuZCBsaW5lICovDQo+IC0JZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3R2X3Jlc2V0KGNvbm5lY3Rvcik7DQo+ICsJZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3R2X21hcmdpbnNfcmVzZXQoY29ubmVjdG9yKTsNCj4gICAJaWYgKGdjb25uLT5pbml0aWFs
X2JyaWdodG5lc3MgPj0gMCkNCj4gICAJCWNvbm5lY3Rvci0+c3RhdGUtPnR2LmJyaWdodG5l
c3MgPSBnY29ubi0+aW5pdGlhbF9icmlnaHRuZXNzOw0KPiAgIH0NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2hkbWkuYw0KPiBpbmRleCA0ZDNmZjUxYWQyYTguLmZlMDFjYTVhMDdkMyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYw0KPiBAQCAtMzk2LDcgKzM5Niw3IEBAIHN0YXRp
YyB2b2lkIHZjNF9oZG1pX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQ0KPiAgIAluZXdfc3RhdGUtPmJhc2UubWF4X2JwYyA9IDg7DQo+ICAgCW5l
d19zdGF0ZS0+YmFzZS5tYXhfcmVxdWVzdGVkX2JwYyA9IDg7DQo+ICAgCW5ld19zdGF0ZS0+
b3V0cHV0X2Zvcm1hdCA9IFZDNF9IRE1JX09VVFBVVF9SR0I7DQo+IC0JZHJtX2F0b21pY19o
ZWxwZXJfY29ubmVjdG9yX3R2X3Jlc2V0KGNvbm5lY3Rvcik7DQo+ICsJZHJtX2F0b21pY19o
ZWxwZXJfY29ubmVjdG9yX3R2X21hcmdpbnNfcmVzZXQoY29ubmVjdG9yKTsNCj4gICB9DQo+
ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICoNCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5oDQo+IGluZGV4IDNmOGYxZDYyN2Y3Yy4u
MTkyNzY2NjU2Yjg4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYXRvbWljX3N0
YXRlX2hlbHBlci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVs
cGVyLmgNCj4gQEAgLTcwLDcgKzcwLDcgQEAgdm9pZCBfX2RybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl9zdGF0ZV9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl8N
Cj4gICB2b2lkIF9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ICAgCQkJCQkgc3RydWN0IGRybV9jb25uZWN0
b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOw0KPiAgIHZvaWQgZHJtX2F0b21pY19oZWxwZXJfY29u
bmVjdG9yX3Jlc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpOw0KPiAtdm9p
ZCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfcmVzZXQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3Rvcik7DQo+ICt2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl90dl9tYXJnaW5zX3Jlc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpOw0K
PiAgIHZvaWQNCj4gICBfX2RybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVf
c3RhdGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gICAJCQkJCSAgIHN0
cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpzdGF0ZSk7DQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgN
Cj4gaW5kZXggMjQ4MjA2YmJkOTc1Li4yMzExMmYwYzExY2YgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmgNCj4gQEAgLTY5Miw3ICs2OTIsNyBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl90
dl9tYXJnaW5zIHsNCj4gICANCj4gICAvKioNCj4gICAgKiBzdHJ1Y3QgZHJtX3R2X2Nvbm5l
Y3Rvcl9zdGF0ZSAtIFRWIGNvbm5lY3RvciByZWxhdGVkIHN0YXRlcw0KPiAtICogQHN1YmNv
bm5lY3Rvcjogc2VsZWN0ZWQgc3ViY29ubmVjdG9yDQo+ICsgKiBAc2VsZWN0X3N1YmNvbm5l
Y3Rvcjogc2VsZWN0ZWQgc3ViY29ubmVjdG9yDQo+ICAgICogQG1hcmdpbnM6IFRWIG1hcmdp
bnMNCj4gICAgKiBAbW9kZTogVFYgbW9kZQ0KPiAgICAqIEBicmlnaHRuZXNzOiBicmlnaHRu
ZXNzIGluIHBlcmNlbnQNCj4gDQoNClRoYXQgZmluYWwgY2h1bmsgbG9va3MgbGlrZSBhIHNl
cGFyYXRlIHBhdGNoLg0KDQpJbiBhbnkgY2FzZQ0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------a0IpnFel1PYpN0GMyyqoIFv6--

--------------crmHgbBp40YYj23mxP0D6wRy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtaasFAwAAAAAACgkQlh/E3EQov+AN
UhAAk+Ylh0CH+Nrp1AGZUA/KNSSr81TG7G7CGkS5mGPwRXULH6tpLBMgLZv9buatPAODBDhXhvVM
nJk377go8pxfL6p1L3k6dsGVBRxv85GEy7mxnb71ls6cfoCLsEaMQish3C6IlXPF9eHUnhbYhrvf
Uu7w/jAiGMuOBUUvsjzAfsCaLky9ZM/wnQbP0Aeydkm3uX+lYd0ftbhsjBzEyVe/tssDR2OMFEdI
oXkwyoajW3ITMOG8tksywrPPcw2H8O/X80FvLo3CT58ObVB257uFSaEWDXgQAzEIbyqNOb/oVKEH
byICbUtkDj2WdBCRJRkm2Fh+xQxkzntd235uyyGjvNfFgMv/CDfs4sG2eine/WR/VFQnTOBggDCI
h4zegnooHNOSh664sY+ZNCYsdsFbLBoVnvXZ8ldCh2YF8/5tyazpje7RZy2t8gAYHUhTTbgEwd/l
ZxbSQIshbpOq290wM7khHlTe7PutIqWG5XVG64zb15yTAY1DTUHI6Grfac6bVG243ZosK0t9qs72
JtUdlHVCHdLggM+w57weox4WSMQ5eoY5u7vwqMCS5R9Q/05WjVbOXHY0jimqCmc6TzQBQFTveMdx
iPSyNhOXjxPtqUx9FaGmybHTI7PUvABC0EhgTi4o2tyUO2SbsIb6Bhl0vBpWjPygd/kR72YI4yb/
Xu8=
=oe1x
-----END PGP SIGNATURE-----

--------------crmHgbBp40YYj23mxP0D6wRy--
