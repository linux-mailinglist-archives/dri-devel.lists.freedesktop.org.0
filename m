Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBE95354
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73AE89DA5;
	Tue, 20 Aug 2019 01:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1D2189CF6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:24:38 +0000 (UTC)
X-UUID: cb8855a77ff1409dbf10cd4290a1de95-20190820
X-UUID: cb8855a77ff1409dbf10cd4290a1de95-20190820
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
 with ESMTP id 1247149086; Tue, 20 Aug 2019 09:24:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 20 Aug 2019 09:24:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 20 Aug 2019 09:24:29 +0800
Message-ID: <1566264270.30493.4.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm fixes for 5.3
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 20 Aug 2019 09:24:30 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 23F0EE08CDB5C7F7271977C097F1F055DAC535E422A77928DA182112381D41192000:8
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsOgoKVGhpcyBpbmNsdWRlIFBSSU1FIGJ1ZmZlciBhbmQgb2Zfbm9kZSBm
aXhlcy4KClJlZ2FyZHMsCkNLCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0CjVm
OWU4MzJjMTM3MDc1MDQ1ZDE1Y2Q2ODk5YWIwNTA1Y2ZiMmNhNGI6CgogIExpbnVzIDUuMy1yYzEg
KDIwMTktMDctMjEgMTQ6MDU6MzggLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVkaWF0ZWsvbGludXguZ2l0
LXRhZ3MKdGFncy9tZWRpYXRlay1kcm0tZml4ZXMtNS4zCgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gMTY1ZDQyYzAxMmJlNjk5MDBmMGUyZjg1NDU2MjZjYjllN2Q0YTgzMjoKCiAgZHJt
L21lZGlhdGVrOiBtdGtfZHJtX2Rydi5jOiBBZGQgb2Zfbm9kZV9wdXQoKSBiZWZvcmUgZ290byAo
MjAxOS0wOC0xOQowNzowOToyOSArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWVkaWF0ZWsgZHJtIGZpeGVzIGZv
ciBMaW51eCA1LjMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGFuZHJlIENvdXJib3QgKDIpOgogICAgICBkcm0vbWVk
aWF0ZWs6IHVzZSBjb3JyZWN0IGRldmljZSB0byBpbXBvcnQgUFJJTUUgYnVmZmVycwogICAgICBk
cm0vbWVkaWF0ZWs6IHNldCBETUEgbWF4IHNlZ21lbnQgc2l6ZQoKTmlzaGthIERhc2d1cHRhICgx
KToKICAgICAgZHJtL21lZGlhdGVrOiBtdGtfZHJtX2Rydi5jOiBBZGQgb2Zfbm9kZV9wdXQoKSBi
ZWZvcmUgZ290bwoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgNTQK
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmggfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
