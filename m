Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CD5AFE33
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF77610E3ED;
	Wed,  7 Sep 2022 07:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE0F10E455
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:56:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7162C20113;
 Wed,  7 Sep 2022 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662537410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZWG+y75ush28Ds2NfEJI2PC4RGC7XuRO3Jo2D6Cimc=;
 b=r6fF6N9By+Md3VgwktESdrAinH8lYeUXKtRTDVefxsm96Nk6wDeurr4frXLIboVc503S9M
 qTncqMTj30vjXrAud+nEtX3FzdUFc2oaxl5j/TknNuizaTajlSQ/988cpRtUXJTOQVXWc1
 QSyh9ulLJ6Kn7I0GYa9VYcmr275byTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662537410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZWG+y75ush28Ds2NfEJI2PC4RGC7XuRO3Jo2D6Cimc=;
 b=JqmobuU5Nj2q5JkkkuBo+OcLzG2QRZP0A4n7/yE1u5nW9EJXBKv3dATULosvVXT0FFV4pW
 tlVFdemRoY2L1GAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 523D613A66;
 Wed,  7 Sep 2022 07:56:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jEclE8JOGGP4BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:56:50 +0000
Message-ID: <e1ae11b1-ff82-1e5a-ccba-c37a0d62b46e@suse.de>
Date: Wed, 7 Sep 2022 09:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/aperture: Fix some kerneldoc comments
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20220905162241.391226-1-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220905162241.391226-1-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u7PF3wINqO8YX1b7fPFeb0K7"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u7PF3wINqO8YX1b7fPFeb0K7
Content-Type: multipart/mixed; boundary="------------E7bxDrY6ZGxMXnDBxpCTcQQu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <e1ae11b1-ff82-1e5a-ccba-c37a0d62b46e@suse.de>
Subject: Re: [PATCH] drm/aperture: Fix some kerneldoc comments
References: <20220905162241.391226-1-thierry.reding@gmail.com>
In-Reply-To: <20220905162241.391226-1-thierry.reding@gmail.com>

--------------E7bxDrY6ZGxMXnDBxpCTcQQu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjIgdW0gMTg6MjIgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFJld29y
ZCBzb21lIGtlcm5lbGRvYyBjb21tZW50cyBmb3IgdGhlIERSTSBhcGVydHVyZSBoYW5kbGlu
ZyBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdA
bnZpZGlhLmNvbT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KDQpUaGFua3MhDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9hcGVydHVyZS5jIHwgMTAgKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9hcGVydHVyZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hcGVydHVy
ZS5jDQo+IGluZGV4IGZkYjdkNWMxN2JhMS4uM2I4ZmRlZWFmZDUzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2FwZXJ0dXJlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9hcGVydHVyZS5jDQo+IEBAIC03NCw3ICs3NCw3IEBADQo+ICAgICogZ2l2ZW4g
ZnJhbWVidWZmZXIgbWVtb3J5LiBPd25lcnNoaXAgb2YgdGhlIGZyYW1lYnVmZmVyIG1lbW9y
eSBpcyBhY2hpZXZlZA0KPiAgICAqIGJ5IGNhbGxpbmcgZGV2bV9hcGVydHVyZV9hY3F1aXJl
X2Zyb21fZmlybXdhcmUoKS4gT24gc3VjY2VzcywgdGhlIGRyaXZlcg0KPiAgICAqIGlzIHRo
ZSBvd25lciBvZiB0aGUgZnJhbWVidWZmZXIgcmFuZ2UuIFRoZSBmdW5jdGlvbiBmYWlscyBp
ZiB0aGUNCj4gLSAqIGZyYW1lYnVmZmVyIGlzIGFscmVhZHkgYnkgYW5vdGhlciBkcml2ZXIu
IFNlZSBiZWxvdyBmb3IgYW4gZXhhbXBsZS4NCj4gKyAqIGZyYW1lYnVmZmVyIGlzIGFscmVh
ZHkgb3duZWQgYnkgYW5vdGhlciBkcml2ZXIuIFNlZSBiZWxvdyBmb3IgYW4gZXhhbXBsZS4N
Cj4gICAgKg0KPiAgICAqIC4uIGNvZGUtYmxvY2s6OiBjDQo+ICAgICoNCj4gQEAgLTExMiw3
ICsxMTIsNyBAQA0KPiAgICAqDQo+ICAgICogVGhlIGdlbmVyaWMgZHJpdmVyIGlzIG5vdyBz
dWJqZWN0IHRvIGZvcmNlZCByZW1vdmFsIGJ5IG90aGVyIGRyaXZlcnMuIFRoaXMNCj4gICAg
KiBvbmx5IHdvcmtzIGZvciBwbGF0Zm9ybSBkcml2ZXJzIHRoYXQgc3VwcG9ydCBob3QgdW5w
bHVnLg0KPiAtICogV2hlbiBhIGRyaXZlciBjYWxscyBkcm1fYXBlcnR1cmVfcmVtb3ZlX2Nv
bmZsaWN0aW5nX2ZyYW1lYnVmZmVycygpIGV0IGFsDQo+ICsgKiBXaGVuIGEgZHJpdmVyIGNh
bGxzIGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKCkgZXQg
YWwuDQo+ICAgICogZm9yIHRoZSByZWdpc3RlcmVkIGZyYW1lYnVmZmVyIHJhbmdlLCB0aGUg
YXBlcnR1cmUgaGVscGVycyBjYWxsDQo+ICAgICogcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0
ZXIoKSBhbmQgdGhlIGdlbmVyaWMgZHJpdmVyIHVubG9hZHMgaXRzZWxmLiBJdA0KPiAgICAq
IG1heSBub3QgYWNjZXNzIHRoZSBkZXZpY2UncyByZWdpc3RlcnMsIGZyYW1lYnVmZmVyIG1l
bW9yeSwgUk9NLCBldGMNCj4gQEAgLTE2NCw3ICsxNjQsNyBAQCBFWFBPUlRfU1lNQk9MKGRl
dm1fYXBlcnR1cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKTsNCj4gICAgKiBAcHJpbWFyeTog
YWxzbyBraWNrIHZnYTE2ZmIgaWYgcHJlc2VudA0KPiAgICAqIEByZXFfZHJpdmVyOiByZXF1
ZXN0aW5nIERSTSBkcml2ZXINCj4gICAgKg0KPiAtICogVGhpcyBmdW5jdGlvbiByZW1vdmVz
IGdyYXBoaWNzIGRldmljZSBkcml2ZXJzIHdoaWNoIHVzZSBtZW1vcnkgcmFuZ2UgZGVzY3Jp
YmVkIGJ5DQo+ICsgKiBUaGlzIGZ1bmN0aW9uIHJlbW92ZXMgZ3JhcGhpY3MgZGV2aWNlIGRy
aXZlcnMgd2hpY2ggdXNlIHRoZSBtZW1vcnkgcmFuZ2UgZGVzY3JpYmVkIGJ5DQo+ICAgICog
QGJhc2UgYW5kIEBzaXplLg0KPiAgICAqDQo+ICAgICogUmV0dXJuczoNCj4gQEAgLTE4Miw4
ICsxODIsOCBAQCBFWFBPUlRfU1lNQk9MKGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rp
bmdfZnJhbWVidWZmZXJzKTsNCj4gICAgKiBAcGRldjogUENJIGRldmljZQ0KPiAgICAqIEBy
ZXFfZHJpdmVyOiByZXF1ZXN0aW5nIERSTSBkcml2ZXINCj4gICAgKg0KPiAtICogVGhpcyBm
dW5jdGlvbiByZW1vdmVzIGdyYXBoaWNzIGRldmljZSBkcml2ZXJzIHVzaW5nIG1lbW9yeSBy
YW5nZSBjb25maWd1cmVkDQo+IC0gKiBmb3IgYW55IG9mIEBwZGV2J3MgbWVtb3J5IGJhcnMu
IFRoZSBmdW5jdGlvbiBhc3N1bWVzIHRoYXQgUENJIGRldmljZSB3aXRoDQo+ICsgKiBUaGlz
IGZ1bmN0aW9uIHJlbW92ZXMgZ3JhcGhpY3MgZGV2aWNlIGRyaXZlcnMgdXNpbmcgdGhlIG1l
bW9yeSByYW5nZSBjb25maWd1cmVkDQo+ICsgKiBmb3IgYW55IG9mIEBwZGV2J3MgbWVtb3J5
IGJhcnMuIFRoZSBmdW5jdGlvbiBhc3N1bWVzIHRoYXQgYSBQQ0kgZGV2aWNlIHdpdGgNCj4g
ICAgKiBzaGFkb3dlZCBST00gZHJpdmVzIGEgcHJpbWFyeSBkaXNwbGF5IGFuZCBzbyBraWNr
cyBvdXQgdmdhMTZmYi4NCj4gICAgKg0KPiAgICAqIFJldHVybnM6DQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------E7bxDrY6ZGxMXnDBxpCTcQQu--

--------------u7PF3wINqO8YX1b7fPFeb0K7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYTsEFAwAAAAAACgkQlh/E3EQov+AK
RA/6A7CD44THloFfAxPJJ5hfboc5LBAmrHgLhrKm3Aog6+Rlq4yzZbIEZp+B2RJaex+ANFelsYqF
RY4wSuL+bJ1bhAwy8k1ddJUAsSsPZY1rfOBTImvjEq/5XxbKgsxNjOB+nqFLR8lkMpd4xzjYC9ya
Q54a1aWbQh+67hKUpJYQF7e91dt43iNbiLLaMRYnkKTwoK6YKz9zNbMusWmDVKXxdQJIpFf1+p7W
D/ay8OSInudQ5BGGE+PcS5JuCxfvYmIeXZZm0h19TQcdfaAGXHCaEsK7egsBCxi5skNX6bvhkp5E
V3tp4ACyAeOR04L0nP45cRaEUPbE5HupwMoFxE/Xpr8YEdh1G6+YQQH5xiglkLR3vsE4eO+bXB34
X8Mz25QCrMXu1DsBXPZpLdOK7XvSRv7s2y/Ej3zUbyFSC8xeR2e+BjVjLYEfO7tXVjKNn3rnon5C
ZXODTYR6RkD8At5Ywwy7mRcXCGrqa76em6HueKk4YR59xw6Xu5TMgNkvA7xGzisiwZCpN7ApxQsd
YtgtrNda10qElHM0Cb7HtLea+MFrEvKD8jH7Yq7cShZdqveq84YOdyLJhlfanz1jj3yT23GuSPx9
t966SpaV22gmtn5U86yeGKV/MGE7BR55qEbXTaUx/8CsreldReugbjsURAD+mupqDrpBK2hZKjhk
rXU=
=Jeru
-----END PGP SIGNATURE-----

--------------u7PF3wINqO8YX1b7fPFeb0K7--
