Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D4EB0ADA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C2F6EC7D;
	Thu, 12 Sep 2019 09:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDF826EC7D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:04:16 +0000 (UTC)
X-UUID: 23f7e77c5ff4483fa440867fbf5572ec-20190912
X-UUID: 23f7e77c5ff4483fa440867fbf5572ec-20190912
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1012836636; Thu, 12 Sep 2019 17:04:10 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 12 Sep 2019 17:04:09 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 12 Sep 2019 17:04:07 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] dt-bindings: display: Add documentation for innolux,
 p097pfg_ssd2858 panel
Date: Thu, 12 Sep 2019 17:04:03 +0800
Message-ID: <20190912090404.89822-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912090404.89822-1-jitao.shi@mediatek.com>
References: <20190912090404.89822-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A2AD4E9B5BC67489BF1EE305EB0FD902920C5B2551B08E2811322EF05B87C9822000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIGlubm9sdXgscDA5N3BmZyBwYW5lbCB3aXRoIGJy
aWRnZSBjaGlwCnNzZDI4NTguCgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBt
ZWRpYXRlay5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvaW5ub2x1eCxwMDk3cGZnX3NzZDI4
NTgudHh0IHwgMzkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LHAwOTdwZmdfc3NkMjg1OC50eHQKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5v
bHV4LHAwOTdwZmdfc3NkMjg1OC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LHAwOTdwZmdfc3NkMjg1OC50eHQKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi40Y2U1NWU4ODlhZDIKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5v
bHV4LHAwOTdwZmdfc3NkMjg1OC50eHQKQEAgLTAsMCArMSwzOSBAQAorU1NEMjg1OCBicmlkZ2Ug
KyBJbm5vbHV4IFAwOTdQRkcgOS43IiAxNTM2eDIwNDggVEZUIExDRCBwYW5lbAorCitSZXF1aXJl
ZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImlubm9sdXgscDA5N3BmZ19z
c2QyODU4IgorLSByZWc6IERTSSB2aXJ0dWFsIGNoYW5uZWwgb2YgdGhlIHBlcmlwaGVyYWwKKy0g
YXZkZC1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHBhbmVs
IHBvc2l0aXZlIHZvbHRhZ2UKKy0gYXZlZS1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRv
ciB0aGF0IHByb3ZpZGVzIHBhbmVsIG5lZ2F0aXZlIHZvbHRhZ2UKKy0gcHAxODAwLXN1cHBseTog
cGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcGFuZWwgMS44ViBJTyBwb3dl
cgorLSBwcDMzMDAtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRl
cyBzc2QyODU4IDMuM1YgVVJBTSBwb3dlcgorLSBwcDEyMDAtYnJpZGdlLXN1cHBseTogcGhhbmRs
ZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgc3NkMjg1OCAxLjJWIGNvcmUgcG93ZXIK
Ky0gdmRkaW8tYnJpZGdlLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJv
dmlkZXMgc3NkMjg1OCAxLjhWIElPIHBvd2VyCistIGVuYWJsZS1ncGlvczogcGFuZWwgZW5hYmxl
IGdwaW8KKworT3B0aW9uYWwgcHJvcGVydGllczoKKy0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRo
ZSBiYWNrbGlnaHQgZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbAorCitFeGFtcGxlOgorCisJ
JmRzaTAgeworCQlwYW5lbDogcGFuZWxAMCB7CisJCQljb21wYXRpYmxlID0gImlubm9sdXgscDA5
N3BmZ19zc2QyODU4IjsKKwkJCXJlZyA9IDwwPjsKKwkJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1
IDAgJnBpbyA3MyAwPjsKKwkJCWF2ZGQtc3VwcGx5ID0gPC4uLj47CisJCQlhdmVlLXN1cHBseSA9
IDwuLi4+OworCQkJcHAxODAwLXN1cHBseSA9IDwuLi4+OworCQkJcHAzMzAwLXN1cHBseSA9IDwu
Li4+OworCQkJcHAxMjAwLWJyaWRnZS1zdXBwbHkgPSA8Li4uPjsKKwkJCXZkZGlvLWJyaWRnZS1z
dXBwbHkgPSA8Li4uPjsKKwkJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworCQkJc3Rh
dHVzID0gIm9rYXkiOworCQkJcG9ydCB7CisJCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKworCX07
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
