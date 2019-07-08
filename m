Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED271627C4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 19:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025AF89FE8;
	Mon,  8 Jul 2019 17:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322C889FE8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 17:56:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B2E35803AA;
 Mon,  8 Jul 2019 19:56:07 +0200 (CEST)
Date: Mon, 8 Jul 2019 19:56:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Message-ID: <20190708175606.GB3511@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <20190630205514.GA17046@ravnborg.org>
 <CAD=FV=WH4kmhQA0kbKcAUx=oOeqTZiQOFCXYpVWwq+mG7Y7ofA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WH4kmhQA0kbKcAUx=oOeqTZiQOFCXYpVWwq+mG7Y7ofA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=LBenJKLw8faiQqQJsPgA:9 a=IF-Cv_vKzCxN9PTp:21 a=nRygc59OdNG9nXZ-:21
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
Cc: devicetree@vger.kernel.org,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDk6Mzk6MDZBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAxOjU1IFBNIFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgRG91Z2xhcy4KPiA+Cj4g
PiA+ID4gKwo+ID4gPiA+ICsgICAvKiBPbmx5IGFkZCB0aW1pbmdzIGlmIG92ZXJyaWRlIHdhcyBu
b3QgdGhlcmUgb3IgZmFpbGVkIHRvIHZhbGlkYXRlICovCj4gPiA+ID4gKyAgIGlmIChudW0gPT0g
MCAmJiBwYW5lbC0+ZGVzYy0+bnVtX3RpbWluZ3MpCj4gPiA+ID4gKyAgICAgICAgICAgbnVtID0g
cGFuZWxfc2ltcGxlX2dldF90aW1pbmdzX21vZGVzKHBhbmVsKTsKPiA+ID4gPiArCj4gPiA+ID4g
KyAgIC8qCj4gPiA+ID4gKyAgICAqIE9ubHkgYWRkIGZpeGVkIG1vZGVzIGlmIHRpbWluZ3Mvb3Zl
cnJpZGUgYWRkZWQgbm8gbW9kZS4KPiA+ID4KPiA+ID4gVGhpcyBwYXJ0IEkgZmFpbCB0byB1bmRl
cnN0YW5kLgo+ID4gPiBJZiB3ZSBoYXZlIGEgcGFuZWwgd2hlcmUgd2UgaW4gcGFuZWwtc2ltcGxl
IGhhdmUgc3BlY2lmaWVkIHRoZSB0aW1pbmdzLAo+ID4gPiBhbmQgZG9uZSBzbyB1c2luZyBkaXNw
bGF5X3RpbWluZyBzbyB3aXRoIHByb3BlciB7bWluLCB0eXAsIG1heH0gdGhlbiBpdAo+ID4gPiBz
aG91bGQgYmUgcGVyZmVjdGx5IGxlZ2FsIHRvIHNwZWNpZnkgYSBtb3JlIHByZWNpc2UgdmFyaWFu
dCBpbiB0aGUgRFQKPiA+ID4gZmlsZS4KPiA+ID4gT3Igd2hhdCBkaWQgSSBtaXNzIGhlcmU/Cj4g
Pgo+ID4gR290IGl0IG5vdy4KPiA+IElmIGRpc3BsYXlfbW9kZSBpcyB1c2VkIGZvciB0aW1pbmdz
IHRoaXMgaXMgd2hhdCB5b3UgY2FsbCAiZml4ZWQgbW9kZSIuCj4gPiBIbW0sIGlmIEkgZ290IGNv
bmZ1c2VkIHNvbWVvbmUgZWxzZSBtYXkgYWxzbyBiZSBjb25mdXNlZCBieSB0aGlzIG5hbWluZy4K
PiAKPiBUaGUgbmFtZSAiZml4ZWQgbW9kZSIgY29tZXMgZnJvbSB0aGUgb2xkIGNvZGUsIHRob3Vn
aCBJIGd1ZXNzIGluIHRoZQo+IG9sZCBjb2RlIGl0IHVzZWQgdG8gcmVmZXIgdG8gYSBtb2RlIHRo
YXQgY2FtZSBmcm9tIGVpdGhlciB0aGUKPiBkaXNwbGF5X3RpbWluZyBvciB0aGUgZGlzcGxheV9t
b2RlLgo+IAo+IEhvdyBhYm91dCBpZiBJIGNhbGwgaXQgInBhbmVsX3NpbXBsZV9nZXRfZnJvbV9m
aXhlZF9kaXNwbGF5X21vZGUiPwo+IC4uLm9yIGlmIHlvdSBoYXZlIGFub3RoZXIgc3VnZ2VzdGlv
biBmZWVsIGZyZWUgdG8gY2hpbWUgaW4uCldoYXQgd2UgcmVhbGx5IHdhbnQgdG8gZGlzdGluZ3Vz
aCBoZXJlIGlzIHRoZSB1c2Ugb2YgZGlzcGxheV9tb2RlCmFuZCBkaXNwbGF5X3RpbWluZ3MgKGlm
IEkgZ290IHRoZSBuYW1lcyByaWdodCkuClRoYXQgZGlzcGxheV9tb2RlIHNwZWNpZnkgYSBmaXhl
ZCB0aW1pbmcgYW5kIGRpc3BsYXlfdGltaW5nIHNwZWNpZnkKYSB2YWxpZCByYW5nZSBpcyBzb21l
dGhpbmcgaW4gdGhlIHNlbWFudGljcyBvZiB0aGUgdHdvIHR5cGVzLgpTbyBuYW1pbmcgdGhhdCBy
ZWZlciB0byBkaXNwbGF5X21vZGUgdmVyc3VzIGRpc3BsYXlfdGltaW5nIHdpbGwgbWFrZSB0aGUK
Y29kZSBzaW1wbGVyIHRvIHVuZGVyc3RhbmQuIGFuZCB0aGVuIGEgbmljZSBjb21tZW50IHRoYXQg
d2hlbgpkaXNwbGF5X21vZGUKaXMgdXNlZCBvbmUgbG9vc2VzIHRoZSBwb3NzaWJpbGl0eSB0byB1
c2Ugb3ZlcnJpZGVfbW9kZS4KVGhhdCB3b3VsZCBiZSBmaW5lIHRvIGhhdmUgaW4gdGhlIHN0cnVj
dCBpbiB0aGUgZHJpdmVyLgoKPiBOT1RFOiBTaW5jZSB0aGlzIGZlZWRiYWNrIGlzIG1pbm9yIGFu
ZCB0aGlzIHBhdGNoIGhhcyBiZWVuIG91dHN0YW5kaW5nCj4gZm9yIGEgd2hpbGUgKGFuZCBpcyBi
bG9ja2luZyBvdGhlciB3b3JrKSwgSSBhbSBhc3N1bWluZyB0aGF0IHRoZSBiZXN0Cj4gcGF0aCBm
b3J3YXJkIGlzIGZvciBIZWlrbyB0byBsYW5kIHRoaXMgcGF0Y2ggd2l0aCBUaGllcnJ5J3MgQWNr
IGFuZAo+IEknbGwgc2VuZCBhIGZvbGxvdy11cC4gIFBsZWFzZSB5ZWxsIGlmIHlvdSBkaXNhZ3Jl
ZS4KTGV0J3MgZ2l2ZSB0aGUgcGF0Y2hlcyBhIHNwaW4gbW9yZSBhcyB3ZSBoYXZlIHBhc3NlZCB0
aGUgcG9zc2liaWxpdHkgZm9yCnRoZSBjdXJyZW50IG1lcmdlIHdpbmRvdy4KCkkgYW0gb24gdmFj
YXRpb24gYXQgdGhlIG1vbWVudCBhbmQgdGh1cyBzbG93IGluIHJlc3BvbnNlcywgYnV0IHdpbGwg
YmUgYmFjawphdCB0aGUgaG9tZSBvZmZpY2UgbmV4dCB3ZWVrIGFuZCB3aWxsIGJlIG1vcmUgcmVz
cG9uc2l2ZSBhZ2Fpbi4KCglTYW0gLSB3aG8gaXMgZW5qb3lpbmcgdGhlIGFscHMgaW4gQXVzdHJp
YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
