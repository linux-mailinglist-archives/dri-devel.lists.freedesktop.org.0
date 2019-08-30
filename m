Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A70A3002
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FD96E26C;
	Fri, 30 Aug 2019 06:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08C056E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:33:27 +0000 (UTC)
X-UUID: 2c18aaf1f59145dc8d0e20c81d021b6f-20190830
X-UUID: 2c18aaf1f59145dc8d0e20c81d021b6f-20190830
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1475352382; Fri, 30 Aug 2019 14:33:29 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:33:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:33:20 +0800
Message-ID: <1567146794.5942.20.camel@mtksdaap41>
Subject: Re: [PATCH v5, 29/32] drm/mediatek: add connection from OVL_2L1 to
 RDMA1
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:33:14 +0800
In-Reply-To: <1567090254-15566-30-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-30-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C958F218D4F6EF88DB9AEE010F37DC5C18D38A17E42EBB469A761A01513F25C22000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9t
IE9WTF8yTDEgdG8gUkRNQTEKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlh
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMg
fCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBpbmRleCA5NDNlMTE0Li4yMzc4MjRmIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBAQCAtMzQsOSArMzQs
MTEgQEAKPiAgI2RlZmluZSBESVNQX1JFR19DT05GSUdfRFBJX1NFTAkJCTB4MDY0Cj4gIAo+ICAj
ZGVmaW5lIE1UODE4M19ESVNQX09WTDBfMkxfTU9VVF9FTgkJMHhmMDQKPiArI2RlZmluZSBNVDgx
ODNfRElTUF9PVkwxXzJMX01PVVRfRU4JCTB4ZjA4Cj4gICNkZWZpbmUgTVQ4MTgzX0RJU1BfUEFU
SDBfU0VMX0lOCQkweGYyNAo+ICAKPiAgI2RlZmluZSBPVkwwXzJMX01PVVRfRU5fRElTUF9QQVRI
MAkJCUJJVCgwKQo+ICsjZGVmaW5lIE9WTDFfMkxfTU9VVF9FTl9SRE1BMQkJCQlCSVQoNCkKPiAg
I2RlZmluZSBESVNQX1BBVEgwX1NFTF9JTl9PVkwwXzJMCQkJMHgxCj4gIAo+ICAjZGVmaW5lIE1U
MjcwMV9ESVNQX01VVEVYMF9NT0QwCQkJMHgyYwo+IEBAIC0zMTcsNiArMzE5LDEwIEBAIHN0YXRp
YyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9tb3V0X2VuKGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfcmVn
X2RhdGEgKmRhdGEsCj4gIAkJICAgbmV4dCA9PSBERFBfQ09NUE9ORU5UX1JETUEwKSB7Cj4gIAkJ
KmFkZHIgPSBNVDgxODNfRElTUF9PVkwwXzJMX01PVVRfRU47Cj4gIAkJdmFsdWUgPSBPVkwwXzJM
X01PVVRfRU5fRElTUF9QQVRIMDsKPiArCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRf
T1ZMXzJMMSAmJgo+ICsJCSAgIG5leHQgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgewo+ICsJCSph
ZGRyID0gTVQ4MTgzX0RJU1BfT1ZMMV8yTF9NT1VUX0VOOwo+ICsJCXZhbHVlID0gT1ZMMV8yTF9N
T1VUX0VOX1JETUExOwo+ICAJfSBlbHNlIHsKPiAgCQl2YWx1ZSA9IDA7Cj4gIAl9CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
