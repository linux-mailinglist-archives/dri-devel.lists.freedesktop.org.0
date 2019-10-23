Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB4E24E0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 23:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310506EB99;
	Wed, 23 Oct 2019 21:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01E6D6EB99
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 21:06:36 +0000 (UTC)
X-UUID: 99821a05e0a149058c8a3a7043c7907e-20191024
X-UUID: 99821a05e0a149058c8a3a7043c7907e-20191024
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 934746464; Thu, 24 Oct 2019 05:06:31 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 05:06:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 24 Oct 2019 05:06:21 +0800
Message-ID: <1571864784.19128.8.camel@mtksdaap41>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
From: CK Hu <ck.hu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2019 05:06:24 +0800
In-Reply-To: <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
 <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, "open list:ARM/Rockchip
 SoC..." <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Ulrich Hecht <uli@fpond.eu>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJvYjoKCk9uIFdlZCwgMjAxOS0xMC0yMyBhdCAxMjo0MiAtMDUwMCwgUm9iIEhlcnJpbmcg
d3JvdGU6Cj4gT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTI6MDcgUE0gTWF0dGhpYXMgQnJ1Z2dl
cgo+IDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBSb2IsCj4gPgo+
ID4gT24gMjEvMTAvMjAxOSAyMzo0NSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IFRoZSBvbmx5
IHJlYXNvbiB0aGUgTWVkaWF0ZWsgZHJpdmVyIGRvZXNuJ3QgdXNlIHRoZSBDTUEgaGVscGVycyBp
cyBpdAo+ID4gPiBzZXRzIERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGFuZCBkb2VzIGEgdm1h
cCgpIG9uIGRlbWFuZC4gVXNpbmcKPiA+ID4gdm1hcCgpIGlzIG5vdCBldmVuIGd1YXJhbnRlZWQg
dG8gd29yayBhcyBETUEgYnVmZmVycyBtYXkgbm90IGhhdmUgYQo+ID4gPiBzdHJ1Y3QgcGFnZS4g
Tm93IHRoYXQgdGhlIENNQSBoZWxwZXJzIHN1cHBvcnQgc2V0dGluZwo+ID4gPiBETUFfQVRUUl9O
T19LRVJORUxfTUFQUElORyBhcyBuZWVkZWQgb3Igbm90LCBjb252ZXJ0IE1lZGlhdGVrIGRyaXZl
ciB0bwo+ID4gPiB1c2UgQ01BIGhlbHBlcnMuCj4gPiA+Cj4gPiA+IENjOiBDSyBIdSA8Y2suaHVA
bWVkaWF0ZWsuY29tPgo+ID4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4KPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gQ2M6IE1hdHRoaWFzIEJydWdn
ZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
PiA+ID4gLS0tCj4gPgo+ID4gSSB0ZXN0ZWQgdGhpcyBvbiBteSBDaHJvbWVib29rIHdpdGggc29t
ZSBwYXRjaGVzIG9uIHRvcCBvZiB2NS40LXJjMSBbMV0sIHdoaWNoCj4gPiB3b3JrLiBJZiBJIGFk
ZCB5b3VyIHBhdGNoZXMgb24gdG9wIG9mIHRoYXQsIHRoZSBzeXN0ZW0gZG9lcyBub3QgYm9vdCB1
cC4KPiA+IFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIGEgc2VyaWFsIGNvbnNvbGUsIHNvIEkg
d2Fzbid0IGFibGUgdG8gc2VlIGlmIHRoZXJlIGlzCj4gPiBhbnkgZXJyb3IgbWVzc2FnZS4KPiAK
PiBUaGFua3MgZm9yIHRlc3RpbmcuIEknbSBiYXNlZCBvbiBkcm0tbWlzYy1uZXh0LCBidXQgZG9u
J3Qgc2VlIGFueXRoaW5nCj4gb2J2aW91cyB0aGVyZSB0aGF0IHdvdWxkIG1hdHRlci4gVGhlcmUg
YXJlIHNvbWUgbW1hcCBjaGFuZ2VzLCBidXQgSQo+IHRoaW5rIHRoZXkgc2hvdWxkbid0IG1hdHRl
ci4KPiAKPiBEaWQgeW91IGhhdmUgZmJjb24gZW5hYmxlZD8gVGhhdCBtYXkgZ2l2ZSBtb3JlIGNs
dWVzIGFib3V0IHdoZXJlIHRoZSBwcm9ibGVtIGlzLgoKVGhlcmUgYXJlIHByaXYtPmRtYV9kZXYg
Zm9yIGRtYSBkZXZpY2UsIGJ1dCBpdCBpcyBub3QgZHJtIGRldmljZS4gSW4KbXQ4MTczLmR0c2kg
WzFdLCB0aGVyZSBhcmUgbW1zeXMgZGV2aWNlIGFuZCBvdmwgZGV2aWNlLCBtbXN5cyBkZXZpY2Ug
aXMKZHJtIGRldmljZSBhbmQgb3ZsIGRldmljZSBpcyBtbXN5cydzIHN1YiBkZXZpY2Ugd2hpY2gg
cHJvdmlkZSBkbWEKZnVuY3Rpb24sIHNvIG92bCBpcyB0aGUgcHJpdi0+ZG1hX2Rldi4gSSB0aGlu
ayB5b3VyIHBhdGNoIGRpcmVjdGx5IHVzZQpkcm0gZGV2aWNlIGZvciBkbWEgb3BlcmF0aW9uIGFu
ZCB0aGlzIHdvdWxkIGNhdXNlIGRtYSBmdW5jdGlvbiBmYWlsLgpQbGVhc2UgdXNlIHByaXYtPmRt
YV9kZXYgZm9yIGRtYSBvcGVyYXRpb24uCgpSZWdhcmRzLApDSwoKWzFdCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2k/aD12NS40LXJjNAo+IAo+
IFJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
