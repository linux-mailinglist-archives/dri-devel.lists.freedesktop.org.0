Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D7A326D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D896E2C7;
	Fri, 30 Aug 2019 08:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B1026E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:47 +0000 (UTC)
X-UUID: d208ac30a404405d9a90ee7629185990-20190829
X-UUID: d208ac30a404405d9a90ee7629185990-20190829
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1126044740; Thu, 29 Aug 2019 22:51:44 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:47 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 31/32] drm/mediatek: add connection from RDMA0 to DSI0
Date: Thu, 29 Aug 2019 22:50:53 +0800
Message-ID: <1567090254-15566-32-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTAgdG8gRFNJMAoKU2lnbmVkLW9mZi1ieTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IGZk
Mzg2NTguLjZhN2NiMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCkBA
IC00Miw2ICs0Miw3IEBACiAjZGVmaW5lIE9WTDFfMkxfTU9VVF9FTl9SRE1BMQkJCQlCSVQoNCkK
ICNkZWZpbmUgRElUSEVSMF9NT1VUX0lOX0RTSTAJCQkJQklUKDApCiAjZGVmaW5lIERJU1BfUEFU
SDBfU0VMX0lOX09WTDBfMkwJCQkweDEKKyNkZWZpbmUgRFNJMF9TRUxfSU5fUkRNQTAJCQkJMHgx
CiAKICNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgwX01PRDAJCQkweDJjCiAjZGVmaW5lIE1UMjcw
MV9ESVNQX01VVEVYMF9TT0YwCQkJMHgzMApAQCAtMzkxLDYgKzM5Miw5IEBAIHN0YXRpYyB1bnNp
Z25lZCBpbnQgbXRrX2RkcF9zZWxfaW4oY29uc3Qgc3RydWN0IG10a19tbXN5c19yZWdfZGF0YSAq
ZGF0YSwKIAkJICAgbmV4dCA9PSBERFBfQ09NUE9ORU5UX1JETUEwKSB7CiAJCSphZGRyID0gTVQ4
MTgzX0RJU1BfUEFUSDBfU0VMX0lOOwogCQl2YWx1ZSA9IERJU1BfUEFUSDBfU0VMX0lOX09WTDBf
Mkw7CisJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAmJiBuZXh0ID09IERE
UF9DT01QT05FTlRfRFNJMCkgeworCQkqYWRkciA9IGRhdGEtPmRzaTBfc2VsX2luOworCQl2YWx1
ZSA9IERTSTBfU0VMX0lOX1JETUEwOwogCX0gZWxzZSB7CiAJCXZhbHVlID0gMDsKIAl9Ci0tIAox
LjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
