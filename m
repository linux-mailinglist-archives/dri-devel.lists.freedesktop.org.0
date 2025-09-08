Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18EBB486F2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B1410E44C;
	Mon,  8 Sep 2025 08:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2xuWFxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A7810E45C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NVrM6030699
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MdRCXOUq+VTaRYE/Oa3hlCeqy/ZqfVMBxdnUcOZZReY=; b=O2xuWFxhv/JR6w69
 PZmQtW1nP4pMRYuaVV5+Xvp5xipHHGW7Rn24NcppvNrFjdK9xLbez3DH5eQmLQ4M
 g8pVXpvuqLOnwlOBY10A8XxswqfNMy0D/cpNuR+mmaGrZHCYydwquC71H9nYjT8x
 3GbN8eJRxkcUcWFIpEmkRcfv5lCSJGIIzaDaisvJFiiwRpVIl9LBH6osof8f1fM7
 Qq/zpXXKamka1KE01hcXzrH1DewQ1/vkNaS7hOUUE/JjwQrhIjEbKVcXalMXvvUG
 m+vVm6yzGo39//ObPqdyt/3hE2ZoIE9P+5qulFP8R00gdhFyseauUmb3lM43qBik
 p5o6rA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kuqhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-774209f46dcso2509450b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320055; x=1757924855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdRCXOUq+VTaRYE/Oa3hlCeqy/ZqfVMBxdnUcOZZReY=;
 b=CO8OBsfF3/PQPHqNXW2SiYDO9gjvG1C7ObICBAP9nNpZ8xMIx6twaAZX5zrcrRuO5Y
 It1yOpIhG2vEJ9ze8mGUcazi3Qsvz2r6Cd6Eh68VXjzQosD41q1CmTgHQXmRS/0zlyXz
 jmlqCtcFzL7burqOYuHmCxTCKF7UUqtdgF6goZLyJL0ngdWzAbq+iV1vPkAgZsd1gr76
 JNBPPUE1yCza7wZlvKPOOoV9r/WAUEP7d76D2j/8r75eM3hEwhAl11/Q6DBJz3uN+e0e
 rKMUgOqWWUF9RsARqsYwTRJoukJLn3U2B0Bdnlsz8rY0VU3DXLYiBs0jUrUxs6tA6XmX
 mKwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjMH5ef1QhVOEUtZIXF8QN3T+VkBH3wHDcBKMJHc9+G2Zum4ySCxoAF+NOClw4edkP5nxlXVNUIVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM/6yH4wI7r9TqM2D2XxoQzvqMubgf/Ey4MI618cSKJ+N1g4xw
 bvLrLdytSDqTpXiFHrBUWsGOCh5LSmAjCNnJb7BjVawVDDQdEGsBjXOsOHfWwqKyTWEtTUlncfb
 YOG1sZckOynTBXnhIh88CxXpnyMlYdyOud8kZkhWyhLDKByJAGqT50o/QkIjF/O0deDxKwHL6BN
 RjP4E=
X-Gm-Gg: ASbGncus2bpwXFToEh5q12lGr/f/l1jkw/CDb2eG1TysmL7sPghwQJD1+cY4cI+Jmbm
 1KNnU8S3r4VXxhPiDzhnDlhRSV4ajiSE7mNJzH8HQunGjT+R/egQ5B4ZqUTJkVvbcwFwDwvYs0N
 ToojCkn4/TXuaZSFuh/0mvTsDsJtJ9AWA3iwRwGxx5QXjCtsKiG+aWpdWe4cfWId24XQvpjVnPe
 6wl2zRKTViGL97ED8JAAu9X1/ZCwSU+kupnpr285bpjlqrhxhy2UCBnREwFqTtN1aVzAreRGWa8
 GFgGhgzj3iZdFAN5/sSIIjAP8LI9YM5JC4fvLxpRnSCmLWpjRL1HV3ECO+3MJCHc
X-Received: by 2002:a05:6a00:4fc1:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-7742dde571dmr9634385b3a.18.1757320055049; 
 Mon, 08 Sep 2025 01:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoa7rPmKEoXy5bkSRtHuEIinaQc06jt7tvsoCi9S+fbJrxZSLSkUe3lj6xgSq9+7CmJWvh0g==
X-Received: by 2002:a05:6a00:4fc1:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-7742dde571dmr9634345b3a.18.1757320054591; 
 Mon, 08 Sep 2025 01:27:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:56 +0530
Subject: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=1605;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=35cpBSeGBdUH66FC4H+UsUPYwwGJgjYHwRMkfK+RjKQ=;
 b=OZU+SZ4r0JqnOoFtL4cOXGhnhsKN5lr0wigU0s5og9yKoEQ8G/GdA8oV20D3i86tpktTOK4RU
 6ZfUfUEkIU4BOwAhLWMVNE8XB/6fzyhgC1jU6Rn3QsW8rvaqWHNa7VW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3krR2zq90Xvq
 /XL71qa22fN0SW963o38uiAJy2ciybAfw4TcSdqd8f1OkzKIfY/sbTbzL5eRh2jHJ87PLxqnWhX
 V6wRxdKIezePi3JmYiyiZfQLkEOrvQ6vD8qObJ++gf+qUngGSb/Amjnq9VHAAMdrYbO+ixalH9w
 Uw0RzCxGDSxbIKYWOhP4CYfNRHmK2HGg5fx5wVuQpGqfGshbK6yxJymd9OWV+nquKY2R5UbrRdu
 llSSXqYL6MNb1loTUg9E9zGg1+EoP1Kmo1RhjIjIympoXrv4SP1AgXr7SQL1YsUaNYGejeNBNjO
 XR7bPUgL0duGUnYSzhaGqn8+P3Y4cHvwMSQIpjQvOWSyzPhQ+zGO8slAu1Tjmo0W1PkzJG7ynlq
 /iuu5FhC
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be9378 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jdX7vir1BwPwhWCwAicA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 2PQXEEbsFG7drmLYvPKhd3FgDm48tor_
X-Proofpoint-ORIG-GUID: 2PQXEEbsFG7drmLYvPKhd3FgDm48tor_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

A7XX_GEN2 generation has additional TCS slots. Poll the respective
DRV status registers before pm suspend.

Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		val, (val & 1), 100, 10000);
 	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
 		val, (val & 1), 100, 1000);
+
+	if (!adreno_is_a740_family(adreno_gpu))
+		return;
+
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
 }
 
 /* Force the GMU off in case it isn't responsive */

-- 
2.50.1

