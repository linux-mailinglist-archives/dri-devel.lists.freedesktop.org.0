Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A443410F85C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 08:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0CB6E3B7;
	Tue,  3 Dec 2019 07:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB3616E3B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:10:42 +0000 (UTC)
X-UUID: 4ef2affdf10645c6b07bcdbd02f305b2-20191203
X-UUID: 4ef2affdf10645c6b07bcdbd02f305b2-20191203
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 851114653; Tue, 03 Dec 2019 15:10:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 15:10:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Dec 2019 15:10:20 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 4/6] drm/mediatek: remove unused external function
Date: Tue, 3 Dec 2019 15:10:34 +0800
Message-ID: <20191203071036.14158-5-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
References: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1r+UsnH1G/Cjf6k9hcifXRG1NUK52vTics2/q0qiWz0=; 
 b=BwcOnIKITl8DKBgw7ZhWTqy6HFkvbvwE3m10ebrBIk1o6Up1A63EIAx3MCEFfshoO3HqIefUg20ZbM4/+FKSUQfB6f+8lO6a9UrKwIMV+OeK4PWhR19gfIJFjgKZwHSB+o36gzfgcgN2M5YfG/j/UogWpMxWqVL9cieBrZ3UB3Y=;
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bGF5ZXJfb24gYW5kIGxheWVyX29mZiBib3RoIGFyZSB1bnVzZWQgZXh0ZXJuYWwgZnVuY3Rpb24s
DQpyZW1vdmUgdGhlbSBmcm9tIG10a19kZHBfY29tcF9mdW5jcyBzdHJ1Y3R1cmUuDQoNClNpZ25l
ZC1vZmYtYnk6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwgIDIgLS0NCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgMTYgLS0tLS0tLS0tLS0t
LS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCmluZGV4IDcyMmE1YWRiNzlkYy4uOGEzMjI0ODY3MWMz
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCkBAIC0zMTQsOCAr
MzE0LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgbXRrX2Rpc3Bf
b3ZsX2Z1bmNzID0gew0KIAkuZGlzYWJsZV92YmxhbmsgPSBtdGtfb3ZsX2Rpc2FibGVfdmJsYW5r
LA0KIAkuc3VwcG9ydGVkX3JvdGF0aW9ucyA9IG10a19vdmxfc3VwcG9ydGVkX3JvdGF0aW9ucywN
CiAJLmxheWVyX25yID0gbXRrX292bF9sYXllcl9uciwNCi0JLmxheWVyX29uID0gbXRrX292bF9s
YXllcl9vbiwNCi0JLmxheWVyX29mZiA9IG10a19vdmxfbGF5ZXJfb2ZmLA0KIAkubGF5ZXJfY2hl
Y2sgPSBtdGtfb3ZsX2xheWVyX2NoZWNrLA0KIAkubGF5ZXJfY29uZmlnID0gbXRrX292bF9sYXll
cl9jb25maWcsDQogCS5iZ2Nscl9pbl9vbiA9IG10a19vdmxfYmdjbHJfaW5fb24sDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgNCmluZGV4IGVjNTVjNzQ4OGNj
My4uNjUzZWYxY2IzNzQ4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaA0KQEAgLTc5LDggKzc5LDYgQEAgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyB7
DQogCXZvaWQgKCpkaXNhYmxlX3ZibGFuaykoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCk7DQog
CXVuc2lnbmVkIGludCAoKnN1cHBvcnRlZF9yb3RhdGlvbnMpKHN0cnVjdCBtdGtfZGRwX2NvbXAg
KmNvbXApOw0KIAl1bnNpZ25lZCBpbnQgKCpsYXllcl9ucikoc3RydWN0IG10a19kZHBfY29tcCAq
Y29tcCk7DQotCXZvaWQgKCpsYXllcl9vbikoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5z
aWduZWQgaW50IGlkeCk7DQotCXZvaWQgKCpsYXllcl9vZmYpKHN0cnVjdCBtdGtfZGRwX2NvbXAg
KmNvbXAsIHVuc2lnbmVkIGludCBpZHgpOw0KIAlpbnQgKCpsYXllcl9jaGVjaykoc3RydWN0IG10
a19kZHBfY29tcCAqY29tcCwNCiAJCQkgICB1bnNpZ25lZCBpbnQgaWR4LA0KIAkJCSAgIHN0cnVj
dCBtdGtfcGxhbmVfc3RhdGUgKnN0YXRlKTsNCkBAIC0xNTEsMjAgKzE0OSw2IEBAIHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgaW50IG10a19kZHBfY29tcF9sYXllcl9ucihzdHJ1Y3QgbXRrX2RkcF9j
b21wICpjb21wKQ0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGlubGluZSB2b2lkIG10a19k
ZHBfY29tcF9sYXllcl9vbihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLA0KLQkJCQkJIHVuc2ln
bmVkIGludCBpZHgpDQotew0KLQlpZiAoY29tcC0+ZnVuY3MgJiYgY29tcC0+ZnVuY3MtPmxheWVy
X29uKQ0KLQkJY29tcC0+ZnVuY3MtPmxheWVyX29uKGNvbXAsIGlkeCk7DQotfQ0KLQ0KLXN0YXRp
YyBpbmxpbmUgdm9pZCBtdGtfZGRwX2NvbXBfbGF5ZXJfb2ZmKHN0cnVjdCBtdGtfZGRwX2NvbXAg
KmNvbXAsDQotCQkJCQkgIHVuc2lnbmVkIGludCBpZHgpDQotew0KLQlpZiAoY29tcC0+ZnVuY3Mg
JiYgY29tcC0+ZnVuY3MtPmxheWVyX29mZikNCi0JCWNvbXAtPmZ1bmNzLT5sYXllcl9vZmYoY29t
cCwgaWR4KTsNCi19DQotDQogc3RhdGljIGlubGluZSBpbnQgbXRrX2RkcF9jb21wX2xheWVyX2No
ZWNrKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsDQogCQkJCQkgICB1bnNpZ25lZCBpbnQgaWR4
LA0KIAkJCQkJICAgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUpDQotLSANCjIuMTguMA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
