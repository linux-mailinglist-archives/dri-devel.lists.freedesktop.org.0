Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51F5FB2E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83F10E3EC;
	Tue, 11 Oct 2022 13:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B1910E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 13:09:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA7DF20155;
 Tue, 11 Oct 2022 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665493753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVRCc4SS1007RNLbmU/9GhJmW5jB+5FC8+AOsCDQce0=;
 b=rtOzjKK72O82+tGko5I4jx2aW/y9gLAmJxb0tPqpv8r4YqDqIk2tBNtwdE9ry1nbdyQDw2
 y4UzELE/6kVoZcvaMzMN80/sy9ymfDtBpstb1dmhyTip/c5X8CgVyymSUi58w/KRHv2aAY
 TYHpxwi/aocFPiGGLCYjraXqv0s+hiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665493753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVRCc4SS1007RNLbmU/9GhJmW5jB+5FC8+AOsCDQce0=;
 b=3B42zoImFJPO/6UYbKurx/wx4F2DGU1+z6g4xYv0W0kD2JWrqejX6KwgKhwblXH4Wux5N7
 I3rhSPF0vNJJ4lAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9327213AAC;
 Tue, 11 Oct 2022 13:09:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kCWOIvlqRWPeYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 13:09:13 +0000
Message-ID: <b48728b3-96b9-f684-8adb-5b944c4ba759@suse.de>
Date: Tue, 11 Oct 2022 15:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/3] drm/ssd130x: Do not call
 drm_atomic_add_affected_planes()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221010170203.274949-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NXNgIx7VyJdQLP9iQc9UdRpF"
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
--------------NXNgIx7VyJdQLP9iQc9UdRpF
Content-Type: multipart/mixed; boundary="------------KY5qVJqJXClzdHUkY5KSXhzz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Message-ID: <b48728b3-96b9-f684-8adb-5b944c4ba759@suse.de>
Subject: Re: [PATCH 2/3] drm/ssd130x: Do not call
 drm_atomic_add_affected_planes()
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-3-javierm@redhat.com>
In-Reply-To: <20221010170203.274949-3-javierm@redhat.com>

--------------KY5qVJqJXClzdHUkY5KSXhzz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjEwLjIyIHVtIDE5OjAyIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGVyZSdzIG5vIG5lZWQgdG8gYWRkIHBsYW5lcyB0byB0aGUgYXRvbWljIHN0
YXRlLiBSZW1vdmUgdGhlIGNhbGwNCj4gdG8gZHJtX2F0b21pY19hZGRfYWZmZWN0ZWRfcGxh
bmVzKCkgZnJvbSBzc2QxMzB4Lg0KPiANCj4gT24gZnVsbCBtb2Rlc2V0cywgdGhlIERSTSBo
ZWxwZXJzIGFscmVhZHkgYWRkIGEgQ1JUQydzIHBsYW5lcyB0byB0aGUNCj4gYXRvbWljIHN0
YXRlOyBzZWUgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfbW9kZXNldCgpLiBUaGVyZSdzIG5v
IHJlYXNvbg0KPiB0byBjYWxsIGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcygpIHVu
Y29uZGl0aW9uYWxseSBpbiB0aGUgQ1JUQydzDQo+IGF0b21pY19jaGVjaygpIGluIHNzZDEz
MHguIEl0J3MgYWxzbyB0b28gbGF0ZSwgYXMgdGhlIGF0b21pY19jaGVjaygpDQo+IG9mIHRo
ZSBhZGRlZCBwbGFuZXMgd2lsbCBub3QgYmUgY2FsbGVkIGJlZm9yZSB0aGUgY29tbWl0Lg0K
PiANCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZp
ZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Nv
bG9tb24vc3NkMTMweC5jIHwgMTAgKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jIGIvZHJpdmVycy9ncHUvZHJtL3NvbG9t
b24vc3NkMTMweC5jDQo+IGluZGV4IDU3ZTQ4MzU1YzAwOC4uMGQ0YWI2NTIzM2RiIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+IEBAIC02NDksMTcgKzY0OSwx
MSBAQCBzdGF0aWMgaW50IHNzZDEzMHhfY3J0Y19oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YywNCj4gICAJCQkJCSAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqbmV3X3N0YXRlKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdf
Y3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKG5ld19zdGF0ZSwg
Y3J0Yyk7DQo+IC0JaW50IHJldDsNCj4gICANCj4gICAJaWYgKCFuZXdfY3J0Y19zdGF0ZS0+
ZW5hYmxlKQ0KPiAtCQlnb3RvIG91dDsNCj4gLQ0KPiAtCXJldCA9IGRybV9hdG9taWNfaGVs
cGVyX2NoZWNrX2NydGNfcHJpbWFyeV9wbGFuZShuZXdfY3J0Y19zdGF0ZSk7DQo+IC0JaWYg
KHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gKwkJcmV0dXJuIDA7DQo+ICAgDQo+IC1vdXQ6
DQo+IC0JcmV0dXJuIGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcyhuZXdfc3RhdGUs
IGNydGMpOw0KPiArCXJldHVybiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19jcnRjX3ByaW1h
cnlfcGxhbmUobmV3X2NydGNfc3RhdGUpOw0KPiAgIH0NCj4gICANCj4gICAvKg0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------KY5qVJqJXClzdHUkY5KSXhzz--

--------------NXNgIx7VyJdQLP9iQc9UdRpF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNFavkFAwAAAAAACgkQlh/E3EQov+B1
9xAAxIWDeHL4WTyY/N4B2/tT8bddpytix2/jul3SMO3gYVxHv527K4Q7pFhvvIoAGucGqEHyE7PX
dphDX4D9PtuGrd1wseLJdbUZxKOd64WKAnmM2NXPwYNs5X/v2VRDNFM3Zi1MYUEfpgryFO2U6jiu
5DG8AkWrELFvR9o7xPqDWGUIFlB5W8l+YQhAxTbbkxetV68KqjADjyEeq6tmy36jB3GN6jZpsP7E
8+dMhIXeDgfGNiDOLMr5gyUNOmqGfmuvwiO2nBaJhFOiKtKPLy0YpZcuvu9o4vXg9Ma7KKzpAQtH
tF+PldE+4NxQKVUvNTy4g0ei37nXLMznfQ9N+EgVkfcX/99ki+X8yfsCbsLL69licEFg6hMxuYtH
Elb1VakCfg2DX0JFBs6x8qXueDuSsuGMgNLkIuqr8yFXIDFq+U7/gpoT6RN4aSvYMXGhDQ9AL42S
VggvdzLwxmifuLaovnnz9st19Tvii53Ti3H/WimRpuHq7DdhvT+vBtCkCktrzpxbyYSocVmGguOE
GlG2SqJd8IEA6b4YfWPjwXwYaRzRnwshapfl2LTpL5vjIILUbehdVI6X9dBEr3oEAUIJNRE4gyNf
dSNjnkqd9mA0vR34qI5j9Dv32E7KinRQJsoXR4iagw0KgpCgTwRQhuBEK0ESLecnvIN1bcSFe17+
CWk=
=Ms6e
-----END PGP SIGNATURE-----

--------------NXNgIx7VyJdQLP9iQc9UdRpF--
