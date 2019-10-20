Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D9DDF8C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 18:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02728991E;
	Sun, 20 Oct 2019 16:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350008991D;
 Sun, 20 Oct 2019 16:43:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 18904089-1500050 
 for multiple; Sun, 20 Oct 2019 17:43:45 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dma-buf: Prettify typecasts for dma-fence-chain
Date: Sun, 20 Oct 2019 17:43:41 +0100
Message-Id: <20191020164343.11233-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.24.0.rc0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zaWRlIGRtYS1mZW5jZS1jaGFpbiwgd2UgdXNlIGEgY21weGNoZyBvbiBhbiBSQ1UtcHJvdGVj
dGVkIHBvaW50ZXIuIFRvCmF2b2lkIHRoZSBzcGFyc2Ugd2FybmluZyBmb3IgdXNpbmcgdGhlIFJD
VSBwb2ludGVyIGRpcmVjdGx5LCB3ZSBoYXZlIHRvCmNhc3QgYXdheSB0aGUgX19yY3UgYW5ub3Rh
dGlvbi4gSG93ZXZlciwgd2UgZG9uJ3QgbmVlZCB0byB1c2Ugdm9pZCoKZXZlcnl3aGVyZSBhbmQg
Y2FuIHN0aWNrIHRvIHRoZSBkbWFfZmVuY2UqLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5j
ZS1jaGFpbi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMg
Yi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKaW5kZXggNDRhNzQxNjc3ZDI1Li4z
ZDEyMzUwMmZmMTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4u
YworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKQEAgLTYyLDcgKzYyLDgg
QEAgc3RydWN0IGRtYV9mZW5jZSAqZG1hX2ZlbmNlX2NoYWluX3dhbGsoc3RydWN0IGRtYV9mZW5j
ZSAqZmVuY2UpCiAJCQlyZXBsYWNlbWVudCA9IE5VTEw7CiAJCX0KIAotCQl0bXAgPSBjbXB4Y2hn
KCh2b2lkICoqKSZjaGFpbi0+cHJldiwgKHZvaWQgKilwcmV2LCAodm9pZCAqKXJlcGxhY2VtZW50
KTsKKwkJdG1wID0gY21weGNoZygoc3RydWN0IGRtYV9mZW5jZSBfX2ZvcmNlICoqKSZjaGFpbi0+
cHJldiwKKwkJCSAgICAgIHByZXYsIHJlcGxhY2VtZW50KTsKIAkJaWYgKHRtcCA9PSBwcmV2KQog
CQkJZG1hX2ZlbmNlX3B1dCh0bXApOwogCQllbHNlCi0tIAoyLjI0LjAucmMwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
