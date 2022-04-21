Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D563550A806
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3511410E5B3;
	Thu, 21 Apr 2022 18:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0DE10E5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 18:23:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 30E151F388;
 Thu, 21 Apr 2022 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650565414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GVcyh6fHbxs4D76T9GmSrZZJy98rOBZ0c1BRUhJTQU4=;
 b=ERPdnv7ufzLynAjk455LRmzVz/vnmduXc3M+iAgDkG4UesS5QzbWmajs8XDvLko92vhl6+
 23JyZEwU35KpZAlwDrn5hYEcjxaDUxI4QYsILZpNRDAHZ2yuSzj+0whrEqpi3qDQFV2WNT
 HXn1wJDaozbnwnQ1KjeJVdtv+d7YnAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650565414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GVcyh6fHbxs4D76T9GmSrZZJy98rOBZ0c1BRUhJTQU4=;
 b=mXR+E0ATfKV2luIWXkk6gH7Bp3vJmyKskF8YA3WA54dzhomDtEtYDac3RzD5fJgVeKdsLC
 8GTLjSDaw5swv4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D58113446;
 Thu, 21 Apr 2022 18:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BxtFAiahYWKcHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 18:23:34 +0000
Message-ID: <c3ed82bc-cc15-7d0d-8968-b71ad3d4003f@suse.de>
Date: Thu, 21 Apr 2022 20:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: James Hilliard <james.hilliard1@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
 <10c81e57-2f09-f4f8-dc2f-6bd05ef819d7@redhat.com>
 <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>
 <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>
In-Reply-To: <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R6U7y4YzMHVpZep0Qp7a1eY7"
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R6U7y4YzMHVpZep0Qp7a1eY7
Content-Type: multipart/mixed; boundary="------------Ol2b8gfzFkkT4zmOof6ZA8cm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: James Hilliard <james.hilliard1@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <c3ed82bc-cc15-7d0d-8968-b71ad3d4003f@suse.de>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
 <10c81e57-2f09-f4f8-dc2f-6bd05ef819d7@redhat.com>
 <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>
 <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>
In-Reply-To: <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>

--------------Ol2b8gfzFkkT4zmOof6ZA8cm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjIgdW0gMjA6MjIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDIxLjA0LjIyIHVtIDE5OjM5IHNjaHJpZWIgSmFtZXMgSGlsbGlh
cmQ6DQo+PiBPbiBUaHUsIEFwciAyMSwgMjAyMiBhdCA4OjIyIEFNIEphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcw0KPj4gPGphdmllcm1AcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBP
biA0LzIxLzIyIDE0OjU0LCBQYXRyaWsgSmFrb2Jzc29uIHdyb3RlOg0KPj4+PiBPbiBUaHUs
IEFwciAyMSwgMjAyMiBhdCAyOjQ3IFBNIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0KPj4+
PiA8amF2aWVybUByZWRoYXQuY29tPiB3cm90ZToNCj4+Pg0KPj4+IFtzbmlwXQ0KPj4+DQo+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9LY29uZmlnIA0K
Pj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcNCj4+Pj4+Pj4+IGlu
ZGV4IDBjZmYyMDI2NWY5Ny4uYTQyMmZhODRkNTNiIDEwMDY0NA0KPj4+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9LY29uZmlnDQo+Pj4+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL0tjb25maWcNCj4+Pj4+Pj4+IEBAIC0yLDExICsyLDEzIEBADQo+
Pj4+Pj4+PiDCoMKgIGNvbmZpZyBEUk1fR01BNTAwDQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAg
dHJpc3RhdGUgIkludGVsIEdNQTUwMC82MDAvMzYwMC8zNjUwIEtNUyBGcmFtZWJ1ZmZlciIN
Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIERSTSAmJiBQQ0kgJiYgWDg2ICYm
IE1NVQ0KPj4+Pj4+Pj4gK8KgwqDCoMKgIGRlcGVuZHMgb24gRkINCj4+Pj4+Pj4NCj4+Pj4+
Pj4gV2h5IGRvIHdlIG5lZWQgRkIgaGVyZT8gRnJhbWVidWZmZXIgc3VwcG9ydCBzaG91bGQg
YmUgaGlkZGVuIGJ5IA0KPj4+Pj4+PiBEUk0ncw0KPj4+Pj4+PiBmYmRldiBoZWxwZXJzLg0K
Pj4+Pj4+DQo+Pj4+Pj4gSXQgaXMgbm90IG5lZWRlZCBidXQgZ2l2ZXMgaGltIHZpZGVvIG91
dHB1dCBzaW5jZSBpdCBlbmFibGVzIHRoZSBkcm0NCj4+Pj4+PiBmYmRldiBlbXVsYXRpb24u
DQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBJJ20gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB0aGlz
LiBTaG91bGRuJ3QgZGVwZW5kIG9uIA0KPj4+Pj4gRFJNX0ZCREVWX0VNVUxBVElPTiB0aGVu
Pw0KPj4+Pg0KPj4+PiBObywgaXQgc2hvdWxkbid0IGRlcGVuZCBvbiBhbnkgRkJERVYgc3R1
ZmYgc2luY2UgaXQncyBub3QgYWN0dWFsbHkNCj4+Pj4gcmVxdWlyZWQuIEl0IGp1c3QgaGFw
cGVucyB0byBoZWxwIGluIHRoaXMgY2FzZSBzaW5jZSB3ZXN0b24gKyBmYmRldg0KPj4+PiBi
YWNrZW5kIHdvcmtzIGJ1dCBub3Qgd2VzdG9uIHdpdGggZHJtIGJhY2tlbmQgKG9yIHdoYXRl
dmVyIGNvbmZpZw0KPj4+PiBKYW1lcyBoYXZlIHNldCkuDQo+Pj4NCj4+PiBJIHNlZS4gVGhl
biB0aGUgY29ycmVjdCBhcHByb2FjaCBmb3IgdGhlbSB3b3VsZCBiZSB0byBqdXN0IGVuYWJs
ZSANCj4+PiBDT05GSUdfRkINCj4+PiBhbmQgRFJNX0ZCREVWX0VNVUxBVElPTiBpbiB0aGVp
ciBrZXJuZWwgY29uZmlnLCByYXRoZXIgdGhhbiBtYWtpbmcgDQo+Pj4gdGhpcyB0bw0KPj4+
IGRlcGVuZCBvbiBhbnl0aGluZyBGQiByZWxhdGVkIGFzIHlvdSBzYWlkLg0KPj4NCj4+IFll
YWgsIHNvIGl0IGxvb2tzIGxpa2UgQ09ORklHX0ZCX0VGSSBpcyBub3QgbmVlZGVkIGJ1dA0K
Pj4gQ09ORklHX0RSTV9GQkRFVl9FTVVMQVRJT04gaXMsIEkgdGhpbmsgSSBqdXN0IGFzc3Vt
ZWQgZWZpZmINCj4+IHdhcyB3aGF0IHdhcyBuZWVkZWQgYmFzZWQgb24gdGhlIGtlcm5lbCBs
b2dzLg0KPj4NCj4+IFRoaXMgZG9lcyBub3Qgd29yazoNCj4+IENPTkZJR19GQiBlbmFibGVk
DQo+PiBDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTiBkaXNhYmxlZA0KPj4NCj4+IFRoaXMg
d29ya3M6DQo+PiBDT05GSUdfRkIgZW5hYmxlZA0KPj4gQ09ORklHX0RSTV9GQkRFVl9FTVVM
QVRJT04gZW5hYmxlZA0KPj4NCj4+Pg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+PiBJIGxvb2tlZCBz
b21lIG1vcmUgYXQgdGhlIGxvZ3MgYW5kIGl0IHNlZW1zIHdlc3RvbiBkb2Vzbid0IHdvcmsg
b24gDQo+Pj4+Pj4gaGlzDQo+Pj4+Pj4gc3lzdGVtIHdpdGhvdXQgdGhlIGZiZGV2IGJhY2tl
bmQuIFNvIHRoZSBxdWVzdGlvbiBpcyB3aHkgd2VzdG9uIGlzbid0DQo+Pj4+Pj4gd29ya2lu
ZyB3aXRob3V0IGZiZGV2PyBQZXJoYXBzIHRoaXMgaXMganVzdCBhIFdlc3RvbiBjb25maWd1
cmF0aW9uDQo+Pj4+Pj4gaXNzdWU/DQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBCdXQgaXMgd2Vz
dG9uIHVzaW5nIHRoZSBmYmRldiBlbXVsYXRlZCBieSBEUk0gb3IgdGhlIG9uZSByZWdpc3Rl
cmVkIGJ5DQo+Pj4+PiBlZmlmYj8gSSB0aG91Z2h0IHRoYXQgdGhlIGxhdHRlciBmcm9tIHdo
YXQgd2FzIG1lbnRpb25lZCBpbiB0aGlzIA0KPj4+Pj4gdGhyZWFkLg0KPj4+Pg0KPj4+PiBJ
dCdzIHVzaW5nIGRybSBmYmRldiBlbXVsYXRpb24gd2l0aCBnbWE1MDAgc28gRUZJRkIgaGFz
IG5vdGhpbmcgdG8gZG8NCj4+Pj4gd2l0aCB0aGlzLiBJIGJlbGlldmUgaXQgd2FzIGp1c3Qg
c2ltcGx5IGluY29ycmVjdGx5IHJlcG9ydGVkLiBJZiBJJ20NCj4+Pj4gY29ycmVjdCB0aGVu
ICJkZXBlbmRzIG9uIEZCIiBpcyB3aGF0IG1ha2VzIHZpZGVvIG91dHB1dCB3b3JrIGZvcg0K
Pj4+PiBKYW1lcy4NCj4+Pj4NCj4+Pg0KPj4+IEdvdCBpdC4gVGhhbmtzIGZvciB0aGUgY2xh
cmlmaWNhdGlvbi4NCj4+DQo+PiBIZXJlJ3MgbXkgd2VzdG9uLmluaToNCj4+IFtjb3JlXQ0K
Pj4gc2hlbGw9a2lvc2stc2hlbGwuc28NCj4+IG1vZHVsZXM9c3lzdGVtZC1ub3RpZnkuc28N
Cj4+IGJhY2tlbmQ9ZHJtLWJhY2tlbmQuc28NCj4+IGlkbGUtdGltZT0wDQo+PiByZXF1aXJl
LWlucHV0PWZhbHNlDQo+PiB1c2UtcGl4bWFuPXRydWUNCj4+DQo+PiBbc2hlbGxdDQo+PiBs
b2NraW5nPWZhbHNlDQo+PiBjdXJzb3ItdGhlbWU9T2JzaWRpYW4NCj4+IHBhbmVsLXBvc2l0
aW9uPW5vbmUNCj4+DQo+PiBbb3V0cHV0XQ0KPj4gbmFtZT1EVkktRC0xDQo+PiB0cmFuc2Zv
cm09cm90YXRlLTI3MA0KPj4NCj4+IFtvdXRwdXRdDQo+PiBuYW1lPURQLTINCj4+IG1vZGU9
b2ZmDQo+Pg0KPj4gW291dHB1dF0NCj4+IG5hbWU9TFZEUy0xDQo+PiBtb2RlPW9mZg0KPiAN
Cj4gWW91IG1lbnRpb25lZCB0aGF0IHlvdSB3YW50IHRvIHVzZSBIRE1JLCBidXQgaXQncyBu
b3QgY29uZmlndXJlZCBoZXJlLiANCj4gSXMgdGhhdCBpbnRlbnRpb25hbGx5Pw0KDQpOZXZl
cm1pbmQuIEkganVzdCBzYXcgdGhhdCBEVkktRC0xIGlzIHRoZSBIRE1JIHBvcnQuICh3aHk/
KQ0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPj4NCj4+IFtsaWJpbnB1
dF0NCj4+IHRvdWNoc2NyZWVuX2NhbGlicmF0b3I9dHJ1ZQ0KPj4NCj4+Pg0KPj4+IC0tIA0K
Pj4+IEJlc3QgcmVnYXJkcywNCj4+Pg0KPj4+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0K
Pj4+IExpbnV4IEVuZ2luZWVyaW5nDQo+Pj4gUmVkIEhhdA0KPj4+DQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------Ol2b8gfzFkkT4zmOof6ZA8cm--

--------------R6U7y4YzMHVpZep0Qp7a1eY7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhoSUFAwAAAAAACgkQlh/E3EQov+D5
rA/+PdWlcErjLC6VFv+95BQGc9yQ8R/2MBSfoeqoQJ41/JI22yoFiozZu6Cao2kstO6faLD+UU5M
Nb3Y1rHBJWXzn9zBiD4Xky67YuIcXxc7HNE7klNlMrdNqDZYRuc9d9+55K9YB8cfiViNJgTYQV7C
Bf8Et8Q1JesDra4fFBMJ66E1Y3DAUucXsZYifKt0QMp1cC23agL0T8zHDMLlNQFY32xilR4II1X+
ZF5lBIyfd06jsSiA9Ts4mwTo3j9vy+2WWg4QaMUzP6MLZqMLbXBqT9q4O3T7VlDXsCImJnWiT+ZT
2ZXdmn7HPO7Dd1onAth0oNk6TAM6DvZk+WHbom6Z64slaE6gQ/z5l5bKf3U7PRZbWyOzdIxRTmmj
yqDJU0B5NnQGAwqui2yMeHki9yfGD+9GtJcH+PZTwPg52+H1Gq4S80ADppq4Ln2bjDwYt2S85lzb
Lcsb+eIzTHqATBrb4qEzTsdw2RjIIFK341yTjg3Zetx4PHnkViV/ERXRaOUacZTwKh6XYORjbvHN
qwa5m6n/L1lHDi/Q6X4HwMu9hmtnl2dTIWfW+WzaTGVFR+JAgKi1fJTNHZBvcjkOAABMgHDA9u4k
Ilk8MurX4mISx4sygC1CHaEBpBi90j/3oOyanTFg4CAvOb1ApA5Y5U6u9nBSNBbGan26mGfN16Sc
O48=
=Anjv
-----END PGP SIGNATURE-----

--------------R6U7y4YzMHVpZep0Qp7a1eY7--
