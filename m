Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34C849C6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 12:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED12E6E6AE;
	Wed,  7 Aug 2019 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067516E6AD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 10:38:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1F2C300C03B;
 Wed,  7 Aug 2019 10:38:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2B15D9CD;
 Wed,  7 Aug 2019 10:38:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 37CF516E32; Wed,  7 Aug 2019 12:38:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm: add gem ttm helpers
Date: Wed,  7 Aug 2019 12:38:46 +0200
Message-Id: <20190807103849.7289-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 07 Aug 2019 10:38:52 +0000 (UTC)
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

CgpHZXJkIEhvZmZtYW5uICgzKToKICBkcm06IGFkZCBnZW0gdHRtIGhlbHBlcnMKICBkcm0vdnJh
bTogc3dpdGNoIHZyYW0gaGVscGVycyB0byB1c2UgdGhlIG5ldyB0dG0gaGVscGVycy4KICBkcm0v
cXhsOiBzd2l0Y2ggcXhsIHRvIHVzZSB0aGUgbmV3IHR0bSBoZWxwZXJzLgoKIGRyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX2Rydi5oICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF9vYmplY3QuaCAgICAgICAgICAgICAgfCAgNSAtLQogaW5jbHVkZS9kcm0vZHJt
X2dlbV90dG1faGVscGVyLmggICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKysKIGluY2x1ZGUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgICAgICB8ICA3ICstLQogZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jICAgICAgICAgIHwgNDUgKysrKysrKysrKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgICAgICB8IDQ4IC0t
LS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1f
ZHJ2LmMgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyAgICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHVtYi5jICAgICAgICAgICAg
ICAgIHwgMTcgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfaW9jdGwuYyAgICAgICAg
ICAgICAgIHwgIDUgKy0KIERvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QgICAgICAgICAgICAg
ICAgICB8IDEyICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgOCArKysrCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArKwogZHJpdmVycy9ncHUvZHJtL3F4bC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogMTQgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyksIDgyIGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBl
ci5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBl
ci5jCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
