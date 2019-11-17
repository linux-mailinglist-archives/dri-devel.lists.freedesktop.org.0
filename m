Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF6100076
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8596E08E;
	Mon, 18 Nov 2019 08:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68376E44B;
 Sun, 17 Nov 2019 11:48:41 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id DAA034FE4B;
 Sun, 17 Nov 2019 11:48:40 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH 4/4] drm/msm/a4xx: set interconnect bandwidth vote
Date: Sun, 17 Nov 2019 06:48:25 -0500
Message-Id: <20191117114825.13541-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117114825.13541-1-masneyb@onstation.org>
References: <20191117114825.13541-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1573991321;
 bh=rl6/6/Eu9skt4+IcmxvISu1bBxwQsQboq/5RVDZniic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=le+c7mmslEwZqMNGy37bnORfMaWTTpxN3JKvaDGIwpg++SdQqlGzGx3oBKuw7DZz+
 U9wXQ6h///rjUt9SzUsCQKrvmoPemstl+qpSVk3E+51jYjuzN75M4CqfAkfVpH/rSc
 kk3vlXgixVujTB906XcAlQFL4QAVtsoCcOZzTJVU=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSB0d28gaW50ZXJjb25uZWN0IHBhdGhzIGZvciB0aGUgR1BVIHRvIG1heGltdW0gc3Bl
ZWQgZm9yIG5vdyB0bwp3b3JrIHRvd2FyZHMgZ2V0dGluZyB0aGUgR1BVIHdvcmtpbmcgdXBzdHJl
YW0uIFdlIGNhbiByZXZpc2l0IGEgbGF0ZXIKdGltZSB0byBvcHRpbWl6ZSB0aGlzIGZvciBiYXR0
ZXJ5IGxpZmUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9u
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hNHh4X2dwdS5jCmluZGV4IGIwMTM4OGE5ZTg5ZS4uYzYzMWQxZGY3NzUxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmMKQEAgLTU5MSw2ICs1OTEsMTQgQEAgc3RydWN0
IG1zbV9ncHUgKmE0eHhfZ3B1X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAkJZ290byBm
YWlsOwogCX0KIAorCS8qCisJICogU2V0IHRoZSBJQ0MgcGF0aCB0byBtYXhpbXVtIHNwZWVkIGZv
ciBub3cgYnkgbXVsdGlwbHlpbmcgdGhlIGZhc3Rlc3QKKwkgKiBmcmVxdWVuY3kgYnkgdGhlIGJ1
cyB3aWR0aCAoOCkuIFdlJ2xsIHdhbnQgdG8gc2NhbGUgdGhpcyBsYXRlciBvbiB0bworCSAqIGlt
cHJvdmUgYmF0dGVyeSBsaWZlLgorCSAqLworCWljY19zZXRfYncoZ3B1LT5nZnhfbWVtX2ljY19w
YXRoLCAwLCBCcHNfdG9faWNjKGdwdS0+ZmFzdF9yYXRlKSAqIDgpOworCWljY19zZXRfYncoZ3B1
LT5vY21lbV9pY2NfcGF0aCwgMCwgQnBzX3RvX2ljYyhncHUtPmZhc3RfcmF0ZSkgKiA4KTsKKwog
CXJldHVybiBncHU7CiAKIGZhaWw6Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
