Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5363190
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248B189E3E;
	Tue,  9 Jul 2019 07:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025EB89D84
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:46 +0000 (UTC)
X-UUID: eb0275edc25d4f47bff3358f6b512c54-20190709
X-UUID: eb0275edc25d4f47bff3358f6b512c54-20190709
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 594669150; Tue, 09 Jul 2019 06:34:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:42 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4, 26/33] drm/mediatek: add connection from OVL0 to OVL_2L0
Date: Tue, 9 Jul 2019 06:34:06 +0800
Message-ID: <1562625253-29254-27-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A9D9A6875AB7D251444F2BC595BBE0DAF220F0790664081CB4CC820A90568B4F2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gT1ZMMCB0byBPVkxfMkwwCgpTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4
IGE5ZDNlMjcuLmZlNGE0NTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5j
CkBAIC0xNDUsNiArMTQ1LDggQEAKICNkZWZpbmUgRFBJX1NFTF9JTl9CTFMJCQkweDAKICNkZWZp
bmUgRFNJX1NFTF9JTl9SRE1BCQkJMHgxCiAKKyNkZWZpbmUgT1ZMMF9NT1VUX0VOX09WTDBfMkwJ
CUJJVCg0KQorCiBzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggewogCWludCBpZDsKIAlib29sIGNsYWlt
ZWQ7CkBAIC0zMTAsNiArMzEyLDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRf
ZW4oY29uc3Qgc3RydWN0IG10a19tbXN5c19yZWdfZGF0YSAqZGF0YSwKIAl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX09EMSAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTEpIHsK
IAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9PRF9NT1VUX0VOOwogCQl2YWx1ZSA9IE9E
MV9NT1VUX0VOX1JETUExOworCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfT1ZMMCAm
JiBuZXh0ID09IEREUF9DT01QT05FTlRfT1ZMXzJMMCkgeworCQkqYWRkciA9IGRhdGEtPm92bDBf
bW91dF9lbjsKKwkJdmFsdWUgPSBPVkwwX01PVVRfRU5fT1ZMMF8yTDsKIAl9IGVsc2UgewogCQl2
YWx1ZSA9IDA7CiAJfQotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
