Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A044E749C25
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5799710E3F2;
	Thu,  6 Jul 2023 12:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7942F10E3F1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:44:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 286591FE6D;
 Thu,  6 Jul 2023 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688647461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rez+t/cz9CKyN/38VFk9tu5ZqWuRS5ScM+thjGOJuig=;
 b=1ETDg5NqSjyf9i/Br3thlZUyvaF5U5WDvpwvuwT9eBqUe64nIPQybzJaEnuUoID5Z660Zg
 SDog7Jbnby2Jb6was8XIu/n2MuZu7O9CUu64NV/n4kkT4wHW3rFmiRqWg50dYXoE6K2UJp
 a1nVGYbF8UaF/v0cMFLnoU5bRkCNu9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688647461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rez+t/cz9CKyN/38VFk9tu5ZqWuRS5ScM+thjGOJuig=;
 b=Ipe4z56fppT6rauLuZ3QFZpXsQh+FyXsjt8ZNM/X1iXYNINlw6QYjl33GWsnKOpVtUaWGJ
 sCs2naQZ6jKM7gBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7A38138FC;
 Thu,  6 Jul 2023 12:44:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MPidNyS3pmQUQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:44:20 +0000
Message-ID: <5555bc4d-14bb-c59b-728f-4e91a24f9a73@suse.de>
Date: Thu, 6 Jul 2023 14:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
 <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
 <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
 <87a5war9b2.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87a5war9b2.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------92fr0P30faZJglhuhuUQZMxz"
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------92fr0P30faZJglhuhuUQZMxz
Content-Type: multipart/mixed; boundary="------------19Vd7cn9nFaJpJuQADTH0WVV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <5555bc4d-14bb-c59b-728f-4e91a24f9a73@suse.de>
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
 <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
 <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
 <87a5war9b2.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5war9b2.fsf@minerva.mail-host-address-is-not-set>

--------------19Vd7cn9nFaJpJuQADTH0WVV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDcuMjMgdW0gMTE6MzQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBbLi4uXQ0KPiAgICAgDQo+Pj4+ICsJaW5mby0+ZmxhZ3MgfD0gRkJJTkZP
X1ZJUlRGQjsNCj4+Pg0KPj4+IEkgc2VlIHRoYXQgYWxsIGZiZGV2IGRyaXZlcnMganVzdCBk
bzogaW5mby0+ZmxhZ3MgPSBGQklORk9fRkxBR19ERUZBVUxUIHwgRkJJTkZPX1ZJUlRGQg0K
Pj4+DQo+Pj4gR3Vlc3MgeW91IGFyZSBkb2luZyBpbiB0d28gYXNzaWdubWVudHMgdG8gYmUg
Y29uc2lzdGVudCB3aXRoIGRybV9mYmRldl9kbWEuYyA/DQo+Pj4gSSB3YXMganVzdCBjdXJp
b3VzIGFib3V0IHRoZSByYXRpb25hbGUgZm9yIHNldHRpbmcgdGhlIGZsYWdzIGluIHR3byBz
dGVwcy4NCj4+DQo+PiBUaGUgX0RFRkFVTFQgZmxhZyBpcyByZWFsbHkganVzdCBhIHplcm8u
IEFuZCB0aGUgb3RoZXIgZmxhZ3MgZGVzY3JpYmUNCj4+IGRpZmZlcmVudCBhc3BlY3RzIG9m
IHRoZSBmcmFtZWJ1ZmZlci4gIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gc2V0IHRoZQ0K
Pj4gZmxhZ3MgdG9nZXRoZXIgd2l0aCB0aGUgcmVzcGVjdGl2ZSBzdGF0ZS4gRm9yIGV4YW1w
bGUsIF9WSVJURkIgaXMgc2V0DQo+PiBuZXh0IHRvIC0+c2NyZWVuX2J1ZmZlciwgYmVjYXVz
ZSB0aGV5IGJlbG9uZyB0b2dldGhlci4NCj4+DQo+IA0KPiBZZXMsIHRoYXQgbWFrZXMgc2Vu
c2UuDQo+IA0KPj4gX1ZJUlRGQiBpcyBjdXJyZW50bHkgb25seSB1c2VkIGluIGRlZmlvIGNv
ZGUgYXQNCj4+DQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qv
c291cmNlL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jI0wyMzINCj4+DQo+
PiBJIHRoaW5rIHRoZSBmYmRldiBJL08gaGVscGVycyBzaG91bGQgYWxzbyB0ZXN0IHRoaXMg
ZmxhZyBhZnRlciBhbGwNCj4+IGRyaXZlcnMgaGF2ZSBiZWVuIGFubm90YXRlZCBjb3JyZWN0
bHkuIEZvciBleGFtcGxlLCBmYl9pb19yZWFkKCkgd291bGQNCj4+IFdBUk5fT05DRSBpZiB0
aGUgX1ZJUlRGQiBmbGFnIGhhcyBiZWVuIHNldDsgYW5kIGZiX3N5c19yZWFkKCkgd291bGQg
d2Fybg0KPj4gaWYgaXQgaGFzbid0IGJlZW4gc2V0LiAgRm9yIHRoZSByZWFkIGhlbHBlcnMs
IGl0IGFsc28gbWFrZXMgc2Vuc2UgdG8NCj4+IFdBUk5fT05DRSBpZiB0aGUgX1JFQURTX0ZB
U1QgZmxhZyBoYXMgbm90IGJlZW4gc2V0Lg0KPj4NCj4gDQo+IEFncmVlZC4gTWF5YmUgeW91
IGNvdWxkIGFkZCB0aG9zZSB3YXJuIChvciBhdCBsZWFzdCBpbmZvIG9yIGRlYnVnPykgZXZl
bg0KPiBpZiBub3QgYWxsIGRyaXZlcnMgaGF2ZSBiZWVuIGFubm90YXRlZCBjb3JyZWN0bHku
IFRoYXQgd2F5IHBlb3BsZSBjYW4gYmUNCj4gYXdhcmUgdGhhdCBpcyBtaXNzaW5nIGFuZCBm
aXggaWYgdGhlcmUgYXJlIHJlbWFpbmluZyBkcml2ZXJzLg0KDQpZZXMsIHdlIGNvdWxkIGRv
IHRoYXQuIEkgd2FudCB0byBnbyB0aHJvdWdoIGRyaXZlcnMgZmlyc3QgYW5kIGZpeCB0aGUg
DQpsb3ctaGFuZ2luZyBmcnVpdHMuIFNvbWUgb2YgdGhlIG9sZCBmYmRldiBkcml2ZXJzIHVz
ZSBlaXRoZXIgRE1BIG9yIEkvTyANCm1lbW9yeS4gVGhleSB3b3VsZCBvbmx5IGJlIGZpeC13
b3J0aHkgaWYgc29tZW9uZSBjb21wbGFpbnMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------19Vd7cn9nFaJpJuQADTH0WVV--

--------------92fr0P30faZJglhuhuUQZMxz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSmtyQFAwAAAAAACgkQlh/E3EQov+As
6A//UyRKRwH44s8E7eViZYmCVyjBk6RElYXS4ZYsslGdCi73Ko+cxder/WeUYXIPJhevscWAF3mP
MPpIIYcyYW6v6wt5H4M9d75LqX3CQjW5CObDfk0f+iKzzcTpTZNHMxzrpKiL/QUFTYrqlNXfvfus
iunQ4JnIiu47YgB4XcK/XqXIPLTHLabn/yjC5EjlZDBRfQBIhEa/QWJL1P2GYfs3/O9beMhRGACH
DyhRcLcPb2cARld01b1qxE3ytVZnbdUw+E7S2wpyDDRKBoMSmEfh0AeEmfo5MUrycjl0DQHXVpQg
9kqiJfNzk+tq2rG+XtW8jPyeMLQDBQAymcXiMaDHYB4WZ/zFdpMHVBiV0jgLKP8CdPB6zLmbBSqP
Dm97lImYPVYEIHpuoQD/hNf1KM0rJHpAR/+bYMrTF9ept4m7iLRhXYSZWtokDtZwnn3zvmZ+HQ0W
6DDmVsNzv9PV1UiOmeg7SFeZCefaMPV4D7666DVu8/zJA9FIwlXrS+1yX9FnWuU2viiYGwPki6/T
s9zzaiDEhcOOYVF0ASIUQ2zwf2vec4cxqDRxdONffGUeMHo9cC+a4kTSJ774enjF+pUvK/6MemKA
DAecF7Em0/q1C3usSlWaoXSiyYz0KISr39Me2sXRcqV3QeWVZ06bzsFxrGIMlAesuFS5vSaTF6+7
5L0=
=Bknk
-----END PGP SIGNATURE-----

--------------92fr0P30faZJglhuhuUQZMxz--
