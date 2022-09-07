Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9516D5AFE30
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CF510E3E8;
	Wed,  7 Sep 2022 07:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F81810E3E8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:55:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AC90336B9;
 Wed,  7 Sep 2022 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662537319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IXQLPJ1YMYk/Ig1R4aBlXff8K1qGXIwYrm0g70IIyHY=;
 b=iWfSLm40V1JNXOObzPy/Wv+KHCQtf3dn4Vv49/0L4Rjhlz8/v+4DcckOk18kADoybFkeno
 LNjuNZ0D+ChQxxXSOjsqP5Hvy+hCSutYLPdP+jcwCLYPPQI0lURN8dITQJrpSI6NworVIe
 l/aUZOdA4C+KF/nsFwuxrcrLkL/vAgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662537319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IXQLPJ1YMYk/Ig1R4aBlXff8K1qGXIwYrm0g70IIyHY=;
 b=IT6iLXGRqsS5WNvCApH/EhagA21W2dZ/Iw00HiqqKalrm/5iESqEEgcthqhe6837oQPCK6
 oM7zhhOcKv5rU8BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1689C13A66;
 Wed,  7 Sep 2022 07:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DuFmBGdOGGNYBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:55:19 +0000
Message-ID: <5a00d713-5fb9-3c78-8785-5721f31b9e06@suse.de>
Date: Wed, 7 Sep 2022 09:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220907121612.FBFC.409509F4@e16-tech.com>
 <6ae94a84-4757-71cd-f1a9-751b8cf307b0@suse.de>
 <20220907153847.E7FC.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220907153847.E7FC.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Jcvs7OAHlnOfmzoDU600iN0H"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Jcvs7OAHlnOfmzoDU600iN0H
Content-Type: multipart/mixed; boundary="------------mwjrkv5Jzn9ja8vXMq3HIrrj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <5a00d713-5fb9-3c78-8785-5721f31b9e06@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220907121612.FBFC.409509F4@e16-tech.com>
 <6ae94a84-4757-71cd-f1a9-751b8cf307b0@suse.de>
 <20220907153847.E7FC.409509F4@e16-tech.com>
In-Reply-To: <20220907153847.E7FC.409509F4@e16-tech.com>

--------------mwjrkv5Jzn9ja8vXMq3HIrrj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDkuMjIgdW0gMDk6Mzggc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+IA0KPj4gSGkNCj4+DQo+PiBBbSAwNy4wOS4yMiB1bSAwNjoxNiBzY2hyaWViIFdh
bmcgWXVndWk6DQo+Pj4gSGksDQo+Pj4NCj4+Pj4gQW0gMDIuMDkuMjIgdW0gMDc6NTIgc2No
cmllYiBXYW5nIFl1Z3VpOg0KPj4+Pj4gSGksDQo+Pj4+Pg0KPj4+Pj4gbWdhZzIwMCBicm9r
ZW4gb24ga2VybmVsLTYuMC1yYzMgb24gREVMTC9UNjIwLg0KPj4+Pj4NCj4+Pj4+IFNlZSB0
aGUgYXR0YWNoZW1lbnRtZW50IGZpbGUgZm9yIHRoZSBncmFwaCBvdXRwdXQuDQo+Pj4+DQo+
Pj4+IFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoZSBidWcuIFdlIHJlY2VudGx5IHJlZmFjdG9y
ZWQgc29tZSBjb2RlIG9mIHRoZSBkcml2ZXIuIENhbiB5b3UgYmlzZWN0IHRvIHRoZSBjaGFu
Z2UgdGhhdCBpbnRyb2R1Y2VkIHRoZSBwcm9ibGVtPw0KPj4+DQo+Pj4gNS4xOS4zIHdvcmtz
IHdlbGwgb24gdGhpcyBERUxML1Q2MjAuDQo+Pj4NCj4+PiBzbyB0aGlzIHByb2JsZW0gc2hv
dWxkIGJlIGEgcmVncmVzc2lvbiBvZiA2LjAuDQo+Pj4NCj4+PiBvdGhlciBiaXNlY3Qgc2Vl
bSBkaWZmaWN1bHQgZm9yIG1lLg0KPj4NCj4+IE9LLCB0aGFuayB5b3UuIENhbiB5b3UgcHJv
dmlkZSB0aGUgZG1lc2cgbG9nIG9mIHRoZSBicm9rZW4gbWFjaGluZSBhbmQgdGhlIG91dHB1
dCBvZiAnc3VkbyBsc3BjaSAtdm4nIHBsZWFzZT8NCj4gDQo+IHBsZWFzZSBzZWUgdGhlIGF0
dGFjaG1lbnQgZmlsZSBmb3IgdGhlIG91dHB1dCBvZiAnbHNwY2kgLXZuJy4NCg0KICAwYTow
MC4wIDAzMDA6IDEwMmI6MDUzNCAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQ0KDQpJ
dCdzIHRoZSBHMjAwRVIuIEknbGwgdHJ5IHRvIGZpbmQgcmVsYXRlZCBjb2RlIHRoYXQgd2Ug
cmVjZW50bHkgY2hhbmdlZC4gDQpJIG1pZ2h0IGdldCBiYWNrIHRvIHlvdSBmb3IgdGVzdGlu
ZyBhIHBhdGNoLiBUaGFua3Mgc28gZmFyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPiBCZXN0IFJlZ2FyZHMNCj4gV2FuZyBZdWd1aSAod2FuZ3l1Z3VpQGUxNi10ZWNoLmNv
bSkNCj4gMjAyMi8wOS8wNw0KPiANCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9t
YXMNCj4+DQo+Pj4NCj4+PiBCZXN0IFJlZ2FyZHMNCj4+PiBXYW5nIFl1Z3VpICh3YW5neXVn
dWlAZTE2LXRlY2guY29tKQ0KPj4+IDIwMjIvMDkvMDcNCj4+Pg0KPj4+DQo+Pj4+DQo+Pj4+
IEJlc3QgcmVnYXJkcw0KPj4+PiBUaG9tYXMNCj4+Pj4NCj4+Pj4+DQo+Pj4+PiBbcm9vdEBU
NjIwIH5dIyBkbWVzZyAgfGdyZXAgLWkgJ3ZnYVx8bWdhJw0KPj4+Pj4gWyAgICAwLjU4ODk0
MF0gQ29uc29sZTogY29sb3VyIFZHQSsgODB4MjUNCj4+Pj4+IFsgICAgNC45MTgyMTRdIHBj
aSAwMDAwOjBhOjAwLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290IFZHQSBkZXZpY2UNCj4+
Pj4+IFsgICAgNC45MTkwMjhdIHBjaSAwMDAwOjBhOjAwLjA6IHZnYWFyYjogYnJpZGdlIGNv
bnRyb2wgcG9zc2libGUNCj4+Pj4+IFsgICAgNC45MTkwMjhdIHBjaSAwMDAwOjBhOjAwLjA6
IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDogZGVjb2Rlcz1pbyttZW0sb3ducz1pbyttZW0s
bG9ja3M9bm9uZQ0KPj4+Pj4gWyAgICA0Ljk0MTA1OF0gdmdhYXJiOiBsb2FkZWQNCj4+Pj4+
IFsgICAgOS4zODU0ODVdIG1nYWcyMDAgMDAwMDowYTowMC4wOiB2Z2FhcmI6IGRlYWN0aXZh
dGUgdmdhIGNvbnNvbGUNCj4+Pj4+IFsgICAgOS41MTA2ODhdIFtkcm1dIEluaXRpYWxpemVk
IG1nYWcyMDAgMS4wLjAgMjAxMTA0MTggZm9yIDAwMDA6MGE6MDAuMCBvbiBtaW5vciAwDQo+
Pj4+PiBbICAgIDkuNTIzMTQ1XSBmYmNvbjogbWdhZzIwMGRybWZiIChmYjApIGlzIHByaW1h
cnkgZGV2aWNlDQo+Pj4+PiBbICAgIDkuNjQxNTQzXSBtZ2FnMjAwIDAwMDA6MGE6MDAuMDog
W2RybV0gZmIwOiBtZ2FnMjAwZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0KPj4+Pj4NCj4+
Pj4+DQo+Pj4+PiBtb3JlIGluZm86DQo+Pj4+PiAxLCBUaGlzIERFTEwvVDYyMCB3b3JrcyB3
ZWxsIHdpdGgga2VybmVsIDUuMTUuNjMsDQo+Pj4+PiAgICAgICAgc28gdGhpcyBpcyBub3Qg
YSAgaGFyZHdhcmUgZXJyb3IuDQo+Pj4+Pg0KPj4+Pj4gMiwgREVMTC9UNjQwIHdvcmtzIHdl
bGwgd2l0aCBrZXJuZWwgNi4wLXJjIGFuZCA1LjE1LjYzLg0KPj4+Pj4gICAgICAgIGJvdGgg
REVMTC9UNjIwIGFuZCBERUxML1Q2NDAgdXNlIHRoZSBkcml2ZXIgJ21nYWcyMDAnLg0KPj4+
Pj4NCj4+Pj4+IFtyb290QFQ2NDAgfl0jICBkbWVzZyAgfGdyZXAgLWkgJ3ZnYVx8bWdhJw0K
Pj4+Pj4gWyAgIDEwLjE2MTUwMF0gcGNpIDAwMDA6MDM6MDAuMDogdmdhYXJiOiBzZXR0aW5n
IGFzIGJvb3QgVkdBIGRldmljZQ0KPj4+Pj4gWyAgIDEwLjE2MjQ2M10gcGNpIDAwMDA6MDM6
MDAuMDogdmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPWlvK21lbSxvd25zPWlv
K21lbSxsb2Nrcz1ub25lDQo+Pj4+PiBbICAgMTAuMTc2NTI3XSBwY2kgMDAwMDowMzowMC4w
OiB2Z2FhcmI6IGJyaWRnZSBjb250cm9sIHBvc3NpYmxlDQo+Pj4+PiBbICAgMTAuMTgyNDY1
XSB2Z2FhcmI6IGxvYWRlZA0KPj4+Pj4gWyAgIDExLjgzMjgzOV0gZmIwOiBFRkkgVkdBIGZy
YW1lIGJ1ZmZlciBkZXZpY2UNCj4+Pj4+IFsgICAyMS4zMDM4MjZdIG1nYWcyMDAgMDAwMDow
MzowMC4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUNCj4+Pj4+IFsgICAyMS4z
MTk0OThdIFtkcm1dIEluaXRpYWxpemVkIG1nYWcyMDAgMS4wLjAgMjAxMTA0MTggZm9yIDAw
MDA6MDM6MDAuMCBvbiBtaW5vciAwDQo+Pj4+PiBbICAgMjEuMzMwMjIzXSBmYmNvbjogbWdh
ZzIwMGRybWZiIChmYjApIGlzIHByaW1hcnkgZGV2aWNlDQo+Pj4+PiBbICAgMjEuMzMyMTQw
XSBtZ2FnMjAwIDAwMDA6MDM6MDAuMDogW2RybV0gZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1h
Z2VfY2xpcHMoKSBub3QgY2FsbGVkDQo+Pj4+PiBbICAgMjEuNzQxNjI5XSBtZ2FnMjAwIDAw
MDA6MDM6MDAuMDogW2RybV0gZmIwOiBtZ2FnMjAwZHJtZmIgZnJhbWUgYnVmZmVyIGRldmlj
ZQ0KPj4+Pj4NCj4+Pj4+IEJlc3QgUmVnYXJkcw0KPj4+Pj4gV2FuZyBZdWd1aSAod2FuZ3l1
Z3VpQGUxNi10ZWNoLmNvbSkNCj4+Pj4+IDIwMjIvMDkvMDINCj4+Pj4+DQo+Pj4+IC0tIFRo
b21hcyBaaW1tZXJtYW5uDQo+Pj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+Pj4g
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+Pj4+IE1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQo+Pj4+IEdlc2NoP2Z0c2bDvGhyZXI6IEl2byBUb3Rldg0KPj4+DQo+Pj4NCj4+
IC0tIFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+
PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KPj4gR2VzY2g/ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------mwjrkv5Jzn9ja8vXMq3HIrrj--

--------------Jcvs7OAHlnOfmzoDU600iN0H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYTmYFAwAAAAAACgkQlh/E3EQov+CI
eA//fNTL9mW1twF6tsmo9WQXhc2EXmmotlN5dSC97Du7orKjhM+hYxrFJILbSUYCjrJScA74DUP7
71z1eaER33gugAAMk+wjU887i78HdtH2CBXgIWRI11fr/PLJSbe9K5/Hfr3ElAUGo4nrDgzAlfeP
YDjg6J9xROR0RyDizyG5Q3OAObi1h4sVCh8/H9K2Z/ZtjqiZnOKm1qaLunP0Ed+LtIDix9yUcpcC
KPkyZIKSaQFBkGMTrID+jv2HTcBjtY5WhzshZyCJrXCSgWCL7WifUFoafjlHt60/6CKjtEoelayu
Ghdi+Ab2RMgdFiksM6gPKX2YswmtzCrpcB+L/7siu5G5h1roTwtaLkygJ0LvQQ+VH++W7egWJ0OV
KKi+vXB0XFiepPt/ujMPtrYsBUmttmhLCmf3jNKylCV1zohkQu5XnbFhfKM0NfSZKNdLINoUsNpP
uboi99Z5vNOxKxn2P0LDJijxKmZ9TNv+UHQavz6g31zuiK+OGln8Vvxzvq/nbj/+D6qDkqG7H/+s
oIVTrbFqoryS7mPkOpzNOWz9PnZW/6S4lJ3ViFnLNx6VfkQIc0ulTVkqosblSoaKTV0GhL0YrErK
Oxi9TyUj1TWzEL/afqMBKpPGdpCOTEDTZSGwIkGXKqBxIlOTzrZPcpZ/Y9PLWYqbjrO+Cy5876v2
0Zg=
=hA5t
-----END PGP SIGNATURE-----

--------------Jcvs7OAHlnOfmzoDU600iN0H--
