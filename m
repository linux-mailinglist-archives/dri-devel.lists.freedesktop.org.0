Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D144694DB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 12:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC7A7379F;
	Mon,  6 Dec 2021 11:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F98F73706;
 Mon,  6 Dec 2021 11:16:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3B6A1FD54;
 Mon,  6 Dec 2021 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638789385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8jQ8QG5yfyovABTsMwzloL81Lw8VmQNtebtZoCYYFQ=;
 b=uNKSmiJarb6VyZvwlMLbG5SEHLBUqrku86v5aCFZutccjE/li/91njyYEimcFk9Cl8qBt/
 Bp/clpeArneU7iqBVXHbx6Pk0MXEqn49cTy0PuSzppRV3lTVqSWA3ZGk0vbDVbiaARDhc8
 wPlh/byU1Evwpnn8iH+TsqLITjVKJyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638789385;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8jQ8QG5yfyovABTsMwzloL81Lw8VmQNtebtZoCYYFQ=;
 b=sbErUmmGlhyCbfsCBm8kMWeu4jBptM3zZrTK22KB3pIL+KMeGQtgqs0Rt93SySidmzqLyi
 P3drltobQg7/gfCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7138B13B2C;
 Mon,  6 Dec 2021 11:16:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +5SNGgnxrWENXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 11:16:25 +0000
Message-ID: <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
Date: Mon, 6 Dec 2021 12:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211206104233.GD1978@kadam>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oH0RlGTbsvofw0BB3mvWo040"
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
Cc: kraxel@redhat.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oH0RlGTbsvofw0BB3mvWo040
Content-Type: multipart/mixed; boundary="------------tti0ytzmBu0adVQa9Gb8zCmd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, emma@anholt.net, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam>
In-Reply-To: <20211206104233.GD1978@kadam>

--------------tti0ytzmBu0adVQa9Gb8zCmd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjEgdW0gMTE6NDIgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBP
biBUdWUsIE5vdiAzMCwgMjAyMSBhdCAxMDo1Mjo1NUFNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEdFTSBoZWxwZXIgbGlicmFyaWVzIHVzZSBzdHJ1Y3QgZHJtX2Ry
aXZlci5nZW1fY3JlYXRlX29iamVjdCB0byBsZXQNCj4+IGRyaXZlcnMgb3ZlcnJpZGUgR0VN
IG9iamVjdCBhbGxvY2F0aW9uLiBPbiBmYWlsdXJlLCB0aGUgY2FsbCByZXR1cm5zDQo+PiBO
VUxMLg0KPj4NCj4+IENoYW5nZSB0aGUgc2VtYW50aWNzIHRvIG1ha2UgdGhlIGNhbGxzIHJl
dHVybiBhIHBvaW50ZXItZW5jb2RlZCBlcnJvci4NCj4+IFRoaXMgYWxpZ25zIHRoZSBjYWxs
YmFjayB3aXRoIGl0cyBjYWxsZXJzLiBGaXhlcyB0aGUgaW5nZW5pYyBkcml2ZXIsDQo+PiB3
aGljaCBhbHJlYWR5IHJldHVybnMgYW4gZXJyb3IgcG9pbnRlci4NCj4+DQo+PiBBbHNvIHVw
ZGF0ZSB0aGUgY2FsbGVycyB0byBoYW5kbGUgdGhlIGludm9sdmVkIHR5cGVzIG1vcmUgc3Ry
aWN0bHkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+IFRoZXJlIGlzIGFuIGFsdGVybmF0aXZlIHBh
dGNoIGF0IFsxXSB0aGF0IHVwZGF0ZXMgdGhlIHZhbHVlIHJldHVybmVkDQo+PiBieSBpbmdl
bmljcycgZ2VtX2NyZWF0ZV9vYmplY3QgdG8gTlVMTC4gRml4aW5nIHRoZSBpbnRlcmZhY2Ug
dG8gcmV0dXJuDQo+PiBhbiBlcnJubyBjb2RlIGlzIG1vcmUgY29uc2lzdGVudCB3aXRoIHRo
ZSByZXN0IG9mIHRoZSBHRU0gZnVuY3Rpb25zLg0KPj4NCj4+IFsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMTExMTgxMTE1MjIuR0QxMTQ3QGtpbGkvDQo+IA0K
PiBNeSBmaXggd2FzIGFscmVhZHkgYXBwbGllZCBhbmQgYmFja3BvcnRlZCB0byAtc3RhYmxl
IGV0Yy4uLiAgWW91cg0KPiBwYXRjaCBpcyBub3QgZGV2ZWxvcGVkIGFnYWluc3QgYSBjdXJy
ZW50IHRyZWUgc28geW91IGJyb2tlIGl0Lg0KDQpEbyB5b3UgaGF2ZSBhIHNwZWNpZmljIGxp
bms/IEkganVzdCBjaGVja2VkIHRoZSBzdGFibGUgdHJlZSBhdCBbMV0gYW5kIA0KdGhlcmUg
bm8gdHJhY2Ugb2YgeW91ciBwYXRjaC4NCg0KUGF0Y2hlcyBmb3IgRFJNIHNob3VsZCBnbyB0
aHJvdWdoIHRocm91Z2ggRFJNIHRyZWVzOyBkcm0tbWlzYy1maXhlcyBpbiANCnRoaXMgY2Fz
ZS4gRXhjZXB0aW9ucyBzaG91bGQgYXQgbGVhc3QgYmUgYW5ub3VuY2Ugb24gZHJpLWRldmVs
LiBOZWl0aGVyIA0KaXMgdGhlIGNhc2UgaGVyZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KWzFdIA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvc3RhYmxlL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2Vu
aWMtZHJtLWRydi5jDQoNCj4gDQo+IFRoYXQncyB0aGUgdHJpY2t5IHRoaW5nIHdpdGggY2hh
bmdpbmcgdGhlIEFQSSBiZWNhdXNlIHNheSBwZW9wbGUgd3JvdGUNCj4gdGhlaXIgY29kZSBs
YXN0IHdlZWsgd2hlcmUgcmV0dXJuaW5nIE5VTEwgd2FzIGNvcnJlY3QuICBXaGVuIHRoZXkg
c3VibWl0DQo+IHRoZWlyIGRyaXZlciB1cHN0cmVhbSwgZXZlcnl0aGluZyB3aWxsIG1lcmdl
IGFuZCBidWlsZCBidXQgaXQgd2lsbCBicmVhaw0KPiBhdCBydW50aW1lLg0KPiANCj4gRm9y
IG5vdywgaXQncyBvbmx5IHZjNF9jcmVhdGVfb2JqZWN0KCkgd2hpY2ggaXMgYnJva2VuLg0K
PiANCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------tti0ytzmBu0adVQa9Gb8zCmd--

--------------oH0RlGTbsvofw0BB3mvWo040
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGt8QgFAwAAAAAACgkQlh/E3EQov+BM
Yw/9HICOZ7UpUzcT5OmJTyjStySM5OgcJRv4h8o9a0T2Z/PVehzxMjdlUsunz7tXlWggTo7lB5eW
wOgkg30hl9BrmBOMpyqnhiPoJEd5GCtSa/aey8IAv/WTHUjOrzVmMwMA60QyGzhSthhx+nXOx8zq
QwbBCoO32AhCn4biTv7E3mJpqvDM0nwP7J0++N3VYBXiv5sGvsZ62AEj3KK4nqiSTzR72sVZ9+KB
W2welh/Ok4OZPIbV3KbCq2H7jwROaUEHzbuuGC4wkCs03Ygf3nUI3Ls9VHdm7kGTTz8y33xHc8C5
mAF5d29Am5thR5YOT/6uvFHodJ0jzXnWMT3FXng+f3q/uYciqTqsHU+us46GJ+BntMBs8OVx28rI
iH66z0CNEln8/lYKHTJyQU7Yyr2pELOgWmAV7Pp+BFtn1cqYkOGwji/7wHE94JjcR7tbqwZwq8OW
2zcCWeq8M8Rlnxh5MOAViPitZyapdobRFACtQK49PZapxnW7XUvgrAaarXvHv5o7pcauQK3XwYqF
A1jDOP1RBSV7tAWC1MHSuqTy8SPQsJxxQSx1yaU+pjUtmgH+eJ7kOSJ7+WuND2QdNPBmBOni0LSS
i2xAzo6yga0OR5deMwwcYRE+XYArhUlD8hcSga7k7YqBGBgPfp34B5xnduYkdNguYUXfEEEIz9dm
Ess=
=g1AO
-----END PGP SIGNATURE-----

--------------oH0RlGTbsvofw0BB3mvWo040--
