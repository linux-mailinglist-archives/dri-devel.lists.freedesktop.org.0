Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276ABED59
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1971A6EE69;
	Thu, 26 Sep 2019 08:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D8F6EE69
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:25:12 +0000 (UTC)
Received: from localhost (unknown [192.168.167.193])
 by lucky1.263xmail.com (Postfix) with ESMTP id 95CCE43BB3;
 Thu, 26 Sep 2019 16:25:08 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P24701T140118476191488S1569486296531843_; 
 Thu, 26 Sep 2019 16:25:09 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <bc20040257b92962ff88520f61809994>
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
Subject: [PATCH v2 3/3] drm/rockchip: Add support 10bit yuv format
Date: Thu, 26 Sep 2019 16:24:49 +0800
Message-Id: <1569486289-152061-4-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
References: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
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

QWRkIHN1cHBvcnQgMTBiaXQgeXV2IGZvcm1hdCBkaXNwbGF5IGZvciByb2NrY2hpcCBzb21lIHNv
Y3MsCmluY2x1ZGU6CiAgICBSSzMyODgvUkszMjI4L1JLMzMyOC9SSzMzNjgvUkszMzk5CgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCAxNiArKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oIHwgIDEgKwogZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyB8ICAyICsrCiAzIGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV92b3AuYwppbmRleCBjZTc0MjE4Li40Yjg3ZDg4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKQEAgLTI0OSw2ICsyNDksMjEgQEAgc3Rh
dGljIGJvb2wgaGFzX3JiX3N3YXBwZWQodWludDMyX3QgZm9ybWF0KQogCX0KIH0KIAorc3RhdGlj
IGJvb2wgaXNfMTBiaXRfeXV2KHVpbnQzMl90IGZvcm1hdCkKK3sKKwlzd2l0Y2ggKGZvcm1hdCkg
eworCWNhc2UgRFJNX0ZPUk1BVF9OVjEyXzEwOgorCWNhc2UgRFJNX0ZPUk1BVF9OVjIxXzEwOgor
CWNhc2UgRFJNX0ZPUk1BVF9OVjE2XzEwOgorCWNhc2UgRFJNX0ZPUk1BVF9OVjYxXzEwOgorCWNh
c2UgRFJNX0ZPUk1BVF9OVjI0XzEwOgorCWNhc2UgRFJNX0ZPUk1BVF9OVjQyXzEwOgorCQlyZXR1
cm4gdHJ1ZTsKKwlkZWZhdWx0OgorCQlyZXR1cm4gZmFsc2U7CisJfQorfQorCiBzdGF0aWMgdTMy
IHJvY2tjaGlwX3ZvcF9nZXRfb2Zmc2V0KHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlLCB1
OCBwbGFuZSkKIHsKIAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOwpAQCAtOTEz
LDYgKzkyOCw3IEBAIHN0YXRpYyB2b2lkIHZvcF9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lLAogCQlkbWFfYWRkciA9IHJrX3V2X29iai0+ZG1hX2FkZHIgKyBvZmZz
ZXQgKyBmYi0+b2Zmc2V0c1sxXTsKIAkJVk9QX1dJTl9TRVQodm9wLCB3aW4sIHV2X3ZpciwgRElW
X1JPVU5EX1VQKGZiLT5waXRjaGVzWzFdLCA0KSk7CiAJCVZPUF9XSU5fU0VUKHZvcCwgd2luLCB1
dl9tc3QsIGRtYV9hZGRyKTsKKwkJVk9QX1dJTl9TRVQodm9wLCB3aW4sIGZtdF8xMCwgaXNfMTBi
aXRfeXV2KGZiLT5mb3JtYXQtPmZvcm1hdCkpOwogCiAJCWZvciAoaSA9IDA7IGkgPCBOVU1fWVVW
MllVVl9DT0VGRklDSUVOVFM7IGkrKykgewogCQkJVk9QX1dJTl9ZVVYyWVVWX0NPRUZGSUNJRU5U
X1NFVCh2b3AsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcC5oIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuaApp
bmRleCAyMTQ5YTg4OS4uYWRjMmIwYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV92b3AuaApAQCAtMTMzLDYgKzEzMyw3IEBAIHN0cnVjdCB2b3Bfd2luX3BoeSB7
CiAJc3RydWN0IHZvcF9yZWcgZ2F0ZTsKIAlzdHJ1Y3Qgdm9wX3JlZyBmb3JtYXQ7CiAJc3RydWN0
IHZvcF9yZWcgcmJfc3dhcDsKKwlzdHJ1Y3Qgdm9wX3JlZyBmbXRfMTA7CiAJc3RydWN0IHZvcF9y
ZWcgYWN0X2luZm87CiAJc3RydWN0IHZvcF9yZWcgZHNwX2luZm87CiAJc3RydWN0IHZvcF9yZWcg
ZHNwX3N0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3Zv
cF9yZWcuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMKaW5k
ZXggZDE0OTRiZS4uNzMyZTUzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX3ZvcF9yZWcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfdm9wX3JlZy5jCkBAIC01NDQsNiArNTQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2b3Bf
d2luX3BoeSByazMyODhfd2luMDFfZGF0YSA9IHsKIAkubmZvcm1hdHMgPSBBUlJBWV9TSVpFKGZv
cm1hdHNfd2luX2Z1bGwpLAogCS5lbmFibGUgPSBWT1BfUkVHKFJLMzI4OF9XSU4wX0NUUkwwLCAw
eDEsIDApLAogCS5mb3JtYXQgPSBWT1BfUkVHKFJLMzI4OF9XSU4wX0NUUkwwLCAweDcsIDEpLAor
CS5mbXRfMTAgPSBWT1BfUkVHKFJLMzI4OF9XSU4wX0NUUkwwLCAweDEsIDQpLAogCS5yYl9zd2Fw
ID0gVk9QX1JFRyhSSzMyODhfV0lOMF9DVFJMMCwgMHgxLCAxMiksCiAJLmFjdF9pbmZvID0gVk9Q
X1JFRyhSSzMyODhfV0lOMF9BQ1RfSU5GTywgMHgxZmZmMWZmZiwgMCksCiAJLmRzcF9pbmZvID0g
Vk9QX1JFRyhSSzMyODhfV0lOMF9EU1BfSU5GTywgMHgwZmZmMGZmZiwgMCksCkBAIC02NzQsNiAr
Njc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2b3Bfd2luX3BoeSByazMzNjhfd2luMDFfZGF0
YSA9IHsKIAkubmZvcm1hdHMgPSBBUlJBWV9TSVpFKGZvcm1hdHNfd2luX2Z1bGwpLAogCS5lbmFi
bGUgPSBWT1BfUkVHKFJLMzM2OF9XSU4wX0NUUkwwLCAweDEsIDApLAogCS5mb3JtYXQgPSBWT1Bf
UkVHKFJLMzM2OF9XSU4wX0NUUkwwLCAweDcsIDEpLAorCS5mbXRfMTAgPSBWT1BfUkVHKFJLMzM2
OF9XSU4wX0NUUkwwLCAweDEsIDQpLAogCS5yYl9zd2FwID0gVk9QX1JFRyhSSzMzNjhfV0lOMF9D
VFJMMCwgMHgxLCAxMiksCiAJLnhfbWlyX2VuID0gVk9QX1JFRyhSSzMzNjhfV0lOMF9DVFJMMCwg
MHgxLCAyMSksCiAJLnlfbWlyX2VuID0gVk9QX1JFRyhSSzMzNjhfV0lOMF9DVFJMMCwgMHgxLCAy
MiksCi0tIAoyLjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
