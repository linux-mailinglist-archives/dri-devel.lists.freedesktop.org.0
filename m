Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3D36CCB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5375B893A2;
	Thu,  6 Jun 2019 07:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0B898E4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:54 +0000 (UTC)
X-UUID: 93aa4686d71f47f599b4189266f5d362-20190605
X-UUID: 93aa4686d71f47f599b4189266f5d362-20190605
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 968858090; Wed, 05 Jun 2019 19:43:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:45 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 10/27] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL setting into
 another use case
Date: Wed, 5 Jun 2019 19:42:49 +0800
Message-ID: <1559734986-7379-11-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 885E57C5E8FF852A3457AEA76957B42EC9D74F3E3D929C3D88535BC78F3703DC2000:8
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpIZXJlIGlz
IHR3byBtb2RpZml0aW9uIGluIHRoaXMgcGF0Y2g6CjEuYmxzLT5kcGkwIGFuZCByZG1hMS0+ZHNp
IGFyZSBkaWZmZXJlbiB1c2VjYXNlLApTcGxpdCBESVNQX1JFR19DT05GSUdfRFNJX1NFTCBzZXR0
aW5nIGludG8gYW50aGVyIHVzZWNhc2UKMi5yZW1vdmUgRElTUF9SRUdfQ09ORklHX0RQSV9TRUwg
c2V0dGluZywgRFBJX1NFTF9JTl9CTFMgaXMgMCBhbmQKdGhpcyBpcyBzYW1lIHdpdGggaGFyZHdh
cmUgZGVmYXV0bCBzZXR0aW5nLAoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggNzE3NjA5
ZC4uMWJiYWJlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAgLTQw
MSwxMCArNDAxLDkgQEAgc3RhdGljIHZvaWQgbXRrX2RkcF9zb3V0X3NlbCh2b2lkIF9faW9tZW0g
KmNvbmZpZ19yZWdzLAogCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfQkxTICYmIG5l
eHQgPT0gRERQX0NPTVBPTkVOVF9EUEkwKSB7CiAJCXdyaXRlbF9yZWxheGVkKEJMU19UT19EUElf
UkRNQTFfVE9fRFNJLAogCQkJICAgICAgIGNvbmZpZ19yZWdzICsgRElTUF9SRUdfQ09ORklHX09V
VF9TRUwpOworCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfUkRNQTEgJiYgbmV4dCA9
PSBERFBfQ09NUE9ORU5UX0RTSTApIHsKIAkJd3JpdGVsX3JlbGF4ZWQoRFNJX1NFTF9JTl9SRE1B
LAogCQkJICAgICAgIGNvbmZpZ19yZWdzICsgRElTUF9SRUdfQ09ORklHX0RTSV9TRUwpOwotCQl3
cml0ZWxfcmVsYXhlZChEUElfU0VMX0lOX0JMUywKLQkJCSAgICAgICBjb25maWdfcmVncyArIERJ
U1BfUkVHX0NPTkZJR19EUElfU0VMKTsKIAl9CiB9CiAKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
