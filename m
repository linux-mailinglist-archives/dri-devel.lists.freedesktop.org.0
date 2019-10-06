Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAFCDC22
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35A96E483;
	Mon,  7 Oct 2019 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F836E0B8;
 Sun,  6 Oct 2019 10:57:56 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 926D158369EC033520F0;
 Sun,  6 Oct 2019 18:57:54 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sun, 6 Oct 2019
 18:57:45 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Anthony.Koo@amd.com>, <aric.cyr@amd.com>,
 <Harmanprit.Tatla@amd.com>, <bayan.zabihiyan@amd.com>,
 <ahmad.othman@amd.com>, <Reza.Amini@amd.com>
Subject: [PATCH -next] drm/amd/display: remove set but not used variable
 'core_freesync'
Date: Sun, 6 Oct 2019 18:57:35 +0800
Message-ID: <20191006105735.60708-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYzoK
IEluIGZ1bmN0aW9uIG1vZF9mcmVlc3luY19nZXRfc2V0dGluZ3M6CmRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jOjk4NDoyNDoK
IHdhcm5pbmc6IHZhcmlhYmxlIGNvcmVfZnJlZXN5bmMgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCA5OGU2NDM2
ZDNhZjUgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIEZyZWVTeW5jIG1vZHVsZSIpCgpSZXBv
cnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1
ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jIHwgNCAtLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYwppbmRleCA5Y2U1NmE4Li4yMzdkZGE3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3lu
Yy9mcmVlc3luYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2Zy
ZWVzeW5jL2ZyZWVzeW5jLmMKQEAgLTk4MSwxMyArOTgxLDkgQEAgdm9pZCBtb2RfZnJlZXN5bmNf
Z2V0X3NldHRpbmdzKHN0cnVjdCBtb2RfZnJlZXN5bmMgKm1vZF9mcmVlc3luYywKIAkJdW5zaWdu
ZWQgaW50ICppbnNlcnRlZF9mcmFtZXMsCiAJCXVuc2lnbmVkIGludCAqaW5zZXJ0ZWRfZHVyYXRp
b25faW5fdXMpCiB7Ci0Jc3RydWN0IGNvcmVfZnJlZXN5bmMgKmNvcmVfZnJlZXN5bmMgPSBOVUxM
OwotCiAJaWYgKG1vZF9mcmVlc3luYyA9PSBOVUxMKQogCQlyZXR1cm47CiAKLQljb3JlX2ZyZWVz
eW5jID0gTU9EX0ZSRUVTWU5DX1RPX0NPUkUobW9kX2ZyZWVzeW5jKTsKLQogCWlmICh2cnItPnN1
cHBvcnRlZCkgewogCQkqdl90b3RhbF9taW4gPSB2cnItPmFkanVzdC52X3RvdGFsX21pbjsKIAkJ
KnZfdG90YWxfbWF4ID0gdnJyLT5hZGp1c3Qudl90b3RhbF9tYXg7Ci0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
