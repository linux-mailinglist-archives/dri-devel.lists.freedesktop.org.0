Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE8677FE3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C09810E4D2;
	Mon, 23 Jan 2023 15:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9B610E4D1;
 Mon, 23 Jan 2023 15:35:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8C65F1F385;
 Mon, 23 Jan 2023 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674488116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ju6Ds2nODf2Z6rNsWfkPjtSZOZ97OjD6qm4u0IXsVsE=;
 b=g6ouka/nsMz2jWMiBgR0dzjFV8ohydrlTduzu86DG8rHFte2t/r49ZDm5BODtT12avQlDP
 9a7tFkXqkA9ySY6BjM+TYlPTDN1Ofv/vBrC6in0sjmEua70VibHg1lmqJ3bdN/lNpBneL9
 FiO2IpFFiXWvKojS3cnM6dz7ypIrzx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674488116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ju6Ds2nODf2Z6rNsWfkPjtSZOZ97OjD6qm4u0IXsVsE=;
 b=PUO6Z3VpkuW3uKigJUQfsBRp8DiVifeJ6QzG+HbC2aN1PVdE9O+9AWBayzAbiXReRhdyx9
 +7mC2jBvcU7cswDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 629791357F;
 Mon, 23 Jan 2023 15:35:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IQoxFzSpzmNOWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 15:35:16 +0000
Message-ID: <d2345ff2-3fc3-1a44-6ace-d05a29feb5b3@suse.de>
Date: Mon, 23 Jan 2023 16:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
 <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
 <43ed96bc-5a70-ba61-1959-fcb2fe86387e@suse.de>
 <3c426ff9-e2de-86ee-6b49-443fea3437ff@physik.fu-berlin.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3c426ff9-e2de-86ee-6b49-443fea3437ff@physik.fu-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s62U0Bc1fvUw4PCzC8Y1QxuK"
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
Cc: tvrtko.ursulin@linux.intel.com, dim-tools@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s62U0Bc1fvUw4PCzC8Y1QxuK
Content-Type: multipart/mixed; boundary="------------KIGlXpip38BzWEO3spFlhESY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: tvrtko.ursulin@linux.intel.com, dim-tools@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Message-ID: <d2345ff2-3fc3-1a44-6ace-d05a29feb5b3@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
 <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
 <43ed96bc-5a70-ba61-1959-fcb2fe86387e@suse.de>
 <3c426ff9-e2de-86ee-6b49-443fea3437ff@physik.fu-berlin.de>
In-Reply-To: <3c426ff9-e2de-86ee-6b49-443fea3437ff@physik.fu-berlin.de>

--------------KIGlXpip38BzWEO3spFlhESY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjMgdW0gMTY6MjMgc2NocmllYiBKb2huIFBhdWwgQWRyaWFuIEds
YXViaXR6Og0KPiBIaSBUaG9tYXMhDQo+IA0KPiBPbiAxLzIzLzIzIDE2OjEzLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4+Pj4gRHJpdmVyIENoYW5nZXM6DQo+Pj4+DQo+Pj4+IMKg
KiBSZW1vdmUgb2Jzb2xldGUgZHJpdmVycyBmb3IgdXNlcnNwYWNlIG1vZGVzZXR0aW5nIGk4
MTAsIG1nYSwgcjEyOCwNCj4+Pj4gwqDCoCBzYXZhZ2UsIHNpcywgdGRmeCwgdmlhDQo+Pj4N
Cj4+PiBJcyB0aGUgUmFnZSAxMjggR1BVIHN0aWxsIHN1cHBvcnRlZCB2aWEgdGhlIGdlbmVy
aWMgbW9kZXNldHRpbmcgZHJpdmVyPw0KPj4+DQo+Pj4gSSdtIGFza2luZyBiZWNhdXNlLCB3
ZSdyZSBzdGlsbCBzdXBwb3J0aW5nIFBvd2VyTWFjcyBpbiBEZWJpYW4gUG9ydHMgDQo+Pj4g
b2Ygd2hpY2gNCj4+PiBzb21lIG9mIHRob3NlIGFyZSBzcG9ydGluZyBhIFJhZ2UgMTI4IEdQ
VS4gU2ltaWxhciBxdWVzdGlvbiBhcHBsaWVzIA0KPj4+IHRvIHRoZQ0KPj4+IGk4MTAgR1BV
IHVzZWQgaW4gc29tZSBvbGQgVGhpbmtQYWRzLCBmb3IgZXhhbXBsZS4NCj4+DQo+PiBZZXMs
IGFsbCBvZiB0aG9zZSBjaGlwcyBhcmUgc3RpbGwgc3VwcG9ydGVkIGJ5IHRoZSBnZW5lcmlj
IG1vZGVzZXR0aW5nIA0KPj4gZHJpdmVycw0KPj4gYW5kIGV2ZW4gdGhlIG9sZCB1c2Vyc3Bh
Y2UgWG9yZyBkcml2ZXJzLg0KPiANCj4gT0ssIGdvb2QgdG8ga25vdy4NCj4gDQo+PiBUaGUg
b25seSB0aGluZyB0aGF0IGlzIG5vdCBzdXBwb3J0ZWQgYW55IGxvbmdlciBpcyANCj4+IGhh
cmR3YXJlLWFjY2VsZXJhdGVkIDNkIHJlbmRlcmluZy4NCj4+IEhvd2V2ZXIsIHRoaXMgaGFz
IG5vdCB3b3JrZWQgYW55d2F5LCBhcyBNZXNhIGhhcyBkcm9wcGVkIHN1cHBvcnQgZm9yIA0K
Pj4gdGhvc2UgY2hpcHMgYSBsb25nDQo+PiB0aW1lIGFnby4NCj4gDQo+IENvcnJlY3QgbWUg
aWYgSSdtIHdyb25nLCBidXQgSSB0aG91Z2h0IHRoYXQncyB3aGF0IE1lc2EgQ2xhc3NpYyB3
YXMgDQo+IGZvcmtlZCBvZmYgZm9yPw0KDQpBRkFJSyBNZXNhIGNsYXNzaWMgaXMgZm9yIG9s
ZCByYWRlb24sIGk5MTUgYW5kIG9sZCBub3V2ZWF1IGNvZGUuIFRoZSANCnNvLWNhbGxlZCBh
bWJlciBicmFuY2g6DQoNCiAgaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcvYW1iZXIuaHRtbA0K
DQpCdXQgdGhlIHJlbW92ZWQgY29kZSBpcyBmb3IgZXZlbiBvbGRlciBoYXJkd2FyZS4NCg0K
ICBodHRwczovL2RvY3MubWVzYTNkLm9yZy9zeXN0ZW1zLmh0bWwjZGVwcmVjYXRlZC1zeXN0
ZW1zLWFuZC1kcml2ZXJzDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCj4gVGhh
bmtzLA0KPiBBZHJpYW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------KIGlXpip38BzWEO3spFlhESY--

--------------s62U0Bc1fvUw4PCzC8Y1QxuK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPOqTMFAwAAAAAACgkQlh/E3EQov+A0
Rw/9FAyAgHAT+enBIV0Zqae5AYq7BmcleZyTdDLfPGE/DlQX3HsZnk4+7YhMbP68gUjTTqs7Mect
2yjkFykRVtS+ZM0MGuxi1PmpwVurytt2fSL0YzkeXAQ/Ddcjby6C5HTqB0mZykgcx5xylUYz47Nh
NWQUsuSIRdTJOMP4oWMhiKY14uMMwvKsbRq/3zhH/MhU4FupKTXUqImn1ULX3i7cZqfyob1K/p6W
ZZwduPsYZhxZprqHTBJXyTqpmIKWAB3GMdMfFBSry66yU7tm4CJPbT/Yzak3YYwMVpuwB74pPfnG
GZmq1uWG8pOvkB/it4p/fbH2iss6T4gAbJgnv6fptrNpU/bZx4Eu0TG82RWRuNCITdm6yaXyfPAj
nfaZyMuxlCMPym8wpideXay5mhsire4yZ7c10uWUxQNtvIv/f6GwVhBUoEdPIcDqOtqEBHI5dmak
zJHsluCp/UYP9xO9Dlr7dF9MxJ8huqd3oI22GhOVDLqSKQl5w4a1Mmr1OogYapvRF5qU2rpOhLld
keKzBuGBp/bfffDRWHq7qGyCGduGybUTWtrwLgcJiaaSQmOGmXV9+mpPpCOFxkdmsPVGHd/rziOz
kOlGxtsnMiPv40+9FUXyhh0v8YF1ojyQIr0BGtjgtbALMeS6K8ylrr/FdPLqsm5gC10ZqgVF0/yQ
iLQ=
=O1hB
-----END PGP SIGNATURE-----

--------------s62U0Bc1fvUw4PCzC8Y1QxuK--
