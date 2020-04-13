Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D840B1A64B4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6B6E423;
	Mon, 13 Apr 2020 09:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE016E1B2;
 Mon, 13 Apr 2020 07:56:32 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ED46456310CE144570DA;
 Mon, 13 Apr 2020 15:56:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 15:56:20 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Tony.Cheng@amd.com>, <Anthony.Koo@amd.com>, <yanaijie@huawei.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: code clean up in dce80_hw_sequencer.c
Date: Mon, 13 Apr 2020 16:22:49 +0800
Message-ID: <20200413082249.23271-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX2h3X3NlcXVlbmNlci5jOjQzOjQ2Ogp3YXJuaW5n
OiDigJhyZWdfb2Zmc2V0c+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3Qt
dmFyaWFibGU9XQogc3RhdGljIGNvbnN0IHN0cnVjdCBkY2U4MF9od19zZXFfcmVnX29mZnNldHMg
cmVnX29mZnNldHNbXSA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdl
aS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KLS0t
CiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfaHdfc2VxdWVuY2VyLmMgfCAyOCAtLS0t
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX2h3X3NlcXVl
bmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX2h3X3Nl
cXVlbmNlci5jCmluZGV4IDg5MzI2MWM4MTg1NC4uZDJjZWViZGJkZjUxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfaHdfc2VxdWVuY2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX2h3X3NlcXVl
bmNlci5jCkBAIC0zNiwzNCArMzYsNiBAQAogI2luY2x1ZGUgImRjZS9kY2VfOF8wX2QuaCIKICNp
bmNsdWRlICJkY2UvZGNlXzhfMF9zaF9tYXNrLmgiCiAKLXN0cnVjdCBkY2U4MF9od19zZXFfcmVn
X29mZnNldHMgewotCXVpbnQzMl90IGNydGM7Ci19OwotCi1zdGF0aWMgY29uc3Qgc3RydWN0IGRj
ZTgwX2h3X3NlcV9yZWdfb2Zmc2V0cyByZWdfb2Zmc2V0c1tdID0gewotewotCS5jcnRjID0gKG1t
Q1JUQzBfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCi19LAotewotCS5j
cnRjID0gKG1tQ1JUQzFfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCi19
LAotewotCS5jcnRjID0gKG1tQ1JUQzJfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09O
VFJPTCksCi19LAotewotCS5jcnRjID0gKG1tQ1JUQzNfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JU
Q19HU0xfQ09OVFJPTCksCi19LAotewotCS5jcnRjID0gKG1tQ1JUQzRfQ1JUQ19HU0xfQ09OVFJP
TCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCi19LAotewotCS5jcnRjID0gKG1tQ1JUQzVfQ1JUQ19H
U0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCi19Ci19OwotCi0jZGVmaW5lIEhXX1JF
R19DUlRDKHJlZywgaWQpXAotCShyZWcgKyByZWdfb2Zmc2V0c1tpZF0uY3J0YykKLQogLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKICAqIFByaXZhdGUgZGVmaW5pdGlvbnMKICAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKiovCi0tIAoyLjIxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
