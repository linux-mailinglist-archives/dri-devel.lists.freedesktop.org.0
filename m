Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152B6F44A0
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6497010E0A8;
	Tue,  2 May 2023 13:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B96110E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:05:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C489B1F8BE;
 Tue,  2 May 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683032721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lLKfgeB+JqNvGRsaL01WJVCtLpK1SXx0X+TEi5Cfkto=;
 b=IORkPiHqrrYsdqhnwxts8I8RoHcm/La5btwPWosSWYFTpUW2pkfzvvuWR2h9F1oL64PfY4
 Z8lCVl8cAuTVgB2y7XvZtT1aNpM9XBGLzhfsI1KYNIF0pgH/dWytVOt6Tvh/DImtIQvWJr
 tjRiNqNwePR+44jFFDPRg9KJzSW1pkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683032721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lLKfgeB+JqNvGRsaL01WJVCtLpK1SXx0X+TEi5Cfkto=;
 b=rF5fEdeYzrDQOumP+Ak8A4Y8n3Kdl4qw3IcMzu4ze8OkoIb9WsRqr5GOuk3eJlqXTFyKLP
 vqtc3wLlJRVTSuAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15D32134FB;
 Tue,  2 May 2023 13:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SroQAZEKUWTpTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:05:21 +0000
Message-ID: <8b76866e-4f6d-7960-65ec-9880c2882c5e@suse.de>
Date: Tue, 2 May 2023 15:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/udl: delete dead code
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie
 <airlied@redhat.com>, Takashi Iwai <tiwai@suse.de>
References: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OC0RpCrqK8uP7BE4HzCBDidD"
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
Cc: kernel-janitors@vger.kernel.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OC0RpCrqK8uP7BE4HzCBDidD
Content-Type: multipart/mixed; boundary="------------aP8Dl8jZDUy5JphQHepJW9Un";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie
 <airlied@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Message-ID: <8b76866e-4f6d-7960-65ec-9880c2882c5e@suse.de>
Subject: Re: [PATCH] drm/udl: delete dead code
References: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
In-Reply-To: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>

--------------aP8Dl8jZDUy5JphQHepJW9Un
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDUuMjMgdW0gMTQ6NTkgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBU
aGUgInVub2RlIiBwb2ludGVyIGNhbm5vdCBiZSBOVUxMIGhlcmUgYW5kIGNoZWNraW5nIGZv
ciBpdCBjYXVzZXMNCj4gU21hdGNoIHdhcm5pbmdzOg0KPiANCj4gICAgIGRyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX21haW4uYzoyNTkgdWRsX2dldF91cmJfbG9ja2VkKCkNCj4gICAgIHdh
cm46IGNhbiAndW5vZGUnIGV2ZW4gYmUgTlVMTD8NCj4gDQo+IEZvcnR1bmF0ZWx5LCBpdCdz
IGp1c3QgaGFybWxlc3MgZGVhZCBjb2RlIHdoaWNoIGNhbiBiZSByZW1vdmVkLiAgSXQncw0K
PiBsZWZ0IG92ZXIgZnJvbSBjb21taXQgYzVjMzU0YTNhNDcyICgiZHJtL3VkbDogRml4IGlu
Y29uc2lzdGVudCB1cmJzLmNvdW50DQo+IHZhbHVlIGR1cmluZyB1ZGxfZnJlZV91cmJfbGlz
dCgpIikuDQo+IA0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
bGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5j
IHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiBpbmRleCAwNjFjYjg4YzA4
YTIuLjNlYmUyY2U1NWRmZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiBA
QCAtMjU1LDcgKzI1NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYl9sb2Nr
ZWQoc3RydWN0IHVkbF9kZXZpY2UgKnVkbCwgbG9uZyB0aW1lb3V0KQ0KPiAgIAlsaXN0X2Rl
bF9pbml0KCZ1bm9kZS0+ZW50cnkpOw0KPiAgIAl1ZGwtPnVyYnMuYXZhaWxhYmxlLS07DQo+
ICAgDQo+IC0JcmV0dXJuIHVub2RlID8gdW5vZGUtPnVyYiA6IE5VTEw7DQo+ICsJcmV0dXJu
IHVub2RlLT51cmI7DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCg0KVGhhbmtzIGEgbG90LiBJZiBubyBvbmUgY29tcGxhaW5zLCBJ
J2xsIGFkZCB0aGUgcGF0Y2ggdG8gZHJtLW1pc2MtbmV4dCBzb29uLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+ICAgfQ0KPiAgIA0KPiAgICNkZWZpbmUgR0VUX1VSQl9USU1FT1VU
CUhaDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFz
c2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJl
dyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAo
QUcgTnVlcm5iZXJnKQ0K

--------------aP8Dl8jZDUy5JphQHepJW9Un--

--------------OC0RpCrqK8uP7BE4HzCBDidD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRRCpAFAwAAAAAACgkQlh/E3EQov+A+
tRAAj7nsnGFSuLJrZExzyZcnDTde+lFijANCv/Mxrly3qhY5jYGZmXd0H83CteSzqZQ8DMmTsmKJ
KGpbQp8GElJqKkxD3fZ7T0g3+DdCPueFacnmvOlBPnZb3OEzu7JI3DQmmPy4c06NUwVTOfd/xFlw
+3loHApzq06ix4KHLoI7DbA4GhVjs2KJ/L9xv3+M30oudfbDQ0dW1yjKCB2tpYGM6AMyETGrsJNt
MTBihif6PeJW+QWxiwEGdEV1BszF+EYOztYzb3FD7RAmTNqBRNV3PgUBHiZIp5G8IisE6Z6Qgg56
G4wNotORlAQ5pdnBQQ511Byjo7teblblZ6g4VzSLYIXsDVmy+aaWCT2H6FL4J5wTsOk2/p35oTM5
UlUYtrfUfWzySEQQFOMYgoD9sciPFVxHFL+Fiisua20l7pAJQX3xZoZoMDb7S4DemoBKlJcni3wx
BPxuAM5hPunvdwQbUMhIg/ivE/HFhexmEs7i01lfmgEsmfXMFzi1xZ9hy6hHWfp0YmU5KNSU3MF8
e1ZGr+qTPdi//kGfzrCVSk+06Q+j3z4JJwIhABK3w8pZC20ev3xn7DT+hYI6OAG9yL8Q85N7xTsn
7BJno/Nn6vJpMS4aRNNwM55Fagawcp+C1hATrlgsKU3wDeFiIeU1kLxP4n/3aXBr0vvdyL+uXD4W
OWc=
=cj51
-----END PGP SIGNATURE-----

--------------OC0RpCrqK8uP7BE4HzCBDidD--
