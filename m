Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2435BD2131
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4FF89FD3;
	Thu, 10 Oct 2019 06:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953786E9AE;
 Wed,  9 Oct 2019 14:06:24 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7FAAF3A6F2849E1D75E3;
 Wed,  9 Oct 2019 22:06:18 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 22:06:12 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in
 modeset_init
Date: Wed, 9 Oct 2019 22:13:23 +0800
Message-ID: <1570630403-92371-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:04 +0000
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
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYzogSW4gZnVuY3Rpb24gbW9kZXNldF9pbml0
Ogpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jOjQ1ODoyODogd2Fybmlu
ZzogdmFyaWFibGUgaHdfY2ZnIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCgpJdCBpcyBub3QgdXNlZCBzaW5jZSBjb21taXQgMzZkMTM2NGFiYmVkICgiZHJtL21z
bS9tZHA1OgpDbGVhbiB1cCBpbnRlcmZhY2UgYXNzaWdubWVudCIpCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVu
Z2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwppbmRleCBmOGJkMGJmLi41NDc2ODkyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKQEAgLTQ2MSwxNCArNDYx
LDExIEBAIHN0YXRpYyBpbnQgbW9kZXNldF9pbml0KHN0cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMp
CiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1kcDVfa21zLT5kZXY7CiAJc3RydWN0IG1z
bV9kcm1fcHJpdmF0ZSAqcHJpdiA9IGRldi0+ZGV2X3ByaXZhdGU7Ci0JY29uc3Qgc3RydWN0IG1k
cDVfY2ZnX2h3ICpod19jZmc7CiAJdW5zaWduZWQgaW50IG51bV9jcnRjczsKIAlpbnQgaSwgcmV0
LCBwaSA9IDAsIGNpID0gMDsKIAlzdHJ1Y3QgZHJtX3BsYW5lICpwcmltYXJ5W01BWF9CQVNFU10g
PSB7IE5VTEwgfTsKIAlzdHJ1Y3QgZHJtX3BsYW5lICpjdXJzb3JbTUFYX0JBU0VTXSA9IHsgTlVM
TCB9OwoKLQlod19jZmcgPSBtZHA1X2NmZ19nZXRfaHdfY29uZmlnKG1kcDVfa21zLT5jZmcpOwot
CiAJLyoKIAkgKiBDb25zdHJ1Y3QgZW5jb2RlcnMgYW5kIG1vZGVzZXQgaW5pdGlhbGl6ZSBjb25u
ZWN0b3IgZGV2aWNlcwogCSAqIGZvciBlYWNoIGV4dGVybmFsIGRpc3BsYXkgaW50ZXJmYWNlLgot
LQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
