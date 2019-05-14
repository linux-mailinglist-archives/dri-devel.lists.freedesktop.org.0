Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0811C735
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 12:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0A289247;
	Tue, 14 May 2019 10:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B434C89247
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 10:48:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id AFC6928348D
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [RESEND PATCH v2 0/2] drm/panfrost: Expose perf counters to userspace
Date: Tue, 14 May 2019 12:47:59 +0200
Message-Id: <20190514104801.20448-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpTb3JyeSBmb3IgdGhlIG5vaXNlLCBJIGZvcmdvdCB0byBDYyBkcmktZGV2ZWwgb24g
bXkgdjIgOi0vLgoKVGhpcyBpcyBhIGNvbXBsZXRlIHJld29yayBvZiB0aGUgcGVyZiBjb3VudGVy
IHN0dWZmIEkgc3VibWl0dGVkIGEgZmV3CndlZWtzIGJhY2suIFRoaXMgdmVyc2lvbiBpcyBwcmV0
dHkgdHJpdmlhbCBjb21wYXJlZCB0byB0aGUgZmlyc3QKaW1wbGVtZW50YXRpb24gYW5kIGl0J3Mg
bm90IG1lYW50IHRvIGJlIHRoZSBmaW5hbCBzb2x1dGlvbiwgYnV0IHJhdGhlcgpzb21ldGhpbmcg
dGhhdCBhbGxvdyBtZXNhIGRldmVsb3BlcnMgdG8gZGVidWcgcGVyZi1yZWxhdGVkIGlzc3VlcyB3
aGlsZQp3ZSBzZXR0bGUgb24gc29tZXRoaW5nIG1vcmUgZ2VuZXJpYyB0byBhbGxvdyBHUFUgZHJp
dmVycyB0byBleHBvc2UgdGhlaXIKZ2xvYmFsIHBlcmYgY291bnRlcnMuCgpJJ2QgbGlrZSB0byBt
YWtlIGl0IGNsZWFyIHRoYXQgdGhpcyBkZWJ1Z2ZzIGludGVyZmFjZSBpcyB1bnN0YWJsZSBhbmQK
c2hvdWxkIGJlIGRlcHJlY2F0ZWQgYXMgc29vbiBhcyB3ZSBoYXZlIHRoZSBnZW5lcmljIHNvbHV0
aW9uIGluIHBsYWNlLApzbyBwbGVhc2UgZG9uJ3QgY29uc2lkZXIgaXQgYXMgcGFydCBvZiB0aGUg
c3RhYmxlIEFCSS4KClJlZ2FyZHMsCgpCb3JpcyAKCkJvcmlzIEJyZXppbGxvbiAoMik6CiAgZHJt
L3BhbmZyb3N0OiBNb3ZlIGdwdV97d3JpdGUscmVhZH0oKSBtYWNyb3MgdG8gcGFuZnJvc3RfcmVn
cy5oCiAgZHJtL3BhbmZyb3N0OiBFeHBvc2UgcGVyZiBjb3VudGVycyB0aHJvdWdoIGRlYnVnZnMK
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvTWFrZWZpbGUgICAgICAgICAgIHwgICAzICstCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgIHwgICA5ICsKIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCAgfCAgIDMgKwogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgICB8ICAgNyArCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMgICAgIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jIHwgMzM5ICsrKysrKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5oIHwgIDE1ICsKIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9yZWdzLmggICAgfCAgMjIgKysKIDggZmlsZXMg
Y2hhbmdlZCwgNDA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmgK
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
