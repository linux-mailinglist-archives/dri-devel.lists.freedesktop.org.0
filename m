Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D074613D7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 12:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8797B6F8D2;
	Mon, 29 Nov 2021 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF456F8D2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 11:26:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A0C2212C5;
 Mon, 29 Nov 2021 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638185199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyeD61G0icp3J1TdJP8AWxOrAGeJ77KjoN9LFoIb5T0=;
 b=G0zqE/lKiyd7B7DEQdRo0VT6O8rjuk4qwA9WKoOpq27gIhg8l3tgn+gVFZoCvz3oBH/Hah
 76mSVyMk8WbvZr7hNQT/1Olksnr32CCZ8b3IbPbwfax6RXhArRSls6LcU22RgS7l0gxdEu
 E0sxAa30pNZthll/2cFJQmwj74Ohz1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638185199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyeD61G0icp3J1TdJP8AWxOrAGeJ77KjoN9LFoIb5T0=;
 b=IsoaSTbm3+RVE8pj0xNBAeskmhk/M0OP9o7sYgID3C7zsSZV8/XIMK8OpeInRDsHXwtXi3
 wPrRlzg4R9D6fBBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14E5913B53;
 Mon, 29 Nov 2021 11:26:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g54eBO+4pGHrEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 29 Nov 2021 11:26:39 +0000
Message-ID: <f4b39541-3213-341d-bbf5-e6de9c1ad8f5@suse.de>
Date: Mon, 29 Nov 2021 12:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4TPyDD8UaA508Fl0dHc8CnpN"
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
Cc: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4TPyDD8UaA508Fl0dHc8CnpN
Content-Type: multipart/mixed; boundary="------------pvJ6Y0v5xZgW0Ta4QDP0nNMV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <f4b39541-3213-341d-bbf5-e6de9c1ad8f5@suse.de>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
In-Reply-To: <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>

--------------pvJ6Y0v5xZgW0Ta4QDP0nNMV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTEuMjEgdW0gMDQ6MjMgc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBP
biAxOC8xMS8yMDIxIDE4LjE5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+
Pg0KPj4gQW0gMTcuMTEuMjEgdW0gMTU6NTggc2NocmllYiBIZWN0b3IgTWFydGluOg0KPj4+
IEBAIC04OTcsNSArODk4LDIxIEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIA0K
Pj4+IHNpbXBsZWRybV9wbGF0Zm9ybV9kcml2ZXIgPSB7DQo+Pj4gwqDCoCBtb2R1bGVfcGxh
dGZvcm1fZHJpdmVyKHNpbXBsZWRybV9wbGF0Zm9ybV9kcml2ZXIpOw0KPj4+ICtzdGF0aWMg
aW50IF9faW5pdCBzaW1wbGVkcm1faW5pdCh2b2lkKQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPj4+ICsNCj4+PiArwqDCoMKgIGlmIChJU19FTkFC
TEVEKENPTkZJR19PRl9BRERSRVNTKSAmJiBvZl9jaG9zZW4pIHsNCj4+PiArwqDCoMKgwqDC
oMKgwqAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShvZl9jaG9zZW4sIG5wKSB7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAi
c2ltcGxlLWZyYW1lYnVmZmVyIikpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5wLCBOVUxMLCBOVUxMKTsNCj4+PiAr
wqDCoMKgwqDCoMKgwqAgfQ0KPj4+ICvCoMKgwqAgfQ0KPj4+ICsNCj4+PiArwqDCoMKgIHJl
dHVybiAwOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtmc19pbml0Y2FsbChzaW1wbGVkcm1faW5p
dCk7DQo+Pj4gKw0KPj4NCj4+IFNpbXBsZWRybSBpcyBqdXN0IGEgZHJpdmVyLCBidXQgdGhp
cyBpcyBwbGF0Zm9ybSBzZXR1cCBjb2RlLiBXaHkgaXMgdGhpcw0KPj4gY29kZSBsb2NhdGVk
IGhlcmUgYW5kIG5vdCB1bmRlciBhcmNoLyBvciBkcml2ZXJzL2Zpcm13YXJlLz8NCj4+DQo+
PiBJIGtub3cgdGhhdCBvdGhlciBkcml2ZXJzIGRvIHNpbWlsYXIgdGhpbmdzLCBpdCBkb2Vz
bid0IHNlZW0gdG8gYmVsb25nIA0KPj4gaGVyZS4NCj4gDQo+IFRoaXMgZGVmaW5pdGVseSBk
b2Vzbid0IGJlbG9uZyBpbiBlaXRoZXIgb2YgdGhvc2UsIHNpbmNlIGl0IGlzIG5vdCBhcmNo
LSANCj4gb3IgZmlybXdhcmUtc3BlY2lmaWMuIEl0IGlzIGltcGxlbWVudGluZyBzdXBwb3J0
IGZvciB0aGUgc3RhbmRhcmQgDQo+IHNpbXBsZS1mcmFtZWJ1ZmZlciBPRiBiaW5kaW5nLCB3
aGljaCBzcGVjaWZpZXMgdGhhdCBpdCBtdXN0IGJlIGxvY2F0ZWQgDQo+IHdpdGhpbiB0aGUg
L2Nob3NlbiBub2RlIChhbmQgdGh1cyB0aGUgZGVmYXVsdCBPRiBzZXR1cCBjb2RlIHdvbid0
IGRvIHRoZSANCj4gbWF0Y2hpbmcgZm9yIHlvdSk7IHRoaXMgYXBwbGllcyB0byBhbGwgT0Yg
cGxhdGZvcm1zIFsxXQ0KPiANCj4gQWRkaW5nIFJvYjsgZG8geW91IHRoaW5rIHRoaXMgc2hv
dWxkIG1vdmUgZnJvbSBzaW1wbGVmYi9zaW1wbGVkcm0gdG8gDQo+IGNvbW1vbiBPRiBjb2Rl
PyAod2hlcmU/KQ0KDQpwaW5nIQ0KDQo+IA0KPiBbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc2ltcGxlLWZyYW1lYnVmZmVyLnlhbWwNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------pvJ6Y0v5xZgW0Ta4QDP0nNMV--

--------------4TPyDD8UaA508Fl0dHc8CnpN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGkuO4FAwAAAAAACgkQlh/E3EQov+D6
9A/8DUk3vwTjfkCaj0jM1eXuz4tpUGPB60I2nAv0hydW4KkI2M5QJuoYZPyDpspIUZThl0/3/QFR
5qexhNgaccHJ3uBwDalAmwtj3qtxTdsMGDX9VR5qYbItjHuApqDW3P+8pZq8ZjTnhfi0sWhDYFxx
7JIVXR3GiRkm7fHkN24dYFN+vCs7Gp6gsLFa85Qvd681re5gvIdRHs4qMPEM0KEGg9WYc1B4olR4
CllJnVoYb89cOpTtVAoEXjUFJBNSCWOgXEiq28kuEIbai6DSH5zchJvtYmBYw70OiyCfjN3+z+Qk
f5j3nyhL4P8RyelfaSnFSMeIihqKbYnlBvYVDKokS5kwFL5+fzGpjXD4ZcdVOUQWc3fdXFCu5TDD
mOX4Vb2CA6oVceMdHbqfEo6ZJ1rwczCRgb1edlreaGVEdS/QSJzga6UGRQJ2hrUm5lD8L+ebl4ex
bN2YO/3V8GkTvIGEAjvzCumnoXc1OVz1faAZisr54OXRMtbDUBnW/V6h8earMx3Daz5JMNTwDxD+
DvpbdsbhBjav7BBdWExb6lEAD0E0B75ffx70IHdpu13elSQWYLsOKqJvCUHJ3Po45IKNXD2Miu35
EvGKifLcQb/Ql96m0zdKbE0nXwOwyS3RfgC4hXLZry1bnMmCHtQkHIBXlgvDRPzWyS7hLxgwRBbc
PfA=
=uuq9
-----END PGP SIGNATURE-----

--------------4TPyDD8UaA508Fl0dHc8CnpN--
