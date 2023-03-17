Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC76BE9A6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B707A10E380;
	Fri, 17 Mar 2023 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915A10E380
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:51:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B63A1FDDC;
 Fri, 17 Mar 2023 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679057503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxOgOAtkOjRojN9VQCdDHm+qyzmQlYdrkqO1k3nvvCU=;
 b=P9doTuo7QIUwokqACopghYpKk0ed1pvyriN0vJTqP1D2wSEpy2eWN5EHhQ0S4KwVewrcvk
 yccqNtaC6RNPWyhbeK2kZbqIjugWXpJcM1njvfdHLppl7EcHPBK7wZ8WKP7QeAhLjPSBtp
 fWaa5tDaGDrtI9CRofcU6nmk2QDZCfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679057503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxOgOAtkOjRojN9VQCdDHm+qyzmQlYdrkqO1k3nvvCU=;
 b=8bmwAGKQM8d6SdZUyTZrTF838RyvRaXn/V2x5JH4durvUgfzkSaXpTDv5EfGBUJyIwLEf4
 wvih/OUmnxBbNYCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 549D913428;
 Fri, 17 Mar 2023 12:51:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JY+iE19iFGSmQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Mar 2023 12:51:43 +0000
Message-ID: <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
Date: Fri, 17 Mar 2023 13:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
 <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------12riBY83DEyni7XMskrHg07W"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------12riBY83DEyni7XMskrHg07W
Content-Type: multipart/mixed; boundary="------------E10KSuwGlD8mLw17VcgCq7bY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Message-ID: <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
 <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>

--------------E10KSuwGlD8mLw17VcgCq7bY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDMuMjMgdW0gMTM6Mzkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gQ29uc29saWRhdGUgYWxsIGhhbmRsaW5nIG9mIENPTkZJR19EUk1fRkJE
RVZfTEVBS19QSFlTX1NNRU0gYnkNCj4+IG1ha2luZyB0aGUgbW9kdWxlIHBhcmFtZXRlciBv
cHRpb25hbCBpbiBkcm1fZmJfaGVscGVyLmMuDQo+Pg0KPj4gV2l0aG91dCB0aGUgY29uZmln
IG9wdGlvbiwgbW9kdWxlcyBjYW4gc2V0IHNtZW1fc3RhcnQgaW4gc3RydWN0DQo+PiBmYl9p
bmZvIGZvciBpbnRlcm5hbCB1c2FnZSwgYnV0IG5vdCBleHBvcnQgaWYgdG8gdXNlcnNwYWNl
LiBUaGUNCj4+IGFkZHJlc3MgY2FuIG9ubHkgYmUgZXhwb3J0ZWQgYnkgZW5hYmxpbmcgdGhl
IG9wdGlvbiBhbmQgc2V0dGluZw0KPj4gdGhlIG1vZHVsZSBwYXJhbWV0ZXIuIEFsc28gdXBk
YXRlIHRoZSBjb21tZW50Lg0KPj4NCj4gDQo+IEkgd2FzIGdvaW5nIHRvIGFzayBhdCB3aGF0
IHBvaW50IHdlIGNvdWxkIGp1c3QgZ2V0IHJpZCBvZiB0aGlzIEtjb25maWcNCj4gc3ltYm9s
IHNpbmNlIGl0IGFscmVhZHkgZGVwZW5kcyBvbiBFWFBFUlQgYW55d2F5cyBzbyBtb3N0IGRp
c3Ryb3Mgd2lsbA0KPiBub3QgZW5hYmxlIGl0Lg0KPiANCj4gQnV0IEkgbG9va2VkIHRoZW4g
YW5kIG5vdGljZWQgdGhhdCBpdCB3YXMgYWRkZWQganVzdCBhIGZldyB5ZWFycyBhZ28gaW4N
Cj4gY29tbWl0IDRiZTliZDEwZTIyZCAiKGRybS9mYl9oZWxwZXI6IEFsbG93IGxlYWtpbmcg
ZmJkZXYgc21lbV9zdGFydCIpLA0KPiBzbyBpdCBzZWVtcyB0aGF0IHBlb3BsZSBzdGlsbCBu
ZWVkIHRoYXQgOigNCg0KSSBkb24ndCBldmVuIGtub3cgd2hpY2ggdXNlcnNwYWNlIGRyaXZl
cnMgbmVlZCB0aGlzIHN5bWJvbC4gUHJvYmFibHkgDQpzb21ldGhpbmcgb24gQW5kcm9pZC4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+IA0KPiBUaGUg
cGF0Y2ggbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------E10KSuwGlD8mLw17VcgCq7bY--

--------------12riBY83DEyni7XMskrHg07W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQUYl4FAwAAAAAACgkQlh/E3EQov+D/
+hAAsDAW0YG7YQCbLdtgrulYKS/Wzb69hmjH/f2g7p0rnQazUoiIiUk7TjqPR/hffmdTdCHj6rG0
3IYkmvb+Qiiwn/7OTbA5pa1YaHDUBeYzELD3VWO3wjzGY1TiLBaGY9KJex5V3IUtn2rUkUAxNgrG
4BzmOP6rwcO/maR7jXM0Vi/pdMPJX3l5FKMciHv1YG01N+taPkpgBYoW8zdgU4XhdZGCQE3zm43M
qJobZ3HKodhjkZCeWtsHG+XUk4IyOYo46zcqjAjamd4Pga7Y6Au9iFym/PlNx11fSQJYAeD9R+Cm
3+8j5xDpBRvcozyiAwIhzScKdOPIMH8bAz4vpsCDAaZYUTxGqZI4JDKD60IsWNB9ELVJELlrK0j7
MhskzNuXw0zt5382VcShExqnHH8eofxlPMEcMbmEtWmMliVLVdGWYJZKR9NzOL+Z43v3ZhCRAwYD
8O+woN0wtMlSYHn9Kz9zIu1l0bi4Lk79j5xog0h7i+9SyJS1WPZlTULz+r3AAPh31hA9IhJuFsSH
wWpm0QH6aEtE9XUQfI+kO4LSW+4/PGArcqkSW+WgY4nvJnPnOtiJbCyn8dBw+2zeqVmxhWrEYSaU
xeG9r8iMNhvLV2wVQERG6e95EwSMPVZnHIp1/mu8c2+N4YBCfRN62IrUbUFrBonBkiRxzHGTDk4N
fC8=
=/IUa
-----END PGP SIGNATURE-----

--------------12riBY83DEyni7XMskrHg07W--
