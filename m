Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBCD8444B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 08:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FB96E60E;
	Wed,  7 Aug 2019 06:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CE756E60E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 06:08:17 +0000 (UTC)
X-UUID: ba4ccc401ee24e0a9047aba1aa29733c-20190807
X-UUID: ba4ccc401ee24e0a9047aba1aa29733c-20190807
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1362043005; Wed, 07 Aug 2019 14:03:09 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 14:03:06 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 14:03:04 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v5 2/4] drm/mediatek: dpi dual edge support
Date: Wed, 7 Aug 2019 14:02:55 +0800
Message-ID: <20190807060257.57007-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190807060257.57007-1-jitao.shi@mediatek.com>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24828.001
X-TM-AS-Result: No-6.958900-8.000000-10
X-TMASE-MatchedRID: 5H8irtK9vgTNOw9wsvBRo17Sq0XKoGHrCaRI8pL8VGBquuOqohJ0c3A2
 AbalJMe8Rjuuru99Q9KPQi9XuOWoOIR7sjTIC5s2FqifzwY4bVroeKAMszIu5ulYTdF1MvAp0iS
 XG6dWPluphyZbWwq9StRZtMgLgbN9cc6dPoLhQXAgCPGiZqtI8B4huWEfRKfpT9xG+Pmy0/pRGc
 lPBndJbfRd9sFi+YqCQJzrGNjGSjXjadsomdxplAlpVkdtt3WuMwMfB2KMdIdSMUnCl2ZytHuos
 InzuhSMMY05bCyXW0VP3yS7iZW45x8TzIzimOwPC24oEZ6SpSkj80Za3RRg8DUr7wipW/DRv9Tz
 V/M+e3cuNyZlk11DQB2FwpwsASPBwSxytdWZQvg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.958900-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24828.001
X-TM-SNTS-SMTP: AAB794323F590ECD9BADC8D1C3914C072DB54699ABCF169B71BC1870C17B5E272000:8
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

RFBJIHNhbXBsZSB0aGUgZGF0YSBib3RoIHJpc2luZyBhbmQgZmFsbGluZyBlZGdlLgpJdCBjYW4g
cmVkdWNlIGhhbGYgZGF0YSBpbyBwaW5zLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRh
by5zaGlAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMgfCAxNCArKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwppbmRleCBiYWNkOTg5
Y2M5YWEuLjc0MzIzMDg2NGJhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCkBAIC03
Miw2ICs3Miw3IEBAIHN0cnVjdCBtdGtfZHBpIHsKIAllbnVtIG10a19kcGlfb3V0X2JpdF9udW0g
Yml0X251bTsKIAllbnVtIG10a19kcGlfb3V0X2NoYW5uZWxfc3dhcCBjaGFubmVsX3N3YXA7CiAJ
aW50IHJlZmNvdW50OworCWJvb2wgZHVhbF9lZGdlOwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1
Y3QgbXRrX2RwaSAqbXRrX2RwaV9mcm9tX2VuY29kZXIoc3RydWN0IGRybV9lbmNvZGVyICplKQpA
QCAtMzQ1LDYgKzM0NiwxMyBAQCBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19kaXNhYmxlX2Vk
Z2Uoc3RydWN0IG10a19kcGkgKmRwaSkKIAkJbXRrX2RwaV9tYXNrKGRwaSwgZHBpLT5jb25mLT5y
ZWdfaF9mcmVfY29uLCAwLCBFREdFX1NFTF9FTik7CiB9CiAKK3N0YXRpYyB2b2lkIG10a19kcGlf
ZW5hYmxlX2R1YWxfZWRnZShzdHJ1Y3QgbXRrX2RwaSAqZHBpKQoreworCW10a19kcGlfbWFzayhk
cGksIERQSV9ERFJfU0VUVElORywgRERSX0VOIHwgRERSXzRQSEFTRSwKKwkJICAgICBERFJfRU4g
fCBERFJfNFBIQVNFKTsKKwltdGtfZHBpX21hc2soZHBpLCBEUElfT1VUUFVUX1NFVFRJTkcsIEVE
R0VfU0VMLCBFREdFX1NFTCk7Cit9CisKIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX2NvbG9y
X2Zvcm1hdChzdHJ1Y3QgbXRrX2RwaSAqZHBpLAogCQkJCQllbnVtIG10a19kcGlfb3V0X2NvbG9y
X2Zvcm1hdCBmb3JtYXQpCiB7CkBAIC00MzYsNyArNDQ0LDggQEAgc3RhdGljIGludCBtdGtfZHBp
X3NldF9kaXNwbGF5X21vZGUoc3RydWN0IG10a19kcGkgKmRwaSwKIAlwbGxfcmF0ZSA9IGNsa19n
ZXRfcmF0ZShkcGktPnR2ZF9jbGspOwogCiAJdm0ucGl4ZWxjbG9jayA9IHBsbF9yYXRlIC8gZmFj
dG9yOwotCWNsa19zZXRfcmF0ZShkcGktPnBpeGVsX2Nsaywgdm0ucGl4ZWxjbG9jayk7CisJY2xr
X3NldF9yYXRlKGRwaS0+cGl4ZWxfY2xrLAorCQkgICAgIHZtLnBpeGVsY2xvY2sgKiAoZHBpLT5k
dWFsX2VkZ2UgPyAyIDogMSkpOwogCXZtLnBpeGVsY2xvY2sgPSBjbGtfZ2V0X3JhdGUoZHBpLT5w
aXhlbF9jbGspOwogCiAJZGV2X2RiZyhkcGktPmRldiwgIkdvdCAgUExMICVsdSBIeiwgcGl4ZWwg
Y2xvY2sgJWx1IEh6XG4iLApAQCAtNTAxLDYgKzUxMCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9z
ZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCiAJbXRrX2RwaV9jb25maWdfY29s
b3JfZm9ybWF0KGRwaSwgZHBpLT5jb2xvcl9mb3JtYXQpOwogCW10a19kcGlfY29uZmlnXzJuX2hf
ZnJlKGRwaSk7CiAJbXRrX2RwaV9jb25maWdfZGlzYWJsZV9lZGdlKGRwaSk7CisJaWYgKGRwaS0+
ZHVhbF9lZGdlKQorCQltdGtfZHBpX2VuYWJsZV9kdWFsX2VkZ2UoZHBpKTsKIAltdGtfZHBpX3N3
X3Jlc2V0KGRwaSwgZmFsc2UpOwogCiAJcmV0dXJuIDA7CkBAIC02ODYsNiArNjk3LDcgQEAgc3Rh
dGljIGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlk
cGktPmRldiA9IGRldjsKIAlkcGktPmNvbmYgPSAoc3RydWN0IG10a19kcGlfY29uZiAqKW9mX2Rl
dmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOworCWRwaS0+ZHVhbF9lZGdlID0gb2ZfcHJvcGVydHlf
cmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgImRwaV9kdWFsX2VkZ2UiKTsKIAogCW1lbSA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CiAJZHBpLT5yZWdzID0g
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgbWVtKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
