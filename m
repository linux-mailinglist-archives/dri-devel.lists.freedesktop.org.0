Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F1E97EC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5855F6ECB4;
	Wed, 30 Oct 2019 08:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799346E87A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 02:01:58 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 76DF0634D4CC540C04D3;
 Wed, 30 Oct 2019 10:01:55 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Wed, 30 Oct 2019 10:01:44 +0800
From: zhong jiang <zhongjiang@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd/display: remove redundant null pointer check before
 kfree
Date: Wed, 30 Oct 2019 09:57:53 +0800
Message-ID: <1572400673-42535-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhongjiang@huawei.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a2ZyZWUgaGFzIHRha2VuIG51bGwgcG9pbnRlciBpbnRvIGFjY291bnQuIGhlbmNlIGl0IGlzIHNh
ZmUgdG8gcmVtb3ZlCnRoZSB1bm5lY2Vzc2FyeSBjaGVjay4KClNpZ25lZC1vZmYtYnk6IHpob25n
IGppYW5nIDx6aG9uZ2ppYW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2hkY3AvaGRjcF9tc2cuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9oZGNwL2hkY3BfbXNnLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvaGRjcC9oZGNwX21zZy5jCmluZGV4IGNmNmVmMzguLjZmNzMwYjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9oZGNwL2hkY3BfbXNnLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2hkY3AvaGRjcF9tc2cuYwpAQCAtMTc0LDkgKzE3
NCw3IEBAIHN0YXRpYyBib29sIGhkbWlfMTRfcHJvY2Vzc190cmFuc2FjdGlvbigKIAkJCWxpbmst
PmN0eCwKIAkJCWxpbmssCiAJCQkmaTJjX2NvbW1hbmQpOwotCi0JaWYgKGJ1ZmYpCi0JCWtmcmVl
KGJ1ZmYpOworCWtmcmVlKGJ1ZmYpOwogCiAJcmV0dXJuIHJlc3VsdDsKIH0KLS0gCjEuNy4xMi40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
