Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE6185E9
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DCF89916;
	Thu,  9 May 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 968 seconds by postgrey-1.36 at gabe;
 Wed, 08 May 2019 13:12:05 UTC
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469AF89919;
 Wed,  8 May 2019 13:12:05 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4678F3A9E7B50225F17D;
 Wed,  8 May 2019 20:55:43 +0800 (CST)
Received: from huawei.com (10.184.227.228) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 8 May 2019
 20:55:33 +0800
From: Wang Hai <wanghai26@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Tony.Cheng@amd.com>,
 <Dmytro.Laktyushkin@amd.com>, <hersenxs.wu@amd.com>, <David.Francis@amd.com>, 
 <Jun.Lei@amd.com>, <Jerry.Zuo@amd.com>
Subject: [PATCH] drm/amd/display: Make some functions static
Date: Wed, 8 May 2019 20:55:16 +0800
Message-ID: <20190508125516.16732-1-wanghai26@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.184.227.228]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
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
Cc: wanghai26@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmdzOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6NDgzOjIxOiB3YXJu
aW5nOiBzeW1ib2wgJ2RjZTEyMF9jbG9ja19zb3VyY2VfY3JlYXRlJyB3YXMgbm90IGRlY2xhcmVk
LiBTaG91bGQgaXQgYmUgc3RhdGljPwpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYzo1MDY6Njogd2FybmluZzogc3ltYm9sICdk
Y2UxMjBfY2xvY2tfc291cmNlX2Rlc3Ryb3knIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBi
ZSBzdGF0aWM/CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIw
L2RjZTEyMF9yZXNvdXJjZS5jOjUxMzo2OiB3YXJuaW5nOiBzeW1ib2wgJ2RjZTEyMF9od19zZXF1
ZW5jZXJfY3JlYXRlJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKRml4
ZXM6IGI4ZmRmY2M2YTkyYyAoImRybS9hbWQvZGlzcGxheTogQWRkIERDRTEyIGNvcmUgc3VwcG9y
dCIpClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogV2FuZyBIYWkgPHdhbmdoYWkyNkBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2Uu
YwppbmRleCAzMTJhMGFlYmY5MWYuLjA5NDg0MjEyMTllZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jCkBAIC00
NTgsNyArNDU4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIGRlYnVn
X2RlZmF1bHRzID0gewogCQkuZGlzYWJsZV9jbG9ja19nYXRlID0gdHJ1ZSwKIH07CiAKLXN0cnVj
dCBjbG9ja19zb3VyY2UgKmRjZTEyMF9jbG9ja19zb3VyY2VfY3JlYXRlKAorc3RhdGljIHN0cnVj
dCBjbG9ja19zb3VyY2UgKmRjZTEyMF9jbG9ja19zb3VyY2VfY3JlYXRlKAogCXN0cnVjdCBkY19j
b250ZXh0ICpjdHgsCiAJc3RydWN0IGRjX2Jpb3MgKmJpb3MsCiAJZW51bSBjbG9ja19zb3VyY2Vf
aWQgaWQsCkBAIC00ODEsMTQgKzQ4MSwxNCBAQCBzdHJ1Y3QgY2xvY2tfc291cmNlICpkY2UxMjBf
Y2xvY2tfc291cmNlX2NyZWF0ZSgKIAlyZXR1cm4gTlVMTDsKIH0KIAotdm9pZCBkY2UxMjBfY2xv
Y2tfc291cmNlX2Rlc3Ryb3koc3RydWN0IGNsb2NrX3NvdXJjZSAqKmNsa19zcmMpCitzdGF0aWMg
dm9pZCBkY2UxMjBfY2xvY2tfc291cmNlX2Rlc3Ryb3koc3RydWN0IGNsb2NrX3NvdXJjZSAqKmNs
a19zcmMpCiB7CiAJa2ZyZWUoVE9fRENFMTEwX0NMS19TUkMoKmNsa19zcmMpKTsKIAkqY2xrX3Ny
YyA9IE5VTEw7CiB9CiAKIAotYm9vbCBkY2UxMjBfaHdfc2VxdWVuY2VyX2NyZWF0ZShzdHJ1Y3Qg
ZGMgKmRjKQorc3RhdGljIGJvb2wgZGNlMTIwX2h3X3NlcXVlbmNlcl9jcmVhdGUoc3RydWN0IGRj
ICpkYykKIHsKIAkvKiBBbGwgcmVnaXN0ZXJzIHVzZWQgYnkgZGNlMTEuMiBtYXRjaCB0aG9zZSBp
biBkY2UxMSBpbiBvZmZzZXQgYW5kCiAJICogc3RydWN0dXJlCi0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
