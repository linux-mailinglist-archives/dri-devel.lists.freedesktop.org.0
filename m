Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9249BD7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE376E115;
	Tue, 18 Jun 2019 08:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EAA6E113
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 666292813A9;
 Tue, 18 Jun 2019 09:16:51 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 0/4] drm/panfrost: Expose perf counters to userspace
Date: Tue, 18 Jun 2019 10:16:44 +0200
Message-Id: <20190618081648.17297-1-boris.brezillon@collabora.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, kernel@collabora.com,
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
Z2FyZHMsCgpCb3JpcwoKQ2hhbmdlcyBpbiB2NDoKKiBGaXggYSB3YXJuaW5nIHJlcG9ydGVkIGJ5
IGtidWlsZCBib3RzCiogQWRkIFItYi9BLWIKKiBVc2UgZHJtX2dlbV9zaG1lbV92W3VuXW1hcCgp
IGluc3RlYWQgb2YgZHJtX2dlbV92W3VuXW1hcCgpCgpDaGFuZ2VzIGluIHYzOgoqIEV4cG9zZSB0
aGluZ3MgdGhyb3VnaCBpb2N0bHMgaW5zdGVhZCBvZiBkZWJ1Z2ZzIChuZWVkZWQgZm9yCiAgcGVy
LUZEIGFkZHJlc3Mgc3BhY2UgdGhhdCBpcyBiZWluZyB3b3JrZWQgb24gYnkgUm9iKQoKQ2hhbmdl
cyBpbiB2MjoKKiBDb21wbGV0ZSByZXdyaXRlIHRvIGV4cG9zZSB0aGluZ3MgdGhyb3VnaCBkZWJ1
Z2ZzCgpCb3JpcyBCcmV6aWxsb24gKDQpOgogIGRybS9wYW5mcm9zdDogTW92ZSBncHVfe3dyaXRl
LHJlYWR9KCkgbWFjcm9zIHRvIHBhbmZyb3N0X3JlZ3MuaAogIGRybS9wYW5mcm9zdDogQWRkIGEg
bW9kdWxlIHBhcmFtZXRlciB0byBleHBvc2UgdW5zdGFibGUgaW9jdGxzCiAgZHJtL3BhbmZyb3N0
OiBBZGQgYW4gaGVscGVyIHRvIGNoZWNrIHRoZSBHUFUgZ2VuZXJhdGlvbgogIGRybS9wYW5mcm9z
dDogRXhwb3NlIHBlcmZvcm1hbmNlIGNvdW50ZXJzIHRocm91Z2ggdW5zdGFibGUgaW9jdGxzCgog
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L01ha2VmaWxlICAgICAgICAgICB8ICAgMyArLQogZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jICB8ICAgOCArCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggIHwgIDEwICsKIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAgICAgfCAgMTUgKwogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jICAgICB8ICAxMCArLQogZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYyB8IDMyOSArKysrKysrKysrKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuaCB8ICAxOCArKwogZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3JlZ3MuaCAgICB8ICAyMiArKwogaW5jbHVkZS91
YXBpL2RybS9wYW5mcm9zdF9kcm0uaCAgICAgICAgICAgICB8ICAyNCArKwogOSBmaWxlcyBjaGFu
Z2VkLCA0MzUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuaAoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
