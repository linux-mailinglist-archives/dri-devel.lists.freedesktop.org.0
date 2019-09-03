Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04032A6E2F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBF5895C1;
	Tue,  3 Sep 2019 16:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E74896AF;
 Tue,  3 Sep 2019 16:25:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB83123711;
 Tue,  3 Sep 2019 16:25:12 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 22/23] drm/i915: Add whitelist workarounds for ICL
Date: Tue,  3 Sep 2019 12:24:23 -0400
Message-Id: <20190903162424.6877-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162424.6877-1-sashal@kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527913;
 bh=24HeKgZc0EdrCzr8e/aVIGvdzcTwEfQ6sZ6O29G15NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=00WD3xG1HXVmfZCWpIRI6NgAfgxq9CJbQsZdJoQ2ElVDbFVR29qcqJ0ih4VGnjyHL
 sDwYBUdplNaVqHypg1Z4G1P5s1hPb9b7KAOo2fNL3b69A9W9YSBK2RkBK9To7U+q0N
 YKAzlj/q9qlnSU036H8BleVMdwSdt/1dvvepczcw=
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
Cc: Sasha Levin <sashal@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "Robert M . Fosha" <robert.m.fosha@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDdiM2Q0MDYzMTA5ODNhODllZDdhMWVjZGQxMTVlZmJlMTJiMGRlZDUgXQoKVXBk
YXRlZCB3aGl0ZWxpc3QgdGFibGUgZm9yIElDTC4KCnYyOiBSZWR1Y2UgY2hhbmdlcyB0byBqdXN0
IHRob3NlIHJlcXVpcmVkIGZvciBtZWRpYSBkcml2ZXIgdW50aWwKdGhlIHNlbGZ0ZXN0IGNhbiBi
ZSB1cGRhdGVkIHRvIHN1cHBvcnQgdGhlIG5ldyBmZWF0dXJlcyBvZiB0aGUKb3RoZXIgZW50cmll
cy4KClNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFJvYmVydCBNLiBGb3NoYSA8cm9iZXJ0Lm0uZm9zaGFAaW50ZWwu
Y29tPgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpSZXZpZXdlZC1ieTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE4MDEwMTA4LjI3NDk5LTQtSm9o
bi5DLkhhcnJpc29uQEludGVsLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfd29ya2Fyb3VuZHMu
YyB8IDM4ICsrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX3dvcmthcm91bmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3Jr
YXJvdW5kcy5jCmluZGV4IGJlMzY4ODkwOGYwY2UuLmVmZWE1YTE4ZmE2ZGIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3dvcmthcm91bmRzLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfd29ya2Fyb3VuZHMuYwpAQCAtMTA5NywxNyArMTA5NywzMyBAQCBz
dGF0aWMgdm9pZCBpY2xfd2hpdGVsaXN0X2J1aWxkKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVu
Z2luZSkKIHsKIAlzdHJ1Y3QgaTkxNV93YV9saXN0ICp3ID0gJmVuZ2luZS0+d2hpdGVsaXN0Owog
Ci0JaWYgKGVuZ2luZS0+Y2xhc3MgIT0gUkVOREVSX0NMQVNTKQotCQlyZXR1cm47Ci0KLQkvKiBX
YUFsbG93VU1EVG9Nb2RpZnlIYWxmU2xpY2VDaGlja2VuNzppY2wgKi8KLQl3aGl0ZWxpc3RfcmVn
KHcsIEdFTjlfSEFMRl9TTElDRV9DSElDS0VONyk7Ci0KLQkvKiBXYUFsbG93VU1EVG9Nb2RpZnlT
YW1wbGVyTW9kZTppY2wgKi8KLQl3aGl0ZWxpc3RfcmVnKHcsIEdFTjEwX1NBTVBMRVJfTU9ERSk7
Ci0KLQkvKiBXYUVuYWJsZVN0YXRlQ2FjaGVSZWRpcmVjdFRvQ1M6aWNsICovCi0Jd2hpdGVsaXN0
X3JlZyh3LCBHRU45X1NMSUNFX0NPTU1PTl9FQ09fQ0hJQ0tFTjEpOworCXN3aXRjaCAoZW5naW5l
LT5jbGFzcykgeworCWNhc2UgUkVOREVSX0NMQVNTOgorCQkvKiBXYUFsbG93VU1EVG9Nb2RpZnlI
YWxmU2xpY2VDaGlja2VuNzppY2wgKi8KKwkJd2hpdGVsaXN0X3JlZyh3LCBHRU45X0hBTEZfU0xJ
Q0VfQ0hJQ0tFTjcpOworCisJCS8qIFdhQWxsb3dVTURUb01vZGlmeVNhbXBsZXJNb2RlOmljbCAq
LworCQl3aGl0ZWxpc3RfcmVnKHcsIEdFTjEwX1NBTVBMRVJfTU9ERSk7CisKKwkJLyogV2FFbmFi
bGVTdGF0ZUNhY2hlUmVkaXJlY3RUb0NTOmljbCAqLworCQl3aGl0ZWxpc3RfcmVnKHcsIEdFTjlf
U0xJQ0VfQ09NTU9OX0VDT19DSElDS0VOMSk7CisJCWJyZWFrOworCisJY2FzZSBWSURFT19ERUNP
REVfQ0xBU1M6CisJCS8qIGh1Y1N0YXR1c1JlZ09mZnNldCAqLworCQl3aGl0ZWxpc3RfcmVnX2V4
dCh3LCBfTU1JTygweDIwMDAgKyBlbmdpbmUtPm1taW9fYmFzZSksCisJCQkJICBSSU5HX0ZPUkNF
X1RPX05PTlBSSVZfUkQpOworCQkvKiBodWNVS2VybmVsSGRySW5mb1JlZ09mZnNldCAqLworCQl3
aGl0ZWxpc3RfcmVnX2V4dCh3LCBfTU1JTygweDIwMTQgKyBlbmdpbmUtPm1taW9fYmFzZSksCisJ
CQkJICBSSU5HX0ZPUkNFX1RPX05PTlBSSVZfUkQpOworCQkvKiBodWNTdGF0dXMyUmVnT2Zmc2V0
ICovCisJCXdoaXRlbGlzdF9yZWdfZXh0KHcsIF9NTUlPKDB4MjNCMCArIGVuZ2luZS0+bW1pb19i
YXNlKSwKKwkJCQkgIFJJTkdfRk9SQ0VfVE9fTk9OUFJJVl9SRCk7CisJCWJyZWFrOworCisJZGVm
YXVsdDoKKwkJYnJlYWs7CisJfQogfQogCiB2b2lkIGludGVsX2VuZ2luZV9pbml0X3doaXRlbGlz
dChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
