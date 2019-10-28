Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4501E7B2B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 22:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1026EA90;
	Mon, 28 Oct 2019 21:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58626E86B;
 Mon, 28 Oct 2019 13:34:58 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9A01375B8B23BB5841DE;
 Mon, 28 Oct 2019 21:34:53 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Mon, 28 Oct 2019
 21:34:45 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Dmytro.Laktyushkin@amd.com>,
 <charlene.liu@amd.com>, <eric.bernstein@amd.com>, <Jun.Lei@amd.com>,
 <Anthony.Koo@amd.com>, <Reza.Amini@amd.com>, <Harmanprit.Tatla@amd.com>
Subject: [PATCH -next] drm/amd/display: Make calculate_integer_scaling static
Date: Mon, 28 Oct 2019 21:34:36 +0800
Message-ID: <20191028133436.30608-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Oct 2019 21:09:49 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9jb3JlL2RjX3Jlc291cmNlLmM6OTYzOjY6CiB3YXJuaW5nOiBzeW1ib2wgJ2NhbGN1bGF0
ZV9pbnRlZ2VyX3NjYWxpbmcnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5kZXggNzBlNjAxYS4uMzc2OTgz
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVz
b3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNv
dXJjZS5jCkBAIC05NjAsNyArOTYwLDcgQEAgc3RhdGljIGJvb2wgYXJlX3JlY3RzX2ludGVnZXJf
bXVsdGlwbGVzKHN0cnVjdCByZWN0IHNyYywgc3RydWN0IHJlY3QgZGVzdCkKIAlyZXR1cm4gZmFs
c2U7CiB9CiAKLXZvaWQgY2FsY3VsYXRlX2ludGVnZXJfc2NhbGluZyhzdHJ1Y3QgcGlwZV9jdHgg
KnBpcGVfY3R4KQorc3RhdGljIHZvaWQgY2FsY3VsYXRlX2ludGVnZXJfc2NhbGluZyhzdHJ1Y3Qg
cGlwZV9jdHggKnBpcGVfY3R4KQogewogCWlmICghcGlwZV9jdHgtPnBsYW5lX3N0YXRlLT5zY2Fs
aW5nX3F1YWxpdHkuaW50ZWdlcl9zY2FsaW5nKQogCQlyZXR1cm47Ci0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
