Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47E6BEDBE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 17:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B76B10E352;
	Fri, 17 Mar 2023 16:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15D10E352
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 16:08:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 483F01FE19;
 Fri, 17 Mar 2023 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679069328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYNsUN+tDKNYRq6jEv+zrZItlqQtF2yjhYpPo2GNi4o=;
 b=ubRSoTXUqtezdbiq7N+vfvktK5llvGnVBUYftMQeQWl/T582uHrHfvI50/8u1YBEn1VEMK
 dTv8OCBgGLNcR2C3rtEu8GaKKBv/PKUy2Aldt82PUszZ+ew4IO2Bi+YZG4iV993pn/WcRb
 yp/KsWlM9v+Rqvc6A/Mtmi84YLwIISw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679069328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYNsUN+tDKNYRq6jEv+zrZItlqQtF2yjhYpPo2GNi4o=;
 b=XT6IHMC3/uOkMHYPr9+un5ryHqBuzHd7UD4RgPI7brYiNVmQQouGnkEEWqSDPyiewQS5ar
 daAGW52hkBk6VJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25B6513428;
 Fri, 17 Mar 2023 16:08:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LWFgCJCQFGSGLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Mar 2023 16:08:48 +0000
Message-ID: <4d1ca506-0145-9c39-fc82-fcab110b1168@suse.de>
Date: Fri, 17 Mar 2023 17:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
 <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
 <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
 <20230317151128.hwaaq4na7d7mifaw@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230317151128.hwaaq4na7d7mifaw@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VmS1vE6J8M20xAAfwcnX5FJl"
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
Cc: kraxel@redhat.com, linux-graphics-maintainer@vmware.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VmS1vE6J8M20xAAfwcnX5FJl
Content-Type: multipart/mixed; boundary="------------V7dNf8RaLTsxlfCf0t6WV1sm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com
Message-ID: <4d1ca506-0145-9c39-fc82-fcab110b1168@suse.de>
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
 <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
 <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
 <20230317151128.hwaaq4na7d7mifaw@houat>
In-Reply-To: <20230317151128.hwaaq4na7d7mifaw@houat>

--------------V7dNf8RaLTsxlfCf0t6WV1sm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDMuMjMgdW0gMTY6MTEgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBGcmksIE1hciAxNywgMjAyMyBhdCAwMTo1MTo0MlBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTcuMDMuMjMgdW0gMTM6Mzkgc2Nocmll
YiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+Pj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyaXRlczoNCj4+Pg0KPj4+PiBDb25zb2xpZGF0ZSBhbGwg
aGFuZGxpbmcgb2YgQ09ORklHX0RSTV9GQkRFVl9MRUFLX1BIWVNfU01FTSBieQ0KPj4+PiBt
YWtpbmcgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgb3B0aW9uYWwgaW4gZHJtX2ZiX2hlbHBlci5j
Lg0KPj4+Pg0KPj4+PiBXaXRob3V0IHRoZSBjb25maWcgb3B0aW9uLCBtb2R1bGVzIGNhbiBz
ZXQgc21lbV9zdGFydCBpbiBzdHJ1Y3QNCj4+Pj4gZmJfaW5mbyBmb3IgaW50ZXJuYWwgdXNh
Z2UsIGJ1dCBub3QgZXhwb3J0IGlmIHRvIHVzZXJzcGFjZS4gVGhlDQo+Pj4+IGFkZHJlc3Mg
Y2FuIG9ubHkgYmUgZXhwb3J0ZWQgYnkgZW5hYmxpbmcgdGhlIG9wdGlvbiBhbmQgc2V0dGlu
Zw0KPj4+PiB0aGUgbW9kdWxlIHBhcmFtZXRlci4gQWxzbyB1cGRhdGUgdGhlIGNvbW1lbnQu
DQo+Pj4+DQo+Pj4NCj4+PiBJIHdhcyBnb2luZyB0byBhc2sgYXQgd2hhdCBwb2ludCB3ZSBj
b3VsZCBqdXN0IGdldCByaWQgb2YgdGhpcyBLY29uZmlnDQo+Pj4gc3ltYm9sIHNpbmNlIGl0
IGFscmVhZHkgZGVwZW5kcyBvbiBFWFBFUlQgYW55d2F5cyBzbyBtb3N0IGRpc3Ryb3Mgd2ls
bA0KPj4+IG5vdCBlbmFibGUgaXQuDQo+Pj4NCj4+PiBCdXQgSSBsb29rZWQgdGhlbiBhbmQg
bm90aWNlZCB0aGF0IGl0IHdhcyBhZGRlZCBqdXN0IGEgZmV3IHllYXJzIGFnbyBpbg0KPj4+
IGNvbW1pdCA0YmU5YmQxMGUyMmQgIihkcm0vZmJfaGVscGVyOiBBbGxvdyBsZWFraW5nIGZi
ZGV2IHNtZW1fc3RhcnQiKSwNCj4+PiBzbyBpdCBzZWVtcyB0aGF0IHBlb3BsZSBzdGlsbCBu
ZWVkIHRoYXQgOigNCj4+DQo+PiBJIGRvbid0IGV2ZW4ga25vdyB3aGljaCB1c2Vyc3BhY2Ug
ZHJpdmVycyBuZWVkIHRoaXMgc3ltYm9sLiBQcm9iYWJseQ0KPj4gc29tZXRoaW5nIG9uIEFu
ZHJvaWQuDQo+IA0KPiBBdCBsZWFzdCB0aGUgTWFsaSAodXRnYXJkKSB1c2VyLXNwYWNlIHN0
YWNrIHVzZXMgaXQsIGluY2x1ZGluZyBvbg0KPiAicmVndWxhciIgZGlzdHJpYnV0aW9ucy4N
Cg0KRG9lcyB0aGlzIHVzZSB0aGUgbGltYSBrZXJuZWwgZHJpdmVyPw0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBJIGRvbid0IGtub3cgYWJvdXQgbmV3ZXN0IE1hbGkgZ2Vu
ZXJhdGlvbnMuDQo+IA0KPiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------V7dNf8RaLTsxlfCf0t6WV1sm--

--------------VmS1vE6J8M20xAAfwcnX5FJl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQUkI8FAwAAAAAACgkQlh/E3EQov+AJ
SA//YG2Es0QPuBHldju0LOu8x98/e0oD5Q/1z7hJ9w/dhCf2JeeqFNr84ZfNdRQ5UarFgrZHQsCO
IWF6GbGHTaoZ0GEMMVQggRe/8ot8MnwTzyxuB6dCCR/OMt65vtcdj1/IHWdzchxyZd5201vsYgJj
KL1BDCBtfpjR3Q0plryJwbg2pZIzzr/xO9fyRUwIZtT85a+tyO6dol3phIAxDkROImWzhOmAI2VF
M4O2wIl79NAUnXPcBhgUHW/vUPZhSg9GZKBa5e9eQIfTYElNg82cdFQv7HNPvnLJpE6dE5LlAHcB
CTOHtC4tQVjEbumxzar/HZbOrZ74ZhAA/LWrYQtElREwcxa3Fxx9sASQF/M6ifjR5DXjzMZMOrJU
CpdE0+Pl1oxV2biHWnw7Xuqh78oQmrajjLAbcgrv4bkslL8MkZ58u4z4GgtW40d2bgCPUThZZiZu
iqQqSu3e1dloHccHOgQx3RMK/BbTKpiw2HhWZyp69UJAo5utA5ONidhcNlz7x7wqI2RKAXnK1GyJ
djkIp5oKqpae9fN/u0YzeLRExSI+L3HFdw+ivLcv6M1TDfnCByrSLHlKZ10QLPVZa7oXPi6iyew1
VZuioqGZJExAGzxd4lVpOT+x7SLE1oHP5Erdyn5N/FRl/wj+qxzRm7pj6myUMVNr2+NS+6Una/ct
ZGU=
=/456
-----END PGP SIGNATURE-----

--------------VmS1vE6J8M20xAAfwcnX5FJl--
