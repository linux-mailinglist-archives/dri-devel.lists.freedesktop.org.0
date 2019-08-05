Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5D82C8E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9912C89B70;
	Tue,  6 Aug 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 947 seconds by postgrey-1.36 at gabe;
 Mon, 05 Aug 2019 09:32:44 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBDD89AB9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:32:44 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4BC3DB1E1B39F72280FD;
 Mon,  5 Aug 2019 17:16:55 +0800 (CST)
Received: from localhost.localdomain (10.67.212.132) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Mon, 5 Aug 2019 17:16:48 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/pl111: Fix unused variable warning
Date: Mon, 5 Aug 2019 17:14:16 +0800
Message-ID: <1564996456-55677-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.67.212.132]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYzogSW4gZnVuY3Rpb24g4oCYcGwxMTFf
ZGlzcGxheV9pbml04oCZOgpkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jOjU1
MToxNzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlCuKAmGRlduKAmSBbLVd1bnVzZWQtdmFyaWFi
bGVdCiAgc3RydWN0IGRldmljZSAqZGV2ID0gZHJtLT5kZXY7CiAgICAgICAgICAgICAgICAgXgpG
aXhlczogZDY3ODFlNDkwMTc5ICgiZHJtL3BsMTExOiBEcm9wIHNwZWNpYWwgcGFkcyBjb25maWcg
Y2hlY2siKQpDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzog
RXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1i
eTogU2hhb2t1biBaaGFuZyA8emhhbmdzaGFva3VuQGhpc2lsaWNvbi5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlz
cGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwppbmRleCA4ZmU2
NTk2OWI3YjguLjlhMTUzMTI1ZTVkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTEx
L3BsMTExX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxh
eS5jCkBAIC01NDgsNyArNTQ4LDYgQEAgcGwxMTFfaW5pdF9jbG9ja19kaXZpZGVyKHN0cnVjdCBk
cm1fZGV2aWNlICpkcm0pCiBpbnQgcGwxMTFfZGlzcGxheV9pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0pCiB7CiAJc3RydWN0IHBsMTExX2RybV9kZXZfcHJpdmF0ZSAqcHJpdiA9IGRybS0+ZGV2
X3ByaXZhdGU7Ci0Jc3RydWN0IGRldmljZSAqZGV2ID0gZHJtLT5kZXY7CiAJaW50IHJldDsKIAog
CXJldCA9IHBsMTExX2luaXRfY2xvY2tfZGl2aWRlcihkcm0pOwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
