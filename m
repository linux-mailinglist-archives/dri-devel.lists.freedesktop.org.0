Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD2D399E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042966EBBA;
	Fri, 11 Oct 2019 06:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3413F6E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:52:49 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0A6F3BE7D10C9D4D2960;
 Thu, 10 Oct 2019 19:52:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 10 Oct 2019 19:52:37 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>
Subject: [PATCH -next] drm/vkms: Remove duplicated include from vkms_drv.c
Date: Thu, 10 Oct 2019 11:52:13 +0000
Message-ID: <20191010115213.115706-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGR1cGxpY2F0ZWQgaW5jbHVkZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5j
IHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Ry
di5jCmluZGV4IDU0NzAzNDYzZDk2Ni4uZDFmZTE0NGFhMjg5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmttcy92a21zX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNf
ZHJ2LmMKQEAgLTE5LDcgKzE5LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1
ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+Ci0jaW5j
bHVkZSA8ZHJtL2RybV9nZW0uaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9o
ZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9w
cm9iZV9oZWxwZXIuaD4KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
