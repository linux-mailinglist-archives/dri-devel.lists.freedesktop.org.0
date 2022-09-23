Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7DF5E7580
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABD910E4C6;
	Fri, 23 Sep 2022 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2710E4B6;
 Fri, 23 Sep 2022 08:14:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F07E219EA;
 Fri, 23 Sep 2022 08:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663920873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ASXCkFRUbJoE/3F2MFFGTXhkMManE2dYFW0GYJD/cpw=;
 b=hX7ZnecbxTw1+rDyK3XIV8ndl+eV0INnbmwoBCpAdcc8sIRnfPq88fVvgW/XfUCVLboscM
 nRtK31aaa+NuiUGtM4s+ryqLcxa14hIStpe31xNnzsLZtSe5oqBOeudKqD6fcpoYvn4Xvc
 KTKHcGVbRUXQTEG1VtIy0exaeq5UGJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663920873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ASXCkFRUbJoE/3F2MFFGTXhkMManE2dYFW0GYJD/cpw=;
 b=Uehs1yrqW0GtDjBo7GapG5yDH+hBjisr5sqnZKvg5xfE27+vQp4fx+h4Wct7fM+vuuOAa7
 /fIjtGxFsep9B0Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B042D13AA5;
 Fri, 23 Sep 2022 08:14:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9pYMKuhqLWMkBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 08:14:32 +0000
Message-ID: <5792db62-f23a-851d-0225-b9d6f3709bee@suse.de>
Date: Fri, 23 Sep 2022 10:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 04/33] drm/connector: Rename subconnector state variable
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
 <20220728-rpi-analog-tv-properties-v2-4-f733a0ed9f90@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-4-f733a0ed9f90@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QHL5rTevXG8tYdO6fBAXCMDm"
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
--------------QHL5rTevXG8tYdO6fBAXCMDm
Content-Type: multipart/mixed; boundary="------------dN9WZxEPP0gMtWMFmfo7iqhC";
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
Message-ID: <5792db62-f23a-851d-0225-b9d6f3709bee@suse.de>
Subject: Re: [PATCH v2 04/33] drm/connector: Rename subconnector state
 variable
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-4-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-4-f733a0ed9f90@cerno.tech>

--------------dN9WZxEPP0gMtWMFmfo7iqhC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDkuMjIgdW0gMTY6MjUgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBU
aGVyZSBpcyB0d28gVFYgc3ViY29ubmVjdG9yIHJlbGF0ZWQgcHJvcGVydGllcyByZWdpc3Rl
cmVkIGJ5DQo+IGRybV9tb2RlX2NyZWF0ZV90dl9wcm9wZXJ0aWVzKCk6IHN1YmNvbm5lY3Rv
ciBhbmQgc2VsZWN0IHN1YmNvbm5lY3Rvci4NCj4gDQo+IFdoaWxlIHRoZSBzZWxlY3Qgc3Vi
Y29ubmVjdG9yIHByb3BlcnR5IGlzIHN0b3JlZCBpbiB0aGUga2VybmVsIGJ5IHRoZQ0KPiBk
cm1fdHZfY29ubmVjdG9yX3N0YXRlIHN0cnVjdHVyZSwgdGhlIHN1YmNvbm5lY3RvciBwcm9w
ZXJ0eSBpc24ndCBzdG9yZWQNCj4gYW55d2hlcmUuDQo+IA0KPiBXb3JzZSwgdGhlIHNlbGVj
dCBzdWJjb25uZWN0b3IgcHJvcGVydHkgaXMgc3RvcmVkIGluIGEgZmllbGQgY2FsbGVkDQo+
IHN1YmNvbm5lY3RvciwgY3JlYXRpbmcgc29tZSBhbWJpZ3VpdHkgYWJvdXQgd2hpY2ggcHJv
cGVydHkgY29udGVudCB3ZSdyZQ0KPiBhY2Nlc3NpbmcuDQo+IA0KPiBMZXQncyByZW5hbWUg
dGhhdCBmaWVsZCB0byBvbmUgY2FsbGVkIHNlbGVjdF9zdWJjb25uZWN0b3IgdG8gbWFrZSBp
dCBtb3ZlDQo+IG9idmlvdXMgd2hhdCBpdCdzIGFib3V0Lg0KDQpJcyB0aGlzIHRoZSBwbGFj
ZSB3aGVyZSB0aGF0IGV4dHJhIGNodWNrIGluIHBhdGNoIDMgYmVsb25nIHRvPw0KDQo+IA0K
PiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+DQo+
IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KDQpB
Y2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gaW5kZXggNzk3MzBmYTFkZDhl
Li5jNzRjNzhhMjgxNzEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX3VhcGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMN
Cj4gQEAgLTY4Nyw3ICs2ODcsNyBAQCBzdGF0aWMgaW50IGRybV9hdG9taWNfY29ubmVjdG9y
X3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAkJ
ICovDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICAJfSBlbHNlIGlmIChwcm9wZXJ0eSA9
PSBjb25maWctPnR2X3NlbGVjdF9zdWJjb25uZWN0b3JfcHJvcGVydHkpIHsNCj4gLQkJc3Rh
dGUtPnR2LnN1YmNvbm5lY3RvciA9IHZhbDsNCj4gKwkJc3RhdGUtPnR2LnNlbGVjdF9zdWJj
b25uZWN0b3IgPSB2YWw7DQo+ICAgCX0gZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT50
dl9sZWZ0X21hcmdpbl9wcm9wZXJ0eSkgew0KPiAgIAkJc3RhdGUtPnR2Lm1hcmdpbnMubGVm
dCA9IHZhbDsNCj4gICAJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPnR2X3JpZ2h0
X21hcmdpbl9wcm9wZXJ0eSkgew0KPiBAQCAtNzk1LDcgKzc5NSw3IEBAIGRybV9hdG9taWNf
Y29ubmVjdG9yX2dldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LA0KPiAgIAkJZWxzZQ0KPiAgIAkJCSp2YWwgPSBjb25uZWN0b3ItPmRwbXM7DQo+ICAgCX0g
ZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT50dl9zZWxlY3Rfc3ViY29ubmVjdG9yX3By
b3BlcnR5KSB7DQo+IC0JCSp2YWwgPSBzdGF0ZS0+dHYuc3ViY29ubmVjdG9yOw0KPiArCQkq
dmFsID0gc3RhdGUtPnR2LnNlbGVjdF9zdWJjb25uZWN0b3I7DQo+ICAgCX0gZWxzZSBpZiAo
cHJvcGVydHkgPT0gY29uZmlnLT50dl9sZWZ0X21hcmdpbl9wcm9wZXJ0eSkgew0KPiAgIAkJ
KnZhbCA9IHN0YXRlLT50di5tYXJnaW5zLmxlZnQ7DQo+ICAgCX0gZWxzZSBpZiAocHJvcGVy
dHkgPT0gY29uZmlnLT50dl9yaWdodF9tYXJnaW5fcHJvcGVydHkpIHsNCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaA0KPiBpbmRleCAyMzExMmYwYzExY2YuLjYwYjU2NjJkZWM3YyAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaA0KPiBAQCAtNzAzLDcgKzcwMyw3IEBAIHN0cnVjdCBkcm1fY29u
bmVjdG9yX3R2X21hcmdpbnMgew0KPiAgICAqIEBodWU6IGh1ZSBpbiBwZXJjZW50DQo+ICAg
ICovDQo+ICAgc3RydWN0IGRybV90dl9jb25uZWN0b3Jfc3RhdGUgew0KPiAtCWVudW0gZHJt
X21vZGVfc3ViY29ubmVjdG9yIHN1YmNvbm5lY3RvcjsNCj4gKwllbnVtIGRybV9tb2RlX3N1
YmNvbm5lY3RvciBzZWxlY3Rfc3ViY29ubmVjdG9yOw0KPiAgIAlzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl90dl9tYXJnaW5zIG1hcmdpbnM7DQo+ICAgCXVuc2lnbmVkIGludCBtb2RlOw0KPiAg
IAl1bnNpZ25lZCBpbnQgYnJpZ2h0bmVzczsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------dN9WZxEPP0gMtWMFmfo7iqhC--

--------------QHL5rTevXG8tYdO6fBAXCMDm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtaugFAwAAAAAACgkQlh/E3EQov+Bw
0A/6A+Pc3rBIE/qFCPxn78w/5RhK/MGIjeL/c7L8SZ3YEdw6KpzJMhwXsKropaMaYB/sx7nUdrdB
besBtgFMIHGZEbEUbTp3kkoOuCZuDkvZBiZg7xDecO9+gXh/bhLyNORPj8Q+idY/kr7rcUG40liS
KcLcVQxje3nZBW0uzYYTAY5zg53rFC6ystEpFywm62ZA1zL/anwOuaSVUzzT4ScbIkZZZG7VH9uM
NeGxEnsTj5gB5NmMgiv8srB6d77cYTmgB0tV23+j2IBVOGE3fehG6rbK0Z9beCK95JUI5gOYdHZ6
ip6Ymsh+SFKKYsnAlyBGve1z30m4mX+BtljhvgCTqngKYR0qtyIi8wgDBcADfHgCZfRWfLHZmWz4
gY5FVEk4bk8fxOORQrFKs5uiIVoVV1XqpnQQsHRUeefmnAFogHmwH+NP/+C4A3CpOKpz7muGKP3P
zCn3+JTq5lUujdlR0BDFxIcVLGK6WcCO6V4TVoI5GWlIX9HqbUDHUzoy1jIYx/Xv3bs7zxpbxTYc
VdOZrpleDaC1DRQZDdr/tS+DvAX9yjBsAukSG8BavHCF6sVgCmOipkVdvXeofhDPjQM3awUGe242
Uh0cCZ/1IhUkOlVacvKbpos4Tb9XxhsF/kC1Qh5TEkgscCZ//uhuD+dH6F1+Ovjh2xtZLG3dNr78
9k8=
=RARJ
-----END PGP SIGNATURE-----

--------------QHL5rTevXG8tYdO6fBAXCMDm--
