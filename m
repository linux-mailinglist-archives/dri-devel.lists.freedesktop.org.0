Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28371A2ED0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 07:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384516E231;
	Fri, 30 Aug 2019 05:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id F27A36E231
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 05:21:20 +0000 (UTC)
X-UUID: eb94aa96f4fe4235a5be0a1581f1f067-20190830
X-UUID: eb94aa96f4fe4235a5be0a1581f1f067-20190830
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 332242960; Fri, 30 Aug 2019 13:21:16 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 13:21:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 13:21:09 +0800
Message-ID: <1567142464.5942.4.camel@mtksdaap41>
Subject: Re: [PATCH v5, 11/32] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL
 setting into another use case
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 13:21:04 +0800
In-Reply-To: <1567090254-15566-12-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-12-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ABE7C60E2CBF0188A970D85C6C78E7CA90917B094088DEB0F5CED3D1ED62ED7E2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gSGVyZSBpcyB0d28gbW9kaWZpdGlvbiBpbiB0aGlz
IHBhdGNoOgo+IDEuYmxzLT5kcGkwIGFuZCByZG1hMS0+ZHNpIGFyZSBkaWZmZXJlbiB1c2VjYXNl
LAo+IFNwbGl0IERJU1BfUkVHX0NPTkZJR19EU0lfU0VMIHNldHRpbmcgaW50byBhbnRoZXIgdXNl
Y2FzZQo+IDIucmVtb3ZlIERJU1BfUkVHX0NPTkZJR19EUElfU0VMIHNldHRpbmcsIERQSV9TRUxf
SU5fQkxTIGlzIDAgYW5kCj4gdGhpcyBpcyBzYW1lIHdpdGggaGFyZHdhcmUgZGVmYXV0bCBzZXR0
aW5nLAo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAu
YyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+IGluZGV4IDQ4NjZh
OWIuLmM5M2UxYjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+
IEBAIC0zOTIsMTAgKzM5Miw5IEBAIHN0YXRpYyB2b2lkIG10a19kZHBfc291dF9zZWwodm9pZCBf
X2lvbWVtICpjb25maWdfcmVncywKPiAgCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRf
QkxTICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EUEkwKSB7Cj4gIAkJd3JpdGVsX3JlbGF4ZWQo
QkxTX1RPX0RQSV9SRE1BMV9UT19EU0ksCj4gIAkJCSAgICAgICBjb25maWdfcmVncyArIERJU1Bf
UkVHX0NPTkZJR19PVVRfU0VMKTsKPiArCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRf
UkRNQTEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTApIHsKPiAgCQl3cml0ZWxfcmVsYXhl
ZChEU0lfU0VMX0lOX1JETUEsCj4gIAkJCSAgICAgICBjb25maWdfcmVncyArIERJU1BfUkVHX0NP
TkZJR19EU0lfU0VMKTsKPiAtCQl3cml0ZWxfcmVsYXhlZChEUElfU0VMX0lOX0JMUywKPiAtCQkJ
ICAgICAgIGNvbmZpZ19yZWdzICsgRElTUF9SRUdfQ09ORklHX0RQSV9TRUwpOwoKQXMgaW50ZXJu
YWwgZGlzY3Vzc2lvbiwgcGxlYXNlIHJld3JpdGUgdGhpcyB0byBwcmV2ZW50IGJyZWFraW5nIE1U
MjcwMQpjb25uZWN0aW9uLiBJdCdzIGJldHRlciB0byBhZGQgY29tbWVudCB0byBhZGRyZXNzIHRo
ZSBzcGVjaWFsIHVzYWdlIGZvcgpNVDI3MDEuCgpSZWdhcmRzLApDSwoKPiAgCX0KPiAgfQo+ICAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
