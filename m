Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE63B1F22F3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343D86E0D4;
	Mon,  8 Jun 2020 23:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225A06E0CE;
 Mon,  8 Jun 2020 23:12:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29D172100A;
 Mon,  8 Jun 2020 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657968;
 bh=InbbZyHlNhJSYEISo854k5UHc9Jio+d9wJTFioivsbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tMpzpoAxFhcz1PCY0BtB7coGBL0RNKVM0EsCv8cBj97UzgLQh+wH4juXOsS8arkXH
 DJgJ7lAUbDO8MO3hM+qde4SqBnRaahdhBgV7LP7dTZhXKS5Eb/XXECCI7hFgh6vzWq
 rVaEABGRfh9X4DKNopIfP6IZBLC1HNTsvCwDE878=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 031/606] Make the "Reducing compressed framebufer
 size" message be DRM_INFO_ONCE()
Date: Mon,  8 Jun 2020 19:02:36 -0400
Message-Id: <20200608231211.3363633-31-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgSm9uZXMgPHBqb25lc0ByZWRoYXQuY29tPgoKY29tbWl0IDgyMTUyZDQyNGI2
Y2I2ZmMxZWRlN2QwM2Q2OWMwNGU3ODY2ODg3NDAgdXBzdHJlYW0uCgpUaGlzIHdhcyBzb3J0IG9m
IGFubm95aW5nIG1lOgoKcmFuZG9tOn4kIGRtZXNnIHwgdGFpbCAtMQpbNTIzODg0LjAzOTIyN10g
W2RybV0gUmVkdWNpbmcgdGhlIGNvbXByZXNzZWQgZnJhbWVidWZmZXIgc2l6ZS4gVGhpcyBtYXkg
bGVhZCB0byBsZXNzIHBvd2VyIHNhdmluZ3MgdGhhbiBhIG5vbi1yZWR1Y2VkLXNpemUuIFRyeSB0
byBpbmNyZWFzZSBzdG9sZW4gbWVtb3J5IHNpemUgaWYgYXZhaWxhYmxlIGluIEJJT1MuCnJhbmRv
bTp+JCBkbWVzZyB8IGdyZXAgLWMgIlJlZHVjaW5nIHRoZSBjb21wcmVzc2VkIgo0NwoKVGhpcyBw
YXRjaCBtYWtlcyBpdCBEUk1fSU5GT19PTkNFKCkganVzdCBsaWtlIHRoZSBzaW1pbGFyIG1lc3Nh
Z2UKZmFydGhlciBkb3duIGluIHRoYXQgZnVuY3Rpb24gaXMgcHJfaW5mb19vbmNlKCkuCgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBQZXRlciBKb25lcyA8cGpvbmVz
QHJlZGhhdC5jb20+CkFja2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5j
b20+CkNsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lz
c3Vlcy8xNzQ1Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9t
c2dpZC8yMDE4MDcwNjE5MDQyNC4yOTE5NC0xLXBqb25lc0ByZWRoYXQuY29tClt2c3lyamFsYTog
UmViYXNlIGR1ZSB0byBwZXItZGV2aWNlIGxvZ2dpbmddClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CihjaGVycnkgcGlja2VkIGZy
b20gY29tbWl0IDZiN2ZjNmEzZTZhZjRmZjU3NzM5NDlkMGZlZDcwZDhlN2Y2OGQ1Y2UpCltSb2Ry
aWdvOiBwb3J0IGJhY2sgdG8gRFJNX0lORk9fT05DRV0KU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBW
aXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2ZiYy5jCmluZGV4IGExMDQ4ZWNlNTQxZS4uYjZkNWU3ZGVmYTViIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMKQEAgLTQ3OCw4ICs0NzgsNyBAQCBzdGF0aWMgaW50
IGludGVsX2ZiY19hbGxvY19jZmIoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAog
CWlmICghcmV0KQogCQlnb3RvIGVycl9sbGI7CiAJZWxzZSBpZiAocmV0ID4gMSkgewotCQlEUk1f
SU5GTygiUmVkdWNpbmcgdGhlIGNvbXByZXNzZWQgZnJhbWVidWZmZXIgc2l6ZS4gVGhpcyBtYXkg
bGVhZCB0byBsZXNzIHBvd2VyIHNhdmluZ3MgdGhhbiBhIG5vbi1yZWR1Y2VkLXNpemUuIFRyeSB0
byBpbmNyZWFzZSBzdG9sZW4gbWVtb3J5IHNpemUgaWYgYXZhaWxhYmxlIGluIEJJT1MuXG4iKTsK
LQorCQlEUk1fSU5GT19PTkNFKCJSZWR1Y2luZyB0aGUgY29tcHJlc3NlZCBmcmFtZWJ1ZmZlciBz
aXplLiBUaGlzIG1heSBsZWFkIHRvIGxlc3MgcG93ZXIgc2F2aW5ncyB0aGFuIGEgbm9uLXJlZHVj
ZWQtc2l6ZS4gVHJ5IHRvIGluY3JlYXNlIHN0b2xlbiBtZW1vcnkgc2l6ZSBpZiBhdmFpbGFibGUg
aW4gQklPUy5cbiIpOwogCX0KIAogCWZiYy0+dGhyZXNob2xkID0gcmV0OwotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
