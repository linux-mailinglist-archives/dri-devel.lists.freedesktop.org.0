Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C34B43B8D8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 19:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980FE89F4A;
	Tue, 26 Oct 2021 17:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D02189F4A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 17:59:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E84AE218B1;
 Tue, 26 Oct 2021 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635271180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/IfyzD47ljPw1WkDD65/9cBWHj8bmddldSGi/M6KrnU=;
 b=idiLTSAt6Udp6++x9MUivgkAKlweWBwhdf4UATnPNYS3Se2F0jllhOpuiYG0GqDhdNWTYf
 oqJDqAMpSkWsGRHR7Lh0Da/7rAFZDaCF0ExbXAgg16gW6684SAHPPigO6BF6SiocPtx83P
 icBCNS3hDcgZz+hK6hiZVKWvgrsC/Bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635271180;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/IfyzD47ljPw1WkDD65/9cBWHj8bmddldSGi/M6KrnU=;
 b=z1t6M8V0chQGmRZNI8ZOj8wmVXPLNcRQToWQ5DOyvNeDs0D7bJVBDcxX886OAzktZsV7Sa
 ve28PrkwUZ0zYOCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FC3113EE9;
 Tue, 26 Oct 2021 17:59:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id myQPJgxCeGGCbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Oct 2021 17:59:40 +0000
Message-ID: <b26491f8-66a4-d532-e866-2dc0ecb922d2@suse.de>
Date: Tue, 26 Oct 2021 19:59:40 +0200
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
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tCtkVkBO019eIkSFKj0lZ9Pa"
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
--------------tCtkVkBO019eIkSFKj0lZ9Pa
Content-Type: multipart/mixed; boundary="------------8KOyy6PugOrkxvflSSuljoS7";
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
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <b26491f8-66a4-d532-e866-2dc0ecb922d2@suse.de>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com>
In-Reply-To: <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com>

--------------8KOyy6PugOrkxvflSSuljoS7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMTAuMjEgdW0gMTY6MDEgc2NocmllYiBOYXJlc2ggS2FtYm9qdToNCj4g
T24gTW9uLCAyNSBPY3QgMjAyMSBhdCAxNzo0MywgTmFyZXNoIEthbWJvanUgPG5hcmVzaC5r
YW1ib2p1QGxpbmFyby5vcmc+IHdyb3RlOg0KPj4NCj4+IFJlZ3Jlc3Npb24gZm91bmQgb24g
YXJtIGdjYy0xMSBidWlsdCB3aXRoIG11bHRpX3Y1X2RlZmNvbmZpZw0KPj4gRm9sbG93aW5n
IGJ1aWxkIHdhcm5pbmdzIC8gZXJyb3JzIHJlcG9ydGVkIG9uIGxpbnV4IG5leHQgMjAyMTEw
MjUuDQo+Pg0KPj4gbWV0YWRhdGE6DQo+PiAgICAgIGdpdF9kZXNjcmliZTogbmV4dC0yMDIx
MTAyNQ0KPj4gICAgICBnaXRfcmVwbzogaHR0cHM6Ly9naXRsYWIuY29tL0xpbmFyby9sa2Z0
L21pcnJvcnMvbmV4dC9saW51eC1uZXh0DQo+PiAgICAgIGdpdF9zaG9ydF9sb2c6IDlhZTFm
YmRlYWJkMyAoXCJBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyMTEwMjVc
IikNCj4+ICAgICAgdGFyZ2V0X2FyY2g6IGFybQ0KPj4gICAgICB0b29sY2hhaW46IGdjYy0x
MQ0KPj4gICAgICBjb25maWc6IG11bHRpX3Y1X2RlZmNvbmZpZw0KPj4NCj4+IGJ1aWxkIGVy
cm9yIDoNCj4+IC0tLS0tLS0tLS0tLS0tDQo+PiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIubzogaW4NCj4+IGZ1bmN0aW9uIGBk
cm1fZmJfY21hX2dldF9nZW1fb2JqJzoNCj4+IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21h
X2hlbHBlci5jOjQ2OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvDQo+PiBgZHJtX2dlbV9mYl9n
ZXRfb2JqJw0KPj4gYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9jbWFfaGVscGVyLmM6NDY6DQo+PiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1f
Z2VtX2ZiX2dldF9vYmonDQo+PiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuYzo0NjoNCj4+IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGRybV9nZW1fZmJfZ2V0X29iaicNCj4+IGFybS1saW51eC1nbnVlYWJpaGYtbGQ6IGRy
aXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5vOiBpbg0KPj4gZnVuY3Rpb24gYGRy
bV9mYl9jbWFfc3luY19ub25fY29oZXJlbnQnOg0KPj4gZHJpdmVycy9ncHUvZHJtL2RybV9m
Yl9jbWFfaGVscGVyLmM6MTMzOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvDQo+PiBgZHJtX2F0
b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdCcNCj4+IGFybS1saW51eC1nbnVlYWJpaGYt
bGQ6IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5jOjEzNToNCj4+IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyX25leHQn
DQo+PiBtYWtlWzFdOiAqKiogW01ha2VmaWxlOjEyNTI6IHZtbGludXhdIEVycm9yIDENCj4+
IG1ha2VbMV06IFRhcmdldCAnX19hbGwnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMu
DQo+PiBtYWtlOiAqKiogW01ha2VmaWxlOjIyNjogX19zdWItbWFrZV0gRXJyb3IgMg0KPj4N
Cj4+IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0
QGxpbmFyby5vcmc+DQo+IA0KPiBUaGUgYmlzZWN0aW9uIHNjcmlwdCBwb2ludGVkIHRvIHRo
ZSBmaXJzdCBiYWQgY29tbWl0LA0KPiANCj4gY29tbWl0IDRiMmI1ZTE0MmZmNDk5YTJiZWYy
YjhkYjAyNzJiYmRhMTA4OGEzZmUNCj4gZHJtOiBNb3ZlIEdFTSBtZW1vcnkgbWFuYWdlcnMg
aW50byBtb2R1bGVzDQoNCkNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRoZSBwYXRjaCBhdCBbMV0/
IEl0IGZpeGVzIHRoZSBwcm9ibGVtIGZvciBtZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80NjE0MjYv
DQoNCj4gDQo+PiBidWlsZCBsaW5rOg0KPj4gLS0tLS0tLS0tLS0NCj4+IGh0dHBzOi8vYnVp
bGRzLnR1eGJ1aWxkLmNvbS8xenpnRlpCR2pwUTVSMGxhd1FGVzlpSjM5SHAvYnVpbGQubG9n
DQo+Pg0KPj4gYnVpbGQgY29uZmlnOg0KPj4gLS0tLS0tLS0tLS0tLQ0KPj4gaHR0cHM6Ly9i
dWlsZHMudHV4YnVpbGQuY29tLzF6emdGWkJHanBRNVIwbGF3UUZXOWlKMzlIcC9jb25maWcN
Cj4+DQo+PiAjIFRvIGluc3RhbGwgdHV4bWFrZSBvbiB5b3VyIHN5c3RlbSBnbG9iYWxseQ0K
Pj4gIyBzdWRvIHBpcDMgaW5zdGFsbCAtVSB0dXhtYWtlDQo+PiB0dXhtYWtlIC0tcnVudGlt
ZSBwb2RtYW4gLS10YXJnZXQtYXJjaCBhcm0gLS10b29sY2hhaW4gZ2NjLTExDQo+PiAtLWtj
b25maWcgbXVsdGlfdjVfZGVmY29uZmlnDQo+Pg0KPj4gLS0NCj4+IExpbmFybyBMS0ZUDQo+
PiBodHRwczovL2xrZnQubGluYXJvLm9yZw0KPiANCj4gLSBOYXJlc2gNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------8KOyy6PugOrkxvflSSuljoS7--

--------------tCtkVkBO019eIkSFKj0lZ9Pa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF4QgwFAwAAAAAACgkQlh/E3EQov+BG
Iw/+JTHivG4hZU7vT50hmorrpRLVi03Smcf4MwOcbx07EhFpEpcZqYurS6Cmujuy6L0hACDLW/8h
4l8/y4vZ5TUyohbBlcJRDz8IJNnnTRn+RmccXsLcfdf8upWR45lrsTjmNOmTtAE1/izgvJ3/T1O1
JjFSQtRHWA8hnPzcSnmC7X8SytIEUKgLqQuYLBZjyrvLri/J7Cme43cE1Q1q8bR0kyFfcFG9sRAu
0FS/mOxeRPICg6BJ3pup0nSpXH6bgF4Nt9R4Zk284uS4eVi+1gH3Ao22fj9WStpAsjL4MH4LE3jj
N2DpG/U3aR+u+AT6bElE3w146UHEMUiDIVIWCfSj4j3rYt8ClTKiWqr8N9xcoTb2j4XNLNLd8Zo8
YNQidiCVHDB2kVqmGjWbnrpXPJ9AYZHuiqbiC6i3cpFeauA0AYd/VxTmowTDlNAmR3gcY1tt2rkC
D2PbtrUZksp18kv8tNPmBZN32u1Y8gQvpnTNWsTQRyn3xVjzb5L0JxbtyleyH4KZ+5YQyMVZepRU
AiA8D83emTzgeXw5dalO8F5GuA09mFlhFnx4YEs069wObi02sdbry/izZQGJ/kbQFy1ciKmoUJzh
xwvcrgaLtaLnCZtP6X8Gr7vcZOqYNGKoQEVfc/hfjZynxWrm/lGH/DEpjLDNt3Nw4IxOd0AWvAD9
SPo=
=ex6E
-----END PGP SIGNATURE-----

--------------tCtkVkBO019eIkSFKj0lZ9Pa--
