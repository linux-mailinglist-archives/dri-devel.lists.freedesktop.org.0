Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA176E191
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4A46E5C5;
	Fri, 19 Jul 2019 07:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97786E484;
 Fri, 19 Jul 2019 02:35:30 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 313D2F73CA5F42628F4B;
 Fri, 19 Jul 2019 10:35:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 10:35:20 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <ville.syrjala@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <matthew.d.roper@intel.com>
Subject: [PATCH -next] drm/i915/icl: Remove set but not used variable 'src_y'
Date: Fri, 19 Jul 2019 02:41:00 +0000
Message-ID: <20190719024100.64738-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYzogSW4gZnVuY3Rpb24gJ2c0eF9zcHJp
dGVfY2hlY2tfc2NhbGluZyc6CmRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3By
aXRlLmM6MTQ5NDoxMzogd2FybmluZzoKIHZhcmlhYmxlICdzcmNfeScgc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0Bo
dWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRl
LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCmluZGV4IDM0
NTg2ZjI5YmU2MC4uOWMzMzY3NDkxZjA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfc3ByaXRlLmMKQEAgLTE0OTEsNyArMTQ5MSw3IEBAIGc0eF9zcHJpdGVfY2hlY2tf
c2NhbGluZyhzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKIAljb25zdCBzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0YXRlLT5iYXNlLmZiOwogCWNvbnN0IHN0
cnVjdCBkcm1fcmVjdCAqc3JjID0gJnBsYW5lX3N0YXRlLT5iYXNlLnNyYzsKIAljb25zdCBzdHJ1
Y3QgZHJtX3JlY3QgKmRzdCA9ICZwbGFuZV9zdGF0ZS0+YmFzZS5kc3Q7Ci0JaW50IHNyY194LCBz
cmNfeSwgc3JjX3csIHNyY19oLCBjcnRjX3csIGNydGNfaDsKKwlpbnQgc3JjX3gsIHNyY193LCBz
cmNfaCwgY3J0Y193LCBjcnRjX2g7CiAJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFk
anVzdGVkX21vZGUgPQogCQkmY3J0Y19zdGF0ZS0+YmFzZS5hZGp1c3RlZF9tb2RlOwogCXVuc2ln
bmVkIGludCBjcHAgPSBmYi0+Zm9ybWF0LT5jcHBbMF07CkBAIC0xNTAyLDcgKzE1MDIsNiBAQCBn
NHhfc3ByaXRlX2NoZWNrX3NjYWxpbmcoc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUsCiAJY3J0Y19oID0gZHJtX3JlY3RfaGVpZ2h0KGRzdCk7CiAKIAlzcmNfeCA9IHNyYy0+eDEg
Pj4gMTY7Ci0Jc3JjX3kgPSBzcmMtPnkxID4+IDE2OwogCXNyY193ID0gZHJtX3JlY3Rfd2lkdGgo
c3JjKSA+PiAxNjsKIAlzcmNfaCA9IGRybV9yZWN0X2hlaWdodChzcmMpID4+IDE2OwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
