Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5568F10CC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 09:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACFA6EC2F;
	Wed,  6 Nov 2019 08:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 45CEE6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 08:09:46 +0000 (UTC)
X-UUID: cb4bfc46303644d28d72331928dd26c6-20191106
X-UUID: cb4bfc46303644d28d72331928dd26c6-20191106
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1322703159; Wed, 06 Nov 2019 16:09:40 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 6 Nov 2019 16:09:35 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 6 Nov 2019 16:09:34 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/mediatek: fine tune the dsi panel's power sequence
Date: Wed, 6 Nov 2019 16:09:30 +0800
Message-ID: <20191106080930.11770-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106080930.11770-1-jitao.shi@mediatek.com>
References: <20191106080930.11770-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 10C086CDD7795C509CC7530EE98B1755EADDB402A10C1DD5A67B25E6781D7C252000:8
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

QWRkIHRoZSBkcm1fcGFuZWxfcHJlcGFyZV9wb3dlciBhbmQgZHJtX3BhbmVsX3VucHJlcGFyZV9w
b3dlciBjb250cm9sLgpUdXJuIG9uIHBhbmVsIHBvd2VyKGRybV9wYW5lbF9wcmVwYXJlX3Bvd2Vy
KSBhbmQgY29udHJvbCBiZWZvcmUgZHNpCmVuYWJsZS4gQW5kIHRoZW4gZHNpIGVuYWJsZSwgc2Vu
ZCBkY3MgY21kIGluIGRybV9wYW5lbF9wcmVwYXJlLCBsYXN0CnR1cm4gb24gYmFja2xpZ2h0LgoK
U2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxOSArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCAyMjRhZmI2NjY4ODEuLmI2MzU3MjRiMjA5YiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC01NjMsMTAgKzU2MywxNSBAQCBzdGF0
aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogCWRzaS0+ZGF0YV9y
YXRlID0gRElWX1JPVU5EX1VQX1VMTChwaXhlbF9jbG9jayAqIHRvdGFsX2JpdHMsCiAJCQkJCSAg
aHRvdGFsICogZHNpLT5sYW5lcyk7CiAKKwlpZiAoZHNpLT5wYW5lbCkgeworCQlpZiAoZHJtX3Bh
bmVsX3ByZXBhcmVfcG93ZXIoZHNpLT5wYW5lbCkpCisJCQlEUk1fSU5GTygiY2FuJ3QgcHJlcGFy
ZSBwb3dlciB0aGUgcGFuZWxcbiIpOworCX0KKwogCXJldCA9IGNsa19zZXRfcmF0ZShkc2ktPmhz
X2NsaywgZHNpLT5kYXRhX3JhdGUpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIHNldCBkYXRhIHJhdGU6ICVkXG4iLCByZXQpOwotCQlnb3RvIGVycl9yZWZjb3Vu
dDsKKwkJZ290byBlcnJfcHJlcGFyZV9wb3dlcjsKIAl9CiAKIAlwaHlfcG93ZXJfb24oZHNpLT5w
aHkpOwpAQCAtNjA1LDEzICs2MTAsMTggQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vyb24oc3Ry
dWN0IG10a19kc2kgKmRzaSkKIAl9CiAKIAlyZXR1cm4gMDsKKwogZXJyX2Rpc2FibGVfZGlnaXRh
bF9jbGs6CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+ZGlnaXRhbF9jbGspOwogZXJyX2Rp
c2FibGVfZW5naW5lX2NsazoKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5lbmdpbmVfY2xr
KTsKIGVycl9waHlfcG93ZXJfb2ZmOgogCXBoeV9wb3dlcl9vZmYoZHNpLT5waHkpOwotZXJyX3Jl
ZmNvdW50OgorZXJyX3ByZXBhcmVfcG93ZXI6CisJaWYgKGRzaS0+cGFuZWwpIHsKKwkJaWYgKGRy
bV9wYW5lbF91bnByZXBhcmVfcG93ZXIoZHNpLT5wYW5lbCkpCisJCQlEUk1fSU5GTygiQ2FuJ3Qg
dW5wcmVwYXJlIHBvd2VyIHRoZSBwYW5lbFxuIik7CisJfQogCWRzaS0+cmVmY291bnQtLTsKIAly
ZXR1cm4gcmV0OwogfQpAQCAtNjUyLDYgKzY2MiwxMSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bv
d2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+
ZGlnaXRhbF9jbGspOwogCiAJcGh5X3Bvd2VyX29mZihkc2ktPnBoeSk7CisKKwlpZiAoZHNpLT5w
YW5lbCkgeworCQlpZiAoZHJtX3BhbmVsX3VucHJlcGFyZV9wb3dlcihkc2ktPnBhbmVsKSkKKwkJ
CURSTV9JTkZPKCJDYW4ndCB1bnByZXBhcmUgcG93ZXIgdGhlIHBhbmVsXG4iKTsKKwl9CiB9CiAK
IHN0YXRpYyB2b2lkIG10a19vdXRwdXRfZHNpX2VuYWJsZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
