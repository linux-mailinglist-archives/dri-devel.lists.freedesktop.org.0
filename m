Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4BA2FEF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179056E0F0;
	Fri, 30 Aug 2019 06:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 499706E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:30:59 +0000 (UTC)
X-UUID: b911d93b8a8d4f329b4c8b0c92d915fa-20190830
X-UUID: b911d93b8a8d4f329b4c8b0c92d915fa-20190830
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1160289486; Fri, 30 Aug 2019 14:30:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:30:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:30:53 +0800
Message-ID: <1567146647.5942.19.camel@mtksdaap41>
Subject: Re: [PATCH v5, 28/32] drm/mediatek: add connection from OVL_2L0 to
 RDMA0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:30:47 +0800
In-Reply-To: <1567090254-15566-29-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-29-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4CE476717C2C671C40EAF66D9332FFD3A6FB89C3A2A75C9C0B564E557C4AD3FA2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gdGhpcyBwYXRjaCBhZGQgYWRkIGNvbm5lY3Rpb24g
ZnJvbSBPVkxfMkwwIHRvIFJETUEwCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cC5jIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+IGluZGV4IGFhNjE3
M2IuLjk0M2UxMTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+
IEBAIC0zMyw2ICszMywxMiBAQAo+ICAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19EU0lfU0VMCQkJ
MHgwNTAKPiAgI2RlZmluZSBESVNQX1JFR19DT05GSUdfRFBJX1NFTAkJCTB4MDY0Cj4gIAo+ICsj
ZGVmaW5lIE1UODE4M19ESVNQX09WTDBfMkxfTU9VVF9FTgkJMHhmMDQKPiArI2RlZmluZSBNVDgx
ODNfRElTUF9QQVRIMF9TRUxfSU4JCTB4ZjI0Cj4gKwo+ICsjZGVmaW5lIE9WTDBfMkxfTU9VVF9F
Tl9ESVNQX1BBVEgwCQkJQklUKDApCj4gKyNkZWZpbmUgRElTUF9QQVRIMF9TRUxfSU5fT1ZMMF8y
TAkJCTB4MQo+ICsKPiAgI2RlZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMAkJCTB4MmMKPiAg
I2RlZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfU09GMAkJCTB4MzAKPiAgCj4gQEAgLTMwNyw2ICsz
MTMsMTAgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oY29uc3Qgc3RydWN0
IG10a19tbXN5c19yZWdfZGF0YSAqZGF0YSwKPiAgCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01Q
T05FTlRfT1ZMMCAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfT1ZMXzJMMCkgewo+ICAJCSphZGRy
ID0gZGF0YS0+b3ZsMF9tb3V0X2VuOwo+ICAJCXZhbHVlID0gT1ZMMF9NT1VUX0VOX09WTDBfMkw7
Cj4gKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX09WTF8yTDAgJiYKPiArCQkgICBu
ZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTApIHsKPiArCQkqYWRkciA9IE1UODE4M19ESVNQX09W
TDBfMkxfTU9VVF9FTjsKPiArCQl2YWx1ZSA9IE9WTDBfMkxfTU9VVF9FTl9ESVNQX1BBVEgwOwo+
ICAJfSBlbHNlIHsKPiAgCQl2YWx1ZSA9IDA7Cj4gIAl9Cj4gQEAgLTM2Niw2ICszNzYsMTAgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX3NlbF9pbihjb25zdCBzdHJ1Y3QgbXRrX21tc3lz
X3JlZ19kYXRhICpkYXRhLAo+ICAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9CTFMg
JiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTApIHsKPiAgCQkqYWRkciA9IERJU1BfUkVHX0NP
TkZJR19EU0lfU0VMOwo+ICAJCXZhbHVlID0gRFNJX1NFTF9JTl9CTFM7Cj4gKwl9IGVsc2UgaWYg
KGN1ciA9PSBERFBfQ09NUE9ORU5UX09WTF8yTDAgJiYKPiArCQkgICBuZXh0ID09IEREUF9DT01Q
T05FTlRfUkRNQTApIHsKPiArCQkqYWRkciA9IE1UODE4M19ESVNQX1BBVEgwX1NFTF9JTjsKPiAr
CQl2YWx1ZSA9IERJU1BfUEFUSDBfU0VMX0lOX09WTDBfMkw7Cj4gIAl9IGVsc2Ugewo+ICAJCXZh
bHVlID0gMDsKPiAgCX0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
