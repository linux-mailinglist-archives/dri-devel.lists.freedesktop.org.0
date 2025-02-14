Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5780A35EA6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594B310EC91;
	Fri, 14 Feb 2025 13:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iwpIHb8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67110EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:18:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f240ec571so113871f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539082; x=1740143882; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4LE456UUhTzImlgmj9NPbG9NBfxzf+5xtSodgSen1s8=;
 b=iwpIHb8ALBny1W4Q5dadgsafQBNvR0rvupZ/tRP3Occ4PjwqEFbXoqK5UPhuG8XUvu
 QJzl19jMG9NLXilJzvhG0RrEpOiHUbbgn0wBrDH2wmFt0Xl3YbG08QZ19Di6SyIuoukJ
 J9xRmNvUp7h58bX/ptqiV9Xk3WvuOzD22VLBaDSZgFbp6YaVQAi4YMNSLJ5uzcy4yvJb
 +xaPc+4yGElCPTS0p11prdLgwsLU3tmASPLLjuGthyXpTG/X5JKT7yleK9WqFz4UdoHo
 GRoAblx7wi3RSsWXHrHlJhXu4B6bxI0E0drPaC4sbNFu6RmLSC3lXi6rBx5+mWjBodEM
 DCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539082; x=1740143882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LE456UUhTzImlgmj9NPbG9NBfxzf+5xtSodgSen1s8=;
 b=wK29aYP2T7pYOw9x2pAyBOnLJc+Yoewl/71MCMMuJjiuBqPfb5696yyUKtxltdqZ2T
 xC6WWzRoVBI1pKS/3uQg1PkZXgs/UvQIqgUjT2vFMvCxaajfaaJlPUpqjeGkUcCa4VF0
 u3Dr+7BmORjIZ+8/zOV8/c9FPp2D2NDvjMLhNEoaNLPDGRD6MBtqcwQMyMbiuEA53Mz8
 5TGzrNxL7Kt2WxKIjzDiHSiPXYyQMOBlf/8DOjiVvId5Zwow5BPL4oHuVbmaw3HUFFF1
 zoyXv41LEjOJHMLORP0K7/c/YtI68niyQiv9i6t/4FSszjUbD5/u0exrFVUVQltQwOCW
 zg/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWTILgm0rD7HKQgPeT29Fi4/K3SNQ5g31hTIweLbsR9XB131hXYFFVztn1HESlioDa/YLdHSdvGbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAptkezdn6SoJ7bLYOVB89GFRrfsYKduZymdiooKCX6TTFFAtA
 3T1rAgCd1iK7eOAkFAZEiVNFlomLravlwgZjkJs1ao141klMSysW6QLusdU8SPU=
X-Gm-Gg: ASbGncujDbqcjV4G54BSRkohfED32ar0klVHf2QbYO0S7ebxG/Q6cgADYivgt1sJ1tj
 xaJeg37ldD0IpWSHFD3j/e7U5s0Om1oBAVTBvcZemY8H0TA7sno/ZENIg7COHWa520tAnQ1QaaT
 hOeMff8cbBUkrpkRV3jjaH7bKVKPm35O0h2/InosR/0yOogDyVtwNvZEwWJhLCIWtZs/H4l1WYy
 6NVXZRFEH5JXZVJu1UEX5Z4ysNTWn/rmz6pltvHA2f4ADlnAXyk9u2zZnQqRLrlmp9D6R5zKaAO
 ywE1Uh7hDOlmYPS6Qi+KbMQf9yn61jQ=
X-Google-Smtp-Source: AGHT+IERsb8pyYVEmTlSzt9ruB1hZL+QbDlon6/7017auPvH48KZTGyTGNiDtGRYQSA7i3P3XQptBw==
X-Received: by 2002:a05:6000:2104:b0:38d:daf3:be5a with SMTP id
 ffacd0b85a97d-38f2c777a53mr1413782f8f.7.1739539081555; 
 Fri, 14 Feb 2025 05:18:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:18:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:46 +0100
Subject: [PATCH v2 3/4] drm/msm/dsi: Minor whitespace and style cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-3-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5028;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wrQ7FEvkfGwe1RgjRIh0czcnhsj69UfOzjSd6eJUfEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0KBNopLG/nMFbPRPRRezQK48CkRgIUqrVvGU
 /bI1eQlugiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CgQAKCRDBN2bmhouD
 173sEACJr+2WUT8DaXnwjiufyWp84sk2wSRe2HDObjXTu9WK7LuVDYkXOFjAs9FmcKBXTFns+8G
 Z8qr4n8qQ8u5vK7XlonY/C5UWCgTDZy6P7LTH8z1PEWq2Q+Ld8Sw8Nesgew2V0jrhr7btKu/elH
 WNwaOPUUZLvQ+Lz+LHE6I2n1iuR/rY8yx3jfphh4fUlEQ0qJ1Hu8hDohVmwS+UBCEFWnqji9GSO
 T6/YPokGX/2sU2kTzfQ41/ykcmb5RfUE3djbJxz5LMQL/dUUv3PFgps1lmrjHdf0OHgVrmbgcQu
 tz44nF3BAl6CtaRBbpxqq7cfuq+kNh0c7XzDdnf/b86ohnwV4YPmb7f044GND9XUjZcRvoByOlM
 yzbjKOBhDbBtJ9MvKUMlFIEyBde7QgGe6o7hiLHGWmx129NtaWtya850nF/ddDM9HGU1f4Estnb
 oeUruJdIHDfgqNgUMJyjjGS/SaAfAp41+XmOWkwksgOYFioA95PI+uwwJaytHPzlcvlqtjbUJfq
 E9F910mNvtRSGVIyHbr8M4v7exsKitd0vo9VxLS/Fxwx90d+R7igmbsP5xv4JQzNjegKNxW5+bP
 ScnaAIntXwHjKmnI4GC5wANqKFQb1xS7iZr5yiEPVDwono8kmj5JNVu7CE/4sn3jRtHIrUc9xN6
 TfOEjLa9cL4A2Yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleanup few obvious kernel coding style violations: missing or
unnecessary braces in 'if-else', unnecessary break lines, incorrect
breaking of long function declarations, unnecessary 'else' after a
'return'.  No functional impact expected.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 51 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8fc9f5486aebd3c08914409cd3c7824fa0b97515..051e26ae1b7f20d47969c3aff4e7fc6234f18d1a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -179,18 +179,18 @@ struct msm_dsi_host {
 	int irq;
 };
 
-
 static inline u32 dsi_read(struct msm_dsi_host *msm_host, u32 reg)
 {
 	return readl(msm_host->ctrl_base + reg);
 }
+
 static inline void dsi_write(struct msm_dsi_host *msm_host, u32 reg, u32 data)
 {
 	writel(data, msm_host->ctrl_base + reg);
 }
 
-static const struct msm_dsi_cfg_handler *dsi_get_config(
-						struct msm_dsi_host *msm_host)
+static const struct msm_dsi_cfg_handler *
+dsi_get_config(struct msm_dsi_host *msm_host)
 {
 	const struct msm_dsi_cfg_handler *cfg_hnd = NULL;
 	struct device *dev = &msm_host->pdev->dev;
@@ -370,7 +370,6 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
-
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;
@@ -588,7 +587,6 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
 				msm_host->byte_clk_rate);
-
 }
 
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
@@ -677,8 +675,8 @@ static inline enum dsi_traffic_mode dsi_get_traffic_mode(const u32 mode_flags)
 	return NON_BURST_SYNCH_EVENT;
 }
 
-static inline enum dsi_vid_dst_format dsi_get_vid_fmt(
-				const enum mipi_dsi_pixel_format mipi_fmt)
+static inline enum dsi_vid_dst_format
+dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
 	case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
@@ -689,8 +687,8 @@ static inline enum dsi_vid_dst_format dsi_get_vid_fmt(
 	}
 }
 
-static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
-				const enum mipi_dsi_pixel_format mipi_fmt)
+static inline enum dsi_cmd_dst_format
+dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
 	case MIPI_DSI_FMT_RGB888:	return CMD_DST_FORMAT_RGB888;
@@ -1282,14 +1280,15 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
 static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 {
 	u8 *data = msg->rx_buf;
+
 	if (data && (msg->rx_len >= 1)) {
 		*data = buf[1]; /* strip out dcs type */
 		return 1;
-	} else {
-		pr_err("%s: read data does not match with rx_buf len %zu\n",
-			__func__, msg->rx_len);
-		return -EINVAL;
 	}
+
+	pr_err("%s: read data does not match with rx_buf len %zu\n",
+		__func__, msg->rx_len);
+	return -EINVAL;
 }
 
 /*
@@ -1298,15 +1297,16 @@ static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 static int dsi_short_read2_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 {
 	u8 *data = msg->rx_buf;
+
 	if (data && (msg->rx_len >= 2)) {
 		data[0] = buf[1]; /* strip out dcs type */
 		data[1] = buf[2];
 		return 2;
-	} else {
-		pr_err("%s: read data does not match with rx_buf len %zu\n",
-			__func__, msg->rx_len);
-		return -EINVAL;
 	}
+
+	pr_err("%s: read data does not match with rx_buf len %zu\n",
+		__func__, msg->rx_len);
+	return -EINVAL;
 }
 
 static int dsi_long_read_resp(u8 *buf, const struct mipi_dsi_msg *msg)
@@ -1366,8 +1366,9 @@ static int dsi_cmd_dma_tx(struct msm_dsi_host *msm_host, int len)
 			ret = -ETIMEDOUT;
 		else
 			ret = len;
-	} else
+	} else {
 		ret = len;
+	}
 
 	return ret;
 }
@@ -1435,11 +1436,12 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 		return len;
 	}
 
-	/* for video mode, do not send cmds more than
-	* one pixel line, since it only transmit it
-	* during BLLP.
-	*/
-	/* TODO: if the command is sent in LP mode, the bit rate is only
+	/*
+	 * for video mode, do not send cmds more than
+	 * one pixel line, since it only transmit it
+	 * during BLLP.
+	 *
+	 * TODO: if the command is sent in LP mode, the bit rate is only
 	 * half of esc clk rate. In this case, if the video is already
 	 * actively streaming, we need to check more carefully if the
 	 * command can be fit into one BLLP.
@@ -1864,9 +1866,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	int ret;
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
-	if (!msm_host) {
+	if (!msm_host)
 		return -ENOMEM;
-	}
 
 	msm_host->pdev = pdev;
 	msm_dsi->host = &msm_host->base;

-- 
2.43.0

