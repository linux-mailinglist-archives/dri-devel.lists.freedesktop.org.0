Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98F9FD19
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FDB89CF1;
	Wed, 28 Aug 2019 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FD3899BE;
 Tue, 27 Aug 2019 09:33:39 +0000 (UTC)
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i2Xr6-0000tY-V0; Tue, 27 Aug 2019 09:33:37 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com
Subject: [PATCH] drm/amdgpu: Add APTX quirk for Dell Latitude 5495
Date: Tue, 27 Aug 2019 17:33:32 +0800
Message-Id: <20190827093332.18096-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVlZHMgQVRQWCByYXRoZXIgdGhhbiBfUFIzIHRvIHJlYWxseSB0dXJuIG9mZiB0aGUgZEdQVS4g
VGhpcyBjYW4gc2F2ZQp+NVcgd2hlbiBkR1BVIGlzIHJ1bnRpbWUtc3VzcGVuZGVkLgoKU2lnbmVk
LW9mZi1ieTogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFuZGxlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFuZGxlci5jCmluZGV4IDkyYjExZGUxOTU4MS4uMzU0Yzhi
NjEwNmRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRw
eF9oYW5kbGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0cHhf
aGFuZGxlci5jCkBAIC01NzUsNiArNTc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVf
cHhfcXVpcmsgYW1kZ3B1X3B4X3F1aXJrX2xpc3RbXSA9IHsKIAl7IDB4MTAwMiwgMHg2OTAwLCAw
eDEwMDIsIDB4MDEyNCwgQU1ER1BVX1BYX1FVSVJLX0ZPUkNFX0FUUFggfSwKIAl7IDB4MTAwMiwg
MHg2OTAwLCAweDEwMjgsIDB4MDgxMiwgQU1ER1BVX1BYX1FVSVJLX0ZPUkNFX0FUUFggfSwKIAl7
IDB4MTAwMiwgMHg2OTAwLCAweDEwMjgsIDB4MDgxMywgQU1ER1BVX1BYX1FVSVJLX0ZPUkNFX0FU
UFggfSwKKwl7IDB4MTAwMiwgMHg2OTlmLCAweDEwMjgsIDB4MDgxNCwgQU1ER1BVX1BYX1FVSVJL
X0ZPUkNFX0FUUFggfSwKIAl7IDB4MTAwMiwgMHg2OTAwLCAweDEwMjUsIDB4MTI1QSwgQU1ER1BV
X1BYX1FVSVJLX0ZPUkNFX0FUUFggfSwKIAl7IDB4MTAwMiwgMHg2OTAwLCAweDE3QUEsIDB4Mzgw
NiwgQU1ER1BVX1BYX1FVSVJLX0ZPUkNFX0FUUFggfSwKIAl7IDAsIDAsIDAsIDAsIDAgfSwKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
