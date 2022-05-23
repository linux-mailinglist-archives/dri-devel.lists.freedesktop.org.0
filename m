Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FE5315FE
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 22:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF46E10E4D2;
	Mon, 23 May 2022 20:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E8B10E2A3;
 Mon, 23 May 2022 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=PF2QZluFpG0B0SGot/0yZRsxkLgQZRVAXG0KLm186/s=; b=ePBn21i0dh+Ir40Tm9N7ZENfdT
 hgszo8s9Ohf8SKMCxdkhgIqlNXEGRpqdZLUCRybtaAS8/hm/W8Ff6bQ81izzjpRezVYHFMOymW9EC
 Bin8Q3tsmYgTbn9z2lho1IdfNt+lz5N+Q8fDswk9vtG8tzLUK5ZH1UAh8+j5DSi5FdxRGZmpZ2v6f
 p+3JhjpLxZCASGhfj3V3htG+60bn0c3zvTJms+/Bd/QqfVgSxgcnHSZ9hRZV3kTsjXJK8B7xmZiQ0
 y8rE4B1jYfh8YEsaXq2B9Ai4QJXkfodlDN8gte5uO4+D+xvBa2sniht1AAXFoEJ9sDvaBtzGBH60t
 2rN7lI8Q==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntEtz-00GX1n-Gs; Mon, 23 May 2022 20:43:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/msm: DRM_DP_AUX_BUS depends on OF
Date: Mon, 23 May 2022 13:43:37 -0700
Message-Id: <20220523204337.19739-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a Kconfig warning for DRM_MSM by making it depend on OF,
since 'select' does not follow any dependency chaings.

WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
  Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && OF [=n]
  Selected by [m]:
  - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)

Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/msm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -3,6 +3,7 @@
 config DRM_MSM
 	tristate "MSM DRM"
 	depends on DRM
+	depends on OF
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on IOMMU_SUPPORT
