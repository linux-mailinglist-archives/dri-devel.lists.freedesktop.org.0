Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE08431404
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 12:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D716E9CB;
	Mon, 18 Oct 2021 10:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD34D6E9CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 10:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CB9A1FD6D;
 Mon, 18 Oct 2021 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634551361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4LE2XnoDd93shSdXnFcB5mdAxtyex8WZOGCV661COJQ=;
 b=qkaIxHgdf9rNQ6p7t2UyQgmjt4nOBjLTK+YjGf7iJOJ6K5XtdLTkyfv6pEzrco2nu3wtr7
 ZP9yUguZ4CPANy1LlDirZCzoQulMBkziPX5XJjn+2fmCV58zKeq0qxD3fzLovgoIIMTzQz
 xFSucLP+NrmhZvRfiOH545Ng5pamHgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634551361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4LE2XnoDd93shSdXnFcB5mdAxtyex8WZOGCV661COJQ=;
 b=gdxufcHDp6xAV6EKnuzBDuAxjGxCABVtEVUW4yE5hSsuY6PT9X6jMCxGPmKZw8XUhHQsVH
 dXlqAu2Xrdi+vEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34F1C13CC9;
 Mon, 18 Oct 2021 10:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tIO6C0FGbWH+YwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Oct 2021 10:02:41 +0000
Message-ID: <87f347bf-801f-7fba-bb52-009367cd30a0@suse.de>
Date: Mon, 18 Oct 2021 12:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/6] drm: vkms: Replace the deprecated drm_mode_config_init
Content-Language: en-US
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-2-igormtorrente@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211005201637.58563-2-igormtorrente@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BIiV4QcdVMhZMoK9nuGx1JYL"
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
--------------BIiV4QcdVMhZMoK9nuGx1JYL
Content-Type: multipart/mixed; boundary="------------AjdwBHD0ODWd46YzR8rEggoa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Message-ID: <87f347bf-801f-7fba-bb52-009367cd30a0@suse.de>
Subject: Re: [PATCH 1/6] drm: vkms: Replace the deprecated
 drm_mode_config_init
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-2-igormtorrente@gmail.com>
In-Reply-To: <20211005201637.58563-2-igormtorrente@gmail.com>

--------------AjdwBHD0ODWd46YzR8rEggoa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjEgdW0gMjI6MTYgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFk
ZSBUb3JyZW50ZToNCj4gVGhlIGBkcm1fbW9kZV9jb25maWdfaW5pdGAgd2FzIGRlcHJlY2F0
ZWQgc2luY2UgYzNiNzkwZSBjb21taXQsIGFuZCBpdCdzDQo+IGJlaW5nIHJlcGxhY2VkIGJ5
IHRoZSBgZHJtbV9tb2RlX2NvbmZpZ19pbml0YC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEln
b3IgTWF0aGV1cyBBbmRyYWRlIFRvcnJlbnRlIDxpZ29ybXRvcnJlbnRlQGdtYWlsLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyB8IDUgKysrKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMNCj4gaW5kZXggMGZmZTVmMGUzM2Y3Li44
Mjg4Njg5MjA0OTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNf
ZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYw0KPiBAQCAt
MTQwLDggKzE0MCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19o
ZWxwZXJfZnVuY3Mgdmttc19tb2RlX2NvbmZpZ19oZWxwZXJzID0gew0KPiAgIHN0YXRpYyBp
bnQgdmttc19tb2Rlc2V0X2luaXQoc3RydWN0IHZrbXNfZGV2aWNlICp2a21zZGV2KQ0KPiAg
IHsNCj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZ2a21zZGV2LT5kcm07DQo+ICsJ
aW50IHJldCA9IGRybW1fbW9kZV9jb25maWdfaW5pdChkZXYpOw0KPiArDQo+ICsJaWYgKHJl
dCA8IDApDQo+ICsJCXJldHVybiByZXQ7DQoNClRoZSBzdHlsZSBsb29rcyBhd2t3YXJkIElN
SE8uIFJhdGhlciB1c2UNCg0KICBpbnQgcmV0DQoNCiAgcmV0ID0gZHJtbV9tb2RlX2NvbmZp
Z19pbml0KCkNCiAgaWYgKHJldCkNCiAgICAgcmV0dXJuIHJldDsNCg0KPiAgIA0KPiAtCWRy
bV9tb2RlX2NvbmZpZ19pbml0KGRldik7DQo+ICAgCWRldi0+bW9kZV9jb25maWcuZnVuY3Mg
PSAmdmttc19tb2RlX2Z1bmNzOw0KPiAgIAlkZXYtPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9
IFhSRVNfTUlOOw0KPiAgIAlkZXYtPm1vZGVfY29uZmlnLm1pbl9oZWlnaHQgPSBZUkVTX01J
TjsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------AjdwBHD0ODWd46YzR8rEggoa--

--------------BIiV4QcdVMhZMoK9nuGx1JYL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFtRkAFAwAAAAAACgkQlh/E3EQov+Dh
HQ//YLBjCwEKcI6OxzPyUqGSxNmlKi8XR1TOPzGKT1rnTXzDdsBjdBWeaKc2qeJk5cnzWnr4HzY3
Y/zOT/Vl3vV4MHc7x1rMtj11CaKEK6oXd42pwHAzDHRAcaHtvkK8Lyr+we7sHiFCpOrcNSxU1CYV
R+q2VfL53QfLs24WdhQX3fZGoDcUiwYBVIFde4C9MdCb8PmTi/Bw1jGBmA+NUkSlfreQ4LG9y2GL
7rZsCGiyUmDoBLzaX4ysLpiReNkRub/s4sdiZ6Lk8owpWq/KjIy/ii8D9vhVKvD32yj3WM1V7cOu
harXm+FpSsTBFZuKwGxkW7cE1p9aPDgvU8bTPN8mgVLq++Bq29S7IE4aoWH4tG77CA5s/22HN6Xp
Ivpr3+GupbRGxHPpxXVdKgKpZTIqcDl+cq8GuxlQtt3oyxTHO2I2Ab0Ig4kHqQrN0UEIEZ7VtBP3
La+BMnfYKhFKt8BzrPajGeFEjlRWnclEXQ55sAYDLkxo46+czOwSwgO7+TD416sif3HAv9gtWVnT
+y3igEPG2wCY7LMDQD4Vh20SJtLGBcDNpEhB57b3udCwjiLu6b4NxHIASX69rw7IRBncnEwNrCSc
6wN7ZrqrsUU0ri21azrCT7BcsAlotOQIjMa/EPH120IXl6iuFAmZ1v+wp8QhvYDVK+k5eZcVOkIw
26w=
=ft9+
-----END PGP SIGNATURE-----

--------------BIiV4QcdVMhZMoK9nuGx1JYL--
