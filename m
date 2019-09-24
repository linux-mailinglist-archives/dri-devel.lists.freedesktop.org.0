Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02324BCCF8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A526EA74;
	Tue, 24 Sep 2019 16:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14ED6EA6D;
 Tue, 24 Sep 2019 16:44:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24F8820872;
 Tue, 24 Sep 2019 16:44:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 54/87] drm/nouveau/kms/tu102-: disable input lut
 when input is already FP16
Date: Tue, 24 Sep 2019 12:41:10 -0400
Message-Id: <20190924164144.25591-54-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343454;
 bh=GMQqub5xp0/4XAi4fDZg0COcqBv/GhT/CjZ1rK/+jCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YQOZl3RI9XjgJ9FrBdsLL+M5xwR+4uTBLdj1l6vfefsqNdo2nWDFludllxijVyvAL
 ELX7O3RHvqht397FShpkotvM/V20Ovpr/k4U7WlbMhENtu22wcUd4to+adcWjPNIP9
 0PJLLejNtv7e6KTHUg80oCaPzy74Kkr1a06VaOr0=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MWUzMzlhYjJhYzNjNzY5YzFiMDZiOWZiN2Q1MzJmODQ5NWViYzU2ZCBdCgpPbiBUdXJpbmcsIGFu
IGlucHV0IExVVCBpcyByZXF1aXJlZCB0byB0cmFuc2Zvcm0gaW5wdXRzIGluIGZpeGVkLXBvaW50
CmZvcm1hdHMgdG8gRlAxNiBmb3IgdGhlIGludGVybmFsIGRpc3BsYXkgcGlwZS4gIFdlIHByb3Zp
ZGUgYW4gaWRlbnRpdHkKbWFwcGluZyB3aGVuZXZlciBhIHdpbmRvdyBpcyBlbmFibGVkIGZvciB0
aGlzIHJlYXNvbi4KCkhXIGhhcyBlcnJvciBjaGVja3MgdG8gZW5zdXJlIHdoZW4gdGhlIGlucHV0
IGlzIGFscmVhZHkgRlAxNiwgdGhhdCB0aGUKaW5wdXQgTFVUIGlzIGFsc28gZGlzYWJsZWQuCgpT
aWduZWQtb2ZmLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC93bmR3LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC93bmR3LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93
bmR3LmMKaW5kZXggMjgzZmY2OTAzNTBlYS4uNTAzMDNlYzE5NGJiYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYwpAQCAtMzIwLDcgKzMyMCw5IEBAIG52NTBfd25kd19h
dG9taWNfY2hlY2tfbHV0KHN0cnVjdCBudjUwX3duZHcgKnduZHcsCiAJCWFzeWgtPnduZHcub2x1
dCAmPSB+QklUKHduZHctPmlkKTsKIAl9CiAKLQlpZiAoIWlsdXQgJiYgd25kdy0+ZnVuYy0+aWx1
dF9pZGVudGl0eSkgeworCWlmICghaWx1dCAmJiB3bmR3LT5mdW5jLT5pbHV0X2lkZW50aXR5ICYm
CisJICAgIGFzeXctPnN0YXRlLmZiLT5mb3JtYXQtPmZvcm1hdCAhPSBEUk1fRk9STUFUX1hCR1Ix
NjE2MTYxNkYgJiYKKwkgICAgYXN5dy0+c3RhdGUuZmItPmZvcm1hdC0+Zm9ybWF0ICE9IERSTV9G
T1JNQVRfQUJHUjE2MTYxNjE2RikgewogCQlzdGF0aWMgc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9i
IGR1bW15ID0ge307CiAJCWlsdXQgPSAmZHVtbXk7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
