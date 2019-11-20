Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9279104636
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 22:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E729A6EA4A;
	Wed, 20 Nov 2019 21:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EED6EA47
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by manjaro.org (Postfix) with ESMTP id 9393836CEEA8;
 Wed, 20 Nov 2019 22:35:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ph4jUNY91zd4; Wed, 20 Nov 2019 22:35:44 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/panel: simple: Add support for BOE NV140FHM-N49 panel
 to panel-simple
Date: Wed, 20 Nov 2019 22:34:40 +0100
Message-Id: <20191120213440.924563-2-t.schramm@manjaro.org>
In-Reply-To: <20191120213440.924563-1-t.schramm@manjaro.org>
References: <20191120213440.924563-1-t.schramm@manjaro.org>
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
Cc: linux-kernel@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBCT0UgTlYxNDBGSE0tTjQ5IHBhbmVsIHRv
IHRoZSBwYW5lbC1zaW1wbGUKZHJpdmVyLiBUaGUgcGFuZWwgaXMgdXNlZCBieSB0aGUgcGluZTY0
IFBpbmVib29rIFByby4KClNpZ25lZC1vZmYtYnk6IFRvYmlhcyBTY2hyYW1tIDx0LnNjaHJhbW1A
bWFuamFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNWQ0ODc2ODZk
MjVjLi42MzIwZGY5NzY1ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAg
LTEwMzYsNiArMTAzNiwzOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYm9lX252
MTAxd3htbjUxID0gewogCX0sCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgYm9lX252MTQwZmhtbjQ5X21vZGVzW10gPSB7CisJeworCQkuY2xvY2sgPSAxNDg1MDAs
CisJCS5oZGlzcGxheSA9IDE5MjAsCisJCS5oc3luY19zdGFydCA9IDE5MjAgKyA0OCwKKwkJLmhz
eW5jX2VuZCA9IDE5MjAgKyA0OCArIDMyLAorCQkuaHRvdGFsID0gMjIwMCwKKwkJLnZkaXNwbGF5
ID0gMTA4MCwKKwkJLnZzeW5jX3N0YXJ0ID0gMTA4MCArIDMsCisJCS52c3luY19lbmQgPSAxMDgw
ICsgMyArIDUsCisJCS52dG90YWwgPSAxMTI1LAorCQkudnJlZnJlc2ggPSA2MCwKKwl9LAorfTsK
Kworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGJvZV9udjE0MGZobW40OSA9IHsKKwku
bW9kZXMgPSBib2VfbnYxNDBmaG1uNDlfbW9kZXMsCisJLm51bV9tb2RlcyA9IEFSUkFZX1NJWkUo
Ym9lX252MTQwZmhtbjQ5X21vZGVzKSwKKwkuYnBjID0gNiwKKwkuc2l6ZSA9IHsKKwkJLndpZHRo
ID0gMzA5LAorCQkuaGVpZ2h0ID0gMTc0LAorCX0sCisJLmRlbGF5ID0geworCQkucHJlcGFyZSA9
IDIxMCwKKwkJLmVuYWJsZSA9IDUwLAorCQkudW5wcmVwYXJlID0gMTYwLAorCX0sCisJLmJ1c19m
b3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4LAorCS5jb25uZWN0b3JfdHlwZSA9IERS
TV9NT0RFX0NPTk5FQ1RPUl9lRFAsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgY2R0ZWNoX3MwNDN3cTI2aF9jdDdfbW9kZSA9IHsKIAkuY2xvY2sgPSA5MDAwLAog
CS5oZGlzcGxheSA9IDQ4MCwKQEAgLTMxNjEsNiArMzE5Myw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0
aWJsZSA9ICJib2UsbnYxMDF3eG1uNTEiLAogCQkuZGF0YSA9ICZib2VfbnYxMDF3eG1uNTEsCisJ
fSwgeworCQkuY29tcGF0aWJsZSA9ICJib2UsbnYxNDBmaG1uNDkiLAorCQkuZGF0YSA9ICZib2Vf
bnYxNDBmaG1uNDksCiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJjZHRlY2gsczA0M3dxMjZoLWN0
NyIsCiAJCS5kYXRhID0gJmNkdGVjaF9zMDQzd3EyNmhfY3Q3LAotLSAKMi4yNC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
