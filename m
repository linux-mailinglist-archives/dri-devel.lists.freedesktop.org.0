Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DB80AE0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 14:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074A6E1EE;
	Sun,  4 Aug 2019 12:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E506E1EE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 12:27:01 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CE9199B;
 Sun,  4 Aug 2019 14:26:59 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: connector: Clarify drm_connecter.ddc field documentation
Date: Sun,  4 Aug 2019 15:26:53 +0300
Message-Id: <20190804122653.6587-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564921619;
 bh=enwFU4rYjqVmKWvKBwIWBOQtcsRJkwyg1FCh+sWmPtQ=;
 h=From:To:Cc:Subject:Date:From;
 b=P6zFnv5p/6bn6rZTQ0jKK/aTJZ8DCksG3LRMZQAntossE7oOZ2+Zox/EArkZcLkVa
 I263QnpMqyKxwMTTkwt7BjwegG2iGCO3kV9J60vommNJ064Z7oxS2+bMrQKSf9QwyO
 J8eI+DbNVZJD3LKAiDzDNvahp7M8aDZ1bewgV3Tw=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wcm92ZSB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUgZGRjIGZpZWxkIGJ5IHVzaW5nIEREQyBh
bmQgSTJDCmNvbnNpc3RlbnRseSwgYW5kIGV4cGxhaW5pbmcgbW9yZSBjbGVhcmx5IHdoYXQgdGhl
IGZpZWxkIHBvaW50cyB0by4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAppbmRleCBmYzVkMDg0MzgzMzMuLjBkMDE2NjJhYTQw
ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaApAQCAtMTMxNSwxMCArMTMxNSwxMCBAQCBzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciB7CiAKIAkvKioKIAkgKiBAZGRjOiBhc3NvY2lhdGVkIGRkYyBhZGFwdGVyLgotCSAq
IEEgY29ubmVjdG9yIHVzdWFsbHkgaGFzIGl0cyBhc3NvY2lhdGVkIGRkYyBhZGFwdGVyLiBJZiBh
IGRyaXZlciB1c2VzCi0JICogdGhpcyBmaWVsZCwgdGhlbiBhbiBhcHByb3ByaWF0ZSBzeW1ib2xp
YyBsaW5rIGlzIGNyZWF0ZWQgaW4gY29ubmVjdG9yCi0JICogc3lzZnMgZGlyZWN0b3J5IHRvIG1h
a2UgaXQgZWFzeSBmb3IgdGhlIHVzZXIgdG8gdGVsbCB3aGljaCBpMmMKLQkgKiBhZGFwdGVyIGlz
IGZvciBhIHBhcnRpY3VsYXIgZGlzcGxheS4KKwkgKiBXaGVuIHRoZSBjb25uZWN0b3IgY2Fycmll
cyBEREMgc2lnbmFscywgdGhpcyBmaWVsZCBwb2ludHMgdG8gdGhlIEkyQworCSAqIGFkYXB0ZXIg
Y29ubmVjdGVkIHRvIHRoZSBEREMgc2lnbmFscywgaWYgYW55LiBXaGVuIHRoaXMgZmllbGQgaXMg
bm90CisJICogTlVMTCBhIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBpbiB0aGUgY29ubmVjdG9y
J3Mgc3lzZnMgZGlyZWN0b3J5CisJICogdG8gZXhwb3NlIHRoZSBJMkMgYWRhcHRlciB1c2VkIGJ5
IHRoZSBjb25uZWN0b3IuCiAJICoKIAkgKiBUaGUgZmllbGQgc2hvdWxkIGJlIHNldCBieSBjYWxs
aW5nIGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpLgogCSAqLwotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
