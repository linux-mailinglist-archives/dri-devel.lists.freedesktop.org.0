Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6F222D1
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 11:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5E8894A7;
	Sat, 18 May 2019 09:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73416897D4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 09:56:29 +0000 (UTC)
X-UUID: b5bc3861df2b4e7b979e490bdd0d5d0e-20190518
X-UUID: b5bc3861df2b4e7b979e490bdd0d5d0e-20190518
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1214317223; Sat, 18 May 2019 17:56:26 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 18 May 2019 17:56:24 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 18 May 2019 17:56:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 Kumar Gala <galak@codeaurora.org>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v4 2/5] drm/mediatek: dpi dual edge support
Date: Sat, 18 May 2019 17:56:15 +0800
Message-ID: <20190518095618.18454-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518095618.18454-1-jitao.shi@mediatek.com>
References: <20190518095618.18454-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
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
LmMgfCAxMyArKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCmluZGV4IDIyZTY4YTEw
MGU3Yi4uY2NlZjNhYzFjNTYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKQEAgLTEx
Nyw2ICsxMTcsNyBAQCBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsKIAl1bnNpZ25lZCBpbnQgKCpjYWxf
ZmFjdG9yKShpbnQgY2xvY2spOwogCXUzMiByZWdfaF9mcmVfY29uOwogCWJvb2wgZWRnZV9zZWxf
ZW47CisJYm9vbCBkdWFsX2VkZ2U7CiB9OwogCiBzdGF0aWMgdm9pZCBtdGtfZHBpX21hc2soc3Ry
dWN0IG10a19kcGkgKmRwaSwgdTMyIG9mZnNldCwgdTMyIHZhbCwgdTMyIG1hc2spCkBAIC0zNTMs
NiArMzU0LDEzIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX2Rpc2FibGVfZWRnZShzdHJ1
Y3QgbXRrX2RwaSAqZHBpKQogCQltdGtfZHBpX21hc2soZHBpLCBkcGktPmNvbmYtPnJlZ19oX2Zy
ZV9jb24sIDAsIEVER0VfU0VMX0VOKTsKIH0KIAorc3RhdGljIHZvaWQgbXRrX2RwaV9lbmFibGVf
ZHVhbF9lZGdlKHN0cnVjdCBtdGtfZHBpICpkcGkpCit7CisJbXRrX2RwaV9tYXNrKGRwaSwgRFBJ
X0REUl9TRVRUSU5HLCBERFJfRU4gfCBERFJfNFBIQVNFLAorCQkgICAgIEREUl9FTiB8IEREUl80
UEhBU0UpOworCW10a19kcGlfbWFzayhkcGksIERQSV9PVVRQVVRfU0VUVElORywgRURHRV9TRUws
IEVER0VfU0VMKTsKK30KKwogc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfY29sb3JfZm9ybWF0
KHN0cnVjdCBtdGtfZHBpICpkcGksCiAJCQkJCWVudW0gbXRrX2RwaV9vdXRfY29sb3JfZm9ybWF0
IGZvcm1hdCkKIHsKQEAgLTQ0NCw3ICs0NTIsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfc2V0X2Rp
c3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAogCXBsbF9yYXRlID0gY2xrX2dldF9yYXRl
KGRwaS0+dHZkX2Nsayk7CiAKIAl2bS5waXhlbGNsb2NrID0gcGxsX3JhdGUgLyBmYWN0b3I7Ci0J
Y2xrX3NldF9yYXRlKGRwaS0+cGl4ZWxfY2xrLCB2bS5waXhlbGNsb2NrKTsKKwljbGtfc2V0X3Jh
dGUoZHBpLT5waXhlbF9jbGssCisJCSAgICAgdm0ucGl4ZWxjbG9jayAqIChkcGktPmNvbmYtPmR1
YWxfZWRnZSA/IDIgOiAxKSk7CiAJdm0ucGl4ZWxjbG9jayA9IGNsa19nZXRfcmF0ZShkcGktPnBp
eGVsX2Nsayk7CiAKIAlkZXZfZGJnKGRwaS0+ZGV2LCAiR290ICBQTEwgJWx1IEh6LCBwaXhlbCBj
bG9jayAlbHUgSHpcbiIsCkBAIC01MDksNiArNTE4LDggQEAgc3RhdGljIGludCBtdGtfZHBpX3Nl
dF9kaXNwbGF5X21vZGUoc3RydWN0IG10a19kcGkgKmRwaSwKIAltdGtfZHBpX2NvbmZpZ19jb2xv
cl9mb3JtYXQoZHBpLCBkcGktPmNvbG9yX2Zvcm1hdCk7CiAJbXRrX2RwaV9jb25maWdfMm5faF9m
cmUoZHBpKTsKIAltdGtfZHBpX2NvbmZpZ19kaXNhYmxlX2VkZ2UoZHBpKTsKKwlpZiAoZHBpLT5j
b25mLT5kdWFsX2VkZ2UpCisJCW10a19kcGlfZW5hYmxlX2R1YWxfZWRnZShkcGkpOwogCW10a19k
cGlfc3dfcmVzZXQoZHBpLCBmYWxzZSk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
