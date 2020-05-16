Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEA1D6439
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 23:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5A26E279;
	Sat, 16 May 2020 21:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394D46E279
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:23:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21215642-1500050 
 for multiple; Sat, 16 May 2020 22:23:33 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm: Include internal header for managed function
 declarations
Date: Sat, 16 May 2020 22:23:27 +0100
Message-Id: <20200516212330.13633-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmM6NjE6Njogd2FybmluZzogc3ltYm9sICdkcm1f
bWFuYWdlZF9yZWxlYXNlJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwog
IENDICAgICAgZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLm8KZHJpdmVycy9ncHUvZHJtL2Ry
bV9tYW5hZ2VkLmM6NjE6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhk
cm1fbWFuYWdlZF9yZWxlYXNl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIHZvaWQgZHJtX21h
bmFnZWRfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQoKRml4ZXM6IGM2NjAzYzc0MGUw
ZSAoImRybTogYWRkIG1hbmFnZWQgcmVzb3VyY2VzIHRpZWQgdG8gZHJtX2RldmljZSIpClNpZ25l
ZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbWFuYWdlZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMKaW5kZXggOWNlYmZl
MzcwYTY1Li4xZTEzNTY1NjBjMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFu
YWdlZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jCkBAIC0xNCw2ICsxNCw4
IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50
Lmg+CiAKKyNpbmNsdWRlICJkcm1faW50ZXJuYWwuaCIKKwogLyoqCiAgKiBET0M6IG1hbmFnZWQg
cmVzb3VyY2VzCiAgKgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
