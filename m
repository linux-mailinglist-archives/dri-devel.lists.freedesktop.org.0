Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7DB5B9B5D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 14:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2A810E1D8;
	Thu, 15 Sep 2022 12:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA34810E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 12:55:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88C7A1F461;
 Thu, 15 Sep 2022 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663246499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJ3npMOlF6WNoIsfiC4M3O7VnzhraIGnztddpOCa1hg=;
 b=IEOWJWcS88qRn+IVK4/mqG1A3/tYmGacpMpA5yNDraxlXeGvDwR5eNpbrAzhzG2YDWSbeO
 6VW9TDTA+jqbviT8BjLEqrIV2L3hAWAa94JU9PwU5CaJQzlq+kK+C2iThW/Ms5TOnGBwJ/
 DuOnGVDmdVPk5zGCh8kskNXrcT0gP08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663246499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJ3npMOlF6WNoIsfiC4M3O7VnzhraIGnztddpOCa1hg=;
 b=Aa9cSt576uLrH5DVRLMU9xQtSR1lU2ht1Hm4FxrvUQ0akNfchy2deuroq/FE3pEHf8LRcT
 NlwkvPWzF9eMTvCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73A25133B6;
 Thu, 15 Sep 2022 12:54:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QpRoG6MgI2MJUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Sep 2022 12:54:59 +0000
Message-ID: <0bb98321-dc3d-8bb3-f7b1-eb09c617a1de@suse.de>
Date: Thu, 15 Sep 2022 14:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220914162920.7233.409509F4@e16-tech.com>
 <03f80477-78c1-2ef3-40bf-58f8c9daa1c8@suse.de>
 <20220914225809.763F.409509F4@e16-tech.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220914225809.763F.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JCFhjnlRgoroNAFuLQaWSXd4"
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
--------------JCFhjnlRgoroNAFuLQaWSXd4
Content-Type: multipart/mixed; boundary="------------g5miX0vAKxJnMclZyA2YRhTX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <0bb98321-dc3d-8bb3-f7b1-eb09c617a1de@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220914162920.7233.409509F4@e16-tech.com>
 <03f80477-78c1-2ef3-40bf-58f8c9daa1c8@suse.de>
 <20220914225809.763F.409509F4@e16-tech.com>
In-Reply-To: <20220914225809.763F.409509F4@e16-tech.com>

--------------g5miX0vAKxJnMclZyA2YRhTX
Content-Type: multipart/mixed; boundary="------------UXxYc1Eoqdo0QR17XX9GrU05"

--------------UXxYc1Eoqdo0QR17XX9GrU05
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDkuMjIgdW0gMTY6NTggc2NocmllYiBXYW5nIFl1Z3VpOg0KWy4uLl0N
Cj4+IDI0LWJpdCB3b3JrcyBvbiBteSBHMjAwSEUgYW5kIEcyMDAgdGVzdCBtYWNoaW5lcy4g
TWF5YmUgdGhlIEcyMDBFUiBoYXMgYSBidWcuDQo+Pg0KPj4gV2hlbiBJIHRyeSAxNi1iaXQg
ZGVwdGgsIHRoZSBkaXNwbGF5IHdvcmtzLCBidXQgaXMgd2F5IHRvbyBkYXJrLiBObyBmaWRk
bGluZyB3aXRoIHRoZSBMVVQgdGFibGVzIGZpeGVzIHRoaXMuIEl0J3MgOTBzIGhhcmR3YXJl
LCBzbyBpdCBzaG91bGQgc3VwcG9ydCAxNi1iaXQgZnJhbWVidWZmZXJzIHdlbGwsIGJ1dCB0
aGVyZSdzIG5vIG9idmlvdXMgYnVnIHRvIGJlIHNlZW4uDQo+Pg0KPj4gSSBndWVzcywgd2Ug
Y291bGQgcmVtb3ZlIDE2IGFuZCAyNCBiaXQgc3VwcG9ydCBmb3Igbm93IGlmIG5vdGhpbmcg
ZWxzZSBoZWxwcy4NCj4gDQo+IA0KPiBtYXliZSBiZXR0ZXIgaWYgd2UgcmV2ZXJ0IDczZjU0
ZDVkOTY4MiAoZHJtL21nYWcyMDA6IFJlbW92ZSBzcGVjaWFsIGNhc2UNCj4gZm9yIEcyMDBT
RSB3aXRoIDwyIE1pQikNCg0KQ291bGQgeW91IHBsZWFzZSB0ZXN0IHRoZSBhdHRhY2hlZCBw
YXRjaCBvbiB0aGUgNi4wLXJjMyBrZXJuZWw/IEl0IA0Kc2hvdWxkIGZvcmNlIHRoZSBkcml2
ZXIgdG8gYSBjb3JyZWN0IGNvbG9yIGZvcm1hdCBpZiBubyBrZXJuZWwgDQpwYXJhbWV0ZXJz
IGFyZSBnaXZlbi4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gYmVjYXVzZSB0
aGVyZSBpcyBubyB0ZXN0IHJlc3VsdCBvbiBkZXZpY2UgRzIwMF9TRQ0KPiANCj4gc3RhdGlj
IHVuc2lnbmVkIGludCBtZ2FnMjAwX3ByZWZlcnJlZF9kZXB0aChzdHJ1Y3QgbWdhX2Rldmlj
ZSAqbWRldikNCj4gew0KPiAgICAgICAgIGlmIChJU19HMjAwX1NFKG1kZXYpICYmIG1kZXYt
PnZyYW1fZmJfYXZhaWxhYmxlIDwgKDIwNDgqMTAyNCkpDQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gMTY7DQo+ICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIDMy
Ow0KPiB9DQo+IA0KPiBCZXN0IFJlZ2FyZHMNCj4gV2FuZyBZdWd1aSAod2FuZ3l1Z3VpQGUx
Ni10ZWNoLmNvbSkNCj4gMjAyMi8wOS8xNA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==
--------------UXxYc1Eoqdo0QR17XX9GrU05
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-mgag200-Force-32-bpp-on-the-console.patch"
Content-Disposition: attachment;
 filename="0001-drm-mgag200-Force-32-bpp-on-the-console.patch"
Content-Transfer-Encoding: base64

RnJvbSBjMjcxNzMyNGMwNzRjODNmNTUzY2Y3YWYxNGFhMWRiOWY1YTRjNmY1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxNSBTZXAgMjAyMiAxNDowOTowMyArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS9tZ2FnMjAwOiBGb3JjZSAzMiBicHAgb24gdGhlIGNvbnNvbGUKCkcy
MDBFUiBkb2VzIG5vdCBzZWVtIHRvIHN1cHBvcnQgMjQgYnBwLCBzbyBmb3JjZSB0aGUgY29u
c29sZSB0byB1c2UKMzIgYnBwLgoKUmVwb3J0ZWQtYnk6IFdhbmcgWXVndWkgPHdhbmd5dWd1
aUBlMTYtdGVjaC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgpGaXhlczogNzNmNTRkNWQ5NjgyICgiZHJtL21nYWcyMDA6IFJl
bW92ZSBzcGVjaWFsIGNhc2UgZm9yIEcyMDBTRSB3aXRoIDwyIE1pQiIpCkNjOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEpvY2VseW4gRmFsZW1wZSA8
amZhbGVtcGVAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfZHJ2LmMKaW5kZXggMjUxYTFiYjY0OGNjLi5hMjIyYmY3NjgwNGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwpAQCAtMjYyLDcgKzI2Miwx
MSBAQCBtZ2FnMjAwX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0J
ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2LCAwKTsKKwkvKgorCSAqIEZJWE1FOiBBIDI0
LWJpdCBjb2xvciBkZXB0aCBkb2VzIG5vdCB3b3JrIHdpdGggMjQgYnBwIG9uCisJICogRzIw
MEVSLiBGb3JjZSAzMiBicHAuCisJICovCisJZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2
LCAzMik7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMzcuMwoK

--------------UXxYc1Eoqdo0QR17XX9GrU05--

--------------g5miX0vAKxJnMclZyA2YRhTX--

--------------JCFhjnlRgoroNAFuLQaWSXd4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMjIKIFAwAAAAAACgkQlh/E3EQov+B6
lxAAmIzNd1bUrOKRrxmlxhUEriBPfCWcq4IYHx8PsBonqj2/PU/h6d7ZBPBSxI4CHu5PKzuyeyx3
375+3cweKU6Eu17V/EKdCFLzYD08prDYWfYbEn1ak13b+a44IQPOL9oMR3dSAq52iD7EOW+MgsoA
imDRIKLi/6Us6hOu/+SEI1D1qqG0z6cJdeHy6BsACJJ6PV8HZMbqTH1G5Reogoqk5qMhPIofVaJ0
0TIaxzXTpii9e7h/GpQHsSfDj+sJ7NrMWzvQYDTsJF9BZu7zxu5DA6nohGJhLqyxaf9agkR8bdiL
9eg4ahxZW9w2mwkTQ/EdnunIZgOGhSNTYmbAIBBujPETZo1aExPWyS1f5DzACAYnEjOsiBXHhsPV
sN/UJRdjNab5IGtEnk2eSISXORY1ZxMPySBEr4Eqh6RoD33anIPl8YxzfU9rPIxIKQolSCEvtm/N
Bqj8nZhR2xPiSiihxgB+PR3rDtJPNhhC/6uKasuzQFlZZ06QCS3DrV+DREA65AcG7aeTZBY0UNGX
HK6SCCqumzqDApTUPvh9wdvyrNbz6H/PLRP8LIzslj6ENYuhCGG9LjEPFEF8JqLZixbAV2n0DCT6
aJ8zLVj0TTeZv8j8IXTIJxSwEKTNbla7fs8d23gftX+mgppVnKirzblUklfMtIbi0ewxWM0OX7oK
Ec0=
=zPyH
-----END PGP SIGNATURE-----

--------------JCFhjnlRgoroNAFuLQaWSXd4--
