Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B950FC79
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C473D10F3A5;
	Tue, 26 Apr 2022 12:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867B010F3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:05:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32CD51F380;
 Tue, 26 Apr 2022 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650974718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAxgvEu9F877OplDwpBy3QTAWfomeepgxNBFbyw8ZRc=;
 b=xPdt0nQi9f8JTfTKba6yulGsulOhz0csCwKpwrK8phmFaCtEjZKy+vaOH2YqUYCqTmRMgz
 6uQbuctHBqNHcCOEQAyeAxnocFIXjQ17x3UrJR7yrqXD+NX8Yu4sE8Pt/t3oLox5atAcKM
 YNFdpNbOIeiVivWpytxzBcdbJPvRnQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650974718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAxgvEu9F877OplDwpBy3QTAWfomeepgxNBFbyw8ZRc=;
 b=YpdVukhdh3D1TX7d7LNjamM8zGaCKrG8MZ3r32uMAESpjFFs37ure3Mh7/hwjQ2X36wR2i
 0pmKpQ1mUEHeuUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 090AE13223;
 Tue, 26 Apr 2022 12:05:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 37A+Af7fZ2I8BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 12:05:18 +0000
Message-ID: <9acf4bb3-e765-c1dd-bc75-05e9c7a0430f@suse.de>
Date: Tue, 26 Apr 2022 14:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 0/5] fbdev: Decouple deferred I/O from struct page
Content-Language: en-US
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, Sam Ravnborg <sam@ravnborg.org>
References: <20220426120359.17437-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220426120359.17437-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0y5oa20v5Kz6SLHnjway1hlh"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0y5oa20v5Kz6SLHnjway1hlh
Content-Type: multipart/mixed; boundary="------------ZGEEZcn3JUVHW42iKjOQYMp0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <9acf4bb3-e765-c1dd-bc75-05e9c7a0430f@suse.de>
Subject: Re: [PATCH v3 0/5] fbdev: Decouple deferred I/O from struct page
References: <20220426120359.17437-1-tzimmermann@suse.de>
In-Reply-To: <20220426120359.17437-1-tzimmermann@suse.de>

--------------ZGEEZcn3JUVHW42iKjOQYMp0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjJ2luZyBTYW0pDQoNCkFtIDI2LjA0LjIyIHVtIDE0OjAzIHNjaHJpZWIgVGhvbWFzIFpp
bW1lcm1hbm46DQo+IFJld29yayB0aGUgZmJkZXYgZGVmZXJyZWQtSS9PIHRvIG5vdCBpbnRl
cmZlcmUgd2l0aCBmaWVsZHMgb2Ygc3RydWN0DQo+IHBhZ2UuIEFsbCByZWZlcmVuY2VzIGZy
b20gZGVmZXJyZWQtSS9PIGNvZGUgdG8gZmllbGRzIGluIHN0cnVjdCBwYWdlDQo+IGFyZSBn
b25lLiBUaGUgcnNwIHN0YXRlIGlzIGhlbHAgaW4gYSBzZXBhcmF0ZSBwYWdlcmVmIHN0cnVj
dHVyZS4NCj4gDQo+IHYzOg0KPiAJKiByZW5hbWUgcGFnZWxpc3QgdG8gcGFnZXJlZmxpc3Qg
KFNhbSkNCj4gCSogdXNlIHBhZ2VyZWYtPm9mZnNldCBvdmVyIHBhZ2UtPmluZGV4IChKYXZp
ZXIpDQo+IHYyOg0KPiAJKiBzcGxpdCBvZmYgZnJvbSBhIGxhcmdlciBwYXRjaHNldCBbMV0N
Cj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMjAzMDMy
MDU4MzkuMjg0ODQtMS10emltbWVybWFubkBzdXNlLmRlLw0KPiANCj4gVGhvbWFzIFppbW1l
cm1hbm4gKDUpOg0KPiAgICBmYmRldjogUHV0IG1tYXAgZm9yIGRlZmVycmVkIEkvTyBpbnRv
IGRyaXZlcnMNCj4gICAgZmJkZXY6IFRyYWNrIGRlZmVycmVkLUkvTyBwYWdlcyBpbiBwYWdl
cmVmIHN0cnVjdA0KPiAgICBmYmRldjogUmVmYWN0b3IgaW1wbGVtZW50YXRpb24gb2YgcGFn
ZV9ta3dyaXRlDQo+ICAgIGZiZGV2OiBSZW5hbWUgcGFnZWxpc3QgdG8gcGFnZXJlZmxpc3Qg
Zm9yIGRlZmVycmVkIEkvTw0KPiAgICBmYmRldjogVXNlIHBhZ2VyZWYgb2Zmc2V0IGZvciBk
ZWZlcnJlZC1JL08gd3JpdGViYWNrDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMgICAgICAgIHwgIDE1ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZmIuYyAgICAgfCAgMTAgKy0NCj4gICBkcml2ZXJzL2hpZC9oaWQtcGljb2xjZF9m
Yi5jICAgICAgICAgICB8ICAgMyArLQ0KPiAgIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRm
dC1jb3JlLmMgICAgIHwgIDIxICsrLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvYnJvYWRz
aGVldGZiLmMgICAgIHwgIDI3ICsrLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJfZGVmaW8uYyAgICB8IDIxMiArKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgICAgICAgfCAgMjEgKy0tDQo+ICAgZHJp
dmVycy92aWRlby9mYmRldi9oZWN1YmFmYi5jICAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jICAgICAgICB8ICAxMCArLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvbWV0cm9ub21lZmIuYyAgICAgIHwgIDIzICsrLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jIHwgIDI3ICsrLS0NCj4gICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYyAgICAgICAgICB8ICAxMyArLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMgICAgICAgIHwgICA0ICstDQo+ICAgZHJpdmVy
cy92aWRlby9mYmRldi91ZGxmYi5jICAgICAgICAgICAgfCAgMTggKy0tDQo+ICAgZHJpdmVy
cy92aWRlby9mYmRldi94ZW4tZmJmcm9udC5jICAgICAgfCAgMTAgKy0NCj4gICBpbmNsdWRl
L2RybS9kcm1fZmJfaGVscGVyLmggICAgICAgICAgICB8ICAgMyArLQ0KPiAgIGluY2x1ZGUv
bGludXgvZmIuaCAgICAgICAgICAgICAgICAgICAgIHwgIDE3ICstDQo+ICAgMTcgZmlsZXMg
Y2hhbmdlZCwgMjY0IGluc2VydGlvbnMoKyksIDE3NCBkZWxldGlvbnMoLSkNCj4gDQo+IA0K
PiBiYXNlLWNvbW1pdDogMGU3ZGVmZjY0NDZhNGJhMmM3NWY0OTlhMGJmYTgwY2Q2YTE1YzEy
OQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ZGEEZcn3JUVHW42iKjOQYMp0--

--------------0y5oa20v5Kz6SLHnjway1hlh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJn3/0FAwAAAAAACgkQlh/E3EQov+AN
ow/+MEz7Ydk0PIfsBqNYvKaFdAr/YCC+uoNJHoI+dykLDMowmAvt3yb2LTSqrQln58/NniL9ZGVf
QUqjyQIi8gStIESk+pZzWk+p4HhBkyPSoi/UZMiI4jGpTDOApQEeee9NKSACiHG7mnNVaPLQYpe/
4w+6SbK/Jv369xqpHrkfBiexynllaUMHUpduKhTYWrDexlCRq0YBu1UwMwj/a6UYhLjp835G5ci8
qie7ZHaMxz1JQpJ9CLkj4bXE3cvVrpjsVunWmkpsVYM+fwMKs3nUOAkj8eezmH+o4JsHIqWoreSg
6+rI8KSWWlU79aLYl3g+tDNRSNWS4gmLXlU/3XY/8t1zGVHNe3MwL7ihELB/pIMCrwsUKo3GFvhD
CLdCkcdouzuV6ELRjowAxrpYzIyrULynuHjlh6/50ioor8zGc4HYO7OJzwwnEWTb/L3J/6AvakjS
tjcJihjms6LEst4VNiXSF9Z3Q8qfpD4F9biw8oYzEmsxZepq3cy048h26Q5bL+RLYPEy4PnDUwvS
/bvrbNZpSxdSxYubSB4PIWNN7SH5Hdj+DrGHlXbtKDKdTyEbZJWqvdj6HywEu9ModO+w8StHcAWQ
ewUR5QJvz5m/wmru3+4awTjJMNkbLJLh9r7T2cSjAWCi6wlC8cqjyl0tbUCEHEKyVa3dTpSHbTs4
U+s=
=j1xf
-----END PGP SIGNATURE-----

--------------0y5oa20v5Kz6SLHnjway1hlh--
