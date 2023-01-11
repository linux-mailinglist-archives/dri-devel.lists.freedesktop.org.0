Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578A665ED6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAF610E2AF;
	Wed, 11 Jan 2023 15:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A636410E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:14:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C7B84C01;
 Wed, 11 Jan 2023 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673450094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I1JFF9UiD9AsdTTM+iKmxWsjFZpQumssZ0o+vcZ4l3Q=;
 b=hJA3ynlHLP05V5TXEtfsDqE3MGNLKqU2z7lG2wTrl6SlRIBSX9/6lfu956NZ0xBPi9Bm42
 sVc2g/k5f6a30uTXz7fY6Rh7i3xz9tHrknX0tsu2MvRnuukVbPF07Ex2LPMeRWkSY0mwMO
 zbakA9H98RQZPBKX/xXHtt+txOgqKTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673450094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I1JFF9UiD9AsdTTM+iKmxWsjFZpQumssZ0o+vcZ4l3Q=;
 b=VR7zLjbEeFs6IqCrSx4+wwb45tJ805EGcKpR++Bz8WujsNui7dyFfV1hC5TShILo+v8ZZa
 PwDEcsyBMmwKBiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5A2113591;
 Wed, 11 Jan 2023 15:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FI0kM23SvmMCLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:14:53 +0000
Message-ID: <e9de3800-a9b2-887e-7441-c422c2e1644b@suse.de>
Date: Wed, 11 Jan 2023 16:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 7/9] drm/vc4: hdmi: Add a function to retrieve the CSC
 matrix
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-7-6b15f774c13a@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-7-6b15f774c13a@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4VYiSeEUGztyXfQ1I00bpuzb"
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
--------------4VYiSeEUGztyXfQ1I00bpuzb
Content-Type: multipart/mixed; boundary="------------juznTkBKqD56gqOs9Cm8wkcn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <e9de3800-a9b2-887e-7441-c422c2e1644b@suse.de>
Subject: Re: [PATCH 7/9] drm/vc4: hdmi: Add a function to retrieve the CSC
 matrix
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-7-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-7-6b15f774c13a@cerno.tech>

--------------juznTkBKqD56gqOs9Cm8wkcn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjIgdW0gMTc6MDcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBG
cm9tOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0K
PiANCj4gVGhlIENTQyBtYXRyaXggdG8gdXNlIGRlcGVuZHMgb24gdGhlIG91dHB1dCBmb3Jt
YXQsIGl0cyByYW5nZSBhbmQgdGhlDQo+IGNvbG9yc3BhY2UuDQo+IA0KPiBTaW5jZSB3ZSdy
ZSBnb2luZyB0byBhZGQgbW9yZSBjb2xvcnNwYWNlcywgbGV0J3MgbW92ZSB0aGUgQ1NDIG1h
dHJpeA0KPiByZXRyaWV2YWwgdG8gYSBmdW5jdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KDQpSZXZp
ZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgMjYgKysrKysrKysr
KysrKysrKysrKysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gaW5k
ZXggY2I5MmQwNzY4MGYwLi5jZDY3NzU0MjliNWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9oZG1pLmMNCj4gQEAgLTEyNzMsNiArMTI3MywyMCBAQCBzdGF0aWMgdm9pZCB2YzVfaGRt
aV9zZXRfY3NjX2NvZWZmc19zd2FwKHN0cnVjdCB2YzRfaGRtaSAqdmM0X2hkbWksDQo+ICAg
CUhETUlfV1JJVEUoSERNSV9DU0NfMzRfMzMsIChjb2VmZnNbMV1bM10gPDwgMTYpIHwgY29l
ZmZzWzFdWzJdKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgY29uc3QgdTE2DQo+ICsoKnZj
NV9oZG1pX2dldF95dXZfY3NjX2NvZWZmcyhzdHJ1Y3QgdmM0X2hkbWkgKnZjNF9oZG1pLCB1
MzIgY29sb3JzcGFjZSwgYm9vbCBsaW1pdGVkKSlbNF0NCg0KSSBkb24ndCBsaWtlIHRoZSBm
dW5jdGlvbiBuYW1lIGhlcmUuIFRoZSBoZWxwZXIgDQp2YzVfaGRtaV9zZXRfY3NjX2NvZWZm
cygpIHByb2dyYW1zIGhhcmR3YXJlLCBidXQgdGhpcyBzaW1pbGFybHkgbmFtZWQgDQpoZWxw
ZXIgbG9va3MgdXAgc3RhdGljIGRhdGEuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
K3sNCj4gKwlzd2l0Y2ggKGNvbG9yc3BhY2UpIHsNCj4gKwlkZWZhdWx0Og0KPiArCWNhc2Ug
RFJNX01PREVfQ09MT1JJTUVUUllfTk9fREFUQToNCj4gKwljYXNlIERSTV9NT0RFX0NPTE9S
SU1FVFJZX0JUNzA5X1lDQzoNCj4gKwljYXNlIERSTV9NT0RFX0NPTE9SSU1FVFJZX1hWWUND
XzcwOToNCj4gKwljYXNlIERSTV9NT0RFX0NPTE9SSU1FVFJZX1JHQl9XSURFX0ZJWEVEOg0K
PiArCWNhc2UgRFJNX01PREVfQ09MT1JJTUVUUllfUkdCX1dJREVfRkxPQVQ6DQo+ICsJCXJl
dHVybiB2YzVfaGRtaV9jc2NfZnVsbF9yZ2JfdG9feXV2X2J0NzA5W2xpbWl0ZWRdOw0KPiAr
CX0NCj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkIHZjNV9oZG1pX2NzY19zZXR1cChzdHJ1
Y3QgdmM0X2hkbWkgKnZjNF9oZG1pLA0KPiAgIAkJCSAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqc3RhdGUsDQo+ICAgCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlKQ0KPiBAQCAtMTI4Miw2ICsxMjk2LDcgQEAgc3RhdGljIHZvaWQg
dmM1X2hkbWlfY3NjX3NldHVwKHN0cnVjdCB2YzRfaGRtaSAqdmM0X2hkbWksDQo+ICAgCQlj
b25uX3N0YXRlX3RvX3ZjNF9oZG1pX2Nvbm5fc3RhdGUoc3RhdGUpOw0KPiAgIAl1bnNpZ25l
ZCBpbnQgbGltX3JhbmdlID0gdmM0X2hkbWlfaXNfZnVsbF9yYW5nZSh2YzRfaGRtaSwgbW9k
ZSkgPyAwIDogMTsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKwljb25zdCB1MTYg
KCpjc2MpWzRdOw0KPiAgIAl1MzIgaWZfY2ZnID0gMDsNCj4gICAJdTMyIGlmX3hiYXIgPSAw
eDU0MzIxMDsNCj4gICAJdTMyIGNzY19jaGFuX2N0bCA9IDA7DQo+IEBAIC0xMjk2LDExICsx
MzExLDE2IEBAIHN0YXRpYyB2b2lkIHZjNV9oZG1pX2NzY19zZXR1cChzdHJ1Y3QgdmM0X2hk
bWkgKnZjNF9oZG1pLA0KPiAgIA0KPiAgIAlzd2l0Y2ggKHZjNF9zdGF0ZS0+b3V0cHV0X2Zv
cm1hdCkgew0KPiAgIAljYXNlIFZDNF9IRE1JX09VVFBVVF9ZVVY0NDQ6DQo+IC0JCXZjNV9o
ZG1pX3NldF9jc2NfY29lZmZzX3N3YXAodmM0X2hkbWksDQo+IC0JCQkJCSAgICAgdmM1X2hk
bWlfY3NjX2Z1bGxfcmdiX3RvX3l1dl9idDcwOVtsaW1fcmFuZ2VdKTsNCj4gKwkJY3NjID0g
dmM1X2hkbWlfZ2V0X3l1dl9jc2NfY29lZmZzKHZjNF9oZG1pLCBzdGF0ZS0+Y29sb3JzcGFj
ZSwNCj4gKwkJCQkJCSAgdmM0X2hkbWlfaXNfZnVsbF9yYW5nZSh2YzRfaGRtaSwgbW9kZSkp
Ow0KPiArDQo+ICsJCXZjNV9oZG1pX3NldF9jc2NfY29lZmZzX3N3YXAodmM0X2hkbWksIGNz
Yyk7DQo+ICAgCQlicmVhazsNCj4gICANCj4gICAJY2FzZSBWQzRfSERNSV9PVVRQVVRfWVVW
NDIyOg0KPiArCQljc2MgPSB2YzVfaGRtaV9nZXRfeXV2X2NzY19jb2VmZnModmM0X2hkbWks
IHN0YXRlLT5jb2xvcnNwYWNlLA0KPiArCQkJCQkJICB2YzRfaGRtaV9pc19mdWxsX3Jhbmdl
KHZjNF9oZG1pLCBtb2RlKSk7DQo+ICsNCj4gICAJCWNzY19jdGwgfD0gVkM0X1NFVF9GSUVM
RChWQzVfTVRfQ1BfQ1NDX0NUTF9GSUxURVJfTU9ERV80NDRfVE9fNDIyX1NUQU5EQVJELA0K
PiAgIAkJCQkJIFZDNV9NVF9DUF9DU0NfQ1RMX0ZJTFRFUl9NT0RFXzQ0NF9UT180MjIpIHwN
Cj4gICAJCQlWQzVfTVRfQ1BfQ1NDX0NUTF9VU0VfNDQ0X1RPXzQyMiB8DQo+IEBAIC0xMzEy
LDcgKzEzMzIsNyBAQCBzdGF0aWMgdm9pZCB2YzVfaGRtaV9jc2Nfc2V0dXAoc3RydWN0IHZj
NF9oZG1pICp2YzRfaGRtaSwNCj4gICAJCWlmX2NmZyB8PSBWQzRfU0VUX0ZJRUxEKFZDNV9E
VlBfSFRfVkVDX0lOVEVSRkFDRV9DRkdfU0VMXzQyMl9GT1JNQVRfNDIyX0xFR0FDWSwNCj4g
ICAJCQkJCVZDNV9EVlBfSFRfVkVDX0lOVEVSRkFDRV9DRkdfU0VMXzQyMik7DQo+ICAgDQo+
IC0JCXZjNV9oZG1pX3NldF9jc2NfY29lZmZzKHZjNF9oZG1pLCB2YzVfaGRtaV9jc2NfZnVs
bF9yZ2JfdG9feXV2X2J0NzA5W2xpbV9yYW5nZV0pOw0KPiArCQl2YzVfaGRtaV9zZXRfY3Nj
X2NvZWZmcyh2YzRfaGRtaSwgY3NjKTsNCj4gICAJCWJyZWFrOw0KPiAgIA0KPiAgIAljYXNl
IFZDNF9IRE1JX09VVFBVVF9SR0I6DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------juznTkBKqD56gqOs9Cm8wkcn--

--------------4VYiSeEUGztyXfQ1I00bpuzb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+0m0FAwAAAAAACgkQlh/E3EQov+Cm
ghAAwe2oQXJopRYKrM4tzsNLjciNzgkl7BkDO8mlQK63hX9niwV5YuXMYaoOzXqS4gbAUfZIxZe3
WYoMpxzDIaB6SFFvSrjR/jPGvBYMnPhyMrM01ROy3weluuM0UZlzGxBTxnpDOrLiBqpItDfsHLdR
CQkwlYUu7oHEHTju9/J+NJSI/qg4KNNYof73DOTqXVNNNAFp5FlWDL7KO1LxhHa8XUOY5SuCBCLH
Yceak/QtC74Lmi7TN8qB602KnTY0mXWUzTJvJKcfn8F64ig0ks1ShJF+aPRk4K3gDwW4YRcmx722
ZnKodsUBbagImny1DAjEWxpvFYx05KfqzG+Fx8vc8R3foCUFy6ptGegpPOYkJyLyO6nJ+ONUM2uR
E8MtA5wAikLSd+YlBogugL2e2RSNcRirPUpYquMSi0ejxap9U1GBltMo0LaQSk0r3hZS097MnD0j
vWvMT05r3YWFTQvgZCBC3X2yvTl70Z38Y3SiFco5Y4E07qqyWrdnE1hSI5qOOAvu3CBS39B2Y0w8
hUmyA6BZPqQ8Mx6C4KVi/TCbseoSZhbi2Wi6JnbUtphhSXG6NtJWgKtrqul8UV/wlSWLcocozLaS
Ekq6WErVkpR3BvCfpstjYxhDWwjcjdv8RSLn6eLBpV3RNiMMH1JVT2Ru2SVl2EZIKJPRAAwAM6f7
kdg=
=PXwv
-----END PGP SIGNATURE-----

--------------4VYiSeEUGztyXfQ1I00bpuzb--
