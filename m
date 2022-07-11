Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4F56FFAB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4404B1123A9;
	Mon, 11 Jul 2022 11:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504B61123A9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:03:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F2E472279B;
 Mon, 11 Jul 2022 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657537438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qsZtFmhd2wM7bnAZCCJVrbNgtem6za52WsNE9GAAo+k=;
 b=Kk/CQuVbLGbPjt+D8aVbHl+sPhaBVqStaLvq3uIOVEsvaE3enyHn9eogvf4SaUK5CsObRA
 +QzIlbcvMMe90UEp1pvYXBm6guLOtqV1AgP5YujBB4WoOvUVD+Zh48ZbLlXSPzXQBbeXga
 3G9KD1p/5P5jZ+F/+AhA91duXEZGlMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657537438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qsZtFmhd2wM7bnAZCCJVrbNgtem6za52WsNE9GAAo+k=;
 b=bzC3oJgBJkPzVvb1HFGckyPYZVvzlZJVtzRcQKpjqn29cGb1hnDKKO9uYROjJYcnWE78b4
 bem69BD7OQUmocBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCD3C13322;
 Mon, 11 Jul 2022 11:03:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZBoaLZ0DzGK9aAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 11:03:57 +0000
Message-ID: <84c3af8a-d50c-c9be-348e-e50aad59bf5d@suse.de>
Date: Mon, 11 Jul 2022 13:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <CAMuHMdUqo-_5tyhmx_QqPJhqQdoRDE6_Q7b1AJWeBZc67RsBSA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdUqo-_5tyhmx_QqPJhqQdoRDE6_Q7b1AJWeBZc67RsBSA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------W3gjda6T5dPdYMTLKtvUwblT"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------W3gjda6T5dPdYMTLKtvUwblT
Content-Type: multipart/mixed; boundary="------------fpBott6Mn2eZcUCv7VE0xyyp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <84c3af8a-d50c-c9be-348e-e50aad59bf5d@suse.de>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named
 modes
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <CAMuHMdUqo-_5tyhmx_QqPJhqQdoRDE6_Q7b1AJWeBZc67RsBSA@mail.gmail.com>
In-Reply-To: <CAMuHMdUqo-_5tyhmx_QqPJhqQdoRDE6_Q7b1AJWeBZc67RsBSA@mail.gmail.com>

--------------fpBott6Mn2eZcUCv7VE0xyyp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDcuMjIgdW0gMTE6MzUgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDExOjAzIEFN
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFt
IDA4LjA3LjIyIHVtIDIwOjIxIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0KPj4+IFRo
ZSBtb2RlIHBhcnNpbmcgY29kZSByZWNvZ25pemVzIG5hbWVkIG1vZGVzIG9ubHkgaWYgdGhl
eSBhcmUgZXhwbGljaXRseQ0KPj4+IGxpc3RlZCBpbiB0aGUgaW50ZXJuYWwgd2hpdGVsaXN0
LCB3aGljaCBpcyBjdXJyZW50bHkgbGltaXRlZCB0byAiTlRTQyINCj4+PiBhbmQgIlBBTCIu
DQo+Pj4NCj4+PiBQcm92aWRlIGEgbWVjaGFuaXNtIGZvciBkcml2ZXJzIHRvIG92ZXJyaWRl
IHRoaXMgbGlzdCB0byBzdXBwb3J0IGN1c3RvbQ0KPj4+IG1vZGUgbmFtZXMuDQo+Pj4NCj4+
PiBJZGVhbGx5LCB0aGlzIGxpc3Qgc2hvdWxkIGp1c3QgY29tZSBmcm9tIHRoZSBkcml2ZXIn
cyBhY3R1YWwgbGlzdCBvZg0KPj4+IG1vZGVzLCBidXQgY29ubmVjdG9yLT5wcm9iZWRfbW9k
ZXMgaXMgbm90IHlldCBwb3B1bGF0ZWQgYXQgdGhlIHRpbWUgb2YNCj4+PiBwYXJzaW5nLg0K
Pj4NCj4+IEkndmUgbG9va2VkIGZvciBjb2RlIHRoYXQgdXNlcyB0aGVzZSBuYW1lcywgY291
bGRuJ3QgZmluZCBhbnkuIEhvdyBpcw0KPj4gdGhpcyBiZWluZyB1c2VkIGluIHByYWN0aWNl
PyBGb3IgZXhhbXBsZSwgaWYgSSBzYXkgIlBBTCIgb24gdGhlIGNvbW1hbmQNCj4+IGxpbmUs
IGlzIHRoZXJlIERSTSBjb2RlIHRoYXQgZmlsbHMgaW4gdGhlIFBBTCBtb2RlIHBhcmFtZXRl
cnM/DQo+IA0KPiBJIGd1ZXNzIE1heGltZSBrbm93cywgYXMgaGUgYWRkZWQgdGhlIHdoaXRl
bGlzdD8NCg0KWWVhaCwgSSBzYXcgaGlzIHJlcGx5IGFscmVhZHkuDQoNCj4gUmVhZGluZyB0
aGUgZGVzY3JpcHRpb24gb2YgY29tbWl0IDM3NjQxMzc5MDZhNWFjZWMgKCJkcm0vbW9kZXM6
DQo+IEludHJvZHVjZSBhIHdoaXRlbGlzdCBmb3IgdGhlIG5hbWVkIG1vZGVzIiksIGl0IGxv
b2tzIGxpa2UgdGhpcyBpcw0KPiBtb3JlIGFib3V0IHByZXZlbnRpbmcgdGhlIHBhcnNlciBm
cm9tIHRha2luZyBhbnkgc3RyaW5nIGFzIGEgcmFuZG9tDQo+IG1vZGUsIHRoYW4gYWJvdXQg
YWRkaW5nIHN1cHBvcnQgZm9yICJQQUwiIG9yICJOVFNDIj8NCj4gDQo+IE5vdGUgdGhhdCBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3R2LmMgZGVmaW5lcyBhbiBhcnJh
eSBvZg0KPiB0dl9tb2Rlc1tdLCBpbmNsdWRpbmcgIlBBTCIsIHNvIHBlcmhhcHMgdGhlc2Ug
ZW5kIHVwIGFzIG5hbWVkIG1vZGVzPw0KPiANCj4+IEFuZCBhbm90aGVyIHF1ZXN0aW9uIEkg
aGF2ZSBpcyB3aGV0aGVyIHRoaXMgd2hpdGVsaXN0IGJlbG9uZ3MgaW50byB0aGUNCj4+IGRy
aXZlciBhdCBhbGwuIFN0YW5kYXJkIG1vZGVzIGV4aXN0IGluZGVwZW5kZW50IGZyb20gZHJp
dmVycyBvcg0KPj4gaGFyZHdhcmUuIFNob3VsZG4ndCB0aGVyZSBzaW1wbHkgYmUgYSBnbG9i
YWwgbGlzdCBvZiBhbGwgcG9zc2libGUgbW9kZQ0KPj4gbmFtZXM/IERyaXZlcnMgd291bGQg
ZmlsdGVyIG91dCB0aGUgdW5zdXBwb3J0ZWQgbW9kZXMgYW55d2F5Lg0KPiANCj4gRm9yIHN0
YW5kYXJkIG1vZGVzLCBJIGFncmVlLiAgQW5kIHRoZXNlIGFyZSB1c3VhbGx5IHNwZWNpZmll
ZCBieQ0KPiByZXNvbHV0aW9uIGFuZCByZWZyZXNoIHJhdGUgKGUuZy4gIjY0MHg0ODBANjAi
LCBpbnN0ZWFkIG9mICI0ODBwIikuDQo+IA0KPiBCdXQgbGVnYWN5IGhhcmR3YXJlIG1heSBo
YXZlIHZlcnkgbGltaXRlZCBzdXBwb3J0IGZvciBwcm9ncmFtbWFibGUNCj4gcGl4ZWwgY2xv
Y2tzIChlLmcuIEFtaWdhIGlzIGxpbWl0ZWQgdG8gcGl4ZWwgY2xvY2tzIG9mIDcsIDE0LCBv
ciAyOA0KPiBNSHopLCBzbyB0aGUgc3RhbmRhcmQgbW9kZXMgYXJlIGEgYmFkIG1hdGNoLCBv
ciBtYXkgbm90IHdvcmsgYXQgYWxsLg0KPiBIZW5jZSBkcml2ZXJzIG1heSBuZWVkIHRvIHBy
b3ZpZGUgdGhlaXIgb3duIG1vZGVzLCBidXQgaXQgc2VlbXMgd3JvbmcNCj4gdG8gbWUgdG8g
bWFrZSB0aGVzZSBub24tc3RhbmRhcmQgbW9kZXMgZ2xvYmFsLCBhbmQgcG9zc2libHkgcG9s
bHV0ZQ0KPiB0aGUgZXhwZXJpZW5jZSBmb3IgZXZlcnlvbmUuDQpJIGRvbid0IHJlYWxseSBo
YXZlIGEgc3Ryb25nIG9waW5pb24sIGJ1dCBoYXZpbmcgYWxsIG1vZGVzIGluIG9uZSBnbG9i
YWwgDQpsaXN0IGlzIHF1aXRlIHVzZXItZnJpZW5kbHkuIEl0J3MgYWxsIHRoZXJlIGZvciBl
dmVyeW9uZS4gT3RoZXJ3aXNlIA0KdXNlcnMgd291bGQgc29tZWhvdyBoYXZlIHRvIGtub3cg
d2hpY2ggaGFyZHdhcmUgc3VwcG9ydHMgd2hpY2ggbW9kZXMuIA0KVGhhdCdzIGFjdHVhbGx5
IHRoZSBqb2Igb2YgZWFjaCBkcml2ZXIncyBtb2RlX3ZhbGlkIGFuZCBhdG9taWNfY2hlY2sg
DQpmdW5jdGlvbnMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------fpBott6Mn2eZcUCv7VE0xyyp--

--------------W3gjda6T5dPdYMTLKtvUwblT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLMA50FAwAAAAAACgkQlh/E3EQov+CW
sw/+IzsJWZ3vBiBVN32rSGSbKjAcR2LqgXyYu7DxmQglL6rlBhpZ/W5tevD/hl6OXnkQxkM4eSo6
f5CYAxABHL2LlqukBr+CVW1WchEYD8b8K4I7Ptp6dW4YkIamgBtYTFtedxQ+Kqi5SWc3IU7DkL+n
I7q+uGT7RTfmxL2KB9PqhWkOYJrY5A42KCGw3swV2GGEthXlzUU6p98zrX/UUIVatQLAQw2bRXz3
wQfQp7M+d+iFQzRYLmwK23tFkC4Ug7aa+0RHtA1jeoCgTI3lI59ItBrqNdEHwxXkxM43ImjsUhEJ
at1RVMUCDklu6kTQFJJDakfA9GVNlBqLAONLZmN6OdKz600D0w2qviduJEDLNWYefR5rYOoJw/z3
yjHlH6nl2jWaDhB2CyupV+/piEz39SJwj3IwvXb/cbv3FjIbvJtgUP6IFfxoHv4hiW9K31BrH1HE
XdSDHUgFOUOYR3sow9YgSDW8B2AL5LK4khAXiTT17JOgR/zFa9zS8RVKgWhFtnAtZnMyTkwxHZwt
g9bUJf6GQZYa9OEGe2MQKeB+13u8QcvjUJTXZYAxsPWWTc8PslTeiOgJ0YlL0rJ8qhB780eE348d
Chua1IiIq2M4fS2zZqpxNPuLlGsYHgtppqrcFk2cXL33SuCiHnR3BOdfZZ1MWBTqm/iwZCGQGUbj
tns=
=fby2
-----END PGP SIGNATURE-----

--------------W3gjda6T5dPdYMTLKtvUwblT--
