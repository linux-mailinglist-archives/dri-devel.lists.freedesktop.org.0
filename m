Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDAE6D405D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB2610E440;
	Mon,  3 Apr 2023 09:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0A10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g17so37186340lfv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmEGwl1dtwXNhBVAE3u5X5GcBU4ls7eYTmNONq4yQ1A=;
 b=f/y12721U0IK2EnZdeuqe/sQR/f9S5CgqCh571nm+2gLhJjZSbJbLhFoiRgxpO78m3
 8p+amBT16CUn12VFHrT+M78Icf2M9SXBeYMZPDWoGTtV1+8p48VP66KVxaRlxZQYMJgp
 KZqCJOWZpK1dk4WcKRKIpvR6QcRczEOL+BeZeZyMbBFoCSPkabL2i0vI56P6erVwu+uv
 iu7eq1fFhIQjs+uMWwplBMvN9Xnq9XHmPSdW4KdHjELYkr8zr2EJPnnLk3gUxo8YOfur
 GYc/L3IQFOQnBZ9liH2aSNxNeejMo6PH1isu4cAIEnVcKmrVaoiVZYsnIDKQz2RubcFL
 AUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmEGwl1dtwXNhBVAE3u5X5GcBU4ls7eYTmNONq4yQ1A=;
 b=Jet5yqSfjfmXsAiLOy4TVVLSWtmMwrZfewi5XG2uC3BuBm5IRPsZiNVvEZu6DkTXby
 kmJcvYNzkajyjjk1niX3uYeYGq0b0FQGB6SxGyMn6ncZPK4KsbmTeEn9X4q6YUhwg6uN
 wZ1G4gHg7d2cLz2k1YwTf8GkXyrfYNcVsgQK4CqYlZsXKP6phnXtU/Y45tx/uNNHYYGF
 wLN+hor2os7oet1Lwh2FsY5CEsNKzuYDfZ8lSlEc5uDkIGJv7WgTzlylVNmLZXJ97a6W
 /zRMMCLPdxXq2oJ6S5FObz4ljS6SAwgF5nJa/eRd5lugbTQd/MkOKm4XoQXwpEOE5CPb
 iJlw==
X-Gm-Message-State: AAQBX9fzy3RuR6w/5h9pzOgevvUqI92yT5alimf7sKorHlG0eEJUgtGZ
 qjiOHSAPBwomet+fc2SJKm1bVg==
X-Google-Smtp-Source: AKy350ZObSWnvlxqXqBuAqihuT6EOA4tNqRVB5NEhdj4syVCflFr+yjA8ysAlGGbpM9rqAobXLVexA==
X-Received: by 2002:ac2:5d2c:0:b0:4db:3ddf:2fbd with SMTP id
 i12-20020ac25d2c000000b004db3ddf2fbdmr8690928lfb.45.1680513798127; 
 Mon, 03 Apr 2023 02:23:18 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 02:23:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 05/12] drm/display/dsc: use flat array for rc_parameters
 lookup
Date: Mon,  3 Apr 2023 12:23:06 +0300
Message-Id: <20230403092313.235320-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Next commits are going to add support for additional RC parameter lookup
tables. These tables are going to use different bpp/bpc combinations,
thus it makes little sense to keep the 2d array for RC parameters.
Switch to using the flat array.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 228 +++++++++++------------
 1 file changed, 108 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 122a292bbc8f..acb93d4116e0 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -305,24 +305,6 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
 }
 EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
 
-enum ROW_INDEX_BPP {
-	ROW_INDEX_6BPP = 0,
-	ROW_INDEX_8BPP,
-	ROW_INDEX_10BPP,
-	ROW_INDEX_12BPP,
-	ROW_INDEX_15BPP,
-	MAX_ROW_INDEX
-};
-
-enum COLUMN_INDEX_BPC {
-	COLUMN_INDEX_8BPC = 0,
-	COLUMN_INDEX_10BPC,
-	COLUMN_INDEX_12BPC,
-	COLUMN_INDEX_14BPC,
-	COLUMN_INDEX_16BPC,
-	MAX_COLUMN_INDEX
-};
-
 struct rc_parameters {
 	u16 initial_xmit_delay;
 	u8 first_line_bpg_offset;
@@ -334,21 +316,31 @@ struct rc_parameters {
 	struct drm_dsc_rc_range_parameters rc_range_params[DSC_NUM_BUF_RANGES];
 };
 
+struct rc_parameters_data {
+	u8 bpp;
+	u8 bpc;
+	struct rc_parameters params;
+};
+
+#define DSC_BPP(bpp)	((bpp) << 4)
+
 /*
  * Selected Rate Control Related Parameter Recommended Values
  * from DSC_v1.11 spec & C Model release: DSC_model_20161212
  */
-static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
+static const struct rc_parameters_data rc_parameters[] = {
 	{
-		/* 6BPP/8BPC */
+		.bpp = DSC_BPP(6), .bpc = 8,
 		{ 768, 15, 6144, 3, 13, 11, 11, {
 			{ 0, 4, 0 }, { 1, 6, -2 }, { 3, 8, -2 }, { 4, 8, -4 },
 			{ 5, 9, -6 }, { 5, 9, -6 }, { 6, 9, -6 }, { 6, 10, -8 },
 			{ 7, 11, -8 }, { 8, 12, -10 }, { 9, 12, -10 }, { 10, 12, -12 },
 			{ 10, 12, -12 }, { 11, 12, -12 }, { 13, 14, -12 }
 			}
-		},
-		/* 6BPP/10BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 10,
 		{ 768, 15, 6144, 7, 17, 15, 15, {
 			{ 0, 8, 0 }, { 3, 10, -2 }, { 7, 12, -2 }, { 8, 12, -4 },
 			{ 9, 13, -6 }, { 9, 13, -6 }, { 10, 13, -6 }, { 10, 14, -8 },
@@ -356,8 +348,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 14, 16, -12 }, { 14, 16, -12 }, { 15, 16, -12 },
 			{ 17, 18, -12 }
 			}
-		},
-		/* 6BPP/12BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 12,
 		{ 768, 15, 6144, 11, 21, 19, 19, {
 			{ 0, 12, 0 }, { 5, 14, -2 }, { 11, 16, -2 }, { 12, 16, -4 },
 			{ 13, 17, -6 }, { 13, 17, -6 }, { 14, 17, -6 }, { 14, 18, -8 },
@@ -365,8 +359,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 18, 20, -12 }, { 18, 20, -12 }, { 19, 20, -12 },
 			{ 21, 22, -12 }
 			}
-		},
-		/* 6BPP/14BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 14,
 		{ 768, 15, 6144, 15, 25, 23, 23, {
 			{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
 			{ 17, 21, -6 }, { 17, 21, -6 }, { 18, 21, -6 }, { 18, 22, -8 },
@@ -374,8 +370,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 22, 24, -12 }, { 22, 24, -12 }, { 23, 24, -12 },
 			{ 25, 26, -12 }
 			}
-		},
-		/* 6BPP/16BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 16,
 		{ 768, 15, 6144, 19, 29, 27, 27, {
 			{ 0, 20, 0 }, { 9, 22, -2 }, { 19, 24, -2 }, { 20, 24, -4 },
 			{ 21, 25, -6 }, { 21, 25, -6 }, { 22, 25, -6 }, { 22, 26, -8 },
@@ -383,18 +381,20 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 26, 28, -12 }, { 26, 28, -12 }, { 27, 28, -12 },
 			{ 29, 30, -12 }
 			}
-		},
+		}
 	},
 	{
-		/* 8BPP/8BPC */
+		.bpp = DSC_BPP(8), .bpc = 8,
 		{ 512, 12, 6144, 3, 12, 11, 11, {
 			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
 			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
 			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
 			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
 			}
-		},
-		/* 8BPP/10BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 10,
 		{ 512, 12, 6144, 7, 16, 15, 15, {
 			/*
 			 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
@@ -405,8 +405,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
 			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
 			}
-		},
-		/* 8BPP/12BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 12,
 		{ 512, 12, 6144, 11, 20, 19, 19, {
 			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
 			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
@@ -414,8 +416,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
 			{ 21, 23, -12 }
 			}
-		},
-		/* 8BPP/14BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 14,
 		{ 512, 12, 6144, 15, 24, 23, 23, {
 			{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
 			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
@@ -423,8 +427,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
 			{ 24, 25, -12 }
 			}
-		},
-		/* 8BPP/16BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 16,
 		{ 512, 12, 6144, 19, 28, 27, 27, {
 			{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
 			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
@@ -432,26 +438,30 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
 			{ 28, 29, -12 }
 			}
-		},
+		}
 	},
 	{
-		/* 10BPP/8BPC */
+		.bpp = DSC_BPP(10), .bpc = 8,
 		{ 410, 15, 5632, 3, 12, 11, 11, {
 			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
 			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
 			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
 			{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
 			}
-		},
-		/* 10BPP/10BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 10,
 		{ 410, 15, 5632, 7, 16, 15, 15, {
 			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
 			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
 			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
 			{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
 			}
-		},
-		/* 10BPP/12BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 12,
 		{ 410, 15, 5632, 11, 20, 19, 19, {
 			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
 			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
@@ -459,8 +469,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
 			{ 19, 20, -12 }
 			}
-		},
-		/* 10BPP/14BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 14,
 		{ 410, 15, 5632, 15, 24, 23, 23, {
 			{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
 			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
@@ -468,8 +480,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
 			{ 23, 24, -12 }
 			}
-		},
-		/* 10BPP/16BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 16,
 		{ 410, 15, 5632, 19, 28, 27, 27, {
 			{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
 			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
@@ -477,26 +491,30 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
 			{ 27, 28, -12 }
 			}
-		},
+		}
 	},
 	{
-		/* 12BPP/8BPC */
+		.bpp = DSC_BPP(12), .bpc = 8,
 		{ 341, 15, 2048, 3, 12, 11, 11, {
 			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
 			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
 			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
 			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
 			}
-		},
-		/* 12BPP/10BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 10,
 		{ 341, 15, 2048, 7, 16, 15, 15, {
 			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
 			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
 			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
 			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
 			}
-		},
-		/* 12BPP/12BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 12,
 		{ 341, 15, 2048, 11, 20, 19, 19, {
 			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
 			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
@@ -504,8 +522,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
 			{ 21, 23, -12 }
 			}
-		},
-		/* 12BPP/14BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 14,
 		{ 341, 15, 2048, 15, 24, 23, 23, {
 			{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
 			{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
@@ -513,8 +533,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
 			{ 22, 23, -12 }
 			}
-		},
-		/* 12BPP/16BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(12), .bpc = 16,
 		{ 341, 15, 2048, 19, 28, 27, 27, {
 			{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
 			{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
@@ -522,26 +544,30 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
 			{ 26, 27, -12 }
 			}
-		},
+		}
 	},
 	{
-		/* 15BPP/8BPC */
+		.bpp = DSC_BPP(15), .bpc = 8,
 		{ 273, 15, 2048, 3, 12, 11, 11, {
 			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
 			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
 			{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
 			{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
 			}
-		},
-		/* 15BPP/10BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 10,
 		{ 273, 15, 2048, 7, 16, 15, 15, {
 			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
 			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
 			{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
 			{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
 			}
-		},
-		/* 15BPP/12BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 12,
 		{ 273, 15, 2048, 11, 20, 19, 19, {
 			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
 			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
@@ -549,8 +575,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
 			{ 16, 17, -12 }
 			}
-		},
-		/* 15BPP/14BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 14,
 		{ 273, 15, 2048, 15, 24, 23, 23, {
 			{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
 			{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
@@ -558,8 +586,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
 			{ 20, 21, -12 }
 			}
-		},
-		/* 15BPP/16BPC */
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 16,
 		{ 273, 15, 2048, 19, 28, 27, 27, {
 			{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
 			{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
@@ -568,59 +598,21 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 			{ 24, 25, -12 }
 			}
 		}
-	}
+	},
+	{ /* sentinel */ }
 };
 
-static int get_row_index_for_rc_params(u16 compressed_bpp)
-{
-	switch (compressed_bpp) {
-	case 6:
-		return ROW_INDEX_6BPP;
-	case 8:
-		return ROW_INDEX_8BPP;
-	case 10:
-		return ROW_INDEX_10BPP;
-	case 12:
-		return ROW_INDEX_12BPP;
-	case 15:
-		return ROW_INDEX_15BPP;
-	default:
-		return -EINVAL;
-	}
-}
-
-static int get_column_index_for_rc_params(u8 bits_per_component)
-{
-	switch (bits_per_component) {
-	case 8:
-		return COLUMN_INDEX_8BPC;
-	case 10:
-		return COLUMN_INDEX_10BPC;
-	case 12:
-		return COLUMN_INDEX_12BPC;
-	case 14:
-		return COLUMN_INDEX_14BPC;
-	case 16:
-		return COLUMN_INDEX_16BPC;
-	default:
-		return -EINVAL;
-	}
-}
-
-static const struct rc_parameters *get_rc_params(u16 compressed_bpp,
+static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
 						 u8 bits_per_component)
 {
-	int row_index, column_index;
-
-	row_index = get_row_index_for_rc_params(compressed_bpp);
-	if (row_index < 0)
-		return NULL;
+	int i;
 
-	column_index = get_column_index_for_rc_params(bits_per_component);
-	if (column_index < 0)
-		return NULL;
+	for (i = 0; rc_parameters[i].bpp; i++)
+		if (rc_parameters[i].bpp == dsc_bpp &&
+		    rc_parameters[i].bpc == bits_per_component)
+			return &rc_parameters[i].params;
 
-	return &rc_parameters[row_index][column_index];
+	return NULL;
 }
 
 /**
@@ -642,11 +634,7 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
 			 !vdsc_cfg->bits_per_component))
 		return -EINVAL;
 
-	/* fractional BPP is not supported */
-	if (vdsc_cfg->bits_per_pixel & 0xf)
-		return -EINVAL;
-
-	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel >> 4,
+	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel,
 				  vdsc_cfg->bits_per_component);
 	if (!rc_params)
 		return -EINVAL;
-- 
2.39.2

