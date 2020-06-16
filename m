Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E741FA5C4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 03:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EE289CCE;
	Tue, 16 Jun 2020 01:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331D988C07
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 01:51:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4763F9;
 Tue, 16 Jun 2020 03:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592272301;
 bh=peS4/uh5rv4eTufOqf33S/epmbRDzQUT067NfhNk4Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhD/lWgk8GRGpn0jQBo39ZH0IPDl9X7KKSAmNtTy78Rm7iG4AIYGQtjCyK3e0ym/+
 d3pxV7r/+jUFiu5TSKPOGAnmOjv/TxGX20OIvBXxR/E5LyuJ6It99h5lghpyao/Lr7
 0M7f5YRhZi0gc5fHakResb6lQC3l+t85cgo+9pk4=
Date: Tue, 16 Jun 2020 04:51:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200616015119.GI1629@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200611160817.GA6031@pendragon.ideasonboard.com>
 <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmljYXJkbywKCk9uIE1vbiwgSnVuIDE1LCAyMDIwIGF0IDExOjM4OjA3QU0gKzAyMDAsIFJp
Y2FyZG8gQ2HDsXVlbG8gd3JvdGU6Cj4gT24gVGh1LCAyMDIwLTA2LTExIGF0IDE5OjA4ICswMzAw
LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMTI6
MjM6NTZQTSArMDIwMCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiA+ID4gTWFrZSB0aGUgcG9y
dHMgbm9kZSBvcHRpb25hbCwgc2luY2UgdGhlcmUgYXJlIHNvbWUgRFRzIHRoYXQgZG9uJ3QgZGVm
aW5lCj4gPiA+IGFueSBwb3J0cyBmb3IgdGksdGZwNDEwLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogUmljYXJkbyBDYcOxdWVsbyA8cmljYXJkby5jYW51ZWxvQGNvbGxhYm9yYS5jb20+Cj4g
PiAKPiA+IFNob3VsZG4ndCB3ZSBmaXggdGhvc2UgRFRzIGluc3RlYWQgPyBXaGF0J3MgdGhlIHBv
aW50IG9mIGEgVEZQNDEwCj4gPiB3aXRob3V0IHBvcnRzIGluIERUID8KPiAKPiBUaGlzIGNvbWVz
IGZyb20gdGhlIGRpc2N1c3Npb24gaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBzZXJp
ZXMuCj4gCj4gSW4gdGhlIERUcyB0aGF0IGRvbid0IGRlZmluZSBhbnkgcG9ydHMgKGl0J3MgZG92
ZS1zYmMtYTUxMC5kdHMgb25seSwgYWN0dWFsbHkpCj4gaXQncyBub3QgY2xlYXIgaG93IHRvIGRl
ZmluZSB0aGUgcG9ydHMgKEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIGJvYXJkKS4KPiBJbml0
aWFsbHkgSSBkZWZpbmVkIGEgc2V0IG9mIGVtcHR5IHBvcnRzIGp1c3QgdG8gY29tcGx5IHdpdGgg
dGhlIGJpbmRpbmcKPiByZXF1aXJlbWVudHMsIGJ1dCBSb2Igc3VnZ2VzdGVkIHRoYXQgd2UgbWln
aHQgYXMgd2VsbCBkZWNsYXJlIHRoZW0gYXMgb3B0aW9uYWwsCj4gc2luY2UgaGF2aW5nIGFuIGVt
cHR5IHBvcnQgZGVmaW5pdGlvbiB3aXRoIG5vIHJlbW90ZSBlbmRwb2ludHMgaXMgbm8gYmV0dGVy
IHRoYW4KPiBoYXZpbmcgbm8gcG9ydHMgYXQgYWxsLgo+IAo+IEkgdW5kZXJzdGFuZCBib3RoIG9w
aW5pb25zIGJ1dCBJIGp1c3QgZG9uJ3Qga25vdyB3aGljaCBpcyB0aGUgYmVzdCBvcHRpb24gYXQK
PiB0aGlzIHBvaW50LgoKSG93IGFib3V0IGtlZXBpbmcgdGhlIHBvcnRzIG1hbmRhdG9yeSwgYW5k
IGxlYXZpbmcgZG92ZS1zYmMtYTUxMC5kdHMgdG8KYmUgZml4ZWQgbGF0ZXIgPwoKLS0gClJlZ2Fy
ZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
