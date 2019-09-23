Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D8BB41E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE7E6E8AB;
	Mon, 23 Sep 2019 12:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 12:46:44 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B436E8A7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:46:44 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 85A4B1200C1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:39:54 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.183])
 by regular2.263xmail.com (Postfix) with ESMTP id 65720398
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:39:40 +0800 (CST)
Received: from hjc?rock-chips.com (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 1B172298;
 Mon, 23 Sep 2019 20:39:37 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P10893T140454720919296S1569242369031174_; 
 Mon, 23 Sep 2019 20:39:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4f52eaa6100668ddca492c679c1ad8c6>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/36] drm/rockchip: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:38:51 +0800
Message-Id: <1569242365-182133-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242365-182133-1-git-send-email-hjc@rock-chips.com>
References: <1569242365-182133-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyAgfCAyICstCiBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX2ZiLmMKaW5kZXggY2EwMTIzNC4uZWUxMTU4ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwpAQCAtODEsNyArODEsNyBAQCByb2Nr
Y2hpcF91c2VyX2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGVfcHJpdiwKIAogCQltaW5fc2l6ZSA9IChoZWlnaHQgLSAxKSAqIG1vZGVfY21kLT5w
aXRjaGVzW2ldICsKIAkJCW1vZGVfY21kLT5vZmZzZXRzW2ldICsKLQkJCXdpZHRoICogaW5mby0+
Y3BwW2ldOworCQkJd2lkdGggKiBpbmZvLT5icHBbaV0gLyA4OwogCiAJCWlmIChvYmotPnNpemUg
PCBtaW5fc2l6ZSkgewogCQkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwppbmRleCAyZjgyMWM1Li5k
OTBkNGI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMK
QEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgdm9pZCB2b3BfcGxhbmVfYXRvbWljX3VwZGF0ZShz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlkc3Bfc3R5ID0gZGVzdC0+eTEgKyBjcnRjLT5tb2Rl
LnZ0b3RhbCAtIGNydGMtPm1vZGUudnN5bmNfc3RhcnQ7CiAJZHNwX3N0ID0gZHNwX3N0eSA8PCAx
NiB8IChkc3Bfc3R4ICYgMHhmZmZmKTsKIAotCW9mZnNldCA9IChzcmMtPngxID4+IDE2KSAqIGZi
LT5mb3JtYXQtPmNwcFswXTsKKwlvZmZzZXQgPSAoc3JjLT54MSA+PiAxNikgKiBmYi0+Zm9ybWF0
LT5icHBbMF0gLyA4OwogCW9mZnNldCArPSAoc3JjLT55MSA+PiAxNikgKiBmYi0+cGl0Y2hlc1sw
XTsKIAlkbWFfYWRkciA9IHJrX29iai0+ZG1hX2FkZHIgKyBvZmZzZXQgKyBmYi0+b2Zmc2V0c1sw
XTsKIApAQCAtODU5LDcgKzg1OSw3IEBAIHN0YXRpYyB2b2lkIHZvcF9wbGFuZV9hdG9taWNfdXBk
YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCWlmIChpc195dXYpIHsKIAkJaW50IGhzdWIg
PSBmYi0+Zm9ybWF0LT5oc3ViOwogCQlpbnQgdnN1YiA9IGZiLT5mb3JtYXQtPnZzdWI7Ci0JCWlu
dCBicHAgPSBmYi0+Zm9ybWF0LT5jcHBbMV07CisJCWludCBicHAgPSBmYi0+Zm9ybWF0LT5icHBb
MV0gLyA4OwogCiAJCXV2X29iaiA9IGZiLT5vYmpbMV07CiAJCXJrX3V2X29iaiA9IHRvX3JvY2tj
aGlwX29iaih1dl9vYmopOwotLSAKMi43LjQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
