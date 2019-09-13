Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E04B2859
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153C6F486;
	Fri, 13 Sep 2019 22:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7752B6F484
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:27:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BDEA79704;
 Fri, 13 Sep 2019 22:27:14 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A86A60BF1;
 Fri, 13 Sep 2019 22:27:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/encoder: Fix possible_crtcs documentation
Date: Fri, 13 Sep 2019 18:27:02 -0400
Message-Id: <20190913222704.8241-3-lyude@redhat.com>
In-Reply-To: <20190913222704.8241-1-lyude@redhat.com>
References: <20190913222704.8241-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 13 Sep 2019 22:27:14 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltaWxhciB0byBwb3NzaWJsZV9jbG9uZXMsIHdlIGRvbid0IGFjdHVhbGx5IHVzZSBwb3NzaWJs
ZV9jcnRjcyB1bnRpbAp0aGUgZHJpdmVyIGlzIHJlZ2lzdGVyZWQgd2l0aCB1c2Vyc3BhY2UuIFNv
LCBmaXggdGhlIGRvY3VtZW50YXRpb24gdG8KaW5kaWNhdGUgdGhpcy4KClNpZ25lZC1vZmYtYnk6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2VuY29k
ZXIuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZW5jb2Rlci5oCmluZGV4IDgxMjczYjUwYjNmNi4uZDY1MTczZDQxM2I3IDEwMDY0NAotLS0g
YS9pbmNsdWRlL2RybS9kcm1fZW5jb2Rlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVy
LmgKQEAgLTE0MCw3ICsxNDAsNyBAQCBzdHJ1Y3QgZHJtX2VuY29kZXIgewogCSAqIEBwb3NzaWJs
ZV9jcnRjczogQml0bWFzayBvZiBwb3RlbnRpYWwgQ1JUQyBiaW5kaW5ncywgdXNpbmcKIAkgKiBk
cm1fY3J0Y19pbmRleCgpIGFzIHRoZSBpbmRleCBpbnRvIHRoZSBiaXRmaWVsZC4gVGhlIGRyaXZl
ciBtdXN0IHNldAogCSAqIHRoZSBiaXRzIGZvciBhbGwgJmRybV9jcnRjIG9iamVjdHMgdGhpcyBl
bmNvZGVyIGNhbiBiZSBjb25uZWN0ZWQgdG8KLQkgKiBiZWZvcmUgY2FsbGluZyBkcm1fZW5jb2Rl
cl9pbml0KCkuCisJICogYmVmb3JlIGNhbGxpbmcgZHJtX2Rldl9yZWdpc3RlcigpLgogCSAqCiAJ
ICogSW4gcmVhbGl0eSBhbG1vc3QgZXZlcnkgZHJpdmVyIGdldHMgdGhpcyB3cm9uZy4KIAkgKgot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
