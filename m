Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0EA9A7BD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E2010E789;
	Thu, 24 Apr 2025 09:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeAz1bXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AAD10E789
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAUR005968
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TZ+vVgitO0Ee1t7phggoG27ofzaDJceAaCxWE+985z4=; b=GeAz1bXCbdwy0tf9
 c9Ii80LxEJDaDB/AQ0b1vGzUy8runmhLtDvNXcihUdAJe8LfwEqH/z5cpdr2m0PV
 hQBf3ciHAJ28B1TxoU2A2D9SaaMggw2DJGKYCYxTIzIIrNdh9Sm6jXqSkT3LLugB
 ZyTVd4ksFdJOylM7lLbHoDjA763KuX6TCll8Na95dVDdX0iXsyteIlr2lL0tPGD+
 EufdSYI4jJgekOtTm5htNa8AYd0JJyuTYG14GKUX+Gqjr6YfAaG499SKNXqilgIc
 4BOGPCU7uQF2qHFI4Q6JlWHc8DoRvNxoQyEk6VPhzuopIBrKzhtFRwVbWDDrO2RJ
 Z2OhmA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0501s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6eeffdba0e2so16533966d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487028; x=1746091828;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZ+vVgitO0Ee1t7phggoG27ofzaDJceAaCxWE+985z4=;
 b=ONhcu+JxWKBxxHjRjDBwRKWta2/VeFYQxpZS5c72Z1SeknUp8GzBCi2zRYmKz+NtrG
 Kxct7aoJLt17ARbsQsxuk7SRaj0XKuEwdjugh5UNJK0lkXYvSfafZxxZijjtgDRgDCAS
 fXR+UZOP/kuqsHuyPAc4xrx6GYX/v3lL1IdgU9kV1WCET2gKMJuFs86E9NNirxGjXLgA
 UAAdJjvV5sNZvfO0RG/MTBhTsdqACJWPJe2FaTMnUqDJnpF1/SWPz9tSKxuqZCyhval/
 C7ufMAq+GnEmVcrttByNTqibXo1466W+t/LsA5GEr6fwBgHHBMhR0WOBWqP98cFXtv4Y
 jOzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMLoc4Po2Zdfg5FZgbeBsWuXJoWyBaav4q3GMxK2B1ZTZT0IDhlGPk5b0rrs2Y7IXIe8L2oq3HXc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9VWgTeftJUtLXK8EpCS0h8/kqvJgys3R0dG9k8xVRw7MAF4Mw
 0MfJ9Zg05Q48NfIaLo93+MjmwdivanI9IYB41250tLTH4JrQv2Vk+ueJ8T68a4qLmdiMDv1TbD6
 Gy2xOfRJcnT5O9akTZK/Xukjx6abOdS3Viq9plQLZRjqaHUi8GP/Pwj5YPprgKmZ69S8=
X-Gm-Gg: ASbGncvIRpx6sZ08yEmI1DVFdGn80mAvlIq9tcoEzAO7+HxPrlu5OvzVYI6k8eA7qja
 gnnkAcpFw7iuqurofT2r2SNAv8EDH/CPdwU+A22U5ZCCGDXGi9ochAtoDC0ceWFWdx0wdEtHVti
 WmZfVdPBJG+yUbc9KFxysq8zB0D+kgY5wNL/NBdLE+qPcKUw6gMAokFkeHfj60CLP+BtBj1EIfE
 ZK4mWkgbSFUGpIwcwm23evovsfdPUrF05M041AfXvz03dtn9quwksNHWjXODY31tidwcG8BPgVT
 lmgO4srC7lSXEUTg+d0Jp4aiWXSPZVyHSD8XkYtHlop3MUQEG476bOhBpBAumnPPAQU8Oj4pLHx
 UYXPPbnmrhd3M5dGQrCayEIIR
X-Received: by 2002:ad4:5bcf:0:b0:6e6:6b99:cd1e with SMTP id
 6a1803df08f44-6f4bfc1da40mr29821076d6.26.1745487027908; 
 Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnpSqDj4Yj7waYtWavXO85eCg4746V1n57mMjk0jgaE+hvzrSPBmolL9okputlPpS09V2cHA==
X-Received: by 2002:ad4:5bcf:0:b0:6e6:6b99:cd1e with SMTP id
 6a1803df08f44-6f4bfc1da40mr29820646d6.26.1745487027524; 
 Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:05 +0300
Subject: [PATCH v3 01/33] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-1-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSpsfUttjT/E6RZYKlS5nYVZCE+2yoZls12h
 D4PfcXaHZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqQAKCRCLPIo+Aiko
 1bTFB/92pxDvmbvS+yabonuD1bCGKJY1BKkJm6f8na4d/gMftQ1VQUbSnqYCO9cU6vZhMrL+dLZ
 0fC1YClRxEtSzSqhFHU2kR6/0CRnRGt9AK40wFlV42PLNkotShDhBLDNMy+j2fmve2qdCeGH4vs
 nUkgTSxi9weAx9T3ow57fjVNPSx+u2D4sxBZBobPaFPr6Q9d1tLoNx8HFAMihc8GDzNrC6DU8A+
 7z5NF9vPqLCmJo00slWXzHl6cxMfs/qDmHxT9wHNFXVS07DLAK2OgqpglhhmGTtVQg7atcqdeDq
 oyChjjymCjHzxjJImyQLDrYx46Ny2vdpwjPUUBkXEVZa7yua
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfXzGdb7xskB8zf
 e+6qcysMZvPqgb4iI318PglRcOGs10EzhHeQ0oFSbUsszeQXj7Jqmsa5W+uFnAe5nA2hp4jKC+T
 zEcNOkGkpY2KClf2Odgzdt3CcFD6ejJuXYN6uxGMHWDyNT/LWtR0bLR1HtUCe8nc5ZTXhhqrhZ7
 g9yTGcKgiDfU3H3PJEemXNkN5+98H5yic6bR52lxfu8suM/Ht05GKMxR7SYnlA5GhlEvu2vqvyW
 4PBb7xioNo8TAMr53hWD6lp8NRUstALX7su6m33TsEqdZJnPRFcAu9WrktTvuA/YhRleFrExkQ8
 63GktAYcAcBKkygtLANGDErsnSCf0eR62ntE5jWhiM/f89qnIHiQ0+2qatJHQ1qNYvyhBPFW+PE
 aG/HxJZt3ch+w/0o5fe5i3EDEvjKTS/CPHWVwAnadC6c5//KXBwq9HsWc9Vp8GfruttW9jhV
X-Proofpoint-GUID: geOa3ApyituQIy4gjnrqtrw7sZ5TyGhn
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04b4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: geOa3ApyituQIy4gjnrqtrw7sZ5TyGhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062
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

