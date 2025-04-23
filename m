Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEFAA999FD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CC410E17F;
	Wed, 23 Apr 2025 21:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3rNxQJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A236C10E261
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB0Yvi024105
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JRXCPSZfKz+DlXPuaTXqEvhoI/h4QSedlOHHVJ7bZgQ=; b=S3rNxQJQeBYGSWL/
 FklUW8brM5mIAZCTknzBnKk2OG7cWU0hVc8vwVCA7kOSWsL/fQT0tZexhPFhXuot
 ZFI9Rm6TzEIL/cfKz6Wqqw5PDhCYB0Ob61XztyV0t6oXOBg08CF6ShVc0qUJtNtr
 XdLVCr9JdNH6KXTI0wB7uf45vBMR+dDiDurhmhsyUbZg36sQ4i5OLNalwEAJAj+z
 mx6t7gRGr6+LmAWOFBnaWoPFxkMYt1qR+aLJL2dmoARazZJh7mnuB7pYgUJvBdTW
 ZcH/MegmorIl0TL8gh9wajEsWtavZozgzxCo9V4wZSX/NDh4l+3HQWSFJxxkrFkQ
 N77+Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bck6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c955be751aso43820885a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442611; x=1746047411;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRXCPSZfKz+DlXPuaTXqEvhoI/h4QSedlOHHVJ7bZgQ=;
 b=BbOa1AIX6stC5DbKhC163HkEas2HEEFf2jUIsoMipl9glBorS2HmaBX7niXTdjQJB8
 NJU9LY6/98vPwZkqoOOiuKmD67wgVvkvPc8KJv/fXPg2RyhKwoo+cfcCYwPYopQowqn1
 IkXsHWJdcTesXYiAAq/R7Iprx9MXz4U6dIen4aGhnX+juckxWtYfURinQ11hilEYE10U
 wpo4/7oZsJRJWr/gG+nXZhKK8OpMdYhqoTc/yMLqU2z8Qqxo3h3FQxxb5BXdnF5Mmnah
 iFNiV3p+7VJOigDQNz3ScDZJvEm6fAwnIxfeU0xAG3OcAJWe3MUOMzVdA6ZUQ/WOl2Bb
 GsHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfMhNrSFn+uWsWiOJhF8LtReU+6Dxqm7Gzugo4x7blqUZVW7SPRKAoHLkTX/ur12ssqnVw8jCAw9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy31lBSDLbWhOsIsuiDYXAXw8rFr/PbcRkXDOg41Gg1TBUaAgR
 kjZcL4uJvhPEBVXFgMgV6LBmKwgmT3N7dTIsNQ2YVeeEgtHA+YnahDDHnB8/8OyNM+JV0AZJMcm
 M1G6fYue4GUSWXQZI4a/i/wr1GnWgI9PLBRVxhJj0ZmNWjsE60+ZzKD6mqWdE4cRqs+4=
X-Gm-Gg: ASbGncsJqfKNuTaR9Wm2Ay8q+eAl/y9tQkAc3SYEelaskFRU5QPcRhwXUc7b1M/BSds
 EMrya/uRI2tQlx/rpl0+gRwnz5eGhlt6Gq5TMQb7qdDwc2mL58JGotSKCH2h8jeWY9RxF4FHdrE
 wx+gfNHYMC+hj7vFiDHB3mw+JAPJONAs6cHpKqVKv+v7QQ/GV2npg3l5wIjIsnzQO16DJC2hMo0
 LYHtSPVhJH//L04WlYdNcmf6tn1b6HOsRs7K+lcM6shrrrI0sQwUB0U/D0eWqqagqV3NiVPL5FL
 I27sLoULCJ0ArmRM4xTJTQvI0nRcVFYYXSdnmOt5prT7mXE9Cidji29y6LegcbJg66DxiD8H15E
 JrIRb9+IWqoB6hX8DZicgufCz
X-Received: by 2002:a05:620a:2984:b0:7c5:a951:3518 with SMTP id
 af79cd13be357-7c956f34a34mr46304385a.39.1745442611589; 
 Wed, 23 Apr 2025 14:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu9UktEg24Y6pBfXuYiW9VCkLD02oK4oHuXzlXTXwu2vpQ+/Rw+H3gqu922br8qUWbb1+zzg==
X-Received: by 2002:a05:620a:2984:b0:7c5:a951:3518 with SMTP id
 af79cd13be357-7c956f34a34mr46301085a.39.1745442611259; 
 Wed, 23 Apr 2025 14:10:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:09:57 +0300
Subject: [PATCH v2 01/33] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-1-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqXsu4xhdRSNpxf1vhPNERvfOkWG3poRbfM
 CrhAy+HVq2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1ZEkB/4y8zKnbxVkHnCP4niz6CVZfFW4WHfBUHAkpxHYVtB7lCvcxwr8n17GJUt/CauoNb6Q7Wi
 wIH2wpZWXjtshGwzfjK8ZYNQ10OEhtzquVChrXHpOI8q8a5sopy0A0IRjPuD60fuJ6cKdF3UsLb
 BxbT/yQqQviLLgwqzzVF0OPU2ErCSViHmcrXcJMTgXBzj+ORyxQk5NzFADvHJHJxGv3/CiHkSTu
 5TWZgb9KJmilekStX9MSsMvWpgt09mXU9CfCVsQEBqrMZpBY6dLUuJzdH5eox2uJ7T4G0DShHGn
 WPKCDVkVIGk9TJIXQxD8fn1Ax0zfViyM8M2jhytBSCsWsukt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mtTryzYgakF7tR0XIpvF4SCZr7yfRIrv
X-Proofpoint-GUID: mtTryzYgakF7tR0XIpvF4SCZr7yfRIrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXxokHWs04xnxu
 DXuCTemrxKzp5j22LwRdCw6gsMValyJXrurDEfAiTLkLMZDToJYDfxFcDSpGOganRs9hL8xKqX4
 tEAQPaOX1oJxIcGcz3K1Qd2UiUe/oIbCelU5LyC6XKhIqzrsvgV/q3BSq56KjUd/WT/QovI0jEl
 ND+Ap/DGbbnEwrYjT0Ok+yCodumcL4erjJCFUULGazwLMWdg62knVp/Xn3hqXdSmWkv/Lzn4fHy
 ujSEM92gcDFGpP/PFubt1ATSBrCAbEKiZ4+Ue3I/t7vEynOKLg+9jHiePVTk8eJ6bKWq4fKYoFY
 VQneeIPGsYDYrcgOVXQYm/Yu6w0zXvtwTCuGJZ+WfCIrPn7DXktKvhptZkA03zJDv55pfy129W8
 uYKsUdtPaM9in1Z2APW9HHA9gkFmhOS/JaGBa+qTePSsFJuNZH6fwzU6iclWvieXM0uz/lzm
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68095735 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

From: Dmitry Baryshkov <lumag@kernel.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..3e0f1288ad17e19f6d0b7c5dcba19d3e5977a461 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,8 +307,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5

