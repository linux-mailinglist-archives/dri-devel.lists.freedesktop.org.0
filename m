Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA0B3364
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D906E0DC;
	Mon, 16 Sep 2019 02:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id C03EE6E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:30:29 +0000 (UTC)
X-UUID: 7ec43d1563134902a6cae9b770f2942f-20190916
X-UUID: 7ec43d1563134902a6cae9b770f2942f-20190916
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 553271483; Mon, 16 Sep 2019 10:30:09 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Sep 2019 10:30:08 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Sep 2019 10:30:07 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 6/8] drm/panel: support for boe,
 tv101wum-n53 wuxga dsi video mode panel
Date: Mon, 16 Sep 2019 10:29:39 +0800
Message-ID: <20190916022941.15404-7-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916022941.15404-1-jitao.shi@mediatek.com>
References: <20190916022941.15404-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 691B241C82C5E82503CD4EDCC7C426F66D34BF386A268BE19FB1C80A2B0ABBA82000:8
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

Qm9lLHR2MTAxd3VtLW41MydzIGNvbm5lY3RvciBpcyBzYW1lIGFzIGJvZSx0djEwMXd1bS1ubDYu
ClRoZSBtb3N0IGNvZGVzIGNhbiBiZSByZXVzZS4KU28gYm9lLHR2MTAxd3VtLW41MyBhbmQgYm9l
LHR2MTAxd3VtLW5sNiB1c2Ugb25lIGRyaXZlciBmaWxlLgpBZGQgdGhlIGRpZmZlcmVudCBwYXJ0
cyBpbiBkcml2ZXIgZGF0YS4KClNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1l
ZGlhdGVrLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2
LmMgICAgfCAzMSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYx
MDF3dW0tbmw2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5s
Ni5jCmluZGV4IGY4MDk3NDc3ODM2MC4uZWFjNDgwYmExOWNjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKQEAgLTYyMSw2ICs2MjEsMzQgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19rZDEwMW44MF80NW5hX2Rlc2MgPSB7
CiAJLmRpc2NoYXJnZV9vbl9kaXNhYmxlID0gdHJ1ZSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBib2VfdHYxMDF3dW1fbjUzX2RlZmF1bHRfbW9kZSA9IHsKKwku
Y2xvY2sgPSAxNTkyNjAsCisJLmhkaXNwbGF5ID0gMTIwMCwKKwkuaHN5bmNfc3RhcnQgPSAxMjAw
ICsgNjAsCisJLmhzeW5jX2VuZCA9IDEyMDAgKyA2MCArIDI0LAorCS5odG90YWwgPSAxMjAwICsg
NjAgKyAyNCArIDgwLAorCS52ZGlzcGxheSA9IDE5MjAsCisJLnZzeW5jX3N0YXJ0ID0gMTkyMCAr
IDE0LAorCS52c3luY19lbmQgPSAxOTIwICsgMTQgKyAyLAorCS52dG90YWwgPSAxOTIwICsgMTQg
KyAyICsgMTAsCisJLnZyZWZyZXNoID0gNjAsCisJLnR5cGUgPSBEUk1fTU9ERV9UWVBFX0RSSVZF
UiB8IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVELAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBw
YW5lbF9kZXNjIGJvZV90djEwMXd1bV9uNTNfZGVzYyA9IHsKKwkubW9kZXMgPSAmYm9lX3R2MTAx
d3VtX241M19kZWZhdWx0X21vZGUsCisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0aF9t
bSA9IDEzNSwKKwkJLmhlaWdodF9tbSA9IDIxNiwKKwl9LAorCS5sYW5lcyA9IDQsCisJLmZvcm1h
dCA9IE1JUElfRFNJX0ZNVF9SR0I4ODgsCisJLm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9NT0RFX1ZJ
REVPIHwgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFIHwKKwkJICAgICAgTUlQSV9EU0lf
TU9ERV9MUE0sCisJLmluaXRfY21kcyA9IGJvZV9pbml0X2NtZCwKK307CisKIHN0YXRpYyBpbnQg
Ym9lX3BhbmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3Qg
Ym9lX3BhbmVsICpib2UgPSB0b19ib2VfcGFuZWwocGFuZWwpOwpAQCAtNzQ3LDYgKzc3NSw5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJvZV9vZl9tYXRjaFtdID0gewogCXsg
LmNvbXBhdGlibGUgPSAiYXVvLGtkMTAxbjgwLTQ1bmEiLAogCSAgLmRhdGEgPSAmYXVvX2tkMTAx
bjgwXzQ1bmFfZGVzYwogCX0sCisJeyAuY29tcGF0aWJsZSA9ICJib2UsdHYxMDF3dW0tbjUzIiwK
KwkgIC5kYXRhID0gJmJvZV90djEwMXd1bV9uNTNfZGVzYworCX0sCiAJeyAvKiBzZW50aW5lbCAq
LyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYm9lX29mX21hdGNoKTsKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
