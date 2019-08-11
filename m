Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5A892DB
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 19:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D756E38D;
	Sun, 11 Aug 2019 17:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893A26E38D
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 17:26:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C30F8803D7;
 Sun, 11 Aug 2019 19:26:39 +0200 (CEST)
Date: Sun, 11 Aug 2019 19:26:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 4/9] drm/panel: Add driver for the LG Philips LB035Q02
 panel
Message-ID: <20190811172638.GA20098@ravnborg.org>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
 <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
 <20190811164951.GD14660@ravnborg.org>
 <19674e30-bbc2-6cc7-856f-7488d7173dc6@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19674e30-bbc2-6cc7-856f-7488d7173dc6@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gAmX6pxEAAAA:20
 a=piO9MEFAxXpwmuVq71kA:9 a=CjuIK1q_8ugA:10 a=443qOekVpzXbzkAZ2tlV:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKPiA+Pj4gKwkvKiByZWdpc3RlciB2YWx1ZSAqLwo+ID4+PiArCWJ1ZmZlcls0
XSA9IDB4NzI7Cj4gPj4+ICsJYnVmZmVyWzVdID0gdmFsID4+IDg7Cj4gPj4+ICsJYnVmZmVyWzZd
ID0gdmFsOwo+ID4+PiArCXZhbHVlX3hmZXIudHhfYnVmID0gYnVmZmVyICsgNDsKPiA+Pj4gKwlz
cGlfbWVzc2FnZV9hZGRfdGFpbCgmdmFsdWVfeGZlciwgJm1zZyk7Cj4gPj4+ICsKPiA+Pj4gKwly
ZXR1cm4gc3BpX3N5bmMobGNkLT5zcGksICZtc2cpOwo+ID4+PiArfQo+ID4+Cj4gPj4gSnVzdCBh
IG5vdGUgdG8gU2FtOgo+ID4+IFRoaXMgaXMgdGhlIHNhbWUgc3BpIHByb3RvY29sIHRoYXQgdGhl
IGlsaTkzMjUgY29udHJvbGxlciBvbiB0aGUgaHkyOGIKPiA+PiBwYW5lbCB1c2VzLgo+ID4+Cj4g
Pj4gSSByZW1lbWJlcmVkIHRoYXQgSSBoYXZlIGV4cGVyaW1lbnRlZCB3aXRoIGEgcmVnbWFwIGlt
cGxlbWVudGF0aW9uOgo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ub3Ryby90aW55ZHJtL2Jsb2Iv
bWFzdGVyL3Rpbnlkcm0taWxpOTMyNS5jI0wxOTEKPiA+IAo+ID4gcmVnbWFwIHNlZW1zIGEgdG9v
IGxpbWl0ZWQgaW50ZXJmYWNlIHRvIHVzZSB3aGVuIHRyeWluZyB0byBnZW5lcmFsaXplCj4gPiB0
aGlzLgo+ID4gV2Ugc2hvdWxkIHJhdGhlciBnbyBmb3IgYSBpbGktbGliIG9yIHNvbWV0aGluZyB0
aGF0IGNhbiBiZSB1c2VkIGluIGFsbAo+ID4gdGhlIHByZXNlbnQgYW5kIGZ1dHVyZSBpbGkgYmFz
ZWQgZHJpdmVycy4KPiA+IE9idmlvdXNseSBpdCBkZXBlbmRzIG9uIGhvdyBzaW1pbGFyIHRoZSBp
bGkgYmFzZWQgY2hpcHMgYXJlLgo+ID4gCj4gPiBJIGRpZCBhIHF1aWNrIGxvb2sgYW5kIHRoaXMg
ZHJpdmVyIGRpZCBub3QgbWF0Y2ggdGhlIGlsaTkzMjUgZGF0YXNoZWV0Cj4gPiBhcyBkaWZmZXJl
bnQgYml0cyB3YXMgYXJlIGluIHJlZ2lzdGVyIDB4MS4KPiA+IFNvIGl0IHNtZWVscyBsaWtlIGFu
b3RoZXIsIHNpbWlsYXIuIGlsaSB2YXJhaW50Lgo+ID4gCj4gPiBTbyBmb3IgdGhpcyBkcml2ZXIg
d2Ugd291bGQganVzdCB1c2UgdGhlIGhhcmRjb2RlZCB2YXJhaW50IGFscmVhZHkKPiA+IHByZXNl
bnQuIFRoZW4gd2UgbWF5IHJlLXZpc2l0IGlsaS1saWIgaWRlYSBsYXRlciBpZiB3ZSBzZWUgdG9v
IG11Y2gKPiA+IHNpbWlsYXIgY29kZS4KPiA+IFRoaXMgaXMgYXMgSSBzZWUgaXQgZm9yIG5vdy4u
Lgo+ID4gCj4gCj4gWWVhaCwgbm8gcG9pbnQgaW4gY2hhbmdpbmcgdGhpcyBkcml2ZXIgdW50aWwg
dGhlcmUgYXJlIG1vcmUgc2ltaWxhcgo+IGNvbnRyb2xsZXJzLiBKdXN0IHdhbnRlZCB0byBwb2lu
dCBvdXQgdGhhdCB0aGUgaHkyOGIgcGFuZWwgeW91IG9yZGVyZWQKPiB1c2VzIHRoZSBzYW1lIHBy
b3RvY29sLgpPaGgsIHRoYXQgd2FzIHlvdXIgcG9pbnQuIFRoYW5rcyEKClRoZSBkaXNwbGF5IGlz
IHN0aWxsIGluIHRoZSBtYWlsIHNvbWV3aGVyZSBmcm9tIENoaW5hLi4KUmlnaHQgbm93IEkgZG8g
bm90IGhhdmUgdGltZSB0byBoYWNrIG9uIGl0IHNvIG5vdCBhIGJpZyBkZWFsLgoKRm9yIHRoZSBm
dW4gb2YgaXQgSSBvcmRyZWQgYSBmZXcgb3RoZXIgZGlzcGxheXMuIE9uZSB3YXMgc3NkMTMwNiBi
YXNlZCwKYW5kIGRvIG5vdCByZWNhbGwgdGhlIHJlc3QuCgoJU2FtCgo+IAo+IEEgd2ViIHNlYXJj
aCBoZWxwZWQgbXkgbWVtb3J5LCB0aGVzZSAzIHN1cHBvcnRlZCBieSBzdGFnaW5nL2ZidGZ0IHVz
ZSBhCj4gc3RhcnRieXRlOiBpbGk5MzIwLCBpbGk5MzI1IGFuZCBoeDgzNDdkLiBUaGUgaWxpIGNo
aXBzIGFyZSBhbG1vc3QKPiBpZGVudGljYWwuIFRoZSBzZWFyY2ggcmV2ZWFsZWQgbWFueSBtb3Jl
IGluY2x1ZGluZzoKPiBzdDc3OTMsIHN0Nzc4MXIsIFM2RTYzRDYsICttYW55IGlsaXRlay4KPiAK
PiBOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
