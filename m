Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7442B4A8B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 17:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610B089DBF;
	Mon, 16 Nov 2020 16:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725B889DBF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 16:17:14 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C833D223BD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605543434;
 bh=q1HNWQlgqyDV4J+94bAX1fiF1L9E46ZR4cKIv+z263Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dj5aAyQ1f5t4ajIRx09p+pzqAm9V9n/zJv9vYOtdh3E4cupE5WneWybBM8nlkxjrc
 c08AIbC+ARdj5MO4GlOZ+dL7VvRZbBHsVZEU8oGdhSqVvdDXripbzytHPt9RM9OZXI
 BaaD21da+IYcNePJxoOZRNpEG3pf/cX8onFrGfo8=
Received: by mail-ed1-f51.google.com with SMTP id q16so4108434edv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 08:17:13 -0800 (PST)
X-Gm-Message-State: AOAM531qwr7VxGCbGVHDjojrPCQJ9qaQqsaTfLP5PkyjB+S4wxNXwDyN
 LAgW6K96uPw+7hn3DV6X+92g16lmm45uPHCcQw==
X-Google-Smtp-Source: ABdhPJyPsbGQNAIpJqwexuf+/mGJEj4xArjOBxDL5Q/Sy+XEJHFSX6d1dq3TrtTA8UHG1sae7pvgH7U8o4j6Ylx5HZ4=
X-Received: by 2002:aa7:d408:: with SMTP id z8mr16316296edq.166.1605543432331; 
 Mon, 16 Nov 2020 08:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
 <1604039049.31607.13.camel@mhfsdcap03>
 <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
 <20201116072554.GH7499@vkoul-mobl>
In-Reply-To: <20201116072554.GH7499@vkoul-mobl>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 00:17:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
Message-ID: <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
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

SGksIFZpbm9kOgoKVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMeac
iDE25pelIOmAseS4gCDkuIvljYgzOjI15a+r6YGT77yaCj4KPiBPbiAwMi0xMS0yMCwgMDc6MDgs
IENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiArIFZpbm9kOgo+ID4KPiA+IEhpLCBDaHVuZmVuZzoK
PiA+Cj4gPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IOaWvCAyMDIw
5bm0MTDmnIgzMOaXpSDpgLHkupQg5LiL5Y2IMjoyNOWvq+mBk++8mgo+ID4gPgo+ID4gPiBPbiBU
aHUsIDIwMjAtMTAtMjkgYXQgMjM6MjcgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+
ID4gbXRrX21pcGlfZHNpX3BoeSBpcyBjdXJyZW50bHkgcGxhY2VkIGluc2lkZSBtZWRpYXRlayBk
cm0gZHJpdmVyLCBidXQgaXQncwo+ID4gPiA+IG1vcmUgc3VpdGFibGUgdG8gcGxhY2UgYSBwaHkg
ZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIsIHNvIG1vdmUKPiA+ID4gPiBtdGtfbWlwaV9k
c2lfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgo+ID4gPiA+Cj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA3IC0tLS0tLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgLS0tLS0tCj4gPiA+
ID4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA3ICsrKysrKysKPiA+ID4gPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrKysKPiA+ID4gPiAgLi4uL21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTczLmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ID4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTgzLmN9ICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiAgLi4uL210a19taXBpX3R4LmMgPT4gcGh5L21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2kuY30gICAgICB8IDIgKy0KPiA+ID4gPiAgLi4uL210a19taXBp
X3R4LmggPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiA+ID4g
PiAgOCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+
ID4gPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4
LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTczLmN9ICg5OSUpCj4gPiA+
ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5j
ID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jfSAoOTklKQo+ID4gPiA+
ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jID0+IHBoeS9t
ZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmN9ICg5OSUpCj4gPiA+ID4gIHJlbmFtZSBkcml2ZXJz
L3tncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVrL3BoeS1tdGst
bWlwaS1kc2kuaH0gKDEwMCUpCj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBDaHVuZmVuZyBZdW4g
PGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4gPgo+ID4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5
IHRoZSB3aG9sZSBzZXJpZXMgaW50byBteSB0cmVlLCB3b3VsZCB5b3UgcGxlYXNlCj4gPiBnaXZl
IGFuIGFja2VkLWJ5IHRhZyBvbiB0aGlzIHBhdGNoLCBzbyBJIGNvdWxkIGFwcGx5IHRoaXMgcGF0
Y2ggaW50bwo+ID4gbXkgdHJlZS4KPgo+IEkgd291bGQgcHJlZmVyIHRoaXMgdG8gZ28gdGhydSBw
aHkgdHJlZSwgdW5sZXNzIHRoZXJlIGFyZSBkZXBlbmRlbmNpZXMsCj4gd2hpY2ggSSBhbSBub3Qg
Y2xlYXIgbG9va2luZyBhdCBhYm92ZQo+CgpQbGVhc2UgYXBwbHkgdGhpcyBzZXJpZXMgdG8gcGh5
IHRyZWUsIGFuZCBJIHdvdWxkIGRyb3AgdGhpcyBzZXJpZXMKZnJvbSBteSB0cmVlLCB0aGFua3Mu
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAtLQo+IH5WaW5vZApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
