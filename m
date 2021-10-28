Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC843E898
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 20:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30376E438;
	Thu, 28 Oct 2021 18:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4176E438
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:46:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81E941FD53;
 Thu, 28 Oct 2021 18:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635446760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ecWVPcwOfzpV0QpOBidyI3KRjmXmd+oaLSz7CPNfAeI=;
 b=KhkBBOn2Vdct7RM/TTVUyX+511kWS5r5BqL7En9hUhxS4OurA+OH2jw8J5Hhv4NrBWsbbQ
 ajChZGk4Y4pK+C30piZ5BIY5RmibPc/HSnP8m9ex69nSQbKXBmHLocx16vB3PglXwe3baK
 xhh2E51GCMQe/U8JtrUCOIad3cSPG1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635446760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ecWVPcwOfzpV0QpOBidyI3KRjmXmd+oaLSz7CPNfAeI=;
 b=v8wLO+0StmBGDA07NDUBcmqFxhV4POUZhzQMPiCZBXzKjODhhwzFrl3+pN6kkwueK1OjAq
 tsb3uY8rwJSipoBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C52113F51;
 Thu, 28 Oct 2021 18:46:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id arReCejvemF/fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Oct 2021 18:46:00 +0000
Message-ID: <e5b4681a-36cd-20ba-c763-c4ff00732eb4@suse.de>
Date: Thu, 28 Oct 2021 20:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] drm: import DMA_BUF module namespace
Content-Language: en-US
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "lkft@linaro.org" <lkft@linaro.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
References: <20211027152534.3366799-1-marcel@ziswiler.com>
 <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
 <0f90b5da6139316429363fc14f76e96366f4a4b5.camel@toradex.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0f90b5da6139316429363fc14f76e96366f4a4b5.camel@toradex.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mErstqRuzD08suBMKdvgcL6H"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mErstqRuzD08suBMKdvgcL6H
Content-Type: multipart/mixed; boundary="------------YoNzEKjaCWljAM4gZ7Iwc0LE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "lkft@linaro.org" <lkft@linaro.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Message-ID: <e5b4681a-36cd-20ba-c763-c4ff00732eb4@suse.de>
Subject: Re: [PATCH v1] drm: import DMA_BUF module namespace
References: <20211027152534.3366799-1-marcel@ziswiler.com>
 <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
 <0f90b5da6139316429363fc14f76e96366f4a4b5.camel@toradex.com>
In-Reply-To: <0f90b5da6139316429363fc14f76e96366f4a4b5.camel@toradex.com>

--------------YoNzEKjaCWljAM4gZ7Iwc0LE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMTAuMjEgdW0gMjI6NTQgc2NocmllYiBNYXJjZWwgWmlzd2lsZXI6DQo+
IFNhbGkgVGhvbWFzDQo+IA0KPiBPbiBXZWQsIDIwMjEtMTAtMjcgYXQgMjA6MzAgKzAyMDAs
IFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gdGhhbmtzIGZvciB0
aGUgcGF0Y2guDQo+IA0KPiBZb3UgYXJlIHZlcnkgd2VsY29tZS4NCj4gDQo+PiBBbSAyNy4x
MC4yMSB1bSAxNzoyNSBzY2hyaWViIE1hcmNlbCBaaXN3aWxlcjoNCj4+PiBGcm9tOiBNYXJj
ZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4+Pg0KPj4+IFRv
ZGF5J3MgLW5leHQgZmFpbHMgYnVpbGRpbmcgYXJtNjQgZGVmY29uZmlnIGFzIGZvbGxvd3M6
DQo+Pj4NCj4+PiBFUlJPUjogbW9kcG9zdDogbW9kdWxlIGRybV9jbWFfaGVscGVyIHVzZXMg
c3ltYm9sIGRtYV9idWZfdnVubWFwIGZyb20NCj4+PiAgwqAgbmFtZXNwYWNlIERNQV9CVUYs
IGJ1dCBkb2VzIG5vdCBpbXBvcnQgaXQuDQo+Pj4gRVJST1I6IG1vZHBvc3Q6IG1vZHVsZSBk
cm1fY21hX2hlbHBlciB1c2VzIHN5bWJvbCBkbWFfYnVmX3ZtYXAgZnJvbQ0KPj4+ICDCoCBu
YW1lc3BhY2UgRE1BX0JVRiwgYnV0IGRvZXMgbm90IGltcG9ydCBpdC4NCj4+Pg0KPj4+IFJl
cG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFy
by5vcmc+DQo+Pj4gRml4ZXM6IGNvbW1pdCA0YjJiNWUxNDJmZjQgKCJkcm06IE1vdmUgR0VN
IG1lbW9yeSBtYW5hZ2VycyBpbnRvIG1vZHVsZXMiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IE1h
cmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KPj4+DQo+Pj4g
LS0tDQo+Pj4NCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5j
IHwgMiArKw0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pj4N
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jDQo+Pj4gaW5kZXggNmY3
YjNmOGVjMDRkMy4uNjlmODU2NGFkMTFjZCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9jbWFfaGVscGVyLmMNCj4+PiBAQCAtMjMsNiArMjMsOCBAQA0KPj4+ICDCoCAj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPg0KPj4+ICDCoCAjaW5jbHVkZSA8
ZHJtL2RybV92bWFfbWFuYWdlci5oPg0KPj4+ICAgIA0KPj4+ICtNT0RVTEVfSU1QT1JUX05T
KERNQV9CVUYpOw0KPj4NCj4+IENvdWxkIHRoaXMgbGluZSBiZSBtb3ZlZCB0byB0aGUgYm90
dG9tIG9mIHRoZSBmaWxlLCB3aGVyZSB0aGUgb3RoZXINCj4+IE1PRFVMRSBzdGF0ZW1lbnRz
IGFyZT8NCj4gDQo+IEhlaGUsIGdvb2QgcXVlc3Rpb24uIEkgd2FzIGFjdHVhbGx5IGFza2lu
ZyBteXNlbGYgdGhlIHNhbWUgYnV0IHF1aWNrbHkgbG9va2luZyBhdCBhIGZldyBmaWxlcyBh
bmQgdGhleSBhbGwgaGFkDQo+IGl0IGFmdGVyIHRoZWlyIGluY2x1ZGVzIHRvd2FyZHMgdGhl
IHRvcC4gVHVybnMgb3V0IHRoYXQgd2FzIHJhdGhlciBzaG9ydCBzaWdodGVkLi4uDQo+IA0K
PiBMZXQgbWUgbG9vayBtb3JlIGNsb3NlbHkuIEN1cnJlbnQgLW5leHQgaGFzIGV4YWN0bHkg
MjAwIGZpbGVzIHdpdGggYSBNT0RVTEVfSU1QT1JUX05TIHN0YXRlbWVudC4gT2theSwgc29t
ZSBvZg0KPiB3aGljaCBhcmUgZG9jdW1lbnRhdGlvbi4gQW55d2F5LCAxMzIgb2Ygd2hpY2gg
ZG8gaGF2ZSBpdCB3aXRoIHRoZWlyIG90aGVyIE1PRFVMRSBtYWNyb3MgdG93YXJkcyB0aGUg
ZW5kIGFzIHlvdQ0KPiBzdWdnZXN0LiAyMCBvZiB3aGljaCBhbmQgbWFpbmx5IERSTSBzdHVm
ZiBoYXMgaXQgdG93YXJkcyB0aGUgdG9wIGFmdGVyIHRoZW0gaW5jbHVkZXMuIEZ1bm55Lg0K
PiANCj4gV2hhdCBkb2VzIHRoZSBkb2N1bWVudGF0aW9uIHN1Z2dlc3Q/DQo+IA0KPiBEb2N1
bWVudGF0aW9uL2NvcmUtYXBpL3N5bWJvbC1uYW1lc3BhY2VzLnJzdA0KPiANCj4gIkl0IGlz
IGFkdmlzYWJsZSB0byBhZGQgdGhlIE1PRFVMRV9JTVBPUlRfTlMoKSBzdGF0ZW1lbnQgY2xv
c2UgdG8gb3RoZXIgbW9kdWxlDQo+IG1ldGFkYXRhIGRlZmluaXRpb25zIGxpa2UgTU9EVUxF
X0FVVEhPUigpIG9yIE1PRFVMRV9MSUNFTlNFKCkuIFJlZmVyIHRvIHNlY3Rpb24NCj4gNS4g
Zm9yIGEgd2F5IHRvIGNyZWF0ZSBtaXNzaW5nIGltcG9ydCBzdGF0ZW1lbnRzIGF1dG9tYXRp
Y2FsbHkuIg0KPiANCj4gVGhlcmUgeW91IGdvLiBQbHVzIHRoZXJlIGlzIGV2ZW4gc29tZSBm
YW5jeSBhdXRvbWF0aW9uICg7LXApLg0KPiANCj4gU28gbGV0IG1lIG1vdmUgaXQgZG93biB0
aGVyZSB0aGVuLg0KDQpXaWxsIHlvdSBzZW5kIG91dCBhbm90aGVyIHJldmlzaW9uIG9mIHRo
ZSBwYXRjaD8NCg0KPiANCj4+IEluIHRoZSBmaXhlZCBjb21taXQgNGIyYjVlMTQyZmY0LCB0
aGVyZSdzIGEgc2ltaWxhciBjaGFuZ2UgZm9yDQo+PiBkcm1fZ2VtX3NobWVtX2hlbHBlci5j
LiBJdCB1c2VzIGRtYS1idWZfdm1hcCBhcyB3ZWxsLiBEb2VzIHRoYXQgbW9kdWxlDQo+PiBy
ZXF1aXJlIHRoZSBzYW1lIGZpeD8NCj4gDQo+IExpa2VseS4gTGV0IG1lIGp1c3QgcnVuIHpl
IGF1dG9tYXRpb24gYW5kIHNlZSB3aGF0IHdlIGdldC4uLg0KPiANCj4+IERvIHlvdSBoYXZl
IGFueSBpZGVhIHdoeSBJIGRvbid0IHNlZSB0aGVzZSBlcnJvcnMgaW4gbXkgYnVpbGRzPw0K
PiANCj4gV2VsbCwgSSBndWVzcywgdGhlcmUgYXJlIHZhcmlvdXMgS0NPTkZJRyBzeW1ib2xz
IGluZmx1ZW5jaW5nIHRoYXQgd2hvbGUgc3RvcnkuIEhvdyBhYm91dCBlLmcuDQo+IA0KPiBp
bml0L0tjb25maWc6Y29uZmlnIE1PRFVMRV9BTExPV19NSVNTSU5HX05BTUVTUEFDRV9JTVBP
UlRTDQoNClRoYW5rcyBmb3IgdGhlIGhpbnQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPiANCj4gQ2hlZXJzDQo+IA0KPiBN
YXJjZWwNCj4gDQo+Pj4gKw0KPj4+ICDCoCAvKioNCj4+PiAgwqDCoCAqIERPQzogY21hIGhl
bHBlcnMNCj4+PiAgwqDCoCAqDQo+Pj4NCj4+DQo+PiAtLSANCj4+IFRob21hcyBaaW1tZXJt
YW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0
c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXINCg==

--------------YoNzEKjaCWljAM4gZ7Iwc0LE--

--------------mErstqRuzD08suBMKdvgcL6H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF67+cFAwAAAAAACgkQlh/E3EQov+CR
Dw/8C0RXo97a70QQN2Xt9ROWfK+aE3antAURtxdLdXbKyjjeXlywMzzpTjkjID8YOS/cIwz5rU7h
sswYnkEGzKLgwMdwVHU51R0cKG4Wrvgz6nB/3zkSlt0yZJv5PY0GkX2oZ842lcYcC4FyDc/grjc4
1ntK3vORuWF/NnEk/VPqU1JlX1gf45b6OHEIhovgfAjnWdoOeD1cB6XNMxyOH2rXvgCqzDUT0lIa
XtzKlPKrG0AP2J1DWDgDyOJGeyMQeDz46p2ud3+2a1VnLFCz8493flBZwtv5CRQdloZ12dLMdWBe
OepG2BKbgbemJpmpgKVJAhc3mipvLlSuWPuaO9kP9dxhsxQPrrCMcKX8Wr3/VzQh9pOCCj6cddsI
mIaSZAFPpJVrkTISCMdOFnpwjBd8YaeVryJv9ahec8TMad+lJA9SIDMcLpQ35w3pOKgnyktS6Mlr
+tW6F1w8WvmMIBpGIpMd2PDZ0zrHGgrDwTyxdqLd7fL7v60xS44SaTftpYB//VtIW5o26Nfs8tco
DeKpDm5JP84utCDt/a/KMRnfZ5iDpJaQFn+WWeBeGxgH573aW9Qg9b3EcqHYn4u6FfP4SM3+00AA
8YtOM70ZXJejvrBBdGU9ILA0zfyrnhz04I9dBAWZ4u+lhjCx31MjHafcl66wS0AEC2xilUYQhYpC
KsQ=
=L9Du
-----END PGP SIGNATURE-----

--------------mErstqRuzD08suBMKdvgcL6H--
