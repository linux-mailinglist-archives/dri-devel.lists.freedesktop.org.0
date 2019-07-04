Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2060266
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FB36E43B;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D2FF6E390;
 Thu,  4 Jul 2019 16:37:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B01F2B;
 Thu,  4 Jul 2019 09:37:48 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B6873F703;
 Thu,  4 Jul 2019 09:37:47 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] dma-buf: Update docs to discourage use of dma_buf_mmap()
Date: Thu,  4 Jul 2019 17:37:25 +0100
Message-Id: <20190704163725.18050-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAKMK7uHkvaFBLdO=gTf30BDujHrx90YkA9O0O1Mgy_80TeL8iw@mail.gmail.com>
References: <CAKMK7uHkvaFBLdO=gTf30BDujHrx90YkA9O0O1Mgy_80TeL8iw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
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
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZG1hX2J1Zl9tbWFwKCkgYWxsb3dzIGEgZGV2aWNlIGRyaXZlciB0byBmb3J3YXJkIGEgbW1hcCgp
IGNhbGwgdG8gdGhlCmRtYV9idWYgZXhwb3J0ZXIuIEhvd2V2ZXIgdGhpcyBtZWNoYW5pc20gcHJv
dmlkZXMgbm8gd2F5IGZvciB1c2Vyc3BhY2UKdG8gdXNlIHRoZSBETUFfQlVGX0lPQ1RMX1NZTkMg
bWVjaGFuaXNtIHRvIGVuc3VyZSBjb2hlcmVuY3kgd2l0aCB0aGUKbWFwcGVkIGJ1ZmZlci4KCkJl
Y2F1c2Ugb2YgdGhpcyBpdCBpcyB3aXNlIHRvIG1pZ3JhdGUgYXdheSBmcm9tIHByb3ZpZGluZyB0
aGlzCm1tYXAoKSBmb3J3YXJkaW5nIG1lY2hhbmlzbSBhbmQgdXBkYXRlIGRyaXZlcnMgdG8gYXZv
aWQgdXNpbmcgaXQuCkhvd2V2ZXIgdGhlIHVzZXIgQUJJIG11c3QgYmUgbWFpbnRhaW5lZCwgc28g
dGhpcyBleGlzdGluZyBtbWFwKCkKZm9yd2FyZGluZyBjYW5ub3QgYmUgcmVtb3ZlZC4KClNpZ25l
ZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQogZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYyB8IDIzICsrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKaW5k
ZXggYmY0ZDRjODBmYmM2Li4yYTdhMmM4YzQxODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtNzMxLDIwICs3
MzEsMTcgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KTsKICAq
CiAgKiAtIEFuZCBhcyBhIENQVSBmYWxsYmFjayBpbiB1c2Vyc3BhY2UgcHJvY2Vzc2luZyBwaXBl
bGluZXMuCiAgKgotICogICBTaW1pbGFyIHRvIHRoZSBtb3RpdmF0aW9uIGZvciBrZXJuZWwgY3B1
IGFjY2VzcyBpdCBpcyBhZ2FpbiBpbXBvcnRhbnQgdGhhdAotICogICB0aGUgdXNlcnNwYWNlIGNv
ZGUgb2YgYSBnaXZlbiBpbXBvcnRpbmcgc3Vic3lzdGVtIGNhbiB1c2UgdGhlIHNhbWUKLSAqICAg
aW50ZXJmYWNlcyB3aXRoIGEgaW1wb3J0ZWQgZG1hLWJ1ZiBidWZmZXIgb2JqZWN0IGFzIHdpdGgg
YSBuYXRpdmUgYnVmZmVyCi0gKiAgIG9iamVjdC4gVGhpcyBpcyBlc3BlY2lhbGx5IGltcG9ydGFu
dCBmb3IgZHJtIHdoZXJlIHRoZSB1c2Vyc3BhY2UgcGFydCBvZgotICogICBjb250ZW1wb3Jhcnkg
T3BlbkdMLCBYLCBhbmQgb3RoZXIgZHJpdmVycyBpcyBodWdlLCBhbmQgcmV3b3JraW5nIHRoZW0g
dG8KLSAqICAgdXNlIGEgZGlmZmVyZW50IHdheSB0byBtbWFwIGEgYnVmZmVyIHJhdGhlciBpbnZh
c2l2ZS4KKyAqICAgSWRlYWxseSB1c2Vyc3BhY2UgY29kZSBzaG91bGQgZGlyZWN0bHkgbW1hcCB0
aGUgZG1hLWJ1ZiBmZCB3aGljaCBhbGxvd3MKKyAqICAgdGhlIHVzZSBvZiB0aGUgU1lOQ19TVEFS
VC9TWU5DX0VORCBpb2N0bHMgYXMgZGV0YWlsZWQgYWJvdmUuIEhvd2V2ZXIgdGhlcmUKKyAqICAg
YXJlIHNpdHVhdGlvbnMgd2hlcmUgdGhlcmUgaXMgYSBsYXJnZSBib2R5IG9mIGV4aXN0aW5nIGNv
ZGUgYW5kIHJld29ya2luZworICogICBpdCB0byBzdXBwb3J0IGEgZGlmZmVyZW50IHdheSB0byBt
bWFwIGEgYnVmZmVyIGlzIHJhdGhlciBpbnZhc2l2ZS4KICAqCi0gKiAgIFRoZSBhc3N1bXB0aW9u
IGluIHRoZSBjdXJyZW50IGRtYS1idWYgaW50ZXJmYWNlcyBpcyB0aGF0IHJlZGlyZWN0aW5nIHRo
ZQotICogICBpbml0aWFsIG1tYXAgaXMgYWxsIHRoYXQncyBuZWVkZWQuIEEgc3VydmV5IG9mIHNv
bWUgb2YgdGhlIGV4aXN0aW5nCi0gKiAgIHN1YnN5c3RlbXMgc2hvd3MgdGhhdCBubyBkcml2ZXIg
c2VlbXMgdG8gZG8gYW55IG5lZmFyaW91cyB0aGluZyBsaWtlCi0gKiAgIHN5bmNpbmcgdXAgd2l0
aCBvdXRzdGFuZGluZyBhc3luY2hyb25vdXMgcHJvY2Vzc2luZyBvbiB0aGUgZGV2aWNlIG9yCi0g
KiAgIGFsbG9jYXRpbmcgc3BlY2lhbCByZXNvdXJjZXMgYXQgZmF1bHQgdGltZS4gU28gaG9wZWZ1
bGx5IHRoaXMgaXMgZ29vZAotICogICBlbm91Z2gsIHNpbmNlIGFkZGluZyBpbnRlcmZhY2VzIHRv
IGludGVyY2VwdCBwYWdlZmF1bHRzIGFuZCBhbGxvdyBwdGUKLSAqICAgc2hvb3Rkb3ducyB3b3Vs
ZCBpbmNyZWFzZSB0aGUgY29tcGxleGl0eSBxdWl0ZSBhIGJpdC4KKyAqICAgU29tZSBkcml2ZXJz
IHRoZXJlZm9yZSBwcm92aWRlIGFuIGludGVyZmFjZSB0aGF0IHNpbXBseSByZWRpcmVjdHMgdGhl
CisgKiAgIG1tYXAgdG8gdGhlIGRtYS1idWYgZXhwb3J0ZXIuIFRoaXMgaXMgZmluZSBhcyBsb25n
IGFzIHRoZSBTWU5DX1NUQVJUIGFuZAorICogICBTWU5DX0VORCBpb2N0bHMgZG9uJ3QgZG8gYW55
dGhpbmcsIGJ1dCBtYXkgbGVhZCB0byBjb2hlcmVuY3kgaXNzdWVzCisgKiAgIGlmIHRoZXkgYXJl
IHJlcXVpcmVkLiBOZXcgY29kZSBzaG91bGQgYXZvaWQgdXNpbmcgdGhpcyBiZWNhdXNlIG9mCisg
KiAgIHBvdGVudGlhbGx5IGhhcmQgdG8gZGVidWcgY29oZXJlbmN5IHByb2JsZW1zLiBUaGUgaW50
ZXJmYWNlLCBob3dldmVyLAorICogICByZW1haW5zIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0
eS4KICAqCiAgKiAgIEludGVyZmFjZTo6CiAgKiAgICAgIGludCBkbWFfYnVmX21tYXAoc3RydWN0
IGRtYV9idWYgXCosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCBcKiwKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
