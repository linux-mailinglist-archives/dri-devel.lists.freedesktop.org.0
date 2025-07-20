Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153CAB0B5F9
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD8110E459;
	Sun, 20 Jul 2025 12:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj2VxrdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811BD10E457
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:18:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9t20X002539
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /TScNC6zTNOCvvTMV/4I4HH4gXtKqdB6Thd+WQC9r2s=; b=Cj2VxrdFlmCcBmzi
 rs947vicwhDfLMZSTo9JAa9w+4MBd3BrFjZQTr4vmreMlaShC+zf70VYeqI0Cid5
 lwzdJ3Ab+x5GwT006RnWn+GpVAYysY3WunyD83VRJqNGsnfzUcJ6rQ7ANBFsXRYG
 OtV2GygEK2wd+VCjsCMB3++2IH8qn2y6AeX7KCs1kP+i9Tm9wu0Z1Rw5LF1JHK4v
 x0MN4BS6GWP+RC86A3gLG6RLqBXFxWclCCBqubyMY+a1dChQOFJRoh21r3VaAaK1
 9CjVbOrznBScdMPA1vVdew1uVXxQ6Gm97ehrtYGtQYL6DEu7ICfXUZd8uB5uLmaL
 nFhJ8g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rt7ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:18:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74d12fa4619so3100766b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013879; x=1753618679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TScNC6zTNOCvvTMV/4I4HH4gXtKqdB6Thd+WQC9r2s=;
 b=mcPFU5qcLjVdd4g7u5oA5eYifm0lqLFG+Jic2TgqiSdsdfs3XXi+4zdkIH5x6eB30h
 ZJtX/Gfdf2lkumBQNIWusG9sPHCPv3kukC6VbCZrfq9D3R5K0hgHHBWn8tPF7ik237W4
 gYioarryBpzFabWXqGSX5v/wfv1Z5e425kwSkAEYlCzFZ9bOOxYAVgiGDahNYIFhCkG8
 QQPj8ygp06JLCKr2cjEzfkazj1rRc8Of5zHjzAcFy2P1i/wHNKwJzENiIf7o7D/4OHEs
 p45WHaD4ikha5dK+ZdNVZECYYO3QkNlDItUWiATIJ3NujRV1sIrQiFSU6ypU2O9z0ce6
 WdlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrj24m1QgzP7PxeW1EQHzY4T6xLQNX264ZdDUIYhF9HN85GeXFkiLTjv1+eRjur+LQM710nlesz04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIArTAiqd7stRYr0nWmDYasgc+S4flQzXBY29plpNNf5Ze5bHd
 Ztp+N5lEhSPN8YmglyPA2sqGeyErwpOjqADrJqwYajLSI7Uq9/TuHzzcZpQmmyP+7yWYK2T5r3c
 nEMS/MXJhXcY/k84JtfyiCvsLP+bUDDS8YALRt3NLzG3/v1mp6eJUPzUrYRC8U6eGUMsUtgM=
X-Gm-Gg: ASbGncsj91NmRKldSXaX4sS3JvvebdDD2EkxUdfWbjSJGMiEqJV7UHmwa4Rzn5eChVp
 3W6Cu8TCZPI6h9MgDd6nVa2eZaAB6gw+Vxr0GV3HsldWmqGCEpfkTDGAv043iTTzl5TB8OaevLh
 TjV+p+cy/AP/rX3Zs2Zx0DbG/dyX26WYW5jex7mOWfRa5FvCBxMARu6/G5dtW2S6bDf71BSYOmX
 1cPoiY7QoZNMAtnJ8JhL1Hh8u7UzxPntEerTCgvc7DhltdyyYGJv2B8zpX/JwAitFV6wwPkgkVP
 GtkURL3EMBrd4JJ5mQzohCwAoR+PKdedYr2p5X7ghrF/2PdJ/h0ktfPUYPp7osbK
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id
 d2e1a72fcca58-759adede58fmr12676484b3a.21.1753013879227; 
 Sun, 20 Jul 2025 05:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7VV3dIbqLv0Bda7KAub7izD7dYBl2htnDCyzsK/RNWmk3X3ufAsjrIqpvrxS5nYqsh01IYQ==
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id
 d2e1a72fcca58-759adede58fmr12676431b3a.21.1753013878679; 
 Sun, 20 Jul 2025 05:17:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:18 +0530
Subject: [PATCH 17/17] drm/msm/adreno: Relax devfreq tunings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2469;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yo//VXpe8iX48jIZ0sCMtloy5TgF3OidJukwu7tRn5s=;
 b=fgzO+9t43IUEuMn8OKI3RpLpyTPjIfZFm2fuZ7JUwHO5rdQh18cOUA5e0P2EnAGfWjI731t+L
 30I15mVzH/SCXUskrPfsLIAz4Cbxjm7knH19i9nyCmqWi/Y180GA9j5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX3gc3vKKKWz02
 z1a6TNaVKQcbdwa1/Kf244bYk174dQsz4SSnMPvEcCahHmJkfc34st70jFWaIfVm6rtOzavcOWs
 zzsN3r2vRyGovTEkv2qEv8CNToPt1eU9gWsFPLSJN3Pu1q0vyfJgOMjEWHlM/WmWVjRVwZu4AxD
 71LCfWSJ9MVSLk7dpTInvBtdabclSNTYQhRT2NB2Qd+8tXBVuoV77K6MzJo3BPAejUvYiC5zAoq
 MvJ1bR/NGwU+kMy5mqsYnlrmlaV3KmYei7qe4j4IpIx42eh8PUaj2wmuY/u9ZSd7EA4MmSeslAZ
 VqH3F1IyUFRKNLbT5WuDUlZopiVY4BZTZaUYAN3G/5M9qIcys7yCbA2wam+gL5mPL1AxrKThEVN
 /e2ZZ/C/GyZd6ARbHevsLW+zP8ZlLP8W2ptAVZ0SCbaqrcyyrH1yBh+jq7fBRwtjuHIGbT21
X-Proofpoint-ORIG-GUID: 63CwwGBrRlIGVAjN6GvivXVaQNlgBBRj
X-Proofpoint-GUID: 63CwwGBrRlIGVAjN6GvivXVaQNlgBBRj
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687cde78 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=A_RMCc231MWr08KmCZIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200118
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

Relax the devfreq tunings when IFPC feature is supported because there
is no wakeup latency that we have to hide with aggressive dcvs. This
helps to eliminate the very frequent gpu frequency spikes to FMAX even
with common lightweight workloads like UI scrolling. Some profiling
data from X1E which shows the improvement:

DUT: X1E CRD, 1.25Ghz GPU FMAX, 2880x1800@120Hz, Debian Trixie Gnome
Testcase: WebGL aquarium with Chromium

Current dcvs config:

  +--------+--------------+------------+------+
  | Fishes | GPU Load (%) | Freq (Mhz) | FPS  |
  +--------+--------------+------------+------+
  | 1      | 23           | 300        | 120  |
  | 100    | 29           | 300        | 120  |
  | 500    | 41           | 300        | 120  |
  | 1000   | 45           | 390/550    | 120  |
  | 5000   | 50           | 1250       | 120  |
  | 10000  | 93           | 1250       | 120  |
  | 15000  | 100          | 1250       | 87   |
  +--------+--------------+------------+------+

New dcvs config:

  +--------+--------------+------------+------+
  | Fishes | GPU Load (%) | Freq (Mhz) | FPS  |
  +--------+--------------+------------+------+
  | 1      | 23           | 300        | 120  |
  | 100    | 28           | 300        | 120  |
  | 500    | 42           | 300        | 120  |
  | 1000   | 62           | 300        | 120  |
  | 5000   | 84           | 744        | 120  |
  | 10000  | 93           | 1250       | 120  |
  | 15000  | 100          | 1250       | 87   |
  +--------+--------------+------------+------+

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 53ef2add5047e7d6b6371af949cab36ce8409372..212963a5b8b57597bf5b01ab90893b01fd9c6e76 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -156,6 +156,13 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	priv->gpu_devfreq_config.upthreshold = 50;
 	priv->gpu_devfreq_config.downdifferential = 10;
 
+	/*
+	 * Relax the tunings when IFPC is supported because there is negligible latency in
+	 * switching power state
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		priv->gpu_devfreq_config.upthreshold = 90;
+
 	mutex_init(&df->lock);
 	df->suspended = true;
 

-- 
2.50.1

