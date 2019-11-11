Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F53F6F68
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 09:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34F66E84D;
	Mon, 11 Nov 2019 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771DE6E11B;
 Mon, 11 Nov 2019 04:02:13 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AA57C6AAD5EFC3DB08D5;
 Mon, 11 Nov 2019 12:02:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 11 Nov 2019
 12:02:04 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <rex.zhu@amd.com>, <evan.quan@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: remove set but not used variable
 'threshold', 'state'
Date: Mon, 11 Nov 2019 12:09:28 +0800
Message-ID: <1573445368-132319-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 11 Nov 2019 08:06:55 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmM6IEluIGZ1bmN0aW9uIGZp
amlfcG9wdWxhdGVfc2luZ2xlX2dyYXBoaWNfbGV2ZWw6CmRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jOjk0MzoxMTogd2FybmluZzogdmFyaWFibGUgdGhy
ZXNob2xkIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCmRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jOiBJbiBmdW5jdGlv
biBmaWppX3BvcHVsYXRlX21lbW9yeV90aW1pbmdfcGFyYW1ldGVyczoKZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmM6MTUwNDo4OiB3YXJuaW5nOiB2YXJp
YWJsZSBzdGF0ZSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoK
VGhleSBhcmUgaW50cm9kdWNlZCBieSBjb21taXQgMmUxMTJiNGFlM2JhICgiZHJtL2FtZC9wcDoK
cmVtb3ZlIGZpamlfc21jL3NtdW1nciBzcGxpdC4iKSwgYnV0IG5ldmVyIHVzZWQsCnNvIHJlbW92
ZSBpdC4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVk
LW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyB8IDcgKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jCmluZGV4IGRh
MDI1YjEuLjMyZWJiMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdW1nci9maWppX3NtdW1nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdW1nci9maWppX3NtdW1nci5jCkBAIC05NDAsNyArOTQwLDcgQEAgc3RhdGljIGludCBmaWpp
X3BvcHVsYXRlX3NpbmdsZV9ncmFwaGljX2xldmVsKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiB7
CiAJaW50IHJlc3VsdDsKIAkvKiBQUF9DbG9ja3MgbWluQ2xvY2tzOyAqLwotCXVpbnQzMl90IHRo
cmVzaG9sZCwgbXZkZDsKKwl1aW50MzJfdCBtdmRkOwogCXN0cnVjdCBzbXU3X2h3bWdyICpkYXRh
ID0gKHN0cnVjdCBzbXU3X2h3bWdyICopKGh3bWdyLT5iYWNrZW5kKTsKIAlzdHJ1Y3QgcGhtX3Bw
dF92MV9pbmZvcm1hdGlvbiAqdGFibGVfaW5mbyA9CiAJCQkoc3RydWN0IHBobV9wcHRfdjFfaW5m
b3JtYXRpb24gKikoaHdtZ3ItPnBwdGFibGUpOwpAQCAtOTczLDggKzk3Myw2IEBAIHN0YXRpYyBp
bnQgZmlqaV9wb3B1bGF0ZV9zaW5nbGVfZ3JhcGhpY19sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3
bWdyLAogCWxldmVsLT5Wb2x0YWdlRG93bkh5c3QgPSAwOwogCWxldmVsLT5Qb3dlclRocm90dGxl
ID0gMDsKCi0JdGhyZXNob2xkID0gY2xvY2sgKiBkYXRhLT5mYXN0X3dhdGVybWFya190aHJlc2hv
bGQgLyAxMDA7Ci0KIAlkYXRhLT5kaXNwbGF5X3RpbWluZy5taW5fY2xvY2tfaW5fc3IgPSBod21n
ci0+ZGlzcGxheV9jb25maWctPm1pbl9jb3JlX3NldF9jbG9ja19pbl9zcjsKCiAJaWYgKHBobV9j
YXBfZW5hYmxlZChod21nci0+cGxhdGZvcm1fZGVzY3JpcHRvci5wbGF0Zm9ybUNhcHMsIFBITV9Q
bGF0Zm9ybUNhcHNfU2Nsa0RlZXBTbGVlcCkpCkBAIC0xNTAxLDcgKzE0OTksNyBAQCBzdGF0aWMg
aW50IGZpamlfcG9wdWxhdGVfbWVtb3J5X3RpbWluZ19wYXJhbWV0ZXJzKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsCiAJdWludDMyX3QgZHJhbV90aW1pbmc7CiAJdWludDMyX3QgZHJhbV90aW1pbmcy
OwogCXVpbnQzMl90IGJ1cnN0VGltZTsKLQlVTE9ORyBzdGF0ZSwgdHJyZHMsIHRycmRsOworCVVM
T05HIHRycmRzLCB0cnJkbDsKIAlpbnQgcmVzdWx0OwoKIAlyZXN1bHQgPSBhdG9tY3RybF9zZXRf
ZW5naW5lX2RyYW1fdGltaW5nc19ydjc3MChod21nciwKQEAgLTE1MTMsNyArMTUxMSw2IEBAIHN0
YXRpYyBpbnQgZmlqaV9wb3B1bGF0ZV9tZW1vcnlfdGltaW5nX3BhcmFtZXRlcnMoc3RydWN0IHBw
X2h3bWdyICpod21nciwKIAlkcmFtX3RpbWluZzIgPSBjZ3NfcmVhZF9yZWdpc3Rlcihod21nci0+
ZGV2aWNlLCBtbU1DX0FSQl9EUkFNX1RJTUlORzIpOwogCWJ1cnN0VGltZSA9IGNnc19yZWFkX3Jl
Z2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1tTUNfQVJCX0JVUlNUX1RJTUUpOwoKLQlzdGF0ZSA9IFBI
TV9HRVRfRklFTEQoYnVyc3RUaW1lLCBNQ19BUkJfQlVSU1RfVElNRSwgU1RBVEUwKTsKIAl0cnJk
cyA9IFBITV9HRVRfRklFTEQoYnVyc3RUaW1lLCBNQ19BUkJfQlVSU1RfVElNRSwgVFJSRFMwKTsK
IAl0cnJkbCA9IFBITV9HRVRfRklFTEQoYnVyc3RUaW1lLCBNQ19BUkJfQlVSU1RfVElNRSwgVFJS
REwwKTsKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
