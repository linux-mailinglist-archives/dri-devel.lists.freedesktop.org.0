Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C8FF8FC
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A4D6E2E0;
	Sun, 17 Nov 2019 11:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8206E330;
 Fri, 15 Nov 2019 13:35:23 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 609BAF30AD47373AD799;
 Fri, 15 Nov 2019 21:35:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 21:35:10 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <bskeggs@redhat.com>, <lyude@redhat.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/nouveau: remove set but not used variable 'mem'
Date: Fri, 15 Nov 2019 21:42:33 +0800
Message-ID: <1573825353-86268-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
References: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
cHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYzogSW4gZnVuY3Rpb24gbm91dmVhdV92cmFtX21h
bmFnZXJfbmV3Ogpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jOjY2OjIyOiB3
YXJuaW5nOiB2YXJpYWJsZSBtZW0gc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYzogSW4gZnVuY3Rp
b24gbm91dmVhdV9nYXJ0X21hbmFnZXJfbmV3Ogpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3R0bS5jOjEwNjoyMjogd2FybmluZzogdmFyaWFibGUgbWVtIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGUgZmlyc3QgJ21lbScgaXMgaW50cm9kdWNl
ZCBieSBjb21taXQgOWNlNTIzY2MzYmYyICgiZHJtL25vdXZlYXU6CnNlcGFyYXRlIGJ1ZmZlciBv
YmplY3QgYmFja2luZyBtZW1vcnkgZnJvbSBudmttIHN0cnVjdHVyZXMiKSwKYnV0IG5ldmVyIHVz
ZWQsIHNvIHJlbW92ZSBpdC4KClRoZSBzZWNvbmQgJ21lbScgaXMgbm90IHVzZWQgc2luY2UgY29t
bWl0IGQ3NzIyMTM0YjgyNSAoImRybS9ub3V2ZWF1Ogpzd2l0Y2ggb3ZlciB0byBuZXcgbWVtb3J5
IGFuZCB2bW0gaW50ZXJmYWNlcyIpCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1
YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyB8IDQgLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
dHRtLmMKaW5kZXggNzdhMGM2YS4uN2NhMGEyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3R0bS5jCkBAIC02MywxNCArNjMsMTIgQEAgbm91dmVhdV92cmFtX21hbmFnZXJfbmV3KHN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAogewogCXN0cnVjdCBub3V2ZWF1X2JvICpu
dmJvID0gbm91dmVhdV9ibyhibyk7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1
X2JkZXYoYm8tPmJkZXYpOwotCXN0cnVjdCBub3V2ZWF1X21lbSAqbWVtOwogCWludCByZXQ7Cgog
CWlmIChkcm0tPmNsaWVudC5kZXZpY2UuaW5mby5yYW1fc2l6ZSA9PSAwKQogCQlyZXR1cm4gLUVO
T01FTTsKCiAJcmV0ID0gbm91dmVhdV9tZW1fbmV3KCZkcm0tPm1hc3RlciwgbnZiby0+a2luZCwg
bnZiby0+Y29tcCwgcmVnKTsKLQltZW0gPSBub3V2ZWF1X21lbShyZWcpOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CgpAQCAtMTAzLDExICsxMDEsOSBAQCBub3V2ZWF1X2dhcnRfbWFuYWdlcl9u
ZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCiB7CiAJc3RydWN0IG5vdXZlYXVf
Ym8gKm52Ym8gPSBub3V2ZWF1X2JvKGJvKTsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5v
dXZlYXVfYmRldihiby0+YmRldik7Ci0Jc3RydWN0IG5vdXZlYXVfbWVtICptZW07CiAJaW50IHJl
dDsKCiAJcmV0ID0gbm91dmVhdV9tZW1fbmV3KCZkcm0tPm1hc3RlciwgbnZiby0+a2luZCwgbnZi
by0+Y29tcCwgcmVnKTsKLQltZW0gPSBub3V2ZWF1X21lbShyZWcpOwogCWlmIChyZXQpCiAJCXJl
dHVybiByZXQ7CgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
