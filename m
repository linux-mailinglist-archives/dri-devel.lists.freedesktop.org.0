Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A284449
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 08:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088506E610;
	Wed,  7 Aug 2019 06:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2019 06:08:14 UTC
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B8CD6E60C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 06:08:14 +0000 (UTC)
X-UUID: 11cca7c1d3254cfcbab6bebdd5996c88-20190807
X-UUID: 11cca7c1d3254cfcbab6bebdd5996c88-20190807
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 202368417; Wed, 07 Aug 2019 14:03:09 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 14:03:07 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 14:03:06 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 3/4] drm/mediatek: add mt8183 dpi clock factor
Date: Wed, 7 Aug 2019 14:02:56 +0800
Message-ID: <20190807060257.57007-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190807060257.57007-1-jitao.shi@mediatek.com>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0C390326424C10AA3C3085083CFE39619D6B7E7D496F7D7C048FF37BC493A5D52000:8
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZhY3RvciBkZXBlbmRzIG9uIHRoZSBkaXZpZGVyIG9mIERQSSBpbiBNVDgxODMsIHRoZXJl
Zm9yZSwKd2Ugc2hvdWxkIGZpeCB0aGlzIGZhY3RvciB0byB0aGUgcmlnaHQgYW5kIG5ldyBvbmUu
CgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDE4ICsrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwppbmRleCA3NDMyMzA4NjRiYTAuLjRmMjcwMGNiZmRiNyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jCkBAIC02NzIsNiArNjcyLDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
bXQyNzAxX2NhbGN1bGF0ZV9mYWN0b3IoaW50IGNsb2NrKQogCQlyZXR1cm4gMTsKIH0KIAorc3Rh
dGljIHVuc2lnbmVkIGludCBtdDgxODNfY2FsY3VsYXRlX2ZhY3RvcihpbnQgY2xvY2spCit7CisJ
aWYgKGNsb2NrIDw9IDI3MDAwKQorCQlyZXR1cm4gODsKKwllbHNlIGlmIChjbG9jayA8PSAxNjcw
MDApCisJCXJldHVybiA0OworCWVsc2UKKwkJcmV0dXJuIDI7Cit9CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gewogCS5jYWxfZmFjdG9yID0gbXQ4MTcz
X2NhbGN1bGF0ZV9mYWN0b3IsCiAJLnJlZ19oX2ZyZV9jb24gPSAweGUwLApAQCAtNjgzLDYgKzY5
MywxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDI3MDFfY29uZiA9IHsK
IAkuZWRnZV9zZWxfZW4gPSB0cnVlLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBp
X2NvbmYgbXQ4MTgzX2NvbmYgPSB7CisJLmNhbF9mYWN0b3IgPSBtdDgxODNfY2FsY3VsYXRlX2Zh
Y3RvciwKKwkucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCit9OworCiBzdGF0aWMgaW50IG10a19kcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2OwpAQCAtNzc5LDYgKzc5NCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG10a19kcGlfb2ZfaWRzW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxNzMtZHBpIiwKIAkgIC5kYXRhID0gJm10ODE3M19jb25mLAogCX0sCisJeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZHBpIiwKKwkgIC5kYXRhID0gJm10ODE4M19jb25m
LAorCX0sCiAJeyB9LAogfTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
