Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A376D9E4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F66E4DD;
	Fri, 19 Jul 2019 03:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319176E4D7;
 Fri, 19 Jul 2019 03:58:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20E5021850;
 Fri, 19 Jul 2019 03:58:48 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 055/171] drm/amd/display: set
 link->dongle_max_pix_clk to 0 on a disconnect
Date: Thu, 18 Jul 2019 23:54:46 -0400
Message-Id: <20190719035643.14300-55-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508729;
 bh=iBNWIBHZgGTe5Q+jdZRd+ngLa9VpaLIgZwj92vwqXyE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kxorIxo+cqLMrPMWZfPF0TxLhvDMEk/xqLJascO2VQRbtzGGqvy0lMKuVHaWFSqhJ
 KkIxN3PI5Ku7e2BTu6v7auoQ2/3kDSqZ/sqfRqtN2LvuOWIUywCbFwbqsOalQhz68v
 /8z2Yoo2O88Dq1MCSmWYPDRuSi09ECn708NHOx9s=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Samson Tam <Samson.Tam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MjMzZDg3YTU3OWI4YWRjYzZkYTU4MjNmYTUwN2VjYjY2NzVlNzU2MiBdCgpbV2h5XQpGb3VuZCBp
c3N1ZSBpbiBFRElEIEVtdWxhdGlvbiB3aGVyZSBpZiB3ZSBjb25uZWN0IGEgZGlzcGxheSB1c2lu
ZwogYSBwYXNzaXZlIEhETUktRFAgZG9uZ2xlLCBkaXNjb25uZWN0IGl0IGFuZCB0aGVuIHRyeSB0
byBlbXVsYXRlCiBhIGRpc3BsYXkgdXNpbmcgRFAsIHdlIGNvdWxkIG5vdCBzZWUgNEsgbW9kZXMu
ICBUaGlzIHdhcyBiZWNhdXNlCiBvbiBhIGRpc2Nvbm5lY3QsIGRvbmdsZV9tYXhfcGl4X2NsayB3
YXMgc3RpbGwgc2V0IHNvIHdoZW4gd2UKIGVtdWxhdGUgdXNpbmcgRFAsIGluIGRjX2xpbmtfdmFs
aWRhdGVfbW9kZV90aW1pbmcoKSwgaXQgd291bGQKIHRoaW5rIHdlIHdlcmUgc3RpbGwgdXNpbmcg
YSBkb25nbGUgYW5kIGxpbWl0IHRoZSBtb2RlcyB3ZSBzdXBwb3J0LgoKW0hvd10KSW4gZGNfbGlu
a19kZXRlY3QoKSwgc2V0IGRvbmdsZV9tYXhfcGl4X2NsayB0byAwIHdoZW4gd2UgZGV0ZWN0CiBh
IGhvdHBsdWcgb3V0ICggaWYgbmV3X2Nvbm5lY3Rpb25fdHlwZSA9IGRjX2Nvbm5lY3Rpb25fbm9u
ZSApLgoKU2lnbmVkLW9mZi1ieTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2
aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmsuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
bGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmlu
ZGV4IGIzN2VjYzNlZGU2MS4uYTNmZjMzZmY2ZGExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC05NjAsNiArOTYwLDEyIEBAIGJvb2wgZGNf
bGlua19kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxpbmssIGVudW0gZGNfZGV0ZWN0X3JlYXNvbiBy
ZWFzb24pCiAKIAkJbGluay0+dHlwZSA9IGRjX2Nvbm5lY3Rpb25fbm9uZTsKIAkJc2lua19jYXBz
LnNpZ25hbCA9IFNJR05BTF9UWVBFX05PTkU7CisJCS8qIFdoZW4gd2UgdW5wbHVnIGEgcGFzc2l2
ZSBEUC1IRE1JIGRvbmdsZSBjb25uZWN0aW9uLCBkb25nbGVfbWF4X3BpeF9jbGsKKwkJICogIGlz
IG5vdCBjbGVhcmVkLiBJZiB3ZSBlbXVsYXRlIGEgRFAgc2lnbmFsIG9uIHRoaXMgY29ubmVjdGlv
biwgaXQgdGhpbmtzCisJCSAqICB0aGUgZG9uZ2xlIGlzIHN0aWxsIHRoZXJlIGFuZCBsaW1pdHMg
dGhlIG51bWJlciBvZiBtb2RlcyB3ZSBjYW4gZW11bGF0ZS4KKwkJICogIENsZWFyIGRvbmdsZV9t
YXhfcGl4X2NsayBvbiBkaXNjb25uZWN0IHRvIGZpeCB0aGlzCisJCSAqLworCQlsaW5rLT5kb25n
bGVfbWF4X3BpeF9jbGsgPSAwOwogCX0KIAogCUxJTktfSU5GTygibGluaz0lZCwgZGNfc2lua19p
bj0lcCBpcyBub3cgJXMgcHJldl9zaW5rPSVwIGRwY2Qgc2FtZT0lZCBlZGlkIHNhbWU9JWRcbiIs
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
