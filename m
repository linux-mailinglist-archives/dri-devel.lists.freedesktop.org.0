Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8D892B0
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 18:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F756E388;
	Sun, 11 Aug 2019 16:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06466E388
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 16:49:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F287780401;
 Sun, 11 Aug 2019 18:49:52 +0200 (CEST)
Date: Sun, 11 Aug 2019 18:49:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 4/9] drm/panel: Add driver for the LG Philips LB035Q02
 panel
Message-ID: <20190811164951.GD14660@ravnborg.org>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
 <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gAmX6pxEAAAA:20
 a=fIYh8Zh26alMZ8JqSOoA:9 a=CjuIK1q_8ugA:10 a=443qOekVpzXbzkAZ2tlV:22
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

SGkgTm9yYWxmLgoKPiA+ICtzdGF0aWMgaW50IGxiMDM1cTAyX3dyaXRlKHN0cnVjdCBsYjAzNXEw
Ml9kZXZpY2UgKmxjZCwgdTE2IHJlZywgdTE2IHZhbCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBzcGlf
bWVzc2FnZSBtc2c7Cj4gPiArCXN0cnVjdCBzcGlfdHJhbnNmZXIgaW5kZXhfeGZlciA9IHsKPiA+
ICsJCS5sZW4JCT0gMywKPiA+ICsJCS5jc19jaGFuZ2UJPSAxLAo+ID4gKwl9Owo+ID4gKwlzdHJ1
Y3Qgc3BpX3RyYW5zZmVyIHZhbHVlX3hmZXIgPSB7Cj4gPiArCQkubGVuCQk9IDMsCj4gPiArCX07
Cj4gPiArCXU4CWJ1ZmZlclsxNl07Cj4gPiArCj4gPiArCXNwaV9tZXNzYWdlX2luaXQoJm1zZyk7
Cj4gPiArCj4gPiArCS8qIHJlZ2lzdGVyIGluZGV4ICovCj4gPiArCWJ1ZmZlclswXSA9IDB4NzA7
Cj4gPiArCWJ1ZmZlclsxXSA9IDB4MDA7Cj4gPiArCWJ1ZmZlclsyXSA9IHJlZyAmIDB4N2Y7Cj4g
PiArCWluZGV4X3hmZXIudHhfYnVmID0gYnVmZmVyOwo+ID4gKwlzcGlfbWVzc2FnZV9hZGRfdGFp
bCgmaW5kZXhfeGZlciwgJm1zZyk7Cj4gPiArCj4gPiArCS8qIHJlZ2lzdGVyIHZhbHVlICovCj4g
PiArCWJ1ZmZlcls0XSA9IDB4NzI7Cj4gPiArCWJ1ZmZlcls1XSA9IHZhbCA+PiA4Owo+ID4gKwli
dWZmZXJbNl0gPSB2YWw7Cj4gPiArCXZhbHVlX3hmZXIudHhfYnVmID0gYnVmZmVyICsgNDsKPiA+
ICsJc3BpX21lc3NhZ2VfYWRkX3RhaWwoJnZhbHVlX3hmZXIsICZtc2cpOwo+ID4gKwo+ID4gKwly
ZXR1cm4gc3BpX3N5bmMobGNkLT5zcGksICZtc2cpOwo+ID4gK30KPiAKPiBKdXN0IGEgbm90ZSB0
byBTYW06Cj4gVGhpcyBpcyB0aGUgc2FtZSBzcGkgcHJvdG9jb2wgdGhhdCB0aGUgaWxpOTMyNSBj
b250cm9sbGVyIG9uIHRoZSBoeTI4Ygo+IHBhbmVsIHVzZXMuCj4gCj4gSSByZW1lbWJlcmVkIHRo
YXQgSSBoYXZlIGV4cGVyaW1lbnRlZCB3aXRoIGEgcmVnbWFwIGltcGxlbWVudGF0aW9uOgo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9ub3Ryby90aW55ZHJtL2Jsb2IvbWFzdGVyL3Rpbnlkcm0taWxpOTMy
NS5jI0wxOTEKCnJlZ21hcCBzZWVtcyBhIHRvbyBsaW1pdGVkIGludGVyZmFjZSB0byB1c2Ugd2hl
biB0cnlpbmcgdG8gZ2VuZXJhbGl6ZQp0aGlzLgpXZSBzaG91bGQgcmF0aGVyIGdvIGZvciBhIGls
aS1saWIgb3Igc29tZXRoaW5nIHRoYXQgY2FuIGJlIHVzZWQgaW4gYWxsCnRoZSBwcmVzZW50IGFu
ZCBmdXR1cmUgaWxpIGJhc2VkIGRyaXZlcnMuCk9idmlvdXNseSBpdCBkZXBlbmRzIG9uIGhvdyBz
aW1pbGFyIHRoZSBpbGkgYmFzZWQgY2hpcHMgYXJlLgoKSSBkaWQgYSBxdWljayBsb29rIGFuZCB0
aGlzIGRyaXZlciBkaWQgbm90IG1hdGNoIHRoZSBpbGk5MzI1IGRhdGFzaGVldAphcyBkaWZmZXJl
bnQgYml0cyB3YXMgYXJlIGluIHJlZ2lzdGVyIDB4MS4KU28gaXQgc21lZWxzIGxpa2UgYW5vdGhl
ciwgc2ltaWxhci4gaWxpIHZhcmFpbnQuCgpTbyBmb3IgdGhpcyBkcml2ZXIgd2Ugd291bGQganVz
dCB1c2UgdGhlIGhhcmRjb2RlZCB2YXJhaW50IGFscmVhZHkKcHJlc2VudC4gVGhlbiB3ZSBtYXkg
cmUtdmlzaXQgaWxpLWxpYiBpZGVhIGxhdGVyIGlmIHdlIHNlZSB0b28gbXVjaApzaW1pbGFyIGNv
ZGUuClRoaXMgaXMgYXMgSSBzZWUgaXQgZm9yIG5vdy4uLgoKCVNhbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
