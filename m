Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6862B582
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167810E43D;
	Wed, 16 Nov 2022 08:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B634F10E43D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:48:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D506336E7;
 Wed, 16 Nov 2022 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668588482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dvnXcG8vzrGVGd45MvnLOUPM0efFcBLpsRTGQQLOKw=;
 b=WhzZzAMqNPeH7PUYMpE0Jo1/n3SxwabBFrwzMBW+SrH3Xha/19essLDHULOSFD2g+05YZj
 AitoFLwFIVOw74sciOo/hWV4XPtwtuYkhQV26ZSzAgBxp3W1osiBnGEXVjcioCXe+Mfe89
 ezxLpQ5B/WLUok+5tb184TCixvGlGsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668588482;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dvnXcG8vzrGVGd45MvnLOUPM0efFcBLpsRTGQQLOKw=;
 b=rfBN1dOFSCI6MemW9fya75eu1QdyELIOLFYzEjf5G4NRI76Ipvmq1v0FqQIFe6m0Jdh8Nf
 aSx13VZUeAWEIIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BD9A13480;
 Wed, 16 Nov 2022 08:48:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RH+gBcKjdGNPIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Nov 2022 08:48:02 +0000
Message-ID: <97b36fac-54ee-8680-0387-9939a686bf82@suse.de>
Date: Wed, 16 Nov 2022 09:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, daniel@ffwll.ch, airlied@gmail.com,
 javierm@redhat.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221115115819.23088-6-tzimmermann@suse.de>
 <202211160409.bw15Rx0j-lkp@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <202211160409.bw15Rx0j-lkp@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LDlOFvuHqNpJU9yUr0HB9f6S"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LDlOFvuHqNpJU9yUr0HB9f6S
Content-Type: multipart/mixed; boundary="------------bfXdtNz7Gk1c9yPs040edxGZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <lkp@intel.com>, daniel@ffwll.ch, airlied@gmail.com,
 javierm@redhat.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Message-ID: <97b36fac-54ee-8680-0387-9939a686bf82@suse.de>
Subject: Re: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
References: <20221115115819.23088-6-tzimmermann@suse.de>
 <202211160409.bw15Rx0j-lkp@intel.com>
In-Reply-To: <202211160409.bw15Rx0j-lkp@intel.com>

--------------bfXdtNz7Gk1c9yPs040edxGZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE1LjExLjIyIHVtIDIxOjM1IHNjaHJpZWIga2VybmVsIHRlc3Qgcm9ib3Q6DQo+
IEhpIFRob21hcywNCj4gDQo+IEkgbG92ZSB5b3VyIHBhdGNoISBQZXJoYXBzIHNvbWV0aGlu
ZyB0byBpbXByb3ZlOg0KPiANCj4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIDJjYzMw
NGFmZDQ5NjdjZWZmZDE0OTQwZmY3M2E4YmViMzE3NzhmOTBdDQo+IA0KPiB1cmw6ICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvVGhvbWFzLVpp
bW1lcm1hbm4vZHJtLWZiLWhlbHBlci1SZW1vdmUtZGFtYWdlLXdvcmtlci8yMDIyMTExNS0x
OTU5NTgNCj4gYmFzZTogICAyY2MzMDRhZmQ0OTY3Y2VmZmQxNDk0MGZmNzNhOGJlYjMxNzc4
ZjkwDQo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMjEx
MTUxMTU4MTkuMjMwODgtNi10emltbWVybWFubiU0MHN1c2UuZGUNCj4gcGF0Y2ggc3ViamVj
dDogW1BBVENIIHYyIDUvNl0gZHJtL2ZiLWhlbHBlcjogU2NoZWR1bGUgZGVmZXJyZWQtSS9P
IHdvcmtlciBhZnRlciB3cml0aW5nIHRvIGZyYW1lYnVmZmVyDQo+IGNvbmZpZzogeDg2XzY0
LWFsbHllc2NvbmZpZw0KPiBjb21waWxlcjogZ2NjLTExIChEZWJpYW4gMTEuMy4wLTgpIDEx
LjMuMA0KPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOg0KPiAgICAgICAgICAj
IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdC9jMGRkNjIz
NThiYjhhNjZlY2I4OTUzNzA0MTgwMjkxY2Y2ODM0NTcyDQo+ICAgICAgICAgIGdpdCByZW1v
dGUgYWRkIGxpbnV4LXJldmlldyBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9s
aW51eA0KPiAgICAgICAgICBnaXQgZmV0Y2ggLS1uby10YWdzIGxpbnV4LXJldmlldyBUaG9t
YXMtWmltbWVybWFubi9kcm0tZmItaGVscGVyLVJlbW92ZS1kYW1hZ2Utd29ya2VyLzIwMjIx
MTE1LTE5NTk1OA0KPiAgICAgICAgICBnaXQgY2hlY2tvdXQgYzBkZDYyMzU4YmI4YTY2ZWNi
ODk1MzcwNDE4MDI5MWNmNjgzNDU3Mg0KPiAgICAgICAgICAjIHNhdmUgdGhlIGNvbmZpZyBm
aWxlDQo+ICAgICAgICAgIG1rZGlyIGJ1aWxkX2RpciAmJiBjcCBjb25maWcgYnVpbGRfZGly
Ly5jb25maWcNCj4gICAgICAgICAgbWFrZSBXPTEgTz1idWlsZF9kaXIgQVJDSD14ODZfNjQg
U0hFTEw9L2Jpbi9iYXNoIGRyaXZlcnMvZ3B1L2RybS8NCj4gDQo+IElmIHlvdSBmaXggdGhl
IGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgd2hlcmUgYXBwbGljYWJsZQ0KPiB8
IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gDQo+
IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiANCj4gICAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmM6IEluIGZ1bmN0aW9uICdkcm1fZmJfaGVs
cGVyX2RhbWFnZSc6DQo+Pj4gZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYzo2MDI6
Mjg6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSAnZGV2JyBbLVd1bnVzZWQtdmFyaWFibGVd
DQo+ICAgICAgIDYwMiB8ICAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGhlbHBl
ci0+ZGV2Ow0KPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4N
Cg0KSWYgbm90aGluZyBlbHNlIGNvbWVzIGluLCB0aGlzIHdpbGwgYmUgZml4ZWQgd2hpbGUg
bWVyZ2luZyB0aGUgcGF0Y2guDQoNCj4gDQo+IA0KPiB2aW0gKy9kZXYgKzYwMiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IA0KPiAgICAgNTk4CQ0KPiAgICAgNTk5CXN0
YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGFtYWdlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpo
ZWxwZXIsIHUzMiB4LCB1MzIgeSwNCj4gICAgIDYwMAkJCQkJIHUzMiB3aWR0aCwgdTMyIGhl
aWdodCkNCj4gICAgIDYwMQl7DQo+ICAgPiA2MDIJCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYg
PSBoZWxwZXItPmRldjsNCj4gICAgIDYwMwkJc3RydWN0IGZiX2luZm8gKmluZm8gPSBoZWxw
ZXItPmluZm87DQo+ICAgICA2MDQJDQo+ICAgICA2MDUJCWRybV9mYl9oZWxwZXJfYWRkX2Rh
bWFnZV9jbGlwKGhlbHBlciwgeCwgeSwgd2lkdGgsIGhlaWdodCk7DQo+ICAgICA2MDYJDQo+
ICAgICA2MDcJCS8qDQo+ICAgICA2MDgJCSAqIFRoZSBjdXJyZW50IGZiZGV2IGVtdWxhdGlv
biBvbmx5IGZsdXNoZXMgYnVmZmVycyBpZiBhIGRhbWFnZQ0KPiAgICAgNjA5CQkgKiB1cGRh
dGUgaXMgbmVjZXNzYXJ5LiBBbmQgd2UgY2FuIGFzc3VtZSB0aGF0IGRlZmVycmVkIEkvTyBo
YXMNCj4gICAgIDYxMAkJICogYmVlbiBlbmFibGVkIGFzIGRhbWFnZSB1cGRhdGVzIHJlcXVp
cmUgZGVmZXJyZWQgSS9PIGZvciBtbWFwLg0KPiAgICAgNjExCQkgKi8NCj4gICAgIDYxMgkJ
ZmJfZGVmZXJyZWRfaW9fc2NoZWR1bGVfZmx1c2goaW5mbyk7DQo+ICAgICA2MTMJfQ0KPiAg
ICAgNjE0CQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------bfXdtNz7Gk1c9yPs040edxGZ--

--------------LDlOFvuHqNpJU9yUr0HB9f6S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN0o8EFAwAAAAAACgkQlh/E3EQov+B0
rw//f9XUVs3nM2CSJ340orAvO6eVLMCXFg1tXQCUO8sMGS1uTjROt1kA4tePZ0d7+Tn2fkzNlJiM
ZTLlBo7tHlOht0E8AzUGe1hIzf4pLzZXSIJpB8x3LIA0QL3S+gczybqTYZFORYI96O7HSy0uCRP1
AiqRYblzhctV8JueV4Qm6rmOIUnGq1kVPJsaWKL9BQpQeIoJUlotOcACLUhQgfEw1pOx9bUuK0eU
qaMAYRHz1mxt/TUI1vE2wqtX/FtcCZE1wqK7B3vqXUh8UJX2bM+d/2RbvhZXCTFFnoICQ3c660Le
Os5kx9Y+Kzv02IfctZgBWJD429TjInBFjgaPbeyBdCmrJlc142+cMu1zkzRrVxvlPzylw55mL1W1
GM9jtrie9IDnItQekk5J8EtNzgTwLgrcd2mAloi5wgDy8reTF969v2W5wAUIJ6SndlWC5WSI0TCW
1Q5vDLF/uw1bjGvwoujY2S4/R29fxlSb2/EZtxJhslWQqyT2n6rN6/3ADHiCVul9Sa0lZ5IYv6pM
+0vBs24Ue7K7ErLyqSl/8J43anQce2yKWk0/u+KKqmSReuYuFOWoGa4+mP6xVgvREPy+fzyPq+sw
6tnimi5N9+N8fIlofCtSygSnNtfEEauiQzmtqSNJhQUrwjk3avWgTT0lTiXAFOzNxZLy3D2DGhaD
Hpc=
=eqhQ
-----END PGP SIGNATURE-----

--------------LDlOFvuHqNpJU9yUr0HB9f6S--
