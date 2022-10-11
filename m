Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980EB5FB2DA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64BA10E1AA;
	Tue, 11 Oct 2022 13:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F193B10E1AA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 13:06:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D6EA336AB;
 Tue, 11 Oct 2022 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665493580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dhKVT3y4ys550oVa9RvQSaLJ4G06zyWYkQxIFiY2ybg=;
 b=iNXhkieYZBLZIivbHsSoaDDUNjbcq2syJtaei9cy+Y5bdyl/N5AAVLNZt7ZYrkqtU+PQ73
 fHavMHHICO9pDhg4UWgdToJRtvbHUkcQe87WsyvQginpl84JoaOkej2YLhYxFGTQsRrtwu
 Wfn0pFg+lOTOiKR8Oj6zZdCm2L/aZfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665493580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dhKVT3y4ys550oVa9RvQSaLJ4G06zyWYkQxIFiY2ybg=;
 b=jhVWBWk9GVYVl2ovdEmn6smcg0vugT13QmKUcTwCY8WUI65igojqLrKvr67T+lnN9FvexK
 JfK3dG4Fw1WswpBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DE0413AAC;
 Tue, 11 Oct 2022 13:06:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hwPIDUxqRWOHYgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 13:06:20 +0000
Message-ID: <fc9a8b09-4b41-291e-d235-bb71eeb95f3c@suse.de>
Date: Tue, 11 Oct 2022 15:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] drm/simpledrm: Do not call
 drm_atomic_add_affected_planes()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221010170203.274949-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DbrKQvZO7HZ7vN2mcLZ41zKN"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DbrKQvZO7HZ7vN2mcLZ41zKN
Content-Type: multipart/mixed; boundary="------------O5KuDmcnJzZl1TMmMQ5Ks4gY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Message-ID: <fc9a8b09-4b41-291e-d235-bb71eeb95f3c@suse.de>
Subject: Re: [PATCH 1/3] drm/simpledrm: Do not call
 drm_atomic_add_affected_planes()
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-2-javierm@redhat.com>
In-Reply-To: <20221010170203.274949-2-javierm@redhat.com>

--------------O5KuDmcnJzZl1TMmMQ5Ks4gY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTAuMjIgdW0gMTk6MDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBhZGQgcGxhbmVzIHRvIHRoZSBhdG9taWMg
c3RhdGUuIFJlbW92ZSB0aGUgY2FsbA0KPiB0byBkcm1fYXRvbWljX2FkZF9hZmZlY3RlZF9w
bGFuZXMoKSBmcm9tIHNpbXBsZWRybS4NCj4gDQo+IE9uIGZ1bGwgbW9kZXNldHMsIHRoZSBE
Uk0gaGVscGVycyBhbHJlYWR5IGFkZCBhIENSVEMncyBwbGFuZXMgdG8gdGhlDQo+IGF0b21p
YyBzdGF0ZTsgc2VlIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX21vZGVzZXQoKS4gVGhlcmUn
cyBubyByZWFzb24NCj4gdG8gY2FsbCBkcm1fYXRvbWljX2FkZF9hZmZlY3RlZF9wbGFuZXMo
KSB1bmNvbmRpdGlvbmFsbHkgaW4gdGhlIENSVEMncw0KPiBhdG9taWNfY2hlY2soKSBpbiBz
aW1wbGVkcm0uIEl0J3MgYWxzbyB0b28gbGF0ZSwgYXMgdGhlIGF0b21pY19jaGVjaygpDQo+
IG9mIHRoZSBhZGRlZCBwbGFuZXMgd2lsbCBub3QgYmUgY2FsbGVkIGJlZm9yZSB0aGUgY29t
bWl0Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KVGhlcmUncyBhbHNvIGRybV9hdG9taWNfYWRk
X2FmZmVjdGVkX3BsYW5lcygpIGluIG1nYWcyMDAuIFNpbmNlIHlvdSdyZSANCmF0IGl0LCBJ
J2QgYXBwcmVjaWF0ZSBhIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0t
LQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyB8IDEwICsrLS0t
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gaW5kZXggZWNkNDlh
OGYzMzM0Li5mMDNmMTdmNjJhNTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jDQo+IEBAIC01NDksMTcgKzU0OSwxMSBAQCBzdGF0aWMgaW50IHNpbXBsZWRybV9jcnRj
X2hlbHBlcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgIAkJCQkJ
ICAgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm5ld19zdGF0ZSkNCj4gICB7DQo+ICAg
CXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dl
dF9uZXdfY3J0Y19zdGF0ZShuZXdfc3RhdGUsIGNydGMpOw0KPiAtCWludCByZXQ7DQo+ICAg
DQo+ICAgCWlmICghbmV3X2NydGNfc3RhdGUtPmVuYWJsZSkNCj4gLQkJZ290byBvdXQ7DQo+
IC0NCj4gLQlyZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19jcnRjX3ByaW1hcnlfcGxh
bmUobmV3X2NydGNfc3RhdGUpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+
ICsJCXJldHVybiAwOw0KPiAgIA0KPiAtb3V0Og0KPiAtCXJldHVybiBkcm1fYXRvbWljX2Fk
ZF9hZmZlY3RlZF9wbGFuZXMobmV3X3N0YXRlLCBjcnRjKTsNCj4gKwlyZXR1cm4gZHJtX2F0
b21pY19oZWxwZXJfY2hlY2tfY3J0Y19wcmltYXJ5X3BsYW5lKG5ld19jcnRjX3N0YXRlKTsN
Cj4gICB9DQo+ICAgDQo+ICAgLyoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------O5KuDmcnJzZl1TMmMQ5Ks4gY--

--------------DbrKQvZO7HZ7vN2mcLZ41zKN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNFaksFAwAAAAAACgkQlh/E3EQov+D5
Sw//ZlvO4NXyJxlGciZtDpqY/U6Tn08Eth1/3deTvlsZ36BrwjGrER29kDREu3EIKCeYJ1iFskV7
olwh/qLoM0BHh7DuVRXiW7fekUlhhvQl0APozRrkJZbC1j9crVqaSIRrA9chpJhXJDr+/DWWjJ05
CsVfuJzEDkXyiLbhpLBx7lPrI3almakB5ugiuaHmzVGiZdFcIATVJkHQ9bjHTMqC4ic7QO93uDM1
dyZFTaZLD8QnM29mHbPzxe9B5iQsr264SgP/ZIbEXAiJ/a75VJlQ2qMUENbAeNInsJuuwQdkdnwC
X49br7DRneHA9NlCQhYT3FL4dd4myoAgXZU0tazvoJGu2ioBs1QwrqfCH55mvI5v5G1GSJwf0hD/
C44x6yBrOVE7EKFjEjn0QHcpMLma4NzD4TvyOGet62MprDv4Wd4FRTpEJR//yfsdr9pZtHMcYfcw
in97ri8hY+tMjxPP2GYxiZ7/9oI5W0Nhe4JpFIq58jjYlhnNeIk9/cUuD7W/fJg/K7kLpvwqS/Pt
a+z50gFxeA88zTb3Ii1bj5kNwgcl63+PmLIWl5hMJCjdvV1f6hX17woT2Fx7l0VX+/cxrNnTFRNJ
I+DymojyZ5fRC8MdOzaO+1ArpOhrGr0BoXv44fX5GYUk/rjyBtDefic8DrK1+80MNiUB/+6LxbBc
AYo=
=A9J/
-----END PGP SIGNATURE-----

--------------DbrKQvZO7HZ7vN2mcLZ41zKN--
