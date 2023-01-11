Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F6665D3A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 15:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5455E10E14C;
	Wed, 11 Jan 2023 14:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7310E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:02:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0D149D8;
 Wed, 11 Jan 2023 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673445726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ddPs9JRT0r5qSLk138ZdFIG78T6OtdxxaKPJSXDrQHc=;
 b=Gi2E/DVVmVgCqivxIdchrHdyXLwc7kJ65+wxZVGJGCyrI4l2DGFFEOQSLheuPcCAXOtpEW
 x4+4YnsLutTKyw7zUMp19+a7nGqAiqcYN/WKz+uJks0Xo2qytoRsvF2FcudN03Jx84iPNK
 XwvZ7U7s8cTCg7lqLJcELTTS8Niezc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673445726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ddPs9JRT0r5qSLk138ZdFIG78T6OtdxxaKPJSXDrQHc=;
 b=+9l2vjACOldz19GrhYPWe5MMnQxx+pWVJOZadF1UZXXmckpNUTSfrY0k41rJ+JcyLeUpPg
 7OVWypscGfi/HbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D78181358A;
 Wed, 11 Jan 2023 14:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JbaBM13BvmNMAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 14:02:05 +0000
Message-ID: <38a5f052-18d5-5297-f1c7-44ca5b8285f5@suse.de>
Date: Wed, 11 Jan 2023 15:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/9] drm/vc4: hdmi: Constify container_of wrappers
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-2-6b15f774c13a@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-2-6b15f774c13a@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U9RL1g2LqVGyneC9x6ey0Wwv"
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
--------------U9RL1g2LqVGyneC9x6ey0Wwv
Content-Type: multipart/mixed; boundary="------------4xF2h5RHRsLOZ4B2FSVoiWAA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <38a5f052-18d5-5297-f1c7-44ca5b8285f5@suse.de>
Subject: Re: [PATCH 2/9] drm/vc4: hdmi: Constify container_of wrappers
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-2-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-2-6b15f774c13a@cerno.tech>

--------------4xF2h5RHRsLOZ4B2FSVoiWAA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjIgdW0gMTc6MDcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBO
b25lIG9mIG91ciB3cmFwcGVycyBhcm91bmQgY29udGFpbmVyX29mIHRvIGFjY2VzcyBvdXIg
b2JqZWN0cyBmcm9tIHRoZQ0KPiBEUk0gb2JqZWN0IHBvaW50ZXIgYWN0dWFsbHkgbW9kaWZ5
IHRoZSBsYXR0ZXIuDQo+IA0KPiBMZXQncyBtYWtlIHRoZW0gY29uc3QuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCg0KUGVyc29u
YWxseSwgSSB3b3VsZG4ndCB0YWtlIHRoaXMgcGF0Y2ggYXMgaXQgZG9lcyBhbiBpbXBsaWNp
dCBjb25zdCBjYXN0IA0Kb24gdGhlIHBvaW50ZXIuDQoNCkZvciBjb25zdCBjb3JyZWN0bmVz
cywgaXQgc2VlbXMgYmV0dGVyIHRvIGFkZCBuZXcgaGVscGVycyB0aGF0IGtlZXAgdGhlIA0K
Y29uc3QuIFRob3NlIGNvdWxkIGJlIHVzZSBpbiBwbGFjZXMgd2hlcmUgdGhlIGNhbGxlciBp
cyBub3QgYWxsb3dlZCB0byANCm1vZGlmeSB0aGUgc3RhdGUgKGkuZS4sIGF0b21pY191cGRh
dGUsIGV0IGFsKS4NCg0KU29tZXRoaW5nIGxpa2UgdGhpczoNCg0KY29uc3Qgc3RydWN0IHZj
NF9oZG1pICoNCmNvbnN0X2Nvbm5lY3Rvcl90b192YzRfaGRtaShjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0Kew0KCXJldHVybiBjb250YWluZXJfb2YoY29ubmVj
dG9yLCBjb25zdCBzdHJ1Y3QgdmM0X2hkbWksDQoJCWNvbm5lY3Rvcik7DQp9DQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRf
aGRtaS5oIHwgNiArKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2hkbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuaA0KPiBpbmRl
eCBkYzNjY2Q4MDAyYTAuLjAyM2VhNjRlZjAwNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfaGRtaS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2hkbWkuaA0KPiBAQCAtMjI0LDEzICsyMjQsMTMgQEAgc3RydWN0IHZjNF9oZG1pIHsNCj4g
ICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHZjNF9oZG1pICoNCj4gLWNv
bm5lY3Rvcl90b192YzRfaGRtaShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0K
PiArY29ubmVjdG9yX3RvX3ZjNF9oZG1pKGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpDQo+ICAgew0KPiAgIAlyZXR1cm4gY29udGFpbmVyX29mKGNvbm5lY3Rvciwg
c3RydWN0IHZjNF9oZG1pLCBjb25uZWN0b3IpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMg
aW5saW5lIHN0cnVjdCB2YzRfaGRtaSAqDQo+IC1lbmNvZGVyX3RvX3ZjNF9oZG1pKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcikNCj4gK2VuY29kZXJfdG9fdmM0X2hkbWkoY29uc3Qg
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQ0KPiAgIHsNCj4gICAJc3RydWN0IHZjNF9l
bmNvZGVyICpfZW5jb2RlciA9IHRvX3ZjNF9lbmNvZGVyKGVuY29kZXIpOw0KPiAgIAlyZXR1
cm4gY29udGFpbmVyX29mKF9lbmNvZGVyLCBzdHJ1Y3QgdmM0X2hkbWksIGVuY29kZXIpOw0K
PiBAQCAtMjQ0LDcgKzI0NCw3IEBAIHN0cnVjdCB2YzRfaGRtaV9jb25uZWN0b3Jfc3RhdGUg
ew0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdmM0X2hkbWlfY29u
bmVjdG9yX3N0YXRlICoNCj4gLWNvbm5fc3RhdGVfdG9fdmM0X2hkbWlfY29ubl9zdGF0ZShz
dHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkNCj4gK2Nvbm5fc3RhdGVf
dG9fdmM0X2hkbWlfY29ubl9zdGF0ZShjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0
ZSAqY29ubl9zdGF0ZSkNCj4gICB7DQo+ICAgCXJldHVybiBjb250YWluZXJfb2YoY29ubl9z
dGF0ZSwgc3RydWN0IHZjNF9oZG1pX2Nvbm5lY3Rvcl9zdGF0ZSwgYmFzZSk7DQo+ICAgfQ0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------4xF2h5RHRsLOZ4B2FSVoiWAA--

--------------U9RL1g2LqVGyneC9x6ey0Wwv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+wV0FAwAAAAAACgkQlh/E3EQov+CK
JhAAuLdHHOs7PPUfsVmWtKeQQ1ljhpYS40uB1O0yF9YPm7dnQURVNAomi3jffJU+AxMgUU1qBk2t
tstzsqbEhxrQJB2u6AjXjIGHhWfsQRTBNOuYbeHx7DHNyWeUjOTnoeEiXtbxpnpw3PufJUWAc/1Z
pehVNr9aUGL8SJboVWQmNXO5/x/+Lid+3op5Ixs8eRkK87jLjkCGFaDbqzkOyq2uQ2gSBHFKeUbQ
EcgDoXr/KV3+eQzjFor7A7KD0y0WHxN7CZfNp2vOC3TNzvvA9u1Nr04w07WP8r7bRAb5o/Hzn1bA
QcrpuNHUaPz4YMLnbm6TjMy8JSi/YI9cHUZjrFLzTCxr1vT/U59KXYxKprqUK8B1twYkfjwrvTw8
rwILbbBuLTggL1RZ7mg2GvF1DDwT7nNouZEP6iown8atrEH8evgLsloM0YHy29i04q6NUCHmeP4F
PbG6RNFaubKmHnpM5eNesCwnYJjwjVOhBXOulbjqtBNirOn5mxEJI/ImOb+vGKX6CgBNzXp6AWeG
ROShsxQBn/eDaTNvK5u86wvqyaYZoS+90WBLaw7jX4Bwg8gDCIxbR8wBeyHBE+cOJoAD9BWANaOc
oLTDy2AL9+gkN2t7oZ5mHZ4zK7Qw4a7s5ka1aOFQ2YSrsLNMVV8IzcxwN/gZIWtFa9FOS0i+O8ko
TlU=
=pHth
-----END PGP SIGNATURE-----

--------------U9RL1g2LqVGyneC9x6ey0Wwv--
