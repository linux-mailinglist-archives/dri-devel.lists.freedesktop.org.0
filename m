Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E700245A35
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 02:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE1A89D52;
	Mon, 17 Aug 2020 00:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2367C89D52
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 00:09:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3BA6F9;
 Mon, 17 Aug 2020 02:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597622963;
 bh=0DixlhBTmdxj8HBI+2zbq1LpGmNVk/QcrtOPxI8AWFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZevMh0c0dITM3LShxTFexCYRkfoZtdr0lEwEUM5vy0ipgtGdAQa191F83HX/KTtFP
 MHdKiIiwMdbo8wAGMN/syGo46kKPZ0xvp+gc2M6xYelLOTl/UcPJNznZjA3x+NPsRp
 SqC6QGgMacHEvI/X8Ql7RbC88ZceKTB8FIcpIEz0=
Date: Mon, 17 Aug 2020 03:09:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200817000908.GD7729@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
 <20200815212838.GC134339@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815212838.GC134339@bogon.m.sigxcpu.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpPbiBTYXQsIEF1ZyAxNSwgMjAyMCBhdCAxMToyODozOFBNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwNDoyOTowNUFNICsw
MzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gV2hlbiB0aGUgUENCIHJvdXRlcyB0aGUg
ZGlzcGxheSBkYXRhIHNpZ25hbHMgaW4gYW4gdW5jb252ZW50aW9uYWwgd2F5LAo+ID4gdGhlIG91
dHB1dCBidXMgd2lkdGggbWF5IGRpZmZlciBmcm9tIHRoZSBidXMgd2lkdGggb2YgdGhlIGNvbm5l
Y3RlZAo+ID4gcGFuZWwgb3IgZW5jb2Rlci4gRm9yIGluc3RhbmNlLCB3aGVuIGEgMTgtYml0IFJH
QiBwYW5lbCBoYXMgaXRzIFJbNTowXSwKPiA+IEdbNTowXSBhbmQgQls1OjBdIHNpZ25hbHMgY29u
bmVjdGVkIHRvIExDRF9EQVRBWzc6Ml0sIExDRF9EQVRBWzE1OjEwXQo+ID4gYW5kIExDRF9EQVRB
WzIzOjE4XSwgdGhlIG91dHB1dCBidXMgd2lkdGggaXMgMjQgaW5zdGVhZCBvZiAxOCB3aGVuIHRo
ZQo+ID4gc2lnbmFscyBhcmUgcm91dGVkIHRvIExDRF9EQVRBWzU6MF0sIExDRF9EQVRBWzExOjZd
IGFuZCBMQ0RfREFUQVsxNzoxMl0uCj4gPiAKPiA+IEFkZCBhIGJ1cy13aWR0aCBwcm9wZXJ0eSB0
byBkZXNjcmliZSB0aGlzIGRhdGEgcm91dGluZy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0t
Cj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIueWFt
bCB8IDEyICsrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9teHNmYi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXhzZmIueWFtbAo+ID4gaW5kZXggZWM2NTMzYjFkNGEzLi5kMTViYjhlZGMyOWYgMTAw
NjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
eHNmYi55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9teHNmYi55YW1sCj4gPiBAQCAtNTgsNiArNTgsMTggQEAgcHJvcGVydGllczoKPiA+ICAg
ICAgICAgIHR5cGU6IG9iamVjdAo+ID4gIAo+ID4gICAgICAgICAgcHJvcGVydGllczoKPiA+ICsg
ICAgICAgICAgZGF0YS1zaGlmdDoKPgo+IFNob3VsZG4ndCB0aGF0IGJlIGJ1cy13aWR0aCA/CgpB
YnNvbHV0ZWx5LiBJJ2xsIGZpeCB0aGF0LgoKPiA+ICsgICAgICAgICAgICBlbnVtOiBbMTYsIDE4
LCAyNF0KPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgICAg
VGhlIG91dHB1dCBidXMgd2lkdGguIFRoaXMgdmFsdWUgb3ZlcnJpZGVzIHRoZSBjb25maWd1cmF0
aW9uCj4gPiArICAgICAgICAgICAgICBkZXJpdmVkIGZyb20gdGhlIGNvbm5lY3RlZCBkZXZpY2Ug
KGVuY29kZXIgb3IgcGFuZWwpLiBJdCBzaG91bGQKPiA+ICsgICAgICAgICAgICAgIG9ubHkgYmUg
c3BlY2lmaWVkIHdoZW4gUENCIHJvdXRpbmcgb2YgdGhlIGRhdGEgc2lnbmFscyByZXF1aXJlIGEK
PiA+ICsgICAgICAgICAgICAgIGRpZmZlcmVudCBidXMgd2lkdGggb24gdGhlIExDRElGIGFuZCB0
aGUgY29ubmVjdGVkIGRldmljZS4gRm9yCj4gPiArICAgICAgICAgICAgICBpbnN0YW5jZSwgd2hl
biBhIDE4LWJpdCBSR0IgcGFuZWwgaGFzIGl0cyBSWzU6MF0sIEdbNTowXSBhbmQKPiA+ICsgICAg
ICAgICAgICAgIEJbNTowXSBzaWduYWxzIGNvbm5lY3RlZCB0byBMQ0RfREFUQVs3OjJdLCBMQ0Rf
REFUQVsxNToxMF0gYW5kCj4gPiArICAgICAgICAgICAgICBMQ0RfREFUQVsyMzoxOF0gaW5zdGVh
ZCBvZiBMQ0RfREFUQVs1OjBdLCBMQ0RfREFUQVsxMTo2XSBhbmQKPiA+ICsgICAgICAgICAgICAg
IExDRF9EQVRBWzE3OjEyXSwgYnVzLXdpZHRoIHNob3VsZCBiZSBzZXQgdG8gMjQuCj4gPiArCj4g
PiAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludDoKPiA+ICAgICAgICAgICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gPiAgCgotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
