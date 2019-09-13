Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3957B2857
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050086F484;
	Fri, 13 Sep 2019 22:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC26F482
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA57D3082E57;
 Fri, 13 Sep 2019 22:27:12 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2025060BF1;
 Fri, 13 Sep 2019 22:27:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/encoder: Fix possible_clones documentation
Date: Fri, 13 Sep 2019 18:27:01 -0400
Message-Id: <20190913222704.8241-2-lyude@redhat.com>
In-Reply-To: <20190913222704.8241-1-lyude@redhat.com>
References: <20190913222704.8241-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 13 Sep 2019 22:27:13 +0000 (UTC)
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

V2Ugc2F5IHRoYXQgYWxsIG9mIHRoZSBiaXRzIGluIHBvc3NpYmxlX2Nsb25lcyBtdXN0IGJlIHNl
dCBiZWZvcmUKY2FsbGluZyBkcm1fZW5jb2Rlcl9pbml0KCkuIFRoaXMgaXNuJ3QgdHJ1ZSB0aG91
Z2gsIHNpbmNlOgoKKiBUaGUgZHJpdmVyIG1heSBub3QgZXZlbiBoYXZlIGFsbCBvZiB0aGUgZW5j
b2RlciBvYmplY3RzIHRoYXQgY291bGQgYmUKICB1c2VkIGFzIGNsb25lcyBpbml0aWFsaXplZCBh
dCB0aGF0IHBvaW50CiogcG9zc2libGVfY3J0Y3MgaXNuJ3QgdXNlZCBhdCBhbGwgb3V0c2lkZSBv
ZiB1c2Vyc3BhY2UsIHNvIGl0J3Mgbm90CiAgYWN0dWFsbHkgbmVlZGVkIHRvIGluaXRpYWxpemUg
aXQgdW50aWwgZHJtX2Rldl9yZWdpc3RlcigpCgpTbywgZml4IGl0LgoKU2lnbmVkLW9mZi1ieTog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZW5jb2Rl
ci5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9lbmNvZGVyLmgKaW5kZXggNzBjZmNhMDNkODEyLi44MTI3M2I1MGIzZjYgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIu
aApAQCAtMTU0LDcgKzE1NCw3IEBAIHN0cnVjdCBkcm1fZW5jb2RlciB7CiAJICogdXNpbmcgZHJt
X2VuY29kZXJfaW5kZXgoKSBhcyB0aGUgaW5kZXggaW50byB0aGUgYml0ZmllbGQuIFRoZSBkcml2
ZXIKIAkgKiBtdXN0IHNldCB0aGUgYml0cyBmb3IgYWxsICZkcm1fZW5jb2RlciBvYmplY3RzIHdo
aWNoIGNhbiBjbG9uZSBhCiAJICogJmRybV9jcnRjIHRvZ2V0aGVyIHdpdGggdGhpcyBlbmNvZGVy
IGJlZm9yZSBjYWxsaW5nCi0JICogZHJtX2VuY29kZXJfaW5pdCgpLiBEcml2ZXJzIHNob3VsZCBz
ZXQgdGhlIGJpdCByZXByZXNlbnRpbmcgdGhlCisJICogZHJtX2Rldl9yZWdpc3RlcigpLiBEcml2
ZXJzIHNob3VsZCBzZXQgdGhlIGJpdCByZXByZXNlbnRpbmcgdGhlCiAJICogZW5jb2RlciBpdHNl
bGYsIHRvby4gQ2xvbmluZyBiaXRzIHNob3VsZCBiZSBzZXQgc3VjaCB0aGF0IHdoZW4gdHdvCiAJ
ICogZW5jb2RlcnMgY2FuIGJlIHVzZWQgaW4gYSBjbG9uZWQgY29uZmlndXJhdGlvbiwgdGhleSBi
b3RoIHNob3VsZCBoYXZlCiAJICogZWFjaCBhbm90aGVyIGJpdHMgc2V0LgotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
