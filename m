Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B030FC129
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D696E2D1;
	Thu, 14 Nov 2019 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6575C6ED6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31380894"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:11 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id C4296400ED5C;
 Thu, 14 Nov 2019 00:52:06 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
Date: Wed, 13 Nov 2019 15:51:25 +0000
Message-Id: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRyYW5zcGFyZW50IExWRFMgZGVjb2RlcnMgYnkgYWRkaW5nIGEgbmV3
CmNvbXBhdGlibGUgc3RyaW5nICgibHZkcy1kZWNvZGVyIikgdG8gdGhlIGRyaXZlci4KVGhpcyBw
YXRjaCBhbHNvIGFkZHMgbWVtYmVyIGNvbm5lY3Rvcl90eXBlIHRvIHN0cnVjdCBsdmRzX2NvZGVj
LAphbmQgdGhhdCdzIGJlY2F1c2UgTFZEUyBkZWNvZGVycyBoYXZlIGEgZGlmZmVyZW50IGNvbm5l
Y3RvciB0eXBlCmZyb20gTFZEUyBlbmNvZGVycy4gV2UgZmlsbCB0aGlzIG5ldyBtZW1iZXIgdXAg
d2l0aCB0aGUgZGF0YQptYXRjaGluZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCgpTaWduZWQtb2Zm
LWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0t
LQp2My0+djQ6CiogTmV3IHBhdGNoCi0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNv
ZGVjLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2x2ZHMtY29kZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCmlu
ZGV4IGI1ODAxYTIuLmMzMmUxMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bHZkcy1jb2RlYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCkBA
IC03LDYgKzcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4
L29mX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAKQEAgLTE3LDYgKzE4LDcgQEAgc3RydWN0IGx2ZHNfY29k
ZWMgewogCXN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqcGFu
ZWxfYnJpZGdlOwogCXN0cnVjdCBncGlvX2Rlc2MgKnBvd2VyZG93bl9ncGlvOworCXUzMiBjb25u
ZWN0b3JfdHlwZTsKIH07CiAKIHN0YXRpYyBpbnQgbHZkc19jb2RlY19hdHRhY2goc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKQEAgLTY1LDYgKzY3LDcgQEAgc3RhdGljIGludCBsdmRzX2NvZGVj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKCFsdmRzX2NvZGVjKQog
CQlyZXR1cm4gLUVOT01FTTsKIAorCWx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHUzMilv
Zl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7CiAJbHZkc19jb2RlYy0+cG93ZXJk
b3duX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJwb3dlcmRvd24iLAogCQkJ
CQkJCSAgICAgR1BJT0RfT1VUX0hJR0gpOwogCWlmIChJU19FUlIobHZkc19jb2RlYy0+cG93ZXJk
b3duX2dwaW8pKSB7CkBAIC0xMDUsNyArMTA4LDcgQEAgc3RhdGljIGludCBsdmRzX2NvZGVjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlsdmRzX2NvZGVjLT5wYW5lbF9i
cmlkZ2UgPQogCQlkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkX3R5cGVkKGRldiwgcGFuZWwsCi0J
CQkJCQlEUk1fTU9ERV9DT05ORUNUT1JfTFZEUyk7CisJCQkJCQlsdmRzX2NvZGVjLT5jb25uZWN0
b3JfdHlwZSk7CiAJaWYgKElTX0VSUihsdmRzX2NvZGVjLT5wYW5lbF9icmlkZ2UpKQogCQlyZXR1
cm4gUFRSX0VSUihsdmRzX2NvZGVjLT5wYW5lbF9icmlkZ2UpOwogCkBAIC0xMzMsOCArMTM2LDE4
IEBAIHN0YXRpYyBpbnQgbHZkc19jb2RlY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHZkc19jb2RlY19t
YXRjaFtdID0gewotCXsgLmNvbXBhdGlibGUgPSAibHZkcy1lbmNvZGVyIiB9LAotCXsgLmNvbXBh
dGlibGUgPSAidGhpbmUsdGhjNjNsdmRtODNkIiB9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAibHZk
cy1kZWNvZGVyIiwKKwkJLmRhdGEgPSAodm9pZCAqKURSTV9NT0RFX0NPTk5FQ1RPUl9EUEksCisJ
fSwKKwl7CisJCS5jb21wYXRpYmxlID0gImx2ZHMtZW5jb2RlciIsCisJCS5kYXRhID0gKHZvaWQg
KilEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywKKwl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAidGhp
bmUsdGhjNjNsdmRtODNkIiwKKwkJLmRhdGEgPSAodm9pZCAqKURSTV9NT0RFX0NPTk5FQ1RPUl9M
VkRTLAorCX0sCiAJe30sCiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbHZkc19jb2RlY19t
YXRjaCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
