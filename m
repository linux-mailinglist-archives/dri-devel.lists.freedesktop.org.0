Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C3AA7F21
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A381B10E389;
	Sat,  3 May 2025 07:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0DKXqSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33E710E379
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434n783010828
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=m0DKXqSm6EyfaLu/
 aYULsLAbxD6xsr8J0khOtrg/r6TS9wBbgmx1O5oBRtjc/rP/H2iThpYEyWv7Jg8r
 PzFCnUyrxyDGl8NYCZ9fUBH/kVlf1HjM67qz8M33uMcoKkQ7lV5dmHro8w1hcK54
 4ulb/K1pkzIFP4JMdXd3lXkJtiDrPoLeCdqBHKEZcRg/E/XU7I2vC1w6YyhEHl+c
 0HFzkpnKoQs4qsw+VRdyYr6mtql3+vXsfDYiuwEEl+nhpqJyx+USTTXiAvY/wBoy
 VfqEE8IjVndeQSCu2zw9CXMg6IrygxhY+sHmDy3G2PWbPu3ZlA/6JiYSzARUNNd5
 MJvW3w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce98581-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso42750756d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256646; x=1746861446;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
 b=qCpq6T23eHZKkgbvLbggAphCcTuW79Id7vDU99tNnaFuujiuS8lZ3OvH0W7ScTJW36
 XArn3Fes5UhYREDbu0hOShF32vKezJYFFGFd53A7LIzXZP9Tymroj6YAnTj6MSZdR3nz
 FP3Jh3xPu7yxmbG0WGrTZbfeSjyAH+GcU6Aqk2P5Sn1XnBw1aTpQqTxMkk2SZ0DGSOFu
 MEJVq5EgJqmYm3NjTq7qAoefJanC0CYaYuxESKJVQZtQ7daZoQ0+8D+Q/JehUyVnnAgY
 wXd1NSpnl6nG7dTDvB7gyPBJdeFaSsyEE+MbOmOEUvUcngVEg7kHerQI9rlA0B2J3Jbg
 M+aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Oa88ADKBcXUSODWXjTp15PmWilImxhzN5YOmg5S9m4E6zAebxnCBKT0HsNUqt+byrYjOpePQKHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh8ZkPQNubDg3VeIEVmr63TEP1TbbTQoQLuTaTFT4rbkHXLeqV
 uQKwBZIgvnzmReFEnuiQHv6+vEzqtbCgXFhFpEn7pleV1HJmObmlrYokxWG00gCDujPBbhjU56Q
 y2XXc8c6qV/oWYpPcw4HOwbExudkHI+qDcMu/xM47PdVfEgqqWvQ1sG9gTmsAVrJKwoM=
X-Gm-Gg: ASbGncvrUaEdKHvFOsfUeL4OJ26I2UAZ/mjag2tGhZ109Fuj3pL10XoRbekVxw59J8e
 ssXr4iICzIAcb1jIfDFIuhg2Ba9TwfSDT4nwm5ml8W8cBOpI7uhWFeGWJlEKnPZt3Rw34rp1KYb
 I3in6HG07fG5pGw/FwTNLTwU/8klYWARoz96VsDypU1A4VXb3CBjk8yAi5Tprfl3GW63qtAUD5D
 ISEYXo4+UkJH0aqNyg+nDfcl59eTbLb17b6rK4DBuAHEqYJGDsiyH1iSmjGuuFLaHUlh29LEwJf
 twt5h6IV5jilhQEB/3lo9d7hl/RG2QxLHcUbyjNzKpg9Kt9LBSEEMacdjK1yU4V2WQcq5gK5NrU
 jdujGc0OF+uhnNcXEZk8i9K3A
X-Received: by 2002:a05:6214:2129:b0:6e8:9021:9095 with SMTP id
 6a1803df08f44-6f5237fbbb1mr27600686d6.32.1746256646236; 
 Sat, 03 May 2025 00:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpB3pHTIUqZGcsBp0Il5fJqaHfOAUEGlJgoPXLApyd6X97N7fzz6CuVAEWn767gkXc6Hk4BA==
X-Received: by 2002:a05:6214:2129:b0:6e8:9021:9095 with SMTP id
 6a1803df08f44-6f5237fbbb1mr27600466d6.32.1746256645925; 
 Sat, 03 May 2025 00:17:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:07 +0300
Subject: [PATCH v2 08/11] drm/msm: rearrange symbol selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-8-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLuBMMn4ItSbf332XStKlW35YGuLZVxWVA8m
 25P9Ac1XzKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1dtxB/42QE9ea3mH4vZB5MqtG3+5CAfJWvYdq5Uau9Gm5ZB0YuiFOpwCgBvNwzk+ecvA6/grL4e
 Ennjfd1ZhPjowB1gdRAPbNturCs6p70ZK9avu4lTx7KkdsdwK0GQ2OVYxRiUWDUgPFTW+4i3GZe
 C0G4hiUkCoZ6fzWHddY98lM1VcZBVNA7/GvULRuc/tiFn6X6nSoJ6qnGwqLOsKOhr372i+QNz5P
 8NKNh1G2j2ahLeI6lkyFnq4fWEu2riXsU5WB20ZQEPptG60ZP6VbPwk7q5PCQwqnqjQX6SAXR66
 DtOgoZ7koBsXNNQ9I8KvhvQhqLOsgI7VjgKYsuLdoiwcNMQv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfX5YXfu+NKhdF6
 yW5wDLoJFrelll2I1tZGjzhxz8pDFz1CRLxGE/idQStBNfNzUK3rU7o/4ZdBkocnNTTnTER+STf
 cEvmCZ5zyg/lLR/8Tze9hw5KwmggqUvF1nZyeCGLYg7AAF74s/GpG/NNV5OzxEBcZBn2zY/mN9g
 fLB4/bXYsjvv04D11jSUnDTTbIsn5JA13j6McghD1hG2s/HTSInkmHpFqvq6v7R5fXF10H0oYB9
 Ct+cAqeM84BB8L19PI+vbCOnndsBhpUzKPEpwhafNNr5JGSaevrC9icROq2gwq/nRS1EuAhBFRi
 turDZkETNr9ugcGHPDXjE7FQFR3+JoGjfKqdWYvj7SONDuZZtixV2bdqDo0+t3QwRhQFEol6W1/
 ighCu3fJeGIfreEeT4mWbr1+I844tknLY1HPg1I/tmVW2bASMYV6Cpiejiw8c/q9wDKT4Pzp
X-Proofpoint-ORIG-GUID: tGGzFAajAf5gxdL0KkQpLltilSUw30al
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815c313 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tGGzFAajAf5gxdL0KkQpLltilSUw30al
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030062
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

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index cada5832db3e894c9bae4c6b0c6d935dbf5d933f..f6360931ae55a2923264f0e6cc33c6af0d50c706 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -118,6 +116,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

