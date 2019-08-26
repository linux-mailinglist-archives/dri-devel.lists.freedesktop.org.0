Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB679D2AE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9F26E235;
	Mon, 26 Aug 2019 15:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A076E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 40FD428BD9F;
 Mon, 26 Aug 2019 16:27:07 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/21] drm/bridge: panel: Propage bus format/flags
Date: Mon, 26 Aug 2019 17:26:47 +0200
Message-Id: <20190826152649.13820-20-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826152649.13820-1-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhhdCB0aGUgcHJldmlvdXMgYnJpZGdlIGVsZW1lbnQgaW4gdGhlIGNoYWluIGtub3dzIHdo
aWNoIGlucHV0CmZvcm1hdCB0aGUgcGFuZWwgYnJpZGdlIGV4cGVjdHMuCgpTaWduZWQtb2ZmLWJ5
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgotLS0KTGF1
cmVudCwKCkkgaW50ZW50aW9uYWxseSBsZWZ0IHlvdXIgY29tbWVudHMgdW5hZGRyZXNzZWQgaW4g
dGhpcyBwYXRjaCBhcyBJJ20KbW9yZSBpbnRlcmVzdGVkIGluIGRpc2N1c3NpbmcgdGhlIHByZXBh
cmF0aW9uIHBhdGNoZXMuIE9uY2Ugd2UndmUKc2V0dGxlZCBvbiBzb21ldGhpbmcgcmVnYXJkaW5n
IHRoZSBidXMtZm9ybWF0IG5lZ290aWF0aW9uIHN0dWZmIEknbGwKcmV3b3JrIHRoZSBiaW5kaW5n
L2RyaXZlciB0byBzdXBwb3J0IHRoZSBkYXRhLW1hcHBpbmcgRFQgcHJvcC4KClJlZ2FyZHMsCgpC
b3JpcwoKQ2hhbmdlcyBpbiB2MjoKKiBBZGp1c3QgdGhpbmdzIHRvIG1hdGNoIHRoZSBuZXcgYnVz
LWZvcm1hdCBuZWdvdGlhdGlvbiBhcHByb2FjaAotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
cGFuZWwuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKaW5kZXggNmNmZmViNGE0
MmYyLi4zZWViNDBkMzdhODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFu
ZWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKQEAgLTEyMCw2ICsxMjAs
MzQgQEAgc3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlKQogCWRybV9wYW5lbF91bnByZXBhcmUocGFuZWxfYnJpZGdlLT5wYW5lbCk7
CiB9CiAKK3N0YXRpYyB2b2lkCitwYW5lbF9icmlkZ2VfYXRvbWljX2dldF9pbnB1dF9idXNfZm10
cyhzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAorCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2JyaWRn
ZV9zdGF0ZSAqYnJpZGdlX3N0YXRlLAorCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUsCisJCQkJICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25u
X3N0YXRlLAorCQkJCSAgICAgICB1MzIgb3V0cHV0X2ZtdCwKKwkJCQkgICAgICAgdW5zaWduZWQg
aW50ICpudW1faW5wdXRfZm10cywKKwkJCQkgICAgICAgdTMyICppbnB1dF9mbXRzKQoreworCSpu
dW1faW5wdXRfZm10cyA9IDE7CisJaWYgKCFpbnB1dF9mbXRzKQorCQlyZXR1cm47CisKKwlpbnB1
dF9mbXRzWzBdID0gb3V0cHV0X2ZtdDsKK30KKworc3RhdGljIGludCBwYW5lbF9icmlkZ2VfYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCisJCQkJICAgICBzdHJ1Y3QgZHJt
X2JyaWRnZV9zdGF0ZSAqYnJpZGdlX3N0YXRlLAorCQkJCSAgICAgc3RydWN0IGRybV9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlLAorCQkJCSAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNv
bm5fc3RhdGUpCit7CisJaWYgKGJyaWRnZV9zdGF0ZS0+aW5wdXRfYnVzX2NmZy5mbXQgIT0gYnJp
ZGdlX3N0YXRlLT5vdXRwdXRfYnVzX2NmZy5mbXQpCisJCXJldHVybiAtRUlOVkFMOworCisJYnJp
ZGdlX3N0YXRlLT5pbnB1dF9idXNfY2ZnLmZsYWdzID0gYnJpZGdlX3N0YXRlLT5vdXRwdXRfYnVz
X2NmZy5mbGFnczsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJp
ZGdlX2Z1bmNzIHBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3MgPSB7CiAJLmF0dGFjaCA9IHBhbmVs
X2JyaWRnZV9hdHRhY2gsCiAJLmRldGFjaCA9IHBhbmVsX2JyaWRnZV9kZXRhY2gsCkBAIC0xMjcs
NiArMTU1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHBhbmVsX2Jy
aWRnZV9icmlkZ2VfZnVuY3MgPSB7CiAJLmVuYWJsZSA9IHBhbmVsX2JyaWRnZV9lbmFibGUsCiAJ
LmRpc2FibGUgPSBwYW5lbF9icmlkZ2VfZGlzYWJsZSwKIAkucG9zdF9kaXNhYmxlID0gcGFuZWxf
YnJpZGdlX3Bvc3RfZGlzYWJsZSwKKwkuYXRvbWljX2NoZWNrID0gcGFuZWxfYnJpZGdlX2F0b21p
Y19jaGVjaywKKwkuYXRvbWljX2dldF9pbnB1dF9idXNfZm10cyA9IHBhbmVsX2JyaWRnZV9hdG9t
aWNfZ2V0X2lucHV0X2J1c19mbXRzLAogfTsKIAogLyoqCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
