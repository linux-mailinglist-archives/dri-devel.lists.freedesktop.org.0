Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2660BCD12
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93916EA83;
	Tue, 24 Sep 2019 16:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72236EA80;
 Tue, 24 Sep 2019 16:46:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD7E421783;
 Tue, 24 Sep 2019 16:46:03 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 07/70] drm/amd/display: add monitor patch to add
 T7 delay
Date: Tue, 24 Sep 2019 12:44:46 -0400
Message-Id: <20190924164549.27058-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343564;
 bh=J1zur49gsnGltUJR6USs8KZFsOWEQRy5Y0FIf5lKH6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oU2xfg2y2cB/gUBPjb9KzLFbY5FSnfpj/20O2rdAASQr0PJ8lLJRNLaUFOD8cMWrs
 pOoxrlPzg9MpNDvNK4KCxPrTKlOm7x4lMCw+IXYEVoPqtnusl1YOgF1INeaqO6zDw8
 Rw8oDxb2ysVluQVocSY/PZHm9/UEwfJv7wyo0xaU=
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Anthony Koo <anthony.koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPGFudGhvbnkua29vQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA4OGVhYzI0MWExZmM1MDBjZTUyNzRhMDlkZGM0YmQ1ZmMyYjVhZGI2IF0KCltXaHldClNwZWNp
ZmljYWxseSB0byBvbmUgcGFuZWwsClRDT04gaXMgYWJsZSB0byBhY2NlcHQgYWN0aXZlIHZpZGVv
IHNpZ25hbCBxdWlja2x5LCBidXQKdGhlIFNvdXJjZSBEcml2ZXIgcmVxdWlyZXMgMi0zIGZyYW1l
cyBvZiBleHRyYSB0aW1lLgoKSXQgaXMgYSBQYW5lbCBpc3N1ZSBzaW5jZSBUQ09OIG5lZWRzIHRv
IHRha2UgY2FyZSBvZgphbGwgU2luayByZXF1aXJlbWVudHMgaW5jbHVkaW5nIFNvdXJjZSBEcml2
ZXIuIEJ1dCBpbgp0aGlzIGNhc2UgaXQgZG9lcyBub3QuCgpDdXN0b21lciBpcyBhc2tpbmcgdG8g
YWRkIGZpeGVkIFQ3IGRlbGF5IGFzIHBhbmVsCndvcmthcm91bmQuCgpbSG93XQpBZGQgbW9uaXRv
ciBzcGVjaWZpYyBwYXRjaCB0byBhZGQgVDcgZGVsYXkKClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
S29vIDxhbnRob255Lmtvb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFy
bGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyB8IDQgKysrKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmggICAgICAgICAgfCAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYwppbmRleCBiMGRlYTc1OWNkODYwLi44
YWVjZjA0NGUyYWU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2h3c3MuYwpAQCAtMTU0LDYgKzE1NCwxMCBAQCBib29sIGVkcF9yZWNlaXZl
cl9yZWFkeV9UNyhzdHJ1Y3QgZGNfbGluayAqbGluaykKIAkJCWJyZWFrOwogCQl1ZGVsYXkoMjUp
OyAvL01BeCBUNyBpcyA1MG1zCiAJfSB3aGlsZSAoKyt0cmllcyA8IDMwMCk7CisKKwlpZiAobGlu
ay0+bG9jYWxfc2luay0+ZWRpZF9jYXBzLnBhbmVsX3BhdGNoLmV4dHJhX3Q3X21zID4gMCkKKwkJ
dWRlbGF5KGxpbmstPmxvY2FsX3NpbmstPmVkaWRfY2Fwcy5wYW5lbF9wYXRjaC5leHRyYV90N19t
cyAqIDEwMDApOworCiAJcmV0dXJuIHJlc3VsdDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNfdHlwZXMuaAppbmRleCA2YzJhM2Q5YTRjMmU3Li4yODMwODI2NjZiZTUxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfdHlwZXMuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfdHlwZXMuaApAQCAtMjAyLDYgKzIw
Miw3IEBAIHN0cnVjdCBkY19wYW5lbF9wYXRjaCB7CiAJdW5zaWduZWQgaW50IGRwcG93ZXJ1cF9k
ZWxheTsKIAl1bnNpZ25lZCBpbnQgZXh0cmFfdDEyX21zOwogCXVuc2lnbmVkIGludCBleHRyYV9k
ZWxheV9iYWNrbGlnaHRfb2ZmOworCXVuc2lnbmVkIGludCBleHRyYV90N19tczsKIH07CiAKIHN0
cnVjdCBkY19lZGlkX2NhcHMgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
