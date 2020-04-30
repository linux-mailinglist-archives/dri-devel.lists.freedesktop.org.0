Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A681BF166
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706B6E139;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D346E9E4;
 Thu, 30 Apr 2020 02:19:58 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8E3BE1679F5742A7E362;
 Thu, 30 Apr 2020 10:19:54 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 10:19:45 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: remove set but not used variable
 'direct_poll' in vcn_v2_0.c
Date: Thu, 30 Apr 2020 10:26:52 +0800
Message-ID: <20200430022653.46365-3-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200430022653.46365-1-zhengbin13@huawei.com>
References: <20200430022653.46365-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYzoxODQ4OjM5OiB3YXJuaW5nOiB2YXJpYWJsZSDi
gJhkaXJlY3RfcG9sbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQoKSXQgaXMgaW50cm9kdWNlZCBieSBjb21taXQgZGQyNjg1OGE5Y2Q4ICgiZHJtL2FtZGdw
dToKaW1wbGVtZW50IGluaXRpYWxpemF0aW9uIHBhcnQgb24gVkNOMi4wIGZvciBTUklPViIpLCBi
dXQgbmV2ZXIgdXNlZCwKc28gcmVtb3ZlIGl0LgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1
bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGVuZyBCaW4gPHpoZW5nYmluMTNAaHVh
d2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMyAt
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfMC5jCmluZGV4IDM0OWRhN2JmN2M2OC4uOTBlZDc3MzY5NWVhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKQEAgLTE4NDUsNyArMTg0NSw2IEBAIHN0YXRpYyBp
bnQgdmNuX3YyXzBfc3RhcnRfc3Jpb3Yoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdWlu
dDMyX3QgdGFibGVfc2l6ZSA9IDA7CiAJc3RydWN0IG1tc2NoX3YyXzBfY21kX2RpcmVjdF93cml0
ZSBkaXJlY3Rfd3QgPSB7IHswfSB9OwogCXN0cnVjdCBtbXNjaF92Ml8wX2NtZF9kaXJlY3RfcmVh
ZF9tb2RpZnlfd3JpdGUgZGlyZWN0X3JkX21vZF93dCA9IHsgezB9IH07Ci0Jc3RydWN0IG1tc2No
X3YyXzBfY21kX2RpcmVjdF9wb2xsaW5nIGRpcmVjdF9wb2xsID0geyB7MH0gfTsKIAlzdHJ1Y3Qg
bW1zY2hfdjJfMF9jbWRfZW5kIGVuZCA9IHsgezB9IH07CiAJc3RydWN0IG1tc2NoX3YyXzBfaW5p
dF9oZWFkZXIgKmhlYWRlcjsKIAl1aW50MzJfdCAqaW5pdF90YWJsZSA9IGFkZXYtPnZpcnQubW1f
dGFibGUuY3B1X2FkZHI7CkBAIC0xODU1LDggKzE4NTQsNiBAQCBzdGF0aWMgaW50IHZjbl92Ml8w
X3N0YXJ0X3NyaW92KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWRpcmVjdF93dC5jbWRf
aGVhZGVyLmNvbW1hbmRfdHlwZSA9IE1NU0NIX0NPTU1BTkRfX0RJUkVDVF9SRUdfV1JJVEU7CiAJ
ZGlyZWN0X3JkX21vZF93dC5jbWRfaGVhZGVyLmNvbW1hbmRfdHlwZSA9CiAJCU1NU0NIX0NPTU1B
TkRfX0RJUkVDVF9SRUdfUkVBRF9NT0RJRllfV1JJVEU7Ci0JZGlyZWN0X3BvbGwuY21kX2hlYWRl
ci5jb21tYW5kX3R5cGUgPQotCQlNTVNDSF9DT01NQU5EX19ESVJFQ1RfUkVHX1BPTExJTkc7CiAJ
ZW5kLmNtZF9oZWFkZXIuY29tbWFuZF90eXBlID0gTU1TQ0hfQ09NTUFORF9fRU5EOwoKIAlpZiAo
aGVhZGVyLT52Y25fdGFibGVfb2Zmc2V0ID09IDAgJiYgaGVhZGVyLT52Y25fdGFibGVfc2l6ZSA9
PSAwKSB7Ci0tCjIuMjYuMC4xMDYuZzlmYWRlZGQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
