Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F33832BF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 15:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3D889FDE;
	Tue,  6 Aug 2019 13:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9675089FDE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 13:34:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3509A14B0F7;
 Tue,  6 Aug 2019 13:34:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A75F1001955;
 Tue,  6 Aug 2019 13:34:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 839FD16E32; Tue,  6 Aug 2019 15:34:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm: add gem ttm helpers
Date: Tue,  6 Aug 2019 15:34:51 +0200
Message-Id: <20190806133454.8254-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 06 Aug 2019 13:34:58 +0000 (UTC)
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
X2dlbV90dG1faGVscGVyLmggICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKwogaW5jbHVkZS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAgICAgICAgIHwgIDcgKy0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICAgICAgICAgfCA0OCAt
LS0tLS0tLS0tLS0tLS0tLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
cnYuYyAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jICAgICAgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kdW1iLmMgICAgICAgICAgICAg
ICAgfCAxNyAtLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2lvY3RsLmMgICAgICAgICAg
ICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOCArKysKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICB8ICAzICsrCiBkcml2ZXJzL2dwdS9kcm0vcXhsL0tjb25maWcgICAgICAgICAgICAgICAgICAg
fCAgMSArCiAxMyBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspLCA4MiBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYwoK
LS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
