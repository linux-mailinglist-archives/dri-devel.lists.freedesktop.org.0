Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E24A6CD7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158D910F7B7;
	Wed,  2 Feb 2022 08:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B710F7B7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:23:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2981C21126;
 Wed,  2 Feb 2022 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643790188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVf1+FCkij+IfM22HKlKn+GHDND82cODe48QSI9u+x0=;
 b=J+BLinrWFeb6BY16seJl5XwMOuvqiz5jHuHc9/ZTPpyd6MVilRUw9wCChscPlNaQ64zmid
 0RxWk9Otp98oKlzts7r0Qa4xjG2wKmGwg7Jjzi4FjYrH7DYijlRf+l+jKqlYErG3coUlwK
 2en6v0RCMWoSCFHBdS/hO2T3cqM3MRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643790188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVf1+FCkij+IfM22HKlKn+GHDND82cODe48QSI9u+x0=;
 b=vIAeXRk0vEnB95Cxy3jJzQMcAWiRuu08RSFKuzoR+BisJ7Z4FvMtfdj9G9kZeop/nNlotZ
 Ws2wAUkUxNOIJSCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6E4C13BA2;
 Wed,  2 Feb 2022 08:23:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YAdTN2s/+mEbIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Feb 2022 08:23:07 +0000
Message-ID: <946f8fbb-cd64-12d0-ecd9-13af18a00590@suse.de>
Date: Wed, 2 Feb 2022 09:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
 <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
 <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
 <3df2add7-6034-0527-825a-74e62e76dace@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3df2add7-6034-0527-825a-74e62e76dace@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cVusIXqEygqVbwTewwGspTdY"
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cVusIXqEygqVbwTewwGspTdY
Content-Type: multipart/mixed; boundary="------------b1k0yJmYqaKqqVDGYx3TQ6ki";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <946f8fbb-cd64-12d0-ecd9-13af18a00590@suse.de>
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
 <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
 <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
 <3df2add7-6034-0527-825a-74e62e76dace@redhat.com>
In-Reply-To: <3df2add7-6034-0527-825a-74e62e76dace@redhat.com>

--------------b1k0yJmYqaKqqVDGYx3TQ6ki
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjIgdW0gMTU6MzYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDIvMS8yMiAxNTowNSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
Pj4gSGkgSmF2aWVyLA0KPj4NCj4+IE9uIFR1ZSwgRmViIDEsIDIwMjIgYXQgMjowMiBQTSBK
YXZpZXIgTWFydGluZXogQ2FuaWxsYXMNCj4+IDxqYXZpZXJtQHJlZGhhdC5jb20+IHdyb3Rl
Og0KPj4+IE9uIDIvMS8yMiAxMDozMywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+
PiArew0KPj4+Pj4gKyAgICB1OCBjb2xfZW5kID0gY29sX3N0YXJ0ICsgY29scyAtIDE7DQo+
Pj4+PiArICAgIGludCByZXQ7DQo+Pj4+PiArDQo+Pj4+PiArICAgIGlmIChjb2xfc3RhcnQg
PT0gc3NkMTMwNy0+Y29sX3N0YXJ0ICYmIGNvbF9lbmQgPT0gc3NkMTMwNy0+Y29sX2VuZCkN
Cj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgcmV0
ID0gc3NkMTMwN193cml0ZV9jbWQoc3NkMTMwNy0+Y2xpZW50LCBTU0QxMzA3X1NFVF9DT0xf
UkFOR0UpOw0KPj4+Pj4gKyAgICBpZiAocmV0IDwgMCkNCj4+Pj4+ICsgICAgICAgICAgICBy
ZXR1cm4gcmV0Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXQgPSBzc2QxMzA3X3dyaXRlX2Nt
ZChzc2QxMzA3LT5jbGllbnQsIGNvbF9zdGFydCk7DQo+Pj4+PiArICAgIGlmIChyZXQgPCAw
KQ0KPj4+Pj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+PiArDQo+Pj4+PiArICAg
IHJldCA9IHNzZDEzMDdfd3JpdGVfY21kKHNzZDEzMDctPmNsaWVudCwgY29sX2VuZCk7DQo+
Pj4+PiArICAgIGlmIChyZXQgPCAwKQ0KPj4+Pj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+Pj4+DQo+Pj4+IENhbiB5b3Ugd3JpdGUgdGhlc2UgY21kcyBpbiBvbmUgc3RlcCwgc3Vj
aCBhcyBzZXR0aW5nIHVwIGFuIGFycmF5IGFuZA0KPj4+PiBzZW5kaW5nIGl0IHdpdGggc3Nk
MTMwN193cml0ZV9hcnJheT8NCj4+Pg0KPj4+IEkgZG9uJ3QgdGhpbmsgc28gYmVjYXVzZSB0
aGUgY29tbWFuZHMgYXJlIGRpZmZlcmVudC4gQnV0IEknbGwgY2hlY2sgdGhlDQo+Pj4gc3Nk
MTMwNiBkYXRhc2hlZXQgYWdhaW4gdG8gY29uZmlybWEgdGhhdCdzIHRoZSBjYXNlLg0KPj4N
Cj4+IElJUkMsIEkgdHJpZWQgdGhhdCB3aGlsZSB3b3JraW5nIG9uIHRoZSBvcHRpbWl6YXRp
b25zIGZvciBzc2QxMzA3ZmIsDQo+PiBhbmQgaXQgZGlkbid0IHdvcmsuDQo+Pg0KPiANCj4g
VGhhdCdzIHdoYXQgSSB3b3VsZCBoYWQgZXhwZWN0ZWQgYnkgcmVhZGluZyB0aGUgZGF0YXNo
ZWV0LiBUaGFua3MgYQ0KPiBsb3QgZm9yIGNvbmZpcm1pbmcgbXkgYXNzdW1wdGlvbi4NCg0K
VGhhbmtzIHRvIGJvdGggb2YgeW91LiBJIHdhcyBhc2tpbmcgYmVjYXVzZSBJIGZvdW5kIHRo
ZSBjb2RlIHRvIGJlIA0KcmVwZXRpdGl2ZSBhbmQgaXQncyBub3QgY2xlYXIgdGhhdCB0aGVz
ZSAzIHN0YXRlbWVudHMgYmVsb25nIHRvZ2V0aGVyLg0KDQpJJ2QgbGlrZSB0byBzdWdnZXN0
IHRvIGFkZCBhIGZ1bmN0aW9uDQoNCiAgIHNzZDEzMDdfd3JpdGVfY21kcyhjbGllbnQsIGxl
biwgY29uc3QgdTggKmNtZHMpDQoNCnRoYXQgbG9vcHMgdGhyb3VnaCBjbWRzIGFuZCBzZW5k
cyB0aGUgdmFsdWVzIG9uZSBieSBvbmUuIEEgY2FsbCB3b3VsZCANCmxvb2sgbGlrZSB0aGlz
Og0KDQogICBjb25zdCB1OCBzZXRfY29sX3JhbmdlW10gPSB7DQogICAgIFNTRDEzMDdfU0VU
X0NPTF9SQU5HRSwNCiAgICAgY29sX3N0YXJ0LA0KICAgICBjb2xfZW5kDQogICB9Ow0KDQog
ICBzc2QxMzA3X3dyaXRlX2NtZHMoY2xpZW50LCBBUlJBWV9TSVpFKHNldF9jb2xfcmFuZ2Up
LCBzZXRfY29sX3JhbmdlKTsNCg0KQU5EL09SDQoNCllvdSBjb3VsZCBoYXZlIGZ1bmN0aW9u
cyB0aGF0IHRha2UgYSBjb21tYW5kIHdpdGggYXJndW1lbnRzOyBlaXRoZXIgYXMgDQp2YV9h
cmdzIG9yIHdpdGggb25lIGZ1bmN0aW9uIHBlciBudW1iZXIgb2YgYXJndW1lbnRzLiBPciB5
b3UgY291bGQgDQpjb21iaW5lIGFsbCB0aGVzZSBzb21laG93Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+ICAgDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------b1k0yJmYqaKqqVDGYx3TQ6ki--

--------------cVusIXqEygqVbwTewwGspTdY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH6P2sFAwAAAAAACgkQlh/E3EQov+Bi
ExAA0H8Momk/5syGvVfUO1UWqR7CmrCPDdLxxThqbUKHZ89nexD69olANacyJTLhO4QKPU94d++i
u1T91nilLberWFneTA+yfSZbJyHWYQ4MWyhQm7vM4SQ3FPYh9DPzIAOrd1oQlj+8WGpn/SV6zbBR
Fq0AGiJ25bKck7zCcGD7wK8Kc0DPChZ6TuhzOfXCOdg5kzDbinrIFjgNWJjOvgfYyhHF9KTRxLQA
uLtixSEjcM0GBKzFQzLpj3MPzdOM8EYFgUWlqNJ5PRY4QLyFh3WSUcZ33IGklqBsuQ0z/dhyBNqj
sN1w72zLBRYWaOLG7n+kSE6iVfa1RfQhzMX868gmlQDdpVURG8v906WI7WOlG3fN8om1WHwwnBTQ
IS7gqv52mRxi+5dRUzHLj6B6DbUhgtTZW/Ayg0zHXK6g6m8VRzjfpMjMMW/jpuuDg0TBqYZJTHB6
L0yZ8FMKQeFD5u9dRqYn0eI/w6/DfDwe50ALp8m4sRSDxPJNP6wSyFQY2USS2YGnMA8HOeBjsNGU
GUmTt7ddRUCoM4fzOOlmZ8Fa9JkaYTVJHImSd4qthvo5lkCS/W+eC2uC4WgYKJJyBbGCpgoqD7sG
NVBYgKtz6qhcNT5+8YSBrsxaWVVJ70p5AJX11VFMOqsgtLesqc3yfHy+Cfh4BfTZ9YiviJAhNEni
j4E=
=ZlY8
-----END PGP SIGNATURE-----

--------------cVusIXqEygqVbwTewwGspTdY--
