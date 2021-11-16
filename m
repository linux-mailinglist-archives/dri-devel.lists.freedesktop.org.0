Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1F452D9D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38C96EB0E;
	Tue, 16 Nov 2021 09:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557ED6EDD0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:11:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D87A91FCA1;
 Tue, 16 Nov 2021 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637053912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRgodCQ1D2SNgxmnw29z6cv1U5WHapmn+AWEF7NxNrQ=;
 b=ADyFwC6DbXIxttoKgGvWikbp2hN2gkhpdf8mbroObNR/LTm/bsv7NVp/QdO/wCpeqDwmQO
 x3tpmWD1gdiAH20lDYSxODk0zble80Ki4d/W0TRI9bbcJ1ED3/8PcBD3naDAg1bueFoS8+
 n5lodWg4dbM05P5jchAqNs9LkwPRLTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637053912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRgodCQ1D2SNgxmnw29z6cv1U5WHapmn+AWEF7NxNrQ=;
 b=y45GqXoQKs5Ch8tKirxqyjiiv2aj8KM46RxRPqpj0Nb2y3Pxx4tRsiy3JpN7xnZDFd001K
 xBAvas0QPNnuhACw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B21D613B37;
 Tue, 16 Nov 2021 09:11:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6KseKth1k2G9AQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Nov 2021 09:11:52 +0000
Message-ID: <e162217a-a605-d284-e142-5132fa5cbb9d@suse.de>
Date: Tue, 16 Nov 2021 10:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-3-tzimmermann@suse.de> <YZKKY2wQS7SEujPh@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YZKKY2wQS7SEujPh@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f030vJVuntWo5PbhztaoAJty"
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
Cc: airlied@linux.ie, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f030vJVuntWo5PbhztaoAJty
Content-Type: multipart/mixed; boundary="------------E4hl59K4HYkq0040ff2esjWK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Message-ID: <e162217a-a605-d284-e142-5132fa5cbb9d@suse.de>
Subject: Re: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-3-tzimmermann@suse.de> <YZKKY2wQS7SEujPh@ravnborg.org>
In-Reply-To: <YZKKY2wQS7SEujPh@ravnborg.org>

--------------E4hl59K4HYkq0040ff2esjWK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDE1LjExLjIxIHVtIDE3OjI3IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIE5vdiAxNSwgMjAyMSBhdCAwMTo1NTozOFBN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEJlc2lkZXMgc29tZSBsZWdh
Y3kgY29kZSwgdm13Z2Z4IGlzIHRoZSBvbmx5IHVzZXIgb2YgRFJNJ3MgaGFzaC0NCj4+IHRh
YmxlIGltcGxlbWVudGF0aW9uLiBDb3B5IHRoZSBjb2RlIGludG8gdGhlIGRyaXZlciwgc28g
dGhhdCB0aGUNCj4+IGNvcmUgY29kZSBjYW4gYmUgcmV0aXJlZC4NCj4gRm9yIHRoZSByZWNv
cmQgLSBJIGhhdmUgbm8gY2x1ZSB3aGF0IGxlZ2FjeSBjb2RlIHVzZXMgdGhlIERSTSBoYXNo
LXRhYmxlDQo+IGZvci4NCj4gDQo+Pg0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLiBIb3dl
dmVyLCB0aGUgcmVhbCBzb2x1dGlvbiBmb3Igdm13Z2Z4IGlzIHRvDQo+PiB1c2UgTGludXgn
IGdlbmVyaWMgaGFzaC10YWJsZSBmdW5jdGlvbnMuDQo+IFdvdWxkIGl0IGJlIHBvc3NpYmxl
IHRvIHVzZSB0aGUgTGludXggaGFzaC10YWJsZSBub3cgcmF0aGVyIHRoYW4gdGhpcw0KPiBt
aWQtc3RlcCB3aGVyZSBhIGxvdCBvZiBjb2RlIGlzIGFkZGVkIHRvIHdtZ2Z4IG9ubHkgdG8g
YmUgcmVtb3ZlZA0KPiBsYXRlcj8NCg0KSSBpbmRlZWQgY29uc2lkZXJlZCB0byByZXBsYWNl
IHRoZSBoYXNodGFibGUgd2l0aCBMaW51eCcgaW1wbGVtZW50YXRpb24uIA0KQnV0IHRoZSBk
aWZmZXJlbmNlcyBhcmUgc2xpZ2h0bHkgbW9yZSBpbnZvbHZlZCB0aGFuIGp1c3QgQVBJIGNo
YW5nZXMgYW5kIA0KYSBoYXNodGFibGUncyBwZXJmb3JtYW5jZSBvZnRlbiBkZXBlbmRzIG9u
IGl0cyBjb25maWd1cmF0aW9uLiBJbiB0aGUgDQplbmQsIEkgZGlkbid0IGZlZWwgY29uZmlk
ZW50IGVub3VnaCB0byBtYWtlIHRoaXMgY2hhbmdlIHdpdGhvdXQgZG9pbmcgDQpkYW1hZ2Uu
DQoNCj4gDQo+IElmIHdlIGdvIGZvciB0aGlzIHdheSB0aGVuIGEgdG9kbyBpdGVtIHRvIGZp
eCB0aGlzIGluIHdtZ2Z4IHNvIHNvbWVvbmUNCj4gY2FuIGZpeCB0aGlzIGxhdGVyIHdvdWxk
IGJlIG5pY2UuDQoNClN1cmUuIEknbGwgYWRkIG9uZS4gWmFjayBhbHJlYWR5IHNlZW1zIGlu
dGVyZXN0ZWQgaW4gaGF2aW5nIHNvbWVvbmUgZnJvbSANCmhpcyB0ZWFtIHdvcmtpbmcgb24g
aXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IAlTYW0NCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------E4hl59K4HYkq0040ff2esjWK--

--------------f030vJVuntWo5PbhztaoAJty
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGTddgFAwAAAAAACgkQlh/E3EQov+CM
vw/+ICUzVDtl+3S+ULFXbiNsbZ66QwQ+Zz90liIe4CaU0zOllwBv1pdw83p2DV56LR/veTl8DS8O
DAPaWwH8J820Ngx7LbnMu9xNvOp0CAfVdDkB5lD5UhoZTf+Ll9NrXJbe7a9f4coh6+LLUCeyMyxk
xd6aiNP1uIGAxJzuxsLIqafFHFJvOYWG+K7mUrKUN5u8pszfmp7upSFw4uQw8MB1dDjt8iZjAzMd
IyJGC8JqV1IffEk5+o24rw/N6JWUcZXqkebZheYRBvt8vQaDD2xV/s4J1aWnbC29udKN5VlZG8rN
QUFphk/M9z6Gqa4CZxB4MnVztpZw9k/c9rvoZd1GFcY10ZYsV7M+uOE5MmpQhAn5yhF3mj5c1qno
C+PKiTu3idTAxcjOtGrqRp1lR8m4rrjMAIdsdKc33/N+FaKeowqf6ctucLzmCT/i1LeV+yDApUS5
hzNOhg4572UWC1kR2jHbhuvmD4K9I+FEMqwc2hI9M4pdjjnAyusnDIhNGRqfIR6Ilpnnae2TdzRH
75ceDuygjzyJaL9kEi1Bodk75qIT6FDL0wclH84qu4wscbU+bZl4tb6ZeTIhampOzR5B3cVdJcwb
oYHKPgn68dGDs7oa0wI6xxgdvLQJOc61MCFjTXHUnGM5EfwCwS298gmDPwuGU4bAwp4asevHMg4u
7A8=
=Vumx
-----END PGP SIGNATURE-----

--------------f030vJVuntWo5PbhztaoAJty--
