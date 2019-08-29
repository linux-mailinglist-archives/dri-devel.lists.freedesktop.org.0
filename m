Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88816A327D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D30F6E2DA;
	Fri, 30 Aug 2019 08:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 475B26E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:47 +0000 (UTC)
X-UUID: 1c25f817e5194b6eb26e35502b42783a-20190829
X-UUID: 1c25f817e5194b6eb26e35502b42783a-20190829
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 979713238; Thu, 29 Aug 2019 22:51:40 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:44 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 27/32] drm/mediatek: add connection from RDMA1 to DSI0
Date: Thu, 29 Aug 2019 22:50:49 +0800
Message-ID: <1567090254-15566-28-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 153ED4DEF314535F6FBB21E0469DDEFD4DFF2AEB5E1D4903D17ABFFC52544CB52000:8
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
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTEgdG8gRFNJMAoKU2lnbmVkLW9mZi1ieTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDAz
YTQ2ZWMuLmFhNjE3M2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCkBA
IC0xNzUsNiArMTc1LDcgQEAgc3RydWN0IG10a19tbXN5c19yZWdfZGF0YSB7CiAJdTMyIHJkbWEw
X3NvdXRfY29sb3IwOwogCXUzMiByZG1hMV9zb3V0X3NlbF9pbjsKIAl1MzIgcmRtYTFfc291dF9k
cGkwOworCXUzMiByZG1hMV9zb3V0X2RzaTA7CiAJdTMyIGRwaTBfc2VsX2luOwogCXUzMiBkcGkw
X3NlbF9pbl9yZG1hMTsKIAl1MzIgZHNpMF9zZWxfaW47CkBAIC00MzMsNiArNDM0LDkgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBtdGtfZGRwX3NvdXRfc2VsKGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNf
cmVnX2RhdGEgKmRhdGEsCiAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAm
JiBuZXh0ID09IEREUF9DT01QT05FTlRfQ09MT1IwKSB7CiAJCSphZGRyID0gZGF0YS0+cmRtYTBf
c291dF9zZWxfaW47CiAJCXZhbHVlID0gZGF0YS0+cmRtYTBfc291dF9jb2xvcjA7CisJfSBlbHNl
IGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSAmJiBuZXh0ID09IEREUF9DT01QT05FTlRf
RFNJMCkgeworCQkqYWRkciA9IGRhdGEtPnJkbWExX3NvdXRfc2VsX2luOworCQl2YWx1ZSA9IGRh
dGEtPnJkbWExX3NvdXRfZHNpMDsKIAl9IGVsc2UgewogCQl2YWx1ZSA9IDA7CiAJfQotLSAKMS44
LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
