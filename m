Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D348A65C18F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A3310E3DC;
	Tue,  3 Jan 2023 14:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CC810E3DD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 14:12:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B43093ED78;
 Tue,  3 Jan 2023 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672755135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NTtlbsZWcPqqPxH+zZClrmWJp+bPg5uMnvxOLjGdxk=;
 b=YfInDv2uSfERLsB+TnIKyt7n2X+y4baS1+Eyov1U7+dHXZmy1k9BiWkRADFixM88WEcsIp
 dR78jgLCw1kuD7Q3Oaln4FmSUO9DAYXNXOkE1iltkBOhaGjZXNF7BoHWEyYr3Aw/B8bZk9
 D04GBgdmU1VVcVMHT35IxjBbD8nAy9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672755135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NTtlbsZWcPqqPxH+zZClrmWJp+bPg5uMnvxOLjGdxk=;
 b=lFBL0TkJDMXZK7mf08mo5ZHLTxeeXkpA3znSF7I8iwfN3MPKjRlX+wRaN0mIYK+YL7MK9C
 6OVsHAEK3zBVuvDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 881E21392B;
 Tue,  3 Jan 2023 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SdPbH783tGOcPwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jan 2023 14:12:15 +0000
Message-ID: <b39ac3a6-0866-01f5-dbea-2b86fbef9acc@suse.de>
Date: Tue, 3 Jan 2023 15:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/gem: Check for valid formats
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230103135916.897118-1-mcanal@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230103135916.897118-1-mcanal@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Xy9LDtlijSpOWpmKja027T5"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Xy9LDtlijSpOWpmKja027T5
Content-Type: multipart/mixed; boundary="------------prOsSKShpbaRZ08eRoqcE8bq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <b39ac3a6-0866-01f5-dbea-2b86fbef9acc@suse.de>
Subject: Re: [PATCH v2] drm/gem: Check for valid formats
References: <20230103135916.897118-1-mcanal@igalia.com>
In-Reply-To: <20230103135916.897118-1-mcanal@igalia.com>

--------------prOsSKShpbaRZ08eRoqcE8bq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDAzLjAxLjIzIHVtIDE0OjU5IHNjaHJpZWIgTWHDrXJhIENhbmFsOg0KPiBDdXJy
ZW50bHksIGRybV9nZW1fZmJfY3JlYXRlKCkgZG9lc24ndCBjaGVjayBpZiB0aGUgcGl4ZWwg
Zm9ybWF0IGlzDQo+IHN1cHBvcnRlZCwgd2hpY2ggY2FuIGxlYWQgdG8gdGhlIGFjY2VwdGFu
Y2Ugb2YgaW52YWxpZCBwaXhlbCBmb3JtYXRzDQo+IGUuZy4gdGhlIGFjY2VwdGFuY2Ugb2Yg
aW52YWxpZCBtb2RpZmllcnMuIFRoZXJlZm9yZSwgYWRkIGEgY2hlY2sgZm9yDQo+IHZhbGlk
IGZvcm1hdHMgb24gZHJtX2dlbV9mYl9jcmVhdGUoKS4NCj4gDQo+IE1vcmVvdmVyLCBub3Rl
IHRoYXQgdGhpcyBjaGVjayBpcyBvbmx5IHZhbGlkIGZvciBhdG9taWMgZHJpdmVycywNCj4g
YmVjYXVzZSwgZm9yIG5vbi1hdG9taWMgZHJpdmVycywgY2hlY2tpbmcgZHJtX2FueV9wbGFu
ZV9oYXNfZm9ybWF0KCkgaXMNCj4gbm90IHBvc3NpYmxlIHNpbmNlIHRoZSBmb3JtYXQgbGlz
dCBmb3IgdGhlIHByaW1hcnkgcGxhbmUgaXMgZmFrZSwgYW5kDQo+IHdlJ2QgdGhlcmVmb3Ig
cmVqZWN0IHZhbGlkIGZvcm1hdHMuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYcOtcmEg
Q2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+IA0KPiB2MSAtPiB2Mjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjMwMTAzMTI1MzIyLjg1NTA4
OS0xLW1jYW5hbEBpZ2FsaWEuY29tL1QvDQo+IC0gQ2hlY2sgdGhlIG1vZGlmaWVyIGZvciBl
YWNoIHBpeGVsIHBsYW5lIGluIG11bHRpLXBsYW5lIGZvcm1hdHMgKFRob21hcyBaaW1tZXJt
YW5uKS4NCj4gLSBVc2UgZHJtX2RiZ19rbXMoKSBpbnN0ZWFkIG9mIGRybV9kYmcoKSAoVGhv
bWFzIFppbW1lcm1hbm4pLg0KPiANCj4gLS0tDQo+ICAgRG9jdW1lbnRhdGlvbi9ncHUvdG9k
by5yc3QgICAgICAgICAgICAgICAgICAgfCAgNyArKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMgfCAxMyArKysrKysrKysrKysrDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1l
bnRhdGlvbi9ncHUvdG9kby5yc3QNCj4gaW5kZXggMWY4YTVlYmUxODhlLi42OGJkYWZhMDI4
NGYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0DQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0DQo+IEBAIC0yNzYsMTEgKzI3Niw4IEBAIFZh
cmlvdXMgaG9sZC11cHM6DQo+ICAgLSBOZWVkIHRvIHN3aXRjaCB0byBkcm1fZmJkZXZfZ2Vu
ZXJpY19zZXR1cCgpLCBvdGhlcndpc2UgYSBsb3Qgb2YgdGhlIGN1c3RvbSBmYg0KPiAgICAg
c2V0dXAgY29kZSBjYW4ndCBiZSBkZWxldGVkLg0KPiANCj4gLS0gTWFueSBkcml2ZXJzIHdy
YXAgZHJtX2dlbV9mYl9jcmVhdGUoKSBvbmx5IHRvIGNoZWNrIGZvciB2YWxpZCBmb3JtYXRz
LiBGb3INCj4gLSAgYXRvbWljIGRyaXZlcnMgd2UgY291bGQgY2hlY2sgZm9yIHZhbGlkIGZv
cm1hdHMgYnkgY2FsbGluZw0KPiAtICBkcm1fcGxhbmVfY2hlY2tfcGl4ZWxfZm9ybWF0KCkg
YWdhaW5zdCBhbGwgcGxhbmVzLCBhbmQgcGFzcyBpZiBhbnkgcGxhbmUNCj4gLSAgc3VwcG9y
dHMgdGhlIGZvcm1hdC4gRm9yIG5vbi1hdG9taWMgdGhhdCdzIG5vdCBwb3NzaWJsZSBzaW5j
ZSBsaWtlIHRoZSBmb3JtYXQNCj4gLSAgbGlzdCBmb3IgdGhlIHByaW1hcnkgcGxhbmUgaXMg
ZmFrZSBhbmQgd2UnZCB0aGVyZWZvciByZWplY3QgdmFsaWQgZm9ybWF0cy4NCj4gKy0gTmVl
ZCB0byBzd2l0Y2ggdG8gZHJtX2dlbV9mYl9jcmVhdGUoKSwgYXMgbm93IGRybV9nZW1fZmJf
Y3JlYXRlKCkgY2hlY2tzIGZvcg0KPiArICB2YWxpZCBmb3JtYXRzIGZvciBhdG9taWMgZHJp
dmVycy4NCj4gDQo+ICAgLSBNYW55IGRyaXZlcnMgc3ViY2xhc3MgZHJtX2ZyYW1lYnVmZmVy
LCB3ZSdkIG5lZWQgYSBlbWJlZGRpbmcgY29tcGF0aWJsZQ0KPiAgICAgdmVyc2lvbiBvZiB0
aGUgdmFyaW9zIGRybV9nZW1fZmJfY3JlYXRlIGZ1bmN0aW9ucy4gTWF5YmUgY2FsbGVkDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxw
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jDQo+
IGluZGV4IGU5MzUzM2I4NjAzNy4uOTJkNzQ4Zjg1NTNmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYw0KPiBAQCAtOSw2ICs5
LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+IA0KPiAgICNpbmNsdWRl
IDxkcm0vZHJtX2RhbWFnZV9oZWxwZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5o
Pg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2ZyYW1lYnVmZmVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+DQo+IEBA
IC0xNjQsNiArMTY1LDE4IEBAIGludCBkcm1fZ2VtX2ZiX2luaXRfd2l0aF9mdW5jcyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAJCXJldHVybiAtRUlOVkFMOw0KPiAJfQ0KPiANCj4g
KwlpZiAoZHJtX2Rydl91c2VzX2F0b21pY19tb2Rlc2V0KGRldikpIHsNCj4gKwkJZm9yIChp
ID0gMDsgaSA8IGluZm8tPm51bV9wbGFuZXM7IGkrKykgew0KPiArCQkJaWYgKCFkcm1fYW55
X3BsYW5lX2hhc19mb3JtYXQoZGV2LCBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LA0KPiArCQkJ
CQkJICAgICAgbW9kZV9jbWQtPm1vZGlmaWVyW2ldKSkgew0KPiArCQkJCWRybV9kYmdfa21z
KGRldiwNCj4gKwkJCQkJICAgICJVbnN1cHBvcnRlZCBwaXhlbCBmb3JtYXQgJXA0Y2MgLyBt
b2RpZmllciAweCVsbHhcbiIsDQo+ICsJCQkJCSAgICAmbW9kZV9jbWQtPnBpeGVsX2Zvcm1h
dCwgbW9kZV9jbWQtPm1vZGlmaWVyW2ldKTsNCj4gKwkJCQlyZXR1cm4gLUVJTlZBTDsNCj4g
KwkJCX0NCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiAJZm9yIChpID0gMDsgaSA8IGluZm8tPm51
bV9wbGFuZXM7IGkrKykgew0KPiAJCXVuc2lnbmVkIGludCB3aWR0aCA9IG1vZGVfY21kLT53
aWR0aCAvIChpID8gaW5mby0+aHN1YiA6IDEpOw0KPiAJCXVuc2lnbmVkIGludCBoZWlnaHQg
PSBtb2RlX2NtZC0+aGVpZ2h0IC8gKGkgPyBpbmZvLT52c3ViIDogMSk7DQo+IC0tDQo+IDIu
MzguMQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------prOsSKShpbaRZ08eRoqcE8bq--

--------------0Xy9LDtlijSpOWpmKja027T5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO0N78FAwAAAAAACgkQlh/E3EQov+A6
SA/6AxGQvshKDPADQJrf0WVfhlnv6dv12HanmqlxQ2h3BlnrgR/yKHQ8Bqt+5sebjLxLN1mHTjvU
0LWtSZ58gB0iYwTxEQ1ugOIfExrhuLXhiey+bKO2/4BqVHL4kf3E484yBoskgyAAswlw2vo8yT/0
/EpY4pTgaX3y3oAB7XCzCPlxosTY428aKDaIFSmEUzf48HT3AoipnuL1oRlGbpyU3ZSKPmGeoTyC
zSYBJte07EywjX1vVODg+sPhyh0BKLjz/ycwUr7EpeqPx+jb0cJv1XyYPVV1Jf0xjIOZYTi0ZawO
fptamaHYVKBfzatTpIAS5IlllBt9leB7x2GyA3ZS6axaE98SUgYm9EoPjLDjBtvhPnxAmmlmqCSz
0J16xmkv0ryUzPGjZF8q+oZJSg8MsjmFdN5ZApPOILY0WPPhWALB3mRHAcl8UW2CJBszpa7QNP3l
Vq/n5Sm5GpUrkKtuGLVuLd21o4rdCXJmc1wYW+Mv2WWeWhtmRNJCT7xf+36uAcwE7iHgaWBgTAxU
DIGQWgTHYshh+WCJ+7L5uLdoG+fdAElOri2GFa8LwXdbuvdT0JBnrZlcECGk25dYeSLdq4oBHMUb
KEBPexK278qyxMsgLta9FEezWB6KLPYj/N15/3lSHXiI24zqnSNwgrFZsBtuNwU03MDHCoGrAc5e
9B0=
=otg1
-----END PGP SIGNATURE-----

--------------0Xy9LDtlijSpOWpmKja027T5--
