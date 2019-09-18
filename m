Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AEB6309
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859626EF16;
	Wed, 18 Sep 2019 12:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF7BB6EF15
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:24:35 +0000 (UTC)
X-UUID: ceaf95881f31479ea99cadeabc7693a5-20190918
X-UUID: ceaf95881f31479ea99cadeabc7693a5-20190918
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 411472176; Wed, 18 Sep 2019 20:24:26 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 18 Sep 2019 20:24:23 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 18 Sep 2019 20:24:22 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/8] add driver for "boe, tv101wum-nl6", "boe, tv101wum-n53",
 "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Date: Wed, 18 Sep 2019 20:24:14 +0800
Message-ID: <20190918122422.17339-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3D3638C9865A7E2EAAD19D70A1240530FBA96708D19439D0F3519DFF0DE5CAEA2000:8
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

Q2hhbmdlcyBzaW5jZSB2NToKIC0gY292ZXJ0IHRoZSBkb2N1bWVudHMgdG8geWFtbAogLSBmaW5l
IHR1bmUgYm9lLCB0djEwMXd1bS1uNTMgcGFuZWwgdmlkZW8gdGltaW5lCgpDaGFuZ2VzIHNpbmNl
IHY0OgogLSBhZGQgYXVvLGIxMDF1YW4wOC4zIHBhbmVsIGZvciB0aGlzIGRyaXZlci4KIC0gYWRk
IGJvZSx0djEwMXd1bS1uNTMgcGFuZWwgZm9yIHRoaXMgZHJpdmVyLgoKQ2hhbmdlcyBzaW5jZSB2
MzoKIC0gcmVtb3ZlIGNoZWNrIGVuYWJsZV9ncGlvLgogLSBmaW5lIHR1bmUgdGhlIGF1byxrZDEw
MW44MC00NW5hIHBhbmVsJ3MgcG93ZXIgb24gdGltaW5nLgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0g
Y29ycmVjdCB0aGUgcGFuZWwgc2l6ZQogLSByZW1vdmUgYmxhbmsgbGluZSBpbiBLY29uZmlnCiAt
IG1vdmUgYXVvLGtkMTAxbjgwLTQ1bmEgcGFuZWwgZHJpdmVyIGluIHRoaXMgc2VyaWVzLgoKQ2hh
bmdlcyBzaW5jZSB2MToKCiAtIHVwZGF0ZSB0eXBvIG5sNiAtPiBuMTYuCiAtIHVwZGF0ZSBuZXcg
cGFuZWwgY29uZmlnIGFuZCBtYWtlZmlsZSBhcmUgYWRkZWQgaW4gYWxwaGFiZXRpY2FsbHkgb3Jk
ZXIuCiAtIGFkZCB0aGUgcGFuZWwgbW9kZSBhbmQgcGFuZWwgaW5mbyBpbiBkcml2ZXIgZGF0YS4K
IC0gbWVyZ2UgYXVvLGtkMTAxbjgwLTQ1YSBhbmQgYm9lLHR2MTAxd3VtLW5sNiBpbiBvbmUgZHJp
dmVyCgpKaXRhbyBTaGkgKDgpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbDogQWRkIEJP
RSB0djEwMXd1bS1uMTYgcGFuZWwgYmluZGluZ3MKICBkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIEJP
RSB0djEwMXd1bS1ubDYgd3V4Z2EgZHNpIHZpZGVvIG1vZGUgcGFuZWwKICBkdC1iaW5kaW5nczog
ZGlzcGxheTogcGFuZWw6IGFkZCBhdW8ga2QxMDFuODAtNDVuYSBwYW5lbCBiaW5kaW5ncwogIGRy
bS9wYW5lbDogc3VwcG9ydCBmb3IgYXVvLGtkMTAxbjgwLTQ1bmEgd3V4Z2EgZHNpIHZpZGVvIG1v
ZGUgcGFuZWwKICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IGFkZCBib2UgdHYxMDF3dW0t
bjUzIHBhbmVsIGRvY3VtZW50YXRpb24KICBkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIGJvZSx0djEw
MXd1bS1uNTMgd3V4Z2EgZHNpIHZpZGVvIG1vZGUgcGFuZWwKICBkdC1iaW5kaW5nczogZGlzcGxh
eTogcGFuZWw6IGFkZCBBVU8gYXVvLGIxMDF1YW4wOC4zIHBhbmVsCiAgICBkb2N1bWVudGF0aW9u
CiAgZHJtL3BhbmVsOiBzdXBwb3J0IGZvciBhdW8sYjEwMXVhbjA4LjMgd3V4Z2EgZHNpIHZpZGVv
IG1vZGUgcGFuZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMueWFtbCAgICAg
ICAgfCAgNjcgKysKIC4uLi9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnlhbWwgICAg
ICB8ICA2NyArKwogLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41My55YW1sICAgICAg
IHwgIDY3ICsrCiAuLi4vZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwgICAgICAg
fCAgNjcgKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8
ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAg
IDEgKwogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jICAgIHwgODc2
ICsrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMTU0IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00
NW5hLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbjUzLnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2Us
dHYxMDF3dW0tbmw2LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
