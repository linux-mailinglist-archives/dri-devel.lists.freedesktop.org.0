Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED82B4BF4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FF389E5B;
	Mon, 16 Nov 2020 17:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9946589E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:02:09 +0000 (UTC)
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A00D20773;
 Mon, 16 Nov 2020 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605546129;
 bh=sjsgvMvmWPSA42bGQv2E5V5KDnWxlKmweJPO9rn0BZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tUa0YacAvfU0kutshUvy9FewSasPp6e2WQohFGcTY9mdgAnplDHwyEuGxl2k6btHK
 eHUX57VzyTaL1l/fRJBh1KmDXpbKtr7b/l8RFOq0GNV2ZJ/WqQfDmXBMvdiDP2+k6a
 N5GdV9zFBHROLPcs/fVuNby5Pe/m6CV4rEy0ttAc=
Date: Mon, 16 Nov 2020 22:32:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
Message-ID: <20201116170205.GV7499@vkoul-mobl>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
 <1604039049.31607.13.camel@mhfsdcap03>
 <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
 <20201116072554.GH7499@vkoul-mobl>
 <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
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

T24gMTctMTEtMjAsIDAwOjE3LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBWaW5vZDoKPiAK
PiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEx5pyIMTbml6Ug6YCx
5LiAIOS4i+WNiDM6MjXlr6vpgZPvvJoKPiA+Cj4gPiBPbiAwMi0xMS0yMCwgMDc6MDgsIENodW4t
S3VhbmcgSHUgd3JvdGU6Cj4gPiA+ICsgVmlub2Q6Cj4gPiA+Cj4gPiA+IEhpLCBDaHVuZmVuZzoK
PiA+ID4KPiA+ID4gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMOW5tDEw5pyIMzDml6Ug6YCx5LqUIOS4i+WNiDI6MjTlr6vpgZPvvJoKPiA+ID4gPgo+ID4g
PiA+IE9uIFRodSwgMjAyMC0xMC0yOSBhdCAyMzoyNyArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90
ZToKPiA+ID4gPiA+IG10a19taXBpX2RzaV9waHkgaXMgY3VycmVudGx5IHBsYWNlZCBpbnNpZGUg
bWVkaWF0ZWsgZHJtIGRyaXZlciwgYnV0IGl0J3MKPiA+ID4gPiA+IG1vcmUgc3VpdGFibGUgdG8g
cGxhY2UgYSBwaHkgZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIsIHNvIG1vdmUKPiA+ID4g
PiA+IG10a19taXBpX2RzaV9waHkgZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyAtLS0tLS0tCj4gPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDYgLS0tLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysrKysrKwo+ID4gPiA+ID4gIGRy
aXZlcnMvcGh5L21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA1ICsrKysrCj4gPiA+ID4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTcz
LmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiA+ICAuLi4vbWVkaWF0ZWsvcGh5
LW10ay1taXBpLWRzaS1tdDgxODMuY30gICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gPiA+
ID4gIC4uLi9tdGtfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmN9
ICAgICAgfCAyICstCj4gPiA+ID4gPiAgLi4uL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiA+ID4gPiA+ICA4IGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gIHJlbmFtZSBkcml2
ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDgxNzNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRl
ay9waHktbXRrLW1pcGktZHNpLW10ODE3My5jfSAoOTklKQo+ID4gPiA+ID4gIHJlbmFtZSBkcml2
ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRl
ay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jfSAoOTklKQo+ID4gPiA+ID4gIHJlbmFtZSBkcml2
ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1t
dGstbWlwaS1kc2kuY30gKDk5JSkKPiA+ID4gPiA+ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9t
ZWRpYXRlay9tdGtfbWlwaV90eC5oID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmh9
ICgxMDAlKQo+ID4gPiA+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZl
bmcueXVuQG1lZGlhdGVrLmNvbT4KPiA+ID4KPiA+ID4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHRo
ZSB3aG9sZSBzZXJpZXMgaW50byBteSB0cmVlLCB3b3VsZCB5b3UgcGxlYXNlCj4gPiA+IGdpdmUg
YW4gYWNrZWQtYnkgdGFnIG9uIHRoaXMgcGF0Y2gsIHNvIEkgY291bGQgYXBwbHkgdGhpcyBwYXRj
aCBpbnRvCj4gPiA+IG15IHRyZWUuCj4gPgo+ID4gSSB3b3VsZCBwcmVmZXIgdGhpcyB0byBnbyB0
aHJ1IHBoeSB0cmVlLCB1bmxlc3MgdGhlcmUgYXJlIGRlcGVuZGVuY2llcywKPiA+IHdoaWNoIEkg
YW0gbm90IGNsZWFyIGxvb2tpbmcgYXQgYWJvdmUKPiA+Cj4gCj4gUGxlYXNlIGFwcGx5IHRoaXMg
c2VyaWVzIHRvIHBoeSB0cmVlLCBhbmQgSSB3b3VsZCBkcm9wIHRoaXMgc2VyaWVzCj4gZnJvbSBt
eSB0cmVlLCB0aGFua3MuCgpPa2F5IHN1cmUsIGp1c3QgcmVhbGl6ZWQgSSBkb250IGhhdmUgdGhp
cyBpbiBteSBpbmJveCwgY2FuIHlvdSBwbGVhc2UKcmVwb3N0CgotLSAKflZpbm9kCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
