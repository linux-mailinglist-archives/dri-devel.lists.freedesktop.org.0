Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D4ABC37E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8BF10E3E7;
	Mon, 19 May 2025 16:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O15bjRQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A07510E427
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J98DqH029025
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QsdXMngD9SpY831RMUEtLxHZK24x3eyrHN3Zu861eo0=; b=O15bjRQrwouQ4gH4
 /OZUS+7lB2JzWiYwAYee3JeZeLdnzfCvuRPuxD8OzXCjaJ0QsEDeiDOxCKb+rMBq
 ZBPWOU15UXsj57gErb6CG4YgYpfzSKQUWmBiVuBDa6urlO+A01FnIXv739AhZuay
 UewdFVWZnq3zqhKY93d+2H7GYd0GQ3RMSUhdYcUHtsr3xW9fOcfgBRTwlLk/0rt0
 bwJsGM2ox4iG4bfKkcQhhFw9YS6Ze2wOHPthyScWIZWirOcb7QVG9uGT/L0KQfL5
 Prr/jy1H23u8fqWMdavrStaAgwl/G6OAvE7CMddxZ7qDav+T/8oGcrYWPEif3W2+
 Zqygig==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-742cc20e11eso888595b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670665; x=1748275465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QsdXMngD9SpY831RMUEtLxHZK24x3eyrHN3Zu861eo0=;
 b=HVSdLDcpHTJTGsH3pp8RVX7H7JNfsv2oozs0hXl0/ScqMTlyrr0wDUOGbAn9+BWCb8
 TMGEoL07ctuSg0g6P1hUTirx0L4Tm24PcpNU6zuMcjHHaDRnWlQxextV9Lkam/+97NY3
 ag9+Z4UjgW/+1tGMjrxeRdmZ71Uv5vzNzpSSrNHvujTaq1fOwJgyhPoKC8EdG0SWUO9A
 3k6TyLoJbJ9LLy89r//KSZ/tIQewsP8jrsnWZ+/jkxMVL4mamlb1Du5uqLsKCwQQe/6v
 wuDxaFtuZzH+K0rAXxW+MvexIolPHhc6DEhXtv+7/UNWE/OMScxHx1HbTjk6eMHz+XSo
 eByA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr2DXts6J61BI+DQcyzga6wcRCqnakbrhXdkJkMvP0+5nEVo9FKZfoA4JbbTbCt8+YjzwdAn21DMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI3SEha/Z8AtMOoeqbqcV7s1ggbSuIkDgs0VyzO2O8YuFsJm5T
 IP8+d5HrXtU56bmPNl4eCi0mPNOOqPy5Qxfm15K+S5mygmaXBqwz/hVNXWlry2nCY2csqKK6nBh
 yS32qJeCP5hYhqFRCp7q9g8hf9LCRhbljQ7Hqu0FAXQMwN/fefHxOYjdJFEo2JhBjV6swpGkhTP
 CrFgY=
X-Gm-Gg: ASbGnctp00taVGwfXQ9j2n6SLGB3KMXHxALuB4XMlnpqPRjC7Hbpw+84SsMoGR11B/3
 jENfpiudnTQ+NuFgzair0Yfc0Bb43A/Hmesjv0QqwoRDsKnF/1VzKWCPCQpBq/SkT4rpc6XHuz2
 3iRzRMMJ6tYDiI4Br2BzGydukbgMhEDW3LsTzU0WfH+O/AY7PFnboFN1+R8FwyGOUbbszQr0Y6Y
 KYnq+It2Ybw267M8B2x5mar6oaJZnL+29UhxS6cESG9NcU8o4B8Jim5hmHaMEkk2n5pWAilERjc
 LSo/SR+ag+fOxtN08Tpa62HKV/8RmG6D4gn8MZc85KP2sqes80Nr8FulB8PMJpDksLHYz69Vnat
 o+KEkhkBl5uAzvrx4ZHHR488K
X-Received: by 2002:a05:6a21:3189:b0:1f3:1eb8:7597 with SMTP id
 adf61e73a8af0-2170ce8b3c7mr19611708637.35.1747670665420; 
 Mon, 19 May 2025 09:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAgP2IpHkPQc5mpQRAJ6cLOgiawQf+qDVCqKg7kLh9hrIasJ2kAl7ht4NNQm+BB69NkOXXsQ==
X-Received: by 2002:a05:6a21:3189:b0:1f3:1eb8:7597 with SMTP id
 adf61e73a8af0-2170ce8b3c7mr19611662637.35.1747670665007; 
 Mon, 19 May 2025 09:04:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:07 +0300
Subject: [PATCH v4 05/30] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tqpu072eQ+5A23S4ttcnG6A8dqH81CwtIIeKlnCS8Qo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6J3GY8B6sAJkvuS5gDSIB00Ld6uwXdzuLA
 WEc4uG8uZiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YeaB/94imUZK2omzTlTl9/OQoGQVUgiYj8QkPc2PhQnu5YxOeIs+2KgLQVCdE7OMLRm/45k467
 bptb05cQ+3z47kX9uDr9/unZdbVMoOIEQA+zc5Cl02URSnlvtvHADVRLoFAx2WuhXSuaTohnQYS
 Wul3+N8m8tI/Ek0fsoqnFYa2PWPs5wwYJq1miJaKWTe54EXP/scEKCMqojzInJr+YgqHcr5Z5W8
 87fznBKE8psaVEC5gqPyFqhCgaKqWPSyAsLj8MPtcitLrUj8ZlmhrrcbqfPsVAocRuP5bK5QMTl
 SczLhhnV55Cue4zUsxiKBmO/++PXG7iOosq7RqEkdhHpu4t6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b568a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Lz6R42y_SoDJk5F9RjeKOTfBm8cKS-iW
X-Proofpoint-GUID: Lz6R42y_SoDJk5F9RjeKOTfBm8cKS-iW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX3h1f2/GUwlde
 ufYq12xIUXESGsUcYyUFpQxTXuSBOWY8+DGrKXdR6R/THv+uT8UurE5SsL7wZRN9wm8IOZ5agQq
 gwxqCDoyqKMYexOQMzGAyvYtSagYos+aYSiuGT4Ghw8GOK13olxY9Onkb1H+Ln/WZBnXQTJows7
 sLlEY01+s9kb23ilj77rJX0G812AwmrMJpe23JL4MxvuVqJ1u1YwqwQ0Wpx6QBkXT/A8+GRygJI
 AbzyXVl4AE3utMcwW/nKvocpZ6a+YvJgtAtvpXY5dp0JbsevVGQ9m6zCDZxqyk62AV52cEAL1uj
 XDGdGxTT0EV2zeYAJv8qGmqBnJRMOZQl2N0mex7IDltoZy75hAk+LFF7a3jHvTbmjHcFxiTse9i
 j3/+GpyTzYL4v4a04LdiZ/C6YZngx+ax136Icjdzcwt0HHwA3xXbisnG4qj8EsUsLX26Tlhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

