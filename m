Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCFC682622
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 09:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C5010E10A;
	Tue, 31 Jan 2023 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A25910E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:08:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B18B1223CC;
 Tue, 31 Jan 2023 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675152484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7HK8UYDwB33pMv7HD3wcFevOB00q8oelqRN6wKCPK8=;
 b=n6ItYPVt6G/uELsMG3kB7xZbcatYB/4uwOIaaTJOOjsYb1hb2IONjEeMsVxLLc9ZT7sWW6
 qPOibuwAMeVgEwQSsQZfaCfI3SpgTpSwyQ7LQeXGRZ23lhdfMSvtQKMCrJuHNCNwrLzrw3
 HBg7SRa8IMtmQnyvZ8aJBJlIKzWCifE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675152484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7HK8UYDwB33pMv7HD3wcFevOB00q8oelqRN6wKCPK8=;
 b=idIUJ2fIIIloiTIP1scA0aHGth77tchlK/n4PqC3G7gX0WAPsYwWYYsC8qm9m5U8bhLfoD
 8+hTcpZ5761PUpDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92984138E8;
 Tue, 31 Jan 2023 08:08:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gpbXImTM2GOmDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 Jan 2023 08:08:04 +0000
Message-ID: <2f47e3f5-bb41-b270-ff49-00055a3aa76c@suse.de>
Date: Tue, 31 Jan 2023 09:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] drm/vmwgfx: Rename dummy to is_iomem
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-7-zack@kde.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230131033542.953249-7-zack@kde.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QiHN0trbFF0SPC7J6IX16esY"
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QiHN0trbFF0SPC7J6IX16esY
Content-Type: multipart/mixed; boundary="------------v3TOjfa7fgfndRQsdEsteX6W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Message-ID: <2f47e3f5-bb41-b270-ff49-00055a3aa76c@suse.de>
Subject: Re: [PATCH v2 6/8] drm/vmwgfx: Rename dummy to is_iomem
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-7-zack@kde.org>
In-Reply-To: <20230131033542.953249-7-zack@kde.org>

--------------v3TOjfa7fgfndRQsdEsteX6W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIzIHVtIDA0OjM1IHNjaHJpZWIgWmFjayBSdXNpbjoNCj4gRnJvbTog
WmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gDQo+IFJlbmFtZSBkdW1teSB0byBp
c19pb21lbSBiZWNhdXNlIHRoYXQncyB3aGF0IGl0IGlzIGV2ZW4gaWYgd2UncmUgbm90DQo+
IGFjdGl2ZWxseSB1c2luZyBpdC4gTWFrZXMgdGhlIGNvZGUgZWFzaWVyIHRvIHJlYWQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KDQpS
ZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgfCAxNiAr
KysrKysrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5j
DQo+IGluZGV4IDEwODIyMThhMWNmYy4uZTgzMjg2ZTA4ODM3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPiBAQCAtMTUzLDkgKzE1Myw5IEBAIHN0YXRp
YyB2b2lkIHZtd19jdXJzb3JfdXBkYXRlX21vYihzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9w
cml2LA0KPiAgIAlTVkdBR0JDdXJzb3JIZWFkZXIgKmhlYWRlcjsNCj4gICAJU1ZHQUdCQWxw
aGFDdXJzb3JIZWFkZXIgKmFscGhhX2hlYWRlcjsNCj4gICAJY29uc3QgdTMyIGltYWdlX3Np
emUgPSB3aWR0aCAqIGhlaWdodCAqIHNpemVvZigqaW1hZ2UpOw0KPiAtCWJvb2wgZHVtbXk7
DQo+ICsJYm9vbCBpc19pb21lbTsNCj4gICANCj4gLQloZWFkZXIgPSB0dG1fa21hcF9vYmpf
dmlydHVhbCgmdnBzLT5jdXJzb3IubWFwLCAmZHVtbXkpOw0KPiArCWhlYWRlciA9IHR0bV9r
bWFwX29ial92aXJ0dWFsKCZ2cHMtPmN1cnNvci5tYXAsICZpc19pb21lbSk7DQo+ICAgCWFs
cGhhX2hlYWRlciA9ICZoZWFkZXItPmhlYWRlci5hbHBoYUhlYWRlcjsNCj4gICANCj4gICAJ
bWVtc2V0KGhlYWRlciwgMCwgc2l6ZW9mKCpoZWFkZXIpKTsNCj4gQEAgLTE4NSwxMyArMTg1
LDEzIEBAIHN0YXRpYyB1MzIgdm13X2R1X2N1cnNvcl9tb2Jfc2l6ZSh1MzIgdywgdTMyIGgp
DQo+ICAgICovDQo+ICAgc3RhdGljIHUzMiAqdm13X2R1X2N1cnNvcl9wbGFuZV9hY3F1aXJl
X2ltYWdlKHN0cnVjdCB2bXdfcGxhbmVfc3RhdGUgKnZwcykNCj4gICB7DQo+IC0JYm9vbCBk
dW1teTsNCj4gKwlib29sIGlzX2lvbWVtOw0KPiAgIAlpZiAodnBzLT5zdXJmKSB7DQo+ICAg
CQlpZiAodnBzLT5zdXJmX21hcHBlZCkNCj4gICAJCQlyZXR1cm4gdm13X2JvX21hcF9hbmRf
Y2FjaGUodnBzLT5zdXJmLT5yZXMuYmFja3VwKTsNCj4gICAJCXJldHVybiB2cHMtPnN1cmYt
PnNub29wZXIuaW1hZ2U7DQo+ICAgCX0gZWxzZSBpZiAodnBzLT5ibykNCj4gLQkJcmV0dXJu
IHR0bV9rbWFwX29ial92aXJ0dWFsKCZ2cHMtPmJvLT5tYXAsICZkdW1teSk7DQo+ICsJCXJl
dHVybiB0dG1fa21hcF9vYmpfdmlydHVhbCgmdnBzLT5iby0+bWFwLCAmaXNfaW9tZW0pOw0K
PiAgIAlyZXR1cm4gTlVMTDsNCj4gICB9DQo+ICAgDQo+IEBAIC0zNjQsNyArMzY0LDcgQEAg
dm9pZCB2bXdfa21zX2N1cnNvcl9zbm9vcChzdHJ1Y3Qgdm13X3N1cmZhY2UgKnNyZiwNCj4g
ICAJU1ZHQTNkQ29weUJveCAqYm94Ow0KPiAgIAl1bnNpZ25lZCBib3hfY291bnQ7DQo+ICAg
CXZvaWQgKnZpcnR1YWw7DQo+IC0JYm9vbCBkdW1teTsNCj4gKwlib29sIGlzX2lvbWVtOw0K
PiAgIAlzdHJ1Y3Qgdm13X2RtYV9jbWQgew0KPiAgIAkJU1ZHQTNkQ21kSGVhZGVyIGhlYWRl
cjsNCj4gICAJCVNWR0EzZENtZFN1cmZhY2VETUEgZG1hOw0KPiBAQCAtNDI0LDcgKzQyNCw3
IEBAIHZvaWQgdm13X2ttc19jdXJzb3Jfc25vb3Aoc3RydWN0IHZtd19zdXJmYWNlICpzcmYs
DQo+ICAgCWlmICh1bmxpa2VseShyZXQgIT0gMCkpDQo+ICAgCQlnb3RvIGVycl91bnJlc2Vy
dmU7DQo+ICAgDQo+IC0JdmlydHVhbCA9IHR0bV9rbWFwX29ial92aXJ0dWFsKCZtYXAsICZk
dW1teSk7DQo+ICsJdmlydHVhbCA9IHR0bV9rbWFwX29ial92aXJ0dWFsKCZtYXAsICZpc19p
b21lbSk7DQo+ICAgDQo+ICAgCWlmIChib3gtPncgPT0gVk1XX0NVUlNPUl9TTk9PUF9XSURU
SCAmJiBjbWQtPmRtYS5ndWVzdC5waXRjaCA9PSBpbWFnZV9waXRjaCkgew0KPiAgIAkJbWVt
Y3B5KHNyZi0+c25vb3Blci5pbWFnZSwgdmlydHVhbCwNCj4gQEAgLTY1OCwxNCArNjU4LDE0
IEBAIHZtd19kdV9jdXJzb3JfcGxhbmVfY2xlYW51cF9mYihzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSwNCj4gICB7DQo+ICAgCXN0cnVjdCB2bXdfY3Vyc29yX3BsYW5lICp2Y3AgPSB2bXdf
cGxhbmVfdG9fdmNwKHBsYW5lKTsNCj4gICAJc3RydWN0IHZtd19wbGFuZV9zdGF0ZSAqdnBz
ID0gdm13X3BsYW5lX3N0YXRlX3RvX3ZwcyhvbGRfc3RhdGUpOw0KPiAtCWJvb2wgZHVtbXk7
DQo+ICsJYm9vbCBpc19pb21lbTsNCj4gICANCj4gICAJaWYgKHZwcy0+c3VyZl9tYXBwZWQp
IHsNCj4gICAJCXZtd19ib191bm1hcCh2cHMtPnN1cmYtPnJlcy5iYWNrdXApOw0KPiAgIAkJ
dnBzLT5zdXJmX21hcHBlZCA9IGZhbHNlOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKHZwcy0+
Ym8gJiYgdHRtX2ttYXBfb2JqX3ZpcnR1YWwoJnZwcy0+Ym8tPm1hcCwgJmR1bW15KSkgew0K
PiArCWlmICh2cHMtPmJvICYmIHR0bV9rbWFwX29ial92aXJ0dWFsKCZ2cHMtPmJvLT5tYXAs
ICZpc19pb21lbSkpIHsNCj4gICAJCWNvbnN0IGludCByZXQgPSB0dG1fYm9fcmVzZXJ2ZSgm
dnBzLT5iby0+YmFzZSwgdHJ1ZSwgZmFsc2UsIE5VTEwpOw0KPiAgIA0KPiAgIAkJaWYgKGxp
a2VseShyZXQgPT0gMCkpIHsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------v3TOjfa7fgfndRQsdEsteX6W--

--------------QiHN0trbFF0SPC7J6IX16esY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPYzGMFAwAAAAAACgkQlh/E3EQov+Dn
zw//XIicbAF9nK9QzxnOjqSW2ftpeok4WXemmdmvb3pgj9Sr3BDj+OeF0J2AB6Cyv6V1E5HzOi3C
NhCUaiNu81VvfqM+i3qCwxU3uySs4Pyslj3TC1aE9IgTMG3wFKaUhRNxdTwyLMvlm78PSCfHIIwJ
YchDtKvzbi+NH+Z9dNBbqX0j+loxo7vdtQkZYwz53sb7Gvxz61dbN2nHOiSUBfUz3sk4spVlDaTJ
ZS1VHDWGqR368uf/8nkB0WW92cU8sbPj5Glb1/nAZgqXtPFFjqYAIk9YxVehANqwxYEh1/+lkoc8
rU4z/CmE291lhm1pl7gCWAlz1mgRo9bdnoDZ8VfuIW02w4CQU8BDbjmd4B1CFrlBTtUzmSrOxUW4
1xNGpDRUJqerjQHDFP7j8lISzNpoQDO31VKjCu/uG1DEGqAA7m3iN4IkQE+VMrCmM7plpuykDsv8
UCVbkxoUiPkAbhYHM2PX+cAtK3Gikp8+U4k9f2IOTo6CydGfgh8ADenc2SUYQGuBZ9vBauBnQjdR
k2gbq9QemzzfHVtrvC4LHQGYj7i+Wm3JNoR3kaovWQgLla4pIhNDMWFajwRxAfG6wz0IDj2HWgSH
syyfZ+LZwRfuQVIeCQ/UqpWR/wp6o3JmhQvpw2kBb57J/yPr5bgKj9h4HJKN0Ve8KCekOiliZFZ0
sdI=
=G5zx
-----END PGP SIGNATURE-----

--------------QiHN0trbFF0SPC7J6IX16esY--
