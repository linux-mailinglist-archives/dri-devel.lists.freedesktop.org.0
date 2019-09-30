Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A375C297C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 00:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FBC6E316;
	Mon, 30 Sep 2019 22:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2406E316
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 22:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id BE02D283C0F
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/5] Revert "drm/rockchip: Use
 drm_atomic_helper_commit_tail_rpm"
Date: Mon, 30 Sep 2019 19:27:58 -0300
Message-Id: <20190930222802.32088-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190930222802.32088-1-ezequiel@collabora.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBjODdmYjM4ZGYxOWRhMzM2MmEwZTIwZGYxYWFkODUyMTAwOTk1
ZWFkLAp3aGljaCBjb25mbGljdHMgd2l0aCBhZGRpbmcgZHJpdmVyLXNwZWNpZmljIGJlaGF2aW9y
IGluCmF0b21pY19jb21taXRfdGFpbCgpLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGV4cGVjdGVk
IG9uIHRoaXMgY29tbWl0LCBidXQganVzdCBwcmVwYXJhdGlvbgpmb3IgdGhlIHVwY29taW5nIGdh
bW1hIExVVCBzdXBwb3J0LgoKQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpTaWduZWQt
b2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Ci0tLQpDaGFu
Z2VzIGZyb20gdjI6CiogTmV3IHBhdGNoLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fZmIuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKaW5kZXggY2EwMTIzNGMwMzdjLi5kYmEzNTJlYzBlZTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKQEAgLTEwNSw4
ICsxMDUsMjcgQEAgcm9ja2NoaXBfdXNlcl9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAJcmV0dXJuIEVSUl9QVFIocmV0KTsKIH0K
IAorc3RhdGljIHZvaWQKK3JvY2tjaGlwX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWxfcnBtKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUpCit7CisJc3RydWN0IGRybV9kZXZpY2Ug
KmRldiA9IG9sZF9zdGF0ZS0+ZGV2OworCisJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVz
ZXRfZGlzYWJsZXMoZGV2LCBvbGRfc3RhdGUpOworCisJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0
X21vZGVzZXRfZW5hYmxlcyhkZXYsIG9sZF9zdGF0ZSk7CisKKwlkcm1fYXRvbWljX2hlbHBlcl9j
b21taXRfcGxhbmVzKGRldiwgb2xkX3N0YXRlLAorCQkJCQlEUk1fUExBTkVfQ09NTUlUX0FDVElW
RV9PTkxZKTsKKworCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9od19kb25lKG9sZF9zdGF0ZSk7
CisKKwlkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzKGRldiwgb2xkX3N0YXRlKTsK
KworCWRybV9hdG9taWNfaGVscGVyX2NsZWFudXBfcGxhbmVzKGRldiwgb2xkX3N0YXRlKTsKK30K
Kwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzIHJvY2tj
aGlwX21vZGVfY29uZmlnX2hlbHBlcnMgPSB7Ci0JLmF0b21pY19jb21taXRfdGFpbCA9IGRybV9h
dG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSwKKwkuYXRvbWljX2NvbW1pdF90YWlsID0gcm9j
a2NoaXBfYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0sCiB9OwogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyByb2NrY2hpcF9kcm1fbW9kZV9jb25maWdfZnVu
Y3MgPSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
