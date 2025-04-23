Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C7A99A1D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9EB10E29E;
	Wed, 23 Apr 2025 21:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd0/AvLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC92910E304
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANlar014532
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JcjwMLnwxXCKo79+669N2NvGQGgpcaIDCz8ziqM3PlA=; b=Kd0/AvLTRo4XUFVp
 Ypn4YlLNr7fre9/VnThE0HoqQShGLfJsVXHf3XCvHe/Omy1/bEPRAHU2cypsHEPr
 A51S2KCRVy60vGoVByFjUb3Ei9/K5EVrC722ZiUL6YkabumNPb6XxV1+qDjYVFCh
 5YeluVmxgGk0dBByN/W1dF5XkLq43Anu/eIckMy69GuNxVcD1sE141s09/CTJhxF
 S5HM8IodlV2/2rVIgSkc8DlvNJP5z97BAw5DePRjmtm4jaha3RsJjC6r+JOFLV2p
 uTNr4DVt94isr6AQjZLGNvvSqufEUQa2Y72LhYBSQdb9SaD1X7HgCBZfzRn9O45K
 AYP/Dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c09f73873fso36833385a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442635; x=1746047435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcjwMLnwxXCKo79+669N2NvGQGgpcaIDCz8ziqM3PlA=;
 b=U3wJL2Sv33w1UBtecF/wiTj1MlUxbMJK5Co2xSaoX8bHp2jzuk01AjCVueTorYiaHg
 wFa8nx6dao5LTcOLVUrCJdzyWboCP4ZmGAUexvx858hA6FGWHin49zDkbKqwJ3k6PRuJ
 4TaQqbKY0vHWLfk4jNAwNy3eBcEA7lwhIw4yzD6WP92JPOtmFtmRvfxaBidxKJKuBYkC
 dFeTxkvDXIZb8M4ZnxJUgja5JAiMCHZEL/SjCIOMKIv8B7Jhnup31nBK1ylCTQoreNV4
 KBGF6cALioce0UzscAh+4qOFzHp7nWlXD1i9+7fX8Cr91hIDLAA19NfYDhunGxGeTNOH
 +3mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkU+m619EImO1QTgjKYNb324vPhu5eE4xmJM673eXLPNH3Z1ANLfBVkB+kLdSgdseeKxEKrf2L/yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlCzkON4k61MLTJTyh2Ziuqv1XWlnQ08eno6p94gEjDPnn06FK
 RFz/zrZl9NTN2wYB1esnHRiCizLOOvmDtkrj8jzkjSl9UpBkVYaTvUc+/q5W71xOikLu87tmqVm
 g63ogkM9uBhNzE7wK1X0oVeV2Qa68JBwGMlQLIvbPoQvQ7QWSigPlY7P/ZMDjxCl+mco=
X-Gm-Gg: ASbGncsMpMEE2wLsCeXUd1defHCng74vZPUE7u/ej4KMrREPPmeeXFfQt2jbFpJ0n9h
 3C8LLz8MDdIQrqrrzkZzghLwWqNdhFAlvIXwuoIOboK3JtDbCpli/sfa1v8LTbWhm9CJNTGOFYs
 JA2dqPv6O6Uhz1vRFAPIVddaXdHBb2eQN4TT5mqRh+Cx3L05MzXvbgAm1w0UmrVFuYSsx8gYNdq
 9I20ciDnCMgXAJEtIAdS5Cy5iRfDdJICjNzuBXjIWMBNDJenF0Czirzvfwog6Yg1eXEEhxHBl+C
 q9bVUJzVf+EYjDyQxYlQAbj3hrCvjY/SyKn+uvhZww5p3Gs9/Y7qYvnFaVFzvo0tH6hBUyrlo7F
 494HuE+3q1JSfN8WfQvnw2Te5
X-Received: by 2002:a05:620a:1a8f:b0:7c7:b4aa:85bc with SMTP id
 af79cd13be357-7c956eb32d1mr57137785a.17.1745442634847; 
 Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpetK0yosna4fps92ZmfEVrt44WX+Z8mQ+25toBT2ySi6Pd90JP+miCzNjRdJflXWhwX1ccw==
X-Received: by 2002:a05:620a:1a8f:b0:7c7:b4aa:85bc with SMTP id
 af79cd13be357-7c956eb32d1mr57134685a.17.1745442634537; 
 Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:07 +0300
Subject: [PATCH v2 11/33] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-11-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2655;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UKa7WiIdYlZA+i2dElAGlJso1hJFJoPQsInsDm2A0CU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuDZP0AEzQaPrWQ7KJ6/NF5yo/dQmjD+j2Er7QoXos
 xNcurM6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRyLPsv9ku9KZsucHx/nak
 n+WK791POvcK1m6VSIvOU0ubMfnY9rjvl8TXPZnovqvKbYZ5tb+MjecMIw3n6uRNm6/Kp2xP8K4
 POZ+1T63zeO2LLNVKhfI81uQHh28f32wwV+t+hHGXU3ff83QhnxN8KwT7ZsnlfPvooLfHretEYa
 YM3ynNjndrmBl/H02Oj2l77za/xm9jSeOCj5f1UmfqNghe/7BF40g2w51z6xeYdMTKmUb6rHRkO
 lpRMUW07Ke6IUN3qMxvPYfnuc1a31nNlz1K3DdPOPiGwqMaRisbZb192yQMNzBUHu/6GC1912mO
 uLMrr9PF/f0t2vWiGrsTvkWsu9F+pM555gH9skTRP40A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: G6e_I8hhjVSocN9-I5C0_JiMpjP4CXHH
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68095758 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=qfl85FH2DSYpkZ7DoNYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G6e_I8hhjVSocN9-I5C0_JiMpjP4CXHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX06tHwCTr51LL
 Ebishmqw6XQ9vnlZFrOpJ/H3DVaSyZDl4eOY5C2BCncDPyPjbDIWBtcJX3iVo1C+q/mSkyF8Bh8
 kdN+EzLJE9gaMfUn83Ov5r/fiNYg5hyGHWlAybJFq+mEg+enhqbtKnTiDandETAKPzddHZqZas7
 9PaqoVlTlfeJX4x4TS4z3Zdw3cFiT6DekKR81W3n1jaoKIuU+bonWGta1ZewMiumDmP7Q91D4RE
 qI9KMbnl/cFUNxyEYvCMgElXR2sycbi50gFHpVAzzcgFIyZDW6za6t+ZqhsXrFbOk7ovdNcbQcB
 KsmWlg9CTctRJyv65epNHzMy68iqsPtVRmB1tekc2KJOQP5c9lVi/mjbRfxQ9Bnk7IL8OKiuOqW
 trtNwWOj+Cw5gdM6eEIjUZoQ/iJDD/IP3hCkV391/s0DafVI0mv4vuvFIkXpoxdImpDwPw1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3431b3c956486aee99664ea9b7c2e00f5c130b7f..a2dc353151f3e1a4cb8a9f4644e7fc2e037356a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ae168e73026d8ebbe605397c6bbd95552193498c..1c6be8f93b54f28d370a379d1edccd178fe3cf7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -135,13 +135,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 593da532d40042ca31fb452679d3de04c3b0d1a7..543fe12252b7887ce2bd28abafac3be7caf17ac4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -781,7 +781,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

