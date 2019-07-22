Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1057050F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE25689CB5;
	Mon, 22 Jul 2019 16:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125AC89CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:08:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id BFD4628AE09
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/2] modetest: Fix segmentation fault
Date: Mon, 22 Jul 2019 13:08:22 -0300
Message-Id: <20190722160823.26668-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Ezequiel Garcia <ezequiel@collabora.com>, rohan.garg@collabora.com,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBhIG1vZGUgaXMgc2V0IHdpdGgganVzdCBhIGNvbm5lY3RvciAiLXMgZm9vIiwKd2UgZ2V0
IGEgbmFzdHkgc2VnbWVudGF0aW9uIGZhdWx0LiBGaXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBFemVx
dWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Ci0tLQogdGVzdHMvbW9kZXRlc3Qv
bW9kZXRlc3QuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRl
c3QuYwppbmRleCBlNjZiZTY2MDdlMDAuLjVlNjI4MTI3YTEzMCAxMDA2NDQKLS0tIGEvdGVzdHMv
bW9kZXRlc3QvbW9kZXRlc3QuYworKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCkBAIC0x
Njk1LDYgKzE2OTUsOCBAQCBzdGF0aWMgaW50IHBhcnNlX2Nvbm5lY3RvcihzdHJ1Y3QgcGlwZV9h
cmcgKnBpcGUsIGNvbnN0IGNoYXIgKmFyZykKIAkJcmV0dXJuIC0xOwogCiAJLyogUGFyc2UgdGhl
IHJlbWFpbmluZyBwYXJhbWV0ZXJzLiAqLworCWlmICghZW5kcCkKKwkJcmV0dXJuIC0xOwogCWlm
ICgqZW5kcCA9PSAnQCcpIHsKIAkJYXJnID0gZW5kcCArIDE7CiAJCXBpcGUtPmNydGNfaWQgPSBz
dHJ0b3VsKGFyZywgJmVuZHAsIDEwKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
