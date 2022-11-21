Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07D632911
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 17:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5BF10E302;
	Mon, 21 Nov 2022 16:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C7110E300
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 16:11:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 951C31F85D;
 Mon, 21 Nov 2022 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669047090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y9a/jF7aqDEOYQTfDhB6Qk6PgJ/xFxc4/ADle9ke4kM=;
 b=R9aoGA7reAdOI/Uirxv783AO5MIr6fJ+yaEMQ6ixgSfQyPDbuI0odVumgcwp3fNgA0CVWk
 XVI5/ZSJS3IXmmxV8IgRCgsGU8s8PqIZwgmSWp1zQGFz1vNE7QCv0HOqNb/hs+OHYhnFmv
 rxBH0qBa79q+ubJlZ+SJ6JrNhLp/ibA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669047090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y9a/jF7aqDEOYQTfDhB6Qk6PgJ/xFxc4/ADle9ke4kM=;
 b=lTYUMP/Yo4wJ+NmyuLlrL2xtgZJauuHZck31FbvEWTbkbVofjV9782mTrEXLApbQFHWf4A
 C/PIvmIK7zRqSkBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 618BE1377F;
 Mon, 21 Nov 2022 16:11:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XrDzFTKje2PUWAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 16:11:30 +0000
Message-ID: <c98892e4-65da-a3c4-27d0-d7e285ded103@suse.de>
Date: Mon, 21 Nov 2022 17:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: Fix potential null-ptr-deref due to
 drmm_mode_config_init()
Content-Language: en-US
To: Shang XiaoJing <shangxiaojing@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
References: <20221118021651.2460-1-shangxiaojing@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221118021651.2460-1-shangxiaojing@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DpuJ22QVaKd0o0gUKwV5y5mJ"
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
--------------DpuJ22QVaKd0o0gUKwV5y5mJ
Content-Type: multipart/mixed; boundary="------------n8ziYbNtcmDto0aSSNZ79MCw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Shang XiaoJing <shangxiaojing@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
Message-ID: <c98892e4-65da-a3c4-27d0-d7e285ded103@suse.de>
Subject: Re: [PATCH] drm: Fix potential null-ptr-deref due to
 drmm_mode_config_init()
References: <20221118021651.2460-1-shangxiaojing@huawei.com>
In-Reply-To: <20221118021651.2460-1-shangxiaojing@huawei.com>

--------------n8ziYbNtcmDto0aSSNZ79MCw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm1lcmdlZCBpbnRvIGRybS1taXNjLW5leHQuIFRoYW5rcyBhIGxvdC4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KQW0gMTguMTEuMjIgdW0gMDM6MTYgc2NocmllYiBTaGFu
ZyBYaWFvSmluZzoNCj4gZHJtbV9tb2RlX2NvbmZpZ19pbml0KCkgd2lsbCBjYWxsIGRybV9t
b2RlX2NyZWF0ZV9zdGFuZGFyZF9wcm9wZXJ0aWVzKCkNCj4gYW5kIHdvbid0IGNoZWNrIHRo
ZSByZXQgdmFsdWUuIFdoZW4gZHJtX21vZGVfY3JlYXRlX3N0YW5kYXJkX3Byb3BlcnRpZXMo
KQ0KPiBmYWlsZWQgZHVlIHRvIGFsbG9jLCBwcm9wZXJ0eSB3aWxsIGJlIGEgTlVMTCBwb2lu
dGVyIGFuZCBtYXkgY2F1c2VzIHRoZQ0KPiBudWxsLXB0ci1kZXJlZi4gRml4IHRoZSBudWxs
LXB0ci1kZXJlZiBieSBhZGRpbmcgdGhlIHJldCB2YWx1ZSBjaGVjay4NCj4gDQo+IEZvdW5k
IG51bGwtcHRyLWRlcmVmIHdoaWxlIHRlc3RpbmcgaW5zZXJ0IG1vZHVsZSBib2NoczoNCj4g
Z2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNhbm9uaWNhbCBh
ZGRyZXNzDQo+ICAgICAgMHhkZmZmZmMwMDAwMDAwMDBjOiAwMDAwIFsjMV0gU01QIEtBU0FO
IFBUSQ0KPiBLQVNBTjogbnVsbC1wdHItZGVyZWYgaW4gcmFuZ2UgWzB4MDAwMDAwMDAwMDAw
MDA2MC0weDAwMDAwMDAwMDAwMDAwNjddDQo+IENQVTogMyBQSUQ6IDI0OSBDb21tOiBtb2Rw
cm9iZSBOb3QgdGFpbnRlZCA2LjEuMC1yYzErICMzNjQNCj4gSGFyZHdhcmUgbmFtZTogUUVN
VSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MNCj4gcmVsLTEuMTUu
MC0wLWcyZGQ0YjliM2Y4NDAtcHJlYnVpbHQucWVtdS5vcmcgMDQvMDEvMjAxNA0KPiBSSVA6
IDAwMTA6ZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkrMHg3My8weDNjMCBbZHJtXQ0KPiBD
YWxsIFRyYWNlOg0KPiAgIDxUQVNLPg0KPiAgIF9fZHJtX2Nvbm5lY3Rvcl9pbml0KzB4YjZj
LzB4MTEwMCBbZHJtXQ0KPiAgIGJvY2hzX3BjaV9wcm9iZS5jb2xkLjExKzB4NGNiLzB4N2Zl
IFtib2Noc10NCj4gICBwY2lfZGV2aWNlX3Byb2JlKzB4MTdkLzB4MzQwDQo+ICAgcmVhbGx5
X3Byb2JlKzB4MWRiLzB4NWQwDQo+ICAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4MWU3LzB4
MjUwDQo+ICAgZHJpdmVyX3Byb2JlX2RldmljZSsweDRhLzB4MTIwDQo+ICAgX19kcml2ZXJf
YXR0YWNoKzB4Y2QvMHgyYzANCj4gICBidXNfZm9yX2VhY2hfZGV2KzB4MTFhLzB4MWIwDQo+
ICAgYnVzX2FkZF9kcml2ZXIrMHgzZDcvMHg1MDANCj4gICBkcml2ZXJfcmVnaXN0ZXIrMHgx
OGUvMHgzMjANCj4gICBkb19vbmVfaW5pdGNhbGwrMHhjNC8weDNlMA0KPiAgIGRvX2luaXRf
bW9kdWxlKzB4MWI0LzB4NjMwDQo+ICAgbG9hZF9tb2R1bGUrMHg1ZGNhLzB4NzIzMA0KPiAg
IF9fZG9fc3lzX2Zpbml0X21vZHVsZSsweDEwMC8weDE3MA0KPiAgIGRvX3N5c2NhbGxfNjQr
MHgzZi8weDkwDQo+ICAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NjMvMHhj
ZA0KPiBSSVA6IDAwMzM6MHg3ZmY2NWFmOWY4MzkNCj4gDQo+IEZpeGVzOiA2YjQ5NTlmNDNh
MDQgKCJkcm0vYXRvbWljOiBhdG9taWMgcGxhbmUgcHJvcGVydGllcyIpDQo+IFNpZ25lZC1v
ZmYtYnk6IFNoYW5nIFhpYW9KaW5nIDxzaGFuZ3hpYW9qaW5nQGh1YXdlaS5jb20+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8IDggKysrKysrKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+IGluZGV4IDkzOWQ2MjFjOWFk
NC4uMTQxYTViNDA0MmIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVfY29uZmlnLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5j
DQo+IEBAIC00MDIsNiArNDAyLDggQEAgc3RhdGljIHZvaWQgZHJtX21vZGVfY29uZmlnX2lu
aXRfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpwdHIpDQo+ICAgICov
DQo+ICAgaW50IGRybW1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQ0KPiAgIHsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICAgCW11dGV4X2luaXQoJmRldi0+bW9k
ZV9jb25maWcubXV0ZXgpOw0KPiAgIAlkcm1fbW9kZXNldF9sb2NrX2luaXQoJmRldi0+bW9k
ZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7DQo+ICAgCW11dGV4X2luaXQoJmRldi0+bW9k
ZV9jb25maWcuaWRyX211dGV4KTsNCj4gQEAgLTQyMyw3ICs0MjUsMTEgQEAgaW50IGRybW1f
bW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAlpbml0X2xs
aXN0X2hlYWQoJmRldi0+bW9kZV9jb25maWcuY29ubmVjdG9yX2ZyZWVfbGlzdCk7DQo+ICAg
CUlOSVRfV09SSygmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0b3JfZnJlZV93b3JrLCBkcm1f
Y29ubmVjdG9yX2ZyZWVfd29ya19mbik7DQo+ICAgDQo+IC0JZHJtX21vZGVfY3JlYXRlX3N0
YW5kYXJkX3Byb3BlcnRpZXMoZGV2KTsNCj4gKwlyZXQgPSBkcm1fbW9kZV9jcmVhdGVfc3Rh
bmRhcmRfcHJvcGVydGllcyhkZXYpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJZHJtX21vZGVf
Y29uZmlnX2NsZWFudXAoZGV2KTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICAgDQo+
ICAgCS8qIEp1c3QgdG8gYmUgc3VyZSAqLw0KPiAgIAlkZXYtPm1vZGVfY29uZmlnLm51bV9m
YiA9IDA7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------n8ziYbNtcmDto0aSSNZ79MCw--

--------------DpuJ22QVaKd0o0gUKwV5y5mJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN7ozEFAwAAAAAACgkQlh/E3EQov+Bx
Hg//f01J4A1aXaIAblNxsB6zaWN9Wo8LfQCWcuKy3NqOD6RrzkfFF7Tz+3OmLaJCsueU8umfdaz2
ix3ukLZwPsTdg9d4Z5R5Yra9zA2tKntjxmUDpgQx2fafPvqz0B2kZ3BkgADdmKOi5ya8G+wrWxnz
FBXNs2oXgvgvk7Ja2nPeGlpUdvrWt7SGiZueI9ngI9oJBPYaVwUJaCHllT7nGfOwv7eqzx3+9NYg
OjUDFwEFKEN4ZxaUWToWGi//babJ2c+0rmhuZpBnHzrOD6AIAuGsuyScmhEXYInHzyomZbDQ7nYQ
PZBqFr15QKgB83JXpLP5E19wIKO8yvk0j8LP37m7vaF8IPIgZppywbutmGYx7x1B2KsOmM9QFgu5
YqHAtmX8oSJ0Mibn7KDM8fYfGTSF1JRD/DE5iX5eACzg5nHCwr6q1TuT4//aMF7wiPk/mytEMyTG
ONvl4FmC9fodNF6HePKqCDbbUSm+jGytmQ3j8UbXQUxWj2Okmv9R+rg6JojRiFGrHj/5IBnb7lq4
djy7i8AD6ILasBhMdF3muMZDQPFtGgBFo0wva9b2V+tW5faS0Sq2MIHVw8jdrRGj2Ebfc/s1VUu5
Z2Ple4kbdajbX5O5QV3tZhCQ0X1y8Xai4baXlpyKLQfw5Mnw7M+rbf4Hdj/JwGX5Jb4yDSIxHsuw
TFU=
=1CfA
-----END PGP SIGNATURE-----

--------------DpuJ22QVaKd0o0gUKwV5y5mJ--
