Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC792EA88
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 04:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EECE89E26;
	Thu, 30 May 2019 02:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1144989E26
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 02:13:38 +0000 (UTC)
X-UUID: 86029ab1131847df8fbb925b3fe479c1-20190530
X-UUID: 86029ab1131847df8fbb925b3fe479c1-20190530
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 881203175; Thu, 30 May 2019 10:13:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 10:13:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 10:13:35 +0800
Message-ID: <1559182415.6868.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/4] drm: mediatek: fix unbind functions
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 May 2019 10:13:35 +0800
In-Reply-To: <20190529102555.251579-2-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
 <20190529102555.251579-2-hsinyi@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpPbiBXZWQsIDIwMTktMDUtMjkgYXQgMTg6MjUgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBkZXRhdGNoIHBhbmVsIGluIG10a19kc2lfZGVzdHJveV9jb25uX2VuYygp
LCBzaW5jZSAuYmluZCB3aWxsIHRyeSB0bwo+IGF0dGFjaCBpdCBhZ2Fpbi4KPiAKClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiBGaXhlczogMmU1NGMxNGUzMTBmICgi
ZHJtL21lZGlhdGVrOiBBZGQgRFNJIHN1YiBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiAtLS0KPiBjaGFuZ2UgbG9nIHYxLT52MjoK
PiAqIG1pcGlfZHNpX2hvc3RfdW5yZWdpc3RlcigpIHNob3VsZCBiZSBmaXhlZCBpbiBhbm90aGVy
IHBhdGNoIG9uIHRoZSBsaXN0Lgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggYjAwZWIyZDJlMDg2Li4xYWUzYmU5OWUw
ZmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtODQ0LDYgKzg0NCw4
IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfZGVzdHJveV9jb25uX2VuYyhzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQo+ICAJLyogU2tpcCBjb25uZWN0b3IgY2xlYW51cCBpZiBjcmVhdGlvbiB3YXMgZGVsZWdh
dGVkIHRvIHRoZSBicmlkZ2UgKi8KPiAgCWlmIChkc2ktPmNvbm4uZGV2KQo+ICAJCWRybV9jb25u
ZWN0b3JfY2xlYW51cCgmZHNpLT5jb25uKTsKPiArCWlmIChkc2ktPnBhbmVsKQo+ICsJCWRybV9w
YW5lbF9kZXRhY2goZHNpLT5wYW5lbCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIG10a19kc2lf
ZGRwX3N0YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
