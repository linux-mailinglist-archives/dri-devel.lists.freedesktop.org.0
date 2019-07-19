Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7B6DB3F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7E6E532;
	Fri, 19 Jul 2019 04:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FDE6E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:08:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A69292187F;
 Fri, 19 Jul 2019 04:08:12 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 019/101] gpu: host1x: Increase maximum DMA
 segment size
Date: Fri, 19 Jul 2019 00:06:10 -0400
Message-Id: <20190719040732.17285-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509293;
 bh=lFA/SdWyKKC7pB2ExBe+FYfpD82/Opn5RKbuCTjsP9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OFgEi8Tfgk7JAeoETU5q3fud2EyJgMaA0alD7AEnMC7bY6IfUyCMQKJXMsVlORyUj
 znunWwd4TFETq1TTYXL8hwR7g/Py3hDlwtkkkcdN1fGYvmuGQ2O00wd3sC+nLeMr/O
 hv0u+GDtAa75WpXxKk5Kjy7EJyH2DJ5SA+1P28i4=
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
L2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwppbmRleCA4MTViZGI0MmUzZjAuLjAxMjFmZTdhNDU0
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2hvc3QxeC9idXMuYwpAQCAtNDIzLDYgKzQyMyw5IEBAIHN0YXRpYyBpbnQgaG9zdDF4X2Rldmlj
ZV9hZGQoc3RydWN0IGhvc3QxeCAqaG9zdDF4LAogCiAJb2ZfZG1hX2NvbmZpZ3VyZSgmZGV2aWNl
LT5kZXYsIGhvc3QxeC0+ZGV2LT5vZl9ub2RlLCB0cnVlKTsKIAorCWRldmljZS0+ZGV2LmRtYV9w
YXJtcyA9ICZkZXZpY2UtPmRtYV9wYXJtczsKKwlkbWFfc2V0X21heF9zZWdfc2l6ZSgmZGV2aWNl
LT5kZXYsIFNaXzRNKTsKKwogCWVyciA9IGhvc3QxeF9kZXZpY2VfcGFyc2VfZHQoZGV2aWNlLCBk
cml2ZXIpOwogCWlmIChlcnIgPCAwKSB7CiAJCWtmcmVlKGRldmljZSk7CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2hvc3QxeC5oIGIvaW5jbHVkZS9saW51eC9ob3N0MXguaAppbmRleCA4OTEx
MGQ4OTZkNzIuLmFlZjZlMmY3MzgwMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ob3N0MXgu
aAorKysgYi9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oCkBAIC0zMTAsNiArMzEwLDggQEAgc3RydWN0
IGhvc3QxeF9kZXZpY2UgewogCXN0cnVjdCBsaXN0X2hlYWQgY2xpZW50czsKIAogCWJvb2wgcmVn
aXN0ZXJlZDsKKworCXN0cnVjdCBkZXZpY2VfZG1hX3BhcmFtZXRlcnMgZG1hX3Bhcm1zOwogfTsK
IAogc3RhdGljIGlubGluZSBzdHJ1Y3QgaG9zdDF4X2RldmljZSAqdG9faG9zdDF4X2RldmljZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
