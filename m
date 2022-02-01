Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6334A59DA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C6D10E6A0;
	Tue,  1 Feb 2022 10:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FF810E6A0;
 Tue,  1 Feb 2022 10:19:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D11D91F383;
 Tue,  1 Feb 2022 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643710795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hy3OkojdDnZ5Xxw9cCiAGLIoflYtHO4YXtnft55JA4Y=;
 b=vSFVaEheZp+BzO7AkZ/eCB4Hkty5WehDjbDBSqUig2EuGp5jfklnhkix3ucVFxSkm5PejY
 cW3Gd2eRe8pvzJk1xFKPaGYCh0HVNZhUmkE2SKlzC1ebIioGn8mRtKttRWW1tUvheJH0zr
 XSgl/xaYvHeiWqQzdeeZVmG6J6EzaNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643710795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hy3OkojdDnZ5Xxw9cCiAGLIoflYtHO4YXtnft55JA4Y=;
 b=7zdoXW+R+wtUda9WNHInel+UAuHXeNVnNrpRkFDnLZB9/nes+DwLzBwuTleAL2ZAjKqwlF
 2M6gMh1gc8MikzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FC8E13B3D;
 Tue,  1 Feb 2022 10:19:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MQoHksJ+WG/CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 10:19:55 +0000
Message-ID: <648ac929-8de9-4ec4-f73d-d1048a419eb9@suse.de>
Date: Tue, 1 Feb 2022 11:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8AKLLWg9udfHxkot3p04zoER"
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
Cc: linux-fbdev@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8AKLLWg9udfHxkot3p04zoER
Content-Type: multipart/mixed; boundary="------------pFSOeLpIPImoieDifLoG2h54";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>
Message-ID: <648ac929-8de9-4ec4-f73d-d1048a419eb9@suse.de>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>

--------------pFSOeLpIPImoieDifLoG2h54
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIyIHVtIDIyOjA1IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gRXZl
ciBzaW5jZSBUb21pIGV4dHJhY3RlZCB0aGUgY29yZSBjb2RlIGluIDIwMTQgaXQncyBiZWVu
IGRlZmFjdG8gbWUNCj4gbWFpbnRhaW5pbmcgdGhpcywgd2l0aCBoZWxwIGZyb20gb3RoZXJz
IGZyb20gZHJpLWRldmVsIGFuZCBzb21ldGltZXMNCj4gTGludXMgKGJ1dCB0aG9zZSBhcmUg
bW9zdGx5IG1lcmdlIGNvbmZsaWN0cyk6DQo+IA0KPiAkIGdpdCBzaG9ydGxvZyAtbnMgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS8gfCBoZWFkIC1uNQ0KPiAgICAgIDM1ICBEYW5pZWwg
VmV0dGVyDQo+ICAgICAgMjMgIExpbnVzIFRvcnZhbGRzDQo+ICAgICAgMTAgIEhhbnMgZGUg
R29lZGUNCj4gICAgICAgOSAgRGF2ZSBBaXJsaWUNCj4gICAgICAgNiAgUGV0ZXIgUm9zaW4N
Cj4gDQo+IEkgdGhpbmsgaWRlYWxseSB3ZSdkIGFsc28gcmVjb3JkIHRoYXQgdGhlIHZhcmlv
dXMgZmlybXdhcmUgZmIgZHJpdmVycw0KPiAoZWZpZmIsIHZlc2FmYiwgLi4uKSBhcmUgYWxz
byBtYWludGFpbmVkIGluIGRybS1taXNjIGJlY2F1c2UgZm9yIHRoZQ0KPiBwYXN0IGZldyB5
ZWFycyB0aGUgcGF0Y2hlcyBoYXZlIGVpdGhlciBiZWVuIHRvIGZpeCBoYW5kb3ZlciBpc3N1
ZXMNCj4gd2l0aCBkcm0gZHJpdmVycywgb3IgY2F1c2VkIGhhbmRvdmVyIGlzc3VlcyB3aXRo
IGRybSBkcml2ZXJzLiBTbyBhbnkNCj4gb3RoZXIgdHJlZSBqdXN0IGRvZXNuJ3QgbWFrZSBz
ZW5zZS4gQnV0IGFsc28sIHRoZXJlJ3MgcGxlbnR5IG9mDQo+IG91dGRhdGVkIE1BSU5UQUlO
RVIgZW50cmllcyBmb3IgdGhlc2Ugd2l0aCBwZW9wbGUgYW5kIGdpdCB0cmVlcyB0aGF0DQo+
IGhhdmVuJ3QgYmVlbiBhY3RpdmUgaW4geWVhcnMsIHNvIG1heWJlIGxldCdzIGp1c3QgbGVh
dmUgdGhlbSBhbG9uZS4NCj4gQW5kIGZ1cnRoZXJtb3JlIGRpc3Ryb3MgYXJlIG5vdyBhZG9w
dGluZyBzaW1wbGVkcm0gYXMgdGhlIGZpcm13YXJlIGZiDQo+IGRyaXZlciwgc28gaG9wZWZ1
bGx5IHRoZSBuZWVkIHRvIGNhcmUgYWJvdXQgdGhlIGZiZGV2IGZpcm13YXJlIGRyaXZlcnMN
Cj4gd2lsbCBnbyBkb3duIGdvaW5nIGZvcndhcmQuDQo+IA0KPiBOb3RlIHRoYXQgZHJtLW1p
c2MgaXMgZ3JvdXAgbWFpbnRhaW5lZCwgSSBleHBlY3QgdGhhdCB0byBjb250aW51ZSBsaWtl
DQo+IHdlJ3ZlIGRvbmUgYmVmb3JlLCBzbyBubyBuZXcgZXhwZWN0YXRpb25zIHRoYXQgcGF0
Y2hlcyBhbGwgZ28gdGhyb3VnaA0KPiBteSBoYW5kcy4gVGhhdCB3b3VsZCBiZSBzaWxseS4g
VGhpcyBhbHNvIG1lYW5zIEknbSBoYXBweSB0byBwdXQgYW55DQo+IG90aGVyIHZvbHVudGVl
cidzIG5hbWUgaW4gdGhlIE06IGxpbmUsIGJ1dCBvdGhlcndpc2UgZ2l0IGxvZyBzYXlzIEkn
bQ0KPiB0aGUgb25lIHdobydzIHN0dWNrIHdpdGggdGhpcy4NCj4gDQo+IENjOiBEYXZlIEFp
cmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPg0KPiBDYzogTGludXggRmJkZXYgZGV2ZWxvcG1lbnQgbGlz
dCA8bGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnPg0KPiBDYzogUGF2ZWwgTWFjaGVrIDxw
YXZlbEB1Y3cuY3o+DQo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+
IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0K
PiBDYzogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
IENjOiBEUkkgRGV2ZWxvcG1lbnQgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+
DQo+IENjOiBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnPg0KPiBDYzogQ2xhdWRpbyBTdWFyZXogPGNzc2tAbmV0LWMuZXM+DQo+IENj
OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPg0KPiBDYzogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gQ2M6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBTdmVuIFNjaG5lbGxlIDxzdmVuc0BzdGFj
a2ZyYW1lLm9yZz4NCj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KDQo+IC0tLQ0KPiAgIE1BSU5UQUlORVJTIHwgNiArKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUw0KPiBpbmRleCBlYTNlNmM5MTQzODQuLjQ5ODA5ZWFhMzA5NiAxMDA2
NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTc1
NzMsNiArNzU3MywxMiBAQCBTOglNYWludGFpbmVkDQo+ICAgVzoJaHR0cDovL2Zsb2F0aW5n
cG9pbnQuc291cmNlZm9yZ2UubmV0L2VtdWxhdG9yL2luZGV4Lmh0bWwNCj4gICBGOglhcmNo
L3g4Ni9tYXRoLWVtdS8NCj4gICANCj4gK0ZSQU1FQlVGRkVSIENPUkUNCj4gK006CURhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gK0Y6CWRyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS8NCj4gK1M6CU9kZCBGaXhlcw0KPiArVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0tbWlzYw0KPiArDQo+ICAgRlJBTUVCVUZGRVIgTEFZRVINCj4g
ICBNOglIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+ICAgTDoJbGludXgtZmJkZXZA
dmdlci5rZXJuZWwub3JnDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------pFSOeLpIPImoieDifLoG2h54--

--------------8AKLLWg9udfHxkot3p04zoER
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5CUoFAwAAAAAACgkQlh/E3EQov+Cd
Tw//d5aZv0Yk1NM6Ke8rHG5R8OOkdhh7eoPXdQNC6o+y6zCAwmT087t69A4x4XS+3AFjMVlPEknC
ysa4Y80jQ82u4ev5YqLLNAwMgmRRLxQbS4OHRtUs+uRFyUUU8EVsbfhcpQ1lOmfpRgg5duLJ6YU/
R01NuHP5s/XrhbOgxrDXMvWoTYRz60XwwaP9HZ5bvbcEqdl9x668hK8SCW34OKg88Bm9NPyOIl/h
oOM8zb/RTgPZph4jkjz8HLRXz5MiDTVZ9NV8Rq6+Uqj9LEi6689wRg0d/5pkL6IjwOqaV6MaoIb4
2VgU3Po8RgML2WNA/Kc+aXS0bwmLhiWvGI2tKtBKOxpvqwfSIEN5AAGt2gUQzOE7A2/adcoP/kP0
SnRSmp4F/WGNEFotmdhfjnmkWjrB7J6MVC1KK30W8Ngdt3ybc4rdrhrMcv1SqJC+IgzNsw0Sx5k+
ffi27WzmwOsOttWwKKJS+sztfpqghQEfWVTG7mXeGoX8LxAY3xaBbqYggehjnA/YsnvHmAHpD9tf
bWP/Bf1Y0fUBA5lqqdLtTwJierCOFl/1ZF4H98KNG1gWlvFzuGSAHT+Uq1lRRoh4u5rqr/UNgZZ2
LPiou+z5iru+0UjBfvKwLNTwvbWl7Rp2/o1xXWwjU9kqxQ0fyATUJTmNfmurMJZ8GLEdREpcv7wi
/AY=
=mIBb
-----END PGP SIGNATURE-----

--------------8AKLLWg9udfHxkot3p04zoER--
