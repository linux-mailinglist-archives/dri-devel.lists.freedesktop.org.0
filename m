Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E034447869
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 05:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1755289169;
	Mon, 17 Jun 2019 03:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24DA489169
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 03:06:13 +0000 (UTC)
X-UUID: 0b2b5341301845fbaedf068b07628bff-20190617
X-UUID: 0b2b5341301845fbaedf068b07628bff-20190617
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 924756873; Mon, 17 Jun 2019 11:06:05 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Jun 2019 11:06:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Jun 2019 11:06:03 +0800
Message-ID: <1560740762.25168.3.camel@mtksdaap41>
Subject: Re: [PATCH v3, 26/27] drm/mediatek: add clock property check before
 get it
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Mon, 17 Jun 2019 11:06:02 +0800
In-Reply-To: <1559734986-7379-27-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-27-git-send-email-yongqiang.niu@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wNi0wNSBhdCAxOTo0MyArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY2xvY2sgcHJvcGVydHkg
Y2hlY2sgYmVmb3JlIGdldCBpdAoKSW4gdGhlIGJpbmRpbmcgZG9jdW1lbnQgWzFdLCBjbG9jayBp
cyByZXF1aXJlZCBwcm9wZXJ0eS4gSW4gdGhpcyBwYXRjaCwKeW91IGNoYW5nZSBpdCB0byBvcHRp
b25hbCBwcm9wZXJ0eS4gSSB0aGluayB5b3Ugc2hvdWxkIGNoYW5nZSB0aGUKYmluZGluZyBkb2N1
bWVudCBhbmQgZGVzY3JpYmUgX1dIWV8gZG8geW91IGRvIHRoaXMuCgpbMV0KaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWslMkNkaXNwLnR4dAoKUmVnYXJkcywKQ0sKCj4gCj4gU2lnbmVkLW9m
Zi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMTAgKysrKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggOTk4NmM2MS4uMjgyNzRk
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTY4OSwx
MCArNjg5LDEyIEBAIHN0YXRpYyBpbnQgbXRrX2RkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAJZm9yIChpID0gMDsgaSA8IDEwOyBpKyspCj4gIAkJZGRwLT5tdXRleFtp
XS5pZCA9IGk7Cj4gIAo+IC0JZGRwLT5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKPiAt
CWlmIChJU19FUlIoZGRwLT5jbGspKSB7Cj4gLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0
IGNsb2NrXG4iKTsKPiAtCQlyZXR1cm4gUFRSX0VSUihkZHAtPmNsayk7Cj4gKwlpZiAob2ZfZmlu
ZF9wcm9wZXJ0eShkZXYtPm9mX25vZGUsICJjbG9ja3MiLCAmaSkpIHsKPiArCQlkZHAtPmNsayA9
IGRldm1fY2xrX2dldChkZXYsIE5VTEwpOwo+ICsJCWlmIChJU19FUlIoZGRwLT5jbGspKSB7Cj4g
KwkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7Cj4gKwkJCXJldHVybiBQ
VFJfRVJSKGRkcC0+Y2xrKTsKPiArCQl9Cj4gIAl9Cj4gIAo+ICAJcmVncyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
