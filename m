Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234336C4AF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3DE6E2D7;
	Thu, 18 Jul 2019 01:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0414E88BBA;
 Thu, 18 Jul 2019 01:49:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DE8F8E225;
 Thu, 18 Jul 2019 01:49:14 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDFB5D71A;
 Thu, 18 Jul 2019 01:49:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/dm: Remove unneeded hotplug event in
 s3_handle_mst()
Date: Wed, 17 Jul 2019 21:48:56 -0400
Message-Id: <20190718014858.9257-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 18 Jul 2019 01:49:14 +0000 (UTC)
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTSBEUCBNU1QgdG9wb2xvZ3kgbWFuYWdlciB3aWxsIHNlbmQgaXQncyBvd24gaG90cGx1
ZyBldmVudHMgd2hlbgpjb25uZWN0b3JzIGFyZSBkZXN0cm95ZWQsIHNvIHRoZXJlJ3Mgbm8gcmVh
c29uIHRvIHNlbmQgYW4gYWRkaXRpb25hbApob3RwbHVnIGV2ZW50IGhlcmUuCgpTaWduZWQtb2Zm
LWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAwMjQyZDY5M2Y0
ZjYuLjE1NmVlYWNlZTJhZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC04MTIsNyArODEyLDYgQEAgc3RhdGljIHZvaWQgczNf
aGFuZGxlX21zdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHN1c3BlbmQpCiAJc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9t
Z3IgKm1ncjsKIAlpbnQgcmV0OwotCWJvb2wgbmVlZF9ob3RwbHVnID0gZmFsc2U7CiAKIAlkcm1f
bW9kZXNldF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgsIE5VTEwpOwog
CkBAIC04MzEsMTUgKzgzMCwxNSBAQCBzdGF0aWMgdm9pZCBzM19oYW5kbGVfbXN0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVuZCkKIAkJCXJldCA9IGRybV9kcF9tc3RfdG9wb2xv
Z3lfbWdyX3Jlc3VtZShtZ3IpOwogCQkJaWYgKHJldCA8IDApIHsKIAkJCQlkcm1fZHBfbXN0X3Rv
cG9sb2d5X21ncl9zZXRfbXN0KG1nciwgZmFsc2UpOwotCQkJCW5lZWRfaG90cGx1ZyA9IHRydWU7
CisJCQkJbXV0ZXhfbG9jaygmYWNvbm5lY3Rvci0+aHBkX2xvY2spOworCQkJCWFjb25uZWN0b3It
PmRjX2xpbmstPnR5cGUgPQorCQkJCQlkY19jb25uZWN0aW9uX3NpbmdsZTsKKwkJCQltdXRleF91
bmxvY2soJmFjb25uZWN0b3ItPmhwZF9sb2NrKTsKIAkJCX0KIAkJfQogCX0KIAogCWRybV9tb2Rl
c2V0X3VubG9jaygmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KTsKLQotCWlmIChu
ZWVkX2hvdHBsdWcpCi0JCWRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQoZGV2KTsKIH0KIAog
LyoqCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
