Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05983DCE76
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 03:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFDC6E2EF;
	Mon,  2 Aug 2021 01:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id B898D6E2ED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 01:07:23 +0000 (UTC)
X-UUID: 1ac4f3155ac048c998e356738c65294b-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0OuvSL9YCQ725++uK9eQoWxM7t8Cdfu/TqI3dYjN9Z8=; 
 b=DZBb6RnnqsAvN1UI7eIonmulgPvDO131YxWYmnsFV0R/T0E+bGlcmDHET0V8VYFIxDdbMlGHgFJhOPZMiPC+oR95ikyo1ynkCN3Mg/0pC0yI3JHuq9iYc0MmrXceSGBTWSMX7VQKzur5rfjrRZyAwKiDymUI9UOp6OlN0yBNiRU=;
X-UUID: 1ac4f3155ac048c998e356738c65294b-20210802
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1639547395; Mon, 02 Aug 2021 09:07:19 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 2 Aug 2021 09:07:13 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 2 Aug 2021 09:07:13 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 0/2] force hsa hbp hfp packets multiple of lanenum to avoid
 screen shift 
Date: Mon, 2 Aug 2021 09:07:09 +0800
Message-ID: <20210802010711.169080-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: DACDD96C008E7593C8B1363FF108A32B915E6E623A57F10BB73FB09D193EF5002000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlcyBzaW5jZSB2NDoNCiAtIE1vdmUgImR0LWJpbmRpbmdzOiBkcm0vYnJpZGdlOiBhbng3
NjI1OiBhZGQgZm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwiIGJlZm9yZQ0KICAgImRybS9tZWRp
YXRlazogZm9yY2UgaHNhIGhicCBoZnAgcGFja2V0cyBtdWx0aXBsZSBvZiBsYW5lbnVtIHRvIGF2
b2lkIi4NCg0KIC0gUmV0aXRsZSAiZHQtYmluZGluZ3M6IGRybS9icmlkZ2U6IGFueDc2MjU6IGFk
ZCBmb3JjZV9kc2lfZW5kX3dpdGhvdXRfbnVsbCIuDQoNCg0KSml0YW8gU2hpICgyKToNCiAgZHQt
YmluZGluZ3M6IGRybS9icmlkZ2U6IGFueDc2MjU6IGFkZCBmb3JjZV9kc2lfZW5kX3dpdGhvdXRf
bnVsbA0KICBkcm0vbWVkaWF0ZWs6IGZvcmNlIGhzYSBoYnAgaGZwIHBhY2tldHMgbXVsdGlwbGUg
b2YgbGFuZW51bSB0byBhdm9pZA0KICAgIHNjcmVlbiBzaGlmdA0KDQogLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2FuYWxvZ2l4LGFueDc2MjUueWFtbCAgIHwgIDYgKysrKysrDQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysr
KysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KDQotLSANCjIuMjUu
MQ0K

