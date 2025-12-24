Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E9CDCB7B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB6510FE6B;
	Wed, 24 Dec 2025 15:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKYNX0AA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a16Z6HzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5A310FE68
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO9ElcK702677
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NVYEvHPpjNPnJ/97y4IcMdENVkXk7RwKRB3tv1Ziw6M=; b=XKYNX0AANqzaR5GG
 A8ixyJSGTEFHwviuSWXkHY50HabiLuXY8P7tOZ3ITgqgbK4vK/DUNjNcQg0vl/Vc
 jVDdjYy9T/xEuj0VLj1bIzrrMN5/BMIkCWQrqyJZzZk6EyDc9Hzvv1LnoeHF3Jz0
 hoO00chezQwrD/mvHLQKeKd2Ncbgw4ogFoSfmubteVhJqnPKpS0tq0kt6/W21NYX
 Snxp/8g7Vyk7zWj/XHJ5LPKmt3VvwHXJYCIl9pdmgM8WXwtWULeFaceF3Ujk0Foz
 B1E4DQUamjqmW4XeGjn2t+xFnhWLBV4lDX/ZsWbBo0f0k7+QHJZhIYXNvBtcVGg+
 NZd4/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jv2nk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed74e6c468so84892911cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590435; x=1767195235;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NVYEvHPpjNPnJ/97y4IcMdENVkXk7RwKRB3tv1Ziw6M=;
 b=a16Z6HzM/YsXoO7S2jHYeBA2WvLn6Ekat5pDhrWIOHfzO6xNPQXHag2WRh+eIFBc8N
 9/rzAnP7R5CPfDyXCv8NsZ7FPRVvHf/ht9i4vpNCfFb3TY2tmzpm5tHuy0TzgdKRWa8W
 Lla4nHNXdylozN0uedhRTAfvf4CNxXa29BnigRveFuQJLbCDBsU0VLOk3NiSut94/zAD
 VGsjw5G2eDvz9Y8x8R55PIUbo9zmKiD2uVToRkczVy5dNIvC1y7qSsi34fynu+YplTA7
 gMduYFDTLuYINy4NzwKWb/qef7CUxGvs78aVj+jrOmuI9Gp67xSTMnldcbM6DT3g4Y5J
 IFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590435; x=1767195235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NVYEvHPpjNPnJ/97y4IcMdENVkXk7RwKRB3tv1Ziw6M=;
 b=DCKMtqzNPfcRkqsqoeiD0PvWGVd2PRONs2dw6JwhtutO0tZhoJEbhDgkvhQp6rViJR
 I32uPVOQ63moHUclWIYUUppwl77G/GCfnNStCrksb2ju348kbtJkzKwvgNR1NXRoksZg
 0o5lYjW4AwCK69jyF6OdptuoLTqZ8MSt4sDm6H7BuuveTg5ltltIfH724LpszIzCOgnH
 D21aayZ8wHhhxGdXvFKzNHvDQeA+OA0OSOINn3FC7SHq55aABpQI0676Vraq9Pfx4BTJ
 H+m3B/eFOAvNHKK+s3MkSXS30PWwxTBtlenLqn5HaZ6ySJ4rW9CzQH9pjm42fwV7zWLe
 BYeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWydXYPCNUYfhoZjYpda3NcEemcB8X2X1LNeB+SeEZJaN8dbgk1DJ7X2Nm+WKqfE0ccCJF6fFo4tXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYw/UWJtwqbT8GYQrY37xMs0GdVptfIE2cSDkuaQKjDIebfavK
 5i4Jnx6Dn25MuOw8KUi5PtKgwST+iMUzVgKdk96XgJwOnXzK9Q39t6g3KQmS9cz2jXQIPXkT9MC
 dBGgjwJnxXFFFZo8qBgK6rl5R4Cp7lDORqMMMDB6WT6XCkjFHN9LdfXOa0/6oFSrSdxCrfNw=
X-Gm-Gg: AY/fxX7WnybZvI2CsL24hxcOS1UFF9sVZXf7Z4d8VNWOaXpOXqVID23ZkXtmxn1rvxa
 RdVJ0kVZNmLDPaL72DF3qdaPy8Eo42quvz30ldwBuNCL0R1V64uo3OXLX2zd580mQyrcEhPuobl
 WUN0y3dytGPGAPTRBRsvcr2MtSFTJNTHftf5FfdOZufxLfhWXd+KKiZPIuXUnOe655rvXSg3LEw
 Q+j3IHXQGTHMOyryFJsM2LDXrE/gacG+PKFQqLMu1JtUzpyqCKf2MedCJ8HNZXVkb6qCDuG3l+u
 IIuw/+gDW9+p0OMe+LV0ms9yButK+YviXTBW/Oi1Ao3KK4rCX7eIhztFI4u+nDdDOP1GFZ72SNB
 mWGSsOZSc0vzojz1GdzvFizy9bjddV7OwL8b8Av6oqhv/Oc6Xnzik7ERjEW+wxlyIkRNM3SKWdH
 4fzeMcK0rbjicmilu3brrwi7I=
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id
 d75a77b69052e-4f4abca88f1mr239988801cf.9.1766590434550; 
 Wed, 24 Dec 2025 07:33:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMh2InLsBJ3PDwAeyZtMXndummWGCICu2ZS5MEZy6n7Ac/XW5cgl9CPHDP+OhV1ueiCjZqAg==
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id
 d75a77b69052e-4f4abca88f1mr239988291cf.9.1766590434076; 
 Wed, 24 Dec 2025 07:33:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:33:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:33:50 +0200
Subject: [PATCH v4 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-intf-fix-wd-v4-2-07a0926fafd2@oss.qualcomm.com>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
In-Reply-To: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KHeJcguGLGLj/H9CNx6XTMl2RY9vGrzpZXAk6Sk28pE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAfenWlB7mdbgojSTyWi3tFT8QYSIuFvaDcg7
 tHGGZlZHECJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwH3gAKCRCLPIo+Aiko
 1WfcCACUSMTTvSD22f+YQotsH8vlks67I2zAzR65rWSDr4eS0L7CEW6MGsjI32Tzq1phjac4SM0
 q7P0lM8H55Y4+uN1cBquSzeKZ7uUjs6TnL0ZgB9LmWvMvZjLAODv1LnTNgYq7SczqeecOS30+DD
 1ijP3beQNJsdvjG4wZwZ0BN3QpyTDyRpCOgvStt5QWglACM2zsbT4/fyILMizRO8M+LZrJtMecp
 Vfk3EJjK3/jTISo2FPX23/xZuroN2jHRABOhH8fT8IPTjxmnKbgg6NmPaNgtlMO7PENGfxvUJ7b
 0Jgfjij/vhmZJHUpIUPqBt893DBcNBUCE+CzyiWlCzo3pJnQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfXzlHVogl71krQ
 yk8iO+PXPyAuLVFiGAETrJMsXQLwDCr55aqheL1mf6FZcJj4X+xZkooB9o5EjYaLbiAvUyVKzPR
 LJ9gqaHgaF8JrXbG1RlRfWYykScV6uOuNvpI1jkJVxTIucmk5VTpsVyKhwWeGEcC+CaiEq22gT8
 tA3yLiFWsMB04w1DfCHny98j68j7WoWPgMfKcYVolAoNUKyIBVnOPsLaliGghzMP6BXvaYZLdFM
 SrkxEvEsVr9Sa3ySQ1Vtd2YaOGpUAXDEMGTF3GLEFawGLJuwWX+xTt837UH+4SdjDrfPFDTXgs7
 oPthErqtYzAmfWCo038pw43ES1U08hGG+4WxOIsJECfj2W2jhtYyDUePKHZVXTFKN1w6BrPzRGU
 vXaPVQJsHFr3Znu+fsIx+0JsC417SqA8DCxNbbq6n1ZeCACx7dm69O065Z5Z8GA2fc8yeFOWiAC
 YHmT4ybSjQykH+prhsg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694c07e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGfW19dKLGIg-ZbO5EIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: SZh7KMFJc_TQe1jFj-Fs1P84LkWa610J
X-Proofpoint-ORIG-GUID: SZh7KMFJc_TQe1jFj-Fs1P84LkWa610J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240137
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

Since DPU 8.x Watchdog timer settings were moved from the TOP to the
INTF block. Support programming the timer in the INTF block.

Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0482b2bb5a9e..0e53d9869ae9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -792,7 +792,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 
 		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
 			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-							 vsync_cfg.vsync_source);
+							 &vsync_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a80ac82a9625..7967d9bd2f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -67,6 +67,10 @@
 #define INTF_MISR_CTRL                  0x180
 #define INTF_MISR_SIGNATURE             0x184
 
+#define INTF_WD_TIMER_0_CTL		0x230
+#define INTF_WD_TIMER_0_CTL2		0x234
+#define INTF_WD_TIMER_0_LOAD_VALUE	0x238
+
 #define INTF_MUX                        0x25C
 #define INTF_STATUS                     0x26C
 #define INTF_AVR_CONTROL                0x270
@@ -475,7 +479,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-				  enum dpu_vsync_source vsync_source)
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -484,7 +488,42 @@ static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
 
 	c = &intf->hw;
 
-	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
+	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (cfg->vsync_source & 0xf));
+}
+
+static void dpu_hw_intf_vsync_sel_v8(struct dpu_hw_intf *intf,
+				  struct dpu_vsync_source_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
+	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
+	    cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_1) {
+		pr_warn_once("DPU 8.x supports only GPIOs and timer0 as TE sources\n");
+		return;
+	}
+
+	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
+		u32 reg;
+
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
+			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
+
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
+		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
+		reg |= BIT(8);		/* enable heartbeat timer */
+		reg |= BIT(0);		/* enable WD timer */
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL2, reg);
+
+		/* make sure that timers are enabled/disabled for vsync state */
+		wmb();
+	}
+
+	dpu_hw_intf_vsync_sel(intf, cfg);
 }
 
 static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
@@ -598,7 +637,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
+		if (mdss_rev->core_major_ver >= 8)
+			c->ops.vsync_sel = dpu_hw_intf_vsync_sel_v8;
+		else
+			c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
 		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f31067a9aaf1..e84ab849d71a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -12,6 +12,7 @@
 #include "dpu_hw_util.h"
 
 struct dpu_hw_intf;
+struct dpu_vsync_source_cfg;
 
 /* intf timing settings */
 struct dpu_hw_intf_timing_params {
@@ -107,7 +108,7 @@ struct dpu_hw_intf_ops {
 
 	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
 
-	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
+	void (*vsync_sel)(struct dpu_hw_intf *intf, struct dpu_vsync_source_cfg *cfg);
 
 	/**
 	 * Disable autorefresh if enabled
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 96dc10589bee..1ebd75d4f9be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -22,13 +22,6 @@
 #define TRAFFIC_SHAPER_WR_CLIENT(num)     (0x060 + (num * 4))
 #define TRAFFIC_SHAPER_FIXPOINT_FACTOR    4
 
-#define MDP_TICK_COUNT                    16
-#define XO_CLK_RATE                       19200
-#define MS_TICKS_IN_SEC                   1000
-
-#define CALCULATE_WD_LOAD_VALUE(fps) \
-	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
-
 static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 		struct split_pipe_cfg *cfg)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 67b08e99335d..6fe65bc3bff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,6 +21,13 @@
 
 #define TO_S15D16(_x_)((_x_) << 7)
 
+#define MDP_TICK_COUNT                    16
+#define XO_CLK_RATE                       19200
+#define MS_TICKS_IN_SEC                   1000
+
+#define CALCULATE_WD_LOAD_VALUE(fps) \
+	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
+
 extern const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L;
 extern const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L;
 extern const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l;

-- 
2.47.3

