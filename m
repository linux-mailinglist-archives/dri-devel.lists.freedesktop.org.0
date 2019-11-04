Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A7EE8C3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C0F6E842;
	Mon,  4 Nov 2019 19:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441186E438;
 Mon,  4 Nov 2019 13:20:18 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 90058C797121F5EFFA09;
 Mon,  4 Nov 2019 21:20:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:04 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 5/7] drm/amdgpu: remove set but not used variable 'dig'
Date: Mon, 4 Nov 2019 21:27:24 +0800
Message-ID: <1572874046-30996-6-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
References: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:10 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYzogSW4gZnVuY3Rpb24K4oCYYW1kZ3B1X2F0
b21iaW9zX2RwX2xpbmtfdHJhaW7igJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21i
aW9zX2RwLmM6NzE2OjM0OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkaWfigJkKc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkZpeGVzOiBkMzhjZWFmOTllZDAgKCJk
cm0vYW1kZ3B1OiBhZGQgY29yZSBkcml2ZXIgKHY0KSIpClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkg
PHl1a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9t
Ymlvc19kcC5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2RwLmMKaW5kZXggOTQyNjUzMC4uZWE3MDJhNiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19kcC5jCkBAIC03MTAsNyArNzEw
LDYgQEAgdm9pZCBhbWRncHVfYXRvbWJpb3NfZHBfbGlua190cmFpbihzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIsCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmRldjsKIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IGFt
ZGdwdV9lbmNvZGVyICphbWRncHVfZW5jb2RlciA9IHRvX2FtZGdwdV9lbmNvZGVyKGVuY29kZXIp
OwotCXN0cnVjdCBhbWRncHVfZW5jb2Rlcl9hdG9tX2RpZyAqZGlnOwogCXN0cnVjdCBhbWRncHVf
Y29ubmVjdG9yICphbWRncHVfY29ubmVjdG9yOwogCXN0cnVjdCBhbWRncHVfY29ubmVjdG9yX2F0
b21fZGlnICpkaWdfY29ubmVjdG9yOwogCXN0cnVjdCBhbWRncHVfYXRvbWJpb3NfZHBfbGlua190
cmFpbl9pbmZvIGRwX2luZm87CkBAIC03MTgsNyArNzE3LDYgQEAgdm9pZCBhbWRncHVfYXRvbWJp
b3NfZHBfbGlua190cmFpbihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAKIAlpZiAoIWFt
ZGdwdV9lbmNvZGVyLT5lbmNfcHJpdikKIAkJcmV0dXJuOwotCWRpZyA9IGFtZGdwdV9lbmNvZGVy
LT5lbmNfcHJpdjsKIAogCWFtZGdwdV9jb25uZWN0b3IgPSB0b19hbWRncHVfY29ubmVjdG9yKGNv
bm5lY3Rvcik7CiAJaWYgKCFhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdikKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
