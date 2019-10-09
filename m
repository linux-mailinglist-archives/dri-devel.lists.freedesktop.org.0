Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B580D0C4A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153AF89B0D;
	Wed,  9 Oct 2019 10:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id D247989B0D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:11:10 +0000 (UTC)
X-UUID: c19fab52b8bb4fd4a6fb7bf723bf0a0c-20191009
X-UUID: c19fab52b8bb4fd4a6fb7bf723bf0a0c-20191009
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1108232262; Wed, 09 Oct 2019 17:36:01 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:35:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:35:59 +0800
Message-ID: <1570613761.7713.15.camel@mtksdaap41>
Subject: Re: [PATCH v5, 24/32] drm/mediatek: add clock property check before
 get it
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:36:01 +0800
In-Reply-To: <1567090254-15566-25-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-25-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 245755396B82B8B6F48F7B8E82316EBB41F1B194122EA2DF61C4B744C093FDBA2000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY2xvY2sgcHJvcGVydHkg
Y2hlY2sgYmVmb3JlIGdldCBpdAo+IAoKSSd2ZSByZXdyaXRlIHRoaXMgcGF0Y2ggYW5kIGFwcGxp
ZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQtNS41IFsxXSB3aXRoCnRoZSB0aXRsZSAiZHJtL21lZGlh
dGVrOiBhZGQgbm9fY2xrIGludG8gZGRwIHByaXZhdGUgZGF0YSIsIHRoYW5rcy4KClsxXQpodHRw
czovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy9jb21taXRzL21lZGlh
dGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywKQ0sKCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5n
IE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggYTVhNjY4OS4uZWZmYzI0YSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTY1NywxMCArNjU3LDEyIEBAIHN0
YXRpYyBpbnQgbXRrX2RkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
Zm9yIChpID0gMDsgaSA8IDEwOyBpKyspCj4gIAkJZGRwLT5tdXRleFtpXS5pZCA9IGk7Cj4gIAo+
IC0JZGRwLT5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKPiAtCWlmIChJU19FUlIoZGRw
LT5jbGspKSB7Cj4gLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKPiAt
CQlyZXR1cm4gUFRSX0VSUihkZHAtPmNsayk7Cj4gKwlpZiAob2ZfZmluZF9wcm9wZXJ0eShkZXYt
Pm9mX25vZGUsICJjbG9ja3MiLCAmaSkpIHsKPiArCQlkZHAtPmNsayA9IGRldm1fY2xrX2dldChk
ZXYsIE5VTEwpOwo+ICsJCWlmIChJU19FUlIoZGRwLT5jbGspKSB7Cj4gKwkJCWRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7Cj4gKwkJCXJldHVybiBQVFJfRVJSKGRkcC0+Y2xr
KTsKPiArCQl9Cj4gIAl9Cj4gIAo+ICAJcmVncyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2
LCBJT1JFU09VUkNFX01FTSwgMCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
