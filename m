Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B43184F7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 06:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1C06E872;
	Thu, 11 Feb 2021 05:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs20.siol.net [185.57.226.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDE56E872
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 05:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id BBBF7522F77;
 Thu, 11 Feb 2021 06:39:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id zympFg3kgA5V; Thu, 11 Feb 2021 06:39:46 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 71452521B94;
 Thu, 11 Feb 2021 06:39:46 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 754F6522B31;
 Thu, 11 Feb 2021 06:39:43 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime@cerno.tech>, mturquette@baylibre.com,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: mp: fix parent rate change flag
 check
Date: Thu, 11 Feb 2021 06:39:43 +0100
Message-ID: <44806885.xO3ZHcXyXd@jernej-laptop>
In-Reply-To: <161301048085.1254594.6786751472945742937@swboyd.mtv.corp.google.com>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
 <20210210102904.xyr6bftn4ueuu74z@gilmour>
 <161301048085.1254594.6786751472945742937@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIMSNZXRydGVrLCAxMS4gZmVicnVhciAyMDIxIG9iIDAzOjI4OjAwIENFVCBqZSBTdGVwaGVu
IEJveWQgbmFwaXNhbChhKToKPiBRdW90aW5nIE1heGltZSBSaXBhcmQgKDIwMjEtMDItMTAgMDI6
Mjk6MDQpCj4gCj4gPiBIaSBNaWtlLCBTdGVwaGVuLAo+ID4gCj4gPiBPbiBUdWUsIEZlYiAwOSwg
MjAyMSBhdCAwNjo1ODo1NlBNICswMTAwLCBKZXJuZWogU2tyYWJlYyB3cm90ZToKPiA+ID4gQ0xL
X1NFVF9SQVRFX1BBUkVOVCBmbGFnIGlzIGNoZWNrZWQgb24gcGFyZW50IGNsb2NrIGluc3RlYWQg
b2YgY3VycmVudAo+ID4gPiBvbmUuIEZpeCB0aGF0Lgo+ID4gPiAKPiA+ID4gRml4ZXM6IDNmNzkw
NDMzYzNjYiAoImNsazogc3VueGktbmc6IEFkanVzdCBNUCBjbG9jayBwYXJlbnQgcmF0ZSB3aGVu
Cj4gPiA+IGFsbG93ZWQiKSBSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3Jn
Pgo+ID4gPiBUZXN0ZWQtYnk6IEFuZHJlIEhlaWRlciA8YS5oZWlkZXJAZ21haWwuY29tPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+
Cj4gPiAKPiA+IFRoaXMgaXMgYSBsYXN0IG1pbnV0ZSBmaXggZm9yIHVzLCBjYW4geW91IG1lcmdl
IGl0IGludG8gY2xrLWZpeGVzCj4gPiBkaXJlY3RseT8KPiA+IAo+ID4gQWNrZWQtYnk6IE1heGlt
ZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiAKPiBJdCdzIGFsc28gZml4aW5nIGEgcHJv
YmxlbSB0aGF0J3MgYmVlbiBhcm91bmQgc2luY2UgdjUuMC4gSXMgc29tZXRoaW5nCj4gYnJva2Vu
IHRoYXQgbmVlZHMgZml4aW5nIHRoaXMgbGF0ZT8gVGhlIG1vdGl2YXRpb24gY291bGQgYmUgYWRk
ZWQgdG8gdGhlCj4gY29tbWl0IHRleHQgYmVjYXVzZSByaWdodCBub3cgaXQgbG9va3MgbGlrZSBh
IHR5cG8gZml4IHNwb3R0ZWQgdmlzdWFsbHkuCgpZZXMsIGl0J3MgbmVlZGVkLiBXaXRob3V0IHRo
aXMgcGF0Y2gsIDRrQDYwIGRvZXNuJ3Qgd29yayBhbmQgcHJvYmFibHkgc29tZSAKb3RoZXIgcmVz
b2x1dGlvbnMgdG9vLiBUaGF0J3Mgd2h5IGl0J3Mgc2VuZCB3aXRoIG90aGVyIGRpc3BsYXkgcmVs
YXRlZCBmaXhlcy4gClRoaXMgaXMgcGFydCBvZiBzb2x1dGlvbiBmb3IgbG9uZ3N0YW5kaW5nIGRp
c3BsYXkgaXNzdWVzLgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
