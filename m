Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E098EDCE24
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39F66EB94;
	Fri, 18 Oct 2019 18:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C04E6EA52
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:08:57 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iL3eB-0002kr-OM; Thu, 17 Oct 2019 12:08:47 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iL3eB-0005fs-35; Thu, 17 Oct 2019 12:08:47 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm: include <drm/drm_cache.h> for 'drm_need_swiotlb'
Date: Thu, 17 Oct 2019 12:08:46 +0100
Message-Id: <20191017110846.21769-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9uZWVkX3N3aW90bGIgaXMgZGVjbGFyZWQgaW4gPGRybS9kcm1fY2FjaGUuaD4Kd2hp
Y2ggc2hvdWxkIGJlIGluY2x1ZGVkIGluIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKdG8g
c2lsZW5jZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9y
eS5jOjE1OTo2OiB3YXJuaW5nOiBzeW1ib2wgJ2RybV9uZWVkX3N3aW90bGInIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJl
bi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWVtb3J5LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21lbW9yeS5jCmluZGV4IDBiZWM2ZGJiMDE0Mi4uMmQ4NjE1YmFlYWRjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bWVtb3J5LmMKQEAgLTQxLDYgKzQxLDcgQEAKIAogI2luY2x1ZGUgPGRybS9kcm1fYWdwc3VwcG9y
dC5oPgogI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9jYWNo
ZS5oPgogCiAjaW5jbHVkZSAiZHJtX2xlZ2FjeS5oIgogCi0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
