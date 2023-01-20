Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3B675444
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE7E10E26C;
	Fri, 20 Jan 2023 12:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC7510E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:18:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CC9D5F95D;
 Fri, 20 Jan 2023 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674217080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u+/VJGuYhUCQQXXN+d6ccIA04nnHUmUtUbhkDUXZRqw=;
 b=PpqPzCoOTaZf5Gv37q9XfZTCESdFBMJxW+AWqsbS6oz/br2HAYNZHmV26UlTcpR/UMDXOI
 F835RkQ5RxqWJ4oH84hW3WOxIC/nxcuKOGiRddfVK8XcXTs52HGy9td+Vley7xbY4CoYnz
 b9YH7rRTPVlf98Vx1gHWw4LZleaks7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674217080;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u+/VJGuYhUCQQXXN+d6ccIA04nnHUmUtUbhkDUXZRqw=;
 b=rScskB1xbeSRFdWOgOlom2v6xIKguv6B2CCswdkubVq6xHJkQz5M3a7O9wMeSIlEjEB4Nw
 1VneLLX5RhH4HcDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AA161390C;
 Fri, 20 Jan 2023 12:18:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kniRAXiGymMIFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jan 2023 12:18:00 +0000
Message-ID: <cb48988f-a08b-72a6-fd61-b699cb47178b@suse.de>
Date: Fri, 20 Jan 2023 13:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] fbdev: Remove unused struct fb_deferred_io .first_io
 field
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230120120822.2536032-1-javierm@redhat.com>
 <20230120120822.2536032-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230120120822.2536032-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WiBJJqCEHhufjvr78bYXfsH9"
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WiBJJqCEHhufjvr78bYXfsH9
Content-Type: multipart/mixed; boundary="------------qnsZINDCEcl9MHDtmleRMUyX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Jaya Kumar <jayalk@intworks.biz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <cb48988f-a08b-72a6-fd61-b699cb47178b@suse.de>
Subject: Re: [PATCH 1/3] fbdev: Remove unused struct fb_deferred_io .first_io
 field
References: <20230120120822.2536032-1-javierm@redhat.com>
 <20230120120822.2536032-2-javierm@redhat.com>
In-Reply-To: <20230120120822.2536032-2-javierm@redhat.com>

--------------qnsZINDCEcl9MHDtmleRMUyX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjAxLjIzIHVtIDEzOjA4IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGlzIG9wdGlvbmFsIGNhbGxiYWNrIHdhcyBhZGRlZCBpbiB0aGUgY29tbWl0
IDFmNDVmOWRiYjM5MiAoImZiX2RlZmlvOg0KPiBhZGQgZmlyc3RfaW8gY2FsbGJhY2siKSBi
dXQgaXQgd2FzIG5ldmVyIHVzZWQgYnkgYSBkcml2ZXIuIExldCdzIHJlbW92ZQ0KPiBpdCBz
aW5jZSBpdCdzIHVubGlrZWx5IHRoYXQgd2lsbCBiZSB1c2VkIGFmdGVyIGEgZGVjYWRlIHRo
YXQgd2FzIGFkZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNCkkgdmFndWVseSByZW1lbWJlciB0aGF0
IHRoaXMgd2FzIGltcG9ydGFudCBhdCBzb21lIHBvaW50LiBNYXliZSBiZWZvcmUgDQp0aGUg
YmlnIHJld29yayBvZiB0aGUgcGFnZWxpc3Q/IERvbid0IGtub3c7IGl0J3MgdW51c2VkIG5v
dy4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KDQo+IC0tLQ0KPiANCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVm
aW8uYyB8IDQgLS0tLQ0KPiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgICAg
IHwgMSAtDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4gaW5kZXggYzczMDI1M2FiODVjLi4x
YjY4MDc0MmI3ZjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Yl9kZWZpby5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5j
DQo+IEBAIC0xNTcsMTAgKzE1Nyw2IEBAIHN0YXRpYyB2bV9mYXVsdF90IGZiX2RlZmVycmVk
X2lvX3RyYWNrX3BhZ2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIHVuc2lnbmVkIGxvbmcNCj4g
ICAJLyogcHJvdGVjdCBhZ2FpbnN0IHRoZSB3b3JrcXVldWUgY2hhbmdpbmcgdGhlIHBhZ2Ug
bGlzdCAqLw0KPiAgIAltdXRleF9sb2NrKCZmYmRlZmlvLT5sb2NrKTsNCj4gICANCj4gLQkv
KiBmaXJzdCB3cml0ZSBpbiB0aGlzIGN5Y2xlLCBub3RpZnkgdGhlIGRyaXZlciAqLw0KPiAt
CWlmIChmYmRlZmlvLT5maXJzdF9pbyAmJiBsaXN0X2VtcHR5KCZmYmRlZmlvLT5wYWdlcmVm
bGlzdCkpDQo+IC0JCWZiZGVmaW8tPmZpcnN0X2lvKGluZm8pOw0KPiAtDQo+ICAgCXBhZ2Vy
ZWYgPSBmYl9kZWZlcnJlZF9pb19wYWdlcmVmX2dldChpbmZvLCBvZmZzZXQsIHBhZ2UpOw0K
PiAgIAlpZiAoV0FSTl9PTl9PTkNFKCFwYWdlcmVmKSkgew0KPiAgIAkJcmV0ID0gVk1fRkFV
TFRfT09NOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9s
aW51eC9mYi5oDQo+IGluZGV4IDMwMTgzZmQyNTlhZS4uZGFmMzM2Mzg1NjEzIDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5o
DQo+IEBAIC0yMTUsNyArMjE1LDYgQEAgc3RydWN0IGZiX2RlZmVycmVkX2lvIHsNCj4gICAJ
c3RydWN0IG11dGV4IGxvY2s7IC8qIG11dGV4IHRoYXQgcHJvdGVjdHMgdGhlIHBhZ2VyZWYg
bGlzdCAqLw0KPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIHBhZ2VyZWZsaXN0OyAvKiBsaXN0IG9m
IHBhZ2VyZWZzIGZvciB0b3VjaGVkIHBhZ2VzICovDQo+ICAgCS8qIGNhbGxiYWNrICovDQo+
IC0Jdm9pZCAoKmZpcnN0X2lvKShzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+ICAgCXZvaWQg
KCpkZWZlcnJlZF9pbykoc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCBsaXN0X2hlYWQg
KnBhZ2VsaXN0KTsNCj4gICB9Ow0KPiAgICNlbmRpZg0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------qnsZINDCEcl9MHDtmleRMUyX--

--------------WiBJJqCEHhufjvr78bYXfsH9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPKhncFAwAAAAAACgkQlh/E3EQov+Aa
vA//fuhnEoAEcWGWMQnHwx0j4rnc/dnQY1+Nys5OJX8tDMPx3vQGfdvx5CcCCwIshV0nWY4z2add
xDkOox0VbhgWfrfeqSwQlSxIgsYp/aDJb0aDg59Qo+tMnGoRwK8w7enOqguEB7Szr77OhgR/WA4R
bumztgrsK0HZag0dKZmwlsC1MD6moregjFjdhcMxjWBeZ2hJZAuASzQh4b7/3ZcVEi6SOAAZldim
0vKtP+/6qHCM7sgYCHngmBUi22Xph6fJ9jpdIEtbB1E3sqvzNOWtxbJQH36L2ZjkSpWhPgUR6GvT
IGeoPE8pQ7cQ0XZ4iSh7/0XsPra20/ar+nlFMCLr79iNoqM+48+4jGDHB0wZWEMh2EN+6wqn7/nQ
n78M2W+aRqO18BSuH713rArVc3UyxgtiZTUiftdrSsGtw9twRrxcDKuJR3t+U43zBQAizCGGGqx/
GgnFI/54lErdDmNqQ2AId6K8SmOQ/YE2dhugV2SP/BpARQjwZrejqpxXiomkTer+haos8sE5HbVu
wrAVRnBmFWM0vQSdUNTj84j9PCthoAQUMH5xW2Iz3EXy1wrhkjzkd5/XQfRJWcP6UncCXAs2s+Ae
L84B7rmoeNlVhr1I4xBpBJMQEqI1qspHQ0DmYWDM9o0IJ2xo2SJWf9ibufFlvsrHqXPLLtFfDSGQ
zGE=
=5o0V
-----END PGP SIGNATURE-----

--------------WiBJJqCEHhufjvr78bYXfsH9--
