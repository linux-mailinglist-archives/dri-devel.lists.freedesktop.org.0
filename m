Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43702B3D9F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 08:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAEA89CF8;
	Mon, 16 Nov 2020 07:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB5189CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 07:25:59 +0000 (UTC)
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86A3D222B9;
 Mon, 16 Nov 2020 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605511558;
 bh=rhAoQ3uYeTlKRt+gftj9x9Wy4YxRy6VLph37vW9soUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ftWKSjiUUgmwpc3m3ysTWVkmstsTPq/tqt/T9Oi15PbF/jkqpIZ9O1egztNi9DoJj
 r4Wp/SMD43V1FLmOmdq/c1U75CSQwlyuSmJk6bzY7TFnGmNGkcPvqtjglifVOpTqAY
 YGI9xwmNWNMyDtbwmqMxQauz+qB7ROQAvBos9aHc=
Date: Mon, 16 Nov 2020 12:55:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
Message-ID: <20201116072554.GH7499@vkoul-mobl>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
 <1604039049.31607.13.camel@mhfsdcap03>
 <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDItMTEtMjAsIDA3OjA4LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ICsgVmlub2Q6Cj4gCj4g
SGksIENodW5mZW5nOgo+IAo+IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNv
bT4g5pa8IDIwMjDlubQxMOaciDMw5pelIOmAseS6lCDkuIvljYgyOjI05a+r6YGT77yaCj4gPgo+
ID4gT24gVGh1LCAyMDIwLTEwLTI5IGF0IDIzOjI3ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3Rl
Ogo+ID4gPiBtdGtfbWlwaV9kc2lfcGh5IGlzIGN1cnJlbnRseSBwbGFjZWQgaW5zaWRlIG1lZGlh
dGVrIGRybSBkcml2ZXIsIGJ1dCBpdCdzCj4gPiA+IG1vcmUgc3VpdGFibGUgdG8gcGxhY2UgYSBw
aHkgZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIsIHNvIG1vdmUKPiA+ID4gbXRrX21pcGlf
ZHNpX3BoeSBkcml2ZXIgaW50byBwaHkgZHJpdmVyIGZvbGRlci4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiA+IC0t
LQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDcgLS0tLS0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgLS0tLS0tCj4gPiA+ICBkcml2ZXJz
L3BoeS9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyAr
KysrKysrCj4gPiA+ICBkcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNSArKysrKwo+ID4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstbWlw
aS1kc2ktbXQ4MTczLmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIC4uLi9tZWRp
YXRlay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jfSAgICAgICAgICAgICAgICAgICAgfCAyICst
Cj4gPiA+ICAuLi4vbXRrX21pcGlfdHguYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRz
aS5jfSAgICAgIHwgMiArLQo+ID4gPiAgLi4uL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiA+ID4gIDggZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPiA+ICByZW5hbWUgZHJpdmVycy97Z3B1
L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX21pcGlfdHguYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10
ay1taXBpLWRzaS1tdDgxNzMuY30gKDk5JSkKPiA+ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJt
L21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1p
cGktZHNpLW10ODE4My5jfSAoOTklKQo+ID4gPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX21pcGlfdHguYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRzaS5jfSAo
OTklKQo+ID4gPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHgu
aCA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRzaS5ofSAoMTAwJSkKPiA+Cj4gPiBSZXZp
ZXdlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IAo+IEkg
d291bGQgbGlrZSB0byBhcHBseSB0aGUgd2hvbGUgc2VyaWVzIGludG8gbXkgdHJlZSwgd291bGQg
eW91IHBsZWFzZQo+IGdpdmUgYW4gYWNrZWQtYnkgdGFnIG9uIHRoaXMgcGF0Y2gsIHNvIEkgY291
bGQgYXBwbHkgdGhpcyBwYXRjaCBpbnRvCj4gbXkgdHJlZS4KCkkgd291bGQgcHJlZmVyIHRoaXMg
dG8gZ28gdGhydSBwaHkgdHJlZSwgdW5sZXNzIHRoZXJlIGFyZSBkZXBlbmRlbmNpZXMsCndoaWNo
IEkgYW0gbm90IGNsZWFyIGxvb2tpbmcgYXQgYWJvdmUKCi0tIAp+Vmlub2QKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
