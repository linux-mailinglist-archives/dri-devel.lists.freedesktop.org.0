Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC57112418
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 09:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0B6F447;
	Wed,  4 Dec 2019 08:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8946EA60
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 06:02:26 +0000 (UTC)
Received: from localhost.localdomain ([90.126.97.183]) by mwinf5d51 with ME
 id Zi2M2100G3xPcdm03i2NAd; Wed, 04 Dec 2019 07:02:24 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 04 Dec 2019 07:02:24 +0100
X-ME-IP: 90.126.97.183
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jcrouse@codeaurora.org, dianders@chromium.org, mamtashukla555@gmail.com
Subject: [PATCH] drm/msm/a6xx: Fix a typo in an error message
Date: Wed,  4 Dec 2019 07:02:20 +0100
Message-Id: <20191204060220.12563-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Dec 2019 08:01:16 +0000
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J2luJyBpcyBkdXBsaWNhdGVkIGluIHRoZSBlcnJvciBtZXNzYWdlLiBBeGUgb25lIG9mIHRoZW0u
CldoaWxlIGF0IGl0LCBzbGlnaGx5IGltcHJvdmUgaW5kZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ211LmMKaW5kZXggODVmMTRmZWFmZGVjLi5kMDRlNjMxYWIzZGMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwpAQCAtMTA1MSw4ICsxMDUxLDggQEAgc3Rh
dGljIGludCBhNnh4X2dtdV9ycG1oX2FyY192b3Rlc19pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwg
dTMyICp2b3RlcywKIAogCQlpZiAoaiA9PSBwcmlfY291bnQpIHsKIAkJCURSTV9ERVZfRVJST1Io
ZGV2LAotCQkJCSJMZXZlbCAldSBub3QgZm91bmQgaW4gaW4gdGhlIFJQTWggbGlzdFxuIiwKLQkJ
CQkJbGV2ZWwpOworCQkJCSAgICAgICJMZXZlbCAldSBub3QgZm91bmQgaW4gdGhlIFJQTWggbGlz
dFxuIiwKKwkJCQkgICAgICBsZXZlbCk7CiAJCQlEUk1fREVWX0VSUk9SKGRldiwgIkF2YWlsYWJs
ZSBsZXZlbHM6XG4iKTsKIAkJCWZvciAoaiA9IDA7IGogPCBwcmlfY291bnQ7IGorKykKIAkJCQlE
Uk1fREVWX0VSUk9SKGRldiwgIiAgJXVcbiIsIHByaVtqXSk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
