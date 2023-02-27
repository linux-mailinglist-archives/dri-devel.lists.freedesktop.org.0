Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C46A3BCE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 08:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4464910E1AC;
	Mon, 27 Feb 2023 07:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0272910E1AC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 07:45:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B05AD219E7;
 Mon, 27 Feb 2023 07:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677483922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6C2YtCUwbWaNDlaF/RnsiFAj2ARPeeH2f0QMrrp0V0=;
 b=tkj9gADs54FhfCQ5mHtJEDBpxTtnzZKuwtEhOUAv8h4lVWSR8WmGYKwPNlGcbbQ+fphf93
 ZREsAsidEp6kxlr3NYkTJbaw+EHwfSm91bY39wqTubrj5iBaNrycU7L8M5dvjoUkCmbw26
 2DvGnQafqtPlUjW6nHlv3RDUEe3Np50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677483922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6C2YtCUwbWaNDlaF/RnsiFAj2ARPeeH2f0QMrrp0V0=;
 b=Qs8Cw9aX3X5J3r6O1OQ7LGuoW/SWeE2HT1Y0baQEI9C2qc6fVR4+pV9CXutWIJayt4b38L
 54OnwhWY7lwqoHCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76DDE13A43;
 Mon, 27 Feb 2023 07:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f90MHJJf/GNuIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Feb 2023 07:45:22 +0000
Message-ID: <cc1c34c6-18d1-a8c5-bf70-078e7b7205f8@suse.de>
Date: Mon, 27 Feb 2023 08:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
 <eddfa36c-4553-d392-0047-313002c613d4@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <eddfa36c-4553-d392-0047-313002c613d4@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t3CUJmibwv6xqIDKWGtbfHoK"
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t3CUJmibwv6xqIDKWGtbfHoK
Content-Type: multipart/mixed; boundary="------------SyFyrz6r7HAItUFMrHojnBJz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Message-ID: <cc1c34c6-18d1-a8c5-bf70-078e7b7205f8@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
References: <20230205125124.2260-1-lina@asahilina.net>
 <eddfa36c-4553-d392-0047-313002c613d4@collabora.com>
In-Reply-To: <eddfa36c-4553-d392-0047-313002c613d4@collabora.com>

--------------SyFyrz6r7HAItUFMrHojnBJz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDIuMjMgdW0gMjI6NTEgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IE9uIDIvNS8yMyAxNTo1MSwgQXNhaGkgTGluYSB3cm90ZToNCj4+IC1FWFBPUlRfU1lNQk9M
X0dQTChkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QpOw0KPj4gK0VYUE9SVF9TWU1CT0wo
ZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KTsNCj4gDQo+IE5vdGUgaXQgd2FzIGEgR1BM
IHN5bWJvbC4gSSBleHBlY3QgdGhhdCBhbGwgZHJtLXNobWVtIGV4cG9ydHMgc2hvdWxkIGJl
IEdQTC4NCg0KUmlnaHQuIEkgZGlkbid0IG5vdGljZSB0aGF0IGNoYW5nZSwgYnV0IGl0J3Mg
cHJvYmFibHkgbm90IGFsbG93ZWQuIFRoaXMgDQpuZWVkcyB0byBiZSByZXZlcnRlZCB0byBh
IEdQTCBleHBvcnQNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------SyFyrz6r7HAItUFMrHojnBJz--

--------------t3CUJmibwv6xqIDKWGtbfHoK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP8X5IFAwAAAAAACgkQlh/E3EQov+BE
eA//W/oNYhh8ARtVjltctdgJdVhT044vycFZPo61yOY3eSRk+80NM8QHwp15+zPlZLCukKOWDd11
rTNl5kJ2Isax00AWsEnq1yVVRkb+230nx7dCdA++8tCWFdViE2+A7PCRGgFWg433ubX7a9zK1Ble
m9Jr7AO/WFkaMpcEdLwsK8MXJZ2SNljXNI7GFDVBj3OUsfKJ3zCVydW12ernAtMhii5pVfTKr9GJ
fYZngHmqlRNR91gxdt433M4FGYGa1FZILHkZ3OPdy+d9vOXX8Z2XlP16CyLmMVtVeY0YyChAre4B
/S3B5Nr8tf+OlLV8HlnYvdhyT6nRB4MpO48+Q6kM6MheGZM/K5ujcnIOofePnpllinKVVyhAihsl
5t/v8n+sj412FIG1bptUTRvamB3/qLJUjTdsRq+4N7i75dMMcd6bV8nTitJ59mRYlXu4sPWop3em
SlBxFwQk1Tj5ZUtLBHErFkQ/usWDEi5jF89jFCLqd8uSjcHCWbLqNGvA3wtuLCztdIwqhaNnnJYz
ZpywaR8MxzWsgVbjnHs18GVxLMflirZytAH5b2pazntDcGkuU9Y4rFnr38Hu+76s6uofyu3x88Ii
n3A2rZT7FHcUcoJYiyyEgvTeVOtv/rrhvF/5z/TvNz1p3pST6KUyG8URKkQ4jY8WDDyyV/0auHat
ED8=
=QQYM
-----END PGP SIGNATURE-----

--------------t3CUJmibwv6xqIDKWGtbfHoK--
