Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB145E780B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AB910E812;
	Fri, 23 Sep 2022 10:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABEC10E812;
 Fri, 23 Sep 2022 10:16:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 772992199F;
 Fri, 23 Sep 2022 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663928174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uWlDfpBqzu/EJuHaFCpW5xHHh909oJb+8xXkx4h7hQ=;
 b=09rJhXwaW7dtB4F/6u0H4gJ4Yo8FcVv7kDs630JIEZfNjphF3cASPiWIqAxAvdH+4sc8p7
 8S2oLV9QB5AdkAjpKKS08aQDy3r0bWadheqBf4KamfxUZmK1dcsNYHcOzL860LjTPUalkc
 Opjd4L+JIihsdFh1/HiuG9SIRExP3Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663928174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uWlDfpBqzu/EJuHaFCpW5xHHh909oJb+8xXkx4h7hQ=;
 b=gWavjDDsPK76f7kWdAOClX5fT8Ui4Li+27cbv2gpCpnKLW+oeuHjvk58qeXG4V3kFTV+Cx
 p+uxT3GmWKlffGAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECB9813A00;
 Fri, 23 Sep 2022 10:16:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fteiOG2HLWPuOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 10:16:13 +0000
Message-ID: <f17b239c-715a-7c9c-fb56-477daed28009@suse.de>
Date: Fri, 23 Sep 2022 12:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de> <87h70y4ffb.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87h70y4ffb.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1RmFDLRNVvy2XesQkLfVu539"
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1RmFDLRNVvy2XesQkLfVu539
Content-Type: multipart/mixed; boundary="------------Zo2ueaJGr2jfiX8cOTd5lHQB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Dom Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <f17b239c-715a-7c9c-fb56-477daed28009@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de> <87h70y4ffb.fsf@intel.com>
In-Reply-To: <87h70y4ffb.fsf@intel.com>

--------------Zo2ueaJGr2jfiX8cOTd5lHQB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDkuMjIgdW0gMTE6MTggc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
RnJpLCAyMyBTZXAgMjAyMiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gQW0gMjIuMDkuMjIgdW0gMTY6MjUgc2NocmllYiBNYXhpbWUgUmlw
YXJkOg0KPj4+ICsJZHJtX2RiZ19rbXMoZGV2LA0KPj4+ICsJCSAgICAiR2VuZXJhdGluZyBh
ICV1eCV1JWMsICV1LWxpbmUgbW9kZSB3aXRoIGEgJWx1IGtIeiBjbG9ja1xuIiwNCj4+PiAr
CQkgICAgaGFjdGl2ZSwgdmFjdGl2ZSwNCj4+PiArCQkgICAgaW50ZXJsYWNlID8gJ2knIDog
J3AnLA0KPj4+ICsJCSAgICBwYXJhbXMtPm51bV9saW5lcywNCj4+PiArCQkgICAgcGl4ZWxf
Y2xvY2tfaHogLyAxMDAwKTsNCj4+DQo+PiBEaXZpZGUgYnkgSFpfUEVSX0tIWiBoZXJlIGFu
ZCBpbiBvdGhlciBwbGFjZXMuDQo+Pg0KPj4gICAgIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC91bml0cy5oI0wyMw0KPiAN
Cj4gIEZyb20gdGhlIERlcGFydG1lbnQgb2YgQmlrZXNoZWRkaW5nOg0KPiANCj4gSSBmaW5k
ICJwaXhlbF9jbG9ja19oeiAvIDEwMDAiIGhhcyBtdWNoIG1vcmUgY2xhcml0eSB0aGFuDQo+
ICJwaXhlbF9jbG9ja19oeiAvIEhaX1BFUl9LSFoiLg0KDQpUaGlzIG9uZSdzIGVhc3kgdG8g
c2VlIGJlY2F1c2UgaXQgdGVsbHMgeW91IHdpdGggdGhlIF9oeiBwb3N0Zml4LiBNYW55IA0K
cGxhY2VzIGRvbid0IGFuZCB0aGVuIGl0IHF1aWNrbHkgZ2V0cyBjb25mdXNpbmcgd2hhdCB1
bml0cyB0aGUgY29kZSdzIA0KY29udmVydGluZy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gSSBkb24ndCBjb25zaWRlciB0aGUgU0kgcHJlZml4ZXMgbWFnaWMgbnVtYmVy
cy4NCj4gDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------Zo2ueaJGr2jfiX8cOTd5lHQB--

--------------1RmFDLRNVvy2XesQkLfVu539
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMth20FAwAAAAAACgkQlh/E3EQov+Cx
aw//f0JWJ9+sF7LmsIeAF7vtltW4VNLUnfcmaM8yu28JVx3jCNEG6N31UqTE3qcQJqJZWC9sn/1x
MYbPvMuMj2doh/Yjg3RVuWBskwXnioCdm6pxZ5tLLHkqddAhCZnVxlIftc2uhQbeR3rrV81tfM4B
LcQGi41mnZh9/uEriSLF+uJtXfgrYkCD/1K4IoAFLpX/DWBnfPcxUS+oyJLFikdl2/+bgraI2KKS
HAHph6qeKHWDmgHW5eC+zJ00bJHEhOa71Ounue1yT8qgHX6TACh1WqOIiiPr9T0x2oJ+GOCO3oTG
YvzTTB8oc5uX43xZ10rx0vWUKzTaHAt7adGfthZ4T3NhZv0rnA+i+YmiZEprC8mWr21qIyAPEVHU
6Jz/hBIhuI0m0AH80biWEjSvqsiNjckOtQZs5UOcE0N5R/uRLfja77i2HcsmqPLjpcY2pAQUXShJ
5W/j44ejzP8qZzavl9rTgjTuXHFhIfJsXD87d53oI810KC2lRyz5llO1yu99u5w1xoCp6CGTj0ax
0t15G6YLG5ZKyALzGovyCvdKtBEACmpniwL8Qrx+mXoyHKZne+7L7pUSxmHT0HZCugy+egycIRaD
xTFS84HHeLmS/uCPylGIaPdPOKXw/NHRWyU7URSTTl4cw/3EHb2gQERCkmI16r4Bkx29qiv7I2Ik
Yg8=
=JM3S
-----END PGP SIGNATURE-----

--------------1RmFDLRNVvy2XesQkLfVu539--
