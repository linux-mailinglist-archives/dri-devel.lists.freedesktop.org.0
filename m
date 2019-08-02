Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F97F861
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C5E6EE26;
	Fri,  2 Aug 2019 13:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BA76EE26
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:20:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 374EF21850;
 Fri,  2 Aug 2019 13:20:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 16/76] drm/amd/display: No audio endpoint for Dell
 MST display
Date: Fri,  2 Aug 2019 09:18:50 -0400
Message-Id: <20190802131951.11600-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752011;
 bh=Sczlfus0QhQynXrMg+oG23y9TvPE75FgQEDfjZAZOe4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZmgYkpcZp+BpZiojbdHHnZhhLbhWrdkaKdZtWU9vvNyjq6deYSYqkAU9oIt5jeZSz
 3ZYdvlmkLGiKY0Tl20P+Vp9ETSUFQXzMkVFvLziLkR6EVGkB9JadJgcI5xUwgYV6gk
 s7+51srXmp7WBV3vtjwnGpZ9AmXHaDULMMT5LkDE=
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
 dri-devel@lists.freedesktop.org, Harmanprit Tatla <harmanprit.tatla@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGFybWFucHJpdCBUYXRsYSA8aGFybWFucHJpdC50YXRsYUBhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgNWIyNWU1ZjFhOTcyODQwMjBhYmVlNzM0ODQyN2Y4OWFiZGI2NzRlOCBdCgpb
V2h5XQpUaGVyZSBhcmUgY2VydGFpbiBNU1QgZGlzcGxheXMgKGkuZS4gRGVsbCBQMjcxNVEpCnRo
YXQgYWx0aG91Z2ggaGF2ZSB0aGUgTVNUIGZlYXR1cmUgc2V0IHRvIG9mZiBtYXkgc3RpbGwKcmVw
b3J0IGl0IGlzIGEgYnJhbmNoIGRldmljZSBhbmQgYSBub24temVybwp2YWx1ZSBmb3IgZG93bnN0
cmVhbSBwb3J0IHByZXNlbnQuClRoaXMgY2FuIGxlYWQgdG8gdXMgaW5jb3JyZWN0bHkgY2xhc3Np
ZnlpbmcgYQpkcCBkb25nbGUgY29ubmVjdGlvbiBhcyBiZWluZyBhY3RpdmUgYW5kCmRpc2FibGlu
ZyB0aGUgYXVkaW8gZW5kcG9pbnQgZm9yIHRoZSBkaXNwbGF5LgoKW0hvd10KTW9kaWZpZWQgdGhl
IHBsYWNlbWVudCBhbmQKY29uZGl0aW9uIHVzZWQgdG8gYXNzaWduCnRoZSBpc19icmFuY2hfZGV2
IGJpdC4KClNpZ25lZC1vZmYtYnk6IEhhcm1hbnByaXQgVGF0bGEgPGhhcm1hbnByaXQudGF0bGFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxhcmljLmN5ckBhbWQuY29tPgpBY2tlZC1i
eTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19k
cC5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rX2RwLmMKaW5kZXggMjUzMzExODY0Y2RkNS4uOTY2YWEzYjc1NGM1YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwpAQCAtMjIxOCwx
MSArMjIxOCwxOCBAQCBzdGF0aWMgdm9pZCBnZXRfYWN0aXZlX2NvbnZlcnRlcl9pbmZvKAogCQls
aW5rLT5kcGNkX2NhcHMuZG9uZ2xlX3R5cGUgPSBESVNQTEFZX0RPTkdMRV9OT05FOwogCQlkZGNf
c2VydmljZV9zZXRfZG9uZ2xlX3R5cGUobGluay0+ZGRjLAogCQkJCWxpbmstPmRwY2RfY2Fwcy5k
b25nbGVfdHlwZSk7CisJCWxpbmstPmRwY2RfY2Fwcy5pc19icmFuY2hfZGV2ID0gZmFsc2U7CiAJ
CXJldHVybjsKIAl9CiAKIAkvKiBEUENEIDB4NSBiaXQgMCA9IDEsIGl0IGluZGljYXRlIGl0J3Mg
YnJhbmNoIGRldmljZSAqLwotCWxpbmstPmRwY2RfY2Fwcy5pc19icmFuY2hfZGV2ID0gZHNfcG9y
dC5maWVsZHMuUE9SVF9QUkVTRU5UOworCWlmIChkc19wb3J0LmZpZWxkcy5QT1JUX1RZUEUgPT0g
RE9XTlNUUkVBTV9EUCkgeworCQlsaW5rLT5kcGNkX2NhcHMuaXNfYnJhbmNoX2RldiA9IGZhbHNl
OworCX0KKworCWVsc2UgeworCQlsaW5rLT5kcGNkX2NhcHMuaXNfYnJhbmNoX2RldiA9IGRzX3Bv
cnQuZmllbGRzLlBPUlRfUFJFU0VOVDsKKwl9CiAKIAlzd2l0Y2ggKGRzX3BvcnQuZmllbGRzLlBP
UlRfVFlQRSkgewogCWNhc2UgRE9XTlNUUkVBTV9WR0E6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
