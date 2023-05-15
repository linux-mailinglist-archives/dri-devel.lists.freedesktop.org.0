Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF41702700
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF2B10E16D;
	Mon, 15 May 2023 08:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89B10E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:17:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE11A21CCD;
 Mon, 15 May 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684138676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEZBXNjkREGViXkJCKCWwF+tgNd+jJejCR3k6ULxrwg=;
 b=CtxaFYMzqweYmEucb/rfLfXGS8oo0XeS9lUTqrxAoIIwAwr/JvoNVZ9+96NWvT+qscISOi
 5CE0qbqiwWCwr1zshzg2SFVYVvPKY9lPzJhbXzrrthez1hHx4bGZ0E1jg7qHHeaNnRiUK7
 /Lxga+8kufwJNfEYCASBnLBAe0Hy1EQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684138676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEZBXNjkREGViXkJCKCWwF+tgNd+jJejCR3k6ULxrwg=;
 b=jlqhnxMMF74OZGktJ2nbt1Ml47r1rSriwlICvT5jJWEh4+bRGbMKxbikE5iwIJ9QCFI6Jh
 pZ2gm6IKz7AW8yCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8F38138E5;
 Mon, 15 May 2023 08:17:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +RT1K7TqYWQvJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 May 2023 08:17:56 +0000
Message-ID: <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
Date: Mon, 15 May 2023 10:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xX28nCpQFYN0W8HNRUNb4rWP"
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xX28nCpQFYN0W8HNRUNb4rWP
Content-Type: multipart/mixed; boundary="------------tU8HY0VDmHNBK0XkZ5cwILue";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: mairacanal@riseup.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com
Message-ID: <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
In-Reply-To: <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>

--------------tU8HY0VDmHNBK0XkZ5cwILue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDUuMjMgdW0gMTA6MDEgc2NocmllYiBMaW51cyBXYWxsZWlqOg0KPiBP
biBGcmksIE1heSAxMiwgMjAyMyBhdCA0OjEx4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4+PiBBbnkgaGludHMgb24gaG93IHdl
IGNhbiBmaXggdGhpcz8NCj4+DQo+PiBBY2NvcmRpbmcgdG8gYSBxdWljayBncmVwIGZvciBm
Yl9icHAsIGl0J3Mgb25seSB1c2VkIGZvciB0aGUgY2FsbCB0bw0KPj4gZHJtX2ZiZGV2X2Rt
YV9zZXR1cCgpLCByaWdodD8gSW4gdGhpcyBjYXNlLCB5b3Ugc2hvdWxkIHNldCBpdCB0byAx
NSBmb3INCj4+IHRoZSBtb2RlbHMgd2l0aG91dCByZ2I1NjUuIFRoZSBzd2l0Y2ggYXQgWzFd
IHNob3VsZCB0aGVuIHBpY2sgdGhlDQo+PiBjb3JyZWN0IHZhbHVlcy4NCj4gDQo+IEkgdHJp
ZWQgdGhpcy4gSXQgZG9lcyB3b3JrIGJldHRlciwgdGhlIHNlbGVjdGVkIGZvcm1hdCBiZWNv
bWVzDQo+IA0KPiAweDM1MzE1MjU4ID0gTEUgJzUnLCAnMScsICdSJywgJ1giID0gJ1gnLCAn
UicsICcxJywgJzUnLCA9DQo+IERSTV9GT1JNQVRfWFJHQjE1NTUuDQoNClRoYXQncyBnb29k
IG5ld3MuDQoNCj4gDQo+IEJ1dCB0aGUgZGlzcGxheSBpcyBmbGlja2VyaW5nIGxpa2UgY3Jh
enkgc28gdGhlIHVwZGF0aW5nIGZyZXF1ZW5jeSBpcw0KPiB0b3RhbGx5IG9mZiwgd2hpY2gg
aXMgYmVjYXVzZSBpdCBkb2VzIG5vdCBzY2FsZSBkb3duIHRoZSByZXNvbHV0aW9uLA0KPiB0
aGUgcHJpbnQgdXNlZCB0byBiZToNCj4gDQo+IENvbnNvbGU6IHN3aXRjaGluZyB0byBjb2xv
dXIgZnJhbWUgYnVmZmVyIGRldmljZSA4MHgzMA0KPiBkcm0tY2xjZC1wbDExMSBjMTAwMDAw
MC5kaXNwbGF5OiBbZHJtXSBmYjA6IHBsMTExZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0K
PiANCj4gSXQgaXMgbm93Og0KPiANCj4gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBm
cmFtZSBidWZmZXIgZGV2aWNlIDEwMHgzNw0KPiBkcm0tY2xjZC1wbDExMSBjMTAwMDAwMC5k
aXNwbGF5OiBbZHJtXSBmYjA6IHBsMTExZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0KPiAN
Cj4gMTAweDM3ISAoaS5lLiA4MDB4Mjk2KSwgdGhpcyBkaXNwbGF5IGNhbiBvbmx5IGRvIDY0
MHgyNDAuDQo+IEFueSBpZGVhIHdoYXQgZWxzZSBpcyBnb2luZyB3cm9uZyBoZXJlPyBPciBp
cyB0aGlzIGFub3RoZXIgcmVncmVzc2lvbg0KPiBvbiB0b3Agb2YgdGhlIGZpcnN0IHJlZ3Jl
c3Npb24gLi4uIEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQNCj4geW91ciBjaGFu
Z2Ugd2FzIG9ubHkgYWJvdXQgZm9ybWF0cyBub3QgcmVzb2x1dGlvbnMuDQoNCklmIHlvdXIg
ZGlzcGxheSBvbmx5IHN1cHBvcnRzIDY0MHgyNDAsIHlvdSBzaG91bGQgZmlsdGVyIG91dCBh
bGwgdGhlIA0Kb3RoZXIgbW9kZXMgaW4gdGhlIGRyaXZlciwgaWYgbmVjZXNzYXJ5LiBUbyBt
ZSwgdGhhdCBzZWVtcyBmaXgtd29ydGh5IGluIA0KYW55IGNhc2UuDQoNCkl0J3MgaW1wb3J0
YW50IHRoYXQgdGhlIGtlcm5lbCdzIGNvbnNvbGUgaXMgYWx3YXlzIGF2YWlsYWJsZS4gV2Ug
aGFkIA0KcmVwb3J0cyB3aGVyZSB0aGUgZGlzcGxheSByZW1haW5lZCBkYXJrLCB3aGljaCBp
cyBub3QgYWNjZXB0YWJsZSBmb3IgdGhlIA0KY29uc29sZS4gVGhlcmVmb3JlIG91ciBmYmRl
diBoZWxwZXJzIG5vdyB0cnkgaGFyZGVyIHRvIGEgZmluZCBhIHdvcmtpbmcgDQpkaXNwbGF5
IHNldHVwLiBJdCBjb3VsZCBiZSB0aGF0IHRoaXMgaW50ZXJmZXJlcyB3aXRoIHlvdXIgZHJp
dmVyIHNvbWVob3cuDQoNCkFzIHlvdSBzYXksIHRoaXMgcGF0Y2ggaXMgb25seSBhYm91dCBz
ZWxlY3RpbmcgYSBjb2xvciBmb3JtYXQuIFRoZXJlJ3MgDQpwcm9iYWJseSBhbm90aGVyIHJl
Z3Jlc3Npb24gZWxzZXdoZXJlLg0KDQpDYW4geW91IHRyeSB0byBiaXNlY3QgYWdhaW4gd2l0
aCB5b3VyIGN1cnJlbnQgZml4IG9uIHRvcD8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------tU8HY0VDmHNBK0XkZ5cwILue--

--------------xX28nCpQFYN0W8HNRUNb4rWP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRh6rMFAwAAAAAACgkQlh/E3EQov+Do
oQ/9GTEhz8w5tBbsCGuCat5wmhGgdL/AJB+Dy/0c03P7kWNuHyiNRD52SBBC6M0baBWUrb7TBV7u
lQXRJukEE6oc+pexJml7QgVtA5yr/8i5hdrOv+QraXCfax1C6Ut5mllMNCbttn9R6NRF0+zjux9t
/tlx7eiNtfbecBNhbcvct8w/HrPM1hL7rMkSw8qSE3LYqY2pKW7VFvGhLzFgrjKJOC8FMhZ31p3V
EwmzC3gLZYsOSaxSvn1nmYrQ74SeLwy3Nxkf+5MP1T3oYkFhsW2XQgCgWOt6AasJgKB4jcQT6GLV
Vty9+LEzczxTa1XfG1sRcTQsIvCRPnIts7AeuZOT6OewnpwiGzCK0FOq9fkRJ+Gq6P5D/VnMS4o+
cbCSW6WzMO6ZnpSKno/ivErRnts/j+arnuR8hceBNTMwBVPsGVtfRJ5ZxIE5aMqC8sR+AxQ568FU
JxtIRU2ZJ6xUGgv68KX2rYH1XvTO7O/EOMWMvhoyBiu1hiPSSrOElA/+9ZYTLQWIdy8IdN6y8qKz
2i2bsxk8QRFnh4DHfqUqRStb+jHlw6QSZABHLds6HiBGSqGToKIyZ3ao+rN3X46eQzHY6zh37sZI
aygG9yL9xRgcRlHD0Q2tKkhgg6aPwaL6sOyCMTv/7zisbfLk1uY/fE8Dv4SWG1rK4pfH0ksQQoRb
pTo=
=4r4d
-----END PGP SIGNATURE-----

--------------xX28nCpQFYN0W8HNRUNb4rWP--
