Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5D8A7AE8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C1989B01;
	Wed,  4 Sep 2019 05:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B3689A62;
 Wed,  4 Sep 2019 05:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B7085308FB82;
 Wed,  4 Sep 2019 05:47:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D24C960BFB;
 Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B55AD31EEA; Wed,  4 Sep 2019 07:47:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/qxl: use drm_gem_ttm_print_info
Date: Wed,  4 Sep 2019 07:47:39 +0200
Message-Id: <20190904054740.20817-7-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 04 Sep 2019 05:47:48 +0000 (UTC)
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

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkFja2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuaCAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2Jq
ZWN0LmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kcnYuaAppbmRleCA5ZTAzNGM1ZmE4N2QuLmQ0MDUxNDA5Y2U2NCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZHJ2LmgKQEAgLTM4LDYgKzM4LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgor
I2luY2x1ZGUgPGRybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2lv
Y3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4KICNpbmNsdWRlIDxkcm0vcXhsX2RybS5o
PgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwppbmRleCAyOWFhYjdiMTQ1MTMuLmMwMTNjNTE2ZjU2
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKQEAgLTg2LDYgKzg2LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBxeGxfb2JqZWN0X2Z1bmNzID0gewogCS5n
ZXRfc2dfdGFibGUgPSBxeGxfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKIAkudm1hcCA9IHF4bF9n
ZW1fcHJpbWVfdm1hcCwKIAkudnVubWFwID0gcXhsX2dlbV9wcmltZV92dW5tYXAsCisJLnByaW50
X2luZm8gPSBkcm1fZ2VtX3R0bV9wcmludF9pbmZvLAogfTsKIAogaW50IHF4bF9ib19jcmVhdGUo
c3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
