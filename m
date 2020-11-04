Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B12A6B4B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 18:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F586E1CF;
	Wed,  4 Nov 2020 17:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C3C6E1CF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 17:01:53 +0000 (UTC)
Date: Wed, 04 Nov 2020 17:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1604509311;
 bh=aYiyAH7Zl3pPT2cWAXu5uPwI40tWiAmMM3NeFAypRd0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=B3y26Ro9Rcv+EwRTEFSIkKCFrD3QzA8mzF8WAdWwlbpacjLb1hXf3FdUqT6Wcc7Se
 Y41sMvbSbaUGoOIw1x0Xnj/+MXcU8UIPGYtbDN16FnXmjw64scHcNINOwBIGXwXuUU
 Z2qhvJOQaP4ZJMg7Q3zLOo0fQodqH+nJYwqFiuhWxORoLwo4yAkXEq2cL5NQMXJ+7o
 o4WY8cJfUCJTKljjHdWnkXYAY4caeHHuS+cRp280NxulimaRP/uW5/yQb4XnQn2Emh
 qVj2cCKec/J74QVH0wq3gI++uBW07YTd+x8URVW1IWbGpQ8jSg7Dkuv96jdvJPA/fi
 cN6PnIyx2UfZA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document that blobs are ref'counted
Message-ID: <wgav99DTGfubfVPiurrydQEiyufYpxlJQZ0wJMWYBQ@cp7-web-042.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlci1zcGFjZSBkb2Vzbid0IG5lZWQgdG8ga2VlcCB0cmFjayBvZiBibG9icyB0aGF0IG1pZ2h0
IGJlIGluIHVzZSBieQp0aGUga2VybmVsLiBVc2VyLXNwYWNlIGNhbiBqdXN0IGRlc3Ryb3kgYmxv
YnMgYXMgc29vbiBhcyB0aGV5IGRvbid0IG5lZWQKdGhlbSBhbnltb3JlLgoKU2lnbmVkLW9mZi1i
eTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
U3RvbmUgPGRhbmllbEBmb29pc2hiYXIub3JnPgpSZXZpZXdlZC1ieTogSm9uYXMgw4VkYWhsIDxq
YWRhaGxAZ21haWwuY29tPgpDYzogUGVra2EgUGFhbGFuZW4gPHBwYWFsYW5lbkBnbWFpbC5jb20+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogaW5jbHVkZS91YXBpL2Ry
bS9kcm1fbW9kZS5oIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggYi9pbmNsdWRlL3VhcGkv
ZHJtL2RybV9tb2RlLmgKaW5kZXggODYzZWRhMDQ4MjY1Li41YWQxMGFiMmE1NzcgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9tb2RlLmgKQEAgLTkyNCw2ICs5MjQsMTIgQEAgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9ibG9i
IHsKICAqIHN0cnVjdCBkcm1fbW9kZV9kZXN0cm95X2Jsb2IgLSBEZXN0cm95IHVzZXIgYmxvYgog
ICogQGJsb2JfaWQ6IGJsb2JfaWQgdG8gZGVzdHJveQogICogRGVzdHJveSBhIHVzZXItY3JlYXRl
ZCBibG9iIHByb3BlcnR5LgorICoKKyAqIFVzZXItc3BhY2UgY2FuIHJlbGVhc2UgYmxvYnMgYXMg
c29vbiBhcyB0aGV5IGRvIG5vdCBuZWVkIHRvIHJlZmVyIHRvIHRoZW0gYnkKKyAqIHRoZWlyIGJs
b2Igb2JqZWN0IElELiAgRm9yIGluc3RhbmNlLCBpZiB5b3UgYXJlIHVzaW5nIGEgTU9ERV9JRCBi
bG9iIGluIGFuCisgKiBhdG9taWMgY29tbWl0IGFuZCB5b3Ugd2lsbCBub3QgbWFrZSBhbm90aGVy
IGNvbW1pdCByZS11c2luZyB0aGUgc2FtZSBJRCwgeW91CisgKiBjYW4gZGVzdHJveSB0aGUgYmxv
YiBhcyBzb29uIGFzIHRoZSBjb21taXQgaGFzIGJlZW4gaXNzdWVkLCB3aXRob3V0IHdhaXRpbmcK
KyAqIGZvciBpdCB0byBjb21wbGV0ZS4KICAqLwogc3RydWN0IGRybV9tb2RlX2Rlc3Ryb3lfYmxv
YiB7CiAJX191MzIgYmxvYl9pZDsKLS0gCjIuMjkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
