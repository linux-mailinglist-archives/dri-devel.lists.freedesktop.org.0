Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71684B2858
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBD56F485;
	Fri, 13 Sep 2019 22:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739E6F485
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:27:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16B00308402D;
 Fri, 13 Sep 2019 22:27:15 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C40460BF1;
 Fri, 13 Sep 2019 22:27:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/encoder: Don't raise voice in drm_encoder_mask()
 documentation
Date: Fri, 13 Sep 2019 18:27:03 -0400
Message-Id: <20190913222704.8241-4-lyude@redhat.com>
In-Reply-To: <20190913222704.8241-1-lyude@redhat.com>
References: <20190913222704.8241-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 13 Sep 2019 22:27:15 +0000 (UTC)
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

VGhlcmUncyBubyBuZWVkIHRvIHJhaXNlIG91ciB2b2ljZSB3aGVuIHNheWluZyBlbmNvZGVyLCB3
ZSdyZSBhbGwKY2l2aWxpemVkIGFkdWx0cyBoZXJlIQoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZW5jb2Rlci5oIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVy
LmgKaW5kZXggZDY1MTczZDQxM2I3Li5mMDYxNjRmNDRlZmUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
ZHJtL2RybV9lbmNvZGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIuaApAQCAtMTk4
LDcgKzE5OCw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGRybV9lbmNvZGVyX2luZGV4
KGNvbnN0IHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIH0KIAogLyoqCi0gKiBkcm1fZW5j
b2Rlcl9tYXNrIC0gZmluZCB0aGUgbWFzayBvZiBhIHJlZ2lzdGVyZWQgRU5DT0RFUgorICogZHJt
X2VuY29kZXJfbWFzayAtIGZpbmQgdGhlIG1hc2sgb2YgYSByZWdpc3RlcmVkIGVuY29kZXIKICAq
IEBlbmNvZGVyOiBlbmNvZGVyIHRvIGZpbmQgbWFzayBmb3IKICAqCiAgKiBHaXZlbiBhIHJlZ2lz
dGVyZWQgZW5jb2RlciwgcmV0dXJuIHRoZSBtYXNrIGJpdCBvZiB0aGF0IGVuY29kZXIgZm9yIGFu
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
