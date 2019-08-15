Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFAD8E6EC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E6C6E900;
	Thu, 15 Aug 2019 08:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AA06E886;
 Thu, 15 Aug 2019 00:49:17 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 26AB63EA22;
 Thu, 15 Aug 2019 00:49:16 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 08/11] drm/msm/hdmi: silence -EPROBE_DEFER warning
Date: Wed, 14 Aug 2019 20:48:51 -0400
Message-Id: <20190815004854.19860-9-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830156;
 bh=d3q75pXkjIXM1QryEInKZPabWpuCo5QQR2U68bge2+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NJdtoh3/ImfhdTmSEd85mj5KPu2ZKI0+UpUzJUTokWtV70S3liqeW3s4dbfky+wr4
 LolisNgSRIh+ji/BEC/+LNt4IZWePqwWkQ0lf99WfPMtT+plnIZnwpj94J+7JjQ06J
 WoLNwQj3TpHlok1OzDecQd2NzU7BUwa+XkPAjiD8=
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

U2lsZW5jZSBhIHdhcm5pbmcgbWVzc2FnZSBkdWUgdG8gYW4gLUVQUk9CRV9ERUZFUiBlcnJvciB0
byBoZWxwIGNsZWFudXAKdGhlIHN5c3RlbSBib290IGxvZy4KClNpZ25lZC1vZmYtYnk6IEJyaWFu
IE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20v
aGRtaS9oZG1pX3BoeS5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hk
bWkvaGRtaV9waHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX3BoeS5jCmluZGV4
IDE2OTdlNjFmOWMyZi4uOGEzOGQ0Yjk1MTAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2hkbWkvaGRtaV9waHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9w
aHkuYwpAQCAtMjksOCArMjksMTIgQEAgc3RhdGljIGludCBtc21faGRtaV9waHlfcmVzb3VyY2Vf
aW5pdChzdHJ1Y3QgaGRtaV9waHkgKnBoeSkKIAkJcmVnID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRl
diwgY2ZnLT5yZWdfbmFtZXNbaV0pOwogCQlpZiAoSVNfRVJSKHJlZykpIHsKIAkJCXJldCA9IFBU
Ul9FUlIocmVnKTsKLQkJCURSTV9ERVZfRVJST1IoZGV2LCAiZmFpbGVkIHRvIGdldCBwaHkgcmVn
dWxhdG9yOiAlcyAoJWQpXG4iLAotCQkJCWNmZy0+cmVnX25hbWVzW2ldLCByZXQpOworCQkJaWYg
KHJldCAhPSAtRVBST0JFX0RFRkVSKSB7CisJCQkJRFJNX0RFVl9FUlJPUihkZXYsCisJCQkJCSAg
ICAgICJmYWlsZWQgdG8gZ2V0IHBoeSByZWd1bGF0b3I6ICVzICglZClcbiIsCisJCQkJCSAgICAg
IGNmZy0+cmVnX25hbWVzW2ldLCByZXQpOworCQkJfQorCiAJCQlyZXR1cm4gcmV0OwogCQl9CiAK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
