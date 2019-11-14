Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F4CFCFD0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 21:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36D96EF2E;
	Thu, 14 Nov 2019 20:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5986E40D;
 Thu, 14 Nov 2019 20:44:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 19205726-1500050 
 for multiple; Thu, 14 Nov 2019 20:44:13 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/dm: Do not throw an error for a display with no
 audio
Date: Thu, 14 Nov 2019 20:44:13 +0000
Message-Id: <20191114204413.457504-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.24.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW4gb2xkIGRpc3BsYXkgd2l0aCBubyBhdWRpbyBtYXkgbm90IGhhdmUgYW4gRURJRCB3aXRoIGEg
Q0VBIGJsb2NrLCBvcgppdCBtYXkgc2ltcGx5IGJlIHRvbyBvbGQgdG8gc3VwcG9ydCBhdWRpby4g
VGhpcyBpcyBub3QgYSBkcml2ZXIgZXJyb3IsCnNvIGRvbid0IGZsYWcgaXQgYXMgc3VjaC4KCkJ1
Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTIx
NDAKUmVmZXJlbmNlczogYWUyYTM0OTU5NzNlICgiZHJtL2FtZDogYmUgcXVpZXQgd2hlbiBubyBT
QUQgYmxvY2sgaXMgZm91bmQiKQpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgpDYzogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmRlPgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCAxMWU1Nzg0YWE2MmEuLjA0
ODA4ZGJlY2FiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtOTcsOCArOTcsNiBAQCBlbnVtIGRj
X2VkaWRfc3RhdHVzIGRtX2hlbHBlcnNfcGFyc2VfZWRpZF9jYXBzKAogCQkJKHN0cnVjdCBlZGlk
ICopIGVkaWQtPnJhd19lZGlkKTsKIAogCXNhZF9jb3VudCA9IGRybV9lZGlkX3RvX3NhZCgoc3Ry
dWN0IGVkaWQgKikgZWRpZC0+cmF3X2VkaWQsICZzYWRzKTsKLQlpZiAoc2FkX2NvdW50IDwgMCkK
LQkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNBRHM6ICVkXG4iLCBzYWRfY291bnQpOwogCWlm
IChzYWRfY291bnQgPD0gMCkKIAkJcmV0dXJuIHJlc3VsdDsKIAotLSAKMi4yNC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
