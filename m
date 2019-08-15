Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891718E6D6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965696E91A;
	Thu, 15 Aug 2019 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1B16E886;
 Thu, 15 Aug 2019 00:49:16 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 718363EA1E;
 Thu, 15 Aug 2019 00:49:15 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 07/11] ARM: qcom_defconfig: add CONFIG_DRM_ANALOGIX_ANX78XX
Date: Wed, 14 Aug 2019 20:48:50 -0400
Message-Id: <20190815004854.19860-8-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830156;
 bh=RQi7NgzWoBfqg8AYplLP5izcyVgpI38ozyAN9bUXL0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EWhD6+a7wngQEzTa1GokP9KHGWvgK5XoZo2l4cdMlZVpQDtOEpWl3pik4MKSVH/9W
 QX8TFjUKALlS3Q+3aEv2im8IE1HpEngE04TtzouMNESZmwd34RuXUoKDy8ululGHJ3
 h9MqhZZoYUJIY8DJDykIjtu7akNaFybaiMmq82fc=
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

QWRkIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzhYWCBhcyBhIG1vZHVsZSBzbyB0aGF0IHRoZSBl
eHRlcm5hbCBkaXNwbGF5CmNhbiBiZSB1c2VkIG9uIHRoZSBOZXh1cyA1IHBob25lcy4KClNpZ25l
ZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIGFyY2gv
YXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgYi9h
cmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCmluZGV4IDM0NDMzYmY1ODg1ZC4uMTM5ZTY2
MTBmMDM0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCisrKyBi
L2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKQEAgLTE0OCw2ICsxNDgsNyBAQCBDT05G
SUdfUkVHVUxBVE9SX1FDT01fU1BNST15CiBDT05GSUdfTUVESUFfU1VQUE9SVD15CiBDT05GSUdf
RFJNPXkKIENPTkZJR19EUk1fUEFORUxfU0lNUExFPXkKK0NPTkZJR19EUk1fQU5BTE9HSVhfQU5Y
NzhYWD1tCiBDT05GSUdfRkI9eQogQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQogIyBDT05G
SUdfTENEX0NMQVNTX0RFVklDRSBpcyBub3Qgc2V0Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
