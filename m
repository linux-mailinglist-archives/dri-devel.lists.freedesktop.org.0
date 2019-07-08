Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516962788
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 19:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAFF88784;
	Mon,  8 Jul 2019 17:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986C88784
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 17:50:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6F4BD80636;
 Mon,  8 Jul 2019 19:50:09 +0200 (CEST)
Date: Mon, 8 Jul 2019 19:50:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Message-ID: <20190708175007.GA3511@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <CAD=FV=V_wTD1xpkXRe-z2HsZ8QXKq7jmq8CsfhMnFxi-5XDJjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V_wTD1xpkXRe-z2HsZ8QXKq7jmq8CsfhMnFxi-5XDJjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=AWgJsaMlI6ysr0MxQJMA:9 a=0846P8UFn4bgp1PN:21 a=puqGkp3IltQWEqwz:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2guCgpPbiBNb24sIEp1bCAwMSwgMjAxOSBhdCAwOTozOToyNEFNIC0wNzAwLCBEb3Vn
IEFuZGVyc29uIHdyb3RlOgo+IEhpLAo+IAo+IE9uIFN1biwgSnVuIDMwLCAyMDE5IGF0IDE6MjIg
UE0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+Cj4gPiA+IEBAIC05
MSw2ICs5Miw4IEBAIHN0cnVjdCBwYW5lbF9zaW1wbGUgewo+ID4gPiAgICAgICBzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmRkYzsKPiA+ID4KPiA+ID4gICAgICAgc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxl
X2dwaW87Cj4gPiA+ICsKPiA+ID4gKyAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgb3ZlcnJp
ZGVfbW9kZTsKPiA+IEkgZmFpbCB0byBzZWUgd2hlcmUgdGhpcyBwb2l0ZXIgaXMgYXNzaWduZWQu
Cj4gCj4gSW4gcGFuZWxfc2ltcGxlX3BhcnNlX292ZXJyaWRlX21vZGUoKS4gIFNwZWNpZmljYWxs
eToKPiAKPiBkcm1fZGlzcGxheV9tb2RlX2Zyb21fdmlkZW9tb2RlKCZ2bSwgJnBhbmVsLT5vdmVy
cmlkZV9tb2RlKTsKClRoZSBhYm92ZSBjb2RlLXNuaXBwZXQgaXMgb25seSBjYWxsZWQgaW4gdGhl
IHBhbmVsIGhhcyBzcGVjaWZpZWQgZGlzcGxheQp0aW1pbmdzIHVzaW5nIGRpc3BsYXlfdGltaW5n
cyAtIGl0IGlzIG5vdCBjYWxsZWQgd2hlbiBkaXNwbGF5X21vZGUgaXMKdXNlZC4KU28gb3ZlcnJp
ZGVfbW9kZSBpcyBvbmx5IGFzc2lnbmVkIGluIHNvbWUgY2FzZXMgYW5kIG5vdCBhbGwgY2FzZXMu
ClRoaXMgbmVlZHMgdG8gYmUgZml4ZWQgc28gd2UgZG8gbm90IHJlZmVyZW5jZSBvdmVycmlkZV9t
b2RlIHVubGVzcwppdCBpcyBzZXQuCgo+IAo+IAo+ID4gQEAgLTE1Miw2ICsxNjIsNDQgQEAgc3Rh
dGljIGludCBwYW5lbF9zaW1wbGVfZ2V0X2ZpeGVkX21vZGVzKHN0cnVjdCBwYW5lbF9zaW1wbGUg
KnBhbmVsKQo+ID4gPiAgICAgICAgICAgICAgIG51bSsrOwo+ID4gPiAgICAgICB9Cj4gPiA+Cj4g
PiA+ICsgICAgIHJldHVybiBudW07Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQg
cGFuZWxfc2ltcGxlX2dldF9ub25fZWRpZF9tb2RlcyhzdHJ1Y3QgcGFuZWxfc2ltcGxlICpwYW5l
bCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9
IHBhbmVsLT5iYXNlLmNvbm5lY3RvcjsKPiA+ID4gKyAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRy
bSA9IHBhbmVsLT5iYXNlLmRybTsKPiA+ID4gKyAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGU7Cj4gPiA+ICsgICAgIGJvb2wgaGFzX292ZXJyaWRlID0gcGFuZWwtPm92ZXJyaWRlX21v
ZGUudHlwZTsKPiA+IFRoaXMgbG9va3Mgc3VzcGljaW91cy4KPiA+IHBhbmVsLT5vdmVycmlkZV9t
b2RlLnR5cGUgaXMgYW4gdW5zaWduZWQgaW50IHRoYXQgbWF5IGhhdmUgYSBudW1iZXIgb2YKPiA+
IGJpdHMgc2V0Lgo+ID4gU28gdGhlIGFib3ZlIGNvZGUgaW1wbGljaXRseSBjb252ZXJ0IGEgLnR5
cGUgIT0gMCB0byBhIHRydWUuCj4gPiBUaGlzIGNhbiBiZSBleHByZXNzZWQgaW4gYSBtdWNoIG1v
cmUgcmVhZGVyIGZyaWVuZGx5IHdheS4KPiAKPiBZb3Ugd291bGQgc3VnZ2VzdCB0aGF0IEkgYWRk
IGEgYm9vbGVhbiBmaWVsZCB0byBhIHN0cnVjdHVyZSB0bwo+IGluZGljYXRlIHdoZXRoZXIgYW4g
b3ZlcnJpZGUgbW9kZSBpcyBwcmVzZW50PwpBIHNpbXBsZSAgYm9vbCBoYXNfb3ZlcnJpZGUgPSBw
YW5lbC0+b3ZlcnJpZGVfbW9kZS50eXBlICE9IDA7CndvdWxkIGRvIHRoZSB0cmljayBoZXJlLgpU
aGVuIHRoZXJlIGlzIG5vIGhpZGRlbiBjb252ZXJzaW9uIGZyb20gaW50IHRvIGEgYm9vbC4KCkJ1
dCBhcyBvdmVycmlkZV9tb2RlIGNhbiBiZSBOVUxMIHNvbWV0aGluZyBtb3JlIG5lZWRzIHRvIGJl
IGRvbmUuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
