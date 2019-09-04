Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F9A7ADA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6A8925C;
	Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B398925C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B58E581DE1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 05:47:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C283B5D9E1;
 Wed,  4 Sep 2019 05:47:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A04BE784F; Wed,  4 Sep 2019 07:47:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm: add some ttm/vram info to debugfs
Date: Wed,  4 Sep 2019 07:47:33 +0200
Message-Id: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 04 Sep 2019 05:47:44 +0000 (UTC)
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

CgpHZXJkIEhvZmZtYW5uICg3KToKICBkcm06IGFkZCBkcm1fcHJpbnRfYml0cwogIGRybS90dG06
IGFkZCBkcm0gZ2VtIHR0bSBoZWxwZXJzLCBzdGFydGluZyB3aXRoCiAgICBkcm1fZ2VtX3R0bV9w
cmludF9pbmZvKCkKICBkcm0vdnJhbTogdXNlIGRybV9nZW1fdHRtX3ByaW50X2luZm8KICBkcm0v
dnJhbTogYWRkIHZyYW0tbW0gZGVidWdmcyBmaWxlCiAgZHJtL3F4bDogdXNlIGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzIGNhbGxiYWNrcwogIGRybS9xeGw6IHVzZSBkcm1fZ2VtX3R0bV9wcmludF9pbmZv
CiAgZHJtL3ZyYW06IGZpeCBLY29uZmlnCgogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2Lmgg
ICAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggICAgICAg
IHwgMTkgKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAg
fCAgMSArCiBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgICAgICAgICAgICAgfCAgMyArKwog
aW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggICAgICAgIHwgIDEgKwogZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgIHwgIDQgKy0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKysr
KwogZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hlbHBlci5jICAgIHwgNDQgKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMgICAgICAgICAgIHwgIDgg
LS0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgICAgICAgIHwgMTMgKysrKysr
CiBEb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0ICAgICAgICAgICAgfCAxMiArKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAgICB8ICA4ICsrKy0KIGRyaXZlcnMv
Z3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAzICsrCiBkcml2ZXJzL2dwdS9kcm0v
YXN0L0tjb25maWcgICAgICAgICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvS2Nv
bmZpZyAgICAgICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL0tj
b25maWcgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvS2NvbmZpZyAgICAgICAgIHwg
IDIgKwogZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby9LY29uZmlnICAgICAgIHwgIDIgKwogMTkg
ZmlsZXMgY2hhbmdlZCwgMjA2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCgotLSAKMi4xOC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
