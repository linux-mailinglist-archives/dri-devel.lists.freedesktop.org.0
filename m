Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C96A3DD3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968B010E37D;
	Mon, 27 Feb 2023 09:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BA310E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:07:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 460CF219ED;
 Mon, 27 Feb 2023 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677488831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwDQFd8GqomzV9o1DkuHSXp2D6WzQu8xu+qfawxJoMA=;
 b=zKpgd/OgJvY8HOuLDWo+qH1qI5524NmGz31rUlOLmNxQIO54bsptZ2l0zI9eIMrsjNCbYy
 GQo5TTV5QhYaA1o3QwLSGtZvZ+Li7E3vwc45yLoLpOsGdSfUfK0oXSpUWesyFVqXHCWeZA
 3l4P4Lz8hhlPJCB4nfTwQSKdBHMOYLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677488831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwDQFd8GqomzV9o1DkuHSXp2D6WzQu8xu+qfawxJoMA=;
 b=5t9nqUk+1IRaKGQSjmOTK21YkCUL0ln1eYuKrOiWAuS1DsbE9UcRXLAq5nzb5QAOsqH8e4
 DEPxk/fy0Zdh8SBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0257513912;
 Mon, 27 Feb 2023 09:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WkgDO75y/GOpSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Feb 2023 09:07:10 +0000
Message-ID: <c94a0b2c-f061-3030-ecb7-abf0a16faa1d@suse.de>
Date: Mon, 27 Feb 2023 10:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/shmem-helper: Revert accidental non-GPL export
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BVNiccEahvXdu56kccgU0b0C"
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
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BVNiccEahvXdu56kccgU0b0C
Content-Type: multipart/mixed; boundary="------------Z00KBjd9FVs2RKcR8jRZ910L";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Rob Herring <robh@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <c94a0b2c-f061-3030-ecb7-abf0a16faa1d@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Revert accidental non-GPL export
References: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
In-Reply-To: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>

--------------Z00KBjd9FVs2RKcR8jRZ910L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDIuMjMgdW0gMTA6MDQgc2NocmllYiBBc2FoaSBMaW5hOg0KPiBUaGUg
cmVmZXJlbmNlZCBjb21taXQgYWRkZWQgYSB3cmFwcGVyIGZvciBkcm1fZ2VtX3NobWVtX2dl
dF9wYWdlc19zZ3QoKSwNCj4gYnV0IGluIHRoZSBwcm9jZXNzIGl0IGFjY2lkZW50YWxseSBj
aGFuZ2VkIHRoZSBleHBvcnQgdHlwZSBmcm9tIEdQTCB0bw0KPiBub24tR1BMLiBTd2l0Y2gg
aXQgYmFjayB0byBHUEwuDQo+IA0KPiBSZXBvcnRlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
bWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gRml4ZXM6IGRkZGRlZGFhMGRiOSAo
ImRybS9zaG1lbS1oZWxwZXI6IEZpeCBsb2NraW5nIGZvciBkcm1fZ2VtX3NobWVtX2dldF9w
YWdlc19zZ3QoKSIpDQo+IFNpZ25lZC1vZmYtYnk6IEFzYWhpIExpbmEgPGxpbmFAYXNhaGls
aW5hLm5ldD4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KDQpUaGFua3MgYSBsb3QuIEknbGwgYWRkIHlvdXIgcGF0Y2ggdG8gZHJt
LW1pc2MtZml4ZXMgQVNBUC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDIgKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+IGluZGV4IDdlNWM2YThk
MDIxMi4uNzUxODVhOTYwZmM0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9zaG1lbV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuYw0KPiBAQCAtNzQ0LDcgKzc0NCw3IEBAIHN0cnVjdCBzZ190YWJsZSAq
ZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVj
dCAqc2htZW0pDQo+ICAgDQo+ICAgCXJldHVybiBzZ3Q7DQo+ICAgfQ0KPiAtRVhQT1JUX1NZ
TUJPTChkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QpOw0KPiArRVhQT1JUX1NZTUJPTF9H
UEwoZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KTsNCj4gICANCj4gICAvKioNCj4gICAg
KiBkcm1fZ2VtX3NobWVtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSAtIFByb2R1Y2UgYSBzaG1l
bSBHRU0gb2JqZWN0IGZyb20NCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogZjNhMjQzOWYy
MGQ5MTg5MzBjYzRhZThmNzZmZTFjMWFmZDI2OTU4Zg0KPiBjaGFuZ2UtaWQ6IDIwMjMwMjI3
LXNobWVtLWV4cG9ydC1maXgtODVmZGUxMzUxMTA0DQo+IA0KPiBUaGFuayB5b3UsDQo+IH5+
IExpbmENCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Z00KBjd9FVs2RKcR8jRZ910L--

--------------BVNiccEahvXdu56kccgU0b0C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP8cr4FAwAAAAAACgkQlh/E3EQov+Bc
GBAAvceH4t/45JD0Lo6uu3OZjZ99TJHBdpCaCPctKIEqsLjm8AB+7Gxztdp49N9onLiNJ7IOWEzm
LNS1PjsYzaLN/5/YO5l1tTZrAVmd7iGlF8BlUkWNYiRmBe5tzAlrVsOFuHax9sb/iGgE6XUU4EY3
OScZij1mqhLfhuAUKzKk8+TR5Zih/7Fl72Fr2ubjkX7klemlVAILUngQwWCj4EWrcZ1e8Wjttg1d
WvoOANy+PA66H8fR9HLyJ0KiRmPv5DZ5gvETBMEmCWB+dnQeeMaWM3yJkvoPdNOaFKlIWys+4tfK
5qFMMv/8MmXVZcsOsMNgfG78qb0KI/x+ZCn/fqzQCZLAO3WAI63lVCybB8b60pvIE3m63yGB7DrV
ds0YH6zlVv/BVxm9/cEpycJ0A39KQLnUG20bKCJln1gO+Pczb5b2npNxb6XCNCN1zySWHtvP3zsn
NoZbehy9tgIKYf85EJxMKHZ1tOq+oQmZNP3N0YB6waoALXW5qZ4LIwtDHFCwcg9QUwezqnM8DO8j
KcDFQIT3oY0zTTgKCY5dfRwl4Ghbq3VDzNBwSKJsMXVJvmY9AhGu3jlUtHOxYHNkzryS1ZQvYckS
6CLK+C8x6lKFrYwhe0n/O3Zq0tp9MyPNZRPv7SIwV6BgGMTao1jgJghrzVG701GJDNvTzlJmqs27
Tic=
=V9vF
-----END PGP SIGNATURE-----

--------------BVNiccEahvXdu56kccgU0b0C--
