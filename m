Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570425EA6C2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FEE10E6A6;
	Mon, 26 Sep 2022 13:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCA610E6A3;
 Mon, 26 Sep 2022 13:02:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B958321E33;
 Mon, 26 Sep 2022 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664197377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MT2Be4s7H7Cf1iKKuGB5u2tX1z99wlvHFDw8JE0Ktgs=;
 b=UgN9+wXm5InDVAppBXWjV5XDPyX73h/bzd/K8pof6d0qkqqPdL8B+n5gN2lwvqYTCek4Q7
 yoyGvZ3Ruu94Nt4Ik5/eGKVhhagnvZfFBi1CZj5K6+gvU29r0nLMNdEJCga6GtesKRlOQx
 IJ7B3fZsMnJMwSKi8+TDHRyZtkt8zBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664197377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MT2Be4s7H7Cf1iKKuGB5u2tX1z99wlvHFDw8JE0Ktgs=;
 b=xkhoRsvEK9y2ZToD8jzmFvb8V7/TitPaSiZDZCE6tZG3l7W9WvP2m/1XHxJZjL6Rayq4pG
 DWIM0AixbK2WCiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8F9713486;
 Mon, 26 Sep 2022 13:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gKkYNwCjMWN5YAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 13:02:56 +0000
Message-ID: <fb2dcbdd-057b-c3e6-0be7-3a8ee5822d4d@suse.de>
Date: Mon, 26 Sep 2022 15:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <20220926101716.urehomr2lzv5pqln@houat>
 <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
 <c714b53d-8e18-9105-9e27-8b783f246082@suse.de>
 <20220926124259.o6fcfnxjy7gyzqz2@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220926124259.o6fcfnxjy7gyzqz2@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VIX17lF7ne9Z5J5x4Xtg52tI"
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VIX17lF7ne9Z5J5x4Xtg52tI
Content-Type: multipart/mixed; boundary="------------lTRY2DgwgxL7uejtpBvwWUwq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fb2dcbdd-057b-c3e6-0be7-3a8ee5822d4d@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <20220926101716.urehomr2lzv5pqln@houat>
 <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
 <c714b53d-8e18-9105-9e27-8b783f246082@suse.de>
 <20220926124259.o6fcfnxjy7gyzqz2@houat>
In-Reply-To: <20220926124259.o6fcfnxjy7gyzqz2@houat>

--------------lTRY2DgwgxL7uejtpBvwWUwq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjIgdW0gMTQ6NDIgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBNb24sIFNlcCAyNiwgMjAyMiBhdCAwMToxNzo1MlBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjYuMDkuMjIgdW0gMTI6MzQgc2Nocmll
YiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+Pj4gSGkgTWF4aW1lLA0KPj4+DQo+Pj4gT24gTW9u
LCBTZXAgMjYsIDIwMjIgYXQgMTI6MTcgUE0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5v
LnRlY2g+IHdyb3RlOg0KPj4+PiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAxMTowNTo0OEFN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4+PiArICAgLyogNjMuNTU2
dXMgKiAxMy41TUh6ID0gODU4IHBpeGVscyAqLw0KPj4+Pj4NCj4+Pj4+IEkga2luZCBvZiBn
ZXQgd2hhdCB0aGUgY29tbWVudCB3YW50cyB0byB0ZWxsIG1lLCBidXQgdGhlIHVuaXRzIGRv
bid0IGFkZCB1cC4NCj4+Pj4NCj4+Pj4gSSdtIG5vdCBzdXJlIGhvdyBpdCBkb2Vzbid0IGFk
ZCB1cD8NCj4+Pj4NCj4+Pj4gV2UgaGF2ZSBhIGZyZXF1ZW5jeSBpbiBIeiAoZXF1aXZhbGVu
dCB0byBzXi0xKSBhbmQgYSBkdXJhdGlvbiBpbiBzLCBzbw0KPj4+PiB0aGUgcmVzdWx0IGVu
ZHMgdXAgd2l0aCBubyBkaW1lbnNpb24sIHdoaWNoIGlzIHRvIGJlIGV4cGVjdGVkIGZvciBh
DQo+Pj4+IG51bWJlciBvZiBwZXJpb2RzPw0KPj4+DQo+Pj4gVG8gbWFrZSB0aGUgdW5pdHMg
YWRkIHVwLCBpdCBzaG91bGQgYmUgMTMuNSBNcGl4ZWwvcw0KPj4+ICh3aGljaCBpcyB3aGF0
IGEgcGl4ZWwgY2xvY2sgb2YgMTMuNSBNSHogcmVhbGx5IG1lYW5zIDstKQ0KPj4NCj4+IFNv
cnQgb2YuIEl0IGxlYXZlcyB0aGUgdGltZSB2YWx1ZSBhcyBhIG1hZ2ljIG51bWJlciwgd2hp
Y2ggb2JmdXNjYXRlcyB3aGF0J3MNCj4+IGhhcHBlbmluZy4NCj4+DQo+PiBUaGUgdW5pdCBm
b3IgaHRvdGFsIGlzIHBpeGVscy9zY2FubGluZSBiZWNhdXNlIGlmIHlvdSBtdWx0aXBseSBp
dCB3aXRoIHRoZQ0KPj4gbnVtYmVyIG9mIHNjYW5saW5lcyBwZXIgZnJhbWUgKHdoaWNoIGlz
IGluIHZ0b3RhbCksIHlvdSBnZXQgcGl4ZWxzL2ZyYW1lLg0KPj4gTXVsdGlwbHlpbmcgd2l0
aCB0aGUgZnJhbWVzIHBlciBzZWNvbmQgcmVzdWx0cyBpbiB0aGUgcGl4ZWwgY2xvY2sgaW4N
Cj4+IHBpeGVscy9zZWNvbmQuDQo+IA0KPiBUaGF0J3MgdHJ1ZSwgYnV0IGJvdGggYXJlIHRy
dWU/DQoNCkknbSBub3QgcXVpdGUgc3VyZSB3aGF0IHlvdSBtZWFuLiBJIHRyaWVkIHRvIHNh
eSB0aGF0IHRoaXMgbWFnaWMgdGltZSANCnZhbHVlIG1ha2VzIGFsbCB0aGlzIGhhcmQgdG8g
c2VlLg0KDQo+IA0KPj4gVGhhdCdzIGEgYml0IG11Y2ggZm9yIHRoaXMgY29tbWVudC4gSGVu
Y2UsIEkgc3VnZ2VzdGVkIHRvIHJlbW92ZSB0aGVzZQ0KPj4gY29tbWVudHMgZW50aXJlbHkg
YW5kIGRvY3VtZW50IHRoZSByZWxhdGlvbiBhbW9uZyB0aGUgbnVtYmVycyBpbiBhIG1vcmUN
Cj4+IHByb21pbmVudCBsb2NhdGlvbi4gVGhlIGRvY3VtZW50YXRpb24gZm9yIGRybV9kaXNw
bGF5X21vZGUgd291bGQgYmUgYSBnb29kDQo+PiBwbGFjZSwgSSBndWVzcy4NCj4gDQo+IEkn
bSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBpdCdzIGFib3V0LiBJdCdzIGFuIGV4cGxp
Y2l0IHJlcXVpcmVtZW50DQo+IG9mIFBBTCBhbmQgTlRTQywgd2h5IHdvdWxkIHNvbWV0aGlu
ZyBzbyBzcGVjaWZpYyBiZSBpbiB0aGUgZ2VuZXJpYw0KPiBkZWZpbml0aW9uIG9mIGRybV9k
aXNwbGF5X21vZGU/DQoNCk5vdCBqdXN0IFRWIHNpZ25hbHMsIGl0J3MgdGhlIGNhc2UgZm9y
IGFsbCBkaXNwbGF5cyB3ZXJlIHdlIGNvbnRyb2wgdGhlIA0KZWxlY3Ryb24gYmVhbSBpbiBz
b21lIHdheSAoVkdBKS4gU3VjaCBkb2N1bWVudGF0aW9uIGNvdWxkIHRoZXJlZm9yZSBiZSAN
CmFkZGVkIHRvIERSTSBpbiBhbiBhcHByb3ByaWF0ZSBwbGFjZS4gVGhhdCBtYWtlcyBpdCBl
YXNpZXIgZm9yIG5ld2NvbWVycyANCnRvIHNlZSB3aHkgY2VydGFpbiBtb2RlcyBhcmUgZGVm
aW5lZCB0aGUgd2F5IHRoZXkgYXJlLiAoQXQgZmlyc3QsIA0KZGlzcGxheSBtb2RlcyBjYW4g
bG9vayBsaWtlIHRoZXkgYXJlIG1hZGUgdXAgcmFuZG9tbHkuKQ0KDQpGb3IgeW91ciB0ZXN0
IGNhc2VzLCBtYXliZSBzaW1wbHkgcmVmZXIgdG8gdGhlIHJlbGV2YW50IHN0YW5kYXJkIGRv
Y3VtZW50cy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gTWF4aW1lDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------lTRY2DgwgxL7uejtpBvwWUwq--

--------------VIX17lF7ne9Z5J5x4Xtg52tI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxowAFAwAAAAAACgkQlh/E3EQov+Dp
2A/9FTzIBdYwbm4jm+v2I6UH+a+l8ZxwlaEV5t7dSN6faOFpdI+hTsdMxbxF16xyUqyle3KcWzvs
2BV5jFLa+SeZLktkzfvIunf9xZ6T+wgH2l5HvGPJJv+7BWwxaVLtFPD9Vhs4vYh7IFsU7Uk3Uvcl
RTkscFgaYXrQTUtaK98ckUR7V7J0wNnoZc57rvZk8kaJWxRI0g8tTN4mQrXXM6kMl4votVOFKWXr
OgMBSKGjIqHBO2jmxdLCsOPE4SijlxFDYuUcM5RUk1N67CEjbG2oImO5SRJa5P5utJ7iSZdNt2jA
TnUfQ8Cu23FjT94hvYfM4gNWWtTQsSpKcQq9UHVatnSoN0ybjzmIjkWOA/MkeQLRqwVWUMn7R6eQ
c++m3vx5CD5VVzgRVZpcv2Y7b0K76EBTxa8WYW4PxQFNsL/f9QOkvJVh2Y8y0VnBpGQ+co5m+iv+
W2PY6lmelCjcdxcgYTSwwPR6bxjfgjDhmcHIn4mI9LOoKqlt7DjMQNjpqiqRlE9YG2raIXPrWcv8
k4rSyUtGXGUEebhnGkpH91RVelBl7QYl+PGio3aqM2A21pCuK2WFJ4bmSwO2uR+b7RtlUgaTLuj7
tiPZVRE6h+jXRsuiGy41jkP07nv2EAHNIyeNhh1Q9E+H4fR6bMKK54wlTxcVxLa+k387fwwPNiO0
ltM=
=Kwqm
-----END PGP SIGNATURE-----

--------------VIX17lF7ne9Z5J5x4Xtg52tI--
