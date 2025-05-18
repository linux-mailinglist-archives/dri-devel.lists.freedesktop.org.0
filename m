Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46DABAFEB
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 13:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D408810E2C3;
	Sun, 18 May 2025 11:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o70IOARZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0DA10E2BA
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4kuH3029016
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 POuM4QyYBSzs8lEBebuLF9SmwUjGap5CnJ381Bf1bNg=; b=o70IOARZox1upD7F
 wz5ZSYxIJPTHb9+qH1fLSW+a2jNcfX/gBLk2N76zG9QlywpWXcp8zGhhNHg2InOP
 QPRX73DCu7o6vD39EDIg9ob1wBy7rRmlnrnXhCac3nHsZaLvJ7UeMLpltdyymKtZ
 RmexzfPkXb+8ZyRIZF4hRJvmryBkCnOD69qX0xv+jcfm5Z/wIDXYVURfY7BZQC+y
 stLllX9ydvN6E7cxcP9NCofaYSTOjpwqPKmPfW+YfYMzYnMu+WoL0zDPYH+z3uxE
 5tkU7R05GYcfvbTkNZ6d3dO9imoJjb2TE4k+HgG8I/+mkVLAxUqMFVlkLaWGAzCh
 Hz9eDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhwme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8d4461e7bso2582316d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 04:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567306; x=1748172106;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POuM4QyYBSzs8lEBebuLF9SmwUjGap5CnJ381Bf1bNg=;
 b=rMVjpRCy8zoKDCKBra04leSWnPw/E3ewGQWO5wxWq03iramM+LBkRqa9kuHXMENrpy
 Ko17XLfUK7w4gzHbXqdOufvrehzia5TV+1XCkQPMzSufMaOn/0dHTxGqroD7MabVY6WW
 Gr2jpbaMvcnr434btgEnFDIAfkYxIiKyGIewB2yC3tzw/dT9DjpfDJW2XXKCDRkMvjyP
 EcRNq9cNUH/eUQjl6hy/I/8knkbkzX1aRI749eHkWHhrNUWf8GH2ThefrYUgDtds5W/O
 p5SGe4HciU+Q5vxCa9ZBNa08WTIojMPFN8SYGpoqLJ7UwuvwFCuk8kr5gSMY54Ps8xMc
 xfmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCQo8ANVkRyPQ8hvQRSHUBz/SdPjURAgYLsajwGRj9XL7iv/MllSUpudONKoJsErjG5SP1DP7VCGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0WWBuqNyLIy8Kvo2FZHJ8VRBEniExLxJ1wXDSKsQbvCmJNQur
 ulqc9P9KA4G9MTVJYr2yeMBgb9vuyf+pEwwrTNHetLXBE5Gz0xp9m6mr8O4x6AQ2vGJjB0c4ZFU
 ua4zq/EaDQ9/G0vTuRsY0j9o2ky7HMrOUj1GHc45Ayl2gmMnZXlmhc6pG0GOxMVyoGFYsHVuf0m
 FUctY=
X-Gm-Gg: ASbGnctv+xrWmoHNtcUfg+hUZmwOhsoYViNrKOtcGwR9OuTHyhSDm6CR+gRtA/DQZQw
 h13+CKXunMRuVG20gnQfiBK4ox6BJDK5bcAWogGZXMWAI+0gZ5SRf0JNYfiMVTXos45o07G3r5l
 niy8RDRcP2l0W+vQtBjF22n1fgqbK5o6qfrELHHnJXAnqPdf1rFJilLJFuWSMGfzpzUyOpLznll
 7FrRbpd5HstS8KmmkviH9RUmcDUfSxywWtzd1CtZRxhY7jHj1Jvrk1WSP0GlFsKfiBgbXEIvP2s
 4+7CUj1UoKFRp5TeEDsSQMl5IF/H/tkl822FH5NYBJxYnJslHcJ8hxgSo4VOZ5NJizQj7sM67cz
 SXfR1H0mwI013/AEIiclPylJd
X-Received: by 2002:a05:6214:202e:b0:6f4:c8df:43d2 with SMTP id
 6a1803df08f44-6f8b0935339mr170238446d6.35.1747567305947; 
 Sun, 18 May 2025 04:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4fR2ucbRVFRPSQkbMQXjGJ1Hxtylk9FgYTSGqRkdqAOCHzKlKaMxCW1Vp/0NfYlmM0j4QeA==
X-Received: by 2002:a05:6214:202e:b0:6f4:c8df:43d2 with SMTP id
 6a1803df08f44-6f8b0935339mr170238116d6.35.1747567305572; 
 Sun, 18 May 2025 04:21:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:37 +0300
Subject: [PATCH v6 04/11] drm/msm/dp: move I/O functions to global header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-4-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5605;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7PLWki9dLUTSYTbO8lnYK4VQogj3alhO9C5gmUos+0o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/fx9rbbfR4U36rgYWYAu1S28GUFWgeqdzJ
 +CN5aCZHPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1dWKCACycRH/dlVfJIyp68ot6qbT/rPE5BqvnjGZyMkHzwxgOLy4KeZdr+Uu796aXYGtEgGGrVA
 BvtpQCHIno67+x0FFN88iU82AKZxJ6G0tdYeqWpFmp7Ha42Kqekhg7dp2E6mcpvi75wIZ43B7Dh
 JQFmRc25jJ/6Cbh5mMccbx2r1/XhronxFslkIy1e37JoxNCUfZc2O87fA0MM4NDb/Vfm7DWxEF9
 PDPzRggDOfqbJOm8D8i/ocxSUu6mKPkSDYGgUoLUvLXzdQT1b++KyINPKHyBTwfYi5yJMdRZEkt
 1BymanDBxDfM2qWx/GwD5zJggLmV5StvjxxY0di6oyNjThzn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ym_uMTIXt9hFh512Qlccy6HSvHe3cqBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfXy1uh7Vm3/NVp
 1XzkTY3FLEjMe+A1X5fP4UfJHAs53pvPFEtEKBTNiTv+qE8um/y2yJVsQFSXMQCsgeR96nnyKRb
 bGB6yfHgx6qS/g7n9yq8nvTmCcmUHbXbSNDQX7+8Jv4Og0smVW/yXvXwXNuC1PwTjm7ib4FfRlW
 aZtWpz2QlHfteigCBJeFEd40NWXezoRuWFEZ5kq1b72rUXmfwAxXlc3/YQqeEvn/pi49uKUPeR5
 y9ZHHX2TAKPAhuuQQ0jFJwL2hzI7Ubhs+pq24Y3jOKCXod9h7kZoariOnQ6cCtA/ghQUrBsbGLS
 qSXVzTtZAvE6gWpkvgLBmhB4eKsqD9fD58cAr83KNVWtgTN53OFOQ8VN7FqgUaRiOD+q3hIJcJ7
 0qRGG3R9x2VNGEl5xwFQ5w6gv5fGD0ieL+GxBrA0tdzqPJ496oVLho2zUla/gPvEPZ+/sUUq
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829c2cc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=J6TQEPGwCORx6xcX2JMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ym_uMTIXt9hFh512Qlccy6HSvHe3cqBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180108
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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

