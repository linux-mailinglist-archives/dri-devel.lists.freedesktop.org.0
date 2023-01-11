Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF346665EE9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868710E2B7;
	Wed, 11 Jan 2023 15:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C25810E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:18:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 07CF717D59;
 Wed, 11 Jan 2023 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673450331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vW7EqoZN5JH9QZVEB8cp56/uppg3VKm8mRYkthii3vo=;
 b=i+niIcAK/I4rZvR6OXmNvvtnfYWXZkNXihW3rZIlh00BhwJe0kYd2/sKVc1jqefEWeX6Ek
 pVkxjlbu8DyZkct9pMt9/UjIUGyrXHottQlho4wcMt9mrZZJmUwPMIDtm96HIelTPWhQ2b
 8jlkock1XDYKFQ3FBdksvK8CTEQP6Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673450331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vW7EqoZN5JH9QZVEB8cp56/uppg3VKm8mRYkthii3vo=;
 b=D2Gz6r+QzOMFhgLtpDbeUude3MH67cHueGG1Jw4XB6y/0hW0h4vMOI0Rppqpj01/6j9TMp
 NRzuRUa8mu+TH0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD26D13591;
 Wed, 11 Jan 2023 15:18:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 69z9MFrTvmMKLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:18:50 +0000
Message-ID: <31795464-8986-c2c3-74a2-3d2bc3455820@suse.de>
Date: Wed, 11 Jan 2023 16:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 9/9] drm/vc4: hdmi: Add BT.2020 Support
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-9-6b15f774c13a@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-9-6b15f774c13a@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vsTcFjBTfdwjj2Vbi0sSwubl"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vsTcFjBTfdwjj2Vbi0sSwubl
Content-Type: multipart/mixed; boundary="------------8KHrfVrzvcIYthfrV2x1AJHW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <31795464-8986-c2c3-74a2-3d2bc3455820@suse.de>
Subject: Re: [PATCH 9/9] drm/vc4: hdmi: Add BT.2020 Support
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-9-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-9-6b15f774c13a@cerno.tech>

--------------8KHrfVrzvcIYthfrV2x1AJHW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjEyLjIyIHVtIDE3OjA3IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gRnJv
bTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4NCj4g
DQo+IEV2ZW4gdGhvdWdoIHdlIHJlcG9ydCB0aGF0IHdlIHN1cHBvcnQgdGhlIEJULjIwMjAg
Q29sb3JzcGFjZSwgd2Ugd2VyZQ0KPiBhbHdheXMgdXNpbmcgdGhlIEJULjcwOSBjb252ZXJz
aW9uIG1hdHJpY2VzLiBMZXQncyBhZGQgdGhlIEJULjIwMjAgb25lcy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNo
Pg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgMzgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYw0K
PiBpbmRleCBlMzQyOGZiMmMyMmQuLjI3MzRjYWIzNDY2MCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2hkbWkuYw0KPiBAQCAtMTI3Nyw2ICsxMjc3LDM3IEBAIHN0YXRpYyBjb25zdCB1
MTYgdmM1X2hkbWlfY3NjX2Z1bGxfcmdiX3RvX3l1dl9idDcwOVsyXVszXVs0XSA9IHsNCj4g
ICAJfSwNCj4gICB9Ow0KPiAgIA0KPiArLyoNCj4gKyAqIENvbnZlcnNpb24gYmV0d2VlbiBG
dWxsIFJhbmdlIFJHQiBhbmQgWVVWIHVzaW5nIHRoZSBCVC4yMDIwIENvbG9yc3BhY2UNCj4g
KyAqDQo+ICsgKiBNYXRyaWNlcyBhcmUgc2lnbmVkIDJwMTMgZml4ZWQgcG9pbnQsIHdpdGgg
c2lnbmVkIDlwNiBvZmZzZXRzDQo+ICsgKi8NCj4gK3N0YXRpYyBjb25zdCB1MTYgdmM1X2hk
bWlfY3NjX2Z1bGxfcmdiX3RvX3l1dl9idDIwMjBbMl1bM11bNF0gPSB7DQo+ICsJew0KPiAr
CQkvKg0KPiArCQkgKiBGdWxsIFJhbmdlDQo+ICsJCSAqDQo+ICsJCSAqIFsgIDAuMjYyNzAw
ICAwLjY3ODAwMCAgMC4wNTkzMDAgIDAgICBdDQo+ICsJCSAqIFsgLTAuMTM5NjMwIC0wLjM2
MDM3MCAgMC41MDAwMDAgIDEyOCBdDQo+ICsJCSAqIFsgIDAuNTAwMDAwIC0wLjQ1OTc4NiAt
MC4wNDAyMTQgIDEyOCBdDQo+ICsJCSAqLw0KPiArCQl7IDB4MDg2OCwgMHgxNWIyLCAweDAx
ZTYsIDB4MDAwMCB9LA0KPiArCQl7IDB4ZmI4OSwgMHhmNDc5LCAweDEwMDAsIDB4MjAwMCB9
LA0KPiArCQl7IDB4MTAwMCwgMHhmMTRhLCAweGZlYjgsIDB4MjAwMCB9LA0KPiArCX0sDQo+
ICsJew0KPiArCQkvKiBMaW1pdGVkIFJhbmdlDQo+ICsJCSAqDQo+ICsJCSAqIFsgIDAuMjI0
NzMyICAwLjU4MDAwOCAgMC4wNTA3MjkgIDE2ICBdDQo+ICsJCSAqIFsgLTAuMTIyMTc2IC0w
LjMxNTMyNCAgMC40Mzc1MDAgIDEyOCBdDQo+ICsJCSAqIFsgIDAuNDM3NTAwIC0wLjQwMjMx
MiAtMC4wMzUxODggIDEyOCBdDQo+ICsJCSAqLw0KPiArCQl7IDB4MDgyZiwgMHgxMDEyLCAw
eDAzMWYsIDB4MDQwMCB9LA0KPiArCQl7IDB4ZmI0OCwgMHhmNmJhLCAweDBlMDAsIDB4MjAw
MCB9LA0KPiArCQl7IDB4MGUwMCwgMHhmNDQ4LCAweGZkYmEsIDB4MjAwMCB9LA0KPiArCX0s
DQo+ICt9Ow0KPiArDQo+ICAgc3RhdGljIHZvaWQgdmM1X2hkbWlfc2V0X2NzY19jb2VmZnMo
c3RydWN0IHZjNF9oZG1pICp2YzRfaGRtaSwNCj4gICAJCQkJICAgIGNvbnN0IHUxNiBjb2Vm
ZnNbM11bNF0pDQo+ICAgew0KPiBAQCAtMTMyMiw2ICsxMzUzLDEzIEBAIHN0YXRpYyBjb25z
dCB1MTYNCj4gICAJY2FzZSBEUk1fTU9ERV9DT0xPUklNRVRSWV9SR0JfV0lERV9GSVhFRDoN
Cj4gICAJY2FzZSBEUk1fTU9ERV9DT0xPUklNRVRSWV9SR0JfV0lERV9GTE9BVDoNCj4gICAJ
CXJldHVybiB2YzVfaGRtaV9jc2NfZnVsbF9yZ2JfdG9feXV2X2J0NzA5W2xpbWl0ZWRdOw0K
PiArDQo+ICsJY2FzZSBEUk1fTU9ERV9DT0xPUklNRVRSWV9CVDIwMjBfQ1lDQzoNCj4gKwlj
YXNlIERSTV9NT0RFX0NPTE9SSU1FVFJZX0JUMjAyMF9ZQ0M6DQo+ICsJY2FzZSBEUk1fTU9E
RV9DT0xPUklNRVRSWV9CVDIwMjBfUkdCOg0KPiArCWNhc2UgRFJNX01PREVfQ09MT1JJTUVU
UllfRENJX1AzX1JHQl9ENjU6DQo+ICsJY2FzZSBEUk1fTU9ERV9DT0xPUklNRVRSWV9EQ0lf
UDNfUkdCX1RIRUFURVI6DQo+ICsJCXJldHVybiB2YzVfaGRtaV9jc2NfZnVsbF9yZ2JfdG9f
eXV2X2J0MjAyMFtsaW1pdGVkXTsNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------8KHrfVrzvcIYthfrV2x1AJHW--

--------------vsTcFjBTfdwjj2Vbi0sSwubl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+01oFAwAAAAAACgkQlh/E3EQov+A9
fA/+NY0NW6KpOPxP7zN5APO3KzXptPHUJDXSYkmjaMkqOSod0YbQGmplKxHLIK/4L+2HKAoCu0WN
HbWpWkDcJQuaFNiaB35QVcVDku+xn/sWXHfvftr8Bex/t05IzVjLyq9LAtfolJnMy61Bh/OaxdY4
Tom6Nbp/61Lq/jtZFW6FHhhtKDognLmDYo7L3tl4v84C/JrXkufRB0Nv/co5r+IjCdS9qGbBAm16
GXOGXFjwgRVof4xo2szy9qE5S2+SYbhfIOaG+i/eDP7x7k4YJRkZ0ebg49kDk8NbOe5C9IbfW+FC
DlVRXKPgQImlDTunZrfnKBeMCPv9nC+hlWvpVMnKxOYe06uhEGvLS9TC9SgCKICMGI+wscU21aXV
J4byGf8twidH6+91omrFcBb07Tc95WqtV4TGonZlroRPfgYdmi+r669oqz9FG3wD4mAemBbCnW26
ImeMetJY4gEcrFvjL5VcBus9QrR94D8JNEcftqLawjpcB9sLDL25kPx69NwNR7a8gQGwRERt7g1A
NQEEPawPPk9cYZPGhcJKhDG6y5rotcsUSYw6OKps3d9cSu/wiUSeKgDQue/BvmQ6oSdEm15fisgK
5/75OCO7YEAk/mLXtkWJ6nZiuBwxzN/KZaNssMSAAO23Aux+Zh7ZYe/7fbzL3yRlzlLLXbxOCSSi
ca8=
=xEUi
-----END PGP SIGNATURE-----

--------------vsTcFjBTfdwjj2Vbi0sSwubl--
