Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88DA1AEB2C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382B26E18E;
	Sat, 18 Apr 2020 09:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16A56E31A;
 Fri, 17 Apr 2020 10:13:42 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6C24975D03EC80580986;
 Fri, 17 Apr 2020 18:13:41 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 18:13:31 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amd/dc: remove unused variable
 'video_optimized_pixel_rates'
Date: Fri, 17 Apr 2020 18:12:47 +0800
Message-ID: <20200417101247.45616-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3Nv
dXJjZS5jOjEwMTc6NTA6CiB3YXJuaW5nOiDigJh2aWRlb19vcHRpbWl6ZWRfcGl4ZWxfcmF0ZXPi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGl4ZWxfcmF0ZV9yYW5nZV90YWJsZV9lbnRyeSB2aWRlb19vcHRpbWl6
ZWRfcGl4ZWxfcmF0ZXNbXSA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCmNvbW1pdCBkOGNkNTg3
ZDJiZmQgKCJkcm0vYW1kL2Rpc3BsYXk6IHJlbW92aW5nIE1PRFVMTyBjaGFuZ2UgZm9yIGRjbjIi
KQpsZWZ0IGJlaGluZCB0aGlzIHVudXNlZCB2YWlyYWJsZSwgcmVtb3ZlIGl0LgoKU2lnbmVkLW9m
Zi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIC4uLi9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyB8IDMzIC0tLS0tLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCmluZGV4IDJlOTky
ZmJjMGQ3MS4uZDJhZDA1MDRiMGRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYwpAQCAtMTAxNCwzOSArMTAxNCw2IEBA
IHN0cnVjdCBwaXhlbF9yYXRlX3JhbmdlX3RhYmxlX2VudHJ5IHsKIAl1bnNpZ25lZCBzaG9ydCBk
aXZfZmFjdG9yOwogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBwaXhlbF9yYXRlX3JhbmdlX3Rh
YmxlX2VudHJ5IHZpZGVvX29wdGltaXplZF9waXhlbF9yYXRlc1tdID0gewotCS8vIC8xLjAwMSBy
YXRlcwotCXsyNTE3MCwgMjUxODAsIDI1MjAwLCAxMDAwLCAxMDAxfSwJLy8yNS4yTUh6ICAgLT4g
ICAyNS4xNwotCXs1OTM0MCwgNTkzNTAsIDU5NDAwLCAxMDAwLCAxMDAxfSwJLy81OS40TWh6ICAg
LT4gICA1OS4zNDAKLQl7NzQxNzAsIDc0MTgwLCA3NDI1MCwgMTAwMCwgMTAwMX0sCS8vNzQuMjVN
aHogIC0+ICAgNzQuMTc1OAotCXsxMjU4NzAsIDEyNTg4MCwgMTI2MDAwLCAxMDAwLCAxMDAxfSwJ
Ly8xMjZNaHogICAgLT4gIDEyNS44NwotCXsxNDgzNTAsIDE0ODM2MCwgMTQ4NTAwLCAxMDAwLCAx
MDAxfSwJLy8xNDguNU1oeiAgLT4gIDE0OC4zNTE2Ci0JezE2NzgzMCwgMTY3ODQwLCAxNjgwMDAs
IDEwMDAsIDEwMDF9LAkvLzE2OE1oeiAgICAtPiAgMTY3LjgzCi0JezIyMjUyMCwgMjIyNTMwLCAy
MjI3NTAsIDEwMDAsIDEwMDF9LAkvLzIyMi43NU1oeiAtPiAgMjIyLjUyNwotCXsyNTcxNDAsIDI1
NzE1MCwgMjU3NDAwLCAxMDAwLCAxMDAxfSwJLy8yNTcuNE1oeiAgLT4gIDI1Ny4xNDI5Ci0JezI5
NjcwMCwgMjk2NzEwLCAyOTcwMDAsIDEwMDAsIDEwMDF9LAkvLzI5N01oeiAgICAtPiAgMjk2Ljcw
MzMKLQl7MzQyODUwLCAzNDI4NjAsIDM0MzIwMCwgMTAwMCwgMTAwMX0sCS8vMzQzLjJNaHogIC0+
ICAzNDIuODU3Ci0JezM5NTYwMCwgMzk1NjEwLCAzOTYwMDAsIDEwMDAsIDEwMDF9LAkvLzM5Nk1o
eiAgICAtPiAgMzk1LjYKLQl7NDA5MDkwLCA0MDkxMDAsIDQwOTUwMCwgMTAwMCwgMTAwMX0sCS8v
NDA5LjVNaHogIC0+ICA0MDkuMDkxCi0JezQ0NTA1MCwgNDQ1MDYwLCA0NDU1MDAsIDEwMDAsIDEw
MDF9LAkvLzQ0NS41TWh6ICAtPiAgNDQ1LjA1NQotCXs0Njc1MzAsIDQ2NzU0MCwgNDY4MDAwLCAx
MDAwLCAxMDAxfSwJLy80NjhNaHogICAgLT4gIDQ2Ny41MzI1Ci0JezUxOTIzMCwgNTE5MjQwLCA1
MTk3NTAsIDEwMDAsIDEwMDF9LAkvLzUxOS43NU1oeiAtPiAgNTE5LjIzMQotCXs1MjU5NzAsIDUy
NTk4MCwgNTI2NTAwLCAxMDAwLCAxMDAxfSwJLy81MjYuNU1oeiAgLT4gIDUyNS45NzQKLQl7NTQ1
NDUwLCA1NDU0NjAsIDU0NjAwMCwgMTAwMCwgMTAwMX0sCS8vNTQ2TWh6ICAgIC0+ICA1NDUuNDU1
Ci0JezU5MzQwMCwgNTkzNDEwLCA1OTQwMDAsIDEwMDAsIDEwMDF9LAkvLzU5NE1oeiAgICAtPiAg
NTkzLjQwNjYKLQl7NjIzMzcwLCA2MjMzODAsIDYyNDAwMCwgMTAwMCwgMTAwMX0sCS8vNjI0TWh6
ICAgIC0+ICA2MjMuMzc3Ci0JezY5MjMwMCwgNjkyMzEwLCA2OTMwMDAsIDEwMDAsIDEwMDF9LAkv
LzY5M01oeiAgICAtPiAgNjkyLjMwOAotCXs3MDEyOTAsIDcwMTMwMCwgNzAyMDAwLCAxMDAwLCAx
MDAxfSwJLy83MDJNaHogICAgLT4gIDcwMS4yOTg3Ci0Jezc5MTIwMCwgNzkxMjEwLCA3OTIwMDAs
IDEwMDAsIDEwMDF9LAkvLzc5Mk1oeiAgICAtPiAgNzkxLjIwOQotCXs4OTAxMDAsIDg5MDExMCwg
ODkxMDAwLCAxMDAwLCAxMDAxfSwJLy84OTFNaHogICAgLT4gIDg5MC4xMDk5Ci0JezExODY4MTAs
IDExODY4MjAsIDExODgwMDAsIDEwMDAsIDEwMDF9LC8vMTE4OE1oeiAgIC0+IDExODYuODEzMQot
Ci0JLy8gKjEuMDAxIHJhdGVzCi0JezI3MDIwLCAyNzAzMCwgMjcwMDAsIDEwMDEsIDEwMDB9LCAv
LzI3TWh6Ci0JezU0MDUwLCA1NDA2MCwgNTQwMDAsIDEwMDEsIDEwMDB9LCAvLzU0TWh6Ci0JezEw
ODEwMCwgMTA4MTEwLCAxMDgwMDAsIDEwMDEsIDEwMDB9LC8vMTA4TWh6Ci19OwotCiBzdGF0aWMg
Ym9vbCBkY24yMF9wcm9ncmFtX3BpeF9jbGsoCiAJCXN0cnVjdCBjbG9ja19zb3VyY2UgKmNsb2Nr
X3NvdXJjZSwKIAkJc3RydWN0IHBpeGVsX2Nsa19wYXJhbXMgKnBpeF9jbGtfcGFyYW1zLAotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
