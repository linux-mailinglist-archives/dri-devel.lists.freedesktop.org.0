Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F75561528
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 10:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28861125CC;
	Thu, 30 Jun 2022 08:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335061135AF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:33:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D316421CA5;
 Thu, 30 Jun 2022 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656578032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ket32blTy4NbP/l+b91cRa55bHiQPxShe9budd4LOi4=;
 b=iA3N8bn1gWX2/52jTTGYhPXgUVD07XT1nePPZPiUSgnCwgrnfjq1ZE5ipy3k8JNDGsAil4
 NCf9NRuEnOo2AC2lP5TQ2P7J0ysqRpRln6JYlw1veNCq+fvCu7Nsx34qMLoun1oLJz4/n7
 hAAoPvmzE5TcHm07BA7WYNVcaeQG2k0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656578032;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ket32blTy4NbP/l+b91cRa55bHiQPxShe9budd4LOi4=;
 b=+9jKEzqhyDSyrTKdRoUGXaHsN27TEraoRfKbG3vGf8T+dd5BidD37XpCpLY875BzrbpJCw
 Xq1XoBpEmNDCiuDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3859139E9;
 Thu, 30 Jun 2022 08:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GO6QKvBfvWJgSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Jun 2022 08:33:52 +0000
Message-ID: <f64fc02f-f82f-17f8-a669-61c9d9b4e869@suse.de>
Date: Thu, 30 Jun 2022 10:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
 <Yroh0fe4Fzqgam3W@ravnborg.org>
 <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
 <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
 <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
In-Reply-To: <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pCcDYezgc6GiH0OmdZsGAr8D"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pCcDYezgc6GiH0OmdZsGAr8D
Content-Type: multipart/mixed; boundary="------------Emws6pfZct0WzXX0EtVeT0sl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Message-ID: <f64fc02f-f82f-17f8-a669-61c9d9b4e869@suse.de>
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
 <Yroh0fe4Fzqgam3W@ravnborg.org>
 <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
 <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
 <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
In-Reply-To: <dae59187-a055-2699-bee1-c066b69627b0@suse.de>

--------------Emws6pfZct0WzXX0EtVeT0sl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDYuMjIgdW0gMTA6MTkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDMwLjA2LjIyIHVtIDEwOjA3IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPj4gSGVsbG8sDQo+Pg0KPj4gT24gNi8yOC8yMiAxNDoyMSwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gSGkNCj4+Pg0KPj4+IEFtIDI3LjA2LjIyIHVt
IDIzOjMyIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPj4+PiBIaSBLZXZpbi9UaG9tYXMsDQo+
Pj4+DQo+Pj4+Pg0KPj4+Pj4gSSBoYWQgYSBicmllZiBsb29rIG92ZXIgdGhlIHBhdGNoZXMu
IEV2ZW4gdGhvdWdoIHRoZSBjb2RlIGxvb2tzIA0KPj4+Pj4gZmFpcmx5IHJvdWdoDQo+Pj4+
PiBpbiBwbGFjZXMsIEkgdGhpbmsgd2Ugc2hvdWxkIGdldCB0aGlzIGRyaXZlciBtZXJnZWQg
QVNBUC4NCj4+Pj4NCj4+Pj4gQWdyZWVkLCB3ZSBoYXZlIGEgaGFkIGEgZmV3IGNhc2VzIHdo
ZXJlIHdlIGRyYWdnZWQgb3V0IGNvbW1pdHRpbmcgbXVjaA0KPj4+PiB0b28gbG9uZyB0aW1l
Lg0KPj4+Pg0KPj4+PiBUaW1pbmcgd2lzZSwgaXQgd291bGQgYmUgZ29vZCBpZiB3ZSBjYW4g
YWxyZWFkeSBoaXQgZHJtLW1pc2MtbmV4dCByaWdodA0KPj4+PiBfYWZ0ZXJfIHRoZSBwdWxs
IC1zbyB3ZSBoYXZlIGEgZnVsbCBjeWNsZSB0byBmaXggYW55dGhpbmcgYmVmb3JlIGl0IA0K
Pj4+PiBoaXRzDQo+Pj4+IG1haW5saW5lLg0KPj4+Pg0KPj4+Pj4gRm9yIHRoZSBvbGQgdmlh
IGRyaXZlciwgSSB0aGluayB3ZSBuZWVkIGEgYmV0dGVyIGFwcHJhY2guIElNSE8gaXQgDQo+
Pj4+PiB3b3VsZCBiZQ0KPj4+Pj4gcHJlZmVyYWJsZSB0byBwdXQgdGhlIG5ldyBkcml2ZXIg
aW50byB2aWEvIGJ1dCBrZWVwIHRoZSBvbGQgZHJpdmVyIA0KPj4+Pj4gdGhlcmUgYXMNCj4+
Pj4+IHdlbGwuwqAgQSBidWlsZCBvcHRpb24gd291bGQgY29udHJvbCB3aGljaCBpcyBiZWlu
ZyB1c2VkLg0KPj4+Pg0KPj4+PiBJIGFzc3VtZSB0aGUgdXNlciBiYXNlIGZvciB2aWEgZHJp
dmVycyBhcmUgdmVyeSBzbWFsbCBhbmQgdGhleSBoYXZlIHRoZQ0KPj4+PiBmYmRldiBkcml2
ZXIgYWxyZWFkeS4NCj4+Pj4gU28gSSBzdXBwb3J0IHJlcGxhY2luZyB0aGUgY3VycmVudCB2
aWEgZHJtIGRyaXZlciBhcyBLZXZpbiB0cmllcyB0byBkby4NCj4+Pg0KPj4+IEkgZG9uJ3Qg
a25vdyBpZiB0aGVyZSBhcmUgc3RpbGwgdXNlcnMgb2YgdGhlIG9sZCB1c2Vyc3BhY2UsIGJ1
dCBpZiBzbyBJDQo+Pj4gd291bGQgY29uc2lkZXIgdGhpcyByZW1vdmFsIGEgcmVncmVzc2lv
bi4gSSB0aGluayB0aGUgb2xkIGNvZGUgc3VwcG9ydHMNCj4+PiAzZCBhbmQgdmlkZW8gZGVj
b2RpbmcuIERlcGVuZGluZyBvbiB0aGUgZmVhdHVyZSBzZXQsIDNkIHN1cHBvcnQgbWlnaHQN
Cj4+PiBub3QgYmUgdXNlZnVsIGFueSBsb25nZXIsIGJ1dCB2aWRlbyBkZWNvZGluZyBwcm9i
YWJseSBpcy7CoCAoSSBtaWdodCBiZQ0KPj4+IHdyb25nIGFib3V0IGFsbCB0aGlzLikgSU1I
TyB3ZSBzaG91bGQgbm90IHNpbXBseSByZW1vdmUgdGhpcyBhdCBsZWFzdA0KPj4+IHVudGls
IHdlIGNhbiB2ZXJpZnkgdGhhdCBpdCdzIG5vIGxvbmdlciB1c2VmdWwgdG8gYW55b25lLg0K
Pj4+DQo+Pg0KPj4gSSBzdHJvbmdseSBhZ3JlZSB3aXRoIFRob21hcyBvbiB0aGlzLg0KPj4+
IEhvd2V2ZXIsIGxlZ2FjeSBzdXBwb3J0IGlzIHRyaXZpYWwuIEtldmluLCBwbGVhc2Ugc2Vl
IHRoZSBhdHRhY2hlZCBmaWxlcw0KPj4+IGZvciB0d28gY2xlYW51cCBwYXRjaGVzLiBZb3Un
cmUgd2VsY29tZSB0byBhZGQgdGhlbSB0byB0aGUgc3RhcnQgb2YgeW91cg0KPj4+IHBhdGNo
c2V0IHRvIGdldCB0aGUgbGVnYWN5IGNvZGUgb3V0IG9mIHRoZSB3YXkuDQo+Pj4NCj4+DQo+
PiBJJ20gbm90IHN1cmUgYWJvdXQgdGhpcyBhcHByb2FjaCwgSSB0aGluayB0aGF0IGhhdmlu
ZyBjb21wbGV0ZWx5IA0KPj4gc2VwYXJhdGVkDQo+PiBkcml2ZXJzIHdvdWxkIGJlIGJldHRl
ciB0byBtYWludGFpbiBpbiB0aGUgbG9uZyBydW4gc2luY2UgaXQncyBsaWtlbHkgDQo+PiB0
aGF0DQo+PiB0aGUgbGVnYWN5IFZJQSBkcml2ZXIgd2lsbCBvbmx5IGdldCBidWcgZml4ZXMg
KGlmIGFueSkgYW5kIGNvdWxkIGJlIA0KPj4gcmVtb3ZlZA0KPj4gb25jZSB0aGUgbmV3IG1v
ZHNldHRpbmcgZHJpdmVyIGhhcyBmZWF0dXJlIHBhcml0eSwgdGhlIGxlZ2FjeSBjYW4gYmUg
DQo+PiBkcm9wcGVkLg0KPj4gTWF5YmUgYW4gYWx0ZXJuYXRpdmUgY291bGQgYmUgdG8gYWRk
IGEgZHJpdmVycy9ncHUvZHJtL2xlZ2FjeSANCj4+IGRpcmVjdG9yeSBhbmQNCj4+IG1vdmUg
YWxsIHRoZSBsZWdhY3kgRFJNIGRyaXZlcnMgdGhlcmUgPyBBbmQgdGhlIEtjb25maWcgc3lt
Ym9sIGNvdWxkIA0KPj4gYmUgaS5lOg0KPj4gQ09ORklHX0RSTV9MRUdBQ1lfVklBIGFuZCBz
YW1lIGZvciB0aGUgb3RoZXJzIGxlZ2FjeSBEUk0gZHJpdmVycy4NCj4+DQo+PiBBbmQgdGhl
IGRpcmVjdG9yeSBjb3VsZCBvbmx5IGJlIHNvdXJjZWQgZnJvbSBLY29uZmlnIHdoZW4gDQo+
PiBDT05GSUdfRFJNX0xFR0FDWQ0KPj4gaXMgZW5hYmxlZCBhbmQgbWFrZSBpdCBkZWZhdWx0
IHRvIG4uIElmIGluIGEgZmV3IG9mIHJlbGVhc2VzIG5vYm9keSANCj4+IGNvbXBsYWlucw0K
Pj4gdGhlbiB0aGUgd2hvbGUgZGlyZWN0b3J5IGNvdWxkIGJlIHJlbW92ZWQuDQoNClRvIGFk
ZCBhbm90aGVyIGNvbW1lbnQgaGVyZSwgaWYgd2UgZG8gdGhpcyB0aGVuIGxldCdzIHBsZWFz
ZSBub3QgY2FsbCBpdCANCmxlZ2FjeS4gIFdlIGFsc28gaGF2ZSBub24tYXRvbWljIG1vZGVz
ZXR0aW5nLCBub24tYXRvbWljIGNvbG9yIG1nbXQsIA0Kbm9uLXVuaXZlcnNhbCBwbGFuZXMs
IGV0Yy4gQWxsIHRoYXQgaXMgYWxzbyBsZWdhY3kgaW4gc29tZSB3YXkuDQoNCklmIHdlJ3Jl
IGdvaW5nIHRvIHJlbmFtZSBhbmQgbW92ZSB0aGUgb2xkIGRyaXZlcnMsIGxldCdzIGNhbGwg
aXQgDQpjb25zaXN0ZW50bHkgQ09ORklHX0RSSTEgYW5kIGRyaTEvLg0KDQpCZXN0IHJlZ2Fy
ZA0KVGhvbWFzDQoNCj4+DQo+IA0KPiBUaGF0IHNlZW1zIGEgbG90IG9mIHdvcmsgZm9yIHNp
bXBseSByZW1vdmluZyBzb21ldGhpbmcuIEFuZCBJJ20gc3VyZSANCj4gdGhhdCBwZW9wbGUg
d2lsbCBvbmx5IGNvbXBsYWluIGFmdGVyIGxlZ2FjeS92aWEgZ290IHJlbW92ZWQuDQo+IA0K
PiBJZiB3ZSB3YW50IHRvIHNlcGFyYXRlIGNvZGUgZm9yIHRoZSBvbGQgYW5kIG5ldyBWSUEg
ZHJpdmVyLCBsZXQncyBwdXQgDQo+IHRoZSBuZXcgY29kZSBpbnRvwqAgdW5pY2hyb21lLyBh
bmQgYmUgZG9uZSB3aXRoIGl0Lg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiAN
Cj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Emws6pfZct0WzXX0EtVeT0sl--

--------------pCcDYezgc6GiH0OmdZsGAr8D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK9X/AFAwAAAAAACgkQlh/E3EQov+CF
2w/9Fha3x9Ff03heRnRCgNpM/Ae946bTlr+FFcHvdzJbbLZHMMZhFiMxwy2iUi63CvGzefg62lWi
LWHaCPZf51DGmTIInAmzQj/LQGtlcWucip1uAK3tWhau5pmRCcZxURiyP8Pk8cRKbtsyAWNEClBZ
m6zCR4nhmSoMzrhkwoeAPfKsefX0lKtDuHctgBg1nxKMIlcfS+cwvMZnYrFah3QWJmrMt5xv6gLg
tPIL+d63zs8qscKOV50EGr+3WjbRX4RkYgEoE/JZjaTvvfqocWG/+Lu3B2Jq+qZaSe8tPmjA8B0F
4z9ZV4SzYYWASW9WjNfRCbR76mNn62tZOY3G27HGyS29siB+bkv141vHPoDIuQcAjQsujGjGHPsX
5p9Lzu1ToOz1oKcYFK6XBXTwUfJZW0qihH1FUswe5ssddlWqtwOS7Is6fV8m3XczhqD2HD0OuSZC
YUOyChlwqXJujb9eobi85ZfRkuBeA+FYNVgq9FTI15E0nG8QcmOQrkmgdcDDC4o3XLxbJCfrhJmy
szEzdKBb8dBM9H38Pz5VMpC4SM9A4DDAC+eXAmyHFDJpNpgqXbuSSOAQX9aH2NfQztkhw8QStZA3
cMd/IXcaQjEtZVbyGStVulU+0S7WpdY+Icjfyf7BE91f6CWQbLYT2UX1j7GvrEQF3BA4/m8aedLC
lqc=
=X3X3
-----END PGP SIGNATURE-----

--------------pCcDYezgc6GiH0OmdZsGAr8D--
