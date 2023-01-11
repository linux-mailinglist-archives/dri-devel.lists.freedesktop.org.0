Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08C665EDB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE910E75D;
	Wed, 11 Jan 2023 15:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F20B10E75B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:16:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0C6A17D41;
 Wed, 11 Jan 2023 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673450181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dhiLV1JhsDqhwJz7F/7yrUkhQWW00XFEQ+11ysZATOc=;
 b=YR3cLAU3gNuQENncuAm7vviTjzr+2X3GEGef7N4CRGJu/R9BWYOijUA/zM6CdI0tm3O9Py
 K7ywtkXfZ2yOL1+orD7mtqS+GDLWM99XyjbBFu9GlI3Z9qu2nG8l2hZEFMgx4YSxgaIvH7
 xBHPK2hgXDMEgqvr1+hUjf1SyT/6Mos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673450181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dhiLV1JhsDqhwJz7F/7yrUkhQWW00XFEQ+11ysZATOc=;
 b=+b5ifCT0jSEVni+tLrGUDmkuWZkaPp+l6LDsF5QtTLVcf94rJjzjItvDAPWVmeR0v2Sr8m
 3r+94lYlUFbPesDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9735013591;
 Wed, 11 Jan 2023 15:16:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M54AJMXSvmPNLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:16:21 +0000
Message-ID: <e9853566-f352-4e15-9e17-168dac482153@suse.de>
Date: Wed, 11 Jan 2023 16:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 8/9] drm/vc4: hdmi: Add BT.601 Support
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-8-6b15f774c13a@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-8-6b15f774c13a@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K7CnMuMJzuvt7xQGaC75jsra"
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
--------------K7CnMuMJzuvt7xQGaC75jsra
Content-Type: multipart/mixed; boundary="------------AclVDTxXZJcFa0QFEd47IWxg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <e9853566-f352-4e15-9e17-168dac482153@suse.de>
Subject: Re: [PATCH 8/9] drm/vc4: hdmi: Add BT.601 Support
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-8-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-8-6b15f774c13a@cerno.tech>

--------------AclVDTxXZJcFa0QFEd47IWxg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjEyLjIyIHVtIDE3OjA3IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gRnJv
bTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4NCj4g
DQo+IEV2ZW4gdGhvdWdoIHdlIHJlcG9ydCB0aGF0IHdlIHN1cHBvcnQgdGhlIEJUNjAxIENv
bG9yc3BhY2UsIHdlIHdlcmUNCj4gYWx3YXlzIHVzaW5nIHRoZSBCVC43MDkgY29udmVyc2lv
biBtYXRyaWNlcy4gTGV0J3MgYWRkIHRoZSBCVDYwMSBvbmVzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+DQoN
ClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCAzOCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+IGlu
ZGV4IGNkNjc3NTQyOWI1ZS4uZTM0MjhmYjJjMjJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfaGRtaS5jDQo+IEBAIC0xMjE0LDYgKzEyMTQsMzcgQEAgc3RhdGljIGNvbnN0IHUxNiB2
YzVfaGRtaV9jc2NfZnVsbF9yZ2JfdG9fcmdiWzJdWzNdWzRdID0gew0KPiAgIAl9LA0KPiAg
IH07DQo+ICAgDQo+ICsvKg0KPiArICogQ29udmVyc2lvbiBiZXR3ZWVuIEZ1bGwgUmFuZ2Ug
UkdCIGFuZCBZVVYgdXNpbmcgdGhlIEJULjYwMSBDb2xvcnNwYWNlDQo+ICsgKg0KPiArICog
TWF0cmljZXMgYXJlIHNpZ25lZCAycDEzIGZpeGVkIHBvaW50LCB3aXRoIHNpZ25lZCA5cDYg
b2Zmc2V0cw0KPiArICovDQo+ICtzdGF0aWMgY29uc3QgdTE2IHZjNV9oZG1pX2NzY19mdWxs
X3JnYl90b195dXZfYnQ2MDFbMl1bM11bNF0gPSB7DQo+ICsJew0KPiArCQkvKg0KPiArCQkg
KiBGdWxsIFJhbmdlDQo+ICsJCSAqDQo+ICsJCSAqIFsgIDAuMjk5MDAwICAwLjU4NzAwMCAg
MC4xMTQwMDAgIDAgICBdDQo+ICsJCSAqIFsgLTAuMTY4NzM2IC0wLjMzMTI2NCAgMC41MDAw
MDAgIDEyOCBdDQo+ICsJCSAqIFsgIDAuNTAwMDAwIC0wLjQxODY4OCAtMC4wODEzMTIgIDEy
OCBdDQo+ICsJCSAqLw0KPiArCQl7IDB4MDk5MSwgMHgxMmM5LCAweDAzYTYsIDB4MDAwMCB9
LA0KPiArCQl7IDB4ZmE5YiwgMHhmNTY3LCAweDEwMDAsIDB4MjAwMCB9LA0KPiArCQl7IDB4
MTAwMCwgMHhmMjliLCAweGZkNjcsIDB4MjAwMCB9LA0KPiArCX0sDQo+ICsJew0KPiArCQkv
KiBMaW1pdGVkIFJhbmdlDQo+ICsJCSAqDQo+ICsJCSAqIFsgIDAuMjU1Nzg1ICAwLjUwMjE2
MCAgMC4wOTc1MjMgIDE2ICBdDQo+ICsJCSAqIFsgLTAuMTQ3NjQ0IC0wLjI4OTg1NiAgMC40
Mzc1MDAgIDEyOCBdDQo+ICsJCSAqIFsgIDAuNDM3NTAwIC0wLjM2NjM1MiAtMC4wNzExNDgg
IDEyOCBdDQo+ICsJCSAqLw0KPiArCQl7IDB4MDgyZiwgMHgxMDEyLCAweDAzMWYsIDB4MDQw
MCB9LA0KPiArCQl7IDB4ZmI0OCwgMHhmNmJhLCAweDBlMDAsIDB4MjAwMCB9LA0KPiArCQl7
IDB4MGUwMCwgMHhmNDQ4LCAweGZkYmEsIDB4MjAwMCB9LA0KPiArCX0sDQo+ICt9Ow0KPiAr
DQo+ICAgLyoNCj4gICAgKiBDb252ZXJzaW9uIGJldHdlZW4gRnVsbCBSYW5nZSBSR0IgYW5k
IFlVViB1c2luZyB0aGUgQlQuNzA5IENvbG9yc3BhY2UNCj4gICAgKg0KPiBAQCAtMTI3Nyw2
ICsxMzA4LDEzIEBAIHN0YXRpYyBjb25zdCB1MTYNCj4gICAoKnZjNV9oZG1pX2dldF95dXZf
Y3NjX2NvZWZmcyhzdHJ1Y3QgdmM0X2hkbWkgKnZjNF9oZG1pLCB1MzIgY29sb3JzcGFjZSwg
Ym9vbCBsaW1pdGVkKSlbNF0NCj4gICB7DQo+ICAgCXN3aXRjaCAoY29sb3JzcGFjZSkgew0K
PiArCWNhc2UgRFJNX01PREVfQ09MT1JJTUVUUllfU01QVEVfMTcwTV9ZQ0M6DQo+ICsJY2Fz
ZSBEUk1fTU9ERV9DT0xPUklNRVRSWV9YVllDQ182MDE6DQo+ICsJY2FzZSBEUk1fTU9ERV9D
T0xPUklNRVRSWV9TWUNDXzYwMToNCj4gKwljYXNlIERSTV9NT0RFX0NPTE9SSU1FVFJZX09Q
WUNDXzYwMToNCj4gKwljYXNlIERSTV9NT0RFX0NPTE9SSU1FVFJZX0JUNjAxX1lDQzoNCj4g
KwkJcmV0dXJuIHZjNV9oZG1pX2NzY19mdWxsX3JnYl90b195dXZfYnQ2MDFbbGltaXRlZF07
DQo+ICsNCj4gICAJZGVmYXVsdDoNCj4gICAJY2FzZSBEUk1fTU9ERV9DT0xPUklNRVRSWV9O
T19EQVRBOg0KPiAgIAljYXNlIERSTV9NT0RFX0NPTE9SSU1FVFJZX0JUNzA5X1lDQzoNCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------AclVDTxXZJcFa0QFEd47IWxg--

--------------K7CnMuMJzuvt7xQGaC75jsra
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+0sUFAwAAAAAACgkQlh/E3EQov+DU
vg//QP5KUSykm6vH8u+PZFlv+wFFpJ3GlqGoMmGMW20mkM/8OEbmBdPRmW16VI3976xvvhH2r1SU
O0KytHUuZrh5UM+/I52S+S7rlsrYc512lf2mi15ZjJyeyZlLNGa/dHuHgf7LPEY1JHtx9RUY1896
wcWPCwKJF1rWkDvI3Dx5rKXA+E0Go4OiCydAj5pry5DgQjboqUeqeSAu3ARD9BpzehTUm7LqiGpZ
TbstHIs5s1tnTqJgIqi4zCV4JMXPEDHaFFPA/H0EhLBCfW1n/8QEnUDunOwLu6EgQ7U+RyZQNio8
w61aRsUafxuZ1Xw1yvRJbROQURwtTPnm8W1D1WVRElx10lEdUQWF5Getg1HYSMJ/CluK1pfNid0P
WaUECV7v++QBt8NUCzgwIkc2TtN0j8F75Iqpl8C8r+NEwI3Cznf9vG34eztk1D9v62kwR/sN5GBm
DQXn7JfsdkXhuGXDzTviT4flfmVHvQRAut+HEfF10M7p2Akt7ZMMKMpVpIYYwQyOLaE9G4G7sX3Q
XMvDq5t6xbhNGe6E2PX3R4OLjAE+J4fvYlMUKfMVspL7wCxTP0R0DcsrDoOp/3GVRLxjcpwO0Uff
fB3rDCE7aAfJk+YskHsVORzbW49ohuTUps+qyoEe9ELtG9XCrB8qFv9kVEiLeI4m2q8jARJFJmRt
NP0=
=1ArV
-----END PGP SIGNATURE-----

--------------K7CnMuMJzuvt7xQGaC75jsra--
