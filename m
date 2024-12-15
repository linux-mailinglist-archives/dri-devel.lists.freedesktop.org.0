Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F398A9F26B6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511FD10E501;
	Sun, 15 Dec 2024 22:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FXmNdgyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AA710E4F7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54024aa9febso3445810e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302672; x=1734907472; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nubs3398lgrKxFnCwTc1Ymo101jsqe11SC2pCPEcqUQ=;
 b=FXmNdgyDo+GIe11+zyc5aAEdL5u+OjkxuBtCdS7VUnEnc3QY5SNXdzN9jnnjs6YSOS
 KtQSz9FQqogui+C/An8IvmIPg2aPEvPZMuHMiEl9qrbtzEqGsexeXTMtOchnFT1QjHdk
 /qq77X0tiHBOtiUuzr1SQw/pT9Wi4yeKJSfOOibxToWCwoHtH1bk8bI5XvbjXkjgbTnp
 /DEfYQDKU0tsglkUx9+dqbk03gBGb8YjdmBySYGDqKmNUvFvPkfcMg64BzpTZguF1a4K
 StUkiWNTv2F4ufLzg5mmjyqJiMkeIx/5HPwutXQ8GOZAxgH7zBVxWzUseHdQExaM4dg7
 Plog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302672; x=1734907472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nubs3398lgrKxFnCwTc1Ymo101jsqe11SC2pCPEcqUQ=;
 b=T4fYVLRMboyZIjUq2gUXZcmCrOtoQs69NUodoHWTyFNrSMP/aXqRsjNAmax7B5wyaT
 j5/D8qTKICE5g9PeLQUYgRWA1Z0bYmOEw5Bxa1Aws087UKIJUeFYMLv1MX438MCzNhhf
 lz8Kl7ldoSkJ0Ei4zQ8visdVjSMyEPSbMENrF4A6OhI26QY2g3KObljQ/H7Gy90K+Smy
 bL1VAZGZot9ARHtULb8EzHazeRzMFDjk65l8SJjqrO2pstjlqO0bFb6fLgRszwlosWoo
 rN+tu3mFYlbvuNiBJJS+cQtmvQCDLaIVXXzj4khUfQjvM/69hcWr0rs8Nw/voebdjszC
 ENcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0CpjQgZeXJoBRLdwtZDkSgYCoYxtSBHluzKWHanl+91RLYa6FkLzcrESF3deHEACu0Fwzh7ei2Gw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyl8Dgru6kM7A4o5DrZ8xLzSgePkP9TxFOlPqPUK39dOHPURYf
 /68rDlWme0EKbOymZ6Lnp2rjW8z+qBixrcm65EZrz6fX1T2sD7C1x2fnluuFyqA=
X-Gm-Gg: ASbGnct4mML9R8bOBXdnFrxQZaPpIZE0nrjC2VDiCVv7V6Ce3pslS9vn67F9bQNRCvS
 cJXhwftRV6WWiwbwfGs6Jwc0Rgqw2vBUIkT/wksqxSx/fr02hP6EzNTtSH+XR35/7R7D7bIdc+g
 bE3lCr5V66AR03+92rWIpnqWvwG7ttU88dgak1iGoj+UFi0QqGx37O6fw3rlYBL1JaNNvS2i/RV
 KuvgogYENP5d+SW2CKzmpuBgEyfg24XaYVA6QuPDadDt1Z2SmUP7quKLBBUt+KZ
X-Google-Smtp-Source: AGHT+IGqHHO3GLDpWqOcMsqQWY8q49s2fKEdDxU/H/TcsNTAaJJAYzfLtem0/bo+E0Ao0strvHnoRQ==
X-Received: by 2002:a05:6512:a8e:b0:53e:39c2:f020 with SMTP id
 2adb3069b0e04-5408ccff097mr2843422e87.6.1734302672230; 
 Sun, 15 Dec 2024 14:44:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:13 +0200
Subject: [PATCH v4 08/16] drm/msm/dp: move I/O functions to global header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-8-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5605;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ysAreE5Z/RcHbTBjNtDu2xspbXRBHDHxpb93FRND6NU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u6Jggs2naphQ8Ghnw42kXUU7Kjee7V20RQ0
 WgD+3PBmqWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19bugAKCRCLPIo+Aiko
 1dyoB/9Cv/BkoE65IYuBfpbPwkrZg86R5Goq6clXeaT5DTBi1qo85cBBsdEhrPXVNA8GV5xB0Gc
 9JDBjYmkwNBkIDXlDvuJcM2lT10QmLHC6RtUXrXMivJ84/3iihXq8dq10s+Noizg0Wg/tPVzKu9
 LfLw7lkCfo1cKPcuIzVCQ5/LOH1978IIZdr13klA5+OMOYF308NcgtP/S+AYDdouXshm7V30MqQ
 rBy/tPB+i9RSQ49TZ+3YxnwPKMhKGf9Q4LmZvm7Ofj/F2MFQ/Q12UHSVDG4vT1vrsRuX1cvBhm1
 ae2oYf5gluKkRMTVXzDrTnx/AmYzAc7kIHaQ3xwL8XZd8n+d
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

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 399bd11312d33268faee769946196d344546e63d..871c935cbe10bc2749960d61cc6b835a3ec2e296 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,71 +81,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 9aadaf1627a5813ab2d87e6e02dc0a967affdd79..d08761697a8e48b5e6827411eb5d1bc9df4894c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -47,6 +47,68 @@ struct msm_dp_catalog {
 	size_t p0_len;
 };
 
+/* IO */
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->aux_base + offset);
+}
+
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->link_base + offset);
+}
+
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 

-- 
2.39.5

