Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644A5B8AB7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 16:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796D10E93D;
	Wed, 14 Sep 2022 14:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE1410E93D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 14:36:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D4E4225CE;
 Wed, 14 Sep 2022 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663166173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3xH3+cJ1caYF8CLJ9QV/L6Az2wKh4vvamBX7zGawHY=;
 b=DlLQ8a+AzwrCxMKEYDMuqWDfeoIB4KHTXUpxdKQb6rmjP49a8r0dq+f1ieImI3X2Rj9g/u
 /Oui1IB5zZqhYBkKwrU/EBrHyUfZXuMyvEivL2E4IuNbtKYSA9b3IaHpJqua4DVb4DMC7B
 cI8XoQ+uM0l1OqRoWrvVWAqyDsX/134=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663166173;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3xH3+cJ1caYF8CLJ9QV/L6Az2wKh4vvamBX7zGawHY=;
 b=xr1UfHXiFBZAT/ium7A5MvYzzaiCE7ImotXqTTIWfDupCzld+kJeOBYZ7tDEBq4Kry5Kx4
 QF3uPzwJE5p1dMAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7948C134B3;
 Wed, 14 Sep 2022 14:36:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hdDNHN3mIWPqOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Sep 2022 14:36:13 +0000
Message-ID: <03f80477-78c1-2ef3-40bf-58f8c9daa1c8@suse.de>
Date: Wed, 14 Sep 2022 16:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220913231522.7CAA.409509F4@e16-tech.com>
 <86e3a684-7a50-ed05-a89d-eeef154b2e67@suse.de>
 <20220914162920.7233.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220914162920.7233.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PUqXTeYlkAc1yNcNXU7DgEPn"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PUqXTeYlkAc1yNcNXU7DgEPn
Content-Type: multipart/mixed; boundary="------------80e2gymG00Vi9QXojttZ0Do9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jocelyn Falempe <jfalempe@redhat.com>
Message-ID: <03f80477-78c1-2ef3-40bf-58f8c9daa1c8@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220913231522.7CAA.409509F4@e16-tech.com>
 <86e3a684-7a50-ed05-a89d-eeef154b2e67@suse.de>
 <20220914162920.7233.409509F4@e16-tech.com>
In-Reply-To: <20220914162920.7233.409509F4@e16-tech.com>

--------------80e2gymG00Vi9QXojttZ0Do9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjOiBKb2NlbHluKQ0KDQpIaQ0KDQpBbSAxNC4wOS4yMiB1bSAxMDoyOSBzY2hyaWViIFdh
bmcgWXVndWk6DQo+IEhpLA0KPiANCj4gDQo+PiBIaQ0KPj4NCj4+IEFtIDEzLjA5LjIyIHVt
IDE3OjE1IHNjaHJpZWIgV2FuZyBZdWd1aToNCj4+IFsuLi5dDQo+Pj4+Pg0KPj4+Pj4gc28g
SSB0cmllZCB0byByZXZlcnQgcGF0Y2ggb2YgbWdhZzIwMCBkcml2ZXIgaW4gYmF0Y2ggb2Yg
MiBvciAzLCB0aGUgSQ0KPj4+Pj4gbm90aWNlZCB0aGUgcGF0Y2ggJ1N1YmplY3Q6IGRybS9t
Z2FnMjAwOiBSZW1vdmUgc3BlY2lhbCBjYXNlIGZvciBHMjAwU0UNCj4+Pj4+IHdpdGggPDIg
TWlCJyBhbmQgdGhlbiB0cmllZCB0aGlzIGRpcnR5IGZpeC4NCj4+Pj4NCj4+Pj4gT2gsIGdy
ZWF0IHdvcmshIFRoYW5rIHlvdS4gRnJvbSBsb29raW5nIGF0IHRoZSBzY3JlZW5zaG90IHRo
YXQgeW91IHByb3ZpZGVkLCBpdCBzZWVtcyBhcyBpZiB0aGUgMjQtYml0IG1vZGUgc2V0dGlu
ZyBpcyBicm9rZW4uIEknbSBub3Qgc3VyZSB3aHkgdGhlIEcyMDBTRSB3b3JrYXJvdW5kIGFw
cGxpZXMgdG8gYSBHMjAwRVIsIGJ1dCB3ZSdsbCBzZWUuDQo+Pj4NCj4+PiBJIHRlc3RlZCAn
cHJlZmVycmVkX2RlcHRoID0gMzInIHRvby4gaXQgd29ya3Mgb24gVDYzMCB0b28uDQo+Pj4N
Cj4+PiBzbyBib3RoIDE2IGFuZCAzMiB3b3JrLCBidXQgMjQgZmFpbGVkIG9uIERFTEwvVDYz
MC4NCj4+DQo+PiBJIHRyaWVkIG9uIG15IHRlc3QgbWFjaGluZSB3aXRoIGEgNS4xOSBrZXJu
ZWwgYW5kIGZvdW5kIHRoYXQgMzItYml0IGFuZCAyNC1iaXQgcGl4ZWxzIHdvcmssIGJ1dCAx
Ni1iaXQgbG9va3MgaW5jb3JyZWN0Lg0KPj4NCj4+IFdoYXQgYXJlIHRoZSByZXN1bHRzIGlm
IHlvdSBib290IHlvdXIga2VybmVsIDUuMTkuMyB3aXRoIHRoZSBwYXJhbWV0ZXIgdmlkZW89
MTAyNHg3NjgtMjQ/IFRoaXMgc2hvdWxkIGVuYWJsZSAyNC1iaXQgcGl4ZWxzLg0KPj4NCj4+
IEhvdyBkb2VzIHZpZGVvPTEwMjR4NzY4LTE2IGxvb2sgd2l0aCB0aGUgNS4xOSBrZXJuZWw/
DQo+IA0KPiB0ZXN0IHJlc3VsdCBoZXJlDQo+IGtlcm5lbCA1LjE5LjMgJiB2aWRlbz0xMDI0
eDc2OC0yNA0KPiAJZGVsbC9UNjIwL2NlbnRvcy04LjUJYnJva2VuDQo+IAlkZWxsL1Q2MzAv
Y2VudG9zLTcuOQlicm9rZW4NCg0KSSBhc3N1bWUgdGhhdCBDZW50b3MgNyBhbmQgOCBoYXZl
IGZhaXJseSBvbGQga2VybmVscz8gU28gaXQncyBiZWVuIGEgDQpsb25nLXN0YW5kaW5nIGJ1
Zy4NCg0KMjQtYml0IHdvcmtzIG9uIG15IEcyMDBIRSBhbmQgRzIwMCB0ZXN0IG1hY2hpbmVz
LiBNYXliZSB0aGUgRzIwMEVSIGhhcyBhIA0KYnVnLg0KDQpXaGVuIEkgdHJ5IDE2LWJpdCBk
ZXB0aCwgdGhlIGRpc3BsYXkgd29ya3MsIGJ1dCBpcyB3YXkgdG9vIGRhcmsuIE5vIA0KZmlk
ZGxpbmcgd2l0aCB0aGUgTFVUIHRhYmxlcyBmaXhlcyB0aGlzLiBJdCdzIDkwcyBoYXJkd2Fy
ZSwgc28gaXQgc2hvdWxkIA0Kc3VwcG9ydCAxNi1iaXQgZnJhbWVidWZmZXJzIHdlbGwsIGJ1
dCB0aGVyZSdzIG5vIG9idmlvdXMgYnVnIHRvIGJlIHNlZW4uDQoNCkkgZ3Vlc3MsIHdlIGNv
dWxkIHJlbW92ZSAxNiBhbmQgMjQgYml0IHN1cHBvcnQgZm9yIG5vdyBpZiBub3RoaW5nIGVs
c2UgDQpoZWxwcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4ga2VybmVsIDUu
MTkuMyAmIHZpZGVvPTEwMjR4NzY4LTMyDQo+IAlkZWxsL1Q2MjAvY2VudG9zLTguNQlPSw0K
PiAJZGVsbC9UNjMwL2NlbnRvcy03LjkJT0sNCg0KDQoNCj4gDQo+IEJvdGggREVMTC9UNjIw
IGFuZCBERUxML1Q2MzAgaGF2ZSB0aGUgbGFzdGVzdCBCSU9TL2lEUkFDIGluc3RhbGxlZC4N
Cj4gDQo+IEJlc3QgUmVnYXJkcw0KPiBXYW5nIFl1Z3VpICh3YW5neXVndWlAZTE2LXRlY2gu
Y29tKQ0KPiAyMDIyLzA5LzE0DQo+IA0KPiANCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+
PiBUaG9tYXMNCj4+DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfbW9kZS5jDQo+Pj4gaW5kZXggMjI1Y2NhMmVkNjBlLi41NjNlM2FiMDVmYmMgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMN
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPj4+
IEBAIC0xMDcwLDcgKzEwNzAsNyBAQCBpbnQgbWdhZzIwMF9tb2Rlc2V0X2luaXQoc3RydWN0
IG1nYV9kZXZpY2UgKm1kZXYsIHJlc291cmNlX3NpemVfdCB2cmFtX2F2YWlsYWJsZQ0KPj4+
DQo+Pj4gICAgICAgICAgIGRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gTUdBRzIwMF9N
QVhfRkJfV0lEVEg7DQo+Pj4gICAgICAgICAgIGRldi0+bW9kZV9jb25maWcubWF4X2hlaWdo
dCA9IE1HQUcyMDBfTUFYX0ZCX0hFSUdIVDsNCj4+PiAtICAgICAgIGRldi0+bW9kZV9jb25m
aWcucHJlZmVycmVkX2RlcHRoID0gMjQ7DQo+Pj4gKyAgICAgICBkZXYtPm1vZGVfY29uZmln
LnByZWZlcnJlZF9kZXB0aCA9IDMyOw0KPj4+ICAgICAgICAgICBkZXYtPm1vZGVfY29uZmln
LmZiX2Jhc2UgPSBtZGV2LT52cmFtX3Jlcy0+c3RhcnQ7DQo+Pj4gICAgICAgICAgIGRldi0+
bW9kZV9jb25maWcuZnVuY3MgPSAmbWdhZzIwMF9tb2RlX2NvbmZpZ19mdW5jczsNCj4+Pg0K
Pj4+IEJlc3QgUmVnYXJkcw0KPj4+IFdhbmcgWXVndWkgKHdhbmd5dWd1aUBlMTYtdGVjaC5j
b20pDQo+Pj4gMjAyMi8wOS8xMw0KPj4+DQo+Pj4NCj4+Pg0KPj4gLS0gVGhvbWFzIFppbW1l
cm1hbm4NCj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaD9m
dHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------80e2gymG00Vi9QXojttZ0Do9--

--------------PUqXTeYlkAc1yNcNXU7DgEPn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMh5t0FAwAAAAAACgkQlh/E3EQov+BU
FRAAyw4HikUnINpjkP+GsNDFtvkum0jZUtg+DIOU4zTKAsMvLq7UE7f7lNoAEJZ8EPgCeF6cB+n/
cTzux53MYxU3UHp1OVqgtWr3AUrb5JsAxRN80FeS3E/1HjFJdDiJqXci5mfFrF4XcdzgGGqCuloe
QEuifiHSJbtorCNgMxSliGv/R20tQBIDorGq82z0Ta4OrBZQHfyN1yGtvVJXONJQAfjwqDMZpJ0M
C+qoujS+V33TUyeHXN5/moEh7+y/7TIL571hxRPt9qg7rh04hy+q17+h6kji8lBaJBSxk43YOEAY
Yh4p0/ObvyMAUJK1SARb2b5Acj6Z6Or82P9MXnnXH1ffJzfJx2R47OLFf2VPQqwPIZl5P9GK6LyF
MWqopzPBhA6mtcwmmYAltPA02qu44sFu1qzpLTaItqiO5ymcLb2OZiLwSscYMF8cBGvV8Oqw9Q/b
AZxf8kTS/GHa+8wedpALJA6L8eX2BGN3DwanyIUUODqHyhq+IwggUfE9y9yDi9BVEXaGptLUG9+l
tyJH9mwCwHPEbz2rTfCf/WrzIaKqtmB5g8ZtId2RBWWZnEP59NlqB87MuI+ONOWoehgRHY8qkc9L
JZhriB8t9KQ6AGPGnrYaDh55qjl0Opa5q2qJ7OJpPOTJA/uy3/BENB2UtD9YoK+JoWDwmcla2nKu
NN4=
=RkJw
-----END PGP SIGNATURE-----

--------------PUqXTeYlkAc1yNcNXU7DgEPn--
