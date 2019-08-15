Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C958E70D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F196E930;
	Thu, 15 Aug 2019 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC126E87B;
 Thu, 15 Aug 2019 00:49:12 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 7006E3E998;
 Thu, 15 Aug 2019 00:49:11 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 01/11] dt-bindings: drm/bridge: analogix-anx78xx: add new
 variants
Date: Wed, 14 Aug 2019 20:48:44 -0400
Message-Id: <20190815004854.19860-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830152;
 bh=onikNoreFBf7Lir0NTdw9PrR2YRnHxeCYQkeZbJ3YvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KSVmUNaF+Q0K6DwjQyjqoeBvOn/EcvL1UgZjHTVMHSqL77RES/N9Fzns/3ZaSBAka
 1oJVk0pjCCNXe/yEt7U5E2IviJzpSqcT64KjnIKFDfDN2DRWKC++aqaxd9oZv0ipmF
 JbeS94gZj7/gRoZF8kun4tUDaM/udwWxjGLuyn1E=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBhbmFsb2dpeCxhbng3ODA4LCBhbmFsb2dpeCxhbng3ODEyLCBh
bmQKYW5hbG9naXgsYW54NzgxOCB2YXJpYW50cy4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25l
eSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2FueDc4MTQudHh0ICAgICAgICAgIHwgNiArKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzgxNC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzgxNC50
eHQKaW5kZXggZGJkN2M4NGVlNTg0Li4xNzI1ODc0N2ZmZjYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3ODE0LnR4dAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54Nzgx
NC50eHQKQEAgLTYsNyArNiwxMSBAQCBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlcy4KIAog
UmVxdWlyZWQgcHJvcGVydGllczoKIAotIC0gY29tcGF0aWJsZQkJOiAiYW5hbG9naXgsYW54Nzgx
NCIKKyAtIGNvbXBhdGlibGUJCTogTXVzdCBiZSBvbmUgb2Y6CisJCQkgICJhbmFsb2dpeCxhbng3
ODA4IgorCQkJICAiYW5hbG9naXgsYW54NzgxMiIKKwkJCSAgImFuYWxvZ2l4LGFueDc4MTQiCisJ
CQkgICJhbmFsb2dpeCxhbng3ODE4IgogIC0gcmVnCQkJOiBJMkMgYWRkcmVzcyBvZiB0aGUgZGV2
aWNlCiAgLSBpbnRlcnJ1cHRzCQk6IFNob3VsZCBjb250YWluIHRoZSBJTlRQIGludGVycnVwdAog
IC0gaHBkLWdwaW9zCQk6IFdoaWNoIEdQSU8gdG8gdXNlIGZvciBocGQKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
