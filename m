Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E4D4C4D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239926ECAA;
	Sat, 12 Oct 2019 03:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AC4C6ECAA
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:08:02 +0000 (UTC)
X-UUID: 1a32b68b218847ceb4f1b1f5b84b5d05-20191012
X-UUID: 1a32b68b218847ceb4f1b1f5b84b5d05-20191012
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1503494496; Sat, 12 Oct 2019 11:07:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:07:55 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:07:54 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 6/8] drm/panel: support for boe,
 tv101wum-n53 wuxga dsi video mode panel
Date: Sat, 12 Oct 2019 11:07:18 +0800
Message-ID: <20191012030720.27127-7-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4D629611DAE2BCB5C0460DDC94222343CB9BBCE98EE75388431498F7F4C6D03C2000:8
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

Qm9lLHR2MTAxd3VtLW41MydzIGNvbm5lY3RvciBpcyBzYW1lIGFzIGJvZSx0djEwMXd1bS1ubDYu
ClRoZSBtb3N0IGNvZGVzIGNhbiBiZSByZXVzZS4KU28gYm9lLHR2MTAxd3VtLW41MyBhbmQgYm9l
LHR2MTAxd3VtLW5sNiB1c2Ugb25lIGRyaXZlciBmaWxlLgpBZGQgdGhlIGRpZmZlcmVudCBwYXJ0
cyBpbiBkcml2ZXIgZGF0YS4KClNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1l
ZGlhdGVrLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2
LmMgICAgfCAzMSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYx
MDF3dW0tbmw2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5s
Ni5jCmluZGV4IGU2NDU3Zjg3YmM2MS4uN2I0NzYxOTY3NWY1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKQEAgLTYyNCw2ICs2MjQsMzQgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19rZDEwMW44MF80NW5hX2Rlc2MgPSB7
CiAJLmRpc2NoYXJnZV9vbl9kaXNhYmxlID0gdHJ1ZSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBib2VfdHYxMDF3dW1fbjUzX2RlZmF1bHRfbW9kZSA9IHsKKwku
Y2xvY2sgPSAxNTk4MzMsCisJLmhkaXNwbGF5ID0gMTIwMCwKKwkuaHN5bmNfc3RhcnQgPSAxMjAw
ICsgMTE0LAorCS5oc3luY19lbmQgPSAxMjAwICsgMTE0ICsgMTAsCisJLmh0b3RhbCA9IDEyMDAg
KyAxMTQgKyAxMCArIDQwLAorCS52ZGlzcGxheSA9IDE5MjAsCisJLnZzeW5jX3N0YXJ0ID0gMTky
MCArIDE5LAorCS52c3luY19lbmQgPSAxOTIwICsgMTkgKyA0LAorCS52dG90YWwgPSAxOTIwICsg
MTkgKyA0ICsgMTAsCisJLnZyZWZyZXNoID0gNjAsCisJLnR5cGUgPSBEUk1fTU9ERV9UWVBFX0RS
SVZFUiB8IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVELAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVj
dCBwYW5lbF9kZXNjIGJvZV90djEwMXd1bV9uNTNfZGVzYyA9IHsKKwkubW9kZXMgPSAmYm9lX3R2
MTAxd3VtX241M19kZWZhdWx0X21vZGUsCisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0
aF9tbSA9IDEzNSwKKwkJLmhlaWdodF9tbSA9IDIxNiwKKwl9LAorCS5sYW5lcyA9IDQsCisJLmZv
cm1hdCA9IE1JUElfRFNJX0ZNVF9SR0I4ODgsCisJLm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9NT0RF
X1ZJREVPIHwgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFIHwKKwkJICAgICAgTUlQSV9E
U0lfTU9ERV9MUE0sCisJLmluaXRfY21kcyA9IGJvZV9pbml0X2NtZCwKK307CisKIHN0YXRpYyBp
bnQgYm9lX3BhbmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1
Y3QgYm9lX3BhbmVsICpib2UgPSB0b19ib2VfcGFuZWwocGFuZWwpOwpAQCAtNzUxLDYgKzc3OSw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJvZV9vZl9tYXRjaFtdID0gewog
CXsgLmNvbXBhdGlibGUgPSAiYXVvLGtkMTAxbjgwLTQ1bmEiLAogCSAgLmRhdGEgPSAmYXVvX2tk
MTAxbjgwXzQ1bmFfZGVzYwogCX0sCisJeyAuY29tcGF0aWJsZSA9ICJib2UsdHYxMDF3dW0tbjUz
IiwKKwkgIC5kYXRhID0gJmJvZV90djEwMXd1bV9uNTNfZGVzYworCX0sCiAJeyAvKiBzZW50aW5l
bCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYm9lX29mX21hdGNoKTsKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
