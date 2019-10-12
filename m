Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E210D4C42
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5396E44A;
	Sat, 12 Oct 2019 03:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F7406E44A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:07:39 +0000 (UTC)
X-UUID: f4786114ad30410caee12130dced414c-20191012
X-UUID: f4786114ad30410caee12130dced414c-20191012
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 735632940; Sat, 12 Oct 2019 11:07:32 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:07:30 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:07:29 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/8] add driver for "boe, tv101wum-nl6", "boe, tv101wum-n53",
 "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Date: Sat, 12 Oct 2019 11:07:12 +0800
Message-ID: <20191012030720.27127-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7B07B99A81EF4E5D242E6BC593B327DF1589564B8DF92733C3F20695BD5F6C22000:8
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

Q2hhbmdlcyBzaW5jZSB2NjoKIC0gZml4IGJvZV9wYW5lbF9pbml0IGVyciB1bmluaXQuCiAtIGFk
anVzdCB0aGUgZGVsYXkgb2YgYmFja2xpZ2h0IG9uLgoKQ2hhbmdlcyBzaW5jZSB2NToKIC0gY292
ZXJ0IHRoZSBkb2N1bWVudHMgdG8geWFtbAogLSBmaW5lIHR1bmUgYm9lLCB0djEwMXd1bS1uNTMg
cGFuZWwgdmlkZW8gdGltaW5lCgpDaGFuZ2VzIHNpbmNlIHY0OgogLSBhZGQgYXVvLGIxMDF1YW4w
OC4zIHBhbmVsIGZvciB0aGlzIGRyaXZlci4KIC0gYWRkIGJvZSx0djEwMXd1bS1uNTMgcGFuZWwg
Zm9yIHRoaXMgZHJpdmVyLgoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gcmVtb3ZlIGNoZWNrIGVuYWJs
ZV9ncGlvLgogLSBmaW5lIHR1bmUgdGhlIGF1byxrZDEwMW44MC00NW5hIHBhbmVsJ3MgcG93ZXIg
b24gdGltaW5nLgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gY29ycmVjdCB0aGUgcGFuZWwgc2l6ZQog
LSByZW1vdmUgYmxhbmsgbGluZSBpbiBLY29uZmlnCiAtIG1vdmUgYXVvLGtkMTAxbjgwLTQ1bmEg
cGFuZWwgZHJpdmVyIGluIHRoaXMgc2VyaWVzLgoKQ2hhbmdlcyBzaW5jZSB2MToKCiAtIHVwZGF0
ZSB0eXBvIG5sNiAtPiBuMTYuCiAtIHVwZGF0ZSBuZXcgcGFuZWwgY29uZmlnIGFuZCBtYWtlZmls
ZSBhcmUgYWRkZWQgaW4gYWxwaGFiZXRpY2FsbHkgb3JkZXIuCiAtIGFkZCB0aGUgcGFuZWwgbW9k
ZSBhbmQgcGFuZWwgaW5mbyBpbiBkcml2ZXIgZGF0YS4KIC0gbWVyZ2UgYXVvLGtkMTAxbjgwLTQ1
YSBhbmQgYm9lLHR2MTAxd3VtLW5sNiBpbiBvbmUgZHJpdmVyCgpKaXRhbyBTaGkgKDgpOgogIGR0
LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbDogQWRkIEJPRSB0djEwMXd1bS1uMTYgcGFuZWwgYmlu
ZGluZ3MKICBkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIEJPRSB0djEwMXd1bS1ubDYgd3V4Z2EgZHNp
IHZpZGVvIG1vZGUgcGFuZWwKICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IGFkZCBhdW8g
a2QxMDFuODAtNDVuYSBwYW5lbCBiaW5kaW5ncwogIGRybS9wYW5lbDogc3VwcG9ydCBmb3IgYXVv
LGtkMTAxbjgwLTQ1bmEgd3V4Z2EgZHNpIHZpZGVvIG1vZGUgcGFuZWwKICBkdC1iaW5kaW5nczog
ZGlzcGxheTogcGFuZWw6IGFkZCBib2UgdHYxMDF3dW0tbjUzIHBhbmVsIGRvY3VtZW50YXRpb24K
ICBkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIGJvZSx0djEwMXd1bS1uNTMgd3V4Z2EgZHNpIHZpZGVv
IG1vZGUgcGFuZWwKICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IGFkZCBBVU8gYXVvLGIx
MDF1YW4wOC4zIHBhbmVsCiAgICBkb2N1bWVudGF0aW9uCiAgZHJtL3BhbmVsOiBzdXBwb3J0IGZv
ciBhdW8sYjEwMXVhbjA4LjMgd3V4Z2EgZHNpIHZpZGVvIG1vZGUgcGFuZWwKCiAuLi4vZGlzcGxh
eS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMueWFtbCAgICAgICAgfCAgNjcgKysKIC4uLi9kaXNwbGF5
L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnlhbWwgICAgICB8ICA2NyArKwogLi4uL2Rpc3BsYXkv
cGFuZWwvYm9lLHR2MTAxd3VtLW41My55YW1sICAgICAgIHwgIDY3ICsrCiAuLi4vZGlzcGxheS9w
YW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwgICAgICAgfCAgNjcgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4uL2dwdS9kcm0vcGFuZWwv
cGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jICAgIHwgODgwICsrKysrKysrKysrKysrKysrKwogNyBm
aWxlcyBjaGFuZ2VkLCAxMTU4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4
LjMueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2Us
dHYxMDF3dW0tbjUzLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5s
Ni5jCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
