Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48CBD984
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC566EB32;
	Wed, 25 Sep 2019 08:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF3B6EB34
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:07:15 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.42])
 by regular1.263xmail.com (Postfix) with ESMTP id 832DC43D;
 Wed, 25 Sep 2019 16:07:12 +0800 (CST)
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
 P2645T139744972404480S1569398812082049_; 
 Wed, 25 Sep 2019 16:07:12 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5d8ea79ab9f3f7b7a98cad262bf6bc0b>
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
Subject: [PATCH 3/3] drm/rockchip: Add support 10bit yuv format
Date: Wed, 25 Sep 2019 16:06:40 +0800
Message-Id: <1569398801-92201-4-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
References: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-rockchip@lists.infradead.org, Ayan.Halder@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Y2tjaGlwX2RybV92b3AuYwppbmRleCBjZTViNDVkLi45Y2I5ZmZmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKQEAgLTI0OSw2ICsyNDksMjEgQEAgc3Rh
dGljIGJvb2wgaGFzX3JiX3N3YXBwZWQodWludDMyX3QgZm9ybWF0KQogCX0KIH0KIAorc3RhdGlj
IGJvb2wgaXNfeXV2XzEwYml0KHVpbnQzMl90IGZvcm1hdCkKK3sKKwlzd2l0Y2ggKGZvcm1hdCkg
eworCWNhc2UgRFJNX0ZPUk1BVF9OVjEyXzEwOgorCWNhc2UgRFJNX0ZPUk1BVF9OVjIxXzEwOgor
CWNhc2UgRFJNX0ZPUk1BVF9OVjE2XzEwOgorCWNhc2UgRFJNX0ZPUk1BVF9OVjYxXzEwOgorCWNh
c2UgRFJNX0ZPUk1BVF9OVjI0XzEwOgorCWNhc2UgRFJNX0ZPUk1BVF9OVjQyXzEwOgorCQlyZXR1
cm4gdHJ1ZTsKKwlkZWZhdWx0OgorCQlyZXR1cm4gZmFsc2U7CisJfQorfQorCiBzdGF0aWMgaW50
IHZvcF9mb3JtYXRfZ2V0X2JwcCh1MzIgZm9ybWF0LCB1OCBwbGFuZSkKIHsKIAljb25zdCBzdHJ1
Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOwpAQCAtODkwLDYgKzkwNSw3IEBAIHN0YXRpYyB2b2lk
IHZvcF9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQlkbWFf
YWRkciA9IHJrX3V2X29iai0+ZG1hX2FkZHIgKyBvZmZzZXQgKyBmYi0+b2Zmc2V0c1sxXTsKIAkJ
Vk9QX1dJTl9TRVQodm9wLCB3aW4sIHV2X3ZpciwgRElWX1JPVU5EX1VQKGZiLT5waXRjaGVzWzFd
LCA0KSk7CiAJCVZPUF9XSU5fU0VUKHZvcCwgd2luLCB1dl9tc3QsIGRtYV9hZGRyKTsKKwkJVk9Q
X1dJTl9TRVQodm9wLCB3aW4sIGZtdF8xMCwgaXNfeXV2XzEwYml0KGZiLT5mb3JtYXQtPmZvcm1h
dCkpOwogCiAJCWZvciAoaSA9IDA7IGkgPCBOVU1fWVVWMllVVl9DT0VGRklDSUVOVFM7IGkrKykg
ewogCQkJVk9QX1dJTl9ZVVYyWVVWX0NPRUZGSUNJRU5UX1NFVCh2b3AsCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oIGIvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuaAppbmRleCAyMTQ5YTg4OS4uYWRjMmIwYjUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuaApAQCAtMTMz
LDYgKzEzMyw3IEBAIHN0cnVjdCB2b3Bfd2luX3BoeSB7CiAJc3RydWN0IHZvcF9yZWcgZ2F0ZTsK
IAlzdHJ1Y3Qgdm9wX3JlZyBmb3JtYXQ7CiAJc3RydWN0IHZvcF9yZWcgcmJfc3dhcDsKKwlzdHJ1
Y3Qgdm9wX3JlZyBmbXRfMTA7CiAJc3RydWN0IHZvcF9yZWcgYWN0X2luZm87CiAJc3RydWN0IHZv
cF9yZWcgZHNwX2luZm87CiAJc3RydWN0IHZvcF9yZWcgZHNwX3N0OwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMKaW5kZXggZDE0OTRiZS4uNzMyZTUzNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jCkBAIC01NDQsNiAr
NTQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2b3Bfd2luX3BoeSByazMyODhfd2luMDFfZGF0
YSA9IHsKIAkubmZvcm1hdHMgPSBBUlJBWV9TSVpFKGZvcm1hdHNfd2luX2Z1bGwpLAogCS5lbmFi
bGUgPSBWT1BfUkVHKFJLMzI4OF9XSU4wX0NUUkwwLCAweDEsIDApLAogCS5mb3JtYXQgPSBWT1Bf
UkVHKFJLMzI4OF9XSU4wX0NUUkwwLCAweDcsIDEpLAorCS5mbXRfMTAgPSBWT1BfUkVHKFJLMzI4
OF9XSU4wX0NUUkwwLCAweDEsIDQpLAogCS5yYl9zd2FwID0gVk9QX1JFRyhSSzMyODhfV0lOMF9D
VFJMMCwgMHgxLCAxMiksCiAJLmFjdF9pbmZvID0gVk9QX1JFRyhSSzMyODhfV0lOMF9BQ1RfSU5G
TywgMHgxZmZmMWZmZiwgMCksCiAJLmRzcF9pbmZvID0gVk9QX1JFRyhSSzMyODhfV0lOMF9EU1Bf
SU5GTywgMHgwZmZmMGZmZiwgMCksCkBAIC02NzQsNiArNjc1LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCB2b3Bfd2luX3BoeSByazMzNjhfd2luMDFfZGF0YSA9IHsKIAkubmZvcm1hdHMgPSBBUlJB
WV9TSVpFKGZvcm1hdHNfd2luX2Z1bGwpLAogCS5lbmFibGUgPSBWT1BfUkVHKFJLMzM2OF9XSU4w
X0NUUkwwLCAweDEsIDApLAogCS5mb3JtYXQgPSBWT1BfUkVHKFJLMzM2OF9XSU4wX0NUUkwwLCAw
eDcsIDEpLAorCS5mbXRfMTAgPSBWT1BfUkVHKFJLMzM2OF9XSU4wX0NUUkwwLCAweDEsIDQpLAog
CS5yYl9zd2FwID0gVk9QX1JFRyhSSzMzNjhfV0lOMF9DVFJMMCwgMHgxLCAxMiksCiAJLnhfbWly
X2VuID0gVk9QX1JFRyhSSzMzNjhfV0lOMF9DVFJMMCwgMHgxLCAyMSksCiAJLnlfbWlyX2VuID0g
Vk9QX1JFRyhSSzMzNjhfV0lOMF9DVFJMMCwgMHgxLCAyMiksCi0tIAoyLjcuNAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
