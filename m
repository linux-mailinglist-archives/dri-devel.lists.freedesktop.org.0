Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FDC36CD8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F71895E1;
	Thu,  6 Jun 2019 07:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766C5898CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:12 +0000 (UTC)
X-UUID: 7d3d3c32a6974ecaba8ed0b3e3d30f1e-20190605
X-UUID: 7d3d3c32a6974ecaba8ed0b3e3d30f1e-20190605
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 794206093; Wed, 05 Jun 2019 19:43:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:57 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 24/27] drm/mediatek: add connection from RDMA0 to COLOR0
Date: Wed, 5 Jun 2019 19:43:03 +0800
Message-ID: <1559734986-7379-25-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 717D9759EF384F207F34662BAC61A623A0D163772F5D90CAACA60FEA58BAFD452000:8
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTAgdG8gQ09MT1IwCgpTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwppbmRleCBm
OTgwODI2Li5hZGFmYTQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwpA
QCAtNDQ5LDYgKzQ0OSw5IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9zb3V0X3NlbChj
b25zdCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhICpkYXRhLAogCX0gZWxzZSBpZiAoY3VyID09
IEREUF9DT01QT05FTlRfUkRNQTIgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTMpIHsKIAkJ
KmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMl9TT1VUOwogCQl2YWx1ZSA9IFJETUEy
X1NPVVRfRFNJMzsKKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEwICYmIG5l
eHQgPT0gRERQX0NPTVBPTkVOVF9DT0xPUjApIHsKKwkJKmFkZHIgPSBESVNQX1JFR19SRE1BMF9T
T1VUX1NFTF9JTihkYXRhKTsKKwkJdmFsdWUgPSBESVNQX1JFR19SRE1BMF9TT1VUX0NPTE9SMChk
YXRhKTsKIAl9IGVsc2UgewogCQl2YWx1ZSA9IDA7CiAJfQotLSAKMS44LjEuMS5kaXJ0eQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
