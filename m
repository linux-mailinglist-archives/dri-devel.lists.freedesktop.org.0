Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A6301442
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F109E6EAC0;
	Sat, 23 Jan 2021 09:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6516EA4C;
 Sat, 23 Jan 2021 01:24:12 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DMz041rlnz7W7l;
 Sat, 23 Jan 2021 09:23:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Sat, 23 Jan 2021
 09:23:59 +0800
From: Ye Bin <yebin10@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] =?UTF-8?q?drm/nouveau:=20remove=20set=20but=20not=20used?=
 =?UTF-8?q?=20variable=20=E2=80=98pdev=E2=80=99=20in=20nouveau=5Fbios=5Fin?=
 =?UTF-8?q?it?=
Date: Sat, 23 Jan 2021 09:30:14 +0800
Message-ID: <20210123013014.3815870-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Ye Bin <yebin10@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGZvbGxvdyB3YXJuaW5nOgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3Mu
YzoyMDg2OjE4OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhwZGV24oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgc3RydWN0IHBjaV9kZXYgKnBkZXY7CiAgICAg
ICAgICAgICAgICAgIF5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KU2lnbmVkLW9mZi1ieTogWWUgQmluIDx5ZWJpbjEwQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Jpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jCmlu
ZGV4IDdjYzY4M2I4ZGM3YS4uZThjNDQ1ZWIxMTAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Jpb3MuYwpAQCAtMjA4MywxMyArMjA4MywxMSBAQCBub3V2ZWF1X2Jpb3NfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91
dmVhdV9kcm0oZGV2KTsKIAlzdHJ1Y3QgbnZiaW9zICpiaW9zID0gJmRybS0+dmJpb3M7Ci0Jc3Ry
dWN0IHBjaV9kZXYgKnBkZXY7CiAJaW50IHJldDsKIAogCS8qIG9ubHkgcmVsZXZhbnQgZm9yIFBD
SSBkZXZpY2VzICovCiAJaWYgKCFkZXZfaXNfcGNpKGRldi0+ZGV2KSkKIAkJcmV0dXJuIDA7Ci0J
cGRldiA9IHRvX3BjaV9kZXYoZGV2LT5kZXYpOwogCiAJaWYgKCFOVkluaXRWQklPUyhkZXYpKQog
CQlyZXR1cm4gLUVOT0RFVjsKLS0gCjIuMjUuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
