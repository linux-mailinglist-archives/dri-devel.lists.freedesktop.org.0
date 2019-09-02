Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB8A5663
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F1C899DC;
	Mon,  2 Sep 2019 12:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFBB899DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:41:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF9DE83BE2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:41:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CFCD60C05;
 Mon,  2 Sep 2019 12:41:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 96A7A937E; Mon,  2 Sep 2019 14:41:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm: add some ttm/vram info to debugfs
Date: Mon,  2 Sep 2019 14:41:21 +0200
Message-Id: <20190902124126.7700-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 02 Sep 2019 12:41:29 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpHZXJkIEhvZmZtYW5uICg1KToKICBkcm0vdHRtOiBhZGQgZHJtX2dlbV90dG1fcHJpbnRfaW5m
bygpCiAgZHJtL3ZyYW06IHVzZSBkcm1fZ2VtX3R0bV9wcmludF9pbmZvCiAgZHJtL3ZyYW06IGFk
ZCB2cmFtLW1tIGRlYnVnZnMgZmlsZQogIGRybS9xeGw6IHVzZSBkcm1fZ2VtX29iamVjdF9mdW5j
cyBjYWxsYmFja3MKICBkcm0vcXhsOiB1c2UgZHJtX2dlbV90dG1fcHJpbnRfaW5mbwoKIGRyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oICAgICAgICAgfCAgMSArCiBpbmNsdWRlL2RybS9kcm1f
Z2VtX3R0bV9oZWxwZXIuaCAgICAgIHwgMTkgKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuaCAgICAgfCAgMiArCiBpbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIu
aCAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jICB8IDY3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYyB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMg
IHwgMzMgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMgICAgICAg
ICB8ICA4IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jICAgICAgfCAxMyAr
KysrKysKIERvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QgICAgICAgICAgfCAxMiArKysrKwog
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICB8ICA4ICsrKysKIGRyaXZlcnMv
Z3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyArKwogMTIgZmlsZXMgY2hhbmdlZCwg
MTYxIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
