Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A750CB564
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6B46EAEE;
	Fri,  4 Oct 2019 07:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397CF6E9C2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:21:48 +0000 (UTC)
Received: from [199.195.250.187] (port=36669 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iG135-0007HQ-KE; Thu, 03 Oct 2019 14:21:44 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 321258236F;
 Thu,  3 Oct 2019 13:21:35 +0000 (UTC)
Date: Thu, 03 Oct 2019 21:21:30 +0800
In-Reply-To: <20191003131916.4bm22krapo5tz6oz@gilmour>
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-2-icenowy@aosc.io>
 <CAMty3ZCjrM4MajJLyLwt-31mNnfVWghwatogtwVOvCt4gY0LZA@mail.gmail.com>
 <20191003131916.4bm22krapo5tz6oz@gilmour>
MIME-Version: 1.0
Subject: Re: [linux-sunxi] [PATCH 1/3] Revert "drm/sun4i: dsi: Change the
 start delay calculation"
To: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <E0DBDA94-FA7C-4ED6-AE84-BE1FC5463C0E@aosc.io>
X-BlackCat-Spam-Score: 14
X-Spam-Status: No, score=1.4
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAxOeW5tDEw5pyIM+aXpSBHTVQrMDg6MDAg5LiL5Y2IOToxOToxNiwgTWF4aW1lIFJp
cGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPiDlhpnliLA6Cj5PbiBUaHUsIE9jdCAwMywgMjAxOSBh
dCAxMjozODo0M1BNICswNTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+PiBPbiBUdWUsIE9jdCAxLCAy
MDE5IGF0IDE6MzMgUE0gSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPiB3cm90ZToKPj4g
Pgo+PiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZGE2NzZjNmFhNjQxM2Q1OWFiMGE4MGM5N2JiYzI3
MzAyNWU2NDBiMi4KPj4gPgo+PiA+IFRoZSBvcmlnaW5hbCBjb21taXQgYWRkcyBhIHN0YXJ0IHBh
cmFtZXRlciB0byB0aGUgY2FsY3VsYXRpb24gb2YKPnRoZQo+PiA+IHN0YXJ0IGRlbGF5IGFjY29y
ZGluZyB0byBzb21lIG9sZCBCU1AgdmVyc2lvbnMgZnJvbSBBbGx3aW5uZXIuCj5Ib3dldmVyLAo+
PiA+IHRoZXJlJ3JlIHR3byB3YXlzIHRvIGFkZCB0aGlzIGRlbGF5IC0tIGFkZCBpdCBpbiBEU0kg
Y29udHJvbGxlciBvcgo+YWRkCj4+ID4gaXQgaW4gdGhlIFRDT04uIEFkZCBpdCBpbiBib3RoIGNv
bnRyb2xsZXJzIHdvbid0IHdvcmsuCj4+ID4KPj4gPiBUaGUgY29kZSBiZWZvcmUgdGhpcyBjb21t
aXQgaXMgcGlja2VkIGZyb20gbmV3IHZlcnNpb25zIG9mIEJTUAo+a2VybmVsLAo+PiA+IHdoaWNo
IGhhcyBhIGNvbW1lbnQgZm9yIHRoZSAxIHRoYXQgc2F5cyAicHV0IHN0YXJ0X2RlbGF5IHRvIHRj
b24iLgo+QnkKPj4gPiBjaGVja2luZyB0aGUgc3VuNGlfdGNvbjBfbW9kZV9zZXRfY3B1KCkgaW4g
c3VuNGlfdGNvbiBkcml2ZXIsIGl0Cj5oYXMKPj4gPiBhbHJlYWR5IGFkZGVkIHRoaXMgZGVsYXks
IHNvIHdlIHNob3VsZG4ndCByZXBlYXQgdG8gYWRkIHRoZSBkZWxheQo+aW4gRFNJCj4+ID4gY29u
dHJvbGxlciwgb3RoZXJ3aXNlIHRoZSB0aW1pbmcgd29uJ3QgbWF0Y2guCj4+Cj4+IFRoYW5rcyBm
b3IgdGhpcyBjaGFuZ2UuIGxvb2sgbGlrZSB0aGlzIGlzIHByb3BlciByZWFzb24gZm9yIGFkZGlu
ZyArCj4+IDEuIGFsc28gYWRkaW5nIGJzcCBjb2RlIGxpbmtzIGhlcmUgbWlnaHQgaGVscCBmb3Ig
ZnV0dXJlIHJlZmVyZW5jZS4KPj4KPj4gT3RoZXJ3aXNlLAo+Pgo+PiBSZXZpZXdlZC1ieTogSmFn
YW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KPlRoZSBjb21taXQgbG9nIHdh
cyBiZXR0ZXIgaW4gdGhpcyBvbmUuIEkgZW5kZWQgdXAgbWVyZ2luZyB0aGlzIG9uZSwKPndpdGgg
eW91ciBSLWIuCgpQbGVhc2Ugbm90ZSB0aGF0IEphZ2FuJ3MgdjExIDMvNyBpcyBzdGlsbCBuZWVk
ZWQuCgo+Cj5NYXhpbWUKCi0tIArkvb/nlKggSy05IE1haWwg5Y+R6YCB6Ieq5oiR55qEQW5kcm9p
ZOiuvuWkh+OAggpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
