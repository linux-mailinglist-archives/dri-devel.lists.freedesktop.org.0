Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F8847FD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 10:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DF189CF9;
	Wed,  7 Aug 2019 08:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E8896E6A1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 08:47:13 +0000 (UTC)
X-UUID: 641bf1ff151045afb9b53c008c4837f9-20190807
X-UUID: 641bf1ff151045afb9b53c008c4837f9-20190807
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1689623142; Wed, 07 Aug 2019 16:46:54 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 16:46:48 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 16:46:46 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/3] Support mipitx for mt8183
Date: Wed, 7 Aug 2019 16:46:42 +0800
Message-ID: <20190807084645.63738-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24828.001
X-TM-AS-Result: No-6.934100-8.000000-10
X-TMASE-MatchedRID: angWuI+ZklDHO8eAxCOj9iAI8aJmq0jwEypq3q87aEEL9Tj77wy87Pib
 PPdYWnRM+F2zlPAdpe6A45NLifUOpj3qUaC7D/bC/1dEgwtQ6NBcaNB/u5yQq8z/SxKo9mJ4NHw
 BAGIh28uVta6x57a42xw8w8GZWTrwoqClLVAxl2VDiyuN5FvFNj+k5IvvZ1N/mvnco5r4a3OjxY
 yRBa/qJcFwgTvxipFajoczmuoPCq1guV9FslmIPhw7K8UtBQeEp3IVzZN0+VdcN1xZFcfLHXIs9
 fkcQeBP
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.934100-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24828.001
X-TM-SNTS-SMTP: 64327E99D620C0FC25FBF80F2165C701713A62B3F7AA8C8E730E2B111128E7202000:8
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

Q2hhbmdlIHNpbmNlIHY1OgogLSByZW1vdmUgbWlwaV90eC0+cmVmX2NsawogLSByZW1vdmUgbXQ4
MTgzIHBsbCBwcmVwYXJlIHVucHJlcGFyZQoKQ2hhbmdlIHNpbmNlIHY0OgogLSBmaW5lIHR1bmUg
dGhlIG1pcGlfdHgtPnJlZl9jbGsgYW5kIG1pcGlfdHgtPnBsbCBzZXF1ZW5jZQogICAxLiBQcmVw
YXJlIG1pcGlfdHgtPnJlZl9jbGsKICAgMi4gUHJlcGFyZSBtaXBpX3R4LT5wbGwKICAgMy4gRW5h
YmxlIG1pcGlfdHgtPnJlZl9jbGsKICAgNC4gRW5hYmxlIG1pcGlfdHgtPnBsbAoKQ2hhbmdlcyBz
aW5jZSB2MzoKIC0gdHVybiBvZmYgUExMIGJlZm9yZSBzZXR0aW5nIFBMTCBwYXJhbWV0ZXJzLgoK
Q2hhbmdlcyBzaW5jZSB2MjoKIC0gdXBkYXRlIEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgogLSB1cGRhdGUgbXQ4MTgzIG1heCBiaXQgcmF0ZSBzdXBwb3J0CgpDaGFuZ2Vz
IHNpbmNlIHYxOgogLSB1cGRhdGUgZHQtYmluZGluZ3MgZG9jdW1lbnQgZm9yIG10ODE4MyBtaXBp
dHguCiAtIHJlbW92ZSBtdGtfbWlwaXR4X2Nsa19nZXRfb3BzIGFuZCBhc3NpZ24gY2xrX29wcyBp
biBwcm9iZS4KIC0gZml4IHRoZSBsaW5jZW5jZQogLSByZW1vdmUgdHhkaXYxIGZyb20gbXRrX21p
cGlfdHhfcGxsX3ByZXBhcmUKCkppdGFvIFNoaSAoMyk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6
IG1lZGlhdGVrOiB1cGRhdGUgZHNpIHN1cHBvcnRlZCBjaGlwcwogIGRybS9tZWRpYXRlazogc2Vw
YXJhdGUgbWlwaV90eCB0byBkaWZmZXJlbnQgZmlsZQogIGRybS9tZWRpYXRlazogYWRkIG1pcGlf
dHggZHJpdmVyIGZvciBtdDgxODMKCiAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2ku
dHh0ICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSAg
ICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHgu
YyAgICAgICAgfCAzMzggKystLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX21pcGlfdHguaCAgICAgICAgfCAgNDkgKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX210ODE3M19taXBpX3R4LmMgfCAyODkgKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX210ODE4M19taXBpX3R4LmMgfCAxNTAgKysrKysrKysKIDYgZmls
ZXMgY2hhbmdlZCwgNTE1IGluc2VydGlvbnMoKyksIDMxNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX21pcGlfdHgu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTgz
X21pcGlfdHguYwoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
