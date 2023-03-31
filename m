Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB06D2419
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 17:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5229510E104;
	Fri, 31 Mar 2023 15:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30810E104
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 15:35:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3A4921AAC;
 Fri, 31 Mar 2023 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680276913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bgopTtLCvd94QN1+0LY//7r0zDRlIg6vTuYpHw3fzAI=;
 b=ZRVgYvYm6jRZNmpCVOkzrgkuBXNCC8D7JWT7YbJ6gnK7qukWuv+eQk7rJy9+dtMCztQXdj
 BNSSPEoWwRdXhYMgNkn+GKWFu5N3st/ZtT2tAvm0ku5vd2t/syQXL4jq6eRpOCZKxA7+VH
 QoGuktiYZXj8Go5HlzAL9CPt03CkywI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680276913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bgopTtLCvd94QN1+0LY//7r0zDRlIg6vTuYpHw3fzAI=;
 b=KGmnWEHc9J+I0Wb9nsbwULmKlUrwCcJMYnDXrLoBy0M8Ja+QthUNeECfW1n4zU+bS+I5Ny
 4yfOv+Y8T1GRR2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C10AC133B6;
 Fri, 31 Mar 2023 15:35:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W6z8LbD9JmTuDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 15:35:12 +0000
Message-ID: <7b63909c-07c2-86bd-5a6e-29504b88dae6@suse.de>
Date: Fri, 31 Mar 2023 17:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] drm: shmobile: Fixes and enhancements
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <cover.1680273039.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iBMAxBiqxaasxQ1oHtj09ku8"
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iBMAxBiqxaasxQ1oHtj09ku8
Content-Type: multipart/mixed; boundary="------------IrREz1EpaWTr98WYqdzm8yuw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <7b63909c-07c2-86bd-5a6e-29504b88dae6@suse.de>
Subject: Re: [PATCH 0/5] drm: shmobile: Fixes and enhancements
References: <cover.1680273039.git.geert+renesas@glider.be>
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>

--------------IrREz1EpaWTr98WYqdzm8yuw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KDQpmb3IgdGhlIHdob2xlIHBhdGNoc2V0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQpBbSAzMS4wMy4yMyB1bSAxNjo0OCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoN
Cj4gCUhpIGFsbCwNCj4gDQo+IEN1cnJlbnRseSwgdGhlcmUgYXJlIHR3byBkcml2ZXJzIGZv
ciB0aGUgTENEIGNvbnRyb2xsZXIgb24gUmVuZXNhcw0KPiBTdXBlckgtYmFzZWQgYW5kIEFS
TS1iYXNlZCBTSC1Nb2JpbGUgYW5kIFItTW9iaWxlIFNvQ3M6DQo+ICAgIDEuIHNoX21vYmls
ZV9sY2RjZmIsIHVzaW5nIHRoZSBmYmRldiBmcmFtZXdvcmssDQo+ICAgIDIuIHNobW9iX2Ry
bSwgdXNpbmcgdGhlIERSTSBmcmFtZXdvcmsuDQo+IEhvd2V2ZXIsIG9ubHkgdGhlIGZvcm1l
ciBkcml2ZXIgY2FuIGJlIHVzZWQsIGFzIGFsbCBwbGF0Zm9ybSBzdXBwb3J0DQo+IGludGVn
cmF0ZXMgdGhlIGZvcm1lci4gIE5vbmUgb2YgdGhlc2UgZHJpdmVycyBzdXBwb3J0IERULWJh
c2VkIHN5c3RlbXMuDQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBhIGZpcnN0IHN0ZXAg
dG8gZW5hYmxlIHRoZSBTSC1Nb2JpbGUgRFJNIGRyaXZlciBmb3INCj4gUmVuZXNhcyBBUk0t
YmFzZWQgU0gtTW9iaWxlIGFuZCBSLU1vYmlsZSBTb0NzLiAgVGhlIG5leHQgc3RlcCBwbGFu
bmVkIGlzDQo+IHRvIGFkZCBEVCBzdXBwb3J0Lg0KPiANCj4gVGhpcyBoYXMgYmVlbiB0ZXN0
ZWQgb24gdGhlIFItTW9iaWxlIEExLWJhc2VkIEF0bWFyayBUZWNobm8NCj4gQXJtYWRpbGxv
LTgwMC1FVkEgZGV2ZWxvcG1lbnQgYm9hcmQsIHVzaW5nIGEgdGVtcG9yYXJ5DQo+IHBsYXRm
b3JtLWVuYWJsZW1lbnQgcGF0Y2hbMV0uDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgY29tbWVu
dHMhDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9jMDNkNGVkYmQ2NTA4
MzZiZjZhOTY1MDRkZjgyMzM4ZWM2ZDgwMGZmLjE2ODAyNzI5ODAuZ2l0LmdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlDQo+IA0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gKDUpOg0KPiAgICBkcm06
IHNobW9iaWxlOiBVc2UgJXA0Y2MgdG8gcHJpbnQgZm91cmNjIGNvZGVzDQo+ICAgIGRybTog
c2htb2JpbGU6IEFkZCBzdXBwb3J0IGZvciBEUk1fRk9STUFUX1hSR0I4ODg4DQo+ICAgIGRy
bTogc2htb2JpbGU6IFN3aXRjaCB0byBkcm1fY3J0Y19pbml0X3dpdGhfcGxhbmVzKCkNCj4g
ICAgZHJtOiBzaG1vYmlsZTogQWRkIG1pc3NpbmcgY2FsbCB0byBkcm1fZmJkZXZfZ2VuZXJp
Y19zZXR1cCgpDQo+ICAgIGRybTogc2htb2JpbGU6IE1ha2UgRFJNX1NITU9CSUxFIHZpc2li
bGUgb24gUmVuZXNhcyBTb0MgcGxhdGZvcm1zDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9z
aG1vYmlsZS9LY29uZmlnICAgICAgICAgICB8ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3NobW9iaWxlL3NobW9iX2RybV9jcnRjLmMgIHwgMzUgKysrKysrKysrKysrKysrKysrKy0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zaG1vYmlsZS9zaG1vYl9kcm1fZHJ2LmMgICB8ICAz
ICsrDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NobW9iaWxlL3NobW9iX2RybV9rbXMuYyAgIHwg
IDkgKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NobW9iaWxlL3NobW9iX2RybV9wbGFu
ZS5jIHwgIDUgKysrKw0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------IrREz1EpaWTr98WYqdzm8yuw--

--------------iBMAxBiqxaasxQ1oHtj09ku8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQm/bAFAwAAAAAACgkQlh/E3EQov+CL
6A/+Kx3TRyqGRDdU08FG6qG4Cvf6ANSau0X83PljDvKCotDJS1+kMGxxje96/xVO4NqsYiABZ+oy
hGfaV31TfsrbOlPRoEKGEVxd1d7bS8wpkqMgERIy5P8JxF29ubozwtJMBrmle9wxqd/3YrCbnSqz
rd132kSU5DBrHX7/JoQT9RluCWci4SqDxyVDd9sHMFrE96/nS5MidP1IEZwoC+jrXeXaNeXhkti4
2enO6r+jIJvEPOMCh8ZNLWAjGBvB3nEfWigmu+HiWeGqv/syuHAErIsEuUNIgpYAeqkEJ9j3d6tx
lPBXEd78YvmuInZWN4gwG3IrrX1twYARTGW6G49bxvV9NhbkFa4urvdC+C+f8hNi33E0AAIEdH3U
1F0wwL0JDcNvCYzuLvz2vW+geFkBKqMp2GwePrumEaXzRTnFnn42px5xqjD/rOTxYi5On3Lra+ZJ
ffoEUdsnhiDW/HdeAL/w+B9fb9VcqxcGjkA5h/s8lt2FN2eeAHApl5f54S0xaTMRU9jiZF3NUJVT
KzNX6KpFZr73VaILnP7/NtCiqUmw8lN510givThUrvNpTcINC2FnWs0DeBRrU6xJdCYXR1KebZBP
UI1EWwo/wBaAlZl/70ZKvZJCQb4g846mtynvUO3iRqw28jNxuGHcnnHdFFdHoa+N7eyRUWONfUAR
sBc=
=sbAn
-----END PGP SIGNATURE-----

--------------iBMAxBiqxaasxQ1oHtj09ku8--
