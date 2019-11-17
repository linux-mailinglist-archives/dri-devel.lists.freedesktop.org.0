Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874B10007E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20A36E124;
	Mon, 18 Nov 2019 08:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4EB6E44B;
 Sun, 17 Nov 2019 11:48:41 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 732904FE48;
 Sun, 17 Nov 2019 11:48:40 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH 3/4] drm/msm/a3xx: set interconnect bandwidth vote
Date: Sun, 17 Nov 2019 06:48:24 -0500
Message-Id: <20191117114825.13541-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117114825.13541-1-masneyb@onstation.org>
References: <20191117114825.13541-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1573991320;
 bh=AlmPAqPjvG4vGWI6p1bAhmNBHO+jGQx8VZpPX/vqxuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H43lHXS1UFIbBeotSBxt/QR4nMSkM4lVufpArr13f0CEAkZ7d16ernWuEibFq90I5
 D/VbGk6CHA6pC2nhQMOS5DZ9AahOPB4AV9QMZU/F9+LIeGH6pdyRAG2xHfyurK7fPL
 F2ppR8Ok68YxcdEpJ75EhAifc7zONesLHRRJGTis=
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
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hM3h4X2dwdS5jCmluZGV4IDA3ZGRjYzUyOTU3My4uZjA1YWRmOWJjNzUyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMKQEAgLTUwNCw2ICs1MDQsMTQgQEAgc3RydWN0
IG1zbV9ncHUgKmEzeHhfZ3B1X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAkJRFJNX0RF
Vl9FUlJPUihkZXYtPmRldiwgIk5vIG1lbW9yeSBwcm90ZWN0aW9uIHdpdGhvdXQgSU9NTVVcbiIp
OwogCX0KIAorCS8qCisJICogU2V0IHRoZSBJQ0MgcGF0aCB0byBtYXhpbXVtIHNwZWVkIGZvciBu
b3cgYnkgbXVsdGlwbHlpbmcgdGhlIGZhc3Rlc3QKKwkgKiBmcmVxdWVuY3kgYnkgdGhlIGJ1cyB3
aWR0aCAoOCkuIFdlJ2xsIHdhbnQgdG8gc2NhbGUgdGhpcyBsYXRlciBvbiB0bworCSAqIGltcHJv
dmUgYmF0dGVyeSBsaWZlLgorCSAqLworCWljY19zZXRfYncoZ3B1LT5nZnhfbWVtX2ljY19wYXRo
LCAwLCBCcHNfdG9faWNjKGdwdS0+ZmFzdF9yYXRlKSAqIDgpOworCWljY19zZXRfYncoZ3B1LT5v
Y21lbV9pY2NfcGF0aCwgMCwgQnBzX3RvX2ljYyhncHUtPmZhc3RfcmF0ZSkgKiA4KTsKKwogCXJl
dHVybiBncHU7CiAKIGZhaWw6Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
