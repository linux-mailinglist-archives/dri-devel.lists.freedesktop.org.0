Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F3584E3FB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEC810E8FE;
	Thu,  8 Feb 2024 15:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VCqWwFJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978510E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:23:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-511616b73ddso3345023e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707405789; x=1708010589; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4npPI+xkEoBmWEsuW9AtPIqMiVTTM7opc5TOPILRMZw=;
 b=VCqWwFJUWCKsa2Hqa/5HkBf1Hq1nM6GiV27VWWJ3ETrT38gHd/MUUleP5q+jX7h2W7
 Fk6oAr606tAyFGA3aDs6hRru+utRpFLImYoGYVwyHvYUXhklS62b+2q0KaubA0GwjTig
 xdOwZKy9aoVSIbUa1QyZTr/xSRNGkpZh/T+IPjvfTjMHFAW2SS0D17Qu+CplUPKbo4p1
 DDSF3cZWAf8tyoo8lROtb1mwm+i7uoQTB+/uDKEVJIoQUXNJaNL18nspvIIpOiACS34H
 mLyWTCxX9pb0TMz9xdrzXWo9nsSsszdh6OPYC6NCA1zyplXa8IA31hX+Q+8Hma9hvFZg
 rMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405789; x=1708010589;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4npPI+xkEoBmWEsuW9AtPIqMiVTTM7opc5TOPILRMZw=;
 b=Zvr+JgAuRr9FU/GiC71p0DR1nUHWxPNSz2GOiRe0yDA3BMdTbILGqg96UpczOAuvSp
 2nv4fJTslONFtABEBc+QobcVSM+tbIw0YDIRzyWETo+v6C0vMxw8ZO1aB0UZJulc7Yph
 zVl4cPCdLt8RFo8zvddHpTSqR9by3uWs+Ljj9HydzamR44GOjcKdYdv9ZKl5HYIPQKQk
 8oXDsMHsl52EtUc/4bFu1o4QJYBofjcfrg3SrQwR+umk02SLtQHb+wCSlio81JOxOOwt
 WyF5cSF+CHMHQW/PPeKpZY6XiLZMWqUrfv6PH+IOYM/GbDTcO67iLm61RkUZTSWhT//y
 mVnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5+Yy9br5Q4GLj+x/mClZWuMysZVVWMHXvvyhCjjXyZzx8ql1bljVcKUFJxizExQde2Lf7qRWy3iCMvpvZewMZST5iTh846wB99NEgHN8q
X-Gm-Message-State: AOJu0YwURtT6sQi/wOAKu88PoQliLOZ79FWwEwqt0nuHvyR9AVzFAF60
 xqpiWlH23IdmVbf9atHHgk2P028krTT76jkWwqENwdfOj2mKOeYZn6j+v/Mz7RM=
X-Google-Smtp-Source: AGHT+IEClYFAU9BGzt/VQLfJNohrnzM+p2jhFYYCp6CYfEyHfx7AsYuQKJxti7pLx/68DH5jyct8Iw==
X-Received: by 2002:a05:6512:34ca:b0:511:729b:4a7b with SMTP id
 w10-20020a05651234ca00b00511729b4a7bmr553613lfr.23.1707405789329; 
 Thu, 08 Feb 2024 07:23:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7YNfQNUlgav+Sj7V7E/rWNOqacgBwg/58IvZWg25XLvdPZHvXXXghAukrZn1e+HH+sE5FTN7pSCkLviRJt5vf/2woaw+c3TB3i0KFnLocXUUX+vZlfacw/OYcPCOP8ha4IOyiMqE9mXrn4Ogk0j0MIs3hgnzv+IJmf+1l04aTsbawSF8m0p1VWnD0WIVJcGqeMuKBJpW2667DGwZt40/jnzrs0KO6YfPTIYaSlqYcjEbw7xYB22yEeKvhYtlQ6dkiS8y3o607O62u3shXsfzdpGYpcDKdzmwE1FytZlh+
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ep8-20020a056512484800b00511549b15acsm25635lfb.123.2024.02.08.07.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:23:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:23:08 +0200
Subject: [PATCH v4] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
X-B4-Tracking: v=1; b=H4sIANvxxGUC/zXM0QqDIBiG4VsJj2eUmdmOdh9jiNO/kpbGr4tFd
 O+TwU4+eA6+9yAR0EEk1+IgCJuLLvgMfimImbQfgTqbTVjFeMUqSQerbDDvBXxSNhq1mtesUCe
 gVgstWF/3shMk/1eEwX1+7fsje8Cw0DQh6H+xqfOwpu15V9ZM8lZIWlO7uIR7+dS4x2kO2+3lv
 MZQBhzJeX4BktRJi7IAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lSoN4c4dQ5GWOLY+G32I+ql9QdfGB1rpvCvoA8U1v4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPHcwgWs9T+m+hVHbJbJbSQqaMUUJYv/XNPP5
 Vvegdcs1EKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTx3AAKCRCLPIo+Aiko
 1XjrCACaCpbHCUdpJzaJfUSD4AVFocoo2MoARD/x8SnfIywSoJQTjmA723MqBvgvjsqI8bHRS2b
 xjuK3u2Rr+Ym6kkI0d/HRKd8WRzjMkxdjXac+VHKq4kZROH1kAlbFt9VK6ftpt4kGOYuOOMLQcp
 nw5P3uRNIOOtLMECGh/9GxIe26UiaC1EOvHYYg86VLVjZNseWSOxB2O69IijJ/7XCe7dgiTwspO
 agBk4zXFVH6v9bMGrttdkwpOCdcAdC7U+XuQ82CUcyvXhADwOqBbYSZ2JqVypAW7rm9KrFl05Dx
 LIx1JSAK21d85Ixj8TJbvjL3sWVlxZ7S9lZKNbkFJSiL4/F6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v3:
- refresh rate -> transfer time (Abhinav)

Changes since v2:
- Followed suggestion by Abhinav and Marijn to improve documentatry
  comments.

Changes since v1:
- Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
- Added a pointer from dsi_timing_setup() docs to
  dsi_adjust_pclk_for_compression() (Marijn)
- Fixed two typo (Marijn)
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..6a6f1a21705e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -529,6 +529,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/**
+ * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
+ * @mode: The selected mode for the DSI output
+ * @dsc: DRM DSC configuration for this DSI output
+ *
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For CMD mode there are no actual porches. Instead these fields
+ *   currently represent the overhead to the image data transfer. As such, they
+ *   are calculated for the final mode parameters (after the compression) and
+ *   are not to be adjusted too.
+ *
+ *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
+ *  transfer time and data overhead as a starting point of the calculations.
+ */
 static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
 		const struct drm_dsc_config *dsc)
 {
@@ -951,8 +970,18 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
-		/* Divide the display by 3 but keep back/font porch and
-		 * pulse width same
+		/*
+		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
+		 * enabled, bus width is extended to 6 bytes.
+		 *
+		 * Calculate the number of pclks needed to transmit one line of
+		 * the compressed data.
+
+		 * The back/font porch and pulse width are kept intact. For
+		 * VIDEO mode they represent timing parameters rather than
+		 * actual data transfer, see the documentation for
+		 * dsi_adjust_pclk_for_compression(). For CMD mode they are
+		 * unused anyway.
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))

---
base-commit: b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
change-id: 20240208-fd_document_dsc_pclk_rate-da6a62919876

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

