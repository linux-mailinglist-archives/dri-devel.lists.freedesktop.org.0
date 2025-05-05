Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1CAA8A35
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B90010E23B;
	Mon,  5 May 2025 00:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo2sEw2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892DA10E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MPkUx005822
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=; b=Mo2sEw2Z7bVvXTJd
 Okv6W6bM4rmdKV0ks2shTdfFmmSMhuz12Hv2wMT+W7FcA6GOWSik4QlGudbf9TnN
 OXnRX0xnyLtCNKx/OBZimZy3bQ55AIHZMNafJ77/xrd7uVMgqeITFveG+C2QMilC
 gd7wnO88dh6tYFO60Al6q6eELAs7Bg0yFiDDZw1EVzyAtYWP9UBZhVxPzhogi+gK
 0zmuKqMQ9vs0VUlE4bKYgGBbHODwpFHQ96ASAc3jHEEVJgfuT4PstEdZgy9t1HG2
 7sqQ/yuZiI2bmwhFAhNlqEmS9Ln3YJ3uVc68VwjnUsVOr6xfvS1KWiZpTwPeZyy7
 uey8eg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xss59k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c77aff78so412374885a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404124; x=1747008924;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=;
 b=VSD8Cw1z7eydhQUITXqOAPCydGlsFet6c1/7XoZ0HAFDLc0ftcnwrX5/P/orGorhy+
 2PxZYIURgdrphoqRzNn3MWfxC0o7UUC7e39SCcG2YwvopRktc6gekNKOYpNdeb+TZUdm
 qodSy9UD7AvIkgl4RRJOrrA3FJRMAfLadMJh+1E8seWKo7vbdwGCh6BK7HlKDS+tgoNO
 9IYzsDU1h5P0oJERQ2TO0P0Bf/OYtM53CCHDUBzjc46Ne7XA+FGqf6SkDu36KWhDWQbd
 roFdiFvEdOCQm8rTnvTvC+JjLF1cQNPB+UFNBCqKKZKz0qP2qNy2yGEUfyHlpZY2hzQO
 klbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhgZZNIghzPQsSdc91gvzN+qdd7dsdQYb72j71ewtB8Yu5F2euKfOKktz5PPYKq5CHeDw6OvkOVtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvFq9qvG9cfkiU8LWA+hOEAdSDqyAGD7/0+C6Oql85lwcWDvB4
 71wdTnGnIg3u9vbX4rOgzl/JswD8on/wzV8najBRwvm5Cq0wifAO2xi6+/XPeHwCLpKifqa1aof
 uzLlnU91p17/LHrfsxMl4x70lYeykn7bvh3+W4KL3HWd83M8TeQU/67JiHBjwqF/HI5A=
X-Gm-Gg: ASbGncu0AABGloxl4aCVwoLPUdwf5WlafPpqBJ1q3rxTJeqe47e2+xMBcRYh4ueQP5c
 Wg3QFgb8Jd0DzMocCYs1tVZVzVIUOTFsz/VHHd1Yv3jYQxZ0yezqv2k92Rx63EUofwNiSPgkM9W
 gQIB7J7c4SEJIAgy7JPy6xExirkfsbppjhQ0rsfZtKDO5IpLaH3tN/6f9YXGrkUNDbvpq+X/ggi
 P16qHuZ/4pAvfVtw7XwnkNE/AOfmXuum6v7tUrSe7+BfTJoI2JzqSukgkb6zZLpBIY5D5qXMu1i
 avb4jQL7Iv4Tv0/+aJiZeF2IkPYfZkHKTIjlgxEvx1BlfN3Mb2VwQjNEPJiy51visX1xsNmoLcO
 qcXMo1cvTCggbzYl4maPASPin
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id
 af79cd13be357-7cae3aa39bcmr693001785a.26.1746404124153; 
 Sun, 04 May 2025 17:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB8NTXM8sLgxQ5EDQiBqnHjvBehzk0c2YXdh0OUwFkg8Bd4jMJXvp8mozV1nZ8OQOYX3W3Jw==
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id
 af79cd13be357-7cae3aa39bcmr692997185a.26.1746404123665; 
 Sun, 04 May 2025 17:15:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:55 +0300
Subject: [PATCH v5 11/13] drm/msm/hdmi: expand the HDMI_CFG macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-11-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7KB7IcHxi0VqX9I5ufq901Xoeq2I7R2imjBgnmx5DoY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4YE099AvsjXwWoLAwuWa7JorxAvWKQiHmbIEXFrqcPSa
 w+U1eZ3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAii6o4GPpeW2a/vS/6uk9U
 Ke9z+qI9/16cupf4P1fU+l7I3hldCjkbE1ZI3j75gdlvod1S/zuJQrMyyr0XdM9KO/Tce9IBgf0
 a06rEpnGW7d71VuiiNeNS9xP+5TGf+Rca20dZK7Q7/np177vE+Wlrpi7Xl+MxtuOTW91ar/fLRf
 HJs9qmVDlT7W38Jtuus5mom6QtXrU7hGd1rjHzNiUl5/wd1Qv/tDbn/NN4fkj235TIj8IxUVnlC
 WGvGKvtnp06/cCqOWq6ebAla19Wthd33IQjn0OX3v//WiB9O4NH4dHClAmLn3QdUlXh+O6xT/LJ
 8twS1/D3JwUSpYPetP/XuPqpxHD1p7QNpfv4LZRTQ60UAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YgbrrucMPrOV9E_IyMtzJrmxSUALfbFv
X-Proofpoint-ORIG-GUID: YgbrrucMPrOV9E_IyMtzJrmxSUALfbFv
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6818031f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Pd00KUci3bVIrXXMz04A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXxPP9GgOpSYmY
 KFPducYtjYTzMEzW7cJ0syHe9G7219UUfM/GrXXJcnNe95KHco4W3RL5FEdg9Px43Bt040XVaoQ
 lKYD/jnWfKFpHvCehydRWUCiV0DR9O+f4UyOBuxypFDVmwZKJ3ENVEWyHfJSm5rGGEyrd/bq0Fn
 kp5nIgE4wzVEV+MRyjSZ2C7iNnEIgZknMJWsghDbuAXKxoFz5dJAJJcYI5Rt4t71S33RaeezvB8
 0vZyCnkkc1eJMMj76QiCql5My91fMMKW9g8mZBeH/ob3gugAZX99F9ooGY0uY39mtvBSBGyMOki
 Ah//6yWxbElfCFrv8KB2nbtlYNndjaX4lCCt2OpYJh3t0hHFstsUwT1O/loZySoe4t6JdNC6oeO
 8aUwda7aV86zCQSL2tKzUJMuxX5x5Qq3Hd1+fb0zlb8uydEzSoW7pebaxYlT0UCi51F8f+pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000
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

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8e6e3e6a04bd2d86bcbd23c110f3533f56c17887..3d10fe6f8545198365a047b2f5652081703101aa 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -221,24 +221,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a28437beb1574553c1dc00a0c693b390389353e0..fb64652162b6c5e6e2fe3357b89c40e2a28aa47e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -86,7 +86,7 @@ struct hdmi_platform_config {
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.5

