Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E050A097
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D042010E5E6;
	Thu, 21 Apr 2022 13:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541D10E5E6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:20:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E9D121112;
 Thu, 21 Apr 2022 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650547256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXVJK5OuTx/Z8uOPu96yrjknjxjZwcsJUq2XnsFlmXY=;
 b=e09ww8F0702pmFLGnnlRpLaIQbbsgd2SaQxCkmARoVVMZ5XvB7ll0OZqa0ua7ZwxD4XcnM
 mCXDUWODPwRhpvTO1wn3+vKvt8vYa3Tttw3nsx8pI2/HwvlmxC9ihDC/nP8vl4TNIs4N1q
 4pxi2isDOR0kENHIR1gViP+ZTdqn//E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650547256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXVJK5OuTx/Z8uOPu96yrjknjxjZwcsJUq2XnsFlmXY=;
 b=BMJd9QzY3OL62bOps+IL3Ly3mFv7Ji6RzzvPpu4nraZxn/iXK2CXT9hlnnlm9OpgS0Oon5
 YWDzQSXCyMQD6RCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC12613446;
 Thu, 21 Apr 2022 13:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f2PGNDdaYWKoMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 13:20:55 +0000
Message-ID: <09cc1d94-d25e-4fbd-bb95-03d0135cf818@suse.de>
Date: Thu, 21 Apr 2022 15:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pkKQDW2mxSCsL9rwufZo8Cw9"
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
Cc: David Airlie <airlied@linux.ie>, James Hilliard <james.hilliard1@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pkKQDW2mxSCsL9rwufZo8Cw9
Content-Type: multipart/mixed; boundary="------------5d02Ubq1A2ReJ7U2dH9XRIhv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <09cc1d94-d25e-4fbd-bb95-03d0135cf818@suse.de>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
In-Reply-To: <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>

--------------5d02Ubq1A2ReJ7U2dH9XRIhv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjIgdW0gMTQ6NTQgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBPbiBUaHUsIEFwciAyMSwgMjAyMiBhdCAyOjQ3IFBNIEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcw0KPiA8amF2aWVybUByZWRoYXQuY29tPiB3cm90ZToNCj4+DQo+PiBIZWxsbyBQYXRy
aWssDQo+Pg0KPj4gT24gNC8yMS8yMiAxNDozOSwgUGF0cmlrIEpha29ic3NvbiB3cm90ZToN
Cj4+PiBPbiBUaHUsIEFwciAyMSwgMjAyMiBhdCAxOjQ5IFBNIFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+Pj4NCj4+Pj4gSGkNCj4+Pj4NCj4+
Pj4gQW0gMDkuMDQuMjIgdW0gMDY6MjMgc2NocmllYiBKYW1lcyBIaWxsaWFyZDoNCj4+Pj4+
IFNlbGVjdCB0aGUgZWZpIGZyYW1lYnVmZmVyIGlmIGVmaSBpcyBlbmFibGVkLg0KPj4+Pj4N
Cj4+Pj4+IFRoaXMgYXBwZWFycyB0byBiZSBuZWVkZWQgZm9yIHZpZGVvIG91dHB1dCB0byBm
dW5jdGlvbiBjb3JyZWN0bHkuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+
IENoYW5nZXMgdjIgLT4gdjM6DQo+Pj4+PiAgICAgLSBzZWxlY3QgRUZJX0ZCIGluc3RlYWQg
b2YgZGVwZW5kaW5nIG9uIGl0DQo+Pj4+PiBDaGFuZ2VzIHYxIC0+IHYyOg0KPj4+Pj4gICAg
IC0gdXNlIGRlcGVuZHMgaW5zdGVhZCBvZiBzZWxlY3QNCj4+Pj4+IC0tLQ0KPj4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9LY29uZmlnIHwgMiArKw0KPj4+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L0tjb25maWcNCj4+Pj4+IGluZGV4IDBjZmYyMDI2NWY5Ny4uYTQyMmZhODRkNTNiIDEwMDY0
NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9LY29uZmlnDQo+Pj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcNCj4+Pj4+IEBAIC0yLDExICsy
LDEzIEBADQo+Pj4+PiAgICBjb25maWcgRFJNX0dNQTUwMA0KPj4+Pj4gICAgICAgIHRyaXN0
YXRlICJJbnRlbCBHTUE1MDAvNjAwLzM2MDAvMzY1MCBLTVMgRnJhbWVidWZmZXIiDQo+Pj4+
PiAgICAgICAgZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIFg4NiAmJiBNTVUNCj4+Pj4+ICsg
ICAgIGRlcGVuZHMgb24gRkINCj4+Pj4NCj4+Pj4gV2h5IGRvIHdlIG5lZWQgRkIgaGVyZT8g
RnJhbWVidWZmZXIgc3VwcG9ydCBzaG91bGQgYmUgaGlkZGVuIGJ5IERSTSdzDQo+Pj4+IGZi
ZGV2IGhlbHBlcnMuDQo+Pj4NCj4+PiBJdCBpcyBub3QgbmVlZGVkIGJ1dCBnaXZlcyBoaW0g
dmlkZW8gb3V0cHV0IHNpbmNlIGl0IGVuYWJsZXMgdGhlIGRybQ0KPj4+IGZiZGV2IGVtdWxh
dGlvbi4NCj4+Pg0KPj4NCj4+IEknbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHRoaXMuIFNo
b3VsZG4ndCBkZXBlbmQgb24gRFJNX0ZCREVWX0VNVUxBVElPTiB0aGVuPw0KDQpJdCBoYXMg
dG8gYmUgc2VsZWN0ZWQgc2VwYXJhdGVseSBpbiAuY29uZmlnLg0KDQpKYW1lcywgbWFrZSBz
dXJlIHlvdSBoYXZlIERSTV9GQkRFVl9FTVVMQVRJT04gZW5hYmxlZCBpbiB5b3VyIGtlcm5l
bCdzIA0KLmNvbmZpZyBmaWxlIGlmIHlvdSB3YW50IGEgY29uc29sZS4gaG93ZXZlciwgV2Vz
dG9uIHNob3VsZCB3b3JrIHdpdGhvdXQgDQppdC4gIEhvdyBkbyB5b3Ugc3RhcnQgd2VzdG9u
IHdpdGhvdXQgYSBjb25zb2xlPw0KDQo+IA0KPiBObywgaXQgc2hvdWxkbid0IGRlcGVuZCBv
biBhbnkgRkJERVYgc3R1ZmYgc2luY2UgaXQncyBub3QgYWN0dWFsbHkNCj4gcmVxdWlyZWQu
IEl0IGp1c3QgaGFwcGVucyB0byBoZWxwIGluIHRoaXMgY2FzZSBzaW5jZSB3ZXN0b24gKyBm
YmRldg0KPiBiYWNrZW5kIHdvcmtzIGJ1dCBub3Qgd2VzdG9uIHdpdGggZHJtIGJhY2tlbmQg
KG9yIHdoYXRldmVyIGNvbmZpZw0KPiBKYW1lcyBoYXZlIHNldCkuDQo+IA0KPj4NCj4+PiBJ
IGxvb2tlZCBzb21lIG1vcmUgYXQgdGhlIGxvZ3MgYW5kIGl0IHNlZW1zIHdlc3RvbiBkb2Vz
bid0IHdvcmsgb24gaGlzDQo+Pj4gc3lzdGVtIHdpdGhvdXQgdGhlIGZiZGV2IGJhY2tlbmQu
IFNvIHRoZSBxdWVzdGlvbiBpcyB3aHkgd2VzdG9uIGlzbid0DQo+Pj4gd29ya2luZyB3aXRo
b3V0IGZiZGV2PyBQZXJoYXBzIHRoaXMgaXMganVzdCBhIFdlc3RvbiBjb25maWd1cmF0aW9u
DQo+Pj4gaXNzdWU/DQo+Pj4NCj4+DQo+PiBCdXQgaXMgd2VzdG9uIHVzaW5nIHRoZSBmYmRl
diBlbXVsYXRlZCBieSBEUk0gb3IgdGhlIG9uZSByZWdpc3RlcmVkIGJ5DQo+PiBlZmlmYj8g
SSB0aG91Z2h0IHRoYXQgdGhlIGxhdHRlciBmcm9tIHdoYXQgd2FzIG1lbnRpb25lZCBpbiB0
aGlzIHRocmVhZC4NCj4gDQo+IEl0J3MgdXNpbmcgZHJtIGZiZGV2IGVtdWxhdGlvbiB3aXRo
IGdtYTUwMCBzbyBFRklGQiBoYXMgbm90aGluZyB0byBkbw0KPiB3aXRoIHRoaXMuIEkgYmVs
aWV2ZSBpdCB3YXMganVzdCBzaW1wbHkgaW5jb3JyZWN0bHkgcmVwb3J0ZWQuIElmIEknbQ0K
PiBjb3JyZWN0IHRoZW4gImRlcGVuZHMgb24gRkIiIGlzIHdoYXQgbWFrZXMgdmlkZW8gb3V0
cHV0IHdvcmsgZm9yDQo+IEphbWVzLg0KDQpUaGVyZSdzIGFuIGZiZGV2IGJhY2tlbmQgZm9y
IHdlc3RvbiwgYnV0IHRoZSBwcm92aWRlZCBsb2dzIGRvbid0IGxvb2sgYXMgDQppZiBpdCdz
IHVzaW5nIHRoaXMuICBNYXliZSB0aGUgY29ubmVjdG9yJ3MgbW9kZXMgYXJlIG5ldmVyIHBy
b2JlZCANCmNvcnJlY3RseSB3aXRob3V0IGZiZGV2Lg0KDQpKYW1lcywgY291bGQgeW91IHBy
b3ZpZGUgYSBsb2dmaWxlIGZvciB3ZXN0b24/IChpLmUuLCAnd2VzdG9uIA0KLS1sb2c9d2Vz
dG9uLnR4dCcpLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4NCj4+IC0tDQo+
PiBCZXN0IHJlZ2FyZHMsDQo+Pg0KPj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzDQo+PiBM
aW51eCBFbmdpbmVlcmluZw0KPj4gUmVkIEhhdA0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------5d02Ubq1A2ReJ7U2dH9XRIhv--

--------------pkKQDW2mxSCsL9rwufZo8Cw9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhWjcFAwAAAAAACgkQlh/E3EQov+C4
JxAArRCysRzsNK8WpuDb8WF8R5RPVROjLuLMTNsLjCVF2MBecrdFF3Q6v9KO11hbIFDyzIs2EgjW
/3fGi5zi/3Tub4gonBleV4uZYu5mWGkoY/VlCgxNGoV2KIwLWCHDkKCYLebVHF6FXRz3ouj8EzxG
A9TYJNYZgFQcG7+fTbk0NrXzAlLwimkv2+282FGqKzRM0VEDmrG5H0FVvaMGL6fGdSIsV0XVFRQ/
o7ip0EsR3GvvCR9BqKNjM03x33vTaslMuZbyqmUrrUPYo27sC3dNFFBu4XQOzvIQBawpg0Aio2rO
wOBXu1qmStGIGUCfpgIdG71LSD/UQUSBc99bRm7r/NbFvP2UIc2QvZ9Xfp5yHfdzJHL62tk6Ii/x
8alKYvEqJVQGJn3IwvPIDM24mE7E8KAXUquXP9/slZlYENCiVDCyVeOhzDfoP05tspgFV5lhHB8L
0seUNDAfqMLXBaMmLYh+x6Z2QQVFl95CnKdjrkOzI81Y1EVFsYsP+yBvcpBIdKJ4CLXavoQtInt1
GgucOc4Z7+lpZz6733n+F5+69qiS8UJ3QzN8CUYeO79BcvrH0lxwau2NDBg2/Y2gmvi7BclPF9dY
Y6talb5LRP5weNQ9Rbok0BmoqTRyy/nYDK+ep+hx+Mr9OYStluoRtCzQg8CrG8g09Eb/b65S2006
rXg=
=+Req
-----END PGP SIGNATURE-----

--------------pkKQDW2mxSCsL9rwufZo8Cw9--
