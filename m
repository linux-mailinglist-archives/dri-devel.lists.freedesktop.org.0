Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABECA756A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB45189C1E;
	Tue,  3 Sep 2019 20:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0CC89BFF;
 Tue,  3 Sep 2019 20:48:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C08B87F761;
 Tue,  3 Sep 2019 20:48:35 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFAC1001956;
 Tue,  3 Sep 2019 20:48:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 18/27] drm/dp_mst: Remove lies in {up,
 down}_rep_recv documentation
Date: Tue,  3 Sep 2019 16:45:56 -0400
Message-Id: <20190903204645.25487-19-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 03 Sep 2019 20:48:35 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIG1vc3QgY2VydGFpbmx5IGFjY2Vzc2VkIGZyb20gZmFyIG1vcmUgdGhhbiB0aGUg
bWdyIHdvcmsuIEluCmZhY3QsIHVwX3JlcV9yZWN2IGlzIC1vbmx5LSBldmVyIGFjY2Vzc2VkIGZy
b20gb3V0c2lkZSB0aGUgbWdyIHdvcmsuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwu
Y29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
d2VudGxhbkBhbWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBpbmNs
dWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZHBfbXN0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApp
bmRleCBmMjUzZWU0M2U5ZDkuLjhiYTJhMDEzMjRiYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
CkBAIC00ODksMTUgKzQ4OSwxMSBAQCBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Igewog
CWludCBjb25uX2Jhc2VfaWQ7CiAKIAkvKioKLQkgKiBAZG93bl9yZXBfcmVjdjogTWVzc2FnZSBy
ZWNlaXZlciBzdGF0ZSBmb3IgZG93biByZXBsaWVzLiBUaGlzIGFuZAotCSAqIEB1cF9yZXFfcmVj
diBhcmUgb25seSBldmVyIGFjY2VzcyBmcm9tIHRoZSB3b3JrIGl0ZW0sIHdoaWNoIGlzCi0JICog
c2VyaWFsaXNlZC4KKwkgKiBAZG93bl9yZXBfcmVjdjogTWVzc2FnZSByZWNlaXZlciBzdGF0ZSBm
b3IgZG93biByZXBsaWVzLgogCSAqLwogCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3J4IGRv
d25fcmVwX3JlY3Y7CiAJLyoqCi0JICogQHVwX3JlcV9yZWN2OiBNZXNzYWdlIHJlY2VpdmVyIHN0
YXRlIGZvciB1cCByZXF1ZXN0cy4gVGhpcyBhbmQKLQkgKiBAZG93bl9yZXBfcmVjdiBhcmUgb25s
eSBldmVyIGFjY2VzcyBmcm9tIHRoZSB3b3JrIGl0ZW0sIHdoaWNoIGlzCi0JICogc2VyaWFsaXNl
ZC4KKwkgKiBAdXBfcmVxX3JlY3Y6IE1lc3NhZ2UgcmVjZWl2ZXIgc3RhdGUgZm9yIHVwIHJlcXVl
c3RzLgogCSAqLwogCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3J4IHVwX3JlcV9yZWN2Owog
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
