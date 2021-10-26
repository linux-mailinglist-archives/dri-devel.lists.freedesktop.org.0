Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37943B96F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 20:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8568289E43;
	Tue, 26 Oct 2021 18:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702389DFB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 18:21:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 83EF81FD40;
 Tue, 26 Oct 2021 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635272508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RlzNvBlvWXrnHNZW8wayOcp5aLg6n6BHOqsTUV+jdWo=;
 b=pebB2EKx2Ol0qnQimJY1uxN58jlB6Ypkpis5xsNQ7LJvxsT3HqbUF1vvrJyvSIiVjfqh7K
 LRTwm/I0aBW06ecepfW745H84IoBlagBDwUCiMRd/z4sWIyWAoxD/P4er1cUzPzYuUwtJ9
 TkZDEvQbrMB6RHdJ93ldGc6+g0eftIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635272508;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RlzNvBlvWXrnHNZW8wayOcp5aLg6n6BHOqsTUV+jdWo=;
 b=pmPE68Mzwq+DqopjQcabLiNALiEodPm1MHhVq5aKil/AFymGTM8rhpH9VGq5G1yxuqaOIO
 a3WBryOkjnXMmbDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35E6213EE9;
 Tue, 26 Oct 2021 18:21:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0PCUCzxHeGE3dwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Oct 2021 18:21:48 +0000
Message-ID: <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
Date: Tue, 26 Oct 2021 20:21:47 +0200
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
 boundary="------------KyOHR2H1qiOfizW4J4NUWdmK"
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
--------------KyOHR2H1qiOfizW4J4NUWdmK
Content-Type: multipart/mixed; boundary="------------3L4NCn3SGwkCG00xV9c0n1mD";
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
Message-ID: <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
In-Reply-To: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>

--------------3L4NCn3SGwkCG00xV9c0n1mD
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
b3JnPg0KPiANCj4gDQo+IGJ1aWxkIGxpbms6DQo+IC0tLS0tLS0tLS0tDQo+IGh0dHBzOi8v
YnVpbGRzLnR1eGJ1aWxkLmNvbS8xenpnRlpCR2pwUTVSMGxhd1FGVzlpSjM5SHAvYnVpbGQu
bG9nDQo+IA0KPiBidWlsZCBjb25maWc6DQo+IC0tLS0tLS0tLS0tLS0NCj4gaHR0cHM6Ly9i
dWlsZHMudHV4YnVpbGQuY29tLzF6emdGWkJHanBRNVIwbGF3UUZXOWlKMzlIcC9jb25maWcN
Cg0KTG9va2luZyBhdCB0aGlzIGNvbmZpZywgdGhlcmUgaXM6DQoNCkNPTkZJR19EUk09eQ0K
IyBDT05GSUdfRFJNX0RQX0FVWF9DSEFSREVWIGlzIG5vdCBzZXQNCiMgQ09ORklHX0RSTV9E
RUJVR19NTSBpcyBub3Qgc2V0DQojIENPTkZJR19EUk1fREVCVUdfU0VMRlRFU1QgaXMgbm90
IHNldA0KQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0NCiMgQ09ORklHX0RSTV9MT0FEX0VESURf
RklSTVdBUkUgaXMgbm90IHNldA0KIyBDT05GSUdfRFJNX0RQX0NFQyBpcyBub3Qgc2V0DQpD
T05GSUdfRFJNX0dFTV9DTUFfSEVMUEVSPXkNCkNPTkZJR19EUk1fS01TX0NNQV9IRUxQRVI9
eQ0KDQpHRU1fQ01BX0hFTFBFUiBkZXBlbmRzIG9uIEtNU19IRUxQRVIsIGJ1dCB0aGUgbGF0
dGVyIGlzIGEgbW9kdWxlLiBUaGF0J3MgDQpwcm9iYWJseSB0aGUgY2F1c2Ugb2YgdGhlIHBy
b2JsZW0uIElzIGl0IGludGVudGlvbmFsbHkgc2V0IHRoaXMgd2F5Pw0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiAjIFRvIGluc3RhbGwgdHV4bWFrZSBvbiB5b3VyIHN5c3Rl
bSBnbG9iYWxseQ0KPiAjIHN1ZG8gcGlwMyBpbnN0YWxsIC1VIHR1eG1ha2UNCj4gdHV4bWFr
ZSAtLXJ1bnRpbWUgcG9kbWFuIC0tdGFyZ2V0LWFyY2ggYXJtIC0tdG9vbGNoYWluIGdjYy0x
MQ0KPiAtLWtjb25maWcgbXVsdGlfdjVfZGVmY29uZmlnDQo+IA0KPiAtLQ0KPiBMaW5hcm8g
TEtGVA0KPiBodHRwczovL2xrZnQubGluYXJvLm9yZw0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------3L4NCn3SGwkCG00xV9c0n1mD--

--------------KyOHR2H1qiOfizW4J4NUWdmK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF4RzsFAwAAAAAACgkQlh/E3EQov+Db
7BAAw7hR/bUwBrvSMv+xPuWxdEiYEhB3AcRmKyDFh/G2PEf1x+55nKKCGYdmqYT/TZb/AjR0CVWe
7C3xB5QCpsiE/1gio3lv0rmdUlNRZNXWGHbEkCalPk+pPUlLNJ1Zh0UdRucWeVkx3EPsM//DbMDN
Ort4h73VrcnP3Z7ZlxYG+CErfJBhOCzS5FKLtAtCzhPjp3JC1KNZDBno7ieiz9xctCSLZRwT5hqx
Oq/6mIKxyjyKk/5ZKDXzFQ4cVF+6TY8uItrNWuWAC/tBDnyN+LOEpIugs681SN2/NfGEdH9FGxmv
l9v5oDmk9GzfsWXgX36nzCVtSYPR0S73BY4wLbMN1IsGTPiIoh33OOe+9jyw84yfdYyfKt0M4ZyK
WHOM+52NVoPZk4zdl+iNzzgp7gJDTBmm2UrfOqpJZNiXuIh4RD5R2vD6jYpaeSAYNewoUHngvv6s
DLZwkQVzg59T9m4BDiTNrr9sqO2ZMvgx2SGgw30AYJd0qDT6MEhtOLWgJIYc0PNnJ+gBXEBIiIhH
Jlbny4zH+Z8haxxG6ERvVTHKOBNBXd65FlXcNL2PiDiJjO+AicoedhpWApQYf6RYOvj+ffxv5qbZ
OjUCE/0SIJwHc2PIdcRwJnKnctZfv2uPTGrCQh7p2fV43mdyMGFlV+N5b9sWhyDbKADc7GRjS9/o
Re4=
=FY7p
-----END PGP SIGNATURE-----

--------------KyOHR2H1qiOfizW4J4NUWdmK--
