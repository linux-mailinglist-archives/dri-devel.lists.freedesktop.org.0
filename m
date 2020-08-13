Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74291243497
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C386E563;
	Thu, 13 Aug 2020 07:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98F6E169
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 03:41:30 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3436B93DFA66B6139B24;
 Thu, 13 Aug 2020 11:41:27 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 11:41:17 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Fix build error of no type of module_init
Date: Thu, 13 Aug 2020 11:39:15 +0800
Message-ID: <1597289955-27381-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgaW5jbHVkZSB0byBmaXggYnVpbGQgZXJyb3I6CmhpYm1jX2RybV9kcnYuYzoz
ODU6MTogd2FybmluZzogZGF0YSBkZWZpbml0aW9uIGhhcyBubyB0eXBlIG9yIHN0b3JhZ2UKY2xh
c3MgW2VuYWJsZWQgYnkgZGVmYXVsdF0KaGlibWNfZHJtX2Rydi5jOjM4NToxOiBlcnJvcjogdHlw
ZSBkZWZhdWx0cyB0byDigJhpbnTigJkgaW4gZGVjbGFyYXRpb24Kb2Yg4oCYbW9kdWxlX2luaXTi
gJkgWy1XZXJyb3I9aW1wbGljaXQtaW50XQpoaWJtY19kcm1fZHJ2LmM6Mzg1OjE6IHdhcm5pbmc6
IHBhcmFtZXRlciBuYW1lcyAod2l0aG91dCB0eXBlcykgaW4gZnVuY3Rpb24Kb2Yg4oCYbW9kdWxl
X2V4aXTigJkgWy1XZXJyb3I9aW1wbGljaXQtaW50XQpoaWJtY19kcm1fZHJ2LmM6Mzg1OjI5Mjox
OiB3YXJuaW5nOiBwYXJhbWV0ZXIgbmFtZXMgKHdpdGhvdXQgdHlwZXMpIGluCmZ1bmN0aW9uIGRl
Y2xhcmF0aW9uIFtlbmFibGVkIGJ5IGRlZmF1bHRdCgpTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8
dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNf
ZHJtX2Rydi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCmluZGV4IDFhZTM2
MGQuLjJiNGY4MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
aGlibWNfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGli
bWNfZHJtX2Rydi5jCkBAIC0xMSw2ICsxMSw3IEBACiAgKglKaWFuaHVhIExpIDxsaWppYW5odWFA
aHVhd2VpLmNvbT4KICAqLwogCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8
bGludXgvcGNpLmg+CiAKICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
