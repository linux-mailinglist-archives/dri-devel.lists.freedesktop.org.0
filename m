Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE946B713
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A196E23F;
	Wed, 17 Jul 2019 07:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 320F36E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 07:01:51 +0000 (UTC)
X-UUID: 178f1f2683724f59a40625aed9c447b8-20190717
X-UUID: 178f1f2683724f59a40625aed9c447b8-20190717
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1071939593; Wed, 17 Jul 2019 15:01:50 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 15:01:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 15:01:48 +0800
Message-ID: <1563346908.29169.28.camel@mtksdaap41>
Subject: Re: [PATCH v4, 25/33] drm/mediatek: add clock property check before
 get it
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 15:01:48 +0800
In-Reply-To: <1562625253-29254-26-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-26-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBE8AFB5AD53D33AE2D0AB8EF4693F5CD67E9E7F3DEEF7454E41BD6BB0BDA92E2000:8
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozNCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY2xvY2sgcHJvcGVydHkg
Y2hlY2sgYmVmb3JlIGdldCBpdAo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlv
bmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHAuYyB8IDEwICsrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYwo+IGluZGV4IGM1N2U3YWIuLmE5ZDNlMjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+IEBAIC02NjgsMTAgKzY2OCwxMiBAQCBzdGF0aWMgaW50
IG10a19kZHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWZvciAoaSA9
IDA7IGkgPCAxMDsgaSsrKQo+ICAJCWRkcC0+bXV0ZXhbaV0uaWQgPSBpOwo+ICAKPiAtCWRkcC0+
Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4gLQlpZiAoSVNfRVJSKGRkcC0+Y2xrKSkg
ewo+IC0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7Cj4gLQkJcmV0dXJu
IFBUUl9FUlIoZGRwLT5jbGspOwo+ICsJaWYgKG9mX2ZpbmRfcHJvcGVydHkoZGV2LT5vZl9ub2Rl
LCAiY2xvY2tzIiwgJmkpKSB7Cj4gKwkJZGRwLT5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxM
KTsKPiArCQlpZiAoSVNfRVJSKGRkcC0+Y2xrKSkgewo+ICsJCQlkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byBnZXQgY2xvY2tcbiIpOwo+ICsJCQlyZXR1cm4gUFRSX0VSUihkZHAtPmNsayk7Cj4gKwkJ
fQoKT25seSAibWVkaWF0ZWssbXQ4MTMzLWRpc3AtbXV0ZXgiIGhhcyBubyBjbG9jayBwcm9wZXJ0
eS4gRm9yIG90aGVyIFNvQywKY2xvY2sgcHJvcGVydHkgaXMgcmVxdWlyZWQuIFNvIEkgdGhpbmsg
dGhpcyBleGNlcHRpb24gaXMganVzdCBmb3IKbXQ4MTgzLgoKUmVnYXJkcywKQ0sKCj4gIAl9Cj4g
IAo+ICAJcmVncyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwg
MCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
