Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87918114D75
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA26D6F997;
	Fri,  6 Dec 2019 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B426E9EE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 06:53:11 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5006FFFC772847A8BCAD;
 Fri,  6 Dec 2019 14:53:08 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Dec 2019
 14:52:59 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>
Subject: [PATCH -next] drm/tegra: sor: Fix unused function warnings
Date: Fri, 6 Dec 2019 14:47:41 +0800
Message-ID: <20191206064741.23432-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
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
Cc: linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jOjM5ODQ6MTI6IHdhcm5pbmc6ICd0ZWdyYV9zb3Jf
cmVzdW1lJyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCmRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYzozOTcwOjEyOiB3YXJuaW5nOiAndGVncmFfc29yX3N1c3BlbmQn
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jOjM5Mzc6MTI6IHdhcm5pbmc6ICd0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUn
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jOjM5MTU6MTI6IHdhcm5pbmc6ICd0ZWdyYV9zb3JfcnVudGltZV9zdXNwZW5k
JyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCgpNYXJrIHRoZXNlIGZ1
bmN0aW9ucyBhcyBfX21heWJlX3VudXNlZCBzbyBnY2MgY2FuIGRyb3AgdGhlbQpzaWxlbnRseS4K
ClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1i
eTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9zb3IuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCmluZGV4IGE2OGQzYjMuLjY5YjllYmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvc29yLmMKQEAgLTM5MTIsNyArMzkxMiw3IEBAIHN0YXRpYyBpbnQgdGVncmFf
c29yX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQog
Ci1zdGF0aWMgaW50IHRlZ3JhX3Nvcl9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCB0ZWdyYV9zb3JfcnVudGltZV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKIAlpbnQgZXJyOwpAQCAtMzkzNCw3ICszOTM0LDcgQEAgc3RhdGljIGludCB0
ZWdyYV9zb3JfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gMDsK
IH0KIAotc3RhdGljIGludCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCB0ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwogCWludCBlcnI7CkBAIC0zOTY3LDcgKzM5NjcsNyBAQCBzdGF0aWMgaW50
IHRlZ3JhX3Nvcl9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQor
c3RhdGljIGludCBfX21heWJlX3VudXNlZCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiB7CiAJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRldik7
CiAJaW50IGVycjsKQEAgLTM5ODEsNyArMzk4MSw3IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHRl
Z3JhX3Nvcl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBfX21heWJlX3Vu
dXNlZCB0ZWdyYV9zb3JfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgdGVn
cmFfc29yICpzb3IgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQgZXJyOwotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
