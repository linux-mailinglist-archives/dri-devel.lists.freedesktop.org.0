Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6E7C514
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 16:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FF789F1B;
	Wed, 31 Jul 2019 14:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8E89F06
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 14:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 89F4DFB03;
 Wed, 31 Jul 2019 16:38:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBq773RmK5ZN; Wed, 31 Jul 2019 16:38:44 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5CE5F46D8A; Wed, 31 Jul 2019 16:38:44 +0200 (CEST)
Date: Wed, 31 Jul 2019 16:38:44 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Message-ID: <20190731143844.GC1935@bogon.m.sigxcpu.org>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
 <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
 <20190727020444.GC4902@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190727020444.GC4902@pendragon.ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Chris Healy <cphealy@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFNhdCwgSnVsIDI3LCAyMDE5IGF0IDA1OjA0OjQ0QU0gKzAzMDAsIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDU6MDE6
NTJQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiA+IEhpIEd1aWRvLAo+ID4gCj4gPiBU
aGFua3MgZm9yIHlvdXIgd29yayBvbiB0aGlzIGRyaXZlciEKPiA+IAo+ID4gT24gV2VkLCBKdWwg
MjQsIDIwMTkgYXQgMTI6NTIgUE0gR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3Jv
dGU6Cj4gPiAKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2lteC1ud2wvS2NvbmZpZwo+ID4gPiBAQCAtMCwwICsxLDE1IEBACj4gPiA+ICtjb25m
aWcgRFJNX0lNWF9OV0xfRFNJCj4gPiA+ICsgICAgICAgdHJpc3RhdGUgIlN1cHBvcnQgZm9yIE5v
cnRod2VzdCBMb2dpYyBNSVBJIERTSSBIb3N0IGNvbnRyb2xsZXIiCj4gPiA+ICsgICAgICAgZGVw
ZW5kcyBvbiBEUk0gJiYgKEFSQ0hfTVhDIHx8IEFSQ0hfTVVMVElQTEFURk9STSB8fCBDT01QSUxF
X1RFU1QpCj4gPiAKPiA+IFRoaXMgSVAgY291bGQgcG90ZW50aWFsbHkgYmUgZm91bmQgb24gb3Ro
ZXIgU29Dcywgc28gbm8gbmVlZCB0byBtYWtlCj4gPiBpdCBkZXBlbmQgb24gQVJDSF9NWEMuCj4g
Cj4gSSdkIGdvIGV2ZW4gZnVydGhlciBhbmQgbm90IHVzZSB0aGUgcHJlZml4IGlteCBpbiB0aGUg
ZHJpdmVyIG5hbWUgb3IKPiBhbnl3aGVyZSBpbiB0aGUgY29kZS4KCk15IGlkZWEgd2FzIHRvIGRv
IHRoYXQgd2hlbiBhbm90aGVyIHBvc3NpYmxlIHVzZXIgY29tZXMgdXAgdG8gc2VlIHdoYXQKY2Fu
IGJlIHNoYXJlZCBidXQgSSBjYW4gZG8gdGhhdCBmb3IgdjIuCkNoZWVycywKIC0tIEd1aWRvCgo+
IAo+IFtzbmlwXQo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
