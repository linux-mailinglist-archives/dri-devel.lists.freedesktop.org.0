Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833F1D3A861
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797A510E07A;
	Mon, 19 Jan 2026 12:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSaTB+Xt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnYZCng6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E6810E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J90gXx227766
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VUTjt55ejTVHkuv6u1gjuO
 A/GOQfMpED72ORe2+Ysh4=; b=NSaTB+XtyTQABuQ3S8mkVtap2cLJzvixjxIPoI
 u7nI3Fv5ICFV79UtJpD3Saq4IflGd7cQYCdaXgG9qM/CR4ux44V1HaOCsqfqy1JZ
 urJyzOtzL816nFenZkqTc3JHwrZ9M+Xcs4kCBo/dRNtFT6X7Y6xbxylXssSJS4nr
 FbIIX75HJURek9XEUskrNvgcmgAKQHCxzz1BwgBZ2uUGtGQrjEzET5YW4w4WqkP4
 ES3NAMhxnpprt3ttzeqMJ4bzrykp1jZSyO4bYb9T//gsJ7saEX3iaJrFPGceTa7i
 wOUAWIp07lC/j02J0mDr9jZ2TYR9lx3NPzTBYliWeLAboJyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8vtt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6a5bc8c43so901423585a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825037; x=1769429837;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VUTjt55ejTVHkuv6u1gjuOA/GOQfMpED72ORe2+Ysh4=;
 b=AnYZCng6UAbf/wpJ8kF9ROAJ1goyP23dwpmEZ8IOOXZDzMkifHMxBvDi9YAfPMOczH
 oNU/Okj7n8F4HGLpdBlFc1OpAdQ//usaSE4ZSt8TLsYw7qapYvaer97VoF4JGw9PIq8g
 c82Pffm+EFZuHilIEcbS7sLWxDaDSqtFAHB6JA97SoUtK1svJnJIrGyFnZUyR2MkwHD6
 /vhflY9nnPSlb8GfwS+xkLQHI1fZXaBX5f5nRsK+aBBSx00/oZB7p8Os6JyUiCQbzOHZ
 VZKD/QD3rIN7PJS08rNoQw+fk68JK+2A+fWjreLD9otmoRZZmVebfYUH65xwgucMBra4
 +Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825037; x=1769429837;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUTjt55ejTVHkuv6u1gjuOA/GOQfMpED72ORe2+Ysh4=;
 b=STxptmYBmLlZQhCrB8nKO6Dk5m+S0oRuvWQqmMTz8LsBIVU95YGPxEcozPDapTVleL
 DUvPWYDFRy2sDxD64vHbtC9bFQ+V+vXAVght7M3GJ93NzcPnnU6NMJUsPsOkaIdz32Zb
 IRwhCPKOsI2ncf+oUCGY+Bl1t1quzjkDvhuYSEd1T7KQGDB5ei8GACAYyIJ2iZP21ik7
 WljTrnokmBL4P63f8NOmV8B1gAqOdUiOiDO9iY6JnivDG+615TkWq8gniK2lazediOBM
 Rnp3zlAAAwEJ3GlxPUdqBDU6NxnsGUE+AEJBqAtzxJac5ZiSLYGAlAyOEQib9mV3MdD3
 aqzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6fXCC69htDxZkzzhw7usgoxu3pSJlH1Y7pCFX0NYX1QfV0LC4fPGBhyvqvv06nQPWeCcUkk+PfTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6K8r5gOvPp01QM6YmEnGhHTLrJTPTAl9ekPov1GBdIoG0Yu9Z
 kmuvHqAI5T4tTFFAKO+gck8IOKvgF021uyNX0R2Rlgt6IWZEED4MaVWFmzCVKdhKD+53SR1YrfA
 LAhD7cIo2kzvRIrreXUWm+c+cyePuSKuSIRmUZe6SIH+vnuzqNfOHAwWAg1jzushMqDAiG5g=
X-Gm-Gg: AY/fxX6J+BjGClPAzP/eRriGPbjiNsWCIcJqzSLsCFExvnc9lOdF3I3tbGhwqpEn/j5
 KJCdJuMgL/fPsRiKBcOvNDDD/PTRIgVbns30EpKQCwiEMvCoxgS0qmeKiYeEEpUDoO1e4miJOL7
 37oeqjwiqy8rW5e63/dBGf/PFukWahq3ZHDAumvE6UZIgtAP+aT6Bp5Zpw4Zv3zOTnDQbFB+zrO
 s9LCZirp8B187CmViY+il76TVULfZfuj6EhONnahXRf7p2B1BNHRISfinE3lvKaDdyKZvq9Y0aT
 C/S3fx9/TIdGlV8qzjIs7Mu+qKh6L+NfIqMa8MfvJMOS43uQP/f8N11x7IoHPHcgG8NRzd7TOxn
 DhP9jE4wrtV7P1XdiXTxuOszTycBetdAsAtUZBokyaFfzqJM8WBrPeWseMLiHFtJiB10BIsXn1q
 KjoUWqN73g2Ckl59ObyfL5XmU=
X-Received: by 2002:a05:620a:f0f:b0:8c5:32c7:d2ec with SMTP id
 af79cd13be357-8c6a67ad8afmr1741008485a.85.1768825037391; 
 Mon, 19 Jan 2026 04:17:17 -0800 (PST)
X-Received: by 2002:a05:620a:f0f:b0:8c5:32c7:d2ec with SMTP id
 af79cd13be357-8c6a67ad8afmr1741004085a.85.1768825036803; 
 Mon, 19 Jan 2026 04:17:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 14:16:36 +0200
Message-Id: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQgbmkC/33MTQ7CIBAF4KsY1tLwU6B15T2MCwRqSWxRsKhpe
 nenXZlo3Uzy5uV9I0ouepfQbjOi6LJPPvQQyu0GmVb3Z4e9hYwYYZJQqnCXOjycHgY3/ukS5oI
 0UtlKEisQjK7RLQVsDkfIrU/3EF+Ln+n8XaUyxQRbYaRwWghm1D6kVNwGfTGh6wo4aBYz+1TqL
 4WB4oipjOSksZavKPy/wkHhpdZaKmYqVv9Qpml6A37gHPk/AQAA
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=odByiESPUGRmFH9tngtI6WdI4/EGTchJdAMNllxoeqk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGluIMuhRTL5NZArHsjS/MEj8mTu9OBuS6Jq+SpkQemqlynle
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpbiDLAAoJEIs8ij4CKSjV4VgIAJeI
 6x5H9+8erGfTT30hdUxjxNknaprLYtkPQvUgZzFduROo303EfnL/zJ4nOMBm9tN4MYXxHoH9B12
 VBC2qL+VyzUbHwPkw9nSMUFKjsDW7n9vE7qsKGuwfIrpNRI3ajUSUDnkZ0fxPj8WsQp8LpxHGTt
 YNodaseAWCa3rl9yxWz7faAAOue0wy7TiUS6zAsm4kVgWf+zjjmJRRf5zB64zfu/EiHFABx2Q7/
 UapASlJR5ZoDoBWPnUQVwAmHUrcZsk9M1h+qmtfpYLLOQQcHpEuGOdCO9E3BqfpCuENCUCJAMaY
 v+5cEnA64W0NGzmo9dD9v32HBYyXim+KBdxTd/U=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vWSjxP97VtjZNseydIg7yB-uW8eRvAZF
X-Proofpoint-GUID: vWSjxP97VtjZNseydIg7yB-uW8eRvAZF
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e20ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xvqa9-5REf62IQFaZ80A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX50uqHOcy5a6W
 CDIoG7yEl/wh66MfaALlNyti9zPC3U1Vu5gW1zi+rPFkZpHRt5Nb2iBUkVLICqeoYrFS4WlA74T
 hRarTRwSkF7kjO99twYOjhvcBhvqd8TJgtgWZjT12eYeTZr+Zvha3R/PZICN98s02gOoMJSAcqj
 bBKsqvdqy7qFbiM4vqfNlBt0leh73IhscVI9nUgyfLYNoOgjdcXlQoFKWZ4w0zL9qzPU1dOWad4
 9T8ZBkstqOwFn4wT7HTDdAh6D8x/UgokqbhvYrQOolYoq5rv92Hc/047cm5qJ8Mem0SaK4ODtWx
 KHacfhol5/TuNvTl+fVxvwsHefpmlYTd4hTtfaAcGgsvwA48+GloL+FeDz6ZCnwTIxsQ2rLNdxk
 vEmIbZslW5l28BLMzjTYIm+bmFfNgsGyfUu5uO3dhMYmCdeq8qCnbHFbqfN5C0qeQaNjM3kffqh
 /20oY48rFvTX5ceweKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Added comment, mentioning bits related to lossy formats (Konrad)
- Also handle SSPP_UBWC_ERROR_STATUS_REC1 together with SSPP_UBWC_STATIC_CTRL_REC1
- Link to v3: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com

Changes in v3:
- Added Fixes tag to the last patch
- Picked up t-b tags
- Link to v2: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com

Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 43 insertions(+), 25 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry

