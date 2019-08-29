Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440DA3280
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7226E2C1;
	Fri, 30 Aug 2019 08:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A4E86E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:41 +0000 (UTC)
X-UUID: 50cf0dda74f04036bb74e4ba2ac22677-20190829
X-UUID: 50cf0dda74f04036bb74e4ba2ac22677-20190829
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1361445733; Thu, 29 Aug 2019 22:51:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:30 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 26/32] drm/mediatek: add connection from RDMA0 to COLOR0
Date: Thu, 29 Aug 2019 22:50:48 +0800
Message-ID: <1567090254-15566-27-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTAgdG8gQ09MT1IwCgpTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4
IDQyYTEzMGEuLjAzYTQ2ZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5j
CkBAIC0xNzEsNiArMTcxLDggQEAgc3RydWN0IG10a19kZHAgewogCiBzdHJ1Y3QgbXRrX21tc3lz
X3JlZ19kYXRhIHsKIAl1MzIgb3ZsMF9tb3V0X2VuOworCXUzMiByZG1hMF9zb3V0X3NlbF9pbjsK
Kwl1MzIgcmRtYTBfc291dF9jb2xvcjA7CiAJdTMyIHJkbWExX3NvdXRfc2VsX2luOwogCXUzMiBy
ZG1hMV9zb3V0X2RwaTA7CiAJdTMyIGRwaTBfc2VsX2luOwpAQCAtNDI4LDYgKzQzMCw5IEBAIHN0
YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9zb3V0X3NlbChjb25zdCBzdHJ1Y3QgbXRrX21tc3lz
X3JlZ19kYXRhICpkYXRhLAogCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfUkRNQTIg
JiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTMpIHsKIAkJKmFkZHIgPSBESVNQX1JFR19DT05G
SUdfRElTUF9SRE1BMl9TT1VUOwogCQl2YWx1ZSA9IFJETUEyX1NPVVRfRFNJMzsKKwl9IGVsc2Ug
aWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEwICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9D
T0xPUjApIHsKKwkJKmFkZHIgPSBkYXRhLT5yZG1hMF9zb3V0X3NlbF9pbjsKKwkJdmFsdWUgPSBk
YXRhLT5yZG1hMF9zb3V0X2NvbG9yMDsKIAl9IGVsc2UgewogCQl2YWx1ZSA9IDA7CiAJfQotLSAK
MS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
