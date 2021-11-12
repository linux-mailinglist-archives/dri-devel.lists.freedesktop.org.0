Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7544E52D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DF56EC18;
	Fri, 12 Nov 2021 10:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4133B6EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:57:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D44421FD5C;
 Fri, 12 Nov 2021 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636714642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lEbwxLVSb9880a2GVKJCVmmaXC68nW9YCHWIm3C2unQ=;
 b=p1oJ6SZ5p5CujLNl8Eh4Id31i5/b0G9oNf2ZkGQM5yp3HyUUBXSq7IGd/SFiIkEKss7AGw
 vFLQOTqAIhO32tFngNO6uRgmHDrWs9/wiDNaZoF6R+pRWIovW89i/3MGKlzxB9aaG2H7er
 C6yn1B1LHTvzDRxfKQPbfZNAxy4NxMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636714642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lEbwxLVSb9880a2GVKJCVmmaXC68nW9YCHWIm3C2unQ=;
 b=l/f/hfvJkancs7RNjjKYfmGDKF0ABUBWy95jncOZTraYx+zyUHvoDA9npRBuNwGkebIZ0G
 zHgjmy3lqZOM+cAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DB4713BAF;
 Fri, 12 Nov 2021 10:57:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6RtKIJJIjmEFVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 10:57:22 +0000
Message-ID: <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
Date: Fri, 12 Nov 2021 11:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211112122239.26b3787c@eldfell>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------crOl6nYcyD2ZiQ01a1x0LuEX"
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------crOl6nYcyD2ZiQ01a1x0LuEX
Content-Type: multipart/mixed; boundary="------------k0yv0U991ni2TvTT0x7BvnZJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>
Message-ID: <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
In-Reply-To: <20211112122239.26b3787c@eldfell>

--------------k0yv0U991ni2TvTT0x7BvnZJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTEuMjEgdW0gMTE6MjIgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoNCj4g
T24gRnJpLCAxMiBOb3YgMjAyMSAxMTowOToxMyArMDEwMA0KPiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gSGkNCj4+DQo+PiBBbSAx
Mi4xMS4yMSB1bSAxMDozOSBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+
PiBIZWxsbyBQZWtrYSwNCj4+Pg0KPj4+IE9uIDExLzEyLzIxIDA5OjU2LCBQZWtrYSBQYWFs
YW5lbiB3cm90ZToNCj4+Pg0KPj4+IFtzbmlwXQ0KPj4+ICAgIA0KPj4+Pg0KPj4+PiBIaSwN
Cj4+Pj4NCj4+Pj4gdGhlc2UgaWRlYXMgbWFrZSBzZW5zZSB0byBtZSwgc28gRldJVywNCj4+
Pj4NCj4+Pj4gQWNrZWQtYnk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xs
YWJvcmEuY29tPg0KPj4+PiAgIA0KPj4+DQo+Pj4gVGhhbmtzLg0KPj4+ICAgIA0KPj4+PiBU
aGVyZSBpcyBvbmUgbml0cGljayBJJ2QgbGlrZSB0byBhc2sgYWJvdXQ6DQo+Pj4+DQo+Pj4+
ICtib29sIGRybV9nZXRfbW9kZXNldCh2b2lkKQ0KPj4+PiArew0KPj4+PiArICAgICByZXR1
cm4gIWRybV9ub21vZGVzZXQ7DQo+Pj4+ICt9DQo+Pj4+ICtFWFBPUlRfU1lNQk9MKGRybV9n
ZXRfbW9kZXNldCk7DQo+Pj4+DQo+Pj4+IERvZXNuJ3QgImdldCIgaGF2ZSBhIHNwZWNpYWwg
bWVhbmluZyBpbiB0aGUga2VybmVsIGxhbmQsIGxpa2UgInRha2UgYQ0KPj4+PiBzdHJvbmcg
cmVmZXJlbmNlIG9uIGFuIG9iamVjdCBhbmQgcmV0dXJuIGl0Ij8NCj4+Pg0KPj4+IFRoYXQn
cyBhIHZlcnkgZ29vZCBwb2ludC4NCj4+PiAgICANCj4+Pj4gQXMgdGhpcyBpcyBqdXN0IHJl
dHVybmluZyBib29sIHdpdGhvdXQgY2hhbmdpbmcgYW55dGhpbmcsIHRoZSB1c3VhbA0KPj4+
PiB3b3JkIHRvIHVzZSBpcyAiaXMiLiBTaW5jZSB0aGlzIGZ1bmN0aW9uIGlzIGFsc28gdXNl
ZCBhdCBtb3N0IG9uY2UgcGVyDQo+Pj4+IGRyaXZlciwgd2hpY2ggaXMgcmFyZWx5LCBpdCBj
b3VsZCBoYXZlIGEgbG9uZyBhbmQgZGVzY3JpcHRpdmUgbmFtZS4NCj4+Pj4NCj4+Pj4gRm9y
IGV4YW1wbGU6DQo+Pj4+DQo+Pj4+IGJvb2wgZHJtX2lzX21vZGVzZXRfZHJpdmVyX2FsbG93
ZWQodm9pZCk7DQo+Pg0KPj4gSSdkIG5vbWluYXRlDQo+Pg0KPj4gICAgIGJvb2wgZHJtX25h
dGl2ZV9kcml2ZXJzX2VuYWJsZWQoKQ0KPj4NCj4+IFRoaXMgaXMgd2hhdCBIVy1zcGVjaWZp
YyBkcml2ZXJzIHdhbnQgdG8gcXVlcnkgaW4gdGhlaXIgaW5pdC9wcm9iaW5nDQo+PiBjb2Rl
LiBUaGUgYWN0dWFsIHNlbWFudGljcyBvZiB0aGlzIGRlY2lzaW9uIGlzIGhpZGRlbiBmcm9t
IHRoZSBkcml2ZXIuDQo+PiBJdCdzIGFsc28gZWFzaWVyIHRvIHJlYWQgdGhhbiB0aGUgb3Ro
ZXIgbmFtZSBJTUhPDQo+IA0KPiBPaywgYnV0IHdoYXQgaXMgYSAibmF0aXZlIGRyaXZlciI/
IE9yIGEgIm5vbi1uYXRpdmUgZHJpdmVyIj8NCj4gSXMgdGhhdCBlc3RhYmxpc2hlZCBrZXJu
ZWwgdGVybWlub2xvZ3k/DQo+IA0KPiBJJ2QgdGhpbmsgYSBub24tbmF0aXZlIGRyaXZlciBp
cyBzb21ldGhpbmcgdGhhdCBlLmcuIG5kaXN3cmFwcGVyIGlzDQo+IGxvYWRpbmcuIElzIHNp
bXBsZWRybSBsaWtlIG5kaXN3cmFwcGVyIGluIGEgc2Vuc2U/IElJUkMsIHNpbXBsZWRybSBp
cw0KPiB0aGUgZHJpdmVyIHRoYXQgd291bGQgbm90IGNvbnN1bHQgdGhpcyBmdW5jdGlvbiwg
cmlnaHQ/DQoNCldlIHVzZSB0aGF0IHRlcm0gZm9yIGh3LXNwZWNpZmljIGRyaXZlcnMuIEEg
J25vbi1uYXRpdmUnIGRyaXZlciB3b3VsZCBiZSANCmNhbGxlZCBnZW5lcmljIG9yIGZpcm13
YXJlIGRyaXZlci4NCg0KTXkgY29uY2VybiB3aXRoIHRoZSAnbW9kZXNldCcgdGVybSBpcyB0
aGF0IGl0IGV4cG9zZXMgYW4gaW1wbGVtZW50YXRpb24gDQpkZXRhaWwsIHdoaWNoIGNhbiBt
aXNsZWFkIGEgZHJpdmVyIHRvIHRvIHRoZSB3cm9uZyB0aGluZzogYSBIVy1zcGVjaWZjIA0K
ZHJpdmVyIHRoYXQgZGlzYWJsZXMgaXQncyBtb2Rlc2V0dGluZyBmdW5jdGlvbmFsaXR5IHdv
dWxkIHBhc3MgdGhlIHRlc3QgDQpmb3IgKCFtb2Rlc2V0KS4gQnV0IHRoYXQncyBub3Qgd2hh
dCB3ZSB3YW50LCB3ZSB3YW50IHRvIGRpc2FibGUgYWxsIG9mIA0KdGhlIGRyaXZlciBhbmQg
bm90IGV2ZW4gbG9hZCBpdC4NCg0KSG93IGFib3V0IHdlIGludmVydCB0aGUgdGVzdCBmdW5j
dGlvbiBhbmQgdXNlIHNvbWV0aGluZyBsaWtlDQoNCiAgYm9vbCBkcm1fZmlybXdhcmVfZHJp
dmVyc19vbmx5KCkNCg0KPyBIVy1uYXRpdmUgZHJpdmVycyBjYW4gZG8NCg0KICAgaWYgKGRy
bV9maXJtd2FyZV9kcml2ZXJzX29ubHkoKSkNCiAgICAgcmV0dXJuOw0KDQphcyBlYXJseSBh
cyBwb3NzaWJsZS4gZmJkZXYgdXNlcyB0aGUgZmxhZyBGQklORk9fTUlTQ19GSVJNV0FSRSB0
byBtYXJrIA0KcnNwIGRyaXZlcnMuIFNvIHRoZSB0ZXJtaW5vbG9neSBpcyB0aGVyZSBhbHJl
YWR5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4gVGhhbmtzLA0KPiBw
cQ0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pj4gICANCj4+
Pg0KPj4+IFllYWgsIG5hbWluZyBpcyBoYXJkLiBKYW5pIGFsc28gbWVudGlvbmVkIHRoYXQg
aGUgZGlkbid0IGxpa2UgdGhpcw0KPj4+IGZ1bmN0aW9uIG5hbWUsIHNvIEkgZG9uJ3QgbWlu
ZCB0byByZS1zcGluIHRoZSBzZXJpZXMgb25seSBmb3IgdGhhdC4NCj4+PiAgICANCj4+Pj4g
LSAiZHJtIiBpcyB0aGUgbmFtZXNwYWNlDQo+Pj4+IC0gImlzIiBpbXBsaWVzIGl0IGlzIGEg
cmVhZC1vbmx5IGJvb2xlYW4gaW5zcGVjdGlvbg0KPj4+PiAtICJtb2Rlc2V0IiBpcyB0aGUg
ZmVhdHVyZSBiZWluZyBjaGVja2VkDQo+Pj4+IC0gImRyaXZlciIgaW1wbGllcyBpdCBpcyBz
dXBwb3NlZCBnYXRlIGRyaXZlciBsb2FkaW5nIG9yDQo+Pj4+ICAgICBpbml0aWFsaXphdGlv
biwgcmF0aGVyIHRoYW4gbW9kZXNldHMgYWZ0ZXIgZHJpdmVycyBoYXZlIGxvYWRlZA0KPj4+
PiAtICJhbGxvd2VkIiBzYXlzIGl0IGlzIGFza2luZyBhYm91dCBnZW5lcmFsIHBvbGljeSBy
YXRoZXIgdGhhbiB3aGF0IGENCj4+Pj4gICAgIGRyaXZlciBkb2VzDQo+Pj4+ICAgDQo+Pj4N
Cj4+PiBJIGJlbGlldmUgdGhhdCBuYW1lIGlzIG1vcmUgdmVyYm9zZSB0aGFuIG5lZWRlZC4g
QnV0IGRvbid0IGhhdmUgYQ0KPj4+IHN0cm9uZyBvcGluaW9uIGFuZCBjb3VsZCB1c2UgaXQg
aWYgb3RoZXJzIGFncmVlLg0KPj4+ICAgIA0KPj4+PiBKdXN0IGEgYmlrZXNoZWQsIEknbGwg
bGVhdmUgaXQgdG8gYWN0dWFsIGtlcm5lbCBkZXZzIHRvIHNheSBpZiB0aGlzDQo+Pj4+IHdv
dWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUgb3Igd29ydGggaXQuDQo+Pj4+ICAgDQo+Pj4NCj4+
PiBJIHRoaW5rIGlzIHdvcnRoIGl0IGFuZCBiZXR0ZXIgdG8gZG8gaXQgbm93IGJlZm9yZSB0
aGUgcGF0Y2hlcyBsYW5kLCBidXQNCj4+PiB3ZSBjb3VsZCB3YWl0IGZvciBvdGhlcnMgdG8g
Y2hpbWUgaW4uDQo+Pj4NCj4+PiBCZXN0IHJlZ2FyZHMsDQo+Pj4gLS0NCj4+PiBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMNCj4+PiBMaW51eCBFbmdpbmVlcmluZw0KPj4+IFJlZCBIYXQN
Cj4+PiAgICANCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------k0yv0U991ni2TvTT0x7BvnZJ--

--------------crOl6nYcyD2ZiQ01a1x0LuEX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGOSJEFAwAAAAAACgkQlh/E3EQov+Ba
VxAAzyRNYXj9FspXyBb64kMiI/Faml1Ea404wyQrq+AsOIi9U4+bKKM/PQDpVwA9RLhfXJAR4DQ/
v+Q+15TZ09++VggB9USnSTCP2nqGs72Qmr1C5Hoq5NM4nHwmli90Ay6m7O3YbRIGG6H/6MFJ8jPU
6wmtOHUVBH77saRF7TqcwaMitU+qey40nALJlLe5BYUj/IpQaURcbAZt03xHPVDveF2uz7z7GSIq
AheOZXl/xrD+DM4S77YpKV18mt8SJEJMkp2QdahjKF+Ds8OlViXI86N5oDKs1/kQRt4aCYmGe6lL
SACvrWYeDZcA06V4TRqu0aRR4kGX8Cf+geXApA0SJs9VgSAk1I7BI+2bZgMSdh4uKtivjFH16WA7
6HXn95fEUGZkg7mB6uGN661iWB9fKYRP3knmYRuD3vuLD8p9mydvUvEZqVT8mYVmQyMfuVAzMj7b
li1wlceWis+880Wmz9zsNZw09qgWZra5+up6N4fD2H8PKgNWCk9DACTuCf9HzTMAdBtmFrH3Gxib
0+zDztA1B0OFccWi8ATSNDVlhzCaQMY9PV0w5GGJLHkyEiVkQqeoPOc2n7RIufo8keux7FH3Ig0J
qVANikAZpe/LUA7ZXl/ud/atJQ4+MWb0wpmGqtLfGv4q4MMdACZ2I0Vj421Nkrlrk0eUgCRii7eo
GVk=
=aoFV
-----END PGP SIGNATURE-----

--------------crOl6nYcyD2ZiQ01a1x0LuEX--
