Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17ECA664A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 12:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32393897FB;
	Tue,  3 Sep 2019 10:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED250897FB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 10:12:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D8323082B40
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 10:12:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC43D60606;
 Tue,  3 Sep 2019 10:12:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA81F16E05; Tue,  3 Sep 2019 12:12:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm: add some ttm/vram info to debugfs
Date: Tue,  3 Sep 2019 12:12:42 +0200
Message-Id: <20190903101248.12879-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 03 Sep 2019 10:12:52 +0000 (UTC)
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

CgpHZXJkIEhvZmZtYW5uICg2KToKICBkcm06IGFkZCBkcm1fcHJpbnRfYml0cwogIGRybS90dG06
IGFkZCBkcm0gZ2VtIHR0bSBoZWxwZXJzLCBzdGFydGluZyB3aXRoCiAgICBkcm1fZ2VtX3R0bV9w
cmludF9pbmZvKCkKICBkcm0vdnJhbTogdXNlIGRybV9nZW1fdHRtX3ByaW50X2luZm8KICBkcm0v
dnJhbTogYWRkIHZyYW0tbW0gZGVidWdmcyBmaWxlCiAgZHJtL3F4bDogdXNlIGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzIGNhbGxiYWNrcwogIGRybS9xeGw6IHVzZSBkcm1fZ2VtX3R0bV9wcmludF9pbmZv
CgogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggICAgICAgICB8ICAxICsKIGluY2x1ZGUv
ZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oICAgICAgfCAxOSArKysrKysrKysrCiBpbmNsdWRlL2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgIHwgIDEgKwogaW5jbHVkZS9kcm0vZHJtX3ByaW50
LmggICAgICAgICAgICAgICB8ICAzICsrCiBpbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIu
aCAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jICB8IDUz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYyB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMgICAgICAgICAg
IHwgMzYgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVs
cGVyLmMgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfZHJ2LmMgICAgICAgICB8ICA4IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVj
dC5jICAgICAgfCAxMyArKysrKysrCiBEb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0ICAgICAg
ICAgIHwgMTIgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgIHwg
IDggKysrKwogZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgICB8ICAzICsrCiAx
NCBmaWxlcyBjaGFuZ2VkLCAxOTcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYwoKLS0gCjIuMTgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
