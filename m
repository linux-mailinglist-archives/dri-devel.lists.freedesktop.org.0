Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A22D665EB6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C1D10E75A;
	Wed, 11 Jan 2023 15:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515510E760
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:05:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9323B17CF5;
 Wed, 11 Jan 2023 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673449510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKdhRTkjAmWz/kpI89zY3kHAK+0ZNPwr048FGGGo7Ds=;
 b=V+MjxKvXZROy/geUJrU6ezYbzFMkVnza1g1B88x0Xoe7/frRlBlV/G+8aE2kyrT3OV8cE5
 TjNTNtWKQNpJm89/nlEaQ9ZKVfvlzwADC+ireBjxWNzXVsiRNdF2cnOSGwjqm99QzKAnFU
 G/bX75CHeFJNJd317pcW1/rLofHwDKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673449510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKdhRTkjAmWz/kpI89zY3kHAK+0ZNPwr048FGGGo7Ds=;
 b=+5ovuH2WyGoCjOgHiJaCpL4Ms0yNtCFKdHTGggJR9RjZIhR1T617Lfpo4/c83UxioYTWgg
 QQUDdTY+LB0WxKCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E72013591;
 Wed, 11 Jan 2023 15:05:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9i4lFibQvmO6JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:05:10 +0000
Message-ID: <2b87062f-cc9e-ce8d-14aa-1ca863acc7f9@suse.de>
Date: Wed, 11 Jan 2023 16:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] drm/vc4: hdmi: Swap CSC matrix channels for YUV444
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-6-6b15f774c13a@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-6-6b15f774c13a@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------znuQZP7m8gX6mSI5BQj0gNNj"
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
--------------znuQZP7m8gX6mSI5BQj0gNNj
Content-Type: multipart/mixed; boundary="------------cgw0DCKpY2BA1HkQ06eCVidm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <2b87062f-cc9e-ce8d-14aa-1ca863acc7f9@suse.de>
Subject: Re: [PATCH 6/9] drm/vc4: hdmi: Swap CSC matrix channels for YUV444
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-6-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-6-6b15f774c13a@cerno.tech>

--------------cgw0DCKpY2BA1HkQ06eCVidm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjEyLjIyIHVtIDE3OjA3IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gRnJv
bTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4NCj4g
DQo+IFlVVjQ0NCByZXF1aXJlcyB0aGUgbWF0cml4IGNvZWZmaWNpZW50cyB0byBiZSBwcm9n
cmFtbWVkIGluIGEgZGlmZmVyZW50DQo+IHdheSB0aGFuIHRoZSBvdGhlciBmb3JtYXRzLiBM
ZXQncyBhZGQgYSBmdW5jdGlvbiB0byBwcm9ncmFtIGl0IHByb3Blcmx5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBp
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRl
Y2g+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCAx
NyArKysrKysrKysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+IGlu
ZGV4IDI5OWE4ZmU3YTJhZS4uY2I5MmQwNzY4MGYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfaGRtaS5jDQo+IEBAIC0xMjU5LDYgKzEyNTksMjAgQEAgc3RhdGljIHZvaWQgdmM1X2hk
bWlfc2V0X2NzY19jb2VmZnMoc3RydWN0IHZjNF9oZG1pICp2YzRfaGRtaSwNCj4gICAJSERN
SV9XUklURShIRE1JX0NTQ18zNF8zMywgKGNvZWZmc1syXVszXSA8PCAxNikgfCBjb2VmZnNb
Ml1bMl0pOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIHZjNV9oZG1pX3NldF9jc2Nf
Y29lZmZzX3N3YXAoc3RydWN0IHZjNF9oZG1pICp2YzRfaGRtaSwNCj4gKwkJCQkJIGNvbnN0
IHUxNiBjb2VmZnNbM11bNF0pDQo+ICt7DQo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZCgmdmM0
X2hkbWktPmh3X2xvY2spOw0KPiArDQo+ICsJLyogWVVWNDQ0IG5lZWRzIHRoZSBDU0MgbWF0
cmljZXMgdXNpbmcgdGhlIGNoYW5uZWxzIGluIGEgZGlmZmVyZW50IG9yZGVyICovDQo+ICsJ
SERNSV9XUklURShIRE1JX0NTQ18xMl8xMSwgKGNvZWZmc1syXVsxXSA8PCAxNikgfCBjb2Vm
ZnNbMl1bMF0pOw0KPiArCUhETUlfV1JJVEUoSERNSV9DU0NfMTRfMTMsIChjb2VmZnNbMl1b
M10gPDwgMTYpIHwgY29lZmZzWzJdWzJdKTsNCj4gKwlIRE1JX1dSSVRFKEhETUlfQ1NDXzIy
XzIxLCAoY29lZmZzWzBdWzFdIDw8IDE2KSB8IGNvZWZmc1swXVswXSk7DQo+ICsJSERNSV9X
UklURShIRE1JX0NTQ18yNF8yMywgKGNvZWZmc1swXVszXSA8PCAxNikgfCBjb2VmZnNbMF1b
Ml0pOw0KPiArCUhETUlfV1JJVEUoSERNSV9DU0NfMzJfMzEsIChjb2VmZnNbMV1bMV0gPDwg
MTYpIHwgY29lZmZzWzFdWzBdKTsNCj4gKwlIRE1JX1dSSVRFKEhETUlfQ1NDXzM0XzMzLCAo
Y29lZmZzWzFdWzNdIDw8IDE2KSB8IGNvZWZmc1sxXVsyXSk7DQo+ICt9DQo+ICsNCj4gICBz
dGF0aWMgdm9pZCB2YzVfaGRtaV9jc2Nfc2V0dXAoc3RydWN0IHZjNF9oZG1pICp2YzRfaGRt
aSwNCj4gICAJCQkgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlLA0K
PiAgIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkNCj4g
QEAgLTEyODIsNyArMTI5Niw4IEBAIHN0YXRpYyB2b2lkIHZjNV9oZG1pX2NzY19zZXR1cChz
dHJ1Y3QgdmM0X2hkbWkgKnZjNF9oZG1pLA0KPiAgIA0KPiAgIAlzd2l0Y2ggKHZjNF9zdGF0
ZS0+b3V0cHV0X2Zvcm1hdCkgew0KPiAgIAljYXNlIFZDNF9IRE1JX09VVFBVVF9ZVVY0NDQ6
DQo+IC0JCXZjNV9oZG1pX3NldF9jc2NfY29lZmZzKHZjNF9oZG1pLCB2YzVfaGRtaV9jc2Nf
ZnVsbF9yZ2JfdG9feXV2X2J0NzA5W2xpbV9yYW5nZV0pOw0KPiArCQl2YzVfaGRtaV9zZXRf
Y3NjX2NvZWZmc19zd2FwKHZjNF9oZG1pLA0KPiArCQkJCQkgICAgIHZjNV9oZG1pX2NzY19m
dWxsX3JnYl90b195dXZfYnQ3MDlbbGltX3JhbmdlXSk7DQo+ICAgCQlicmVhazsNCj4gICAN
Cj4gICAJY2FzZSBWQzRfSERNSV9PVVRQVVRfWVVWNDIyOg0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------cgw0DCKpY2BA1HkQ06eCVidm--

--------------znuQZP7m8gX6mSI5BQj0gNNj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+0CUFAwAAAAAACgkQlh/E3EQov+Cp
9w/7BfwCWalALT8Ig4VDDljUozgSGfsUl+iupaVqnbO7cvqAvUWRjoouj7HV1ARnLRKUwGmkycAY
JKIAirOjJFUteMZBOROyzhgyJ45Qe0ACs7pwGZypnJ0c4ykeCLxUBo2qqcCZ29xy6uWRCiUsnlQF
NFZN3KeuIJaCHZXEPhryOZw0H1fLiuzs7JUu2RZ9RD6dx7kWx2Jds44vDk29mb4l9vRBmJnsfzls
Zur2/2c1qmrHxYEv2Uxbdn91FvjfJjvf/L2fIOg0QmUrc2q1LB1s5V0oAsbyfJUtBFUiuB8wGMqx
l49fH+ePvYzxitbO4RuVqIULmmABzZpBwvYb8cLEnhkS6Br6Hco8nFp0UMC1o+Hlz2dOVGaui/+j
C5ARErv+mTmyFd/z4ypBxTcqXi1+tgQLEx10+vMsW5vJXZ3E+C9bhARw5PuSMe1/52TFB9c4nHWS
1CCSjWngyQ79o1RPIWZ2jopDeA9dLUbUvhZiZmKAj566ZXmKhbjlBqpQG5VZEsutFFEE0cub6h26
/6gfk1ppt9K+3c+9lehjUIY+9Z6V8ZhY2VTrMx8M0O9+4tS56AEn3jNE6cl5yaImndrEThH0tJRG
BebyGKoYUR2h/zMFTbOnU/RtXJgYP9MFdOF7nTbtB+sIxW7BQXwWFd3bPCa/ztDDp/TgB/COl3rv
gF0=
=QMUB
-----END PGP SIGNATURE-----

--------------znuQZP7m8gX6mSI5BQj0gNNj--
