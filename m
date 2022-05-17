Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F37529F23
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 12:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F18113127;
	Tue, 17 May 2022 10:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D22113127
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 10:15:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 294A11F8C0;
 Tue, 17 May 2022 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652782552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hraaP2Sk/FY42HIVgME7T2fx4Yx9FW285BwEwFR9ZKQ=;
 b=nT/d8l8SgIvXPa8agrXIGKCOcmIgRFVwZ4tAZqkMn6xzIsg0rauzzTfQhiCAgTPd1K48sc
 LY+eFzLNlV7ZRwvHL5cWNtZdc7RvHDMZbvVOAF+uaap10d3vUqRSMdy1NcBYZnLKzG1DMk
 8MiNEH9uSb049DfWZjPUMLSLeA9sFN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652782552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hraaP2Sk/FY42HIVgME7T2fx4Yx9FW285BwEwFR9ZKQ=;
 b=fwzAXlLMzcZO3TfpLZYxQEU1391PWylcOPAWCS0/n5anvd70n752tPAobUMcnVjTPjKThQ
 MQCSHbfWrSVnd3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0060113305;
 Tue, 17 May 2022 10:15:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id csPOOtd1g2KlTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 May 2022 10:15:51 +0000
Message-ID: <6d35e6b9-bd31-53e8-ebd4-a4d76578b24e@suse.de>
Date: Tue, 17 May 2022 12:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/4] drm/gem-vram: Ignore planes that are unused by
 framebuffer format
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-4-tzimmermann@suse.de>
 <196da052-6251-af7d-fb00-7e8cfdb43708@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <196da052-6251-af7d-fb00-7e8cfdb43708@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KKN7zYaPBfUWpomVqk5IoWDZ"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KKN7zYaPBfUWpomVqk5IoWDZ
Content-Type: multipart/mixed; boundary="------------QbYHIhQlupEol0KsxOyIVrln";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <6d35e6b9-bd31-53e8-ebd4-a4d76578b24e@suse.de>
Subject: Re: [PATCH 3/4] drm/gem-vram: Ignore planes that are unused by
 framebuffer format
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-4-tzimmermann@suse.de>
 <196da052-6251-af7d-fb00-7e8cfdb43708@redhat.com>
In-Reply-To: <196da052-6251-af7d-fb00-7e8cfdb43708@redhat.com>

--------------QbYHIhQlupEol0KsxOyIVrln
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDUuMjIgdW0gMTU6MzQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDUvOS8yMiAxMDoxNiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBPbmx5IGhhbmRsZSBjb2xvciBwbGFuZXMgdGhhdCBleGlzdCBpbiBhIGZyYW1lYnVmZmVy
J3MgY29sb3IgZm9ybWF0Lg0KPj4gSWdub3JlIG5vbi1leGlzdGluZyBwbGFuZXMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+PiAtLS0NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQo+PiBAQCAtNjczLDcgKzY3OSwxMCBAQCBk
cm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUsDQo+PiAgIGVycl9kcm1fZ2VtX3ZyYW1fdW5waW46DQo+PiAgIAl3aGlsZSAoaSkg
ew0KPj4gICAJCS0taTsNCj4+IC0JCWdibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0obmV3X3N0
YXRlLT5mYi0+b2JqW2ldKTsNCj4+ICsJCW9iaiA9IGRybV9nZW1fZmJfZ2V0X29iaihmYiwg
aSk7DQo+PiArCQlpZiAoIW9iaikNCj4+ICsJCQljb250aW51ZTsNCj4+ICsJCWdibyA9IGRy
bV9nZW1fdnJhbV9vZl9nZW0ob2JqKTsNCj4+ICAgCQlkcm1fZ2VtX3ZyYW1fdW5waW4oZ2Jv
KTsNCj4gDQo+IFRoZSBjb2RlIGluIHRoaXMgZXJyb3IgcGF0aCB0byB1bnBpbiB0aGUgR0VN
IHZyYW0gb2JqZWN0cy4uLg0KPiANCj4+ICAgCX0NCj4+ICAgCXJldHVybiByZXQ7DQo+PiBA
QCAtNjk0LDE2ICs3MDMsMTkgQEAgdm9pZA0KPj4gICBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVs
cGVyX2NsZWFudXBfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIAkJCQkgICAg
IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9zdGF0ZSkNCj4+ICAgew0KPj4gLQlzaXpl
X3QgaTsNCj4+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBvbGRfc3RhdGUtPmZi
Ow0KPj4gICAJc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibzsNCj4+ICsJc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmo7DQo+PiArCXVuc2lnbmVkIGludCBpOw0KPj4gICANCj4+
IC0JaWYgKCFvbGRfc3RhdGUtPmZiKQ0KPj4gKwlpZiAoIWZiKQ0KPj4gICAJCXJldHVybjsN
Cj4+ICAgDQo+PiAtCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG9sZF9zdGF0ZS0+ZmIt
Pm9iaik7ICsraSkgew0KPj4gLQkJaWYgKCFvbGRfc3RhdGUtPmZiLT5vYmpbaV0pDQo+PiAr
CWZvciAoaSA9IDA7IGkgPCBmYi0+Zm9ybWF0LT5udW1fcGxhbmVzOyArK2kpIHsNCj4+ICsJ
CW9iaiA9IGRybV9nZW1fZmJfZ2V0X29iaihmYiwgaSk7DQo+PiArCQlpZiAoIW9iaikNCj4+
ICAgCQkJY29udGludWU7DQo+PiAtCQlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9sZF9z
dGF0ZS0+ZmItPm9ialtpXSk7DQo+PiArCQlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9i
aik7DQo+PiAgIAkJZHJtX2dlbV92cmFtX3VucGluKGdibyk7DQo+IA0KPiAuLi4gYW5kIHRo
aXMsIHNlZW1zIHRvIGJlIGJhc2ljYWxseSB0aGUgc2FtZS4NCj4gDQo+IFNvIG1heWJlIGFz
IGEgZm9sbG93LXVwIHlvdSBjYW4gZG8gYSBzaW1pbGFyIGNsZWFudXAgbGlrZSB5b3UgZGlk
IGluIHBhdGNoDQo+IDEvNCBhbmQgdXNlIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGhhbmRsZSBi
b3RoLg0KDQpJIHdhcyB0aGlua2luZyB0aGUgc2FtZSB3aGVuIEkgd3JvdGUgdGhpcyBwYXRj
aCBhbmQgc29tZWhvdyBkZWNpZGVkIA0KYWdhaW5zdCBpdC4gIEJ1dCBzaW5jZSB5b3UgYWxz
byBtZW50aW9uIGl0LCBJJ20gZ29pbmcgdG8gYWRkIHRoaXMgY2hhbmdlIA0KdG8gdGhlIHBh
dGNoc2V0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------QbYHIhQlupEol0KsxOyIVrln--

--------------KKN7zYaPBfUWpomVqk5IoWDZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKDddcFAwAAAAAACgkQlh/E3EQov+D7
MA//X+6x3Yy3wPoTwBB7xYNNuzbP/jym27WMUTzyJuqdNlLv9vZL4hfZOHUsTzdHleIr6IXABx+A
+XZW+9tG+xkijKrQd9PiIeJ9bjd8Yl/TIXe8x8+DzXbFfVEX9g/uBr5NEgdTrWw9DM7Z5W9dLbtW
sC9blhgLTCR5U9LPuY5hlhjCwCMlgeNPaZI5yqWrshXIu6YrEoVHtle9vdG00XjuXmYcDzobZuQD
nH7n9bb5l0Y3s9O3U5wlXbxMrz14Ph+zPpniuwU4gHWwWnxlEVLWdaLfcH12WaSfACBO63gJwG20
qVWtKRM3GT53PE8NgpDoukLzK2ZrLZxLeZ7Bl365EdqsfxCblgbfblSohjP279XAJ5sLLcXPeJLk
AyqfBjYgK1f+KtmRpK5vGCwH9I/UbVLRYUQRFKL+hkHx7AnHcbRjZDJPbnqgsiLAWR+1FxqF0wjI
8VnHRAhtzudquGkhXrrXwqVun0k9iB/Il/fFUwk7p0EhUCP86iFc5Pk5luXwHx+FKt6XO+c1CwWU
EQUbeexW9X+3jN1RHydTVXJBjzv6BxnhsSjo88NrPxrmUfy0qEZE1aBakRauJLvfaLcfNMBYhWQc
rf0kdV7UrTS8Xu5pvFQe11gEHC2Kx+LG8fFNG5hXEBBaqIojttT4A3N10HF7WpIoyitKIH2y87os
bd8=
=U4EX
-----END PGP SIGNATURE-----

--------------KKN7zYaPBfUWpomVqk5IoWDZ--
