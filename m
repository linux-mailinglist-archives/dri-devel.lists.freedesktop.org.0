Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC76A3DB0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816A810E37F;
	Mon, 27 Feb 2023 09:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DA910E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:01:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46B981F8D9;
 Mon, 27 Feb 2023 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677488511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqQ43OG15avgCT0fmGnm5bD0I8p/oLDbgvSGYXF/h1o=;
 b=hlVYqgE90CjKvF6iD9xK7aQW29XOnA3ZzvzuKi+6W/2iUG2a14+F6u2s+8oDfOy7EDNDSC
 LKu+TZmSsRN9mdCoz/lUMeNogDas7FTr+7ZNfHE1JC9SfGSUHbgiwzbr4HvVQeBebRlXc1
 94QdU9/VShAC0vwVD6izokgJXUo5N1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677488511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqQ43OG15avgCT0fmGnm5bD0I8p/oLDbgvSGYXF/h1o=;
 b=aPLeaAWRrWXDsJG2UAsh2HBmBbOmAwZDmz7+4Cq/zI76iGHq6E+QFVSXJziqs+6SFuT7EZ
 kyZn/xylelTdgCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0890013912;
 Mon, 27 Feb 2023 09:01:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y78EAX9x/GMnSQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Feb 2023 09:01:51 +0000
Message-ID: <21c1675f-4184-e6f9-c9da-06722d6d7a12@suse.de>
Date: Mon, 27 Feb 2023 10:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm: omapdrm: Do not use helper unininitialized in
 omap_fbdev_init()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, tomba@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
References: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------q10EuzWHVcDjYqavMproQccF"
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
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------q10EuzWHVcDjYqavMproQccF
Content-Type: multipart/mixed; boundary="------------HjzVTbLD5v5nBTUmqFGrZB7r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nathan Chancellor <nathan@kernel.org>, tomba@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Cc: ndesaulniers@google.com, trix@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 kernel test robot <lkp@intel.com>
Message-ID: <21c1675f-4184-e6f9-c9da-06722d6d7a12@suse.de>
Subject: Re: [PATCH] drm: omapdrm: Do not use helper unininitialized in
 omap_fbdev_init()
References: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>
In-Reply-To: <20230224-omapdrm-wsometimes-uninitialized-v1-1-3fec8906ee3a@kernel.org>

--------------HjzVTbLD5v5nBTUmqFGrZB7r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDIuMjMgdW0gMTg6MjUgc2NocmllYiBOYXRoYW4gQ2hhbmNlbGxvcjoN
Cj4gQ2xhbmcgd2FybnMgKG9yIGVycm9ycyB3aXRoIENPTkZJR19XRVJST1IpOg0KPiANCj4g
ICAgLi4vZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5jOjIzNTo2OiBlcnJv
cjogdmFyaWFibGUgJ2hlbHBlcicgaXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyICdp
ZicgY29uZGl0aW9uIGlzIHRydWUgWy1XZXJyb3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXpl
ZF0NCj4gICAgICAgICAgICBpZiAoIWZiZGV2KQ0KPiAgICAgICAgICAgICAgICBefn5+fn4N
Cj4gICAgLi4vZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5jOjI1OToyNjog
bm90ZTogdW5pbml0aWFsaXplZCB1c2Ugb2NjdXJzIGhlcmUNCj4gICAgICAgICAgICBkcm1f
ZmJfaGVscGVyX3VucHJlcGFyZShoZWxwZXIpOw0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fg0KPiAgICAuLi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2ZiZGV2LmM6MjM1OjI6IG5vdGU6IHJlbW92ZSB0aGUgJ2lmJyBpZiBpdHMgY29uZGl0
aW9uIGlzIGFsd2F5cyBmYWxzZQ0KPiAgICAgICAgICAgIGlmICghZmJkZXYpDQo+ICAgICAg
ICAgICAgXn5+fn5+fn5+fn4NCj4gICAgLi4vZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9mYmRldi5jOjIyODozMDogbm90ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2hlbHBl
cicgdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcNCj4gICAgICAgICAgICBzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqaGVscGVyOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IE5V
TEwNCj4gICAgMSBlcnJvciBnZW5lcmF0ZWQuDQo+IA0KPiBSZXR1cm4gZWFybHksIGFzIHRo
ZXJlIGlzIG5vdGhpbmcgZm9yIHRoZSBmdW5jdGlvbiB0byBkbyBpZiBtZW1vcnkNCj4gY2Fu
bm90IGJlIGFsbG9jYXRlZC4gVGhlcmUgaXMgbm8gcG9pbnQgaW4gYWRkaW5nIGFub3RoZXIg
bGFiZWwgdG8ganVzdA0KPiBlbWl0IHRoZSB3YXJuaW5nIGF0IHRoZSBlbmQgb2YgdGhlIGZ1
bmN0aW9uIGluIHRoaXMgY2FzZSwgYXMgbWVtb3J5DQo+IGFsbG9jYXRpb24gZmFpbHVyZXMg
YXJlIGFscmVhZHkgbG9nZ2VkLg0KPiANCj4gRml4ZXM6IDNmYjFmNjJmODBhMSAoImRybS9m
Yi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgpIGZyb20gZHJtX2Zi
X2hlbHBlcl9maW5pKCkiKQ0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWls
dExpbnV4L2xpbnV4L2lzc3Vlcy8xODA5DQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29lLWtidWlsZC1hbGwvMjAyMzAyMjUwMDU4LmZZVGU5YVRQLWxrcEBpbnRlbC5jb20v
DQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0K
DQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQoNCj4gLS0tDQo+IFRoaXMgaXMgY3VycmVudGx5IHNob3dpbmcgaW4gbWFpbmxpbmUgc28g
SSBiZWxpZXZlIHRoaXMgc2hvdWxkIGdvIHRvDQo+IGRybS1taXNjLW5leHQtZml4ZXMuDQoN
ClRoaXMgdHJlZSBpcyBvbmx5IGFjdGl2ZSBmcm9tIC1yYzYgdG8gc29tZXRpbWUgZHVyaW5n
IHRoZSBtZXJnZSB3aW5kb3cuIA0KSSdsbCBhZGQgeW91ciBwYXRjaCB0byBkcm0tbWlzYy1m
aXhlcyBBU0FQLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2ZiZGV2LmMNCj4gaW5kZXggODQ0Mjk3MjgzNDdmLi5hNmM4NTQy
MDg3ZWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJk
ZXYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmMNCj4g
QEAgLTIzMyw3ICsyMzMsNyBAQCB2b2lkIG9tYXBfZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KQ0KPiAgIA0KPiAgIAlmYmRldiA9IGt6YWxsb2Moc2l6ZW9mKCpmYmRldiks
IEdGUF9LRVJORUwpOw0KPiAgIAlpZiAoIWZiZGV2KQ0KPiAtCQlnb3RvIGZhaWw7DQo+ICsJ
CXJldHVybjsNCj4gICANCj4gICAJSU5JVF9XT1JLKCZmYmRldi0+d29yaywgcGFuX3dvcmtl
cik7DQo+ICAgDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGUwMzRiOGExOGQ0YmFkY2Vl
Y2I2NzJjNThiNDg4YmFkMWU5MDFkOTUNCj4gY2hhbmdlLWlkOiAyMDIzMDIyNC1vbWFwZHJt
LXdzb21ldGltZXMtdW5pbml0aWFsaXplZC0wMTI1Zjc2OTJmYmINCj4gDQo+IEJlc3QgcmVn
YXJkcywNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------HjzVTbLD5v5nBTUmqFGrZB7r--

--------------q10EuzWHVcDjYqavMproQccF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP8cX4FAwAAAAAACgkQlh/E3EQov+CP
Lg/+O3KPvS14LZLKqprtUdbcMhI4wXFn4aIjXQtV9PWFCMknkXgtUR9ETCS3zdSCrAXJiMcKzJ8b
qT46fwogMcM59Uopkl5d7GCicmVaOZXXX2nuN4ykumbTZyn6A8JhZSokpEG3fOFqAhl4qxChMheW
xkwxjozljgOvkcOnrrRzuZ7FddSU1V2NkQPwsn5Pn9Izjy9xIrobS3XMbFysTSE4wXFmAXn3NiXq
ggk3RU/8Ah3Z1pRnadkcW2weOysz24iu+eQ0cxTZWqT1b/MU0ckToiLLyM7LWq4wlI0rqADLOuN1
yNLEEu7O/Bskr7OtLwbG1gm0zPcokeNq8WcoFNiroANSGoTsHxcuDecsd82+WoyP+bXYqqUJojDz
jbgeVXQcaqOex5s+/ykbeRgHvlMFwZHHcSB6U2XoPYH9CHj96SngARpJtDhx4kuRHUHDi9laM9Qu
UY2L/RC4cvNkbRiQw6Dk6xOPAk2vlXGeaCxt7nfD9q5NHJmpBDNgQPq3iR4xOsFXSlC6XzVy6vr5
j9wmSKYpsr/ChdJ+AGw2z8RXS0IyAx74EgsjaNK4YPp2q3QYtwmqK7w2tqjqaLB0B6l4lWQ4qcvD
saMy6AMzI0i0CQ/gWEoZ9TT91p7lwoD07uZIVD6DcFj58axck7lVzfMP+TMerwKIYyOXh81vFK4e
t0I=
=QygN
-----END PGP SIGNATURE-----

--------------q10EuzWHVcDjYqavMproQccF--
