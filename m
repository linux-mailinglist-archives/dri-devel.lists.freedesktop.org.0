Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0AA651B87
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 08:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7571A10E093;
	Tue, 20 Dec 2022 07:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2ED10E093
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 07:24:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 128103F04D;
 Tue, 20 Dec 2022 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671521059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vouKuAne33vSxyiuVXzIoQ/UTOIqwqomVVmTvGNAA8=;
 b=cDIYxtLQDUwEaxsuFf8stlABNea5Lu8U6UqLOSMAUewh1XxHTFe94whJIA6RrIv4ugVopY
 pXiijKn64oPoEBrEQwc6UIipyPSEwQPix/hLFP2HVk5d0Ehb5UjqEZMsYHn1aBCldhR3Rv
 HmhHtsR9cbfbe/wh2uiN0OkQ8oT8zZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671521059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vouKuAne33vSxyiuVXzIoQ/UTOIqwqomVVmTvGNAA8=;
 b=xzX3uJ93Tgediioqhtl/exF2Ycpl/06m7tjSk+X/UfRzge7aheUGnb0LQVCYK2hAJuI4+S
 7dKTbgglUhJi9LCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E13D01390E;
 Tue, 20 Dec 2022 07:24:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qrcVNiJjoWNBagAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 07:24:18 +0000
Message-ID: <769f62a9-da8a-188f-fd83-494ce0a7c566@suse.de>
Date: Tue, 20 Dec 2022 08:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/drv: Make use of local variable driver in
 drm_dev_register()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N5pPmcDuBw7fkfI0DNMq3QGW"
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N5pPmcDuBw7fkfI0DNMq3QGW
Content-Type: multipart/mixed; boundary="------------msVpNecvleR3gkOTvfOCMC88";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, kernel@pengutronix.de
Message-ID: <769f62a9-da8a-188f-fd83-494ce0a7c566@suse.de>
Subject: Re: [PATCH] drm/drv: Make use of local variable driver in
 drm_dev_register()
References: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>

--------------msVpNecvleR3gkOTvfOCMC88
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMTIuMjIgdW0gMTk6MzEgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoN
Cj4gVGhlcmUgaXMgYSBsb2NhbCB2YXJpYWJsZSB0aGF0IGNvbnRhaW5zIGRldi0+ZHJpdmVy
LiBNYWtlIHVzZSBvZiBpdA0KPiBpbnN0ZWFkIG9mICJvcGVuIGNvZGluZyIgaXQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPg0KDQpBZGRlZCB0byBkcm0tbWlzYy1uZXh0LiBUaGFua3MgYSBsb3Qu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9kcnYuYyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4gaW5kZXggMjAzYmY4
ZDZjMzRjLi4zY2M4ZTgxMTFkMTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0KPiBAQCAtODg5
LDggKzg4OSw4IEBAIGludCBkcm1fZGV2X3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+ICAgDQo+ICAgCWRldi0+cmVnaXN0ZXJlZCA9
IHRydWU7DQo+ICAgDQo+IC0JaWYgKGRldi0+ZHJpdmVyLT5sb2FkKSB7DQo+IC0JCXJldCA9
IGRldi0+ZHJpdmVyLT5sb2FkKGRldiwgZmxhZ3MpOw0KPiArCWlmIChkcml2ZXItPmxvYWQp
IHsNCj4gKwkJcmV0ID0gZHJpdmVyLT5sb2FkKGRldiwgZmxhZ3MpOw0KPiAgIAkJaWYgKHJl
dCkNCj4gICAJCQlnb3RvIGVycl9taW5vcnM7DQo+ICAgCX0NCj4gDQo+IGJhc2UtY29tbWl0
OiA2NzhlNWIyMjU4ZTg3MWIyMmZlOGMyNmVkYWMyNzIzZmViODUyYTQ3DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------msVpNecvleR3gkOTvfOCMC88--

--------------N5pPmcDuBw7fkfI0DNMq3QGW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOhYyIFAwAAAAAACgkQlh/E3EQov+Dk
Rg/+Ix0/qchbkUkItnTyJsu1QOzjFL9urHoNJY//6xPJ5crNlDOeJ8Rz8Q67pWCvKuuaYfLFGhsx
ZVr1mxgTRjid6H9oGCMRglavzOkzo1Sq0SWy8HeAX8obz7JEHpT+wIck7s2R2L5LlRi/Om33QxkJ
oW/16jr8Xloa1ohvSIDyFN8FR3SLBn9XkYiUljgFQhts7JTpRaFwspRI3xUicvtUBkKyAwv9l72W
JC+IahwEIlNc7c80l7cdRktEwqZhcwPrS2GEZx2sX1VarINjjgDQlilfTW9XLubDyZM+auwJEFAz
2YbS9XRlLByc8zunpT/D+bcQ9CilAIhdkt+fs1EXYR6jldSIaAfWAKVY/WrEM+O9CwU9sTnc8eX0
cy5d4aH+ClJ+z+GIT5ZeUReOsMuYVMQSbE2vPGp/y2FcV0mcEHZk4c7ZXJiKF248aqb6dmSD7Vnr
NaHnunTsJu8uMiL32dPPtpreKeYQC5+xnqVQ70haP+PRihpfl03fcZaBsjOlfokT5dYy2SqywWlf
66MdVIibGDg0t3S20IrI2hhJULoyRwKBgFNOK6gadbh7KrCECJLJbna0lhf2jJ91fodqNLG69g5P
ILhjxK8pvSCN97TKo1yEd4SyoC48tkvYruQ1b/rUTVdiav3KF/oy6xy5rue8G83+N29xJ0tnfrBD
TeY=
=ZbLQ
-----END PGP SIGNATURE-----

--------------N5pPmcDuBw7fkfI0DNMq3QGW--
