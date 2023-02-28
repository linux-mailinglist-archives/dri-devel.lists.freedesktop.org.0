Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E06A584F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BD010E698;
	Tue, 28 Feb 2023 11:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7510E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:49 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g17so12734789lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1V419a2+693FijZUUggU1L8f7XfNMxIn7m9KZRXZJ2I=;
 b=NEAjhimBgLthYf/pARVQSdYqj7CyX80epPYHzWY/EcpcFzJoz48lnK6sIQGsWCQEva
 4Op4Md5H5AohMzjml5tPjvsWRckcX1j9HUkzVIXSTT5C2dadtY3T6mhIa5Yp0AIvX+BQ
 aDdOOQiby7b/aHkSbj7BXTs+tBhij4xY7+p5YTUQj5R4KK/c5nbR2lEba1D9i6RotOtz
 QBs1UPf7u4YtHx92yTNqio3fupPYvEQFy4/arBaHcHs3FJZV/erLh98IopC2FZg+/f10
 3EG8xb+ldgqdEE7bWswgZ/mEgxvdB3Q/QSg9l+yT16C+yNbMcEB3Xn6aZY8Z0HuA2RO1
 d+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1V419a2+693FijZUUggU1L8f7XfNMxIn7m9KZRXZJ2I=;
 b=DnZC3e6pmuJqX9ICeKoX0iWC4Y6RNwlxQG2PPdg676A/cdSOKhErRF41cak4u/xbXu
 yyo1veNbbsfluDgkxaNNWBzSTm/JaZtHyBw0t4Qukxa8WAfLjadRFj6NeiHZhkKVv1bz
 v0pM3D/HIoYwKBinuwdpdQowbbuPv9ryY8dUg4mZNYXJ8n8yT7x5pVFBlvvyE6u24SkN
 LKsW6cTM1F1TtD8PrINKk6LHyDSHxobqAFYDpznUXlDgxD2N2pFYkTkzbaEtzqMCS/Xp
 yrFZSZCrlcFvK3EfyRSmIoBMajpx0rTw06j9O40gpCKaOpJswOm4zOvNXyQC8KoPOiDh
 0ZTA==
X-Gm-Message-State: AO0yUKXQ11cJegi8sNlc6WkvNYZCXsCpHRCIfI0bC+scFqrRR1VKx2Me
 4SOCJ/kyK5OYqrRkq5643zUYueAkEmaun8DD
X-Google-Smtp-Source: AK7set85FgaOs1Qgd2X0h/9R5fqWgnikQJ8cJ7zgDeM/YvZApkZ+dDjFh3bgX0f3hZKEMBMMui6fug==
X-Received: by 2002:ac2:598b:0:b0:4dd:99e1:4668 with SMTP id
 w11-20020ac2598b000000b004dd99e14668mr556812lfn.3.1677584027868; 
 Tue, 28 Feb 2023 03:33:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 05/10] drm/display/dsc: use flat array for rc_parameters lookup
Date: Tue, 28 Feb 2023 13:33:37 +0200
Message-Id: <20230228113342.2051425-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Next commits are going to add support for additional RC parameter lookup
tables. These tables are going to use different bpp/bpc combinations,
thus it makes little sense to keep the 2d array for RC parameters.
Switch to using the flat array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 188 +++++++++++------------
 1 file changed, 88 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index deaa84722bd4..a6d11f474656 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -307,24 +307,6 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
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
@@ -336,12 +318,20 @@ struct rc_parameters {
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
-{
+static const struct rc_parameters_data rc_parameters[] = {
+{ DSC_BPP(6), 8,
 	/* 6BPP/8BPC */
 	{ 768, 15, 6144, 3, 13, 11, 11, {
 		{ 0, 4, 0 }, { 1, 6, -2 }, { 3, 8, -2 }, { 4, 8, -4 },
@@ -349,7 +339,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 7, 11, -8 }, { 8, 12, -10 }, { 9, 12, -10 }, { 10, 12, -12 },
 		{ 10, 12, -12 }, { 11, 12, -12 }, { 13, 14, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(6), 10,
 	/* 6BPP/10BPC */
 	{ 768, 15, 6144, 7, 17, 15, 15, {
 		{ 0, 8, 0 }, { 3, 10, -2 }, { 7, 12, -2 }, { 8, 12, -4 },
@@ -358,7 +350,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 14, 16, -12 }, { 14, 16, -12 }, { 15, 16, -12 },
 		{ 17, 18, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(6), 12,
 	/* 6BPP/12BPC */
 	{ 768, 15, 6144, 11, 21, 19, 19, {
 		{ 0, 12, 0 }, { 5, 14, -2 }, { 11, 16, -2 }, { 12, 16, -4 },
@@ -367,7 +361,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 18, 20, -12 }, { 18, 20, -12 }, { 19, 20, -12 },
 		{ 21, 22, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(6), 14,
 	/* 6BPP/14BPC */
 	{ 768, 15, 6144, 15, 25, 23, 23, {
 		{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
@@ -376,7 +372,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 22, 24, -12 }, { 22, 24, -12 }, { 23, 24, -12 },
 		{ 25, 26, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(6), 16,
 	/* 6BPP/16BPC */
 	{ 768, 15, 6144, 19, 29, 27, 27, {
 		{ 0, 20, 0 }, { 9, 22, -2 }, { 19, 24, -2 }, { 20, 24, -4 },
@@ -385,9 +383,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 26, 28, -12 }, { 26, 28, -12 }, { 27, 28, -12 },
 		{ 29, 30, -12 }
 		}
-	},
+	}
 },
-{
+{ DSC_BPP(8), 8,
 	/* 8BPP/8BPC */
 	{ 512, 12, 6144, 3, 12, 11, 11, {
 		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
@@ -395,7 +393,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
 		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(8), 10,
 	/* 8BPP/10BPC */
 	{ 512, 12, 6144, 7, 16, 15, 15, {
 		/*
@@ -407,7 +407,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
 		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(8), 12,
 	/* 8BPP/12BPC */
 	{ 512, 12, 6144, 11, 20, 19, 19, {
 		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
@@ -416,7 +418,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
 		{ 21, 23, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(8), 14,
 	/* 8BPP/14BPC */
 	{ 512, 12, 6144, 15, 24, 23, 23, {
 		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
@@ -425,7 +429,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
 		{ 24, 25, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(8), 16,
 	/* 8BPP/16BPC */
 	{ 512, 12, 6144, 19, 28, 27, 27, {
 		{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
@@ -434,9 +440,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
 		{ 28, 29, -12 }
 		}
-	},
+	}
 },
-{
+{ DSC_BPP(10), 8,
 	/* 10BPP/8BPC */
 	{ 410, 15, 5632, 3, 12, 11, 11, {
 		{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
@@ -444,7 +450,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
 		{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(10), 10,
 	/* 10BPP/10BPC */
 	{ 410, 15, 5632, 7, 16, 15, 15, {
 		{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
@@ -452,7 +460,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
 		{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(10), 12,
 	/* 10BPP/12BPC */
 	{ 410, 15, 5632, 11, 20, 19, 19, {
 		{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
@@ -461,7 +471,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
 		{ 19, 20, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(10), 14,
 	/* 10BPP/14BPC */
 	{ 410, 15, 5632, 15, 24, 23, 23, {
 		{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
@@ -470,7 +482,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
 		{ 23, 24, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(10), 16,
 	/* 10BPP/16BPC */
 	{ 410, 15, 5632, 19, 28, 27, 27, {
 		{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
@@ -479,9 +493,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
 		{ 27, 28, -12 }
 		}
-	},
+	}
 },
-{
+{ DSC_BPP(12), 8,
 	/* 12BPP/8BPC */
 	{ 341, 15, 2048, 3, 12, 11, 11, {
 		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
@@ -489,7 +503,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
 		{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(12), 10,
 	/* 12BPP/10BPC */
 	{ 341, 15, 2048, 7, 16, 15, 15, {
 		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
@@ -497,7 +513,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
 		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(12), 12,
 	/* 12BPP/12BPC */
 	{ 341, 15, 2048, 11, 20, 19, 19, {
 		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
@@ -506,7 +524,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
 		{ 21, 23, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(12), 14,
 	/* 12BPP/14BPC */
 	{ 341, 15, 2048, 15, 24, 23, 23, {
 		{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
@@ -515,7 +535,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
 		{ 22, 23, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(12), 16,
 	/* 12BPP/16BPC */
 	{ 341, 15, 2048, 19, 28, 27, 27, {
 		{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
@@ -524,9 +546,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
 		{ 26, 27, -12 }
 		}
-	},
+	}
 },
-{
+{ DSC_BPP(15), 8,
 	/* 15BPP/8BPC */
 	{ 273, 15, 2048, 3, 12, 11, 11, {
 		{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
@@ -534,7 +556,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
 		{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(15), 10,
 	/* 15BPP/10BPC */
 	{ 273, 15, 2048, 7, 16, 15, 15, {
 		{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
@@ -542,7 +566,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
 		{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(15), 12,
 	/* 15BPP/12BPC */
 	{ 273, 15, 2048, 11, 20, 19, 19, {
 		{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
@@ -551,7 +577,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
 		{ 16, 17, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(15), 14,
 	/* 15BPP/14BPC */
 	{ 273, 15, 2048, 15, 24, 23, 23, {
 		{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
@@ -560,7 +588,9 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
 		{ 20, 21, -12 }
 		}
-	},
+	}
+},
+{ DSC_BPP(15), 16,
 	/* 15BPP/16BPC */
 	{ 273, 15, 2048, 19, 28, 27, 27, {
 		{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
@@ -570,59 +600,21 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		{ 24, 25, -12 }
 		}
 	}
-}
+},
+{ /* sentinel */ }
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
@@ -636,11 +628,7 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
 	const struct rc_parameters *rc_params;
 	int i;
 
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

