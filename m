Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7CB3363
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D316E0E0;
	Mon, 16 Sep 2019 02:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id C4D0D6E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:30:28 +0000 (UTC)
X-UUID: 7c80d2b7c4eb44afa2af2701a38bad7b-20190916
X-UUID: 7c80d2b7c4eb44afa2af2701a38bad7b-20190916
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1217469425; Mon, 16 Sep 2019 10:29:50 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Sep 2019 10:29:46 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Sep 2019 10:29:45 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/8] add driver for boe, tv101wum-nl6, boe, tv101wum-n53,
 auo, kd101n80-45na and auo, b101uan08.3 panels
Date: Mon, 16 Sep 2019 10:29:33 +0800
Message-ID: <20190916022941.15404-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2383DF5C1B7A65AC387BB84E774E25DA2CBF0E84ADC564254AA45A1F6C629A0B2000:8
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

Q2hhbmdlcyBzaW5jZSB2NDoKIC0gYWRkIGF1byxiMTAxdWFuMDguMyBwYW5lbCBmb3IgdGhpcyBk
cml2ZXIuCiAtIGFkZCBib2UsdHYxMDF3dW0tbjUzIHBhbmVsIGZvciB0aGlzIGRyaXZlci4KCkNo
YW5nZXMgc2luY2UgdjM6CiAtIHJlbW92ZSBjaGVjayBlbmFibGVfZ3Bpby4KIC0gZmluZSB0dW5l
IHRoZSBhdW8sa2QxMDFuODAtNDVuYSBwYW5lbCdzIHBvd2VyIG9uIHRpbWluZy4KCkNoYW5nZXMg
c2luY2UgdjI6CiAtIGNvcnJlY3QgdGhlIHBhbmVsIHNpemUKIC0gcmVtb3ZlIGJsYW5rIGxpbmUg
aW4gS2NvbmZpZwogLSBtb3ZlIGF1byxrZDEwMW44MC00NW5hIHBhbmVsIGRyaXZlciBpbiB0aGlz
IHNlcmllcy4KCkNoYW5nZXMgc2luY2UgdjE6CgogLSB1cGRhdGUgdHlwbyBubDYgLT4gbjE2Lgog
LSB1cGRhdGUgbmV3IHBhbmVsIGNvbmZpZyBhbmQgbWFrZWZpbGUgYXJlIGFkZGVkIGluIGFscGhh
YmV0aWNhbGx5IG9yZGVyLgogLSBhZGQgdGhlIHBhbmVsIG1vZGUgYW5kIHBhbmVsIGluZm8gaW4g
ZHJpdmVyIGRhdGEuCiAtIG1lcmdlIGF1byxrZDEwMW44MC00NWEgYW5kIGJvZSx0djEwMXd1bS1u
bDYgaW4gb25lIGRyaXZlcgoKSml0YW8gU2hpICg4KToKICBkdC1iaW5kaW5nczogZGlzcGxheTog
cGFuZWw6IEFkZCBCT0UgdHYxMDF3dW0tbjE2IHBhbmVsIGJpbmRpbmdzCiAgZHJtL3BhbmVsOiBz
dXBwb3J0IGZvciBCT0UgdHYxMDF3dW0tbmw2IHd1eGdhIGRzaSB2aWRlbyBtb2RlIHBhbmVsCiAg
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBhZGQgYXVvIGtkMTAxbjgwLTQ1bmEgcGFuZWwg
YmluZGluZ3MKICBkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIGF1byxrZDEwMW44MC00NW5hIHd1eGdh
IGRzaSB2aWRlbyBtb2RlIHBhbmVsCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBhZGQg
Ym9lIHR2MTAxd3VtLW41MyBwYW5lbCBkb2N1bWVudGF0aW9uCiAgZHJtL3BhbmVsOiBzdXBwb3J0
IGZvciBib2UsdHYxMDF3dW0tbjUzIHd1eGdhIGRzaSB2aWRlbyBtb2RlIHBhbmVsCiAgZHQtYmlu
ZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBhZGQgQVVPIGF1byxiMTAxdWFuMDguMyBwYW5lbAogICAg
ZG9jdW1lbnRhdGlvbgogIGRybS9wYW5lbDogc3VwcG9ydCBmb3IgYXVvLGIxMDF1YW4wOC4zIHd1
eGdhIGRzaSB2aWRlbyBtb2RlIHBhbmVsCgogLi4uL2Rpc3BsYXkvcGFuZWwvYXVvLGIxMDF1YW4w
OC4zLnR4dCAgICAgICAgIHwgIDM0ICsKIC4uLi9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00
NW5hLnR4dCAgICAgICB8ICAzNCArCiAuLi4vZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbjUz
LnR4dCAgICAgICAgfCAgMzQgKwogLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50
eHQgICAgICAgIHwgIDM0ICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAg
ICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgfCAgIDEgKwogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5j
ICAgIHwgODc2ICsrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMDIyIGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMudHh0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtk
MTAxbjgwLTQ1bmEudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41My50eHQKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9ib2UsdHYxMDF3dW0tbmw2LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
