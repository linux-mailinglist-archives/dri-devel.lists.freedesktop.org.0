Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C1FCF3CC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43FA6E20F;
	Tue,  8 Oct 2019 07:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765646E047
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 02:42:06 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 991DDDCAB4BC3935C2E2;
 Tue,  8 Oct 2019 10:42:01 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 10:41:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <airlied@redhat.com>, <kraxel@redhat.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/qxl: Fix randbuild error
Date: Tue, 8 Oct 2019 10:40:54 +0800
Message-ID: <20191008024054.32368-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
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
Cc: spice-devel@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgREVNX1FYTCBpcyB5IGFuZCBEUk1fVFRNX0hFTFBFUiBpcyBtLCBidWlsZGluZyBmYWlsczoK
CmRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5vOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBkcm1fZ2VtX3R0bV9wcmludF9pbmZvJwoKU2VsZWN0IERSTV9UVE1fSEVMUEVSIHRvIGZpeCB0
aGlzLgoKRml4ZXM6IDc4ZDU0ZjFmNmEzMyAoImRybS9xeGw6IHVzZSBkcm1fZ2VtX3R0bV9wcmlu
dF9pbmZvIikKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9LY29uZmln
IGIvZHJpdmVycy9ncHUvZHJtL3F4bC9LY29uZmlnCmluZGV4IGQwZDY5MWIuLmNhM2Y1MWMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcXhsL0tjb25maWcKQEAgLTQsNiArNCw3IEBAIGNvbmZpZyBEUk1fUVhMCiAJZGVwZW5kcyBv
biBEUk0gJiYgUENJICYmIE1NVQogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1f
VFRNCisJc2VsZWN0IERSTV9UVE1fSEVMUEVSCiAJc2VsZWN0IENSQzMyCiAJaGVscAogCSAgUVhM
IHZpcnR1YWwgR1BVIGZvciBTcGljZSB2aXJ0dWFsaXphdGlvbiBkZXNrdG9wIGludGVncmF0aW9u
LgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
