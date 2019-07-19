Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A06D9C8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5D66E4C9;
	Fri, 19 Jul 2019 03:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226486E4C2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:58:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D51721855;
 Fri, 19 Jul 2019 03:58:20 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 040/171] gpu: host1x: Increase maximum DMA segment
 size
Date: Thu, 18 Jul 2019 23:54:31 -0400
Message-Id: <20190719035643.14300-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508701;
 bh=A8V1gvm+yaht1CTUyJ/J+QZqRvGR/yXURvSy6UwnNUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VlaiSkmGPPBkB1SzAYxXkk6pDs/G0SZZXYxPab2j1TSRBEI01Q1eSH0Fv1mvqSAX5
 y8Gfamd5N3cRDIE3TDxs7WdRz8kA0zCpR//MNxuNGVDAIUp9XmwfsaoccTpDahRNz8
 KpKPj3cq8FVTB/E041J8sd0ONAqQP/vQT0TUZoDM=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDFlMzkwNDc4Y2ZiNTI3ZTM0YzlhYjg5YmE1NzIxMmNiMDVjMzNjNTEgXQoKUmVjZW50IHZl
cnNpb25zIG9mIHRoZSBETUEgQVBJIGRlYnVnIGNvZGUgaGF2ZSBzdGFydGVkIHRvIHdhcm4gYWJv
dXQKdmlvbGF0aW9ucyBvZiB0aGUgbWF4aW11bSBETUEgc2VnbWVudCBzaXplLiBUaGlzIGlzIGJl
Y2F1c2UgdGhlIHNlZ21lbnQKc2l6ZSBkZWZhdWx0cyB0byA2NCBLaUIsIHdoaWNoIGNhbiBlYXNp
bHkgYmUgZXhjZWVkZWQgaW4gbGFyZ2UgYnVmZmVyCmFsbG9jYXRpb25zIHN1Y2ggYXMgdXNlZCBp
biBEUk0vS01TIGZvciBmcmFtZWJ1ZmZlcnMuCgpUZWNobmljYWxseSB0aGUgVGVncmEgU01NVSBh
bmQgQVJNIFNNTVUgZG9uJ3QgaGF2ZSBhIG1heGltdW0gc2VnbWVudApzaXplICh0aGV5IG1hcCBp
bmRpdmlkdWFsIHBhZ2VzIGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIHRoZXkgYXJlCmNvbnRpZ3Vv
dXMgb3Igbm90KSwgc28gdGhlIGNob2ljZSBvZiA0IE1pQiBpcyBhIGJpdCBhcmJpdHJhcnkgaGVy
ZS4gVGhlCm1heGltdW0gc2VnbWVudCBzaXplIGlzIGEgMzItYml0IHVuc2lnbmVkIGludGVnZXIs
IHRob3VnaCwgc28gd2UgY2FuJ3QKc2V0IGl0IHRvIHRoZSBjb3JyZWN0IG1heGltdW0gc2l6ZSwg
d2hpY2ggd291bGQgYmUgdGhlIHNpemUgb2YgdGhlCmFwZXJ0dXJlLgoKU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEg
TGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYyB8
IDMgKysrCiBpbmNsdWRlL2xpbnV4L2hvc3QxeC5oICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYyBi
L2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwppbmRleCA5Nzk3Y2NiMGEwNzMuLjYzODczMDJjMTI0
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2hvc3QxeC9idXMuYwpAQCAtNDE0LDYgKzQxNCw5IEBAIHN0YXRpYyBpbnQgaG9zdDF4X2Rldmlj
ZV9hZGQoc3RydWN0IGhvc3QxeCAqaG9zdDF4LAogCiAJb2ZfZG1hX2NvbmZpZ3VyZSgmZGV2aWNl
LT5kZXYsIGhvc3QxeC0+ZGV2LT5vZl9ub2RlLCB0cnVlKTsKIAorCWRldmljZS0+ZGV2LmRtYV9w
YXJtcyA9ICZkZXZpY2UtPmRtYV9wYXJtczsKKwlkbWFfc2V0X21heF9zZWdfc2l6ZSgmZGV2aWNl
LT5kZXYsIFNaXzRNKTsKKwogCWVyciA9IGhvc3QxeF9kZXZpY2VfcGFyc2VfZHQoZGV2aWNlLCBk
cml2ZXIpOwogCWlmIChlcnIgPCAwKSB7CiAJCWtmcmVlKGRldmljZSk7CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2hvc3QxeC5oIGIvaW5jbHVkZS9saW51eC9ob3N0MXguaAppbmRleCBjZmZm
MzBiOWE2MmUuLmU2ZWVhNDVlMTE1NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ob3N0MXgu
aAorKysgYi9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oCkBAIC0yOTcsNiArMjk3LDggQEAgc3RydWN0
IGhvc3QxeF9kZXZpY2UgewogCXN0cnVjdCBsaXN0X2hlYWQgY2xpZW50czsKIAogCWJvb2wgcmVn
aXN0ZXJlZDsKKworCXN0cnVjdCBkZXZpY2VfZG1hX3BhcmFtZXRlcnMgZG1hX3Bhcm1zOwogfTsK
IAogc3RhdGljIGlubGluZSBzdHJ1Y3QgaG9zdDF4X2RldmljZSAqdG9faG9zdDF4X2RldmljZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
