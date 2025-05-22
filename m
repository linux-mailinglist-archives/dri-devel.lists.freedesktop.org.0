Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC5AC13E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B910E968;
	Thu, 22 May 2025 19:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uv9eWw80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51BA10E7AA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH22uO024757
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ri/QKCy9CGa3/NJrEtAUKAKyT/Jp6jvRpLEBwHpbnVA=; b=Uv9eWw80ew6eMXkR
 ApORJjIl+iynL6RybQ628fvRaHsprTHztwaNAU+g8F4Ak1heClnvCRf6s/U/LjBz
 N9K3jPJT5ux2wkfz5oKQyoayjoV5eXHXhV/Fl4OHPje0/INf7jJJ/sI5DjlJehYF
 YfLVdsZHSkYWFT2IHb3wNrxYzkeZb2SVk8J5tLtaGWtQx5qot2KFf7I388Tl6z3F
 r1LQh+z4TiG6DNP/tMRMLHujCB1BMxeZCKYG2IsgTzUopxZK8t2e+U5PsRBUrGy3
 ea7qiMKaYmSOvKdMgR5TQc9GrTK0Guesxql8rA2zU9oK1ibV5oUo4C0mnAva//tv
 zd6BxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4ycxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso974447285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940615; x=1748545415;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ri/QKCy9CGa3/NJrEtAUKAKyT/Jp6jvRpLEBwHpbnVA=;
 b=dK6553K+drOaTw+Z7ywpP89L2VqUcdLbo8iUcBNyx3aoZkowLoIfOFr3mL3WTwoExm
 MriaU9cAW82+02o/73YEScQ1fn/om638zktJOp+SPbZ7duz64EZP0T8aqb46VnWbgFUa
 uB9ki2p9tbtoslvTn5c25G/BVBwK9RS3SmRzV87N5QzsuU1aSOa9ptghz91N+d0rlb8a
 /9JeCUIHdaM1AsSQgbA2Zsu+or8HPIp+RqNsp3vwrnJ7t3V5TR6tkBnWfvPsok6fBN1f
 aaUYnxb4hoWiDdyogS736qHLvlSu3XPK5bG48JBXk+mgWVxZGH1EEWwBDV2gRhhEYvwd
 8pNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQPMVR6r0kST3yLlvrL3fxW5cQ6IAB1WbzI2RabL665ENmw04QkSn6bnoUgVaXdBEjLg3290OAa0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxvp93toDRUeHkfi5erB5/7qJsAO/6vMroYz0wA2RaZ9H39tgBE
 jobi2Ts2gccR684G7inpi9UsdC6buWbFJBp1Tvsw2UyLkKA9yWnDQMWsOaq1ehm5RoN5yquxyX3
 fx+lR2DVB4GDJ/c7u/CxImYeWqeqP2GtXtJ9UVgiLSAFuu523xQAfjl218Yu7ZsNe+Pkh82k=
X-Gm-Gg: ASbGncvLfTMkqU3FaWjgJdVz2NYts0CErbyk/g8HOPGhFlDtB11m//uCCyG24mxD/AX
 VY8Z+lqXEOGPkgtZvQnjJBFpDPj6Iyr69kKjeZbcU7xhcCrmZtCZWB+BJGce2QnUL9uk14rTOFG
 lmC3WdcTm9i625ltS54MtDCNOptYU2b4X75WfsGKHiAUcl2uc6wgjCF0Y28C8025k+p7q1606ip
 HbHB6Kw9uiiqS0J09b0nwEnH1yDipgvOJ+0YXHuMvst0MjxUR0AbhQhfksXjTemZ9yRzewWM4Vs
 ob6ce7Le1sGrT5B81j3A+n+7Ag9JvpzW/TbJ6E2OPsKNmNiJdbNGa+6THkzRgKrSovrwtHm5SrK
 fONtN22339oLvHRXjERdNULWS
X-Received: by 2002:a05:620a:294a:b0:7c9:5eca:ea3b with SMTP id
 af79cd13be357-7cd46731a51mr3537345085a.31.1747940615027; 
 Thu, 22 May 2025 12:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuDtGUc4muO1Z0QfsR40omgcfSLLvYeuvR7jOav5AMf+UAhT3khSrkdB1PHtMoiqedxkYO0w==
X-Received: by 2002:a05:620a:294a:b0:7c9:5eca:ea3b with SMTP id
 af79cd13be357-7cd46731a51mr3537339785a.31.1747940614571; 
 Thu, 22 May 2025 12:03:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:20 +0300
Subject: [PATCH v5 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-1-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3775;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/jtEB/eJ70Kwf3ZRDcLKCteC/8VDM7I/q74Ga6UWOgI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T7fyavGriyaGHOj+ADxHUnLpxMPrK8HtV8i
 TMAZBo/dmCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90+wAKCRCLPIo+Aiko
 1Qz4B/9/zYYjE1ZBotnVsVpgFu835IeL57emvaCd5NC4Ll9kNPtZ75ai0PL8BIf+M8dgSffevtl
 giD8oXN1n5hVbBh5eAxH69ztZEBrI3AJeqgZcIl3D5WXln1EwAp0soeINMuIK5J3nQimMhUFyrM
 5o3eW2+kOUrPNZ19nXL0dJt75xuzpBYt7BSOqeRPunxAIfoWLlfGryVXBWHkfKG98AwM2lxhrzs
 CUKjnMftbz06GQJKmtte2V6ZsULO9S/TXsj25REbt+X3vW/YoOULxSWIdwTLn7OdOmwqUl+5bKy
 6qOvclVm+BrIJzR5vC7oicPCr5FHeV7vulPT27AC4EnTFh+L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HL5HgO-KHw15-EY1kXbyxjTPMbfiKTaa
X-Proofpoint-ORIG-GUID: HL5HgO-KHw15-EY1kXbyxjTPMbfiKTaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX0AEvyvJHWud5
 19f0G9Bb08g0TozxBPEFPD5MmZzrAibhEdy9clN3k+n2s+FKED7eFGb9IqmjBWWnSMgC+hIqhRv
 hgUryebMOnIFNxxxMpsEA7n7uKbeK8Ybi/A0OXdRJLIL3YmyLjCpQtoFp9slB7wE8oI8HR8D+wH
 vghhO5l/+f6xBH0zK6Z8MCKJUvNdVXpMk0qsaz00Ft/7qTjoN6oX4eTyzsYkCewFKB9VfTzGJAu
 OdLxssT5EFmI2nz7orreE8dH8XL//YQUxnQPQYqXtXRqbTqOi5ehTGfrjHxlaQGTtyoO1RczxOg
 r1p9xv38g7RAaaip+wSKa1DKVtFtoEd5k4JXh1sI5rgvjqvqR6tN6g9lJCs/wwvo0t8T2GJZwSI
 bPHFHWXn23CNr7TkPtmUqhN3i7mm3RN8/FGGM/7upsuh6ygTRUvwtszhTUWOVfwmDD8au8Sx
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f7513 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 8a618841e3ea89acfe4a42d48319a6c54a1b3495..d35d15b60260037c5c0c369cb061e7759243b6fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -309,8 +309,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
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

