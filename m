Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC6A9B5B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D11689DC5;
	Thu,  5 Sep 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07275898C6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:51:36 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 779DCDDBA4A18AEEDC9F;
 Wed,  4 Sep 2019 19:51:33 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 19:51:24 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <b.zolnierkie@samsung.com>, <allison@lohutok.net>, <mcgrof@kernel.org>,
 <yuehaibing@huawei.com>, <rfontana@redhat.com>, <tglx@linutronix.de>
Subject: [PATCH -next] fbdev: da8xx-fb: use devm_platform_ioremap_resource()
 to simplify code
Date: Wed, 4 Sep 2019 19:50:28 +0800
Message-ID: <20190904115028.25392-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
IGEgYml0LgpUaGlzIGlzIGRldGVjdGVkIGJ5IGNvY2NpbmVsbGUuCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMg
fCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2RhOHh4LWZiLmMKaW5kZXggYjFjZjI0OC4uNTc1MThkNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
ZGE4eHgtZmIuYwpAQCAtMTMyOCw3ICsxMzI4LDYgQEAgc3RhdGljIGludCBmYl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXZpY2UpCiB7CiAJc3RydWN0IGRhOHh4X2xjZGNfcGxhdGZv
cm1fZGF0YSAqZmJfcGRhdGEgPQogCQkJCQkJZGV2X2dldF9wbGF0ZGF0YSgmZGV2aWNlLT5kZXYp
OwotCXN0cnVjdCByZXNvdXJjZSAqbGNkY19yZWdzOwogCXN0cnVjdCBsY2RfY3RybF9jb25maWcg
KmxjZF9jZmc7CiAJc3RydWN0IGZiX3ZpZGVvbW9kZSAqbGNkY19pbmZvOwogCXN0cnVjdCBmYl9p
bmZvICpkYTh4eF9mYl9pbmZvOwpAQCAtMTM0Niw4ICsxMzQ1LDcgQEAgc3RhdGljIGludCBmYl9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXZpY2UpCiAJaWYgKGxjZGNfaW5mbyA9PSBO
VUxMKQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCWxjZGNfcmVncyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShkZXZpY2UsIElPUkVTT1VSQ0VfTUVNLCAwKTsKLQlkYTh4eF9mYl9yZWdfYmFzZSA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZSgmZGV2aWNlLT5kZXYsIGxjZGNfcmVncyk7CisJZGE4eHhfZmJf
cmVnX2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoZGV2aWNlLCAwKTsKIAlp
ZiAoSVNfRVJSKGRhOHh4X2ZiX3JlZ19iYXNlKSkKIAkJcmV0dXJuIFBUUl9FUlIoZGE4eHhfZmJf
cmVnX2Jhc2UpOwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
