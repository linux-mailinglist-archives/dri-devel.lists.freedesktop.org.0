Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F436BCCF1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94486EA76;
	Tue, 24 Sep 2019 16:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697276EA75;
 Tue, 24 Sep 2019 16:43:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ED5F21783;
 Tue, 24 Sep 2019 16:43:16 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 33/87] drm/amd/display: Register VUPDATE_NO_LOCK
 interrupts for DCN2
Date: Tue, 24 Sep 2019 12:40:49 -0400
Message-Id: <20190924164144.25591-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343397;
 bh=jP5aR8QFUuqvh6IsxqjL6IewN0qsy7Z1B9ECwlveLB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NB7leaxPxLg9CReNfmMdurkiT7uPl0763Un9HANanDHq+fopKzg0V6Gtc7InesQAJ
 gDjk4b7nGMFxcAzVgbjFC0HJssYvbvYEIXC7jdUAJ1x1CQThIZ/8VjQXrO/Gf3s1us
 Ok1RXrWVvnUjPWom95rIZqQS1vNLYOULyfPe1qbY=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZTQwODM3YWZiOWIwMTE3NTdlMTdlOWY3MWQ5Nzg1M2NhNTc0YmNm
ZiBdCgpbV2h5XQpUaGVzZSBhcmUgbmVlZGVkIHRvIHNlbmQgYmFjayBEUk0gdmJsYW5rIGV2ZW50
cyBpbiB0aGUgY2FzZSB3aGVyZSBWUlIKaXMgb24uIFdpdGhvdXQgdGhlIGludGVycnVwdCBlbmFi
bGVkIHdlJ3JlIGRlZmVycmluZyB0aGUgZXZlbnRzIGludG8gdGhlCnZibGFuayBxdWV1ZSBhbmQg
dXNlcnNwYWNlIGlzIGxlZnQgd2FpdGluZyBmb3JldmVyIHRvIGdldCBiYWNrIHRoZQpldmVudHMg
dGhleSBuZWVkLgoKRm91bmQgdXNpbmcgaWd0QGttc192cnIgLSB0aGUgdGVzdCBmYWlscyBpbW1l
ZGlhdGVseSBkdWUgdG8gdmJsYW5rCnRpbWVvdXQuCgpbSG93XQpSZWdpc3RlciB0aGVtIHRoZSBz
YW1lIHdheSB3ZSdyZSBoYW5kbGluZyBpdCBmb3IgRENOMS4KClRoaXMgZml4ZXMgaWd0QGttc192
cnIgZm9yIERDTjIuCgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xh
cy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5G
cmFuY2lzQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rpc3Bs
YXkvZGMvaXJxL2RjbjIwL2lycV9zZXJ2aWNlX2RjbjIwLmMgIHwgMjggKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMjAvaXJx
X3NlcnZpY2VfZGNuMjAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNu
MjAvaXJxX3NlcnZpY2VfZGNuMjAuYwppbmRleCAzY2MwZjJhMWY3N2NjLi41ZGIyOWJmNTgyZDMx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJxL2RjbjIwL2ly
cV9zZXJ2aWNlX2RjbjIwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2ly
cS9kY24yMC9pcnFfc2VydmljZV9kY24yMC5jCkBAIC0xNjcsNiArMTY3LDExIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaXJxX3NvdXJjZV9pbmZvX2Z1bmNzIHZibGFua19pcnFfaW5mb19mdW5jcyA9
IHsKIAkuYWNrID0gTlVMTAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFfc291cmNlX2lu
Zm9fZnVuY3MgdnVwZGF0ZV9ub19sb2NrX2lycV9pbmZvX2Z1bmNzID0geworCS5zZXQgPSBOVUxM
LAorCS5hY2sgPSBOVUxMCit9OworCiAjdW5kZWYgQkFTRV9JTk5FUgogI2RlZmluZSBCQVNFX0lO
TkVSKHNlZykgRENOX0JBU0VfX0lOU1QwX1NFRyAjIyBzZWcKIApAQCAtMjIxLDEyICsyMjYsMTUg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFfc291cmNlX2luZm9fZnVuY3MgdmJsYW5rX2lycV9p
bmZvX2Z1bmNzID0gewogCQkuZnVuY3MgPSAmcGZsaXBfaXJxX2luZm9fZnVuY3NcCiAJfQogCi0j
ZGVmaW5lIHZ1cGRhdGVfaW50X2VudHJ5KHJlZ19udW0pXAorLyogdnVwZGF0ZV9ub19sb2NrX2lu
dF9lbnRyeSBtYXBzIHRvIERDX0lSUV9TT1VSQ0VfVlVQREFURXgsIHRvIG1hdGNoIHNlbWFudGlj
CisgKiBvZiBEQ0UncyBEQ19JUlFfU09VUkNFX1ZVUERBVEV4LgorICovCisjZGVmaW5lIHZ1cGRh
dGVfbm9fbG9ja19pbnRfZW50cnkocmVnX251bSlcCiAJW0RDX0lSUV9TT1VSQ0VfVlVQREFURTEg
KyByZWdfbnVtXSA9IHtcCiAJCUlSUV9SRUdfRU5UUlkoT1RHLCByZWdfbnVtLFwKLQkJCU9UR19H
TE9CQUxfU1lOQ19TVEFUVVMsIFZVUERBVEVfSU5UX0VOLFwKLQkJCU9UR19HTE9CQUxfU1lOQ19T
VEFUVVMsIFZVUERBVEVfRVZFTlRfQ0xFQVIpLFwKLQkJLmZ1bmNzID0gJnZibGFua19pcnFfaW5m
b19mdW5jc1wKKwkJCU9UR19HTE9CQUxfU1lOQ19TVEFUVVMsIFZVUERBVEVfTk9fTE9DS19JTlRf
RU4sXAorCQkJT1RHX0dMT0JBTF9TWU5DX1NUQVRVUywgVlVQREFURV9OT19MT0NLX0VWRU5UX0NM
RUFSKSxcCisJCS5mdW5jcyA9ICZ2dXBkYXRlX25vX2xvY2tfaXJxX2luZm9fZnVuY3NcCiAJfQog
CiAjZGVmaW5lIHZibGFua19pbnRfZW50cnkocmVnX251bSlcCkBAIC0zMzMsMTIgKzM0MSwxMiBA
QCBpcnFfc291cmNlX2luZm9fZGNuMjBbREFMX0lSUV9TT1VSQ0VTX05VTUJFUl0gPSB7CiAJZGNf
dW5kZXJmbG93X2ludF9lbnRyeSg2KSwKIAlbRENfSVJRX1NPVVJDRV9ETUNVX1NDUF0gPSBkdW1t
eV9pcnFfZW50cnkoKSwKIAlbRENfSVJRX1NPVVJDRV9WQklPU19TV10gPSBkdW1teV9pcnFfZW50
cnkoKSwKLQl2dXBkYXRlX2ludF9lbnRyeSgwKSwKLQl2dXBkYXRlX2ludF9lbnRyeSgxKSwKLQl2
dXBkYXRlX2ludF9lbnRyeSgyKSwKLQl2dXBkYXRlX2ludF9lbnRyeSgzKSwKLQl2dXBkYXRlX2lu
dF9lbnRyeSg0KSwKLQl2dXBkYXRlX2ludF9lbnRyeSg1KSwKKwl2dXBkYXRlX25vX2xvY2tfaW50
X2VudHJ5KDApLAorCXZ1cGRhdGVfbm9fbG9ja19pbnRfZW50cnkoMSksCisJdnVwZGF0ZV9ub19s
b2NrX2ludF9lbnRyeSgyKSwKKwl2dXBkYXRlX25vX2xvY2tfaW50X2VudHJ5KDMpLAorCXZ1cGRh
dGVfbm9fbG9ja19pbnRfZW50cnkoNCksCisJdnVwZGF0ZV9ub19sb2NrX2ludF9lbnRyeSg1KSwK
IAl2YmxhbmtfaW50X2VudHJ5KDApLAogCXZibGFua19pbnRfZW50cnkoMSksCiAJdmJsYW5rX2lu
dF9lbnRyeSgyKSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
