Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B13B630D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539D66EF18;
	Wed, 18 Sep 2019 12:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EE216EF17
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:24:45 +0000 (UTC)
X-UUID: b3c0ac18cef64d22b2c299599505bf80-20190918
X-UUID: b3c0ac18cef64d22b2c299599505bf80-20190918
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 267279714; Wed, 18 Sep 2019 20:24:36 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 18 Sep 2019 20:24:28 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 18 Sep 2019 20:24:28 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/8] dt-bindings: display: panel: Add BOE tv101wum-n16
 panel bindings
Date: Wed, 18 Sep 2019 20:24:15 +0800
Message-ID: <20190918122422.17339-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918122422.17339-1-jitao.shi@mediatek.com>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24918.004
X-TM-AS-Result: No-2.926200-8.000000-10
X-TMASE-MatchedRID: g25QWLQyM7sib7FbSDtRQ+w8wbnnSw8bPz+fM/byAtnfUZT83lbkEEZU
 qiaZ+o8nezYFSWzv4Aj++vFBYLLFFVE/ARLVFdXa71Wx2uUbPLfaCn4DqCiXNtGSMbwNT3aHNKC
 Fv+lwDDLSPFW/oJh/H4uawHNYVmzLbvzOyKQsPmDJ/bVh4iw9hg/o5bNHEsCT2BYnl9ycTo//Oc
 v2O9Epcqc/H7BUHe1qYxInQdYCzLe+L9dc5lmniijX0ag3hagYOYqKF7UrYh4b0rRLX3vtcFNc7
 vkHlfZ4JxT2+5OcJYqN6fDbnTu0nx8TzIzimOwPFnjKVTYbDMDEQdG7H66TyJ8TMnmE+d0ZYaI6
 7ainkb9LLo/6pJpqUuLKSVM7BWEXUKbHgJS5XNDhk8cFThWH/Y6VcldSdIpNdY2ihywWXnP25Bt
 HS3nmyndkUzTrfJs4nkZgNaqizbL2z+v/HlGkuMCaqSgwpYR4eYa+lS0uTdBWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.926200-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24918.004
X-TM-SNTS-SMTP: 445996B6962CBE90720169803D19D7D918F3B1E5E46F20EFBA10854ABFE31E302000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIGJvZSB0djEwMXd1bS1uMTYgcGFuZWwuCgpTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2
MTAxd3VtLW5sNi55YW1sICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDY3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zMWQzOTQwNTQxODEKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYx
MDF3dW0tbmw2LnlhbWwKQEAgLTAsMCArMSw2NyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwjCiskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEJPRSBU
VjEwMVdVTS1ObDYgRFNJIERpc3BsYXkgUGFuZWwKKworbWFpbnRhaW5lcnM6CisgIC0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKyAgLSBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CisgIC0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KKyAK
K3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgICAgIGNvbnN0OiBib2UsdHYxMDF3dW0t
bmw2CisKKyAgcmVnOgorICAgIGRlc2NyaXB0aW9uOiB0aGUgdmlydHVhbCBjaGFubmVsIG51bWJl
ciBvZiBhIERTSSBwZXJpcGhlcmFsCisKKyAgZW5hYmxlLWdwaW9zOgorICAgIGRlc2NyaXB0aW9u
OiBhIEdQSU8gc3BlYyBmb3IgdGhlIGVuYWJsZSBwaW4KKworICBwcDE4MDAtc3VwcGx5OgorICAg
IGRlc2NyaXB0aW9uOiBjb3JlIHZvbHRhZ2Ugc3VwcGx5CisKKyAgYXZkZC1zdXBwbHk6CisgICAg
ZGVzY3JpcHRpb246IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHBvc2l0
aXZlIHZvbHRhZ2UKKworICBhdmVlLXN1cHBseToKKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSBv
ZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgbmVnYXRpdmUgdm9sdGFnZQorCisgIGJhY2ts
aWdodDoKKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRldmljZSBh
dHRhY2hlZCB0byB0aGUgcGFuZWwKKworcmVxdWlyZWQ6CisgLSBjb21wYXRpYmxlCisgLSByZWcK
KyAtIGVuYWJsZS1ncGlvcworIC0gcHAxODAwLXN1cHBseQorIC0gYXZkZC1zdXBwbHkKKyAtIGF2
ZWUtc3VwcGx5CisgLSBiYWNrbGlnaHQKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisK
K2V4YW1wbGVzOgorICAtIHwKKyAgICAmZHNpIHsKKyAgICAgICAgcGFuZWxAMCB7CisgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImJvZSx0djEwMXd1bS1ubDYiOworICAgICAgICAgICAgcmVnID0g
PDA+OworICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZwaW8gNDUgMD47CisgICAgICAgICAg
ICBhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47CisgICAgICAgICAgICBhdmVlLXN1cHBseSA9
IDwmcHB2YXJwX2xjZD47CisgICAgICAgICAgICBwcDE4MDAtc3VwcGx5ID0gPCZwcDE4MDBfbGNk
PjsKKyAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworICAgICAgICAg
ICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgcG9ydCB7CisgICAgICAgICAgICAgICAg
cGFuZWxfaW46IGVuZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZkc2lfb3V0PjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgfTsKKyAgICAg
ICAgfTsKKyAgICB9OworCisuLi4KXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
