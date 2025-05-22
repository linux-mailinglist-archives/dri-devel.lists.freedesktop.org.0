Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B110AC141E
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5178D10E923;
	Thu, 22 May 2025 19:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGHAVrBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4104C10E807
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFjk0K006644
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W4/Qfodz8bj1FCYHz7m5/3J+a/eyf1l9HdLUh5gFHY8=; b=VGHAVrBGPOx+zKvz
 JaI2Y2wZGDchlKGwG98wgJ5W6cnC9wK7Nj8X7KRznsghjrsCGhQlg1lusGlCF17H
 uF8ND3USEHTcDiVOGDtmvTmmOvQcuwRWHKqP2pELiKqoPhXwAeazB7kMvmMHMlvU
 +AejUkrCKAbVcg7YcZUtBjr80tX0Za4HUArVC/r6DIuvbeEQsNoLBQN5B3tA/ng3
 FcfhEt3WIoZ3RU0gWQGBFwRAHeXkJ30xzdmdJVaCzQn4IF8UzTPnB/iQa9liUm2g
 6YAKHInh83pYtCv5aG6NejpOrGnyco5tDAqOgCw6pLK1bH6QFQ0/1RFHBwCKTnf3
 Hf0Lng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0qkvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c95556f824so830151285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940692; x=1748545492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4/Qfodz8bj1FCYHz7m5/3J+a/eyf1l9HdLUh5gFHY8=;
 b=vZGS023iJtFr1Kduz10hUETRIU6pADdt81cqG6XI6d2FNNRsZNHOtd7XG8xwgWxvNe
 WgLUxuQYE8uBLHN3ztP3OjB2U1BaxorFFF9hUjbLzg6+BPnME/3EKtOTG0ivejXns4ZX
 hM3/CWBgK19frURbE6IFjOw2vspu1zmtwpA8uYS090D7mIEAJpdzLO7to7qR1mQHGWcB
 8flPPRcRUdXivnIJ74Mc1S4o0TJOiPeRGZY3pajZ6lC0FTI504w9LgklGbF3SmIM+hM6
 xWs16KvlOa1NNLjCuzaSFK+FvvCMYuucUHc1FuKzZiE994AL8VIrsGAzD9culFMSLtk5
 Mppw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjGQr0EL5IDW1rkKGYRtnmuJww6GhfZlA1d6lh2u6enjcs+fZuBNNxNXlDAP5LpZCCBGcp4FN0eVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx6MJSiJJkrQibqZ0/DMM1C6rS1BzkXjIYveBN8qs5T+8ZrAVp
 vhlCkw4w1dyFKKbPspRXCanf3GhMgj/DxMCjAcceDPoPe0i3tCVeMOgW+EqWQ8kVDXSkGPnE5EM
 3M4c+lWWw7O4Z14nNIjsYTYikVfUzf1M+QXAeUSWmzeN5euf6GHt/l101os1TvlkS2dBgWgs=
X-Gm-Gg: ASbGnct51xQp6+couuZxwkX424Xwm9DI9mKXbA/IGZJSh53DbOI093u8Yu+95yhBOx0
 7nrcr+NFPHvx5xUpX148Nt9/IubCgwrEGE6kBsvebmFb+vo5xbhAZXn+HRhh4dZTVXFUvJe4PUr
 hbmALsX6hZWcVTFZfB2LqrUAIJcwMo1Hp0LdARsWoFxGj/EfComipJP2r43WdEDORBDuwXC67zf
 ngMdBtb+2gJyCD8YwBa9uhKK0KvVja9rcfndP+jpUbAQwbLcWoY4MD0O4NAXif0j01as+DECRKc
 6c2YVu9UyTrwcEPt7yIm3RJFMPtlsUbIf8werproLcQYo7MdchAAaFF4CwAfTp8X0X4UWEvdWt3
 CB4eJtabi88P3Byme/judLDfU
X-Received: by 2002:a05:620a:57c8:b0:7ce:b495:f16d with SMTP id
 af79cd13be357-7cee3280efemr4749485a.58.1747940692348; 
 Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqRioajkuCidRLbLqoNubjYsIdX2Y5J5RM0oBH+NxvXfHz3YVH64rHn5nDHQTEB2YD4x6+tw==
X-Received: by 2002:a05:620a:57c8:b0:7ce:b495:f16d with SMTP id
 af79cd13be357-7cee3280efemr4744885a.58.1747940691977; 
 Thu, 22 May 2025 12:04:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:47 +0300
Subject: [PATCH v5 28/30] drm/msm/dpu: drop ununused PINGPONG features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-28-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EaiNnpBPJ95aothOcinDztqBiGxffsBsh/dQfmS8ZxY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+KcON32+01D/bbm9bdCUvsX5HYu2lR9zTJT7FR+54P
 r8lfW5GJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8p2dg6EpRDa560Z4haNQ
 9AkNi/X600/3malH8m5tK9eQ+LUkYUPn5le9xzwa5y84emjnXk0Ojct68g3WacJOjBsllc8VzPv
 z98nxQy1Pi/zFo3yCzjQfz5+x1LVc+PeqPF+u3d/svs2/s1qp+pd7fcDJqvrjhgH9DF47w+yF9D
 pzX/dJb7uq+z7RkGXZ7JUSm3Itp7v9cdtz9tHU4CnzI5T2p/6az7TPKLarIdGGpVnU53bywb39E
 lt/lk1si7vq4XHxT7Cf8ZHs1j9tS2YzcIo6lbBlasxLtWMt/NkipWfwaRKrjP9xiZPPPMQOtTZU
 /K/TUksJU1j5QtC3YatcKGPuo6j0eKWgq8VLvLX2WBoCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UFPsK0pJSOlliwvMFk6A7910S0LWwqi7
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f7555 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UzLktXvLB0hFtr4V4nYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UFPsK0pJSOlliwvMFk6A7910S0LWwqi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX3p+5uw4k0d5Q
 kSW6RP+6KtIHGWifVFMcEX5oOGGdhT8QeV48W9DHre1LTI/CfWoz6SZzq4ziCZmk39AUh4066WM
 UklAXaYFMVPKwSNRVfyce7eXgTMkgY004h0tjG1k3NrVS2TjfcFDK72bzntw8eHNxzkftr5oreZ
 GThRzdOQd7Dsh2j/7jYCBSKJNVWcwhdyRpgmoHRNuBeObGto4/tSmdErR20n3WEKzyHtYJhupJc
 0xoOZUlcfxt+XOeBDqQiMONi00mLiu6PfSz/3taRx0b1vIyy1rTxbKz7WDpgokTX5TqbxCzIc1r
 vyg2yZCi3sEK4jV8Fe2ryQDMykh3RSekwVg1HXApBc7UAUtHnCSUwQbNyxk/lGkOQzE16LeP5hm
 I85ntb84rpSeiAykwEznVXq+1NC4sr4EX1YWoURzevioXokeCKyqjfejE+sBUi1GT9wWcvFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=962 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192
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

All existing PINGPONG feature bits are completely unused. Drop them from
the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,18 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_SPLIT = 0x1,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

