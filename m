Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482867544A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8A910EA42;
	Fri, 20 Jan 2023 12:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3F10EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:21:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 760D722C7A;
 Fri, 20 Jan 2023 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674217259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OvL9ywMxAfZY90WvhpWEc+igRD/sKrO2TJeGp7bbaz0=;
 b=rBuU6yd2O6nBO2/+hG0/Mxw9V88lWTsKAqMYxhUQeIPamFuIdZ8l6QDeP3bZRdPTm5v4pV
 o8w/5CkGgWSKFWB2QLCE7v2rJdZI6vYO2d463z2NKdobA2suVd/LPlrSdkgDWL+bmiI49B
 GplwJvmMvhzG0SZlyzJ/CCAMhyuFh/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674217259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OvL9ywMxAfZY90WvhpWEc+igRD/sKrO2TJeGp7bbaz0=;
 b=s18sLGI4RWRKqf7d0nBt4EROIjxGGWlEw3MzZFjH4d+6ENh2k9qgPiverfkEd/J3h84ERw
 NMX/4vlJTwDn4hDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D2A61390C;
 Fri, 20 Jan 2023 12:20:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rL0GEiuHymPXFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jan 2023 12:20:59 +0000
Message-ID: <15582ad4-6417-9535-b5f3-45a7e7e24db4@suse.de>
Date: Fri, 20 Jan 2023 13:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] drm/fb-helper: Check fb_deferred_io_init() return
 value
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230120120822.2536032-1-javierm@redhat.com>
 <20230120120822.2536032-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230120120822.2536032-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JcbYBg0NHG5G1eBCabsC4FI6"
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JcbYBg0NHG5G1eBCabsC4FI6
Content-Type: multipart/mixed; boundary="------------OGvQ00s6Qy12LAgD4Fcbvnu0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <15582ad4-6417-9535-b5f3-45a7e7e24db4@suse.de>
Subject: Re: [PATCH 2/3] drm/fb-helper: Check fb_deferred_io_init() return
 value
References: <20230120120822.2536032-1-javierm@redhat.com>
 <20230120120822.2536032-3-javierm@redhat.com>
In-Reply-To: <20230120120822.2536032-3-javierm@redhat.com>

--------------OGvQ00s6Qy12LAgD4Fcbvnu0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjAxLjIzIHVtIDEzOjA4IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGUgZmJfZGVmZXJyZWRfaW9faW5pdCgpIGNhbiBmYWlsIGFuZCByZXR1cm4g
YW4gZXJybm8gY29kZSBidXQgY3VycmVudGx5DQo+IHRoZXJlIGlzIG5vIGNoZWNrIGZvciBp
dHMgcmV0dXJuIHZhbHVlLg0KPiANCj4gRml4IHRoYXQgYW5kIHByb3BhZ2F0ZSB0byBlcnJu
byB0byB0aGUgY2FsbGVyIGluIHRoZSBjYXNlIG9mIGEgZmFpbHVyZS4NCj4gDQo+IEZpeGVz
OiBkNTM2NTQwZjMwNGMgKCJkcm0vZmItaGVscGVyOiBBZGQgZ2VuZXJpYyBmYmRldiBlbXVs
YXRpb24gLmZiX3Byb2JlIGZ1bmN0aW9uIikNCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1h
cnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClRoZSBlcnJvciBjbGVh
bnVwIGluIHRoaXMgZnVuY3Rpb24gaXMgYWxyZWFkeSBicm9rZW47IGp1c3QgcmV0dXJuaW5n
IGlzIA0KZ29vZCBlbm91Z2ggZm9yIG5vdy4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiANCj4gICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+IGluZGV4IDBhNGMxNjBlMGU1OC4uYjJkZjhjMDM1
OTRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiBAQCAt
MjIzLDcgKzIyMyw5IEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2ZiX3Byb2JlKHN0cnVjdCBk
cm1fZmJfaGVscGVyICpmYl9oZWxwZXIsDQo+ICAgCQlmYmktPmZsYWdzIHw9IEZCSU5GT19W
SVJURkIgfCBGQklORk9fUkVBRFNfRkFTVDsNCj4gICANCj4gICAJCWZiaS0+ZmJkZWZpbyA9
ICZkcm1fZmJkZXZfZGVmaW87DQo+IC0JCWZiX2RlZmVycmVkX2lvX2luaXQoZmJpKTsNCj4g
KwkJcmV0ID0gZmJfZGVmZXJyZWRfaW9faW5pdChmYmkpOw0KPiArCQlpZiAocmV0KQ0KPiAr
CQkJcmV0dXJuIHJldDsNCj4gICAJfSBlbHNlIHsNCj4gICAJCS8qIGJ1ZmZlciBpcyBtYXBw
ZWQgZm9yIEhXIGZyYW1lYnVmZmVyICovDQo+ICAgCQlyZXQgPSBkcm1fY2xpZW50X2J1ZmZl
cl92bWFwKGZiX2hlbHBlci0+YnVmZmVyLCAmbWFwKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------OGvQ00s6Qy12LAgD4Fcbvnu0--

--------------JcbYBg0NHG5G1eBCabsC4FI6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPKhyoFAwAAAAAACgkQlh/E3EQov+Bz
wRAAh8uQpb260WMY1xOFGByzbsju3qM7uUu4dQxYsKXkvpTKFrAhdzWTr+CiGslnJ08Ul6uXTzjM
auOOpO0rWgMayzhczJDz4X5GXiOXELKVq877OhEoe01j7KRK0nf+sgmslicyJuwtuKWQpL2AtKd3
eHMl9fCgop95o2zYjiiNXJKrfKSCPvtZcETKZ7WfieNFv6U+9hskgMffpzQg9fM6x8k32hhnJnm9
434H/ooPDG/u3ZdQkyOVN4Pb0rEjBOyzQfhOukPHjhuI1PsMlStN9khBUf+9XyG1N9gi5e1jgXmm
mjexdMj0zSHbWY447sUC2+2sqtP6wp69lJy3fKAPXcRTk7LawrlFSHfAzuQnJLNLXmme1k9sMEkP
YgPfkWooVSD0XxD7n6Vw+wvA2FdycgoNHVcQRIl2ygwuNcuVjnj4iDvuVMKgBpmNI0wwmCGrUxFK
bR2+rfuWgwTWbVoR89y4C4Tf1KeGlFguygU+5iUoDs4+7iI7nNULO1/yl7M/13FP+efpR1+KXnPF
I4L86sga6zBwqwJ6q6BmNc5aFg71qElQc3Tprm/J1dnWQYlbhZ+z5fLm30YAnTRbD97klgmetYot
ton5nJn9XlOAVX5hXppmEr4P2SCvFc1lpJF/q12/b8kACqYM+7Kib58EQ883KqpRrhLvxmvXJmcN
IX8=
=hv4G
-----END PGP SIGNATURE-----

--------------JcbYBg0NHG5G1eBCabsC4FI6--
