Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CF2CE9E9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B976EC8C;
	Fri,  4 Dec 2020 08:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFF06E0EC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 01:23:17 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnFLq4pQBz15XBC;
 Fri,  4 Dec 2020 09:22:43 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 09:23:06 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ttm: remove unused varibles
Date: Fri, 4 Dec 2020 09:23:14 +0800
Message-ID: <1607044999-47666-9-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607044999-47666-1-git-send-email-tiantao6@hisilicon.com>
References: <1607044999-47666-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zml4ZWQgdGhlIGZvbGxvd2luZyB3YXJuaW5ncwpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmM6MTIyNzoxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZCnNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYzoxMjUxOjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkKc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KClNpZ25lZC1vZmYtYnk6IFRp
YW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYm8uYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA3YWE0Mjg2Li45NDY1ZjU2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC0xMjI4LDcgKzEyMjgsNiBAQCBu
b3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIHsKIAlz
dHJ1Y3QgdHRtX3R0ICp0dG1fZG1hID0gKHZvaWQgKil0dG07CiAJc3RydWN0IG5vdXZlYXVfZHJt
ICpkcm07Ci0Jc3RydWN0IGRldmljZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2Vf
ZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKTsKIAogCWlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0
bSkpCkBAIC0xMjQyLDcgKzEyNDEsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwKIAl9CiAKIAlkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7Ci0J
ZGV2ID0gZHJtLT5kZXYtPmRldjsKIAogCXJldHVybiB0dG1fcG9vbF9hbGxvYygmZHJtLT50dG0u
YmRldi5wb29sLCB0dG0sIGN0eCk7CiB9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
