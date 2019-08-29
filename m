Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37236A3290
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CA66E2FD;
	Fri, 30 Aug 2019 08:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E1406E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:46 +0000 (UTC)
X-UUID: 6ec99c8b412f4fda9161c5af4b577bbb-20190829
X-UUID: 6ec99c8b412f4fda9161c5af4b577bbb-20190829
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 890832243; Thu, 29 Aug 2019 22:51:41 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:45 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 28/32] drm/mediatek: add connection from OVL_2L0 to RDMA0
Date: Thu, 29 Aug 2019 22:50:50 +0800
Message-ID: <1567090254-15566-29-git-send-email-yongqiang.niu@mediatek.com>
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cgp0aGlzIHBh
dGNoIGFkZCBhZGQgY29ubmVjdGlvbiBmcm9tIE9WTF8yTDAgdG8gUkRNQTAKClNpZ25lZC1vZmYt
Ynk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMTQgKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYwppbmRleCBhYTYxNzNiLi45NDNlMTE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHAuYwpAQCAtMzMsNiArMzMsMTIgQEAKICNkZWZpbmUgRElTUF9SRUdfQ09O
RklHX0RTSV9TRUwJCQkweDA1MAogI2RlZmluZSBESVNQX1JFR19DT05GSUdfRFBJX1NFTAkJCTB4
MDY0CiAKKyNkZWZpbmUgTVQ4MTgzX0RJU1BfT1ZMMF8yTF9NT1VUX0VOCQkweGYwNAorI2RlZmlu
ZSBNVDgxODNfRElTUF9QQVRIMF9TRUxfSU4JCTB4ZjI0CisKKyNkZWZpbmUgT1ZMMF8yTF9NT1VU
X0VOX0RJU1BfUEFUSDAJCQlCSVQoMCkKKyNkZWZpbmUgRElTUF9QQVRIMF9TRUxfSU5fT1ZMMF8y
TAkJCTB4MQorCiAjZGVmaW5lIE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwCQkJMHgyYwogI2RlZmlu
ZSBNVDI3MDFfRElTUF9NVVRFWDBfU09GMAkJCTB4MzAKIApAQCAtMzA3LDYgKzMxMywxMCBAQCBz
dGF0aWMgdW5zaWduZWQgaW50IG10a19kZHBfbW91dF9lbihjb25zdCBzdHJ1Y3QgbXRrX21tc3lz
X3JlZ19kYXRhICpkYXRhLAogCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfT1ZMMCAm
JiBuZXh0ID09IEREUF9DT01QT05FTlRfT1ZMXzJMMCkgewogCQkqYWRkciA9IGRhdGEtPm92bDBf
bW91dF9lbjsKIAkJdmFsdWUgPSBPVkwwX01PVVRfRU5fT1ZMMF8yTDsKKwl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX09WTF8yTDAgJiYKKwkJICAgbmV4dCA9PSBERFBfQ09NUE9ORU5U
X1JETUEwKSB7CisJCSphZGRyID0gTVQ4MTgzX0RJU1BfT1ZMMF8yTF9NT1VUX0VOOworCQl2YWx1
ZSA9IE9WTDBfMkxfTU9VVF9FTl9ESVNQX1BBVEgwOwogCX0gZWxzZSB7CiAJCXZhbHVlID0gMDsK
IAl9CkBAIC0zNjYsNiArMzc2LDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9zZWxf
aW4oY29uc3Qgc3RydWN0IG10a19tbXN5c19yZWdfZGF0YSAqZGF0YSwKIAl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX0JMUyAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFNJMCkgewog
CQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19EU0lfU0VMOwogCQl2YWx1ZSA9IERTSV9TRUxfSU5f
QkxTOworCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfT1ZMXzJMMCAmJgorCQkgICBu
ZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTApIHsKKwkJKmFkZHIgPSBNVDgxODNfRElTUF9QQVRI
MF9TRUxfSU47CisJCXZhbHVlID0gRElTUF9QQVRIMF9TRUxfSU5fT1ZMMF8yTDsKIAl9IGVsc2Ug
ewogCQl2YWx1ZSA9IDA7CiAJfQotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
