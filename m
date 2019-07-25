Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF175543
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 19:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFCF6E7BD;
	Thu, 25 Jul 2019 17:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0365C6E7BD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:19:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 62B29AFDB;
 Thu, 25 Jul 2019 17:19:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 yc_chen@aspeedtech.com, Christian.Koenig@amd.com
Subject: [PATCH v2 0/3] Provide vmap/vunmap for VRAM helpers
Date: Thu, 25 Jul 2019 19:19:29 +0200
Message-Id: <20190725171932.31189-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZtYXAgb3BlcmF0aW9uIGlzIHBpbitrbWFwLCBhcyBhbHJlYWR5IGltcGxlbWVudGVkIGZv
ciBQUklNRQpzdXBwb3J0LiBUaGUgdnVubWFwIG9wZXJhdGlvbiBpcyB0aGUgaW52ZXJzZS4gVGhp
cyBwYXRjaCBzZXQgbWFrZXMKYm90aCBhdmFpbGFibGUgZm9yIGRyaXZlcnMgdGhhdCB1c2UgVlJB
TSBoZWxwZXJzLCBhbmQgcmVwbGFjZXMgdGhlCnJlc3BlY3RpdmUgY29kZSBpbiBhc3QgYW5kIG1n
YWcyMDAuCgp2MjoKCSogZml4IGRvY3VtZW50YXRpb24KCSogYWRkIGNyb3NzIHJlZmVyZW5jZXMg
dG8gZnVuY3Rpb24gZG9jdW1lbnRhdGlvbgoJKiBkb2N1bWVudCAodGhlIGxhY2sgb2YpIHJlZi1j
b3VudGluZyBmb3IgR0VNIFZSQU0gQk8gbWFwcGluZ3MKClRob21hcyBaaW1tZXJtYW5uICgzKToK
ICBkcm0vdnJhbTogUHJvdmlkZSB2bWFwIGFuZCB2dW5tYXAgb3BlcmF0aW9ucyBmb3IgR0VNIFZS
QU0gb2JqZWN0cwogIGRybS9hc3Q6IFVzZSBkcm1fZ2VtX3ZyYW1fe3ZtYXAsdnVubWFwfSgpIHRv
IG1hcCBjdXJzb3Igc291cmNlIEJPCiAgZHJtL21nYWcyMDA6IFVzZSBkcm1fZ2VtX3ZyYW1fe3Zt
YXAsdnVubWFwfSgpIHRvIG1hcCBjdXJzb3Igc291cmNlIEJPCgogZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbW9kZS5jICAgICAgICAgICB8IDIxICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jICAgIHwgNjMgKysrKysrKysrKysrKysrKysrKystLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIHwgMjIgKysrLS0tLS0tCiBpbmNs
dWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAgIHwgMTMgKysrKysKIDQgZmlsZXMg
Y2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCgotLQoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
