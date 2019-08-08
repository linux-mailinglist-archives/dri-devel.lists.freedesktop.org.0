Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7985E99
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E2C6E7D2;
	Thu,  8 Aug 2019 09:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E446E7B2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 09:37:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3ECD51F16;
 Thu,  8 Aug 2019 09:37:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60C165C21A;
 Thu,  8 Aug 2019 09:37:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C70D16E08; Thu,  8 Aug 2019 11:37:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] drm: add gem ttm helpers
Date: Thu,  8 Aug 2019 11:36:54 +0200
Message-Id: <20190808093702.29512-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 08 Aug 2019 09:37:06 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpDaHJpc3RvcGggSGVsbHdpZyAoMSk6CiAgc2NzaTogY29yZTogZml4IHRoZSBkbWFfbWF4X21h
cHBpbmdfc2l6ZSBjYWxsCgpHZXJkIEhvZmZtYW5uICg3KToKICB0dG06IHR1cm4gdHRtX2JvX2Rl
dmljZS52bWFfbWFuYWdlciBpbnRvIGEgcG9pbnRlcgogIGRybS90dG06IGFkZCBnZW1fdHRtX2Jv
X2RldmljZV9pbml0KCkKICBkcm0vdnJhbTogc3dpdGNoIHZyYW0gaGVscGVycyB0byB0aGUgbmV3
IGdlbV90dG1fYm9fZGV2aWNlX2luaXQoKQogIGRybS9xeGw6IHN3aXRjaCBxeGwgdG8gdGhlIG5l
dyBnZW1fdHRtX2JvX2RldmljZV9pbml0KCkKICBkcm0vdHRtOiBhZGQgZHJtX2dlbV90dG1fYm9f
ZHJpdmVyX3ZlcmlmeV9hY2Nlc3MoKQogIGdlbS92cmFtOiB1c2UgZHJtX2dlbV90dG1fYm9fZHJp
dmVyX3ZlcmlmeV9hY2Nlc3MoKQogIGdlbS9xeGw6IHVzZSBkcm1fZ2VtX3R0bV9ib19kcml2ZXJf
dmVyaWZ5X2FjY2VzcygpCgogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggICAgICAgICAg
ICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oICAgICAgICAg
ICAgICB8ICA1IC0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaCAgICAgICAgICAg
ICAgfCAzMiArKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAg
ICAgICAgICB8ICA5ICstLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAgICAgICAg
ICAgICAgIHwgMTEgKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgICAg
ICAgICAgfCA1OCArKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmMgICAgICAgICB8IDcwICstLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fdnJhbV9tbV9oZWxwZXIuYyAgICAgICAgICB8ICA2ICstCiAuLi4vZ3B1L2RybS9oaXNp
bGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kcnYuYyAgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kdW1iLmMgICAgICAgICAgICAgICAgfCAxNyAtLS0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfaW9jdGwuYyAgICAgICAgICAgICAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X3R0bS5jICAgICAgICAgICAgICAgICB8IDE4ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jICAgICAgICAgICAgICAgICAgfCAyOSArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyAgICAgICAgICAgICAgIHwgIDYgKy0KIGRyaXZlcnMvc2NzaS9zY3NpX2xp
Yi5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCiBEb2N1bWVudGF0aW9uL2dwdS9kcm0t
bW0ucnN0ICAgICAgICAgICAgICAgICAgfCAxMiArKysrCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKIGRyaXZlcnMvZ3B1L2RybS9xeGwvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICB8ICAxICsKIDIwIGZpbGVzIGNoYW5nZWQsIDE2NSBpbnNlcnRp
b25zKCspLCAxMzcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0v
ZHJtX2dlbV90dG1faGVscGVyLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV90dG1faGVscGVyLmMKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
