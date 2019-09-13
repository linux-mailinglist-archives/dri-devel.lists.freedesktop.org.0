Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0575AB2886
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872506F498;
	Fri, 13 Sep 2019 22:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071776F48F;
 Fri, 13 Sep 2019 22:37:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84328811A9;
 Fri, 13 Sep 2019 22:37:32 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFB2510018FF;
 Fri, 13 Sep 2019 22:37:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2] drm/nouveau: dispnv50: Remove nv50_mstc_best_encoder()
Date: Fri, 13 Sep 2019 18:37:20 -0400
Message-Id: <20190913223721.10185-1-lyude@redhat.com>
In-Reply-To: <20190913220355.6883-2-lyude@redhat.com>
References: <20190913220355.6883-2-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 13 Sep 2019 22:37:32 +0000 (UTC)
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2Jlc3RfZW5jb2RlciBpcyBk
ZWZpbmVkLAotPmJlc3RfZW5jb2RlciBpcyBpZ25vcmVkIGJ5IHRoZSBhdG9taWMgbW9kZXNldHRp
bmcgaGVscGVycy4gVGhhdCBiZWluZwpzYWlkLCB0aGlzIGhvb2sgaXMgY29tcGxldGVseSBicm9r
ZW4gYW55d2F5IC0gaXQgYWx3YXlzIHJldHVybnMgdGhlCmZpcnN0IG1zdG8gZm9yIGEgZ2l2ZW4g
bXN0YywgZGVzcGl0ZSB0aGUgZmFjdCBpdCBtaWdodCBhbHJlYWR5IGJlIGluCnVzZS4KClNvLCBq
dXN0IGdldCByaWQgb2YgaXQuIFdlJ2xsIG5lZWQgdGhpcyBpbiBhIG1vbWVudCBhbnl3YXksIHdo
ZW4gd2UgbWFrZQptc3RvcyBwZXItaGVhZCBhcyBvcHBvc2VkIHRvIHBlci1jb25uZWN0b3IuCgpD
aGFuZ2VzIHNpbmNlIHYxOgoqIEZpeCB0eXBvIGluIGRvY3VtZW50YXRpb24gLSBpbWlya2luCgpT
aWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNw
LmMKaW5kZXggYjQ2YmU4YTA5MWU5Li5hM2YzNTBmZGZhOGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKQEAgLTkyMCwxNCArOTIwLDYgQEAgbnY1MF9tc3RjX2F0b21p
Y19iZXN0X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAlyZXR1cm4g
Jm1zdGMtPm1zdG0tPm1zdG9baGVhZC0+YmFzZS5pbmRleF0tPmVuY29kZXI7CiB9CiAKLXN0YXRp
YyBzdHJ1Y3QgZHJtX2VuY29kZXIgKgotbnY1MF9tc3RjX2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQotewotCXN0cnVjdCBudjUwX21zdGMgKm1zdGMgPSBudjUw
X21zdGMoY29ubmVjdG9yKTsKLQotCXJldHVybiAmbXN0Yy0+bXN0bS0+bXN0b1swXS0+ZW5jb2Rl
cjsKLX0KLQogc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzCiBudjUwX21zdGNfbW9kZV92YWxp
ZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkgICAgIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlKQpAQCAtOTkwLDcgKzk4Miw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MKIG52NTBfbXN0Y19oZWxwID0gewogCS5nZXRfbW9k
ZXMgPSBudjUwX21zdGNfZ2V0X21vZGVzLAogCS5tb2RlX3ZhbGlkID0gbnY1MF9tc3RjX21vZGVf
dmFsaWQsCi0JLmJlc3RfZW5jb2RlciA9IG52NTBfbXN0Y19iZXN0X2VuY29kZXIsCiAJLmF0b21p
Y19iZXN0X2VuY29kZXIgPSBudjUwX21zdGNfYXRvbWljX2Jlc3RfZW5jb2RlciwKIAkuYXRvbWlj
X2NoZWNrID0gbnY1MF9tc3RjX2F0b21pY19jaGVjaywKIH07Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
