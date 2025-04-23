Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D9A99A0F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49D910E289;
	Wed, 23 Apr 2025 21:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HToZoNro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4E810E259
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAj9Ll020404
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AE4lzFJnqWE5e+eBkiWINHStPJHmgBESpSkQsX62/xk=; b=HToZoNroAKEI2Jpt
 N7niKb53rvBwcuc6uuzlwHsZw3XKPmwAW1tLLIImoJ5z52am2ResNGXzB/O6Ovzn
 m7jVlAqFkf6Vh8Hp953WrSPLeljcbLf1GpFI6plc/TrZQ0JUpjgmFMw/Ba9vw/Cw
 kRWLiEnzH9lYLkY1ApIL9ioiUfE6ojNqybKc9z1QOs/6VSv3EsuYDtKrXtAilvFN
 UeZV20xht+6NzALRD9cWRqsbKUOyrD+CNAFpDqhSYzlvUyEXJe2azd93eYaFhJIu
 topAX2HBj8nj1Re7bdZDpMHs+OU+CCrWsM9rlfE0i7IdV4x73gEldVJ+4wc0tza/
 Y4hWLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh23dwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e900f6dcadso6311816d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442623; x=1746047423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AE4lzFJnqWE5e+eBkiWINHStPJHmgBESpSkQsX62/xk=;
 b=YaVOvGRHL/ZuAY39bQvdveberoI0aQubV5icmBRY31jpRtKrGsaPc3zlWbUGbGnsAv
 66kgg3MD6sx0SbxQYjcD/v41LW/Dsa2EMJKJtbsetCR7H73TpFChix0U74APfDgoFTiJ
 4ahg7sOz7aXk1I8q3VQIsI/thydAD/DVQgfsuc1H5m1klsBA6JrXhx2JCznVSYDlprkT
 E/nItFncjTAQkrpVl7vwzjK5Hwzf56Lv2kT3XoB5+9u27Yizxj3hw5D/mwbJs+6Vg3Zi
 rvizEOy2Q2dyWBnWo13S9WrjxuCyJ6tqxa+22qbatEsn96PkzY++PpPrh6zxCTUrvPZ1
 vIoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEYBmzv6oDz5ooFru5VHY48oZ/EfCuZdpkPt0ubUflg9j7sYgRNPNB/h/9/LSr6XqvI8U6m4C2/r8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy2rCC1rvKqgyOntciSXsAXcKQCBpZnGloavMs8pKdDpuOsdcg
 JAtMWsTrqu6KC4xtwYsdpkIXGl7kETsw0TEYgUyhD86r9PHBt/dNM6md32exkwAhMACXPkpnd8z
 pETk/AHh/bc0ciRZ8mXNL/AOVZpmjyRyOYMYAIDbZ8+vPeYRvO2OCVYQzR/Pi6h3kDlo=
X-Gm-Gg: ASbGnctbznGewoCcDSduYlwb7y7A3Ucd+5CKhwvX6ywyiuphzplwPUMPEJ/v/PNrpnK
 ekB17cZLMd2/6DL0kNPHzcNLsUajXBSyLbUtTsgVGWgyoLtpLCQw57bTQBs02iaMyCAmTilXb0r
 fhy4QQFDUCk1E5wwi1Jpt8OxqyvRr7MGqAb/wKSEGIKbNRPJjQez/Ruo9372TDUB8z8JZa03Ma2
 tSnfy3SdBILRyr4/gJj+DPwci2wa/eyk2rMTnjrQFXlwKGRx12L76AMQmdcIFDeZsS6uQrQNlEg
 KheDGMu8CIh5dlPFpKWq/yRAtaKDkRcossKZlCNWBG8n2ujvy2tbq57vfSvfoPKKlJiW2uAKoUa
 grKCZpOfwmKABPbSFasfbSVID
X-Received: by 2002:a05:6214:4012:b0:6f0:e2d4:5936 with SMTP id
 6a1803df08f44-6f4bfc1a25dmr4264186d6.22.1745442622745; 
 Wed, 23 Apr 2025 14:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOQ15h1AP0JAje3cYQCQWZ3mel914n0yFh//+go6tWwThRbRFFMxzg8Pu/UU1Bbz0rKcWT0A==
X-Received: by 2002:a05:6214:4012:b0:6f0:e2d4:5936 with SMTP id
 6a1803df08f44-6f4bfc1a25dmr4263986d6.22.1745442622412; 
 Wed, 23 Apr 2025 14:10:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:02 +0300
Subject: [PATCH v2 06/33] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-6-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqxEjOTPcOCtC1Ywlim/Lp5IZnIZC5/K2Bc
 K7hte49N6OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1dRgCACwnKb26HlQN7DsIQ7Im1BVHZQbjtHP45Mk/ElrkI4xXujeRO6BKcEr6jWjGHsGuy2PwdE
 G5fx+vQHPQzN7hCzR+qjhsOMk9HVrL1aaqNTFrk5YNDuT/PmV813I1+xzmchZ35z6YJ3IZOPNIj
 zz2XlK//mp7l7CylJzLNesxbpsolSikrCcpefTIR6XSJceQMCpcoAZNFVNv9QeHLjyDtcGKfJfn
 jdqmCJXbySt+CK2a448bZJp5GTg6TpX1T5w4HXPlLQiZP4tn1qWLe2NOhJZotR8sT0c+iVxqF2e
 MEyc2EEEM0WEPsH0ipUK7m4mWiH9ZP6iLKWdtdgm4wFBMK66
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6809574e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1nEwavuFrPzS_ZaDhavHIOabrDPASVak
X-Proofpoint-ORIG-GUID: 1nEwavuFrPzS_ZaDhavHIOabrDPASVak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX9gJaY3q8quJS
 eghVsubQTEgX5NNLAtYF7AaKI+BK+4+z1HljxBK677OWfrRUSWqn4WpUsog280h3s9pGjzwcHFg
 dhJklgbOBzIhzDpepZgk0mvGXibIjRIDI+cIj025gmpHm6XrINeO9JyLsNg3SsslwObNuYVCBPJ
 J6YFF6E6OTbF7Q8y4Nyowdxjhm+pp1TVKUILjh3LMD0mIuTU3PZl4sdM+fleq8S9UyhomG7SJK6
 q1iOKCPEvlgKlUUX27dAoK9ydCtl1NZb1s5hClwHwvArP11CAk0cXOwot99fkZjsjmfnChWQLWP
 mUkmOF7k+AVwwDsG/W5pemWrM7ahctLWdtfWC/E59JOBeuL1eLT3bFfEhEeL/gm5namFLUjjUy7
 VJYg1PItK2g8ngA6qu6GNMiFBnP+89oTDWuBaNqevVJCX6b/KR/c99yHzczPKQe/QBfPOBQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

