Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44C113DE2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB6B6F60D;
	Thu,  5 Dec 2019 09:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADCD06F60D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 09:27:55 +0000 (UTC)
X-UUID: d4888486242747fc8d541d5f8a2477c6-20191205
X-UUID: d4888486242747fc8d541d5f8a2477c6-20191205
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2143790850; Thu, 05 Dec 2019 17:27:52 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 17:27:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 5 Dec 2019 17:26:52 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 5/7] drm/mediatek: remove unused external function
Date: Thu, 5 Dec 2019 17:27:47 +0800
Message-ID: <20191205092749.4021-6-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
References: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sT8+poW4EDti9+9WpBz/VV2F6sEiz5U6298aIszT21w=; 
 b=gkiabQWxPxWYD8F5BmkvGXmiJysOuGrLedcLsPNv10+zRrAEHwClWXZ9tsFB7Wkz0TtuNnnMylTcyFd/J2woQsHqO4U7DKITgiBW5NCEBw9Y9VHkOvMBJiMkZQQjfwVvXiwBpWtIYaNhtzZoXvnryZ1LAf5thAqMeRF+eyFiPpk=;
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
ZC1vZmYtYnk6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+DQpSZXZpZXdl
ZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAgfCAgMiAtLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAxNiAtLS0tLS0tLS0tLS0tLS0tDQogMiBmaWxlcyBj
aGFuZ2VkLCAxOCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYw0KaW5kZXggNzIyYTVhZGI3OWRjLi44YTMyMjQ4NjcxYzMgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KQEAgLTMxNCw4ICszMTQsNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBtdGtfZGlzcF9vdmxfZnVuY3MgPSB7DQog
CS5kaXNhYmxlX3ZibGFuayA9IG10a19vdmxfZGlzYWJsZV92YmxhbmssDQogCS5zdXBwb3J0ZWRf
cm90YXRpb25zID0gbXRrX292bF9zdXBwb3J0ZWRfcm90YXRpb25zLA0KIAkubGF5ZXJfbnIgPSBt
dGtfb3ZsX2xheWVyX25yLA0KLQkubGF5ZXJfb24gPSBtdGtfb3ZsX2xheWVyX29uLA0KLQkubGF5
ZXJfb2ZmID0gbXRrX292bF9sYXllcl9vZmYsDQogCS5sYXllcl9jaGVjayA9IG10a19vdmxfbGF5
ZXJfY2hlY2ssDQogCS5sYXllcl9jb25maWcgPSBtdGtfb3ZsX2xheWVyX2NvbmZpZywNCiAJLmJn
Y2xyX2luX29uID0gbXRrX292bF9iZ2Nscl9pbl9vbiwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuaA0KaW5kZXggMTlhOTU1YWIwNzQ4Li5kYmZiOTBlOWI5Y2Yg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5o
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oDQpAQCAt
ODEsOCArODEsNiBAQCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIHsNCiAJdm9pZCAoKnVucHJl
cGFyZSkoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCk7DQogCXVuc2lnbmVkIGludCAoKnN1cHBv
cnRlZF9yb3RhdGlvbnMpKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApOw0KIAl1bnNpZ25lZCBp
bnQgKCpsYXllcl9ucikoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCk7DQotCXZvaWQgKCpsYXll
cl9vbikoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCk7DQotCXZv
aWQgKCpsYXllcl9vZmYpKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBp
ZHgpOw0KIAlpbnQgKCpsYXllcl9jaGVjaykoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwNCiAJ
CQkgICB1bnNpZ25lZCBpbnQgaWR4LA0KIAkJCSAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnN0
YXRlKTsNCkBAIC0xNjUsMjAgKzE2Myw2IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IG10
a19kZHBfY29tcF9sYXllcl9ucihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQ0KIAlyZXR1cm4g
MDsNCiB9DQogDQotc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9sYXllcl9vbihzdHJ1
Y3QgbXRrX2RkcF9jb21wICpjb21wLA0KLQkJCQkJIHVuc2lnbmVkIGludCBpZHgpDQotew0KLQlp
ZiAoY29tcC0+ZnVuY3MgJiYgY29tcC0+ZnVuY3MtPmxheWVyX29uKQ0KLQkJY29tcC0+ZnVuY3Mt
PmxheWVyX29uKGNvbXAsIGlkeCk7DQotfQ0KLQ0KLXN0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRw
X2NvbXBfbGF5ZXJfb2ZmKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsDQotCQkJCQkgIHVuc2ln
bmVkIGludCBpZHgpDQotew0KLQlpZiAoY29tcC0+ZnVuY3MgJiYgY29tcC0+ZnVuY3MtPmxheWVy
X29mZikNCi0JCWNvbXAtPmZ1bmNzLT5sYXllcl9vZmYoY29tcCwgaWR4KTsNCi19DQotDQogc3Rh
dGljIGlubGluZSBpbnQgbXRrX2RkcF9jb21wX2xheWVyX2NoZWNrKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXAsDQogCQkJCQkgICB1bnNpZ25lZCBpbnQgaWR4LA0KIAkJCQkJICAgc3RydWN0IG10
a19wbGFuZV9zdGF0ZSAqc3RhdGUpDQotLSANCjIuMTguMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
