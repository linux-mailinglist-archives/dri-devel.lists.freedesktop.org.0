Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0FD07EE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D866E8F0;
	Wed,  9 Oct 2019 07:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756456E799;
 Tue,  8 Oct 2019 11:49:25 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnLC-0006Y6-HO; Tue, 08 Oct 2019 12:07:42 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnLB-0003ag-Pb; Tue, 08 Oct 2019 12:07:41 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/nouveau/kms/nv50-: make base917c_format static
Date: Tue,  8 Oct 2019 12:07:37 +0100
Message-Id: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJhc2U5MTdjX2Zvcm1hdCBpc24ndCBleHBvcnRlZCwgc28gbWFrZSBpdCBzdGF0aWMgdG8K
YXZvaWQgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvYmFzZTkxN2MuYzoyNjoxOiB3YXJuaW5nOiBzeW1ib2wgJ2Jhc2U5MTdjX2Zvcm1hdCcg
d2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KClNpZ25lZC1vZmYtYnk6IEJl
biBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9iYXNlOTE3Yy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvYmFzZTkxN2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2Jhc2U5MTdjLmMKaW5kZXggYTFiYWVkNGZlMGU5Li5jYTI2MDUwOWE0ZjEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Jhc2U5MTdjLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvYmFzZTkxN2MuYwpAQCAtMjIsNyArMjIsNyBA
QAogI2luY2x1ZGUgImJhc2UuaCIKICNpbmNsdWRlICJhdG9tLmgiCiAKLWNvbnN0IHUzMgorc3Rh
dGljIGNvbnN0IHUzMgogYmFzZTkxN2NfZm9ybWF0W10gPSB7CiAJRFJNX0ZPUk1BVF9DOCwKIAlE
Uk1fRk9STUFUX1hSR0I4ODg4LAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
