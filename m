Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871EA473ED9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B8410EA5E;
	Tue, 14 Dec 2021 08:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF56110EA5E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:57:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25E771F3C5;
 Tue, 14 Dec 2021 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639472267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBVXaTQzi3aFuNhCAS93Xtg3l/lTXUZ+o9tXVnxFHu0=;
 b=13w0MmHfjO0/s5TEGeIY6JBlZYCQmMR/kziFGfU3KJYk0lAnynn3HQ80ijus5F9R2P6iFk
 lUNi+i+IPnOkMxO/8iKqS78WEC+b8IVC82ihiFFb8mHQSMzkAA/Th+s2OWkSDuCpgpLovJ
 L205XAm2B6nIy7ITbY5bgBpBe11BscA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639472267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBVXaTQzi3aFuNhCAS93Xtg3l/lTXUZ+o9tXVnxFHu0=;
 b=tsZ8vTlbThY8W+3nbIF3Slr3iy0YlUgteccPRE2nGNU4CBAcq8m5XS1yA2HB0CeGVr+vrw
 Q/kzjz4sVDEvmUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7F4013D54;
 Tue, 14 Dec 2021 08:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7vrEK4pcuGFKIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Dec 2021 08:57:46 +0000
Message-ID: <2f01c8e7-8091-1cdc-6aa3-ce22974575f3@suse.de>
Date: Tue, 14 Dec 2021 09:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH RESEND v4 v4 2/4] drm/vc4: Support nomodeset
Content-Language: en-US
To: Javier Martinez Canillas <javier@dowhile0.org>,
 Maxime Ripard <maxime@cerno.tech>
References: <20211213162635.252582-1-maxime@cerno.tech>
 <20211213162635.252582-3-maxime@cerno.tech>
 <CABxcv=ka4uc0Mt7Yv2RKnSYG74WRP--U1n4PhOjCentGEGkaMg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CABxcv=ka4uc0Mt7Yv2RKnSYG74WRP--U1n4PhOjCentGEGkaMg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3GkFkgprOotwxeUEGL035oBe"
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Dom Cobley <dom@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Frank Rowand <frowand.list@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3GkFkgprOotwxeUEGL035oBe
Content-Type: multipart/mixed; boundary="------------Oozq9K0kXqgmXYUkyTtvDgc7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javier@dowhile0.org>,
 Maxime Ripard <maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Dom Cobley <dom@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Tim Gover
 <tim.gover@raspberrypi.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Message-ID: <2f01c8e7-8091-1cdc-6aa3-ce22974575f3@suse.de>
Subject: Re: [PATCH RESEND v4 v4 2/4] drm/vc4: Support nomodeset
References: <20211213162635.252582-1-maxime@cerno.tech>
 <20211213162635.252582-3-maxime@cerno.tech>
 <CABxcv=ka4uc0Mt7Yv2RKnSYG74WRP--U1n4PhOjCentGEGkaMg@mail.gmail.com>
In-Reply-To: <CABxcv=ka4uc0Mt7Yv2RKnSYG74WRP--U1n4PhOjCentGEGkaMg@mail.gmail.com>

--------------Oozq9K0kXqgmXYUkyTtvDgc7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTIuMjEgdW0gMDk6MzAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIE1heGltZQ0KPiANCj4gT24gTW9uLCBEZWMgMTMsIDIwMjEgYXQg
NToyNiBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3JvdGU6DQo+Pg0K
Pj4gSWYgd2UgaGF2ZSBub21vZGVzZXQgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgd2Ug
c2hvdWxkIGhhdmUgdGhlDQo+PiBmaXJtd2FyZSBmcmFtZWJ1ZmZlciBkcml2ZXIga2VwdCBh
cyBpcyBhbmQgbm90IHRyeSB0byBsb2FkIHRoZQ0KPj4gZnVsbC1ibG93biBLTVMgZHJpdmVy
Lg0KPj4NCj4gDQo+IFBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIEkganVzdCBoYXZlIGEgcXVl
c3Rpb24sIGJ1dCBJJ20gT0sgd2l0aCBlaXRoZXIgd2F5Lg0KPiANCj4gUmV2aWV3ZWQtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4+
IEluIHRoaXMgY2FzZSwgbGV0J3MganVzdCByZWdpc3RlciB0aGUgdjNkIGRyaXZlci4NCj4+
DQo+IA0KPiBJIHdvbmRlciBpZiB0aGUgdjNkIGRyaXZlciBzaG91bGQgYmUgcmVnaXN0ZXJl
ZCBpZiBub21vZGVzZXQgaXMNCj4gcHJlc2VudC4gTW9zdCAoaWYgbm90IGFsbD8pIGRyaXZl
cnMgdGhhdCBjdXJyZW50bHkgY2hlY2sgZm9yIHRoaXMNCj4gcGFyYW1ldGVyIGRpc2FibGUg
Ym90aCBLTVMgYW5kIERSTS4gU28gZXZlbiB3aGVuIGl0IHNlZW1zIHRvIGltcGx5DQo+IHRo
YXQncyBhYm91dCBrZXJuZWwgbW9kZSBzZXR0aW5ncywgaXQgaXMgYWxzbyB1c2VkIHRvIGRp
c2FibGUgRFJNLg0KPiANCj4gVGhpcyBzZW1hbnRpYyB3YXMgbmV2ZXIgZG9jdW1lbnRlZCBh
bmQgSSBhdHRlbXB0ZWQgdG8gZG8gdGhhdCBpbg0KPiBjb21taXQgYjIyYTE1YTVhY2EzICgi
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZTogRG9jdW1lbnQgbm9tb2Rlc2V0DQo+IGtlcm5l
bCBwYXJhbWV0ZXIiKS4gQWZ0ZXIgZmVlZGJhY2sgZnJvbSBmb2xrcyBpbiB0aGUgbGlzdCwg
dGhlIHRleHQNCj4gZW5kZWQgYXMgZm9sbG93czoNCj4gDQo+IGBgYA0KPiBEaXNhYmxlIGtl
cm5lbCBtb2Rlc2V0dGluZy4gRFJNIGRyaXZlcnMgd2lsbCBub3QgcGVyZm9ybQ0KPiBkaXNw
bGF5LW1vZGUgY2hhbmdlcyBvciBhY2NlbGVyYXRlZCByZW5kZXJpbmcuIE9ubHkgdGhlDQo+
IHN5c3RlbSBmcmFtZWJ1ZmZlciB3aWxsIGJlIGF2YWlsYWJsZSBmb3IgdXNlIGlmIHRoaXMg
d2FzDQo+IHNldC11cCBieSB0aGUgZmlybXdhcmUgb3IgYm9vdCBsb2FkZXIuDQo+IA0KPiBV
c2VmdWwgYXMgZmFsbGJhY2ssIG9yIGZvciB0ZXN0aW5nIGFuZCBkZWJ1Z2dpbmcuDQo+IGBg
YA0KPiANCj4gU28gbWF5YmUgdmM0X2RybV9yZWdpc3RlcigpIHNob3VsZCBqdXN0IHJldHVy
biAtRUlOVkFMIGlmDQo+IChkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkpIGxpa2UgdGhl
IG90aGVyIGRyaXZlcnMgZG8/DQoNCkkgc2Vjb25kIHRoaXMgY29tbWVudC4gVGhlIGludGVu
dGlvbiBvZiB0aGlzIHRlc3QgaXMgdG8gZGlzYWJsZSANCkhXLW5hdGl2ZSBkcml2ZXJzIGlm
IHNvbWV0aGluZyBnb2VzIHdyb25nIHdpdGggdGhlIGRpc3BsYXkuDQoNClRoZSBmdW5jdGlv
bidzIG5hbWUgZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpIHJlZmxlY3RzIHRoYXQuIFRo
ZSANCnBhcmFtZXRlciBpcyBjYWxsZWQgbm9tb2Rlc2V0IGZvciBoaXN0b3JpY2FsIHJlYXNv
bnMgYW5kIGl0J3MgcHJvYmFibHkgYSANCnRlcnJpYmxlIG5hbWUuDQoNClNvIEkgdGhpbmsg
dGhlIGNvZGUgc2hvdWxkIGNhbGwgZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpIGF0IHRo
ZSB0b3AgDQphbmQgcmV0dXJuIGFuIGVycm9yIGlzIGl0J3MgdHJ1ZS4gVGhhdCdzIHdoYXQg
d2Ugd2lsbCBkbyBmb3Igb3RoZXIgDQpkcml2ZXJzIGFzIHdlbGwuIE1heWJlIHJhdGhlciBy
ZXR1cm4gLUVOT0RFVjsgRUlOVkFMIG1lYW4gJ2ludmFsaWQgDQphcmd1bWVudCcuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBKYXZpZXIN
Cj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Oozq9K0kXqgmXYUkyTtvDgc7--

--------------3GkFkgprOotwxeUEGL035oBe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG4XIoFAwAAAAAACgkQlh/E3EQov+DI
dRAAnffvIXGSNvSKR99ngRDMXV2StambTW9KHUhoY8A3SFAPbWWCMrV1/OopCrKlxUCYIh4wG+Ov
yAdNAAk/SzXu1+HNxP9VjissqsK6oWSC9M4t9NH0Yh1U43yhbg8RRHFXQct2wygRmLl4oCfApCp/
9dwJA//TWDaCLvE2ES3/94FofnbX0hpWHoU+hyik0wHFqEZgPQpA7VzjxGBAdFEHjE4+AoTIPjTK
E8RnMfExDwVHtKahGYRnDw4TkTZhTekNBjkF++I8OIdYjaKj8a4it8yZMZdTZXNHTrSrVYdNxpNd
aodDWZIKDeu1kZ186csOFM20onZZvpibMT5gNHx5Av+nwcRvQ+Qh7RAZzFtsZZVmMNmaep5NF8hr
A6b+rc8/q1Qgi5g7dmbEWCdAAWCr7oudS4KvXSSsdR7dBzF1r2fmUHy554paPyLB709OvziRTmPi
PmFrUdRLsgVJf6Euz+bE1fQgAYLSE8slMgzPk1INB0seRy9g9v1yIY+poYza0PO0y7bm4xMYCJfp
zYIxo4p0Ak9u3iu15220+aOWiKyKYezqEvUnjXai6Zj4ONUnZ1mDljuwvlAyjDq4jjuXRD+17c9x
Buclnc81B27oMDJ8GG8QK1V8CrsNsT8Rzcur9dysOxdY6HQfbx+mvmrptulVWWe/TZX56Wv3T7kI
qD8=
=ox1+
-----END PGP SIGNATURE-----

--------------3GkFkgprOotwxeUEGL035oBe--
