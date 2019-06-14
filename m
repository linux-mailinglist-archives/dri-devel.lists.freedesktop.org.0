Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F40451D7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 04:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95BD892F2;
	Fri, 14 Jun 2019 02:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416D0892F2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:26:39 +0000 (UTC)
X-UUID: c99698b1d3e04bd8a8ead6e2c9b27021-20190614
X-UUID: c99698b1d3e04bd8a8ead6e2c9b27021-20190614
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1399065455; Fri, 14 Jun 2019 10:26:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 10:26:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 10:26:34 +0800
Message-ID: <1560479194.16718.5.camel@mtksdaap41>
Subject: Re: [PATCH v3, 10/27] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL
 setting into another use case
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>, <bibby.hsieh@mediatek.com>
Date: Fri, 14 Jun 2019 10:26:34 +0800
In-Reply-To: <1559734986-7379-11-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-11-git-send-email-yongqiang.niu@mediatek.com>
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

K0JpYmJ5OgoKSGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wNi0wNSBhdCAxOTo0MiArMDgw
MCwgeW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5p
dSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gSGVyZSBpcyB0d28gbW9kaWZpdGlv
biBpbiB0aGlzIHBhdGNoOgo+IDEuYmxzLT5kcGkwIGFuZCByZG1hMS0+ZHNpIGFyZSBkaWZmZXJl
biB1c2VjYXNlLAo+IFNwbGl0IERJU1BfUkVHX0NPTkZJR19EU0lfU0VMIHNldHRpbmcgaW50byBh
bnRoZXIgdXNlY2FzZQo+IDIucmVtb3ZlIERJU1BfUkVHX0NPTkZJR19EUElfU0VMIHNldHRpbmcs
IERQSV9TRUxfSU5fQkxTIGlzIDAgYW5kCj4gdGhpcyBpcyBzYW1lIHdpdGggaGFyZHdhcmUgZGVm
YXV0bCBzZXR0aW5nLAo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFu
Zy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+IGlu
ZGV4IDcxNzYwOWQuLjFiYmFiZTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYwo+IEBAIC00MDEsMTAgKzQwMSw5IEBAIHN0YXRpYyB2b2lkIG10a19kZHBfc291dF9z
ZWwodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywKPiAgCX0gZWxzZSBpZiAoY3VyID09IEREUF9D
T01QT05FTlRfQkxTICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EUEkwKSB7Cj4gIAkJd3JpdGVs
X3JlbGF4ZWQoQkxTX1RPX0RQSV9SRE1BMV9UT19EU0ksCj4gIAkJCSAgICAgICBjb25maWdfcmVn
cyArIERJU1BfUkVHX0NPTkZJR19PVVRfU0VMKTsKCllvdSBtb3ZlIDIgcmVnaXN0ZXIgc2V0dGlu
ZyBvdXQgb2YgdGhlIHBhdGggZnJvbSBCTFMgdG8gRFBJMCwgZG9lcyB0aGlzCnBhdGggc3RpbGwg
d29yaz8gUGxlYXNlIG1ha2Ugc3VyZSB0aGF0IGFsbCBtb2RpZmljYXRpb24gY291bGQgd29yayBv
bgphbGwgc3VwcG9ydGVkIFNvQy4KClJlZ2FyZHMsCkNLCgo+ICsJfSBlbHNlIGlmIChjdXIgPT0g
RERQX0NPTVBPTkVOVF9SRE1BMSAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFNJMCkgewo+ICAJ
CXdyaXRlbF9yZWxheGVkKERTSV9TRUxfSU5fUkRNQSwKPiAgCQkJICAgICAgIGNvbmZpZ19yZWdz
ICsgRElTUF9SRUdfQ09ORklHX0RTSV9TRUwpOwo+IC0JCXdyaXRlbF9yZWxheGVkKERQSV9TRUxf
SU5fQkxTLAo+IC0JCQkgICAgICAgY29uZmlnX3JlZ3MgKyBESVNQX1JFR19DT05GSUdfRFBJX1NF
TCk7Cj4gIAl9Cj4gIH0KPiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
