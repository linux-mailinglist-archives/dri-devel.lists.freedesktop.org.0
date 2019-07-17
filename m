Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5446B5FB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 07:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EA66E22A;
	Wed, 17 Jul 2019 05:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A09226E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 05:35:40 +0000 (UTC)
X-UUID: 53bbb227bb8d453680d5355fdfb934ef-20190717
X-UUID: 53bbb227bb8d453680d5355fdfb934ef-20190717
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 693698133; Wed, 17 Jul 2019 13:35:38 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 13:35:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 13:35:36 +0800
Message-ID: <1563341736.29169.15.camel@mtksdaap41>
Subject: Re: [PATCH v4, 12/33] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL
 setting into another use case
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 13:35:36 +0800
In-Reply-To: <1562625253-29254-13-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-13-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9D2280166EF5AA1468B07A64B20AE04654710B0E0A7273E89A21F547161FA5F2000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozMyArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gSGVyZSBpcyB0d28gbW9kaWZpdGlvbiBpbiB0aGlz
IHBhdGNoOgo+IDEuYmxzLT5kcGkwIGFuZCByZG1hMS0+ZHNpIGFyZSBkaWZmZXJlbiB1c2VjYXNl
LAo+IFNwbGl0IERJU1BfUkVHX0NPTkZJR19EU0lfU0VMIHNldHRpbmcgaW50byBhbnRoZXIgdXNl
Y2FzZQo+IDIucmVtb3ZlIERJU1BfUkVHX0NPTkZJR19EUElfU0VMIHNldHRpbmcsIERQSV9TRUxf
SU5fQkxTIGlzIDAgYW5kCj4gdGhpcyBpcyBzYW1lIHdpdGggaGFyZHdhcmUgZGVmYXV0bCBzZXR0
aW5nLAo+IAoKWW91IG1vdmUgMiByZWdpc3RlciBzZXR0aW5nIG91dCBvZiB0aGUgcGF0aCBmcm9t
IEJMUyB0byBEUEkwLCBkb2VzIHRoaXMKcGF0aCBzdGlsbCB3b3JrPyBQbGVhc2UgbWFrZSBzdXJl
IHRoYXQgYWxsIG1vZGlmaWNhdGlvbiBjb3VsZCB3b3JrIG9uCmFsbCBzdXBwb3J0ZWQgU29DLgoK
UmVnYXJkcywKQ0sKCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5p
dUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXgg
ZDAxNWMxYS4uNDdiM2UzNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cC5jCj4gQEAgLTQwMCwxMCArNDAwLDkgQEAgc3RhdGljIHZvaWQgbXRrX2RkcF9zb3V0X3NlbCh2
b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzLAo+ICAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBP
TkVOVF9CTFMgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQSTApIHsKPiAgCQl3cml0ZWxfcmVs
YXhlZChCTFNfVE9fRFBJX1JETUExX1RPX0RTSSwKPiAgCQkJICAgICAgIGNvbmZpZ19yZWdzICsg
RElTUF9SRUdfQ09ORklHX09VVF9TRUwpOwo+ICsJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBP
TkVOVF9SRE1BMSAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFNJMCkgewo+ICAJCXdyaXRlbF9y
ZWxheGVkKERTSV9TRUxfSU5fUkRNQSwKPiAgCQkJICAgICAgIGNvbmZpZ19yZWdzICsgRElTUF9S
RUdfQ09ORklHX0RTSV9TRUwpOwo+IC0JCXdyaXRlbF9yZWxheGVkKERQSV9TRUxfSU5fQkxTLAo+
IC0JCQkgICAgICAgY29uZmlnX3JlZ3MgKyBESVNQX1JFR19DT05GSUdfRFBJX1NFTCk7Cj4gIAl9
Cj4gIH0KPiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
