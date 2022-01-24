Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267714983BC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6F910E1E5;
	Mon, 24 Jan 2022 15:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7B610E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:45:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBDFD21996;
 Mon, 24 Jan 2022 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643039107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RjA/80OqKTnpvG+7iaVvyP9DqrW+0KIpdaVg1ap2eOE=;
 b=2TCwQzFJJnx3al7jo0+FElkT1uyARf4BEAwT9wgQ7eIykP6Rlptr1faEj7t3+vHroXxPHE
 Odmy3kJt9Ev/0iJbP3ok6/YTgbkFDu/2hMlrIbv7UL1SHqiaQ2Y2e9uzNDUcuf6NYgE5e2
 QrywRykpn7r0o/whMri62uyokOhLgh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643039107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RjA/80OqKTnpvG+7iaVvyP9DqrW+0KIpdaVg1ap2eOE=;
 b=2YAZo15gi+QAyPzuy2ECKu0ZRsf4JS1zT6QReLFoj9Gca5bVqL+ljqhdHE1mXkgoJBFsaP
 vHPpSng/5bjp76Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69FD713C28;
 Mon, 24 Jan 2022 15:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CTs9GIPJ7mGNJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 15:45:07 +0000
Message-ID: <6b41c8cf-8ab6-7224-8af2-c8c77a6f5d3b@suse.de>
Date: Mon, 24 Jan 2022 16:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
 <2fc200bb-4b40-7833-31c9-90a78512b601@redhat.com>
 <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IeSeuErc0VVP0phaSXoIJUST"
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Pavel Machek <pavel@ucw.cz>, Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IeSeuErc0VVP0phaSXoIJUST
Content-Type: multipart/mixed; boundary="------------gPnb1oZ4LzJSJF0ihXEV4I8o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Pavel Machek <pavel@ucw.cz>, Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <6b41c8cf-8ab6-7224-8af2-c8c77a6f5d3b@suse.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
 <2fc200bb-4b40-7833-31c9-90a78512b601@redhat.com>
 <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
In-Reply-To: <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>

--------------gPnb1oZ4LzJSJF0ihXEV4I8o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjIgdW0gMTY6Mjkgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDEvMjQvMjIgMTI6NTAsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+IE9u
IDEvMjQvMjIgMTI6MzMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4NCj4+IFtzbmlw
XQ0KPj4NCj4+Pj4gVGhvdWdodHM/DQo+Pj4NCj4+PiBJIGNhbid0IHNheSBJIGFwcHJvdmUg
a2VlcGluZyBmYmRldiBhbGl2ZSwgYnV0Li4uDQo+Pj4NCj4+PiBXaXRoIGZiZGV2IGVtdWxh
dGlvbiwgZXZlcnkgRFJNIGRyaXZlciBpcyBhbiBmYmRldiBkcml2ZXIgdG9vLiBTbw0KPj4+
IENPTkZJR19GQl9EUklWRVIgaXMgc29tZXdoYXQgbWlzbGVhZGluZy4gQmV0dGVyIGFkZCBh
biBvcHRpb24gbGlrZQ0KPj4+IENPTkZJR19GQkNPTl9IV19TQ1JPTExJTkcgYW5kIGhhdmUg
aXQgc2VsZWN0ZWQgYnkgdGhlIGZiZGV2IGRyaXZlcnMgdGhhdA0KPj4+IGFic29sdXRlbHkg
bmVlZCBIVyBhY2NlbGVyYXRpb24uIFRoYXQgb3B0aW9uIHdvdWxkIHRoZW4gcHJvdGVjdCB0
aGUgcnNwDQo+Pj4gY29kZS4NCj4gDQo+IEknbSBub3QgYSBmYW4gb2Ygc29tZXRoaW5nIGxp
a2UgQ09ORklHX0ZCQ09OX0hXX1NDUk9MTElORywgYnV0IEknbSBub3QNCj4gYWdhaW5zdCBp
dCBlaXRoZXIuDQo+IEZvciBtZSBpdCBzb3VuZHMgdGhhdCB0aGlzIGlzIG5vdCB0aGUgcmVh
bCBkaXJlY3Rpb24geW91IHdhbnQgdG8gZ28sDQo+IHdoaWNoIGlzIHRvIHByZXZlbnQgdGhh
dCBhbnkgb3RoZXIgZHJpdmVycyB0YWtlIHRoZSBmcmFtZWJ1ZmZlciBiZWZvcmUNCj4geW91
IHRha2UgaXQgd2l0aCBzaW1wbGVkcm0gb3Igc2ltaWxpYXIuDQo+IENPTkZJR19GQkNPTl9I
V19TQ1JPTExJTkcgSU1ITyBqdXN0IGRpc2FibGVzIHRoZSAoZnJvbSB5b3VyIFBPVikgbmVn
bGVjdGFibGUgYWNjbGVyYXRpb24gcGFydC4NCj4gV2l0aCBhbiBvcHRpb24gbGlrZSBDT05G
SUdfRkJfRFJJVkVSIChtYXliZSBiZXR0ZXI6IENPTkZJR19GQl9MRUdBQ1lfRFJJVkVSUykN
Cj4gaXQncyBhbiBlYXN5IG9wdGlvbiBmb3IgZGlzdHJvcyB0byBkaXNhYmxlIGFsbCBvZiB0
aGUgbGVnYWN5IGRyaXZlcnMNCj4gZnJvbSBiZWluZyBidWlsdCAmIHNoaXBwZWQuDQoNClRo
ZXNlIGRyaXZlcnMgaGF2ZSBiZWVuIGRpc2FibGVkIGJ5IG1vc3QgZGlzdHJvcyBhIGxvbmcg
dGltZSBhZ28uIFRob3NlIA0KdGhhdCBzdGlsbCByZW1haW4gYXJlIHRoZSBnZW5lcmljLCBz
b29uIHRvIGJlIHJlcGxhY2VkLCBvbmVzOyBhbmQgDQpkcml2ZXJzIGZvciBuaWNoZSBhcmNo
aXRlY3R1cmVzIHdoZXJlIG5vIERSTS1iYXNlZCByZXBsYWNlbWVudCBleGlzdHMuDQoNCklm
IEkgcnVuIERSTSB3aXRoIGZiZGV2IGVtdWxhdGlvbiwgSFcgc2Nyb2xsaW5nIGlzIHVudXNl
ZCwgcG9zc2libHkgDQpidWdneSwgYW5kIEknZCB3YW50IHRvIG5vdCBidWlsdCBpdCBpZiBw
b3NzaWJsZS4gSSBndWVzcyB0aGF0J3Mgd2hhdCANCm1vc3QgZGlzdHJvcyB3b3VsZCB3YW50
IGFzIHdlbGwuIFRoYXQncyB0aGUgdXNlIGNhc2UgZm9yIEZCQ09OX0hXX1NDUk9MTElORy4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------gPnb1oZ4LzJSJF0ihXEV4I8o--

--------------IeSeuErc0VVP0phaSXoIJUST
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHuyYIFAwAAAAAACgkQlh/E3EQov+Az
SA//Yl/UY00KzpZCWws1qNJy9HqODzkgFTdiLp74CpcBlnaYYRqu0OVBYEeWpyv3SyXj4hEF1Jjl
ltAgNpgskoU6Nuxw1geABqqqmVAj4xFSorto3ieJsImx1PfVorwqGcRH4lZE+mtQigvRfjYfwEOf
ZVItvKQYNKAFx42XLbpHMZsvsgP9KwbmCU0pH68GZ4aIDevICeyNj8da9kQvKF1gLBE0ZlLc3svp
lWQ/eST2gCrK9J/VEZ2G2C3WEqZFiyFSaDXSU8IMuZ2tke/awK/k21a6vev342wxKw+2qb+ct+tf
Ica3Y/gU6Ds8aCtP4rosx4lU0i1Rv1+z7K+YgXC8gCBZVJfjXt7DSaNB1UXUgDyetqHub5nt5W/T
TIKRMQFF1IAvGYpMwJN3Al4DpcmOQzCOaHdOUxABIVsGgq/+ONLuKzcJZf5vWkY2DHfGwA+m0yV/
Sofi8pflDvIVtjkL4iXDgPAIwiM3EnWqqbEJCkuLq+exEnl4NPnuV+mfBviJfhsMivONRTqCjr8D
jLS8xrxsxPgToWruKg6hZRTrcpQMOAIO4P+HqjcPT2PQ02PfhCQ606wjSiqPfjo67Y/9PRgKU94L
UXcYKuPJMoQGIY5QBtrHWbePXSN65HBFx9ZYsfN8x8Na7PQYhZNjlFFsm2q4xYp3jlnJtkv9Lcxb
zx8=
=YaJW
-----END PGP SIGNATURE-----

--------------IeSeuErc0VVP0phaSXoIJUST--
