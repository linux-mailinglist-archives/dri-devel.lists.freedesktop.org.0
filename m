Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF297524A6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F1210E0ED;
	Thu, 13 Jul 2023 14:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42E10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:08:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F80F1FD65;
 Thu, 13 Jul 2023 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689257324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QnFmVvFCuLEBWexoN95aS6kun6tnEJ6brKAY+VJ+RZ0=;
 b=oTGiGHiSv7XssgndzV6XABS1+pgj6emc1wRHyTTRI4irsElOP3NFC7FlEH0RGmOnz0LXpe
 jTFlLaJolUb1C7qQhkaOlSltlNUM+VzIp5bFRKvnEbVpIblrdhQtw5Lv3H0BBw4UlGeiW5
 Krx97TxZud58bUNgMdqDu33w4krU1v4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689257324;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QnFmVvFCuLEBWexoN95aS6kun6tnEJ6brKAY+VJ+RZ0=;
 b=nLZyWn231S6xtOnr0vBsbyrJwUP7Q1ulL9uPH2g8lGFvN6G29ka44lbXFZDrbMrypKvtLY
 im2gPfO58EL2ZTBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 005B013489;
 Thu, 13 Jul 2023 14:08:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GMmAOmsFsGQ1YQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 14:08:43 +0000
Message-ID: <4e985e56-ef32-5793-2f63-27804ff4bd65@suse.de>
Date: Thu, 13 Jul 2023 16:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
 <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
 <a58b24d4-c02e-68cd-8e90-1674f6f5740b@suse.de>
 <20230713131102.rj4s66yui7cvuw54@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230713131102.rj4s66yui7cvuw54@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EN080DlF767g5PaOsX3hjnsP"
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, kernel@pengutronix.de,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EN080DlF767g5PaOsX3hjnsP
Content-Type: multipart/mixed; boundary="------------ZfyBt5jEFTxeRRg47tXaBt8O";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Maxime Ripard <mripard@kernel.org>, Julia Lawall <julia.lawall@inria.fr>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul
 <seanpaul@chromium.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <4e985e56-ef32-5793-2f63-27804ff4bd65@suse.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
 <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
 <a58b24d4-c02e-68cd-8e90-1674f6f5740b@suse.de>
 <20230713131102.rj4s66yui7cvuw54@pengutronix.de>
In-Reply-To: <20230713131102.rj4s66yui7cvuw54@pengutronix.de>

--------------ZfyBt5jEFTxeRRg47tXaBt8O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTU6MTEgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoN
Cj4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTI6NDE6MTVQTSArMDIwMCwgVGhvbWFzIFpp
bW1lcm1hbm4gd3JvdGU6DQo+PiBIaSBVd2UNCj4+DQo+PiBBbSAxMy4wNy4yMyB1bSAxMjoy
MiBzY2hyaWViIFV3ZSBLbGVpbmUtS8O2bmlnOg0KPj4gWy4uLl0NCj4+Pg0KPj4+IElmIHRo
YXQgaGVscHMgeW91OiBJIHBsYW4gdG8gdGFja2xlIHRoZXNlIGluIGEgZm9sbG93dXAuIEkg
YWdyZWUgdGhhdCdzDQo+Pj4gdWdseSwgYnV0IGZpeGluZyB0aGVzZSBpbiB0aGUgc2FtZSBz
ZXJpZXMgaXMgdG9vIG11Y2ggYW5kIGlmIHdlIGFncmVlDQo+Pj4gdGhhdA0KPj4+DQo+Pj4g
CWRldiA9IGNydGMtPmRldjsNCj4+Pg0KPj4+IGlzIHVnbHksIHRoZXJlIGlzIHRoZW4gYW4g
aW50ZXJtZWRpYXRlIHN0YXRlIHRoYXQgZWl0aGVyIHVzZWQNCj4+Pg0KPj4+IAlkcm0gPSBj
cnRjLT5kZXY7DQo+Pj4NCj4+PiBvcg0KPj4+DQo+Pj4gCWRldiA9IGNydGMtPmRybTsNCj4+
Pg0KPj4+IHRvIGZpbmFseSByZWFjaA0KPj4+DQo+Pj4gCWRybSA9IGNydGMtPmRybTsNCj4+
Pg0KPj4+IElmIHlvdSBzZWUgYSBiZXR0ZXIgd2F5LCBwbGVhc2UgbGV0IG1lIGtub3cuIEkg
ZG9uJ3Qgc2VlIGFueS4NCj4+DQo+PiBJRiB0aGlzIHJlbmFtaW5nIGdldHMgYWNjZXB0ZWQs
IHlvdSBjb3VsZCBtYWtlIGEgc2luZ2xlIHBhdGNoDQo+PiB0aGF0IGFkZHMgYSB1bmlvbiB3
aXRoIGJvdGggbmFtZXMgdG8gYWxsIGFmZmVjdGVkIERSTSBkYXRhIHN0cnVjdHVyZXMuDQo+
Pg0KPj4gc3RydWN0IGRybV9mb28gew0KPj4gICAgdW5pb24gew0KPj4gICAgICBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtOyAvLyB1c2UgdGhpcw0KPj4gICAgICBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2OyAvLyBkb24ndCB1c2UgdGhpcw0KPj4gICAgfTsNCj4+IH0NCj4+DQo+PiBUaGF0
IHBhdGNoIHByZXBhcmVzIGFsbCBvZiBEUk0gZm9yIHRoZSByZW5hbWluZy4gQW5kIHRoZW4g
eW91IGNhbiBnbyB0aHJvdWdoDQo+PiBkcml2ZXJzIG9uZS1ieS1vbmUgd2l0aCBhIHBhdGNo
IG9yIGEgcGF0Y2hzZXQgZm9yIGVhY2ggdG8gZG8gYWxsIHRoZQ0KPj4gcmVuYW1pbmcgdGhl
cmUuIEZpbmFsbHkgeW91IHNlbmQgYW5vdGhlciBEUk0td2lkZSBwYXRjaCB0byByZW1vdmUg
dGhhdA0KPj4gdW5pb24uDQo+Pg0KPj4gVGhhdCB3b3VsZCBzcGxpdCB0aGUgY2hhbmdlcyBp
bnRvIHNtYWxsZXIgcGllY2VzIHdpdGhvdXQgdWdseSBpbnRlcm1lZGlhdGUNCj4+IHN0YXRl
LiBJdCBhbHNvIGVhc2VzIHRoZSBwcm9ibGVtIGZvciBiYWNrcG9ydGVycyBhbmQgc3RhYmxl
IG1haW50YWluZXJzIHRoYXQNCj4+IGhhdmUgdG8gZGVhbCB3aXRoIHRoZSBuYW1lIGNoYW5n
ZXMuDQo+Pg0KPj4gSUlSQyB5b3UgYWxyZWFkeSBkaWQgc29tZXRoaW5nIHNpbWlsYXIgZm9y
IHJlbW92ZSBvciBwcm9iZSBjYWxsYmFja3M/DQo+IA0KPiBEaWQgeW91IGxvb2sgYXQgcGF0
Y2ggIzEgb2YgdGhlIGluaXRpYWwgc2VyaWVzPyBUaGF0J3MgZXhhY3RseSB3aGF0IEkNCj4g
ZGlkIHRoZXJlLiBQZW9wbGUgYXJndWVkIHRvIG1ha2UgYSBzaW5nbGUgcGF0Y2ggYW5kIG5v
dCB1c2UgYW4gYW5vbnltb3VzDQo+IHVuaW9uIHRob3VnaCAuLi4NCg0KSSB3b3VsZCBkaXNh
Z3JlZSB3aXRoIHRoZW0uIEl0IGFsc28gc2VlbWVkIHRvIG1lIHRoYXQgdGhlIGNvbmNlcm4g
YnV0IA0Kc3BsaXR0aW5nIHVwIHRoZSBjaGFuZ2UgaW50byBtdWx0aXBsZSBwYXRjaGVzIHdh
cyBhYm91dCBzcGxpdHRpbmcgdXAgYSANCkRSTS13aWRlIGNoYW5nZSBpbnRvIG11bHRpcGxl
IHBhdGNoZXMuIElmIHlvdSdkIGRvIHBlci1kcml2ZXIgcGF0Y2hzZXRzIA0KdGhhdCBjb3Zl
ciBhbGwgZGF0YSBzdHJ1Y3R1cmVzLCB0aGluZ3MgbWlnaHQgZ28gZGlmZmVyZW50LiBPVE9I
IEknbSBub3QgDQpzdXJlIGlmIHRoZSByZW5hbWUgaXMgd2VsY29tZSBhdCBhbGwuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------ZfyBt5jEFTxeRRg47tXaBt8O--

--------------EN080DlF767g5PaOsX3hjnsP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSwBWsFAwAAAAAACgkQlh/E3EQov+DB
cQ/7Bxxjg4MCa5CtRiDrok/35z2FlmnSdodTSBC/Iyr7Uik2Tia2JzepeT2t+UCo8DT2vYWS6j6s
WUxEP/9vBEbgsP/YmiZIhWyiMXRldFE45kiLrXMaxyoGhxIJoYzfZxx8PL6IdA65Tkm9KfsGwIuI
eEIBpKFxpke4HSbn21nabdaqlVtjT+jyHSYWvED4UallAMK69LNMdCGseC3GM5EiCqUlBvUHV1FM
V/2JnLScqbYs9F/MEcSxRaF7ahT/ca6jMmHI7HbSpNi6lpHp2DX7HjHVVMzw+hAMCFP9dgQfeDsk
CmUdFqy976OToCpheNT8FI7rVwBqpDbA+TCN6d9reEjX+Zg4pIxxGuJTB7E2RnDokY7mq+bZpz6x
r1sy/MJq4HB8NouTQkd9BuKozt7YE7UnfTP31zeDtQTNjIbNUtB99ihAqwl4/KARjLXIj7aHrWrC
0RqR4+al2ZAOBAoZZk9NKmL2cPQhknmkOLCA06jXezPdrdVeGprBHY7bUWHuTjHVSwtfUTQLyRgs
H+Qm02bI72z6+IJQt5XbuMADpE6Motowk1SHuGrWD9RQg21EA72bOGWMMvniJEsHbQVWwF2v2xxa
mCf4jGnVIeC5nYotu+Qz/OHvQky2EdbeEsYbgMfv+f0FaQfkSPXQeghejKz5UxgTaBcOcfgbg7q+
sL0=
=rxK7
-----END PGP SIGNATURE-----

--------------EN080DlF767g5PaOsX3hjnsP--
