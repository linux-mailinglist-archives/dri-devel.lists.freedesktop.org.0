Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC3113DE9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DE96F618;
	Thu,  5 Dec 2019 09:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id F077A6F60E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 09:27:54 +0000 (UTC)
X-UUID: eb2fe78382c244a4997707a24d5447dc-20191205
X-UUID: eb2fe78382c244a4997707a24d5447dc-20191205
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 661074995; Thu, 05 Dec 2019 17:27:52 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 17:27:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 5 Dec 2019 17:26:51 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 0/7] drm/mediatek: fix cursor issue and apply CMDQ in MTK
 DRM
Date: Thu, 5 Dec 2019 17:27:42 +0800
Message-ID: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Mfj8Y6YTw3EDfpHo6edh0JvT0lYIs6tmM5slQk6lfwc=; 
 b=JjEk321sniFpSc5vUqdWWbs/WGnJMADMz2LHHJFoVea00QuEk8j576j4V4gX4TvGTApMAhJ9RP7g6sAU0zDf0wPH3P+N9CFBTPfbH5LWrbfxp1cJYUnFFMneBEl54E8syywNy/xzaPVv8UOBl6Ek+9mSYGAdnhIPnLuFD/CH3rs=;
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

VGhlIENNRFEgKENvbW1hbmQgUXVldWUpIGluIE1UODE4MyBpcyB1c2VkIHRvIGhlbHAgdXBkYXRl
IGFsbA0KcmVsZXZhbnQgZGlzcGxheSBjb250cm9sbGVyIHJlZ2lzdGVycyB3aXRoIGNyaXRpY2Fs
IHRpbWUgbGltYXRpb24uDQpUaGlzIHBhdGNoIGFkZCBjbWRxIGludGVyZmFjZSBpbiBkZHBfY29t
cCBpbnRlcmZhY2UsIGxldCBhbGwNCmRkcF9jb21wIGludGVyZmFjZSBjYW4gc3VwcG9ydCBjcHUv
Y21kcSBmdW5jdGlvbiBhdCB0aGUgc2FtZSB0aW1lLg0KDQpUaGVzZSBwYXRjaGVzIGFsc28gY2Fu
IGZpeHVwIGN1cnNvciBtb3ZpbmcgaXMgbm90IHNtb290aA0Kd2hlbiBoZWF2eSBsb2FkIGluIHdl
YmdsLg0KDQpUaGlzIHBhdGNoIGRlcGVuZHMgb24gcHRhY2g6DQphZGQgZHJtIHN1cHBvcnQgZm9y
IE1UODE4Mw0KKGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExMjE1MTkvKQ0K
c3VwcG9ydCBnY2Ugb24gbXQ4MTgzIHBsYXRmb3JtDQooaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9jb3Zlci8xMTI1NTE0NykNCmRybS9tZWRpYXRlazogUmVmYWN0b3IgcGxhbmUgaW5pdC9j
aGVjayBhbmQgc3VwcG9ydCByb3RhdGlvbg0KKGh0dHBzOi8vcHctZW1lcmlsLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNjkwMTUvKQ0KZHJtL21lZGlhdGVrOiBDaGVjayByZXR1cm4gdmFsdWUgb2Yg
bXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUNCihodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvMTE1NDUxNy8pDQoNCkNoYW5nZXMgc2luY2UgdjM6DQogLSByZW1vdmUgcmVk
dW5kYW50IGNvZGUgYW5kIHZhcmlhYmxlDQoNCkNoYW5nZXMgc2luY2UgdjI6DQogLSBtb3ZlIHNv
bWUgY2hhbmdlcyB0byBhbm90aGVyIHBhdGNoDQogLSBkaXNhYmxlIGxheWVyIGluIGF0b21pY19k
aXNhYmxlKCkNCg0KQ2hhbmdlcyBzaW5jZSB2MToNCiAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0K
IC0gbWVyZ2UgdGhlIGR1cGxpY2F0ZSBjb2RlDQogLSB1c2UgYXN5bmMgaW5zdGVhZCBvZiBjdXJz
b3INCg0KQ2hhbmdlcyBzaW5jZSB2MDoNCiAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0KIC0gcmVt
b3ZlIHBhdGNoDQogICAiZHJtL21lZGlhdGVrOiBmaXggYXRvbWljX3N0YXRlIHJlZmVyZW5jZSBj
b3VudGluZyINCiAgIEFmdGVyIHJlbW92ZSB0aGlzIHBhdGNoLCB0aGUgaXNzdWUgd2UgbWV0IGJl
Zm9yZSBpcyBnb25lLg0KICAgU28gSSBkbyBub3QgYWRkIGFueSBleHRyYSBjb2RlIHRvIGRvIHNv
bWV0aGluZy4NCg0KQmliYnkgSHNpZWggKDcpOg0KICBkcm0vbWVkaWF0ZWs6IHVzZSBEUk0gY29y
ZSdzIGF0b21pYyBjb21taXQgaGVscGVyDQogIGRybS9tZWRpYXRlazogaGFuZGxlIGV2ZW50cyB3
aGVuIGVuYWJsaW5nL2Rpc2FibGluZyBjcnRjDQogIGRybS9tZWRpYXRlazogdXBkYXRlIGN1cnNv
cnMgYnkgdXNpbmcgYXN5bmMgYXRvbWljIHVwZGF0ZQ0KICBkcm0vbWVkaWF0ZWs6IGRpc2FibGUg
YWxsIHRoZSBwbGFuZXMgaW4gYXRvbWljX2Rpc2FibGUNCiAgZHJtL21lZGlhdGVrOiByZW1vdmUg
dW51c2VkIGV4dGVybmFsIGZ1bmN0aW9uDQogIGRybS9tZWRpYXRlazogc3VwcG9ydCBDTURRIGlu
dGVyZmFjZSBpbiBkZHAgY29tcG9uZW50DQogIGRybS9tZWRpYXRlazogYXBwbHkgQ01EUSBjb250
cm9sIGZsb3cNCg0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jICAg
fCAgIDcgKy0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwg
IDY3ICsrKystLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAg
ICB8ICA0MyArKy0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAg
ICAgfCAxNjUgKysrKysrKysrKysrKysrKy0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmggICAgIHwgICAyICsNCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jIHwgMTMyICsrKysrKysrKysrKy0tLS0NCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgIDQ3ICsrKy0tLQ0KIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAgODYgKy0tLS0tLS0tLQ0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAgIDcgLQ0KIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgICAgfCAgNDcgKysrKysrDQogZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuaCAgICB8ICAgMiArDQogMTEgZmlsZXMgY2hh
bmdlZCwgMzgxIGluc2VydGlvbnMoKyksIDIyNCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjE4LjAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
