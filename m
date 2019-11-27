Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E544410AB6C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36456E1F9;
	Wed, 27 Nov 2019 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB0EF6E1E2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 01:18:04 +0000 (UTC)
X-UUID: b7f63c0ea3f444df859299f8385c2a96-20191127
X-UUID: b7f63c0ea3f444df859299f8385c2a96-20191127
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1307537078; Wed, 27 Nov 2019 09:18:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:17:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 27 Nov 2019 09:17:09 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1, 0/2] drm/mediatek: Fix external display issue 
Date: Wed, 27 Nov 2019 09:17:53 +0800
Message-ID: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0KnhnC91YWzoMubvDqpW4dGN3q1TdTr1bqtKF7j6sHs=; 
 b=Ze3q6IDsVjL7jyl4GaNGizw4ToS7ypxaK92d3NWwCk9H2R/Y2/DvRKCiMJzwz/lGS11OugLHXAzc3lXHbFZALXLIfwNS07llKzbMABAJU563uSP2kbyQ333vekc8v4eFVWHasznsVDgBW8n23t+wGLFh0LQFp8dH8+RfowwPP3M=;
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQoNCkZpeCBl
eHRlcm5hbCBkaXNwbGF5IGlzc3VlDQoNCllvbmdxaWFuZyBOaXUgKDIpOg0KICBkcm0vbWVkaWF0
ZWs6IEZpeHVwIGV4dGVybmFsIGRpc3BsYXkgYmxhY2sgc2NyZWVuIGlzc3VlDQogIGRybS9tZWRp
YXRlazogRml4IGV4dGVybmFsIGRpc3BsYXkgdmJsYW5rIHRpbWVvdXQgaXNzdWUNCg0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAgICAgICAgfCAxNCArKysrKy0tLS0NCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgIHwgNDUgKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5oIHwgMTQgKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25z
KCspLCAxOSBkZWxldGlvbnMoLSkNCg0KLS0gDQoxLjguMS4xLmRpcnR5DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
