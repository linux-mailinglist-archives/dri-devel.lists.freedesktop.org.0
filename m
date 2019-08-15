Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C358E70F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0949D6E945;
	Thu, 15 Aug 2019 08:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D356E87B;
 Thu, 15 Aug 2019 00:49:13 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 1F73C3E9DE;
 Thu, 15 Aug 2019 00:49:12 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 02/11] drm/bridge: analogix-anx78xx: add new variants
Date: Wed, 14 Aug 2019 20:48:45 -0400
Message-Id: <20190815004854.19860-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830152;
 bh=kd0RcC8EypG7pu0fFFwfrtGaJLMU4ZBdU98OJAZs4wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zyr/OmmFc1pFqaN7q1uS3WkW7lsWqpU0xv5LyXFy4NGocFyuwV0Cz/JWVi7tQxsAj
 rw+LjB0NmAWn5XnoC4egZzqXVUHMH4ArPs5aOJBFQ0HO65BMLTuxR6o73aNOdzFJZZ
 ZOVLfYqsyC+2nMJ2TosUl5r0beffcAFXtHU58h/E=
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

QWRkIHN1cHBvcnQgZm9yIHRoZSA3ODA4IHZhcmlhbnQuIFdoaWxlIHdlJ3JlIGhlcmUsIHRoZSBv
ZiBtYXRjaCB0YWJsZQp3YXMgbWlzc2luZyBzdXBwb3J0IGZvciB0aGUgNzgxMiBhbmQgNzgxOCB2
YXJpYW50cywgc28gYWRkIHRoZW0gYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25l
eSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgtYW54Nzh4eC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwppbmRleCAzYzdjYzVh
ZjczNWMuLjlhY2RiZWRmMTI0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC1hbng3OHh4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1h
bng3OHh4LmMKQEAgLTEzMDEsNiArMTMwMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFw
X2NvbmZpZyBhbng3OHh4X3JlZ21hcF9jb25maWcgPSB7CiB9OwogCiBzdGF0aWMgY29uc3QgdTE2
IGFueDc4eHhfY2hpcGlkX2xpc3RbXSA9IHsKKwkweDc4MDgsCiAJMHg3ODEyLAogCTB4NzgxNCwK
IAkweDc4MTgsCkBAIC0xNDYzLDcgKzE0NjQsMTAgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShpMmMs
IGFueDc4eHhfaWQpOwogCiAjaWYgSVNfRU5BQkxFRChDT05GSUdfT0YpCiBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBhbng3OHh4X21hdGNoX3RhYmxlW10gPSB7CisJeyAuY29tcGF0
aWJsZSA9ICJhbmFsb2dpeCxhbng3ODA4IiwgfSwKKwl7IC5jb21wYXRpYmxlID0gImFuYWxvZ2l4
LGFueDc4MTIiLCB9LAogCXsgLmNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzgxNCIsIH0sCisJ
eyAuY29tcGF0aWJsZSA9ICJhbmFsb2dpeCxhbng3ODE4IiwgfSwKIAl7IC8qIHNlbnRpbmVsICov
IH0sCiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYW54Nzh4eF9tYXRjaF90YWJsZSk7Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
