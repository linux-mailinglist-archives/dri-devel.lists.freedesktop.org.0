Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962EF665D24
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C20510E06A;
	Wed, 11 Jan 2023 13:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314B310E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 13:56:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF34217381;
 Wed, 11 Jan 2023 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673445390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cb6jpfiSiTAuBIC+7gmGiVDtipbuVT1j7hxK+X6CZcM=;
 b=q6p0sAmiI6+dqke6EvADmvGAjEGCjzcvm7PCc3wCdRy9nUFWOAnNV6SA48Rpb777PL8xsX
 kO24pYw2bSPXeHExFneWQcbjhGKGcIqn3qwJONWgeucFKVSai+VqoxUJCDgmMo37d6LM8j
 +ssD+1mgaozTN63uje6nGhh/pqin0DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673445390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cb6jpfiSiTAuBIC+7gmGiVDtipbuVT1j7hxK+X6CZcM=;
 b=uiqeG+ciaH37NMfkVpleRIJImql/5WpD8jAN68q0Y3VaY6Z/QQe1Ba5R5G0jDTfZT0/YSz
 Mt/enD4ucl6J+xBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B21ED1358A;
 Wed, 11 Jan 2023 13:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WC8yKg7AvmPFfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:56:30 +0000
Message-ID: <34dec867-dbb0-5175-351a-ca4b1bd807b6@suse.de>
Date: Wed, 11 Jan 2023 14:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] drm/vc4: hdmi: Update all the planes if the TV
 margins are changed
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-1-6b15f774c13a@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-1-6b15f774c13a@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WZkWcBVctBjfGSHgZipot7pj"
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
--------------WZkWcBVctBjfGSHgZipot7pj
Content-Type: multipart/mixed; boundary="------------ypoiDIkHvE0X3Ioer0fXt8Ty";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <34dec867-dbb0-5175-351a-ca4b1bd807b6@suse.de>
Subject: Re: [PATCH 1/9] drm/vc4: hdmi: Update all the planes if the TV
 margins are changed
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-1-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-1-6b15f774c13a@cerno.tech>

--------------ypoiDIkHvE0X3Ioer0fXt8Ty
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjIgdW0gMTc6MDcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBWQzQsIHRoZSBUViBtYXJnaW5zIG9uIHRoZSBIRE1JIGNvbm5lY3RvciBhcmUgaW1wbGVt
ZW50ZWQgYnkgc2NhbGluZw0KPiB0aGUgcGxhbmVzLg0KPiANCj4gSG93ZXZlciwgaWYgb25s
eSB0aGUgVFYgbWFyZ2lucyBvciB0aGUgY29ubmVjdG9yIGFyZSBjaGFuZ2VkIGJ5IGEgbmV3
DQo+IHN0YXRlLCB0aGUgcGxhbmVzIGVuZGluZyB1cCBvbiB0aGF0IGNvbm5lY3RvciB3b24n
dCBiZS4gVGh1cywgdGhleSB3b24ndA0KPiBiZSB1cGRhdGVkIHByb3Blcmx5IGFuZCB3ZSds
bCBlZmZlY3RpdmVseSBpZ25vcmUgdGhhdCBjaGFuZ2UgdW50aWwgdGhlDQo+IG5leHQgY29t
bWl0IGFmZmVjdGluZyB0aGVzZSBwbGFuZXMuDQo+IA0KPiBMZXQncyBtYWtlIHN1cmUgdG8g
YWRkIGFsbCB0aGUgcGxhbmVzIGF0dGFjaGVkIHRvIHRoZSBjb25uZWN0b3Igc28gdGhhdA0K
PiB3ZSBjYW4gdXBkYXRlIHRoZW0gcHJvcGVybHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCg0KUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDE2ICsrKysrKysrKysrKysrKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2hkbWkuYw0KPiBpbmRleCAxMmEwMGQ2NDRiNjEuLjBlYWZhZjBiNzZlNSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2hkbWkuYw0KPiBAQCAtNTIyLDYgKzUyMiwyMiBAQCBzdGF0aWMg
aW50IHZjNF9oZG1pX2Nvbm5lY3Rvcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvciwNCj4gICAJaWYgKCFjcnRjKQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAg
DQo+ICsJaWYgKG9sZF9zdGF0ZS0+dHYubWFyZ2lucy5sZWZ0ICE9IG5ld19zdGF0ZS0+dHYu
bWFyZ2lucy5sZWZ0IHx8DQo+ICsJICAgIG9sZF9zdGF0ZS0+dHYubWFyZ2lucy5yaWdodCAh
PSBuZXdfc3RhdGUtPnR2Lm1hcmdpbnMucmlnaHQgfHwNCj4gKwkgICAgb2xkX3N0YXRlLT50
di5tYXJnaW5zLnRvcCAhPSBuZXdfc3RhdGUtPnR2Lm1hcmdpbnMudG9wIHx8DQo+ICsJICAg
IG9sZF9zdGF0ZS0+dHYubWFyZ2lucy5ib3R0b20gIT0gbmV3X3N0YXRlLT50di5tYXJnaW5z
LmJvdHRvbSkgew0KPiArCQlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7DQo+
ICsJCWludCByZXQ7DQo+ICsNCj4gKwkJY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2Ny
dGNfc3RhdGUoc3RhdGUsIGNydGMpOw0KPiArCQlpZiAoSVNfRVJSKGNydGNfc3RhdGUpKQ0K
PiArCQkJcmV0dXJuIFBUUl9FUlIoY3J0Y19zdGF0ZSk7DQo+ICsNCj4gKwkJcmV0ID0gZHJt
X2F0b21pY19hZGRfYWZmZWN0ZWRfcGxhbmVzKHN0YXRlLCBjcnRjKTsNCg0KVGhpcyBpcyBz
bGlnaHRseSBkYW5nZXJvdXMsIGJ1dCB3b3JrcyBpbiB0aGUgZ2l2ZW4gY2FzZS4gSSdkIGFw
cHJlY2lhdGUgDQphIGNvbW1lbnQgYWxhICdwbGFuZSBzdGF0ZSB3aWxsIGJlIGNoZWNrZWQg
YnkgYXRvbWljIGhlbHBlcnMnLg0KDQpUaGUgcGxhbmUgc3RhdGUgb2YgdGhlIGFkZGVkIHBs
YW5lcyBoYXMgdG8gYmUgdGVzdGVkIHZpYSB0aGVpciANCmF0b21pY19jaGVjayBoZWxwZXJz
LiBUaGF0J3Mgbm8gcHJvYmxlbSBoZXJlIGJlY2F1c2UgdGhlIGNvbm5lY3RvcidzIA0KYXRv
bWljX2NoZWNrIHJ1bnMgYmVmb3JlIHRoZSBwbGFuZSdzIGF0b21pY19jaGVjay4gU2VlIF9j
aGVja19tb2Rlc2V0IHZzIA0KX2NoZWNrX3BsYW5lcyBpbiBbMV0uDQoNCldlIGhhZCBjb2Rl
IHRoYXQgaW52b2tlZCBkcm1fYXRvbWljX2FkZF9hZmZlY3RlZF9wbGFuZXMoKSBmcm9tIHRo
ZSANCkNSVEMncyBhdG9taWNfY2hlY2suIEF0IHRoYXQgcG9pbnQsIHRoZSBwbGFuZSdzIGF0
b21pY19jaGVjayBoYXMgYmVlbiANCmV4ZWN1dGVkIGFscmVhZHkgYW5kIHRoZSBuZXdseSBh
ZGRlZCBwbGFuZXMgd2VyZSBuZXZlciByZWFsbHkgc3RhdGUtY2hlY2tlZC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuMS40L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyNM
MTA2OQ0KDQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0K
PiAgIAlpZiAob2xkX3N0YXRlLT5jb2xvcnNwYWNlICE9IG5ld19zdGF0ZS0+Y29sb3JzcGFj
ZSB8fA0KPiAgIAkgICAgIWRybV9jb25uZWN0b3JfYXRvbWljX2hkcl9tZXRhZGF0YV9lcXVh
bChvbGRfc3RhdGUsIG5ld19zdGF0ZSkpIHsNCj4gICAJCXN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqY3J0Y19zdGF0ZTsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ypoiDIkHvE0X3Ioer0fXt8Ty--

--------------WZkWcBVctBjfGSHgZipot7pj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+wA4FAwAAAAAACgkQlh/E3EQov+Df
qhAAgdR2UN5G1re4OlPaIbxWy5zJRUt6RXGz2nhamCVltan/8ovFD3k7Qhru7J1/esl3WfMgpBYJ
17wUV4CR6p9SUtxezbyrZgkYzq+g90kXRV2/aX7pQOYdbyEz4Z8LJtdLDzWojyVPo1A/9EMXFfJx
uohxbOYwF/tcr7wg++eL5VZwQ6/1sibOKtKXomyxIOQg4PMXS4i20mW3cSWh+WWZ1FV2xbJE6MCO
Rqrkn/dRIfp3ahObYPHX9eQhwJHmb7v+IUJ/Lvlt38vNX7k3GOzHz+rggXIBKRwbnqg/3v4hX1Mk
NYnEJwCrnMBSggO60K3336HZX05F3NMPiAyR9HRsaaM8k8RXTxScD6FESWn5dH/diQwCnteaFxJY
2qtHaEMwwgcqVO4uRoRgAmlkLL8By5j76WMa8OYkqh0oAiiAdggc1bHWHRHxpXCwEX+cDCKNiO2v
hSoUzs1HKiSubyf5Ilpcz8dHcULzaT/KFQlxFLZKTOcd/BfOeJQx3FjkkhYR6lv4sN5rh+nOFfO6
Ga1uuv4QYmSBx80mTH+mNwsMPJwT3KkKs2KEt6siF3umw6ktFL3m/F1nz5q53Ds5CNXIEtKJMpZ9
LQ5K3ouIYki7JOSjLcW5sLkwEppcwA103dwWapmy6uFgiCL9i4Gc5203yiSJk+ID2/dkanP7tP1p
ygs=
=yO4N
-----END PGP SIGNATURE-----

--------------WZkWcBVctBjfGSHgZipot7pj--
