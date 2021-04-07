Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFE356847
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 11:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1763B6E8EA;
	Wed,  7 Apr 2021 09:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B876E8EA;
 Wed,  7 Apr 2021 09:44:08 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFfXw0Zz8zpVwS;
 Wed,  7 Apr 2021 17:41:20 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 17:43:56 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] drm/nouveau/kms: remove unused local variable 'width'
Date: Wed, 7 Apr 2021 17:43:44 +0800
Message-ID: <20210407094344.2924-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: James Jones <jajones@nvidia.com>, Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cgpkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYzogSW4gZnVuY3Rpb24g4oCYbm91dmVhdV9m
cmFtZWJ1ZmZlcl9uZXfigJk6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxh
eS5jOjMwOToxNTogd2FybmluZzogdmFyaWFibGUg4oCYd2lkdGjigJkgc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkZpeGVzOiA0ZjU3NDZjODYzZGIgKCJkcm0v
bm91dmVhdS9rbXM6IENoZWNrIGZyYW1lYnVmZmVyIHNpemUgYWdhaW5zdCBibyIpClJlcG9ydGVk
LWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWmhlbiBM
ZWkgPHRodW5kZXIubGVpemhlbkBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZGlzcGxheS5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmMKaW5kZXggMTc4MzFlZTg5N2VhNDZkLi43ZDNiMWY4ZGUzMDA3ODQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCkBAIC0zMDYsNyArMzA2LDcgQEAK
IAlzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibyA9IG5vdXZlYXVfZ2VtX29iamVjdChnZW0pOwogCXN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOwogCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8g
KmluZm87Ci0JdW5zaWduZWQgaW50IHdpZHRoLCBoZWlnaHQsIGk7CisJdW5zaWduZWQgaW50IGhl
aWdodCwgaTsKIAl1aW50MzJfdCB0aWxlX21vZGU7CiAJdWludDhfdCBraW5kOwogCWludCByZXQ7
CkBAIC0zNDYsOSArMzQ2LDYgQEAKIAlpbmZvID0gZHJtX2dldF9mb3JtYXRfaW5mbyhkZXYsIG1v
ZGVfY21kKTsKIAogCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1fcGxhbmVzOyBpKyspIHsKLQkJ
d2lkdGggPSBkcm1fZm9ybWF0X2luZm9fcGxhbmVfd2lkdGgoaW5mbywKLQkJCQkJCSAgICBtb2Rl
X2NtZC0+d2lkdGgsCi0JCQkJCQkgICAgaSk7CiAJCWhlaWdodCA9IGRybV9mb3JtYXRfaW5mb19w
bGFuZV9oZWlnaHQoaW5mbywKIAkJCQkJCSAgICAgIG1vZGVfY21kLT5oZWlnaHQsCiAJCQkJCQkg
ICAgICBpKTsKLS0gCjEuOC4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
