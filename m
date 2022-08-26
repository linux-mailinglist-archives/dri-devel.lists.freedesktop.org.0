Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA455A24AA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576E010E7F9;
	Fri, 26 Aug 2022 09:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ED510E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:32 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s1so1282278lfp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7YUg2IHSNg4TVR8qYeviWm/ECZ9CIuXhHqOU5RIbXkQ=;
 b=DGoCIxWWrW2/VoRj+jrd91hN2aaNVrzXGlkg4Kqm9dl299QpxnjB8RJtk0SAty9hFr
 AdHB0T9j6Aa9bpD73Muif/oyT4wYvrirpeoMJgQ2r7/PIxsyAEr4wnZQRrrlYMqTuRLz
 ykzNkn2POvZMAoKv6A2Sung0u7iN+sKlx+oyHQIox66zWjkaEFGgtmBDnnm0thoM6wML
 v3zPf7ROCTn6ym3U3w5OE0kc+SICWWPVhNikUjPvHRdiBdHS3iUQgCqZK33ktw/XlVOS
 Sjb2ofeacudtwDyXSpowFi8Phkbp7RNBlc/Ihxk9f/MDMCsL8msuzG2uisROeDrbI0IV
 B4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7YUg2IHSNg4TVR8qYeviWm/ECZ9CIuXhHqOU5RIbXkQ=;
 b=IW7ruuVApOGWd0npZ4mw23atlwa8+d6NLxC4yy/7hN1LB1ZyMX0Qf63NnseLWYwCPv
 3Z+uMs92QyO9Z0XKK0sY+sXUChgr+JVSHxA4YgAxMoJ7lMrdNQizjnci78SFsXdyxkxp
 PwZBop2gEmZ4eSPbPohHn+rShFslaWwY33K/+INHSRMXshtA89eDh0U1r9iDaWxqIVHj
 GP7dL0h5T94sI0f/8q+GiaOxxE2i+kphOa5ASCe8Jo2Vbizot7CIuuSEHV+yD3xPPXve
 w74Klt8gUk+5Y3HMwHaGmYzmuDHBho5mcgBOAiFgZlrQ13sNAGkFn37cbWbkxe/jf8dx
 FIIA==
X-Gm-Message-State: ACgBeo33kxcW8PYQ1tsGN+/2eQiuLMuVQPyHKgMVzWOKhGNaE2jSFQP/
 g/Wx2NnKhoQlAeTwYTf6Zp0YpQ==
X-Google-Smtp-Source: AA6agR79CJxCFxffslGvyGXwcgEEYTlbztrVDxkZgULrWvLmVydKZ3hfgbf3j+a4UVtOzl6PTl8hOw==
X-Received: by 2002:a05:6512:3b14:b0:492:dbf2:a5a0 with SMTP id
 f20-20020a0565123b1400b00492dbf2a5a0mr2163261lfv.46.1661506771006; 
 Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/5] drm/msm/hdmi: drop constant resource names from
 platform config
Date: Fri, 26 Aug 2022 12:39:24 +0300
Message-Id: <20220826093927.851597-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All MSM HDMI devices use "core_physical" and "qfprom_physical" names for
register areas. Drop them from the platform config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 9 +++------
 drivers/gpu/drm/msm/hdmi/hdmi.h | 3 ---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 1d4557de6872..4a364d8f4c0b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -138,7 +138,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	if (ret && ret != -ENODEV)
 		goto fail;
 
-	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
+	hdmi->mmio = msm_ioremap(pdev, "core_physical");
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
 		goto fail;
@@ -146,14 +146,14 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 
 	/* HDCP needs physical address of hdmi register */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		config->mmio_name);
+		"core_physical");
 	if (!res) {
 		ret = -EINVAL;
 		goto fail;
 	}
 	hdmi->mmio_phy_addr = res->start;
 
-	hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
+	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
 	if (IS_ERR(hdmi->qfprom_mmio)) {
 		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
 		hdmi->qfprom_mmio = NULL;
@@ -524,9 +524,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -ENXIO;
 	}
 
-	hdmi_cfg->mmio_name     = "core_physical";
-	hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
-
 	dev->platform_data = hdmi_cfg;
 
 	hdmi = msm_hdmi_init(to_platform_device(dev));
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 04a74381aaf7..e8dbee50637f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -86,9 +86,6 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	const char *mmio_name;
-	const char *qfprom_mmio_name;
-
 	/* regulators that need to be on for hpd: */
 	const char **hpd_reg_names;
 	int hpd_reg_cnt;
-- 
2.35.1

