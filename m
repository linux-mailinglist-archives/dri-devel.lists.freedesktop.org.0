Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA95B699C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D8010E640;
	Tue, 13 Sep 2022 08:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A4B10E640
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 08:34:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46C7E5BFFF;
 Tue, 13 Sep 2022 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663058070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmYsG49vqEAT2b+ads3ujwuXiC+Mzxa+CgeNJ1lOXp0=;
 b=x6h8Os7amnkglBfXu6pzUs4AHNlEeqkELi7eirMfPWYOwuVAIrgVepuaeTXEfkGh18Nqb3
 t1VCihYP6BmkfQz8OZEV5H2Ogk3W/lWu9LZSAhikkQBqw62Fm8YmDp2m/fRrL1Va2f5L62
 oPanJoilwpM4qK6EQOWaTj56MZPP49g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663058070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmYsG49vqEAT2b+ads3ujwuXiC+Mzxa+CgeNJ1lOXp0=;
 b=A/AEKSqZDoPTMRoehVzjFYkSmLGtPUguHGliG+L9Cidza2stBBNGkBhB32XsqhJrBbsWT5
 27+9QoT79Prp+bAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33860139B3;
 Tue, 13 Sep 2022 08:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7dS9C5ZAIGMkGwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Sep 2022 08:34:30 +0000
Message-ID: <5dbb416f-04dd-d2d7-a542-3d83b45a99a0@suse.de>
Date: Tue, 13 Sep 2022 10:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
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
 boundary="------------Ob3tTUAs9PyVi0UuJPJHyaPm"
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
--------------Ob3tTUAs9PyVi0UuJPJHyaPm
Content-Type: multipart/mixed; boundary="------------HqYA8Ty74cQiwlV9eAjU5XOx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <5dbb416f-04dd-d2d7-a542-3d83b45a99a0@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220902135242.2447.409509F4@e16-tech.com>
 <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
 <20220907121612.FBFC.409509F4@e16-tech.com>
In-Reply-To: <20220907121612.FBFC.409509F4@e16-tech.com>

--------------HqYA8Ty74cQiwlV9eAjU5XOx
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
aXNlY3Qgc2VlbSBkaWZmaWN1bHQgZm9yIG1lLg0KDQpJIGxvb2tlZCBmb3IgY2hhbmdlcyBi
ZXR3ZWVuIDUuMTkgYW5kIDYuMC1yYzMgdGhhdCBjb3VsZCBhZmZlY3QgRzIwMEVSIA0Kc3Bl
Y2lmaWNhbGx5LCBidXQgY291bGQgbm90IGZpbmQgYW55dGhpbmcuIEl0IHdvdWxkIGhlbHAg
aWYgSSdkIGtub3cgdGhlIA0KZmlyc3QgYnJva2VuIGNvbW1pdC4gSXMgdGhlcmUgYW55IGNo
YW5jZSB0aGF0IHlvdSBnZXQgdGhlIGdpdCBiaXNlY3RpbmcgDQp0byB3b3JrPw0KDQpUaGUg
Y29tbWFuZHMgc2hvdWxkIGJlDQoNCiAgIGdpdCBiaXNlY3QgcmVzZXQNCiAgIGdpdCBiaXNl
Y3Qgc3RhcnQgdjYuMC1yYzMgdjUuMTkNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gQmVzdCBSZWdhcmRzDQo+IFdhbmcgWXVndWkgKHdhbmd5dWd1aUBlMTYtdGVjaC5jb20p
DQo+IDIwMjIvMDkvMDcNCj4gDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFz
DQo+Pg0KPj4+DQo+Pj4gW3Jvb3RAVDYyMCB+XSMgZG1lc2cgIHxncmVwIC1pICd2Z2FcfG1n
YScNCj4+PiBbICAgIDAuNTg4OTQwXSBDb25zb2xlOiBjb2xvdXIgVkdBKyA4MHgyNQ0KPj4+
IFsgICAgNC45MTgyMTRdIHBjaSAwMDAwOjBhOjAwLjA6IHZnYWFyYjogc2V0dGluZyBhcyBi
b290IFZHQSBkZXZpY2UNCj4+PiBbICAgIDQuOTE5MDI4XSBwY2kgMDAwMDowYTowMC4wOiB2
Z2FhcmI6IGJyaWRnZSBjb250cm9sIHBvc3NpYmxlDQo+Pj4gWyAgICA0LjkxOTAyOF0gcGNp
IDAwMDA6MGE6MDAuMDogdmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPWlvK21l
bSxvd25zPWlvK21lbSxsb2Nrcz1ub25lDQo+Pj4gWyAgICA0Ljk0MTA1OF0gdmdhYXJiOiBs
b2FkZWQNCj4+PiBbICAgIDkuMzg1NDg1XSBtZ2FnMjAwIDAwMDA6MGE6MDAuMDogdmdhYXJi
OiBkZWFjdGl2YXRlIHZnYSBjb25zb2xlDQo+Pj4gWyAgICA5LjUxMDY4OF0gW2RybV0gSW5p
dGlhbGl6ZWQgbWdhZzIwMCAxLjAuMCAyMDExMDQxOCBmb3IgMDAwMDowYTowMC4wIG9uIG1p
bm9yIDANCj4+PiBbICAgIDkuNTIzMTQ1XSBmYmNvbjogbWdhZzIwMGRybWZiIChmYjApIGlz
IHByaW1hcnkgZGV2aWNlDQo+Pj4gWyAgICA5LjY0MTU0M10gbWdhZzIwMCAwMDAwOjBhOjAw
LjA6IFtkcm1dIGZiMDogbWdhZzIwMGRybWZiIGZyYW1lIGJ1ZmZlciBkZXZpY2UNCj4+Pg0K
Pj4+DQo+Pj4gbW9yZSBpbmZvOg0KPj4+IDEsIFRoaXMgREVMTC9UNjIwIHdvcmtzIHdlbGwg
d2l0aCBrZXJuZWwgNS4xNS42MywNCj4+PiAgICAgICBzbyB0aGlzIGlzIG5vdCBhICBoYXJk
d2FyZSBlcnJvci4NCj4+Pg0KPj4+IDIsIERFTEwvVDY0MCB3b3JrcyB3ZWxsIHdpdGgga2Vy
bmVsIDYuMC1yYyBhbmQgNS4xNS42My4NCj4+PiAgICAgICBib3RoIERFTEwvVDYyMCBhbmQg
REVMTC9UNjQwIHVzZSB0aGUgZHJpdmVyICdtZ2FnMjAwJy4NCj4+Pg0KPj4+IFtyb290QFQ2
NDAgfl0jICBkbWVzZyAgfGdyZXAgLWkgJ3ZnYVx8bWdhJw0KPj4+IFsgICAxMC4xNjE1MDBd
IHBjaSAwMDAwOjAzOjAwLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290IFZHQSBkZXZpY2UN
Cj4+PiBbICAgMTAuMTYyNDYzXSBwY2kgMDAwMDowMzowMC4wOiB2Z2FhcmI6IFZHQSBkZXZp
Y2UgYWRkZWQ6IGRlY29kZXM9aW8rbWVtLG93bnM9aW8rbWVtLGxvY2tzPW5vbmUNCj4+PiBb
ICAgMTAuMTc2NTI3XSBwY2kgMDAwMDowMzowMC4wOiB2Z2FhcmI6IGJyaWRnZSBjb250cm9s
IHBvc3NpYmxlDQo+Pj4gWyAgIDEwLjE4MjQ2NV0gdmdhYXJiOiBsb2FkZWQNCj4+PiBbICAg
MTEuODMyODM5XSBmYjA6IEVGSSBWR0EgZnJhbWUgYnVmZmVyIGRldmljZQ0KPj4+IFsgICAy
MS4zMDM4MjZdIG1nYWcyMDAgMDAwMDowMzowMC4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdh
IGNvbnNvbGUNCj4+PiBbICAgMjEuMzE5NDk4XSBbZHJtXSBJbml0aWFsaXplZCBtZ2FnMjAw
IDEuMC4wIDIwMTEwNDE4IGZvciAwMDAwOjAzOjAwLjAgb24gbWlub3IgMA0KPj4+IFsgICAy
MS4zMzAyMjNdIGZiY29uOiBtZ2FnMjAwZHJtZmIgKGZiMCkgaXMgcHJpbWFyeSBkZXZpY2UN
Cj4+PiBbICAgMjEuMzMyMTQwXSBtZ2FnMjAwIDAwMDA6MDM6MDAuMDogW2RybV0gZHJtX3Bs
YW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoKSBub3QgY2FsbGVkDQo+Pj4gWyAgIDIxLjc0
MTYyOV0gbWdhZzIwMCAwMDAwOjAzOjAwLjA6IFtkcm1dIGZiMDogbWdhZzIwMGRybWZiIGZy
YW1lIGJ1ZmZlciBkZXZpY2UNCj4+Pg0KPj4+IEJlc3QgUmVnYXJkcw0KPj4+IFdhbmcgWXVn
dWkgKHdhbmd5dWd1aUBlMTYtdGVjaC5jb20pDQo+Pj4gMjAyMi8wOS8wMg0KPj4+DQo+PiAt
LSBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4g
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCj4+IEdlc2NoP2Z0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------HqYA8Ty74cQiwlV9eAjU5XOx--

--------------Ob3tTUAs9PyVi0UuJPJHyaPm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMgQJUFAwAAAAAACgkQlh/E3EQov+B5
Kg/6AlmAA+5XyZsIVon+YCwQaAFE4+gy2H0gdz83HkVsrUZ5vAp53TRJZzvLOp7sbgqTKVTvDtTL
AWcIUOZj5Uf09es3Lsr2patkW4bT6OneSnc3//RdwuP5x3PacDJarPuThz534mdLwUS6T9Nq5I+X
wj4XY9MFMVJ4Agh7/TrvQURnRY7xL+MSDXkAMes+63naTpWELrn7OfOLwebAn4z4waJrvUo3klhW
EBU1gF0AjvN0ILdpOcH0KwU9yTPaXxfeEu/av14w4oR84kIK1+SzDK3pGZuuTCBa7pOcs7KR6jGO
d1rUziiacxVmvzLDBj2BSVgC0Fxmx5Aspmj93/bM+P+fU2rGJMO9w20XMvf2KHpQ+xE5OeCFv5mI
j14YFD3bqUEQryMPLziBFdH+E7tBUf7PoTBye2DgiX6VQSiE7C4MNMkEPCFbcyIysUSefiWpNO6z
030OqgXBtk3XMHTlZK3noKLLtRrlIbRIyqW5h09wGXTA7FQNlCmPyVQO4B/+8NVxclARuc+aLuCT
AhQobNdWmWHhrN8U8MmpUpYQrpCcgWDarqwHqGVpLlkWdUtUIXUESzYOS8SBLxb5ONLkf6UkNDjg
pMCyNm9BtqCHMfp2Lf3YR+s3qOdDTDn/RbxJGGRpSl5lDDT7ahCEiq19C343y5ycRxLecchP167H
TrY=
=+LI7
-----END PGP SIGNATURE-----

--------------Ob3tTUAs9PyVi0UuJPJHyaPm--
