Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4985B5B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9E89BA9;
	Thu,  8 Aug 2019 07:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D56D89BA9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 07:14:43 +0000 (UTC)
X-UUID: 28828ab66c3845e0bd6f50b3bdb4f73d-20190808
X-UUID: 28828ab66c3845e0bd6f50b3bdb4f73d-20190808
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2033063645; Thu, 08 Aug 2019 15:14:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS33N1.mediatek.inc (172.27.4.75) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 8 Aug 2019 15:14:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 8 Aug 2019 15:14:34 +0800
Message-ID: <1565248475.31636.0.camel@mtksdaap41>
Subject: Re: [PATCH v5 3/4] drm/mediatek: add mt8183 dpi clock factor
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Thu, 8 Aug 2019 15:14:35 +0800
In-Reply-To: <20190807060257.57007-4-jitao.shi@mediatek.com>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
 <20190807060257.57007-4-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ACA0D368338ADFB945EC0DEE8709C7B8CB13598F3D79743A33E08B5CF2A1E74F2000:8
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
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry
 Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy
 Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gV2VkLCAyMDE5LTA4LTA3IGF0IDE0OjAyICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gVGhlIGZhY3RvciBkZXBlbmRzIG9uIHRoZSBkaXZpZGVyIG9mIERQSSBpbiBNVDgx
ODMsIHRoZXJlZm9yZSwKPiB3ZSBzaG91bGQgZml4IHRoaXMgZmFjdG9yIHRvIHRoZSByaWdodCBh
bmQgbmV3IG9uZS4KPiAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoK
PiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAxOCArKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKPiBpbmRleCA3NDMyMzA4NjRiYTAuLjRmMjcwMGNiZmRiNyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC02NzIsNiArNjcyLDE2IEBAIHN0
YXRpYyB1bnNpZ25lZCBpbnQgbXQyNzAxX2NhbGN1bGF0ZV9mYWN0b3IoaW50IGNsb2NrKQo+ICAJ
CXJldHVybiAxOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdW5zaWduZWQgaW50IG10ODE4M19jYWxjdWxh
dGVfZmFjdG9yKGludCBjbG9jaykKPiArewo+ICsJaWYgKGNsb2NrIDw9IDI3MDAwKQo+ICsJCXJl
dHVybiA4Owo+ICsJZWxzZSBpZiAoY2xvY2sgPD0gMTY3MDAwKQo+ICsJCXJldHVybiA0Owo+ICsJ
ZWxzZQo+ICsJCXJldHVybiAyOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19k
cGlfY29uZiBtdDgxNzNfY29uZiA9IHsKPiAgCS5jYWxfZmFjdG9yID0gbXQ4MTczX2NhbGN1bGF0
ZV9mYWN0b3IsCj4gIAkucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCj4gQEAgLTY4Myw2ICs2OTMsMTEg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYgPSB7Cj4gIAku
ZWRnZV9zZWxfZW4gPSB0cnVlLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
ZHBpX2NvbmYgbXQ4MTgzX2NvbmYgPSB7Cj4gKwkuY2FsX2ZhY3RvciA9IG10ODE4M19jYWxjdWxh
dGVfZmFjdG9yLAo+ICsJLnJlZ19oX2ZyZV9jb24gPSAweGUwLAo+ICt9Owo+ICsKPiAgc3RhdGlj
IGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gQEAgLTc3OSw2ICs3OTQsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHBpX29mX2lkc1tdID0gewo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHBpIiwKPiAgCSAgLmRhdGEgPSAmbXQ4
MTczX2NvbmYsCj4gIAl9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZHBp
IiwKPiArCSAgLmRhdGEgPSAmbXQ4MTgzX2NvbmYsCj4gKwl9LAo+ICAJeyB9LAo+ICB9Owo+ICAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
