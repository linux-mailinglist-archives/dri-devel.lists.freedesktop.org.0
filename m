Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D148E709
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B28B6E910;
	Thu, 15 Aug 2019 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148866E87F;
 Thu, 15 Aug 2019 00:49:14 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id C38293E9FE;
 Thu, 15 Aug 2019 00:49:12 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 03/11] drm/bridge: analogix-anx78xx: silence -EPROBE_DEFER
 warnings
Date: Wed, 14 Aug 2019 20:48:46 -0400
Message-Id: <20190815004854.19860-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830153;
 bh=/u093//GuW+I8IlmY+WRCvVNrqq+VDjUh+Bgmnmobek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bqv5pd5wHBDbuxEIqdIG5yqTDwYaEs7MCLTc2m+N7XbdRn96M67iNmvPN4XnTAqe+
 wtnRTd35inHX16HBeJ21FVF60fw4jVzFBWifiu6UmZR9syaAJ+MQuJb61osn1HP+oE
 Sb65LGh/6wLVPdheFrqbS83MUA8QakXd3ebzpk9Q=
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

U2lsZW5jZSB0d28gd2FybmluZyBtZXNzYWdlcyB0aGF0IG9jY3VyIGR1ZSB0byAtRVBST0JFX0RF
RkVSIGVycm9ycyB0bwpoZWxwIGNsZWFudXAgdGhlIHN5c3RlbSBib290IGxvZy4KClNpZ25lZC1v
ZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIHwgOCArKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCmluZGV4IDlhY2RiZWRmMTI0NS4uNjJkZmNlZDkxMzg0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwpAQCAtNzE1LDcg
KzcxNSw5IEBAIHN0YXRpYyBpbnQgYW54Nzh4eF9pbml0X3BkYXRhKHN0cnVjdCBhbng3OHh4ICph
bng3OHh4KQogCS8qIDEuMFYgZGlnaXRhbCBjb3JlIHBvd2VyIHJlZ3VsYXRvciAgKi8KIAlwZGF0
YS0+ZHZkZDEwID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgImR2ZGQxMCIpOwogCWlmIChJU19F
UlIocGRhdGEtPmR2ZGQxMCkpIHsKLQkJRFJNX0VSUk9SKCJEVkREMTAgcmVndWxhdG9yIG5vdCBm
b3VuZFxuIik7CisJCWlmIChQVFJfRVJSKHBkYXRhLT5kdmRkMTApICE9IC1FUFJPQkVfREVGRVIp
CisJCQlEUk1fRVJST1IoIkRWREQxMCByZWd1bGF0b3Igbm90IGZvdW5kXG4iKTsKKwogCQlyZXR1
cm4gUFRSX0VSUihwZGF0YS0+ZHZkZDEwKTsKIAl9CiAKQEAgLTEzMzMsNyArMTMzNSw5IEBAIHN0
YXRpYyBpbnQgYW54Nzh4eF9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAog
CWVyciA9IGFueDc4eHhfaW5pdF9wZGF0YShhbng3OHh4KTsKIAlpZiAoZXJyKSB7Ci0JCURSTV9F
UlJPUigiRmFpbGVkIHRvIGluaXRpYWxpemUgcGRhdGE6ICVkXG4iLCBlcnIpOworCQlpZiAoZXJy
ICE9IC1FUFJPQkVfREVGRVIpCisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0aWFsaXplIHBk
YXRhOiAlZFxuIiwgZXJyKTsKKwogCQlyZXR1cm4gZXJyOwogCX0KIAotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
