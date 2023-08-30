Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC5D78D514
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8810E4E4;
	Wed, 30 Aug 2023 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A383210E4E4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 10:19:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C875211E1;
 Wed, 30 Aug 2023 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693390756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=toqwyklWOWN1twCI0rz0QfBr2dRaSgpJM3m6BuSWSfc=;
 b=1kunkhzC9CsTBBoZZXPWfMCL0JX7OBObe+54gSygUBxvw0a+ZM4xDEt7+IiF+g5xUrZS3Y
 AVWWnVykxZsMbAlqrmXp31YP+HAa2SakM0FVqp2l2Gc9tjwgZX4fdNBlL15RZcizPf4CfB
 g8oG4D/hu4D8oDRWkpuOMs5Ogo38s2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693390756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=toqwyklWOWN1twCI0rz0QfBr2dRaSgpJM3m6BuSWSfc=;
 b=56GlcYI28lksVSjn9gcItvjI+C16wJ86BKhPwIU6TSN1VjfTEc8sX2dYQMJGlmCMRhIZIp
 otlQ9DtjfK3oFXAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F88B1353E;
 Wed, 30 Aug 2023 10:19:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xnhLEqQX72QzQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Aug 2023 10:19:16 +0000
Message-ID: <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
Date: Wed, 30 Aug 2023 12:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230825132229.1109445-1-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7RHQerklSkVMX6YLdQrdZGvy"
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7RHQerklSkVMX6YLdQrdZGvy
Content-Type: multipart/mixed; boundary="------------03h35u5cEKNKWkFhSUqw5yfq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
In-Reply-To: <20230825132229.1109445-1-thierry.reding@gmail.com>

--------------03h35u5cEKNKWkFhSUqw5yfq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDguMjMgdW0gMTU6MjIgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFRlZ3Jh
IERSTSBkb2Vzbid0IHN1cHBvcnQgZGlzcGxheSBvbiBUZWdyYTIzNCBhbmQgbGF0ZXIsIHNv
IG1ha2Ugc3VyZQ0KPiBub3QgdG8gcmVtb3ZlIGFueSBleGlzdGluZyBmcmFtZWJ1ZmZlcnMg
aW4gdGhhdCBjYXNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRy
ZWRpbmdAbnZpZGlhLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Ry
bS5jIHwgOCArKysrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jDQo+IGluZGV4IGIxZTFh
NzhlMzBjNi4uN2EzOGRhZGJjMjY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jDQo+IEBA
IC0xMjIwLDkgKzEyMjAsMTEgQEAgc3RhdGljIGludCBob3N0MXhfZHJtX3Byb2JlKHN0cnVj
dCBob3N0MXhfZGV2aWNlICpkZXYpDQo+ICAgDQo+ICAgCWRybV9tb2RlX2NvbmZpZ19yZXNl
dChkcm0pOw0KPiAgIA0KPiAtCWVyciA9IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZm
ZXJzKCZ0ZWdyYV9kcm1fZHJpdmVyKTsNCj4gLQlpZiAoZXJyIDwgMCkNCj4gLQkJZ290byBo
dWI7DQo+ICsJaWYgKGRybS0+bW9kZV9jb25maWcubnVtX2NydGMgPiAwKSB7DQoNCklmIHlv
dSBkb24ndCBzdXBwb3J0IHRoZSBoYXJkd2FyZSwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRv
IHJldHVybiANCi1FTk9ERVYgaWYgIW51bV9jcnRjPw0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+ICsJCWVyciA9IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCZ0ZWdy
YV9kcm1fZHJpdmVyKTsNCj4gKwkJaWYgKGVyciA8IDApDQo+ICsJCQlnb3RvIGh1YjsNCj4g
Kwl9DQo+ICAgDQo+ICAgCWVyciA9IGRybV9kZXZfcmVnaXN0ZXIoZHJtLCAwKTsNCj4gICAJ
aWYgKGVyciA8IDApDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJh
bmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90
ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhS
QiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------03h35u5cEKNKWkFhSUqw5yfq--

--------------7RHQerklSkVMX6YLdQrdZGvy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTvF6MFAwAAAAAACgkQlh/E3EQov+BD
Vg//ewtzXwGNI9bE5uJrwYjbwk6z5gfrbGWfpCd6ifzbvbeGKSTqjGtdZFcmDUfl0HozCqyPuex+
r1Y+Zlr4zcHwCklAtwbCuSfk094tfbVgYWTRpm0mWfliiViK0b/hO6H+Ee5iGkW0ozkztuy5Wh1V
vgSqqkT3MdvheI8hz5Rxr533kWEq+mAgsDWXThLFEJvxHlwAQ6qessKTHrnXOEzxwUBYYZfHb1U2
V3jBEbZVGCb6wQuBaHLV586acNp0Ff02pYnsT7WtZLI/ItVky9HJV9MEHtNDe63t4e5Oqd+CyI4l
57duoUdYh25JoO5spiEMHTyv2bLvwg1J7UjZg0x9DDn58l2e25YVW26gC5+VAcc6+lTPmhHTATjW
wEVKlAtFIpyK83YxMPClB7x6Undfw+e21SZkb8TfrIgR5sbC/BG6MTmzhHR/xWNq0r2k59HZC4SY
ROZpSLue1b0zV/1/KWbCBjTqTTnSW2zOS6I0rfS6W/uJ6+XvVRTW/gjn64Qnpd67rzWgcFigPDp5
JgUwn6+bv8eow8AFLAXzKo17P/ii7UDxVDtbQ8FuAgfoAz461H6NCIUJ1I+Enr6Hn5hPNPOEDJiN
xXPZXa+p4GfgOLBMsWSnaeoR35rG/6XHrgQ4Xbprxm8rNRmNcZi0VgznxYcuAYtzH958jDJTf2EI
6dQ=
=ZuNC
-----END PGP SIGNATURE-----

--------------7RHQerklSkVMX6YLdQrdZGvy--
