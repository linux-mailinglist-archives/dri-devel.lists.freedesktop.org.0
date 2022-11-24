Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58663745C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A110E6AF;
	Thu, 24 Nov 2022 08:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EF510E6AF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:46:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 524C71F749;
 Thu, 24 Nov 2022 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669279609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qza448ucCDLGXGUlE/3bEGm8MMmtXTkWkq9TnW9DtE=;
 b=GEi96S4SyfecsiFxaE86ihxeSvR1D03MtusDH0XjWuuQ0wX+uN3kBdrfpcsgtLppq8SmI9
 90hVukRxwjbQ5HrMhF5dzGHJHuWs+TpoEgCrMuVBsU3CeBWzwUmHqaZXHGGb0eKCQpBCz7
 ZHIpEWsJOTxu5bRQjza/6IIdSmdJEjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669279609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qza448ucCDLGXGUlE/3bEGm8MMmtXTkWkq9TnW9DtE=;
 b=+m8YSErwN+RnQrPIRCfV4LFRiLWRc1ityUpYueX5fm9YznSxtbKgSNWf4Dj0zna+23H+FB
 JAdj7MHMOyVdJCAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0ABB613B1A;
 Thu, 24 Nov 2022 08:46:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T9acAXkvf2P/cwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Nov 2022 08:46:49 +0000
Message-ID: <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
Date: Thu, 24 Nov 2022 09:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XjylbMlXxkAsWPRzXxAOvfvO"
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XjylbMlXxkAsWPRzXxAOvfvO
Content-Type: multipart/mixed; boundary="------------XoyofduipLwRhZAo4vf0knVq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-fbdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
In-Reply-To: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>

--------------XoyofduipLwRhZAo4vf0knVq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTEuMjIgdW0gMTc6NDMgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEFzIG9mIGNvbW1pdCBlYWUwNjEyMGYxOTc0ZTFhICgiZHJtOiByZWZ1c2UgQURERkIy
IGlvY3RsIGZvciBicm9rZW4NCj4gYmlnZW5kaWFuIGRyaXZlcnMiKSwgZHJpdmVycyBtdXN0
IHNldCB0aGUNCj4gcXVpcmtfYWRkZmJfcHJlZmVyX2hvc3RfYnl0ZV9vcmRlciBxdWlyayB0
byBtYWtlIHRoZSBkcm1fbW9kZV9hZGRmYigpDQo+IGNvbXBhdCBjb2RlIHdvcmsgY29ycmVj
dGx5IG9uIGJpZy1lbmRpYW4gbWFjaGluZXMuDQo+IA0KPiBXaGlsZSB0aGF0IHdvcmtzIGZp
bmUgZm9yIGJpZy1lbmRpYW4gWFJHQjg4ODggYW5kIEFSR0I4ODg4LCB3aGljaCBhcmUNCj4g
bWFwcGVkIHRvIHRoZSBleGlzdGluZyBsaXR0bGUtZW5kaWFuIEJHUlg4ODg4IGFuZCBCR1JB
ODg4OCBmb3JtYXRzLCBpdA0KPiBkb2VzIG5vdCB3b3JrIGZvciBiaWctZW5kaWFuIFhSR0Ix
NTU1IGFuZCBSR0I1NjUsIGFzIHRoZSBsYXR0ZXIgYXJlIG5vdA0KPiBsaXN0ZWQgaW4gdGhl
IGZvcm1hdCBkYXRhYmFzZS4NCj4gDQo+IEZpeCB0aGlzIGJ5IGFkZGluZyB0aGUgbWlzc2lu
ZyBmb3JtYXRzLiAgTGltaXQgdGhpcyB0byBiaWctZW5kaWFuDQo+IHBsYXRmb3JtcywgYXMg
dGhlcmUgaXMgY3VycmVudGx5IG5vIG5lZWQgdG8gc3VwcG9ydCB0aGVzZSBmb3JtYXRzIG9u
DQo+IGxpdHRsZS1lbmRpYW4gcGxhdGZvcm1zLg0KPiANCj4gRml4ZXM6IDY5NjBlNmRhOWNl
YzNmNjYgKCJkcm06IGZpeCBkcm1fbW9kZV9hZGRmYigpIG9uIGJpZyBlbmRpYW4gbWFjaGlu
ZXMuIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4NCj4gLS0tDQo+IHYyOg0KPiAgICAtIFVzZSAiRFJNX0ZPUk1BVF9mb28g
fCBEUk1fRk9STUFUX0JJR19FTkRJQU4iIGluc3RlYWQgb2YNCj4gICAgICAiRFJNX0ZPUk1B
VF9IT1NUX2ZvbyIsDQo+ICAgIC0gVHVybiBpbnRvIGEgbG9uZSBwYXRjaCwgYXMgYWxsIG90
aGVyIHBhdGNoZXMgZnJvbSBzZXJpZXMNCj4gICAgICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yL2NvdmVyLjE2NTczMDA1MzIuZ2l0LmdlZXJ0QGxpbnV4LW02OGsub3JnDQo+ICAgICAg
d2VyZSBhcHBsaWVkIHRvIGRybS1taXNjL2Zvci1saW51eC1uZXh0Lg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jIHwgNCArKysrDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jDQo+IGluZGV4
IGUwOTMzMWJiM2JjNzNmMjEuLjI2NTY3MWE3ZjkxMzRjMWYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mb3VyY2MuYw0KPiBAQCAtMTkwLDYgKzE5MCwxMCBAQCBjb25zdCBzdHJ1Y3QgZHJtX2Zv
cm1hdF9pbmZvICpfX2RybV9mb3JtYXRfaW5mbyh1MzIgZm9ybWF0KQ0KPiAgIAkJeyAuZm9y
bWF0ID0gRFJNX0ZPUk1BVF9CR1JBNTU1MSwJLmRlcHRoID0gMTUsIC5udW1fcGxhbmVzID0g
MSwgLmNwcCA9IHsgMiwgMCwgMCB9LCAuaHN1YiA9IDEsIC52c3ViID0gMSwgLmhhc19hbHBo
YSA9IHRydWUgfSwNCj4gICAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfUkdCNTY1LAkJLmRl
cHRoID0gMTYsIC5udW1fcGxhbmVzID0gMSwgLmNwcCA9IHsgMiwgMCwgMCB9LCAuaHN1YiA9
IDEsIC52c3ViID0gMSB9LA0KPiAgIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9CR1I1NjUs
CQkuZGVwdGggPSAxNiwgLm51bV9wbGFuZXMgPSAxLCAuY3BwID0geyAyLCAwLCAwIH0sIC5o
c3ViID0gMSwgLnZzdWIgPSAxIH0sDQo+ICsjaWZkZWYgX19CSUdfRU5ESUFODQo+ICsJCXsg
LmZvcm1hdCA9IERSTV9GT1JNQVRfWFJHQjE1NTUgfCBEUk1fRk9STUFUX0JJR19FTkRJQU4s
IC5kZXB0aCA9IDE1LCAubnVtX3BsYW5lcyA9IDEsIC5jcHAgPSB7IDIsIDAsIDAgfSwgLmhz
dWIgPSAxLCAudnN1YiA9IDEgfSwNCj4gKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1
NjUgfCBEUk1fRk9STUFUX0JJR19FTkRJQU4sIC5kZXB0aCA9IDE2LCAubnVtX3BsYW5lcyA9
IDEsIC5jcHAgPSB7IDIsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEgfSwNCg0KR2V0
dGluZyBiYWNrIHRvIHRoZSBkaXNjdXNzaW9uIG9uIGVuZGlhbmVzcywgSSBkb24ndCB1bmRl
cnN0YW5kIHdoeSB0aGUgDQpCSUdfRU5ESUFOIGZsYWcgaXMgc2V0IGhlcmUuICBBRkFJSyB0
aGVzZSBmb3JtYXRzIGFyZSBhbHdheXMgbGl0dGxlIA0KZW5kaWFuLiAgQW5kIHRoZSBCRSBm
bGFnIGlzIHNldCBieSBkcml2ZXJzL3VzZXJzcGFjZSBpZiBhIGZyYW1lYnVmZmVyIA0KaGFz
IGEgQkUgb3JkZXJpbmcuDQoNCkl0IHdvdWxkIGJlIGJldHRlciB0byBmaWx0ZXIgdGhlIEJF
IGZsYWcgaW4gX19kcm1fZm9ybWF0X2luZm8oKSBiZWZvcmUgDQp0aGUgZnVuY3Rpb24gZG9l
cyB0aGUgbG9va3VwLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsjZW5kaWYNCj4g
ICAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfUkdCODg4LAkJLmRlcHRoID0gMjQsIC5udW1f
cGxhbmVzID0gMSwgLmNwcCA9IHsgMywgMCwgMCB9LCAuaHN1YiA9IDEsIC52c3ViID0gMSB9
LA0KPiAgIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9CR1I4ODgsCQkuZGVwdGggPSAyNCwg
Lm51bV9wbGFuZXMgPSAxLCAuY3BwID0geyAzLCAwLCAwIH0sIC5oc3ViID0gMSwgLnZzdWIg
PSAxIH0sDQo+ICAgCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1hSR0I4ODg4LAkuZGVwdGgg
PSAyNCwgLm51bV9wbGFuZXMgPSAxLCAuY3BwID0geyA0LCAwLCAwIH0sIC5oc3ViID0gMSwg
LnZzdWIgPSAxIH0sDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------XoyofduipLwRhZAo4vf0knVq--

--------------XjylbMlXxkAsWPRzXxAOvfvO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN/L3gFAwAAAAAACgkQlh/E3EQov+Dl
Ng/+M9NIvPFL7BpWwOAQiETFFLv006djr/agkCRGf84E4Ae4D8HQ6dkXUSRigJK5v1coZnsHQ/Dy
Md8ArPuDTQhS3XTJVgy+JjTbDFaBUiBYXuRYHOsMMom4iojYTt77ff3HvteUVOCo4VwoRwjyfS4z
AiRkyoQgqOOUVU/+Bq8NVjEPncbRnSzvNp5zWXh6C+X4fAMjhfeNM1dVgKCmroyvoOH7hH8DPYxJ
O8ViAVkIS9c/lg1At15h7eOyaiPoGMxq7h224Li4tkD1cU7jGs0qmoLMtGADHQqta22S4m5SUSwB
t8vdc4lElo0gU6Sva62LPLWYbSRa1roxDRbwXbnyI8Pmj2Ok+z0MUBmE7Pnm3lCENTHUkzKLZFgF
5oj5Vp5k77oKi5PtOpIGpHDe+fwllLJCDfAfUa17wIX9BlHjHuzy/r7mS6BBz10fFfbigIECZI+h
BeBHVpj3HtR450pAZ6XFDZw0Eorhz4ivutBKezkk+ikFapIy4cJb3eJiCd29ibOqyB1nWeHeUOuK
s2hrxzTCgsDcAZB/tKVVZ59dTIJSQW7Pv/kQPOMjioS/8Z8sz5AODxKmZ22aYqg+v2peOGkcPSKK
nSyjxCUa/MI4U9a4NXVbDNPzJCBIT0BSPVspajo8qyF9m6+vNp9Q3PdQSAej2Tq/BLg8yWK8fA9j
PRs=
=Ezd/
-----END PGP SIGNATURE-----

--------------XjylbMlXxkAsWPRzXxAOvfvO--
