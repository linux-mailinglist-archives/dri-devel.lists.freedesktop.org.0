Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996E4CE8DFF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 08:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C5F10E844;
	Tue, 30 Dec 2025 07:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V89rM2kS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIZ1OdU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4610E842
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU1Kb9k3115933
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F+D4XhZHUVaMEju2IS5PSFW4hWSDl2cHPlefbnaZtT0=; b=V89rM2kS7v1fuYrA
 MkqlJLlJjtn2+ecHwS00KXmQxeUbEl1kE9KgF0/U9tflmVllTL2nZQNmQUFlES+7
 24L/IIOd6aE+lQ7zEpXZdktbpyOVcGXtkrUcn5BQDCTbKUg6QNY0AIAh2ZBINDDG
 Urr0DHlD9tYVLfrjnu3a5EQfhO5EQ4dlO3WgpnK77mVVchwVUvLB5jH4jAlZ9vqe
 25B4a5jdZ10JnMj7tpAlDuxqPawsAQUH0frYAwtSbfvEa1mBmxnAwAdad16MWJ4t
 KKGNRgRIUK8oskX5RNCOKmkd6+OuCI7rRZAsrqEiHVR3gRqtcJzrPRsrx2v+Zb/u
 p/1NmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skh4cg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so271863881cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 23:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767079083; x=1767683883;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F+D4XhZHUVaMEju2IS5PSFW4hWSDl2cHPlefbnaZtT0=;
 b=ZIZ1OdU/KZWmfajX6URYKzkgeEdWFHS3uC2rzG6ZJkizsUQ4WrYMwJFms/iZHylen5
 CYju4ysGG3DtLFelMOEk5ymZ2CH+RN6lvKyhNzI9tHqaFhY69mOuvKdYZ7isCrxdpyHE
 jijY2W3GL64dywTotU58nc7PF+ueVRKZJaCyLRT9w0YOQbLIokkSOY8haykpEwdf9RuM
 gxz8XeyW7xslQsrRehkUKYodHxP2yYd/aotVImpXEGBwJgXQ3jQCsgfZybr1QVzE8F3F
 jjnZmv6KsCLod3p5yBsYbpM0mTURcLnyP6+RG4EeyoCre240CoHubJjjUjq3O3VKu8iL
 agXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767079083; x=1767683883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F+D4XhZHUVaMEju2IS5PSFW4hWSDl2cHPlefbnaZtT0=;
 b=r5mX/KpT6FEYPdCUl5ezpE932bhIVFvkNR+VXg4U6MUB/iKp7nVWpxr41+Ht3Pyuj0
 5VC8zFjGOolSKEffZd8sF4G8TO2vVoirTAsrTPTEYxxG4yi7oB28en7obMG4pXLjna69
 XeWWf6roNYS4lb7FpEtrb2MYeu5dIFaF9/aRqUQ05aXbkpNsvbysqLirR2/HxN81uhJc
 /nL3P1PRnsFFC2nIqRSbBN2KIJH5VH/MwM7IOAzgtnXpa8gpV78pOkRAZfnfYP+aHtjw
 +PdV4NHdbgqA0mEPkHD4VA1I3xlPmAOyrOWtI20RCZmjJsPTCPzNwjTJ2N2LETgDbxao
 xbmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3LmGUW8aEi58G3j6LPmT6G3igwUDIlSFqaNt0Bd7HE2PqDcdB/WeUzc9CfYGfTljvS2WjLMGYkbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn48pUYJdWIn4e2eksEm387Sbw7fPoDxXLIDpWsbx0+gIj3vNg
 VO0CQLUNwXGF+zUC8N2e2pxYA24Vz7iARUf07dnAPanJH4jZa49i/FduBTTbY65e9XQ9pJx37Lg
 /LpFuiAoX5JZpScoNLnR1kCtYlyDCKwx+Ll2JENbBUV7KKj1tqdda0rHATZ3949mwHh/EcRnnXB
 Vofng=
X-Gm-Gg: AY/fxX4kenkbgNMaQLNZHaaVOBK8+RhOlGi5YBq7ThTQr3xMMquq5gBbaWTvGGyErQK
 /WyjqWOxRllk8FjaOF6VHPsA0PEJFjkeIc6JIX3Eqd0vsoQ4BKn3lXvc18K4v9h8HU0f87FyPiM
 ZwZuOPBtacRTOnygV2/god0CXl3XfqZBVZKyiQMJRIzXe8N9q9DZPtpaYv7CuEeEUMIHSjKmVq7
 jviYMCfxaqe77T4YWEFIjoMTKmA5UGmHyhoSQDZiEh4LXUGHJB+jeDtFS5Rcwv4QJNlR4RnwGZj
 jIR6mEVO+RzvTdpEmM7hxbzf+Av+xQ9r+7IGhHQA4FIw2apZRNUjnWQC68HENAudXRcgud41QlM
 UNtpU7rv7AkzHY2XLr+XXnya1zdWE0KVuMSha5y9TjfKU9iDpDsS3oxtNyc/Ql9Q3H5/p+wu1XG
 3m6KeDbjZTFlMlTn7v9LVPFY8=
X-Received: by 2002:ac8:6f0c:0:b0:4ed:8ab:e7aa with SMTP id
 d75a77b69052e-4f4abccf14emr457763191cf.11.1767079082998; 
 Mon, 29 Dec 2025 23:18:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFaJvSyv2J4sH5R2VzNO8GX+fPMJwUSte+MeeSAQ2QvB5gf/gpGeQ0AU7jz52r9OUytBM+2w==
X-Received: by 2002:ac8:6f0c:0:b0:4ed:8ab:e7aa with SMTP id
 d75a77b69052e-4f4abccf14emr457763031cf.11.1767079082561; 
 Mon, 29 Dec 2025 23:18:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 23:18:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 09:17:57 +0200
Subject: [PATCH v6 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-intf-fix-wd-v6-2-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7052;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YDk3hQizRJFfND4exXbw9nbbup2xzJMiVS497+/zF94=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZwzXLOuHkBJa4TZJKZdZcyXtPt3OMlzqp4elr9YeYT2
 va5dlKdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIaBUHwxJO17KVu90MRCcI
 VPkd1u/3kWmV/H+GPfvaa2e/+V8irx/K83u55O80z5IdsmdVkrz7m8We+B/a/cS7kVnncl9fVvR
 /bwGRwnUTYpY+EBC8dbKLwcv8w+wEwRVdX+XfWzot3RLBGnB57rJ5TjzGvTWZb2R+Kfa9cI9O+i
 NkwVl4JEald5+/QJXrbNsSlxVrp/I2ze2blb9hLv/TVtZ/qq1KO8Ibl3/r2yobXuU6g8sg0cQnP
 yxi3b3Xrgl3LrxcqX5FM06gxVn9t2Rc9LTroZLd8dbShofK71g8ePVWmc9V8t5JG37u4vb3Oh94
 Re/OenprSaLuknfK7QuvxE7tZ/v21uVcrFDS4fjfex4CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfX4bELogATY25t
 AQHQq5dG99tzVHrmVIARxNDOUKmg3vpPg06dEU80dyuFu76WiraUZiNezB+QpZeil0+jX5WEEqh
 JAeBhTnW5atpwKOc4ackcIknMetbSKnRuN/O6orffNMyag9J5qDbcAA6ujYUbkPnK67HDLbR6Ox
 6RzdG6E1rPIe8ADguc16gKT574MbH5sT45MtxLFUIWVZ584piPyNdOowmmt82v+not9g3sdzLEf
 98UhH50MvgdLORJ9VX3VWdRgThDUAevOnTWNNj9tnLJmRsjhf4n9qbu2IYnOhOnzfwmPmfk4Pj4
 jOG2jjJOobKOYAuECDtG7R/wS//BlupyZkfooAqLUaWpMO7IwYFDRw2+le6hqnprV488RHZNS/0
 I5yfbugOKx3F9BzZzm2AHl2yn/AWeaAWQAWrB79Yc1FahAhiqDBZhjpniI8htto3PPfUXsxBqbC
 zS8B+QN4QI/ogD386tQ==
X-Proofpoint-ORIG-GUID: -K1pI24wH9Oa56IrLBCRriJ4WPld7jRM
X-Proofpoint-GUID: -K1pI24wH9Oa56IrLBCRriJ4WPld7jRM
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=69537cac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=VmWmgm_EPZb_nnVC2x0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065
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
INTF block. Support programming the timer in the INTF block. Fixes tag
points to the commit which removed register access to those registers on
DPU 8.x+ (and which also should have added proper support for WD timer
on those devices).

Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 49 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3921c15aee98..058a7c8727f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -775,13 +775,13 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 
 	vsync_cfg.vsync_source = disp_info->vsync_source;
+	vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
-		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 	}
@@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 
 		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
 			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-							 vsync_cfg.vsync_source);
+							 &vsync_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a80ac82a9625..7e620f590984 100644
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
@@ -475,7 +479,20 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-				  enum dpu_vsync_source vsync_source)
+				  struct dpu_vsync_source_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
+	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (cfg->vsync_source & 0xf));
+}
+
+static void dpu_hw_intf_vsync_sel_v8(struct dpu_hw_intf *intf,
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -484,7 +501,30 @@ static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
 
 	c = &intf->hw;
 
-	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
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
+
+		reg  = BIT(8);		/* enable heartbeat timer */
+		reg |= BIT(0);		/* enable WD timer */
+		reg |= BIT(1);		/* select default 16 clock ticks */
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL2, reg);
+
+		/* make sure that timers are enabled/disabled for vsync state */
+		wmb();
+	}
+
+	dpu_hw_intf_vsync_sel(intf, cfg);
 }
 
 static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
@@ -598,7 +638,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
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

