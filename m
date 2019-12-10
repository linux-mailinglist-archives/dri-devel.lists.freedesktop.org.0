Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3287119350
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B1B6E93D;
	Tue, 10 Dec 2019 21:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F58A6E93D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:09:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E35A6246AB;
 Tue, 10 Dec 2019 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012187;
 bh=kMEv874BtPuf0HyGoIPf4BP7UuEI4I7m70iZktNpjEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJUusVM15cvmCkt1Szx/OYUjeEPC1EPQ0mOEURtXmyeL5vga8kDIRnb0Ppzl0rtfy
 0nE8OOjRr64YvBft+i/RjhV8q1Aih1+zo06XWmryM2r80T0XUCXKPSnzg3SdrDqqB9
 xD0d4d3UxUfhfH+6BNqYLwZQ4bu4rTzAPwIzsn/E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 143/350] drm/nouveau: Resume hotplug interrupts
 earlier
Date: Tue, 10 Dec 2019 16:04:08 -0500
Message-Id: <20191210210735.9077-104-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, Sasha Levin <sashal@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Juston Li <juston.li@intel.com>, nouveau@lists.freedesktop.org,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGFj
MGRlMTZhMzhhOWVjNzAyNmNhOTYxMzJlMzg4M2M1NjQ0OTcwNjggXQoKQ3VycmVudGx5LCB3ZSBl
bmFibGUgaG90cGx1ZyBkZXRlY3Rpb24gb25seSBhZnRlciB3ZSByZS1lbmFibGUgdGhlCmRpc3Bs
YXkuIEhvd2V2ZXIsIHRoaXMgaXMgdG9vIGxhdGUgaWYgd2UncmUgcGxhbm5pbmcgb24gc2VuZGlu
ZyBzaWRlYmFuZAptZXNzYWdlcyBkdXJpbmcgdGhlIHJlc3VtZSBwcm9jZXNzIC0gd2hpY2ggd2Un
bGwgbmVlZCB0byBkbyBpbiBvcmRlciB0bwpyZXByb2JlIHRoZSB0b3BvbG9neSBvbiByZXN1bWUu
CgpTbywgZW5hYmxlIGhvdHBsdWcgZXZlbnRzIGJlZm9yZSByZWluaXRpYWxpemluZyB0aGUgZGlz
cGxheS4KCkNjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJlIERlYWsg
PGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpSZXZpZXdlZC1ieTogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRl
QHJlZGhhdC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MTAyMjAyMzY0MS44MDI2LTExLWx5dWRlQHJlZGhhdC5jb20KU2lnbmVkLW9m
Zi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jIHwgMTkgKysrKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYwppbmRleCA2ZjAzODUxMWEwM2E5Li41M2Y5
YmNlYWYxN2E1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYwpA
QCAtNDA3LDYgKzQwNywxNyBAQCBub3V2ZWF1X2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCBib29sIHJlc3VtZSwgYm9vbCBydW50aW1lKQogCXN0cnVjdCBkcm1fY29ubmVjdG9y
X2xpc3RfaXRlciBjb25uX2l0ZXI7CiAJaW50IHJldDsKIAorCS8qCisJICogRW5hYmxlIGhvdHBs
dWcgaW50ZXJydXB0cyAoZG9uZSBhcyBlYXJseSBhcyBwb3NzaWJsZSwgc2luY2Ugd2UgbmVlZAor
CSAqIHRoZW0gZm9yIE1TVCkKKwkgKi8KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihk
ZXYsICZjb25uX2l0ZXIpOworCW5vdXZlYXVfZm9yX2VhY2hfbm9uX21zdF9jb25uZWN0b3JfaXRl
cihjb25uZWN0b3IsICZjb25uX2l0ZXIpIHsKKwkJc3RydWN0IG5vdXZlYXVfY29ubmVjdG9yICpj
b25uID0gbm91dmVhdV9jb25uZWN0b3IoY29ubmVjdG9yKTsKKwkJbnZpZl9ub3RpZnlfZ2V0KCZj
b25uLT5ocGQpOworCX0KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7
CisKIAlyZXQgPSBkaXNwLT5pbml0KGRldiwgcmVzdW1lLCBydW50aW1lKTsKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwpAQCAtNDE2LDE0ICs0MjcsNiBAQCBub3V2ZWF1X2Rpc3BsYXlfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHJlc3VtZSwgYm9vbCBydW50aW1lKQogCSAqLwog
CWRybV9rbXNfaGVscGVyX3BvbGxfZW5hYmxlKGRldik7CiAKLQkvKiBlbmFibGUgaG90cGx1ZyBp
bnRlcnJ1cHRzICovCi0JZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGV2LCAmY29ubl9p
dGVyKTsKLQlub3V2ZWF1X2Zvcl9lYWNoX25vbl9tc3RfY29ubmVjdG9yX2l0ZXIoY29ubmVjdG9y
LCAmY29ubl9pdGVyKSB7Ci0JCXN0cnVjdCBub3V2ZWF1X2Nvbm5lY3RvciAqY29ubiA9IG5vdXZl
YXVfY29ubmVjdG9yKGNvbm5lY3Rvcik7Ci0JCW52aWZfbm90aWZ5X2dldCgmY29ubi0+aHBkKTsK
LQl9Ci0JZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIpOwotCiAJcmV0dXJu
IHJldDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
