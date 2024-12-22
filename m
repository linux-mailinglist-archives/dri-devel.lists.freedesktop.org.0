Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D19FA7F7
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 21:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD9C10E224;
	Sun, 22 Dec 2024 20:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JOUGCs8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E2110E1E9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30229d5b1caso39451781fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898459; x=1735503259; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1CAACp4GjO3ym2QwQfPSi4sTCeC1v2d+xt2KcB0Ux7M=;
 b=JOUGCs8oaqjoXyQB7WKVCCzRfQdeGlUDy8BvFk4jDuAN0rtmkuIxTpbdHPp1sUDeum
 r9X0zlWAgZkwhq7HGWF7WDjHk/QW2mnVZqdBL+EEj8UP3fuPDhdC6Diu1x6YQn7qhefY
 mKUHZkbxAsjLGzOS7szK4fOxgATbH3IJOOCg9SausWfMuSs/xteM36tk9n5bBNgsBxqc
 X31vmQyjSJyx9zSWx3taqlAwn5GsmBmAGZUElgf7f4qYQbMmR+8XBhSQJAMBqPsPrAyJ
 w1iX48xmRDYBW1Nd/UvGTgHeJslwdDsnibG+j/oxmW1ch5LGiNAw5jlq2GN+qP7PJF+2
 qF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898459; x=1735503259;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1CAACp4GjO3ym2QwQfPSi4sTCeC1v2d+xt2KcB0Ux7M=;
 b=mlVPJ65Bygsw4iPvk+/4cYKI4kMLqkOmXxAXeEpjokf5mHFOX/OkPc/2V+SjeZjjHC
 KdxGY0xGSExtKOVF0TQiJ3hRQZKTHAiL4HzgRwSgx+zSyhKErtoFT0V59TmBLGjkf7vG
 c7WHIVOtDgrzo7jlLOmL63yT+TsuYat/FS3/JRdj0KL8eI72KaDVaWSm9pDmtQtUQSyj
 b8hE6wGTSQhEsNdxq8wbzRK/XcSvDuDwPfg4b5F3so/jg3B7NF9InKl5fwfMfvFqfJPR
 JvOUCNWVqpTe1Ks1mTdsp/se+Zufc+AgZ6zMJR9qelU8XhzD0ReSyK0gcgb44Mi2DOF/
 /i7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFOpnvioBqaKvyK3Hp0UXasc9qldFh77vmVnw1oOGoP/5CHghGF0AHXQv6RdNRo7jHjiHV/4p1WdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxNxQc06rq9Dr3ROZ4Y8oku6CihsT9v3RQRsEnJQmjrcvZcd+O
 bMpYLqlYKSoh/6UXkKypQ5zmStBj61l4S48xcn0iJJu+yk6mczUPolDRJky2nHw=
X-Gm-Gg: ASbGncsbOYxQSsEU3ZJTTVTK2vHddvTBrhG4lHpgiAYQ27ENOz6rw742GtIyj0gqPJ8
 RKIWdtgjnpunOWDLPx2ebAfXnY532BhFikFiMz+Qu/rpgJGLXgvEHe15IzDG9+gokjAkUR3gWkT
 luDltPGEyYlOVY+kEF1JEbjrDnGguDNWgZfi5Qt/OmjBuYrlVdgYUoN0Zt95sLY+/UvsMgauGlF
 dzjdXphg+yMgutebPZFK8Pr6cyo9d9gF0i1Hk0DmVnifHnZurZVQGbrWvTcacfQ
X-Google-Smtp-Source: AGHT+IH1NiMr5WnGF10+SPwgET/+bAdT9I+Y2w4pjPlA3DK9BEOnlkm9QFpkXP9RAFfV8fRrY9HPZQ==
X-Received: by 2002:a05:6512:4014:b0:53e:2bb0:4942 with SMTP id
 2adb3069b0e04-5422956beb5mr3409806e87.57.1734898458568; 
 Sun, 22 Dec 2024 12:14:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:07 +0200
Subject: [PATCH v5 04/11] drm/msm/dp: move I/O functions to global header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-4-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
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
 bh=7PLWki9dLUTSYTbO8lnYK4VQogj3alhO9C5gmUos+0o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMOCSdLN9XuEmQuLPNm10wdFSwCaNzlzvw7H
 QPSJCvEqTCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDgAKCRCLPIo+Aiko
 1R4iCACJa8b6gQ4MmQEEmaszTg2wOBCQqt5e8DGfl8fpXI4qmw+7QA8X3Mtd4rL++WF4hVnhlT9
 hH9y8uxmBXd/3YOrmCNdfGkPW+d2VoRWW2fbwTjQ6k6HfRxtG+Eq+9d47ZCTyo7XscJRaJ1jyoo
 q0zkmAnJ4Ncmj1oEUYD7fP5xXxVIWkiMulrZxJVV8CJs82ohXNCUNDKAAHWd2U3W4VgqgALTQxB
 nlrK0sNQxM1//YuiDRjw6jMedsDFHDNm1b2ixgyq5CKrxfSOUncAJJquFjLJYu+LVaGqYB1SUlg
 UsxdI+YFDPX4zmA4Jz9Jj0qIWmpDmWywkUGvFmmXiDc8XyfX
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
index 74ab86035f3b98b498756673229218558b6713c3..a22efb1e83d04cc5c9bc768a275df9cfb4752a2f 100644
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
index 5a757671d7310b43e7ca0155ffdc276c83d1e8bc..10fd0086132092be88bb698e53124f87a906de70 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,6 +48,68 @@ struct msm_dp_catalog {
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

