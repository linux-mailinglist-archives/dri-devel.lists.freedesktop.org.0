Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0C620F79
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 12:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F5310E3D5;
	Tue,  8 Nov 2022 11:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2308F10E3F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 11:49:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAD661F85D;
 Tue,  8 Nov 2022 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667908159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUctL1Mjz+hPRnPU+RR4ZhMMlvSyFt0/M/zdCnt/5So=;
 b=irNjTl9Ebh0FEAq4YgwGkKPG1h3TwXUhOLVHit1UZ2dSLfIsX/LEAsQqWQQqZkigV562GI
 CUcBKY4OIpiGW1wBDuB3QCv9CuX79KtsOq38J7krVLeeiRsJBx2qHhRN1IM37sQnCzH65X
 Kg5zrMAQgx/02Ged7RnapCzzxyvXkEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667908159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUctL1Mjz+hPRnPU+RR4ZhMMlvSyFt0/M/zdCnt/5So=;
 b=sqWQFp3yIaxJiZDfg0NFe7w5z4jr16oo+7UaZj5t+wjuSricRfaRPYr8YIMLbz5MNtGuW9
 oDmr3QlQmR4+UDDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C003F139F1;
 Tue,  8 Nov 2022 11:49:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hlbiLT9CamNQRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Nov 2022 11:49:19 +0000
Message-ID: <9245a94a-8aeb-57e7-bb89-6c57e6cc6b32@suse.de>
Date: Tue, 8 Nov 2022 12:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/fb-helper: Fix missing kerneldoc include
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dmCOoWYBKrAl2FOv6JIJQ5Tn"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dmCOoWYBKrAl2FOv6JIJQ5Tn
Content-Type: multipart/mixed; boundary="------------a9NkUWbX0jY2uWrR6H9Mp90X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <9245a94a-8aeb-57e7-bb89-6c57e6cc6b32@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Fix missing kerneldoc include
References: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>

--------------a9NkUWbX0jY2uWrR6H9Mp90X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjExLjIyIHVtIDIwOjA5IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gVGhp
cyB3YXMgbG9zdCBpbiB0aGUgY29kZSBtb3ZlbWVudCBkb25lIGluIDhhYjU5ZGEyNmJjMA0K
PiAoImRybS9mYi1oZWxwZXI6IE1vdmUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24gaW50byBz
ZXBhcmF0ZSBzb3VyY2UNCj4gZmlsZSIpLg0KPiANCj4gRml4ZXM6IDhhYjU5ZGEyNmJjMCAo
ImRybS9mYi1oZWxwZXI6IE1vdmUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24gaW50byBzZXBh
cmF0ZSBzb3VyY2UgZmlsZSIpDQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gQ2M6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUBy
ZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24vZ3B1L2RybS1r
bXMtaGVscGVycy5yc3QgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhl
bHBlcnMucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJzdA0KPiBp
bmRleCBkYmM4NWZkN2E5NzEuLmE0ODYwZmZkNmU4NiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9u
L2dwdS9kcm0ta21zLWhlbHBlcnMucnN0DQo+IEBAIC0xMTYsNiArMTE2LDkgQEAgZmJkZXYg
SGVscGVyIEZ1bmN0aW9ucyBSZWZlcmVuY2UNCj4gICAuLiBrZXJuZWwtZG9jOjogZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiAgICAgIDpleHBvcnQ6DQo+ICAgDQo+ICsu
LiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4g
KyAgIDpleHBvcnQ6DQo+ICsNCj4gICBmb3JtYXQgSGVscGVyIEZ1bmN0aW9ucyBSZWZlcmVu
Y2UNCj4gICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gICANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------a9NkUWbX0jY2uWrR6H9Mp90X--

--------------dmCOoWYBKrAl2FOv6JIJQ5Tn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNqQj8FAwAAAAAACgkQlh/E3EQov+Dz
SQ/7BF/j3ZWbJtm9OOmqeXWIMXZdVQZQBVd7DswB3zos02O+z01gPXQKlWm6//JSqFoCirb7wmSj
F27Gh/le5a6+vvzrL/yAmQsYONq6462yFno+FALQkPysUVnzAN1CFeogbrKW+009F+SysaJ33nLI
fWozP8HrpAoFDviWvVSKtZy3pKiBjXLQMq67dByIqJH0usSRqO173Zpq9Jg3lxkZ6yKtFU+3mSth
R7JHQiIHUb5dyEtTo/1BMtTwEANGkl62q13ECw5AQ/ZUstImeyvwrwXpyc0vZRmaJRTyS8VETlcL
/fVqknXG1krAcUcdTe2iLLydPFyEvE+EHXc7deCeZD51dLu4BmWKC/JfZ1WPaa/sOtdN74s3iwA9
irf2zafVRzywEzCBSFMWzlA+YINIG+Zu3VSlQo0xZ1dVN5GkKITtvfmb45wQaiKzB46lVwBVQbak
cECvp/hiHNkhpXhqY1YNmuB3cDx9Ti0qVvMh2p+KjAtMiaekrWVebUMskdg5cvzT6QeRIkMd+hM7
dFMj1IOC4nhLcwa37tbmu7LzaNBZnr/olom5mycvHZlPCIjOIpJnFmqI+wjspbS1ST+/zsEvohQd
yq8JkBjAtFMCvJLLbGqd8IOt+6XSMK/PrAuTzeZ/EWpU0JFj2zMtD438vcE/FXexVswFrIbMYsj7
dCY=
=pMMF
-----END PGP SIGNATURE-----

--------------dmCOoWYBKrAl2FOv6JIJQ5Tn--
