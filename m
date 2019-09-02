Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C9A566A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBFF89A08;
	Mon,  2 Sep 2019 12:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87317899DC;
 Mon,  2 Sep 2019 12:41:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F5441060660;
 Mon,  2 Sep 2019 12:41:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3B0D1001947;
 Mon,  2 Sep 2019 12:41:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 792A931EEA; Mon,  2 Sep 2019 14:41:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/qxl: use drm_gem_ttm_print_info
Date: Mon,  2 Sep 2019 14:41:26 +0200
Message-Id: <20190902124126.7700-6-kraxel@redhat.com>
In-Reply-To: <20190902124126.7700-1-kraxel@redhat.com>
References: <20190902124126.7700-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 02 Sep 2019 12:41:31 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX29iamVjdC5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfZHJ2LmgKaW5kZXggOWUwMzRjNWZhODdkLi5kNDA1MTQwOWNlNjQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX2Rydi5oCkBAIC0zOCw2ICszOCw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxw
ZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV90dG1faGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9pb2N0bC5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+CiAjaW5jbHVkZSA8ZHJtL3F4
bF9kcm0uaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKaW5kZXggMjlhYWI3YjE0NTEzLi5jMDEz
YzUxNmY1NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCkBAIC04Niw2ICs4Niw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgcXhsX29iamVjdF9mdW5jcyA9
IHsKIAkuZ2V0X3NnX3RhYmxlID0gcXhsX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLnZtYXAg
PSBxeGxfZ2VtX3ByaW1lX3ZtYXAsCiAJLnZ1bm1hcCA9IHF4bF9nZW1fcHJpbWVfdnVubWFwLAor
CS5wcmludF9pbmZvID0gZHJtX2dlbV90dG1fcHJpbnRfaW5mbywKIH07CiAKIGludCBxeGxfYm9f
Y3JlYXRlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAotLSAKMi4xOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
