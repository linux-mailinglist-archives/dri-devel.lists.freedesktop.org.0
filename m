Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9826F09F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 22:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1682889CCB;
	Sat, 20 Jul 2019 20:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90A89CCB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 20:29:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A204E20021;
 Sat, 20 Jul 2019 22:29:09 +0200 (CEST)
Date: Sat, 20 Jul 2019 22:29:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
Message-ID: <20190720202908.GA23794@ravnborg.org>
References: <20190720134709.15186-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190720134709.15186-1-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=gAmX6pxEAAAA:20
 a=7gkXJVJtAAAA:8 a=opxDEaWtH2sSw4BXqXoA:9 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKR29vZCB0byBzZWUgYSBsb25nIGpvdXJuZXkgZW5kIHdpdGggYSB2ZXJ5IG5p
Y2UgcmVzdWx0LgpJIG9ubHkgZW50ZXJlZCB0aGUgRFJNIHdvcmxkIGZvciB0aGUgbGFzdCBwYXJ0
cyBvZiB0aGUgam91cm5leSwKYnV0IG5ldmVydGhlbGVzcyBpbXByZXNzZWQgYnkgYWxsIHRoZSBu
aWNlIHJlZmFjdG9yaW5nIGRvbmUuCgpPbiBTYXQsIEp1bCAyMCwgMjAxOSBhdCAwMzo0NzowM1BN
ICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhpcyBzZXJpZXMgdGlja3Mgb2ZmIHRo
ZSBsYXN0IHRpbnlkcm0gdG9kbyBlbnRyeSBhbmQgbW92ZXMgb3V0IG1pcGlfZGJpCj4gdG8gYmUg
YSBjb3JlIGhlbHBlci4KPiAKPiBJdCBzcGxpdHMgc3RydWN0IG1pcGlfZGJpIGludG8gYW4gaW50
ZXJmYWNlIHBhcnQgYW5kIGEgZGlzcGxheSBwaXBlbGluZQo+IHBhcnQgKHVwbG9hZCBmcmFtZWJ1
ZmZlciBvdmVyIFNQSSkuIEkgYWxzbyB0b29rIHRoZSBvcHBvcnR1bml0eSB0bwo+IHJlbmFtZSB0
aGUgYW1iaWd1b3VzICdtaXBpJyB2YXJpYWJsZSBuYW1lIHRvICdkYmknLiBUaGlzIGxpbmVzIHVw
IHdpdGgKPiB0aGUgdXNlIG9mIHRoZSAnZHNpJyB2YXJpYWJsZSBuYW1lIGluIHRoZSBNSVBJIERT
SSBoZWxwZXIuCj4gCj4gTm90ZToKPiBUaGlzIGRlcGVuZHMgb24gc2VyaWVzOiBkcm0vdGlueWRy
bTogUmVtb3ZlIHRpbnlkcm0ua28KPiAKPiBTZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgaGVyZToK
PiBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vbGludXgvdHJlZS9tb3ZlX21pcGlfZGJpCj4gCj4g
Tm9yYWxmLgo+IAo+IE5vcmFsZiBUcsO4bm5lcyAoNik6Cj4gICBkcm0vdGlueWRybS9taXBpLWRi
aTogTW92ZSBjbWRsb2NrIG11dGV4IGluaXQKPiAgIGRybS90aW55ZHJtOiBSZW5hbWUgdmFyaWFi
bGUgbWlwaSAtPiBkYmkKPiAgIGRybS90aW55ZHJtOiBSZW5hbWUgcmVtYWluaW5nIHZhcmlhYmxl
IG1pcGkgLT4gZGJpZGV2Cj4gICBkcm0vdGlueWRybTogU3BsaXQgc3RydWN0IG1pcGlfZGJpIGlu
IHR3bwo+ICAgZHJtL3Rpbnlkcm06IE1vdmUgbWlwaS1kYmkKPiAgIE1BSU5UQUlORVJTOiBSZW1v
dmUgdGlueWRybSBlbnRyeQoKSSBoYXZlIHJlYWQgYWxsIHBhdGNoZXMgLSBsb29rcyBnb29kLgpJ
biAiU3BsaXQgc3RydWN0IG1pcGlfZGJpIGluIHR3byIgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRo
ZSBzdHJ1Y3QKbWVtYmVycyBpcyBtb3ZlZCBpbnNpZGUgdGhlIHN0cnVjdCAtIHRoaXMgbWFrZXMg
aXQgbW9yZSByZWFkYmFsZSBhbmQgaXMKZ29vZC4KVGhpcyBjb3VsZCBoYXZlIGJlZW4gYW4gaW5k
ZXBlbmRlbnQgcGF0Y2gsIG9yIGF0IGxlYXN0IG1lbnRpb25lZCBpbiB0aGUKY2hhbmdlbG9nLgoK
WW91IGNhbiBmb3IgYWxsIHBhdGNoZXMgYWRkOgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
