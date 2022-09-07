Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A15AFCC8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E097110E36A;
	Wed,  7 Sep 2022 06:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FC810E36A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:47:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A14F20095;
 Wed,  7 Sep 2022 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662533237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=239NFSGxta18IH9QklEVtoAe/CNImu0iU5P8SRKwPBY=;
 b=NFroiC0VWNqybTqRxLz/Dq7iJ2ow0E/YEHAZ6K44yFv0lkHlUfb1FhiZXc7Bkh1KXIwdWS
 OwNyZDZD4W/lu7Ts4Tse1ZkVlOBqDveMdqGSCOcq8cVYAyOCjCCWguq18Mv47XSUuTr4Hp
 3vKedj1g6NNTcZU5591G4ZS1lfGa3I8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662533237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=239NFSGxta18IH9QklEVtoAe/CNImu0iU5P8SRKwPBY=;
 b=jTjgzkrYc/9O7UCaiXnZNrltOrGCGpYuom+9OxKzotDdmj+HotcRf6ElE7FvIjr8JSX45Z
 EpHfogIe5Vu+SkCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0608813486;
 Wed,  7 Sep 2022 06:47:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NJ6YAHU+GGO7aAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 06:47:17 +0000
Message-ID: <6ae94a84-4757-71cd-f1a9-751b8cf307b0@suse.de>
Date: Wed, 7 Sep 2022 08:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220902135242.2447.409509F4@e16-tech.com>
 <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
 <20220907121612.FBFC.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220907121612.FBFC.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WiIZetdBghKYxTU8GU6GEEnj"
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
--------------WiIZetdBghKYxTU8GU6GEEnj
Content-Type: multipart/mixed; boundary="------------913tV1XCvnFtcPhXOJlte02z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <6ae94a84-4757-71cd-f1a9-751b8cf307b0@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220902135242.2447.409509F4@e16-tech.com>
 <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
 <20220907121612.FBFC.409509F4@e16-tech.com>
In-Reply-To: <20220907121612.FBFC.409509F4@e16-tech.com>

--------------913tV1XCvnFtcPhXOJlte02z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDkuMjIgdW0gMDY6MTYgc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+PiBBbSAwMi4wOS4yMiB1bSAwNzo1MiBzY2hyaWViIFdhbmcgWXVndWk6DQo+Pj4g
SGksDQo+Pj4NCj4+PiBtZ2FnMjAwIGJyb2tlbiBvbiBrZXJuZWwtNi4wLXJjMyBvbiBERUxM
L1Q2MjAuDQo+Pj4NCj4+PiBTZWUgdGhlIGF0dGFjaGVtZW50bWVudCBmaWxlIGZvciB0aGUg
Z3JhcGggb3V0cHV0Lg0KPj4NCj4+IFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoZSBidWcuIFdl
IHJlY2VudGx5IHJlZmFjdG9yZWQgc29tZSBjb2RlIG9mIHRoZSBkcml2ZXIuIENhbiB5b3Ug
YmlzZWN0IHRvIHRoZSBjaGFuZ2UgdGhhdCBpbnRyb2R1Y2VkIHRoZSBwcm9ibGVtPw0KPiAN
Cj4gNS4xOS4zIHdvcmtzIHdlbGwgb24gdGhpcyBERUxML1Q2MjAuDQo+IA0KPiBzbyB0aGlz
IHByb2JsZW0gc2hvdWxkIGJlIGEgcmVncmVzc2lvbiBvZiA2LjAuDQo+IA0KPiBvdGhlciBi
aXNlY3Qgc2VlbSBkaWZmaWN1bHQgZm9yIG1lLg0KDQpPSywgdGhhbmsgeW91LiBDYW4geW91
IHByb3ZpZGUgdGhlIGRtZXNnIGxvZyBvZiB0aGUgYnJva2VuIG1hY2hpbmUgYW5kIA0KdGhl
IG91dHB1dCBvZiAnc3VkbyBsc3BjaSAtdm4nIHBsZWFzZT8NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gQmVzdCBSZWdhcmRzDQo+IFdhbmcgWXVndWkgKHdhbmd5dWd1aUBl
MTYtdGVjaC5jb20pDQo+IDIwMjIvMDkvMDcNCj4gDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJk
cw0KPj4gVGhvbWFzDQo+Pg0KPj4+DQo+Pj4gW3Jvb3RAVDYyMCB+XSMgZG1lc2cgIHxncmVw
IC1pICd2Z2FcfG1nYScNCj4+PiBbICAgIDAuNTg4OTQwXSBDb25zb2xlOiBjb2xvdXIgVkdB
KyA4MHgyNQ0KPj4+IFsgICAgNC45MTgyMTRdIHBjaSAwMDAwOjBhOjAwLjA6IHZnYWFyYjog
c2V0dGluZyBhcyBib290IFZHQSBkZXZpY2UNCj4+PiBbICAgIDQuOTE5MDI4XSBwY2kgMDAw
MDowYTowMC4wOiB2Z2FhcmI6IGJyaWRnZSBjb250cm9sIHBvc3NpYmxlDQo+Pj4gWyAgICA0
LjkxOTAyOF0gcGNpIDAwMDA6MGE6MDAuMDogdmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiBk
ZWNvZGVzPWlvK21lbSxvd25zPWlvK21lbSxsb2Nrcz1ub25lDQo+Pj4gWyAgICA0Ljk0MTA1
OF0gdmdhYXJiOiBsb2FkZWQNCj4+PiBbICAgIDkuMzg1NDg1XSBtZ2FnMjAwIDAwMDA6MGE6
MDAuMDogdmdhYXJiOiBkZWFjdGl2YXRlIHZnYSBjb25zb2xlDQo+Pj4gWyAgICA5LjUxMDY4
OF0gW2RybV0gSW5pdGlhbGl6ZWQgbWdhZzIwMCAxLjAuMCAyMDExMDQxOCBmb3IgMDAwMDow
YTowMC4wIG9uIG1pbm9yIDANCj4+PiBbICAgIDkuNTIzMTQ1XSBmYmNvbjogbWdhZzIwMGRy
bWZiIChmYjApIGlzIHByaW1hcnkgZGV2aWNlDQo+Pj4gWyAgICA5LjY0MTU0M10gbWdhZzIw
MCAwMDAwOjBhOjAwLjA6IFtkcm1dIGZiMDogbWdhZzIwMGRybWZiIGZyYW1lIGJ1ZmZlciBk
ZXZpY2UNCj4+Pg0KPj4+DQo+Pj4gbW9yZSBpbmZvOg0KPj4+IDEsIFRoaXMgREVMTC9UNjIw
IHdvcmtzIHdlbGwgd2l0aCBrZXJuZWwgNS4xNS42MywNCj4+PiAgICAgICBzbyB0aGlzIGlz
IG5vdCBhICBoYXJkd2FyZSBlcnJvci4NCj4+Pg0KPj4+IDIsIERFTEwvVDY0MCB3b3JrcyB3
ZWxsIHdpdGgga2VybmVsIDYuMC1yYyBhbmQgNS4xNS42My4NCj4+PiAgICAgICBib3RoIERF
TEwvVDYyMCBhbmQgREVMTC9UNjQwIHVzZSB0aGUgZHJpdmVyICdtZ2FnMjAwJy4NCj4+Pg0K
Pj4+IFtyb290QFQ2NDAgfl0jICBkbWVzZyAgfGdyZXAgLWkgJ3ZnYVx8bWdhJw0KPj4+IFsg
ICAxMC4xNjE1MDBdIHBjaSAwMDAwOjAzOjAwLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290
IFZHQSBkZXZpY2UNCj4+PiBbICAgMTAuMTYyNDYzXSBwY2kgMDAwMDowMzowMC4wOiB2Z2Fh
cmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29kZXM9aW8rbWVtLG93bnM9aW8rbWVtLGxvY2tz
PW5vbmUNCj4+PiBbICAgMTAuMTc2NTI3XSBwY2kgMDAwMDowMzowMC4wOiB2Z2FhcmI6IGJy
aWRnZSBjb250cm9sIHBvc3NpYmxlDQo+Pj4gWyAgIDEwLjE4MjQ2NV0gdmdhYXJiOiBsb2Fk
ZWQNCj4+PiBbICAgMTEuODMyODM5XSBmYjA6IEVGSSBWR0EgZnJhbWUgYnVmZmVyIGRldmlj
ZQ0KPj4+IFsgICAyMS4zMDM4MjZdIG1nYWcyMDAgMDAwMDowMzowMC4wOiB2Z2FhcmI6IGRl
YWN0aXZhdGUgdmdhIGNvbnNvbGUNCj4+PiBbICAgMjEuMzE5NDk4XSBbZHJtXSBJbml0aWFs
aXplZCBtZ2FnMjAwIDEuMC4wIDIwMTEwNDE4IGZvciAwMDAwOjAzOjAwLjAgb24gbWlub3Ig
MA0KPj4+IFsgICAyMS4zMzAyMjNdIGZiY29uOiBtZ2FnMjAwZHJtZmIgKGZiMCkgaXMgcHJp
bWFyeSBkZXZpY2UNCj4+PiBbICAgMjEuMzMyMTQwXSBtZ2FnMjAwIDAwMDA6MDM6MDAuMDog
W2RybV0gZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoKSBub3QgY2FsbGVkDQo+
Pj4gWyAgIDIxLjc0MTYyOV0gbWdhZzIwMCAwMDAwOjAzOjAwLjA6IFtkcm1dIGZiMDogbWdh
ZzIwMGRybWZiIGZyYW1lIGJ1ZmZlciBkZXZpY2UNCj4+Pg0KPj4+IEJlc3QgUmVnYXJkcw0K
Pj4+IFdhbmcgWXVndWkgKHdhbmd5dWd1aUBlMTYtdGVjaC5jb20pDQo+Pj4gMjAyMi8wOS8w
Mg0KPj4+DQo+PiAtLSBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCj4+IEdlc2NoP2Z0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------913tV1XCvnFtcPhXOJlte02z--

--------------WiIZetdBghKYxTU8GU6GEEnj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYPnQFAwAAAAAACgkQlh/E3EQov+AR
YQ/9GSNSTLwGBDigm0puKIYGMbXoAhhUcY2PTlZrt8VH4ztxwxM4mg8EHBW350IfE7oYu4+DWFra
5ZZWpX0m/UfJ98WBercNAbtblFO/AVzKZpmWyD2Iy7yIynxSiTLwhwOvbTCEtvcT/kkoadzpyE1/
11PzgLp/BkQ/GYnGor1gbOPrhnOFzWQ39eT/r4jDgfNwnBHyEv91FkgV246HgMgpAdtEQiwhZKWe
phxKHNqSuKWEz1F/6eAKQnhEzb/UFOkjeLIMXcxN99RZzj2bH1rwgf8xWO5JkxvbJTVnIuGyh6op
q++NK6CVus7FvZOn+GG+G4jgyszuX7TWNn6fROC9z+kKjGqDB4/uV9gLsHJJrttKkkBeT4Oq6mKr
F4yMRnaNALs/Suza0u71y4itqX1bjZCfK+UVz3p3eg3MIbrVz1+owFfjw72PpNOCw/YJVeC33Y5A
EDI0F28TUp0d0zbcwnhzCXhsK+iUZDdbp8v5DoFUIYhSrukGHJDnhZ9VkJJ813kePSNQYdiRkuYt
ufIu1fDfHwRXzDL9XDUF7dcx3oLVsoPY7eg9N2qKCc004GFqvBOSPbSDJ7LpWnnajstHkv05kukv
HX9KcQIs3v9YoJYbyQiITgK9zY/3XnbYaW6PKVfqSaU4cz1bsvzKktjrrrIA8T2b0F0wgaNFdCC0
+ug=
=tKs9
-----END PGP SIGNATURE-----

--------------WiIZetdBghKYxTU8GU6GEEnj--
