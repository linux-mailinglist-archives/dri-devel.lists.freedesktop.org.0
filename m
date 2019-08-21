Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824898199
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 19:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231F6E981;
	Wed, 21 Aug 2019 17:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E969A6E981
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 65FA6FB03;
 Wed, 21 Aug 2019 19:42:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-xhcMPhWSrc; Wed, 21 Aug 2019 19:42:08 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 50A8642A70; Wed, 21 Aug 2019 19:42:08 +0200 (CEST)
Date: Wed, 21 Aug 2019 19:42:08 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
Message-ID: <20190821174208.GA9486@bogon.m.sigxcpu.org>
References: <cover.1565367567.git.agx@sigxcpu.org>
 <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
 <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
 <20190813101057.GB10751@bogon.m.sigxcpu.org>
 <CAK8P3a1q9G8VKgNKh+6khzoW3bFTVR_Zorygy=Qqsq-PYzM4=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1q9G8VKgNKh+6khzoW3bFTVR_Zorygy=Qqsq-PYzM4=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDAxOjA3OjUyUE0gKzAyMDAsIEFybmQgQmVyZ21h
bm4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTI6MTAgUE0gR3VpZG8gR8O8bnRo
ZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAx
MDowODo0NEFNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiBPbiBGcmksIEF1ZyA5
LCAyMDE5IGF0IDY6MjQgUE0gR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIGFkZHMgYWxsIHRoZSBncHIgcmVnaXN0ZXJzIGFuZCB0aGUg
ZGVmaW5lIG5lZWRlZCBmb3Igc2VsZWN0aW5nCj4gPiA+ID4gdGhlIGlucHV0IHNvdXJjZSBpbiB0
aGUgaW14LW53bCBkcm0gYnJpZGdlLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3Vp
ZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUg
SU9NVVhDX0dQUjAgICAgMHgwMAo+ID4gPiA+ICsjZGVmaW5lIElPTVVYQ19HUFIxICAgIDB4MDQK
PiA+ID4gPiArI2RlZmluZSBJT01VWENfR1BSMiAgICAweDA4Cj4gPiA+ID4gKyNkZWZpbmUgSU9N
VVhDX0dQUjMgICAgMHgwYwo+ID4gPiA+ICsjZGVmaW5lIElPTVVYQ19HUFI0ICAgIDB4MTAKPiA+
ID4gPiArI2RlZmluZSBJT01VWENfR1BSNSAgICAweDE0Cj4gPiA+ID4gKyNkZWZpbmUgSU9NVVhD
X0dQUjYgICAgMHgxOAo+ID4gPiA+ICsjZGVmaW5lIElPTVVYQ19HUFI3ICAgIDB4MWMKPiA+ID4g
KG1vcmUgb2YgdGhlIHNhbWUpCj4gPiA+Cj4gPiA+IGh1aD8KPiA+Cj4gPiBUaGVzZSBhcmUgdGhl
IG5hbWVzIGZyb20gdGhlIGlteDhNUSByZWZlcmVuY2UgbWFudWFsIChnZW5lcmFsIHB1cnBvc2UK
PiA+IHJlZ2lzdGVycywgdGhleSBsdW1wIHRvZ2V0aGVyIGFsbCBzb3J0cyBvZiB0aGluZ3MpLCBp
dCdzIHRoZSBzYW1lIG9uCj4gPiBpbXg2L2lteDcpOgo+ID4KPiA+ICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9pbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdwci5oCj4gPiAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDctaW9tdXhjLWdwci5oCj4g
Pgo+ID4gPiA+ICsvKiBpLk1YOE1xIGlvbXV4IGdwciByZWdpc3RlciBmaWVsZCBkZWZpbmVzICov
Cj4gPiA+ID4gKyNkZWZpbmUgSU1YOE1RX0dQUjEzX01JUElfTVVYX1NFTCAgICAgICAgICAgICAg
QklUKDIpCj4gPiA+Cj4gPiA+IEkgdGhpbmsgdGhpcyBkZWZpbmUgc2hvdWxkIHByb2JhYmx5IGJl
IGxvY2FsIHRvIHRoZSBwaW5jdHJsIGRyaXZlciwgdG8KPiA+ID4gZW5zdXJlIHRoYXQgbm8gb3Ro
ZXIgZHJpdmVycyBmaWRkbGUgd2l0aCB0aGUgcmVnaXN0ZXJzIG1hbnVhbGx5Lgo+ID4KPiA+IFRo
ZSBwdXJwb3NlIG9mIHRoZXNlIGJpdHMgaXMgZm9yIGEgZHJpdmVyIHRvIGZpZGRsZSB3aXRoIHRo
ZW0gdG8gc2VsZWN0Cj4gPiB0aGUgaW5wdXQgc291cmNlLiBTaW1pbGFyIG9uIGlteDcgaXQncyBh
bHJlYWR5IHVzZWQgZm9yIGUuZy4gdGhlIHBoeQo+ID4gcmVmY2xrIGluIHRoZSBwY2kgY29udHJv
bGxlcjoKPiA+Cj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWlteDYuYyNuNjM4Cj4gCj4gVGhhdCBvbmUgc2hvdWxkIGxpa2VseSB1c2UgZWl0aGVy
IHRoZSBjbGsgaW50ZXJmYWNlIG9yIHRoZSBwaHkKPiBpbnRlcmZhY2UgaW5zdGVhZC4KPiAKPiA+
IFRoZSBHUFJzIGFyZSBub3QgYWJvdXQgcGFkIGNvbmZpZ3VyYXRpb24gYnV0IGdhdGhlciBhbGwg
c29ydHMgb2YgdGhpbmdzCj4gPiAoc2VjdGlvbiA4LjIuNCBvZiB0aGUgaW14OG1xIHJlZmVyZW5j
ZSBtYW51YWwpOiBwY2llIHNldHVwLCBkc2kgcmVsYXRlZAo+ID4gYml0cyBzbyBJIGRvbid0IHRo
aW5rIHRoaXMgc2hvdWxkIGJlIGRvbmUgdmlhIGEgcGluY3RybAo+ID4gZHJpdmVyLiBTaG91bGQg
d2UgaGFuZGxlIHRoYXQgZGlmZmVyZW50bHkgdGhhbiBvbiBpbXg2Lzc/Cj4gCj4gSXQgd291bGQg
YmUgbmljZSB0byBmaXggdGhlIGV4aXN0aW5nIGNvZGUgYXMgd2VsbCwgYnV0IGZvciB0aGUgbW9t
ZW50LAo+IEkgb25seSB0aGluayB3ZSBzaG91bGQgbm90IGFkZCBtb3JlIG9mIHRoYXQuCj4gCj4g
R2VuZXJhbGx5IHNwZWFraW5nLCB3ZSBjYW4gdXNlIHN5c2NvbiB0byBkbyByYW5kb20gdGhpbmdz
IHRoYXQgZG9uJ3QKPiBoYXZlIGEgc3Vic3lzdGVtIG9mIHRoZWlyIG93biwgYnV0IHdlIHNob3Vs
ZCBub3QgdXNlIGl0IHRvIGRvIHRoaW5ncwo+IHRoYXQgaGF2ZSBhbiBleGlzdGluZyBkcml2ZXIg
ZnJhbWV3b3JrIGxpa2UgcGluY3RybCwgY2xvY2ssIHJlc2V0LCBwaHkKPiBldGMuCgpTaW5jZSBp
dCdzIG5vdCBhbiBleHRlcm5hbCBwaW4gaSBvcHRlZCB0byB1c2UgTVVYX01NSU8gaW5zdGVhZCB3
aGljaApzZWVtcyBsaWtlIGEgZ29vZCBmaXQgaGVyZS4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2U/CkNo
ZWVycywKIC0tIEd1aWRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
