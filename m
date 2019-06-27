Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BD585D4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E6A6E507;
	Thu, 27 Jun 2019 15:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90D26E811;
 Thu, 27 Jun 2019 07:38:42 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6318C72101FAD001921F;
 Thu, 27 Jun 2019 15:38:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Jun 2019 15:38:33 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dan.carpenter@oracle.com>, <sam@ravnborg.org>, <Kevin1.Wang@amd.com>,
 <Jack.Xiao@amd.com>, <Hawking.Zhang@amd.com>, <ray.huang@amd.com>
Subject: [PATCH -next] drm/amdgpu: fix debugfs_simple_attr.cocci warnings
Date: Thu, 27 Jun 2019 07:45:24 +0000
Message-ID: <20190627074524.84150-1-yuehaibing@huawei.com>
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

VXNlIERFRklORV9ERUJVR0ZTX0FUVFJJQlVURSByYXRoZXIgdGhhbiBERUZJTkVfU0lNUExFX0FU
VFJJQlVURQpmb3IgZGVidWdmcyBmaWxlcy4KClNlbWFudGljIHBhdGNoIGluZm9ybWF0aW9uOgpS
YXRpb25hbGU6IERFRklORV9TSU1QTEVfQVRUUklCVVRFICsgZGVidWdmc19jcmVhdGVfZmlsZSgp
CmltcG9zZXMgc29tZSBzaWduaWZpY2FudCBvdmVyaGVhZCBhcyBjb21wYXJlZCB0bwpERUZJTkVf
REVCVUdGU19BVFRSSUJVVEUgKyBkZWJ1Z2ZzX2NyZWF0ZV9maWxlX3Vuc2FmZSgpLgoKR2VuZXJh
dGVkIGJ5OiBzY3JpcHRzL2NvY2NpbmVsbGUvYXBpL2RlYnVnZnMvZGVidWdmc19zaW1wbGVfYXR0
ci5jb2NjaQoKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCAxMCAr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2Zz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCmluZGV4IDIw
Y2UxNTg0OTBkYi4uOWQ5ZjRjYmJjNGJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTEwODIsMTUgKzEwODIsMTUgQEAgc3RhdGljIGludCBhbWRn
cHVfZGVidWdmc19pYl9wcmVlbXB0KHZvaWQgKmRhdGEsIHU2NCB2YWwpCiAJcmV0dXJuIDA7CiB9
CiAKLURFRklORV9TSU1QTEVfQVRUUklCVVRFKGZvcHNfaWJfcHJlZW1wdCwgTlVMTCwKLQkJCWFt
ZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQsICIlbGx1XG4iKTsKK0RFRklORV9ERUJVR0ZTX0FUVFJJ
QlVURShmb3BzX2liX3ByZWVtcHQsIE5VTEwsIGFtZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQsCisJ
CQkgIiVsbHVcbiIpOwogCiBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIHsKIAlhZGV2LT5kZWJ1Z2ZzX3ByZWVtcHQgPQotCQlkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJhbWRncHVfcHJlZW1wdF9pYiIsIDA2MDAsCi0JCQkJICAgIGFkZXYtPmRkZXYtPnBy
aW1hcnktPmRlYnVnZnNfcm9vdCwKLQkJCQkgICAgKHZvaWQgKilhZGV2LCAmZm9wc19pYl9wcmVl
bXB0KTsKKwkJZGVidWdmc19jcmVhdGVfZmlsZV91bnNhZmUoImFtZGdwdV9wcmVlbXB0X2liIiwg
MDYwMCwKKwkJCQkJICAgYWRldi0+ZGRldi0+cHJpbWFyeS0+ZGVidWdmc19yb290LAorCQkJCQkg
ICAodm9pZCAqKWFkZXYsICZmb3BzX2liX3ByZWVtcHQpOwogCWlmICghKGFkZXYtPmRlYnVnZnNf
cHJlZW1wdCkpIHsKIAkJRFJNX0VSUk9SKCJ1bmFibGUgdG8gY3JlYXRlIGFtZGdwdV9wcmVlbXB0
X2liIGRlYnVnc2ZzIGZpbGVcbiIpOwogCQlyZXR1cm4gLUVJTzsKCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
