Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD110D688
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2A56E90A;
	Fri, 29 Nov 2019 13:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0B56E908
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:59:13 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2BD7929256A;
 Fri, 29 Nov 2019 13:59:12 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH 0/8] panfrost: Fixes for 5.4
Date: Fri, 29 Nov 2019 14:59:00 +0100
Message-Id: <20191129135908.2439529-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJJ3ZlIHJlY2VudGx5IGNvbWUgdG8gdGVzdCBhIDUuNCBrZXJuZWwgb24gYSByazMy
ODggcGxhdGZvcm0gKFQ3NjApLAphbmQsIGFzIHJlcG9ydGVkIGJ5IG1hbnkgcGVvcGxlIG9uICNw
YW5mcm9zdCwgSSd2ZSBoaXQgYSBwYWdlLWZhdWx0CnN0b3JtIHdoZW4gcnVubmluZyB2YXJpb3Vz
IEdMIGFwcHMuCgpUaGlzIHNlcmllcyB0cmllcyB0byBhZGRyZXNzIHRoZSBwcm9ibGVtcyBJIGNv
dWxkIHNwb3QgZHVyaW5nIG15IGRlYnVnCnNlc3Npb24sIHdpdGggcGF0Y2ggNyBiZWluZyB0aGUg
bW9zdCBpbnZhc2l2ZSBjaGFuZ2UuIEkgd2lzaCBJCmNvdWxkIGZpbmQgYW4gZWFzaWVyIHdheSB0
byBmaXggdGhlICJCTyBtYXBwaW5nIHRlYXJlZCBkb3duIHdoaWxlIEdQVQpqb2JzIHJlZmVyZW5j
aW5nIGl0IGFyZSBpbi1mbGlnaHQiIHByb2JsZW0sIGFzIEkgZG9uJ3QgbGlrZSB0YWdnaW5nCmNv
bXBsZXggY2hhbmdlcyBmb3Igc3RhYmxlLCBidXQgdGhpcyBpcyB0aGUgYmVzdCBJIGNvdWxkIGNv
bWUgdXAgd2l0aC4KCkxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGJldHRlciBpZGVhcy4KClJlZ2Fy
ZHMsCgpCb3JpcwoKQm9yaXMgQnJlemlsbG9uICg4KToKICBkcm0vcGFuZnJvc3Q6IE1ha2UgcGFu
ZnJvc3Rfam9iX3J1bigpIHJldHVybiBhbiBFUlJfUFRSKCkgaW5zdGVhZCBvZgogICAgTlVMTAog
IGRybS9wYW5mcm9zdDogRml4IGEgcmFjZSBpbiBwYW5mcm9zdF9pb2N0bF9tYWR2aXNlKCkKICBk
cm0vcGFuZnJvc3Q6IEZpeCBhIEJPIGxlYWsgaW4gcGFuZnJvc3RfaW9jdGxfbW1hcF9ibygpCiAg
ZHJtL3BhbmZyb3N0OiBGaXggYSByYWNlIGluIHBhbmZyb3N0X2dlbV9mcmVlX29iamVjdCgpCiAg
ZHJtL3BhbmZyb3N0OiBPcGVuL2Nsb3NlIHRoZSBwZXJmY250IEJPCiAgZHJtL3BhbmZyb3N0OiBN
YWtlIHN1cmUgaW1wb3J0ZWQvZXhwb3J0ZWQgQk9zIGFyZSBuZXZlciBwdXJnZWQKICBkcm0vcGFu
ZnJvc3Q6IEFkZCB0aGUgcGFuZnJvc3RfZ2VtX21hcHBpbmcgY29uY2VwdAogIGRybS9wYW5mcm9z
dDogTWFrZSBzdXJlIHRoZSBzaHJpbmtlciBkb2VzIG5vdCByZWNsYWltIHJlZmVyZW5jZWQgQk9z
CgogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgICAgIHwgMTMyICsr
KysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYyAgICAg
ICB8IDE4NCArKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9nZW0uaCAgICAgICB8ICA1MSArKysrLQogLi4uL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZ2VtX3Nocmlua2VyLmMgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmMgICAgICAgfCAgMjIgKystCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmggICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X21tdS5jICAgICAgIHwgIDYxICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X21tdS5oICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfcGVyZmNudC5jICAgfCAgNDkgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9wZXJmY250LmggICB8ICAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgNDE2IGluc2Vy
dGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
