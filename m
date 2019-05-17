Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3A265E1
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45C489B12;
	Wed, 22 May 2019 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Fri, 17 May 2019 08:54:43 UTC
Received: from SMTPBG360.QQ.COM (SMTPBG360.QQ.COM [183.61.51.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1A989483;
 Fri, 17 May 2019 08:54:43 +0000 (UTC)
X-QQ-mid: bizesmtp16t1558082773tm07v0xa
Received: from localhost.localdomain (unknown [218.76.23.26])
 by esmtp4.qq.com (ESMTP) with 
 id ; Fri, 17 May 2019 16:46:07 +0800 (CST)
X-QQ-SSF: 01400000000000H0HH32B00A0000000
X-QQ-FEAT: CFH4W+6pIGx1dJE2Hd1A+5u95gxttT7bEag7TWWOa4cDVjC/xNT1V6RQJB1Xo
 jnBLKAmsznvjtywdbljTIWWgZmPmQU4po06R+W9mXx7x+DbYOf6O3hCkEbry3Evs0QMf8rg
 A1nbpNwlShiHZD+YA4fXz/DA8KB2UE9irk2ERQFcIRskVUblI2yMBGnTi8kYP/YUH0/OcUu
 LUaJkGfnND0zIbLx0BofW4fgOSH5oX5iSiYEYWWT2jbnziGMZIqiKepA2GChIp2I8VyeGZS
 zQnty7doCaOryy67wc484PZ8Q6yI4eFsw6KGsX+xd9M2MiNhayiOWSIxg7glKXHC4iYA==
X-QQ-GoodBg: 2
From: xiaolinkui <xiaolinkui@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, xinhui.pan@amd.com, evan.quan@amd.com
Subject: [PATCH] gpu: drm: use struct_size() in kmalloc()
Date: Fri, 17 May 2019 16:46:00 +0800
Message-Id: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
X-Mailer: git-send-email 2.7.4
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.cn:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Cc: xiaolinkui@kylinos.cn, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHN0cnVjdF9zaXplKCkgaGVscGVyIHRvIGtlZXAgY29kZSBzaW1wbGUuCgpTaWduZWQtb2Zm
LWJ5OiB4aWFvbGlua3VpIDx4aWFvbGlua3VpQGt5bGlub3MuY24+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMKaW5kZXggMjJiZDIxZS4uNDcxN2E2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwpAQCAtMTM3NSw4ICsxMzc1LDcgQEAgaW50IGFtZGdwdV9yYXNfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpZiAoY29uKQogCQlyZXR1cm4gMDsKIAot
CWNvbiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBhbWRncHVfcmFzKSArCi0JCQlzaXplb2Yoc3Ry
dWN0IHJhc19tYW5hZ2VyKSAqIEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQsCisJY29uID0ga21hbGxv
YyhzdHJ1Y3Rfc2l6ZShjb24sIG9ianMsIEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQpLAogCQkJR0ZQ
X0tFUk5FTHxfX0dGUF9aRVJPKTsKIAlpZiAoIWNvbikKIAkJcmV0dXJuIC1FTk9NRU07Ci0tIAoy
LjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
