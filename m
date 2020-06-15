Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B41F93A6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 11:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A9589A60;
	Mon, 15 Jun 2020 09:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431B289A60
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 09:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 531BF2A2050
Message-ID: <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
From: Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 15 Jun 2020 11:38:07 +0200
In-Reply-To: <20200611160817.GA6031@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200611160817.GA6031@pendragon.ideasonboard.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

SGkgTGF1cmVudCwKClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaAoKT24gVGh1LCAyMDIw
LTA2LTExIGF0IDE5OjA4ICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IEhpIFJpY2Fy
ZG8sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24gVGh1LCBKdW4gMTEsIDIw
MjAgYXQgMTI6MjM6NTZQTSArMDIwMCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiA+IE1ha2Ug
dGhlIHBvcnRzIG5vZGUgb3B0aW9uYWwsIHNpbmNlIHRoZXJlIGFyZSBzb21lIERUcyB0aGF0IGRv
bid0IGRlZmluZQo+ID4gYW55IHBvcnRzIGZvciB0aSx0ZnA0MTAuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xsYWJvcmEuY29tPgo+
IAo+IFNob3VsZG4ndCB3ZSBmaXggdGhvc2UgRFRzIGluc3RlYWQgPyBXaGF0J3MgdGhlIHBvaW50
IG9mIGEgVEZQNDEwCj4gd2l0aG91dCBwb3J0cyBpbiBEVCA/CgpUaGlzIGNvbWVzIGZyb20gdGhl
IGRpc2N1c3Npb24gaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBzZXJpZXMuCgpJbiB0
aGUgRFRzIHRoYXQgZG9uJ3QgZGVmaW5lIGFueSBwb3J0cyAoaXQncyBkb3ZlLXNiYy1hNTEwLmR0
cyBvbmx5LCBhY3R1YWxseSkKaXQncyBub3QgY2xlYXIgaG93IHRvIGRlZmluZSB0aGUgcG9ydHMg
KEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIGJvYXJkKS4KSW5pdGlhbGx5IEkgZGVmaW5lZCBh
IHNldCBvZiBlbXB0eSBwb3J0cyBqdXN0IHRvIGNvbXBseSB3aXRoIHRoZSBiaW5kaW5nCnJlcXVp
cmVtZW50cywgYnV0IFJvYiBzdWdnZXN0ZWQgdGhhdCB3ZSBtaWdodCBhcyB3ZWxsIGRlY2xhcmUg
dGhlbSBhcyBvcHRpb25hbCwKc2luY2UgaGF2aW5nIGFuIGVtcHR5IHBvcnQgZGVmaW5pdGlvbiB3
aXRoIG5vIHJlbW90ZSBlbmRwb2ludHMgaXMgbm8gYmV0dGVyIHRoYW4KaGF2aW5nIG5vIHBvcnRz
IGF0IGFsbC4KCkkgdW5kZXJzdGFuZCBib3RoIG9waW5pb25zIGJ1dCBJIGp1c3QgZG9uJ3Qga25v
dyB3aGljaCBpcyB0aGUgYmVzdCBvcHRpb24gYXQKdGhpcyBwb2ludC4KCkNoZWVycywKUmljYXJk
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
