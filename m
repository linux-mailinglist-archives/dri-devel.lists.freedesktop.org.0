Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CF89DE0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 14:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16006E504;
	Mon, 12 Aug 2019 12:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045606E504
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:18:12 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50596
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hx9H7-0002qZ-QA; Mon, 12 Aug 2019 14:18:09 +0200
Subject: Re: [PATCH 4/4] drm/panel/ili9341: Support DPI panels
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-5-noralf@tronnes.org>
 <20190811170201.GF14660@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8296ce35-4c8c-ba90-711c-55ad006d0b9f@tronnes.org>
Date: Mon, 12 Aug 2019 14:18:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811170201.GF14660@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=9/1O/YrRyzOLM37t60S7f4Ct/Ym3W9JMo/eIRaIUI2w=; 
 b=d58TC4YPQo7iJCnCuV9vu1xDECPAtMOh6Vbce+MFl0ln0j051UudvQdynqvVdZ71W+cFjiYLubjE7R3UQ+moZqcyVU/El8d/uz8qOUsd+atXTOEe5Dj3pVsgYB1az+QbCc39c1Ma61yQY+E9vk3y3Xt7Rln/aBZld7A4y0RTduw7op1Dwqesc4BtIQJtJKbXpLJ2aVEwOKbobenFMYsMu+4t36avzWNZXAatFC7zeIOE6XfsxDpglSwHwRaG7pBtf4K0HSmPIKbw/tRfFiS8KxfyqN6wZ/ISSE74Dv80t7peJQlISgW7vNkEjD7l7ilE8jXj78YBn2d6ml+OH0sozg==;
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTEuMDguMjAxOSAxOS4wMiwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAwMzo1Mjo0OVBNICswMjAwLCBOb3JhbGYgVHLD
uG5uZXMgd3JvdGU6Cj4+IEFkZCBzdXBwb3J0IGZvciBwYW5lbHMgdGhhdCB1c2UgdGhlIERQSSBp
bnRlcmZhY2UuCj4+IElMSTkzNDEgaGFzIG9uYm9hcmQgUkFNIHNvIHRoZSBhc3N1bXB0aW9uIG1h
ZGUgaGVyZSBpcyB0aGF0IGFsbCBzdWNoCj4+IHBhbmVscyBzdXBwb3J0IHBpeGVsIHVwbG9hZCBv
dmVyIERCSS4KPj4KPj4gVGhlIHByZXNlbmNlL2Fic2Vuc2Ugb2YgdGhlIERldmljZSBUcmVlICdw
b3J0JyBub2RlIGRlY2lkZXMgd2hpY2gKPj4gaW50ZXJmYWNlIGlzIHVzZWQgZm9yIHBpeGVsIHRy
YW5zZmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9u
bmVzLm9yZz4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWls
aTkzNDEuYyB8IDU2ICsrKysrKysrKysrKysrKystLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNDUg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1pbGl0ZWstaWxpOTM0MS5jCgo8c25pcD4KCj4+ICBzdGF0aWMgaW50IGlsaTkz
NDFfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4+ICB7Cj4+ICAJc3RydWN0IGlsaTkz
NDEgKmlsaSA9IHNwaV9nZXRfZHJ2ZGF0YShzcGkpOwo+PiAgCj4+IC0JZHJtX2Rldl91bnBsdWco
JmlsaS0+ZGJpZGV2LmRybSk7Cj4+IC0JZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oJmlsaS0+
ZGJpZGV2LmRybSk7Cj4+ICsJaWYgKGlsaS0+dXNlX2RwaSkgewo+PiArCQlkcm1fcGFuZWxfcmVt
b3ZlKCZpbGktPnBhbmVsKTsKPj4gKwkJZHJtX3BhbmVsX2Rpc2FibGUoJmlsaS0+cGFuZWwpOwo+
PiArCQlkcm1fcGFuZWxfdW5wcmVwYXJlKCZpbGktPnBhbmVsKTsKPj4gKwkJa2ZyZWUoaWxpKTsK
PiBBdCBmaXJzdCBJIHRob3VnaHQgLSBvcmRlciBpcyB3cm9uZy4KPiBCdXQgZHJtX3BhbmVsX3Jl
bW92ZSgpIHByZXZlbnRzIGRpc3BsYXkgZHJpdmVycyBmcm9tIHVzaW5nIHRoZSBkcml2ZXIuCj4g
QW5kIHRoaXMgd2lsbCBub3QgaW52YWxpZGF0ZSB0aGUgb3RoZXIgY2FsbHMuCj4gTWF5YmUgYWRk
IGEgc2hvcnQgY29tbWVudD8KPiAKCkkganVzdCBjb3BpZWQgdGhpcyBjb2RlIGZyb20gSm9zZWYn
cyBkcml2ZXIsIGRpZG4ndCBhY3R1YWxseSBsb29rIHRoYXQKY2xvc2UgYXQgaXQuIElzbid0IHRo
ZXJlIGEgY29tbW9uIHBhdHRlcm4gZm9yIHRoaXMgaW4gdGhlIHBhbmVsIGRyaXZlcnM/Ckkgd291
bGQgYXNzdW1lIHRoYXQgZXZlcnlvbmUgd291bGQgaGF2ZSB0byBkbyBtb3JlIG9yIGxlc3MgdGhl
IHNhbWUgb24KZHJpdmVyIHVuYmluZC4KCk5vcmFsZi4KCj4gCVNhbQo+IAo+IAo+PiArCX0gZWxz
ZSB7Cj4+ICsJCWRybV9kZXZfdW5wbHVnKCZpbGktPmRiaWRldi5kcm0pOwo+PiArCQlkcm1fYXRv
bWljX2hlbHBlcl9zaHV0ZG93bigmaWxpLT5kYmlkZXYuZHJtKTsKPj4gKwl9Cj4+ICAKPj4gIAly
ZXR1cm4gMDsKPj4gIH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
