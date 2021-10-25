Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA6439E75
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 20:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A96E1BC;
	Mon, 25 Oct 2021 18:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0166E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 18:25:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 748ED21956;
 Mon, 25 Oct 2021 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635186310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=68kswlC3q0FUF/Hj38t4b98bMYI1PGEm0MHAl9dIp7s=;
 b=gXT4TnwlNEhE2p+H5FZ4DGHTKrP73j7MwoGnp5k9lskIgr2XFrOV2dGl1Rk4U1MXp8MXVf
 lYUDinoLAzLKxF0MkYunV34Z8/awety+F+Q0NJUOpDMY8lYAsE8NcYVauR77hQAplWrEzw
 Ii2a+fNDRj+t5QVS/d9Lq7sVubA62Zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635186310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=68kswlC3q0FUF/Hj38t4b98bMYI1PGEm0MHAl9dIp7s=;
 b=c+pFhYOAQU68NsG5S9LMkIULGn+U/stBgI5PxdDOIgEFoUG4lXBSNPQBEPEsg8tWW51t9N
 k42lSds087ADoUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B85213AC1;
 Mon, 25 Oct 2021 18:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZdleCYb2dmGEaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Oct 2021 18:25:10 +0000
Message-ID: <a4fa7270-1f24-6046-6703-20000787db32@suse.de>
Date: Mon, 25 Oct 2021 20:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uk0P3VwLSZ1LhnmSAn709Qp0"
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
--------------uk0P3VwLSZ1LhnmSAn709Qp0
Content-Type: multipart/mixed; boundary="------------9rNg3heN4gLRoaGh1tK59GqO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
Message-ID: <a4fa7270-1f24-6046-6703-20000787db32@suse.de>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
In-Reply-To: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>

--------------9rNg3heN4gLRoaGh1tK59GqO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMTAuMjEgdW0gMTQ6MTMgc2NocmllYiBOYXJlc2ggS2FtYm9qdToNCj4g
UmVncmVzc2lvbiBmb3VuZCBvbiBhcm0gZ2NjLTExIGJ1aWx0IHdpdGggbXVsdGlfdjVfZGVm
Y29uZmlnDQo+IEZvbGxvd2luZyBidWlsZCB3YXJuaW5ncyAvIGVycm9ycyByZXBvcnRlZCBv
biBsaW51eCBuZXh0IDIwMjExMDI1Lg0KPiANCj4gbWV0YWRhdGE6DQo+ICAgICAgZ2l0X2Rl
c2NyaWJlOiBuZXh0LTIwMjExMDI1DQo+ICAgICAgZ2l0X3JlcG86IGh0dHBzOi8vZ2l0bGFi
LmNvbS9MaW5hcm8vbGtmdC9taXJyb3JzL25leHQvbGludXgtbmV4dA0KPiAgICAgIGdpdF9z
aG9ydF9sb2c6IDlhZTFmYmRlYWJkMyAoXCJBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxl
cyBmb3IgMjAyMTEwMjVcIikNCj4gICAgICB0YXJnZXRfYXJjaDogYXJtDQo+ICAgICAgdG9v
bGNoYWluOiBnY2MtMTENCj4gICAgICBjb25maWc6IG11bHRpX3Y1X2RlZmNvbmZpZw0KPiAN
Cj4gYnVpbGQgZXJyb3IgOg0KPiAtLS0tLS0tLS0tLS0tLQ0KPiBhcm0tbGludXgtZ251ZWFi
aWhmLWxkOiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIubzogaW4NCj4gZnVu
Y3Rpb24gYGRybV9mYl9jbWFfZ2V0X2dlbV9vYmonOg0KPiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2NtYV9oZWxwZXIuYzo0NjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0KPiBgZHJtX2dl
bV9mYl9nZXRfb2JqJw0KPiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2NtYV9oZWxwZXIuYzo0NjoNCj4gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
ZHJtX2dlbV9mYl9nZXRfb2JqJw0KPiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuYzo0NjoNCj4gdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgZHJtX2dlbV9mYl9nZXRfb2JqJw0KPiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIubzogaW4NCj4gZnVuY3Rpb24gYGRy
bV9mYl9jbWFfc3luY19ub25fY29oZXJlbnQnOg0KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2NtYV9oZWxwZXIuYzoxMzM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8NCj4gYGRybV9hdG9t
aWNfaGVscGVyX2RhbWFnZV9pdGVyX2luaXQnDQo+IGFybS1saW51eC1nbnVlYWJpaGYtbGQ6
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5jOjEzNToNCj4gdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfbmV4dCcNCj4g
bWFrZVsxXTogKioqIFtNYWtlZmlsZToxMjUyOiB2bWxpbnV4XSBFcnJvciAxDQo+IG1ha2Vb
MV06IFRhcmdldCAnX19hbGwnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IG1h
a2U6ICoqKiBbTWFrZWZpbGU6MjI2OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+IA0KPiBSZXBv
cnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8u
b3JnPg0KDQpUaGF0J3MgcHJvYmFibHkgZnJvbSBtb3Zpbmcgc29tZSBvZiB0aGUgZnVuY3Rp
b25zIGludG8gc2VwYXJhdGUgbW9kdWxlcy4gDQpXaWxsIGJlIGZpeGVkIHNvb24uDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiBidWlsZCBsaW5rOg0KPiAtLS0tLS0t
LS0tLQ0KPiBodHRwczovL2J1aWxkcy50dXhidWlsZC5jb20vMXp6Z0ZaQkdqcFE1UjBsYXdR
Rlc5aUozOUhwL2J1aWxkLmxvZw0KPiANCj4gYnVpbGQgY29uZmlnOg0KPiAtLS0tLS0tLS0t
LS0tDQo+IGh0dHBzOi8vYnVpbGRzLnR1eGJ1aWxkLmNvbS8xenpnRlpCR2pwUTVSMGxhd1FG
VzlpSjM5SHAvY29uZmlnDQo+IA0KPiAjIFRvIGluc3RhbGwgdHV4bWFrZSBvbiB5b3VyIHN5
c3RlbSBnbG9iYWxseQ0KPiAjIHN1ZG8gcGlwMyBpbnN0YWxsIC1VIHR1eG1ha2UNCj4gdHV4
bWFrZSAtLXJ1bnRpbWUgcG9kbWFuIC0tdGFyZ2V0LWFyY2ggYXJtIC0tdG9vbGNoYWluIGdj
Yy0xMQ0KPiAtLWtjb25maWcgbXVsdGlfdjVfZGVmY29uZmlnDQo+IA0KPiAtLQ0KPiBMaW5h
cm8gTEtGVA0KPiBodHRwczovL2xrZnQubGluYXJvLm9yZw0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------9rNg3heN4gLRoaGh1tK59GqO--

--------------uk0P3VwLSZ1LhnmSAn709Qp0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF29oUFAwAAAAAACgkQlh/E3EQov+Cd
3w//RSWAUoNW6NTcnde5TvhX9i8je1zhhVt0ZhSfx039/4n247YQrpPmUviTa399RnhOrpVmjWOg
v1oNHnzcOYQyQT/XLxduvgQOQgXfd02RgM2AX/s0+1OIGgR+KN8BJglIAGK28wvDDIa/2y4DA7Hk
qD1hx1ffMsAP4XephZ/ohRrvoG91ZSS3htCEJjqC6PY7oM6zJl4kmZlSjxYzsoyXhcrnSCJaPm6m
91nCG/UdQWeCGrYxMy8cvX1rOhOjPl2vV0DO4Jz4A8lGxiCAmeQHCIu2837Vrpjp4V/i6jB5pKMt
E1XxwrR7+jpCekeKYe+w8RhoWcnGrvnt87nQlmeDtmJ53cQpkOpjsWYXkG8uyDDGeUgypc2aadu+
/scw9+TSNlmd6uMDursQ+Zvdzqh4WtW6k3Mlr3eWWF3fU3CesV14flX1oK9PMfScJJR2Pw2NJff9
sQLURvMO1OZ8LgOyqUE0zXxPXiqsQDOinrmOb/kjqBs/O5ASmknW+DV4GSsw+HSVpNbz8Gd6Q3xh
XpsccDdq3+m70WFjwF51xeSzARGsC/NnD96XPEQpwvVpMagKge4976NBOjKFd+y8L4rSBRJZPBU5
QuOI/Buun99y/Uj4GqYh66YZrWYEQfoT2LeGtuNmMsV1lOa3ksRvhEjJcueilmNFZ7ANyUpsQeP5
DVw=
=riVG
-----END PGP SIGNATURE-----

--------------uk0P3VwLSZ1LhnmSAn709Qp0--
