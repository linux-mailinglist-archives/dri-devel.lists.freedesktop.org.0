Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027E30710
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 05:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF556E194;
	Fri, 31 May 2019 03:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C30316E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 03:40:45 +0000 (UTC)
X-UUID: 90c434ee22d747c5a374ad6b8076e0ab-20190531
X-UUID: 90c434ee22d747c5a374ad6b8076e0ab-20190531
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1162707599; Fri, 31 May 2019 11:40:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 May 2019 11:40:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 May 2019 11:40:41 +0800
Message-ID: <1559274041.9102.3.camel@mtksdaap41>
Subject: Re: [v3 7/7] drm: mediatek: adjust dsi and mipi_tx probe sequence
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 31 May 2019 11:40:41 +0800
In-Reply-To: <20190519092537.69053-8-jitao.shi@mediatek.com>
References: <20190519092537.69053-1-jitao.shi@mediatek.com>
 <20190519092537.69053-8-jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com, Ajay
 Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul
 Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gU3VuLCAyMDE5LTA1LTE5IGF0IDE3OjI1ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gbXRrX21pcGlfdHggaXMgdGhlIHBoeSBvZiBtdGtfZHNpLgo+IG10a19kc2kgZ2V0
IHRoZSBwaHkobXRrX21pcGlfdHgpIGluIHByb2JlKCkuCj4gCj4gU28sICBtdGtfbWlwaV90eCBp
bml0IHNob3VsZCBiZSBhaGVhZCBvZiBtdGtfZHNpLiBPciBtdGtfZHNpIHdpbGwKPiBkZWZlciB0
byB3YWl0IG10a19taXBpX3R4IHByb2JlIGRvbmUuCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlA
bWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCBjZjU5
ZWE5YmNjZmQuLjU4M2Q1MzNkOTU3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jCj4gQEAgLTYzMyw4ICs2MzMsOCBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciAqIGNvbnN0IG10a19kcm1fZHJpdmVyc1tdID0gewo+ICAJJm10a19kaXNwX3JkbWFfZHJp
dmVyLAo+ICAJJm10a19kcGlfZHJpdmVyLAo+ICAJJm10a19kcm1fcGxhdGZvcm1fZHJpdmVyLAo+
IC0JJm10a19kc2lfZHJpdmVyLAo+ICAJJm10a19taXBpX3R4X2RyaXZlciwKPiArCSZtdGtfZHNp
X2RyaXZlciwKPiAgfTsKPiAgCj4gIHN0YXRpYyBpbnQgX19pbml0IG10a19kcm1faW5pdCh2b2lk
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
