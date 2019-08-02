Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1E7F870
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518E6EE33;
	Fri,  2 Aug 2019 13:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D490D6EE2E;
 Fri,  2 Aug 2019 13:20:27 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD6F621880;
 Fri,  2 Aug 2019 13:20:26 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 24/76] drm/amd/display: Only enable audio if
 speaker allocation exists
Date: Fri,  2 Aug 2019 09:18:58 -0400
Message-Id: <20190802131951.11600-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752027;
 bh=qYATy7CJpCOjeg6zvdgdZ/gVtljDVqOylR61OFotxEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uJB5dGHM+hNHRl2YGm23ON6A5Dbn02Kndjm5HJ0VDqPJGDNSzw7LFBzHHWbygggfj
 phMM3aXcMEbhawX9kY+/m6/E7NnCUKA5NkLBq0fG9S79vfwaLTgLAa2TMTI+jbfbi/
 ZQF1EtfGHEizBWlCEUDsi938ajlDVluPpLjc4hrA=
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alvin Lee <alvin.lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCA2
YWMyNWU2ZDViMmZiZjI1MWU5ZmEyZjQxMzFkNDJjODE1YjQzODY3IF0KCltXaHldCgpJbiBkbV9o
ZWxwZXJzX3BhcnNlX2VkaWRfY2FwcywgdGhlcmUgaXMgYSBjb3JuZXIgY2FzZSB3aGVyZSBubyBz
cGVha2VycwpjYW4gYmUgYWxsb2NhdGVkIGV2ZW4gdGhvdWdoIHRoZSBhdWRpbyBtb2RlIGNvdW50
IGlzIGdyZWF0ZXIgdGhhbiAwLgpFbmFibGluZyBhdWRpbyB3aGVuIG5vIHNwZWFrZXIgYWxsb2Nh
dGlvbnMgZXhpc3RzIGNhbiBjYXVzZSBpc3N1ZXMgaW4KdGhlIHZpZGVvIHN0cmVhbS4KCltIb3dd
CgpBZGQgYSBjaGVjayB0byBub3QgZW5hYmxlIGF1ZGlvIHVubGVzcyBvbmUgb3IgbW9yZSBzcGVh
a2VyIGFsbG9jYXRpb25zCmV4aXN0IChzaW5jZSBkb2luZyB0aGlzIGNhbiBjYXVzZSBpc3N1ZXMg
aW4gdGhlIHZpZGVvIHN0cmVhbSkuCgpTaWduZWQtb2ZmLWJ5OiBBbHZpbiBMZWUgPGFsdmluLmxl
ZTJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3Jlc291cmNlLmMKaW5kZXggYjg3ZThkODBiYjZhOC4uMGZkNzU5ZDNhMGU3ZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5j
CkBAIC0yMDE5LDcgKzIwMTksNyBAQCBlbnVtIGRjX3N0YXR1cyByZXNvdXJjZV9tYXBfcG9vbF9y
ZXNvdXJjZXMoCiAJLyogVE9ETzogQWRkIGNoZWNrIGlmIEFTSUMgc3VwcG9ydCBhbmQgRURJRCBh
dWRpbyAqLwogCWlmICghc3RyZWFtLT5jb252ZXJ0ZXJfZGlzYWJsZV9hdWRpbyAmJgogCSAgICBk
Y19pc19hdWRpb19jYXBhYmxlX3NpZ25hbChwaXBlX2N0eC0+c3RyZWFtLT5zaWduYWwpICYmCi0J
ICAgIHN0cmVhbS0+YXVkaW9faW5mby5tb2RlX2NvdW50KSB7CisJICAgIHN0cmVhbS0+YXVkaW9f
aW5mby5tb2RlX2NvdW50ICYmIHN0cmVhbS0+YXVkaW9faW5mby5mbGFncy5hbGwpIHsKIAkJcGlw
ZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gPSBmaW5kX2ZpcnN0X2ZyZWVfYXVkaW8oCiAJCSZjb250
ZXh0LT5yZXNfY3R4LCBwb29sLCBwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5pZCk7
CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
