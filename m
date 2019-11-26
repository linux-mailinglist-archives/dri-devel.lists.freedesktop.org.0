Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25611099FF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716C589F01;
	Tue, 26 Nov 2019 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 26 Nov 2019 06:53:04 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7144F89D9A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 06:53:04 +0000 (UTC)
X-UUID: db699e4521d2452290f4e1aecce9bf05-20191126
X-UUID: db699e4521d2452290f4e1aecce9bf05-20191126
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1907628759; Tue, 26 Nov 2019 14:48:01 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 14:47:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 26 Nov 2019 14:48:23 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1] drm/mediatek: fix up 1440x900 dp display black screen issue
Date: Tue, 26 Nov 2019 14:47:49 +0800
Message-ID: <1574750869-12611-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nJCMS+Zb2KV7c0nSvZbugfFbLOeQLmtQW9fHLXvNcd8=; 
 b=nTmrKgF6DdCMqV6Xarm3fgQ1xcW7h0+fzhjtyUo+Q+xbeAQJcXcLMtTf1xGRSpCLuknPNhAjNVRG0unFJAGAuEV14nwYQYF7F7DSTZ6jJAldnk0iSt5qrqfDgpHFCe78+/a6JhJCD3XbGRtZY6KrC+EA/996YN5RKvlxEjpaetA=;
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQoNClRoaXMg
cGF0Y2ggZml4IHVwIDE0NDB4OTAwIGRwIGRpc3BsYXkgYmxhY2sgc2NyZWVuIGlzc3VlDQp0aGUg
Y29tcHV0ZWQgcmVzdWx0IHdpbGwgb3ZlcmZsb3cgcmRtYTEgZmlmbyBtYXggc2l6ZQ0Kd2hlbiBl
eHRlcm5hbCBkaXNwbGF5IHBpeGVsIGNsb2NrIGJpZ2dlciB0aGFuIDc0TUhaDQoNClNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyB8IDQgKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfcmRtYS5jDQppbmRleCBjMWFiZGUzLi40MTE0M2Y1IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KQEAgLTE1Miw2ICsxNTIsMTAgQEAgc3RhdGljIHZv
aWQgbXRrX3JkbWFfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGlu
dCB3aWR0aCwNCiAJICogYWNjb3VudCBmb3IgYmxhbmtpbmcsIGFuZCB3aXRoIGEgcGl4ZWwgZGVw
dGggb2YgNCBieXRlczoNCiAJICovDQogCXRocmVzaG9sZCA9IHdpZHRoICogaGVpZ2h0ICogdnJl
ZnJlc2ggKiA0ICogNyAvIDEwMDAwMDA7DQorDQorCWlmICh0aHJlc2hvbGQgPiByZG1hX2ZpZm9f
c2l6ZSkNCisJCXRocmVzaG9sZCA9IHJkbWFfZmlmb19zaXplOw0KKw0KIAlyZWcgPSBSRE1BX0ZJ
Rk9fVU5ERVJGTE9XX0VOIHwNCiAJICAgICAgUkRNQV9GSUZPX1BTRVVET19TSVpFKHJkbWFfZmlm
b19zaXplKSB8DQogCSAgICAgIFJETUFfT1VUUFVUX1ZBTElEX0ZJRk9fVEhSRVNIT0xEKHRocmVz
aG9sZCk7DQotLSANCjEuOC4xLjEuZGlydHkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
