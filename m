Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F69A6E56
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DACC89358;
	Tue,  3 Sep 2019 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BDC89358;
 Tue,  3 Sep 2019 16:26:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12DD6238CF;
 Tue,  3 Sep 2019 16:26:16 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 033/167] drm/i915: Restore sane defaults for KMS
 on GEM error load
Date: Tue,  3 Sep 2019 12:23:05 -0400
Message-Id: <20190903162519.7136-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527977;
 bh=GThmCo6ekjQevRbJ4RJw3Jp6UbfDong1DpDA0cRpd8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YtAAf3YEay/D6BY+jBcM1HgxMVEKM/Zj0c3biXkXaPJAVTsiLk5zO8R6GRxDnYM9K
 7A9NAsA1v7xfAzgwY9C+lfukwc9uDFZK1rCDzgOnoOsCnTulAJyu5cvyNz7kKTAUSb
 Zivb9i1tq3yjTY7V4dyRd4tmYst/VgW5qDlhfuuA=
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
Cc: Sasha Levin <sashal@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpbIFVwc3RyZWFt
IGNvbW1pdCA3ZWQ0M2RmNzIwYzAwN2Q2MGJlZTZkODFkYTA3YmNkYzdlNGE1NWFlIF0KCklmIHdl
IGZhaWwgZHVyaW5nIEdFTSBpbml0aWFsaXNhdGlvbiwgd2Ugc2NydWIgdGhlIEhXIHN0YXRlIGJ5
CnBlcmZvcm1pbmcgYSBkZXZpY2UgbGV2ZWwgR1BVIHJlc3VldC4gSG93ZXZlciwgd2Ugd2FudCB0
byBsZWF2ZSB0aGUKc3lzdGVtIGluIGEgdXNhYmxlIHN0YXRlICh3aXRoIGZ1bmN0aW9uaW5nIEtN
UyBidXQgbm8gR0VNKSBzbyBhZnRlcgpzY3J1YmJpbmcgdGhlIEhXIHN0YXRlLCB3ZSBuZWVkIHRv
IHJlc3RvcmUgc29tZSBzYW5lIGRlZmF1bHRzIGFuZApyZS1lbmFibGUgdGhlIGxvdy1sZXZlbCBj
b21tb24gcGFydHMgb2YgdGhlIEdQVSAoc3VjaCBhcyB0aGUgR01DSCkuCgp2MjogUmVzdG9yZSBH
VFQgZW50cmllcy4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
bXNnaWQvMjAxODA3MjYwODUwMzMuNDA0NC0yLWNocmlzQGNocmlzLXdpbHNvbi5jby51awpSZXZp
ZXdlZC1ieTogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5j
CmluZGV4IDAzY2RhMTk3ZmI2YjguLjUwMTlkZmQ4YmNmMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9n
ZW0uYwpAQCAtNTU5NSw2ICs1NTk1LDggQEAgaW50IGk5MTVfZ2VtX2luaXQoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogCQlpOTE1X2dlbV9jbGVhbnVwX3VzZXJwdHIoZGV2X3By
aXYpOwogCiAJaWYgKHJldCA9PSAtRUlPKSB7CisJCW11dGV4X2xvY2soJmRldl9wcml2LT5kcm0u
c3RydWN0X211dGV4KTsKKwogCQkvKgogCQkgKiBBbGxvdyBlbmdpbmUgaW5pdGlhbGlzYXRpb24g
dG8gZmFpbCBieSBtYXJraW5nIHRoZSBHUFUgYXMKIAkJICogd2VkZ2VkLiBCdXQgd2Ugb25seSB3
YW50IHRvIGRvIHRoaXMgd2hlcmUgdGhlIEdQVSBpcyBhbmdyeSwKQEAgLTU2MDUsNyArNTYwNywx
NCBAQCBpbnQgaTkxNV9nZW1faW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYp
CiAJCQkJCSJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBHUFUsIGRlY2xhcmluZyBpdCB3ZWRnZWQhXG4i
KTsKIAkJCWk5MTVfZ2VtX3NldF93ZWRnZWQoZGV2X3ByaXYpOwogCQl9Ci0JCXJldCA9IDA7CisK
KwkJLyogTWluaW1hbCBiYXNpYyByZWNvdmVyeSBmb3IgS01TICovCisJCXJldCA9IGk5MTVfZ2d0
dF9lbmFibGVfaHcoZGV2X3ByaXYpOworCQlpOTE1X2dlbV9yZXN0b3JlX2d0dF9tYXBwaW5ncyhk
ZXZfcHJpdik7CisJCWk5MTVfZ2VtX3Jlc3RvcmVfZmVuY2VzKGRldl9wcml2KTsKKwkJaW50ZWxf
aW5pdF9jbG9ja19nYXRpbmcoZGV2X3ByaXYpOworCisJCW11dGV4X3VubG9jaygmZGV2X3ByaXYt
PmRybS5zdHJ1Y3RfbXV0ZXgpOwogCX0KIAogCWk5MTVfZ2VtX2RyYWluX2ZyZWVkX29iamVjdHMo
ZGV2X3ByaXYpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
