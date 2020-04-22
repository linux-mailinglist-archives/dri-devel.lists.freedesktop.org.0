Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52931B382B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A69F6E9D2;
	Wed, 22 Apr 2020 06:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176115.mail.qiye.163.com (m176115.mail.qiye.163.com
 [59.111.176.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D27E6E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 01:46:34 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 30EAF6633BC;
 Wed, 22 Apr 2020 09:46:26 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5] drm/amdgpu: cleanup coding style in amdkfd a bit
Date: Tue, 21 Apr 2020 18:46:18 -0700
Message-Id: <20200422014618.4020-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZTlVIQkpCQkJMSUpOSUxKWVdZKFlBSE
 83V1ktWUFJV1kJDhceCFlBWTU0KTY6NyQpLjc#WQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pj46NRw4TDg4KAINLUMYET4e
 K04KC0JVSlVKTkNMTkpCQkNCTktJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBSEhLSTcG
X-HM-Tid: 0a719f909ad89373kuws30eaf6633bc
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSB0aGUgY29kZSBhIGJpdCBtb3JlIHJlYWRhYmxlIGJ5IHVzaW5nIGEgY29tbW9uCmVycm9y
IGhhbmRsaW5nIHBhdHRlcm4uCldpdGggdGhhdCBkb25lIHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KClNpZ25lZC1v
ZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KCkNoYW5nZXMgc2luY2UgVjE6
Cipjb21taXQgbWVzc2FnZSBpbXByb3ZlCipjb2RlIHN0eWxlIHJlZmFjdG9yaW5nCgpDaGFuZ2Vz
IHNpbmNlIFYyOgoqY29kZSBzdHlsZSBhZGp1c3QKCkNoYW5nZXMgc2luY2UgVjM6CipmaW5kIHRo
ZSBiZXN0IHdheSB0byBtZXJnZSB1bm5lY2Vzc2FyeSBpZi9lbHNlIGNoZWNrIGJyYW5jaAoKQ2hh
bmdlcyBzaW5jZSBWNDoKKkltcHJvdmUgdGhlIHN1YmplY3QgbGluZSBhbmQgY29tbWl0IG1lc3Nh
Z2UKCkxpbmsgZm9yIFYxOgoqaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNo
LzEyMjY1ODcvCi0tLQogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMgIHwgMjAgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDlkZmY3OTJjOTI5MC4uYWNiNjEyYzUzYjljIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
CkBAIC02NjAsMTUgKzY2MCwxNSBAQCBzdGF0aWMgaW50IHJlc2VydmVfYm9fYW5kX3ZtKHN0cnVj
dCBrZ2RfbWVtICptZW0sCiAKIAlyZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZjdHgtPnRp
Y2tldCwgJmN0eC0+bGlzdCwKIAkJCQkgICAgIGZhbHNlLCAmY3R4LT5kdXBsaWNhdGVzKTsKLQlp
ZiAoIXJldCkKLQkJY3R4LT5yZXNlcnZlZCA9IHRydWU7Ci0JZWxzZSB7Ci0JCXByX2VycigiRmFp
bGVkIHRvIHJlc2VydmUgYnVmZmVycyBpbiB0dG1cbiIpOworCWlmIChyZXQpIHsKKwkJcHJfZXJy
KCJGYWlsZWQgdG8gcmVzZXJ2ZSBidWZmZXJzIGluIHR0bS5cbiIpOwogCQlrZnJlZShjdHgtPnZt
X3BkKTsKIAkJY3R4LT52bV9wZCA9IE5VTEw7CisJCXJldHVybiByZXQ7CiAJfQogCi0JcmV0dXJu
IHJldDsKKwljdHgtPnJlc2VydmVkID0gdHJ1ZTsKKwlyZXR1cm4gMDsKIH0KIAogLyoqCkBAIC03
MzMsMTcgKzczMywxNSBAQCBzdGF0aWMgaW50IHJlc2VydmVfYm9fYW5kX2NvbmRfdm1zKHN0cnVj
dCBrZ2RfbWVtICptZW0sCiAKIAlyZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZjdHgtPnRp
Y2tldCwgJmN0eC0+bGlzdCwKIAkJCQkgICAgIGZhbHNlLCAmY3R4LT5kdXBsaWNhdGVzKTsKLQlp
ZiAoIXJldCkKLQkJY3R4LT5yZXNlcnZlZCA9IHRydWU7Ci0JZWxzZQotCQlwcl9lcnIoIkZhaWxl
ZCB0byByZXNlcnZlIGJ1ZmZlcnMgaW4gdHRtLlxuIik7Ci0KIAlpZiAocmV0KSB7CisJCXByX2Vy
cigiRmFpbGVkIHRvIHJlc2VydmUgYnVmZmVycyBpbiB0dG0uXG4iKTsKIAkJa2ZyZWUoY3R4LT52
bV9wZCk7CiAJCWN0eC0+dm1fcGQgPSBOVUxMOworCQlyZXR1cm4gcmV0OwogCX0KIAotCXJldHVy
biByZXQ7CisJY3R4LT5yZXNlcnZlZCA9IHRydWU7CisJcmV0dXJuIDA7CiB9CiAKIC8qKgotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
