Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13B585DA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF216E59E;
	Thu, 27 Jun 2019 15:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE33B6E81C;
 Thu, 27 Jun 2019 07:47:11 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1D3A0223FB14CDAE4233;
 Thu, 27 Jun 2019 15:47:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Jun 2019 15:46:58 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <harry.wentland@amd.com>, <tianci.yin@amd.com>, <tao.zhou1@amd.com>,
 <leo.liu@amd.com>, <ray.huang@amd.com>, <Jack.Xiao@amd.com>,
 <Hawking.Zhang@amd.com>, <kenneth.feng@amd.com>
Subject: [PATCH -next] drm/amdgpu: remove set but not used variable
 'psp_enabled'
Date: Thu, 27 Jun 2019 07:53:50 +0000
Message-ID: <20190627075350.86800-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 27 Jun 2019 15:33:25 +0000
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
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYzogSW4gZnVuY3Rpb24gJ252X2NvbW1vbl9lYXJseV9pbml0
JzoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYzo0NzE6Nzogd2FybmluZzoKIHZhcmlh
YmxlICdwc3BfZW5hYmxlZCcgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KCkl0J3Mgbm90IHVzZWQgc2luY2UgaW5yb2R1Y3Rpb24gaW4KY29tbWl0IGM2YjZhNDIx
NzVmNSAoImRybS9hbWRncHU6IGFkZCBuYXZpMTAgY29tbW9uIGlwIGJsb2NrICh2MykiKQoKU2ln
bmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCBhZjIwZmZiNTVjNTQuLjhi
OWZhM2RiOGRhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC00NjgsNyArNDY4LDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfYXNpY19mdW5jcyBudl9hc2ljX2Z1bmNzID0KIAog
c3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiB7Ci0JYm9vbCBw
c3BfZW5hYmxlZCA9IGZhbHNlOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCiAJYWRldi0+c21jX3JyZWcgPSBOVUxMOwpAQCAt
NDg1LDEwICs0ODQsNiBAQCBzdGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhh
bmRsZSkKIAogCWFkZXYtPmFzaWNfZnVuY3MgPSAmbnZfYXNpY19mdW5jczsKIAotCWlmIChhbWRn
cHVfZGV2aWNlX2lwX2dldF9pcF9ibG9jayhhZGV2LCBBTURfSVBfQkxPQ0tfVFlQRV9QU1ApICYm
Ci0JICAgIChhbWRncHVfaXBfYmxvY2tfbWFzayAmICgxIDw8IEFNRF9JUF9CTE9DS19UWVBFX1BT
UCkpKQotCQlwc3BfZW5hYmxlZCA9IHRydWU7Ci0KIAlhZGV2LT5yZXZfaWQgPSBudl9nZXRfcmV2
X2lkKGFkZXYpOwogCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IDB4ZmY7CiAJc3dpdGNoIChhZGV2
LT5hc2ljX3R5cGUpIHsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
