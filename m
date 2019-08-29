Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A506A3287
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840AB6E2E5;
	Fri, 30 Aug 2019 08:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E1B86E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:46 +0000 (UTC)
X-UUID: 1995da472f0c4038a56e76ec16161743-20190829
X-UUID: 1995da472f0c4038a56e76ec16161743-20190829
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2134901890; Thu, 29 Aug 2019 22:51:41 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:45 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 29/32] drm/mediatek: add connection from OVL_2L1 to RDMA1
Date: Thu, 29 Aug 2019 22:50:51 +0800
Message-ID: <1567090254-15566-30-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gT1ZMXzJMMSB0byBSRE1BMQoKU2lnbmVkLW9mZi1ieTog
WW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5k
ZXggOTQzZTExNC4uMjM3ODI0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmMKQEAgLTM0LDkgKzM0LDExIEBACiAjZGVmaW5lIERJU1BfUkVHX0NPTkZJR19EUElfU0VMCQkJ
MHgwNjQKIAogI2RlZmluZSBNVDgxODNfRElTUF9PVkwwXzJMX01PVVRfRU4JCTB4ZjA0CisjZGVm
aW5lIE1UODE4M19ESVNQX09WTDFfMkxfTU9VVF9FTgkJMHhmMDgKICNkZWZpbmUgTVQ4MTgzX0RJ
U1BfUEFUSDBfU0VMX0lOCQkweGYyNAogCiAjZGVmaW5lIE9WTDBfMkxfTU9VVF9FTl9ESVNQX1BB
VEgwCQkJQklUKDApCisjZGVmaW5lIE9WTDFfMkxfTU9VVF9FTl9SRE1BMQkJCQlCSVQoNCkKICNk
ZWZpbmUgRElTUF9QQVRIMF9TRUxfSU5fT1ZMMF8yTAkJCTB4MQogCiAjZGVmaW5lIE1UMjcwMV9E
SVNQX01VVEVYMF9NT0QwCQkJMHgyYwpAQCAtMzE3LDYgKzMxOSwxMCBAQCBzdGF0aWMgdW5zaWdu
ZWQgaW50IG10a19kZHBfbW91dF9lbihjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhICpk
YXRhLAogCQkgICBuZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTApIHsKIAkJKmFkZHIgPSBNVDgx
ODNfRElTUF9PVkwwXzJMX01PVVRfRU47CiAJCXZhbHVlID0gT1ZMMF8yTF9NT1VUX0VOX0RJU1Bf
UEFUSDA7CisJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9PVkxfMkwxICYmCisJCSAg
IG5leHQgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgeworCQkqYWRkciA9IE1UODE4M19ESVNQX09W
TDFfMkxfTU9VVF9FTjsKKwkJdmFsdWUgPSBPVkwxXzJMX01PVVRfRU5fUkRNQTE7CiAJfSBlbHNl
IHsKIAkJdmFsdWUgPSAwOwogCX0KLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
