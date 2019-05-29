Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476A2D985
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5CA896E4;
	Wed, 29 May 2019 09:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAEB896E4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:52:55 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 213DB265A20;
 Wed, 29 May 2019 10:52:54 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 0/4] drm/panfrost: Expose perf counters to userspace
Date: Wed, 29 May 2019 11:52:29 +0200
Message-Id: <20190529095233.26277-1-boris.brezillon@collabora.com>
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
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpUaGlzIGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhbmZyb3N0IHBlcmZjbnQgc2VyaWVz
LCB0aGlzIHRpbWUgZXhwb3NpbmcKdGhpcyBmdW5jdGlvbmFsaXR5IHRocm91Z2ggMiBpb2N0bHMg
aW5zdGVhZCBvZiB0aGUgZGVidWdmcyBhcHByb2FjaAp1c2VkIGluIHYyLgoKSSBhbHNvIHdlbnQg
Zm9yIEVtaWwncyBzdWdnZXN0aW9uIHRvIGV4cG9zZSB0aG9zZSBpb2N0bHMgb25seSB3aGVuCnRo
ZSB1bnN0YWJsZV9pb2N0cyB1bnNhZmUgcGFyYW0gaXMgc2V0IHRvIHRydWUuIFRoaXMgd2F5LCBJ
IGhvcGUgd2UnbGwKYmUgYWJsZSB0byBkZXByZWNhdGUgdGhvc2UgaW9jdGxzIHdoZW4gdGhlIGdl
bmVyaWMgc29sdXRpb24gdG8gZXhwb3NlCmdsb2JhbCBwZXJmIGNvdW50ZXJzIGlzIG91dC4KCkFs
c28gYWRkcmVzc2VkIHRoZSBwcm9ibGVtcyByZXBvcnRlZCBieSBSb2IgYW5kIFN0ZXZlbi4KClJl
Z2FyZHMsCgpCb3JpcwoKQ2hhbmdlcyBpbiB2MzoKKiBFeHBvc2UgdGhpbmdzIHRocm91Z2ggaW9j
dGxzIGluc3RlYWQgb2YgZGVidWdmcyAobmVlZGVkIGZvcgogIHBlci1GRCBhZGRyZXNzIHNwYWNl
IHRoYXQgaXMgYmVpbmcgd29ya2VkIG9uIGJ5IFJvYikKCkNoYW5nZXMgaW4gdjI6CiogQ29tcGxl
dGUgcmV3cml0ZSB0byBleHBvc2UgdGhpbmdzIHRocm91Z2ggZGVidWdmcwoKQm9yaXMgQnJlemls
bG9uICg0KToKICBkcm0vcGFuZnJvc3Q6IE1vdmUgZ3B1X3t3cml0ZSxyZWFkfSgpIG1hY3JvcyB0
byBwYW5mcm9zdF9yZWdzLmgKICBkcm0vcGFuZnJvc3Q6IEFkZCBhIG1vZHVsZSBwYXJhbWV0ZXIg
dG8gZXhwb3NlIHVuc3RhYmxlIGlvY3RscwogIGRybS9wYW5mcm9zdDogQWRkIGFuIGhlbHBlciB0
byBjaGVjayB0aGUgR1BVIGdlbmVyYXRpb24KICBkcm0vcGFuZnJvc3Q6IEV4cG9zZSBwZXJmb3Jt
YW5jZSBjb3VudGVycyB0aHJvdWdoIHVuc3RhYmxlIGlvY3RscwoKIGRyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9NYWtlZmlsZSAgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZpY2UuYyAgfCAgIDggKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5oICB8ICAxMCArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZHJ2LmMgICAgIHwgIDE1ICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9ncHUuYyAgICAgfCAgMTAgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9w
ZXJmY250LmMgfCAzMjkgKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9wZXJmY250LmggfCAgMTggKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9yZWdzLmggICAgfCAgMjIgKysKIGluY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3Rf
ZHJtLmggICAgICAgICAgICAgfCAgMjQgKysKIDkgZmlsZXMgY2hhbmdlZCwgNDM1IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmgKCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
