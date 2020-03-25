Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7D192CB2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43B6E876;
	Wed, 25 Mar 2020 15:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDDF6E876
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:37:07 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD28E20789
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585150627;
 bh=oFXULYKX2minzKx5vxHtI63XAdjYTOaBbYv6XpZTy8U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EmXJ2ROEV4uIH8BVYnhJow+4A1BNHgFJhRUt9XQCD6kAaBxpBQ9HUZgP/XrSHK5bj
 h411zoPSO8xwuCbPMBajeLkGTqC6LflkOK0k89zrhsMNcNwB79zSWQ8gkX1NCxcuMl
 UqyaakkDQgHMStjvRjvEPxTPWKjs7WOVKBmfOH8Y=
Received: by mail-ed1-f50.google.com with SMTP id i16so1946359edy.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:37:06 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3luVwsSsSx3XBNkoDdBZK3gb0tDj9GOhQISnVqhXrFGSfqSEXl
 O/xKqOSK5Yy/v9TvQ7Brbb5amHjVn3j95dBzmQ==
X-Google-Smtp-Source: ADFU+vvSoNJiU20ECt+7uu1vArut7MOjxMslvG/4PUR+3ZtOhd8DgCxmMnQcFYZJdkJa/fK+7IMDcrBp7ZaC6D/3Es4=
X-Received: by 2002:a50:9f07:: with SMTP id b7mr3556024edf.148.1585150625023; 
 Wed, 25 Mar 2020 08:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-4-enric.balletbo@collabora.com>
 <158474603935.125146.14986079780178656133@swboyd.mtv.corp.google.com>
In-Reply-To: <158474603935.125146.14986079780178656133@swboyd.mtv.corp.google.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Mar 2020 23:36:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8jPkOrdUx7iH=q7kTH2+nPE8igX5-p6ZzwC7aHkQwF+A@mail.gmail.com>
Message-ID: <CAAOTY_8jPkOrdUx7iH=q7kTH2+nPE8igX5-p6ZzwC7aHkQwF+A@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 mturquette@baylibre.com, DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 hat.com@freedesktop.org, linux-clk@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
 James Liao <jamesjj.liao@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDPmnIgyMeaXpSDpgLHl
ha0g5LiK5Y2INzoxNOWvq+mBk++8mgo+Cj4gUXVvdGluZyBFbnJpYyBCYWxsZXRibyBpIFNlcnJh
ICgyMDIwLTAzLTExIDA5OjUzOjIwKQo+ID4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdn
ZXJAc3VzZS5jb20+Cj4gPgo+ID4gVGhlcmUgaXMgbm8gc3Ryb25nIHJlYXNvbiBmb3IgdGhpcyB0
byB1c2UgQ0xLX09GX0RFQ0xBUkUgaW5zdGVhZCBvZgo+ID4gYmVpbmcgYSBwbGF0Zm9ybSBkcml2
ZXIuIFBsdXMsIE1NU1lTIHByb3ZpZGVzIGNsb2NrcyBidXQgYWxzbyBhIHNoYXJlZAo+ID4gcmVn
aXN0ZXIgc3BhY2UgZm9yIHRoZSBtZWRpYXRlay1kcm0gYW5kIHRoZSBtZWRpYXRlay1tZHAKPiA+
IGRyaXZlci4gU28gbW92ZSB0aGUgTU1TWVMgY2xvY2tzIHRvIGEgbmV3IHBsYXRmb3JtIGRyaXZl
ciBhbmQgYWxzbwo+ID4gY3JlYXRlIGEgbmV3IE1NU1lTIHBsYXRmb3JtIGRyaXZlciBpbiBkcml2
ZXJzL3NvYy9tZWRpYXRlayB0aGF0Cj4gPiBpbnN0YW50aWF0ZXMgdGhlIGNsb2NrIGRyaXZlci4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxl
dGJvQGNvbGxhYm9yYS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4KPiA+IC0tLQo+Cj4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz4KPgo+IFVubGVzcyB5b3Ugd2FudCBtZSB0byBwaWNrIHRoaXMgdXAgYnkgaXRzZWxmPwoK
SSB3b3VsZCBsaWtlIE1hdHRoaWFzIHRvIHBpY2sgdXAgdGhpcyBzZXJpZXMgdG9nZXRoZXIuCgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
