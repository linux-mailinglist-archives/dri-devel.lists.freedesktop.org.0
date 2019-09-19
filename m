Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E23B73A4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC36F797;
	Thu, 19 Sep 2019 06:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9F956F797
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:59:14 +0000 (UTC)
X-UUID: e843f2ed8a6649b29572e1820e51d043-20190919
X-UUID: e843f2ed8a6649b29572e1820e51d043-20190919
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1232179946; Thu, 19 Sep 2019 14:59:09 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Sep 2019 14:59:05 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 19 Sep 2019 14:59:04 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 6/9] drm/mediatek: add mt8183 dsi driver support
Date: Thu, 19 Sep 2019 14:58:03 +0800
Message-ID: <20190919065806.111016-7-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24920.005
X-TM-AS-Result: No-3.835100-8.000000-10
X-TMASE-MatchedRID: GcRwLfmoPZi/kNGHVZrsliAI8aJmq0jw+eBf9ovw8I1wkdIrVt8X1WMg
 VHfStGn6yq+EWc4ydpqPQi9XuOWoOHI/MxNRI7UkimHWEC28pk19LQinZ4QefPcjNeVeWlqY+gt
 Hj7OwNO25V9z3vqk3KmMCgowKE8/7/gOYfr/FEGQLlGwPip2NW5ZjmmonIWHl4jtFhFZkTeTsoF
 WOvSerxiJ7I5VBd0X82QQPPOsD67CmBMRa3jxCFjVRFqQOddCaSS1+lnt0hidPYUlpz51mHAzEN
 G3sSoPI
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.835100-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24920.005
X-TM-SNTS-SMTP: C74ED7F7EC53A422D410D5F1DCF2DE75EE8FAE019717A107C801E99B7DC8A19E2000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG10ODE4MyBkc2kgZHJpdmVyIGRhdGEuIEVuYWJsZSBzaXplIGNvbnRyb2wgYW5kCnJlZyBj
b21taXQgY29udHJvbC4KClNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlh
dGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCA2
ODc5NGVkZWNmOTYuLmIzNjc2NDI2YWViNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
CkBAIC0xMjI3LDExICsxMjI3LDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2
ZXJfZGF0YSBtdDI3MDFfZHNpX2RyaXZlcl9kYXRhID0gewogCS5yZWdfY21kcV9vZmYgPSAweDE4
MCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDgxODNf
ZHNpX2RyaXZlcl9kYXRhID0geworCS5yZWdfY21kcV9vZmYgPSAweDIwMCwKKwkuaGFzX3NoYWRv
d19jdGwgPSB0cnVlLAorCS5oYXNfc2l6ZV9jdGwgPSB0cnVlLAorfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RzaV9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQyNzAxLWRzaSIsCiAJICAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZl
cl9kYXRhIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiwKIAkgIC5k
YXRhID0gJm10ODE3M19kc2lfZHJpdmVyX2RhdGEgfSwKKwl7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4My1kc2kiLAorCSAgLmRhdGEgPSAmbXQ4MTgzX2RzaV9kcml2ZXJfZGF0YSB9LAog
CXsgfSwKIH07CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
