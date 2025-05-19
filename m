Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785CABC3B8
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B504C10E395;
	Mon, 19 May 2025 16:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlCcQVgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AC810E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9rZcJ003157
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=; b=MlCcQVgrCh/zQBVZ
 p1sMHcEbsFpAUzSwCWUndtM4MVuAIJ1hD6dQ2kWqaG3h3ZPbJFhM2p7g/d7dW3Fh
 67Do7yKIor3TP1c42oIO46GwA3BaNWNcy3WgISuypR2EP6Y0RdIEYfN5slf3mZHi
 YsbygYecViZEJpe7lZj5YYfW8oLwd2Gjam+r803wrpkvHMenygZMDz8lYfqF6TUK
 f/mXQi5ZGEPf6oFCPlpNcnYC7Z3ydN8+C3voLErQ5Bs5QXlE3+YKaMoyKxzTzKf/
 zm7gNTvOWWWL7PNYawgEH9S0BbjlbE1eMhPKVz3evRLvWk6fDYwRp6lqkmi9+Xix
 vFdVIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4mub8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-af534e796baso2809330a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670720; x=1748275520;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=;
 b=IsRv4UM/pyruLy5YHaRwC+l0H2wUOzYSyRHXr43rBV0lSlEjMCgb+IzRyztzHpZSii
 qZDCkhcEzsr7OaC0/qlgK0DbH6C6mNGUTtra9GUvJ0Lu8MKfqMeE0juC9mKtJLmNBJtb
 2b9wCsUPsrhxoJ/5NDeRivz/eWQ5c/tRrlbvvcpgLHvbjdXn0VIi02iV7F3iHghDxzY9
 bez4s3aLOsr1hpRNLHBRZQEOSD9uRS+sMdVBXhTS41Xt0QRjI2vP3PE+U2Lj0PjYias5
 Uiw8MVYK8KnpXlbWsuCd+cO0F4a6Jj91ZIs38xqqmtILUo0WA6clfKXrhVVFvEHYyK3i
 SZBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdY0eHLJitfLY5tA9ZegezY/r0XLQy1yBdrwVYtiXZFJywD9PX/6ha/02+e5qVRk3UAyxBRByaxxM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzISLBbi7LS9QbYJ6OAtIZsrtXaXnVm57bKVDs98kiloozJhRur
 fP1N6tkO6JIBdSXIzVmtd5MhqM2bhbeXu5eFTNjukiCkSrNd7NefEtTeflQ1pkG4PgEHqaruL4e
 mE1/hiV6z+qvqKecLTnxJsJAkHPU4xDvCuKseBKv5Wf+LQjuvr4X2N5DEurdshJF6kMCaqLE=
X-Gm-Gg: ASbGnctyJLpqMoDhycqVtlnykA8pza2y+J3it2i3Or7PmAzP5qOk+AKDOgmRo//UElo
 6W1iwl/BRJouIRj5QjE4h7z8Za/8qX8CFNLY7tjcYyjPGBzF8cbrQ1ylXd2pU7UXgF9ODKCCigA
 no9VF5fo9B5yWZztQbZewo317ZLmrteKben3so511cO8+PB0QP0Af4+ciAVLcmDOVSa0G9rbQr0
 bx4XP6pJJFxBsiQftZrD3Gm2L1m4fum2bzOs+TziXRlS2khuWZ0aPhYtq+gvsQyQYkhC9LAMipn
 YTnF0mn123iZDAm3lHA0FumAqZ8rFeuJY+LMK8s7IUOl4WEVKvy8FB85Wbq2dXNRR+S7oOoWMPp
 dx2s+h8SSfat4MBMEbXMX2klv
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id
 adf61e73a8af0-216219d18e0mr21996847637.30.1747670720437; 
 Mon, 19 May 2025 09:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRGw+2xgpgtgdFOPHQKkmBXnPLv9iv9BYNbokVamaYo0cwZzI9+rfZEq7etlPcP7JKFvfusg==
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id
 adf61e73a8af0-216219d18e0mr21996802637.30.1747670720058; 
 Mon, 19 May 2025 09:05:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:31 +0300
Subject: [PATCH v4 29/30] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxmFi52JXvJ1CCkpTL5KufBplkJro3M21X2ntMDmC8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z+0x0FUsHIrIe0Eg95z4tvJvjpvHMbEaErh
 VYR6GD3cX+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfgAKCRCLPIo+Aiko
 1dGBCACT/MY/vz/hMHTlHhFJBlS+WzI1JAEi0dsryovjblh6D5tWPLnsfC1quu2IqIb+e0xkrKu
 cv0NJxNDDZFC8wPMMdvErAlhZ9IPICyuhAeGWpcSKRqxUiIPkhjYfVmYeZs6t2tgh4ZYvCl/Atk
 WsRltJdOxYgLGwEiq99ie+NLyqGPBQ1TS6INtkAToXrCuzWDG5Q8Rk27eobt9dT3Aq1Sozfd1QE
 3LVnBTyL28x0VRyIlIC5JpicKU7FI8v/D/kJawLOCcQie4QbyKT/+9CPWjreSdFYPlF4ti9S8PC
 OP/xhMBx7cTX1vxSfTXqXqAgqId3jZpDMMmsZ15ELCbIGYbE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GhXHnqw8R4FraJSaEu-lXE3DP-FG_nE3
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b56c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GhXHnqw8R4FraJSaEu-lXE3DP-FG_nE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX+oxZdUvom4eb
 cydga/qPx72s5q+ggTThqkBQm+gN7TQwhWn3+mb8b/RycQjW78bYzd+p0N549Qo8Hd5SxsJUcut
 bjXAuDNfUHYaRWGL8gCJa3nH71HGSnqSHUQZijoI4B+TxvC8SiWK0ZONfWpl9KnQybb4U2o9ZQo
 U+V/bMtDEBjzHnpM66c7sJa4kv1hPDh8mbKl9g+v79IZ4vwnObg/TLJnnkUr1BFhtKSebVvdPG3
 7fy1yxWJi7oG1iGFdOONvZ4GVw8O61L1w+bgxdC59Fitf0N1/UJ4dvuDHku/Nkjid0Msl0iGNnV
 u4wnzPsYOqhMqmzOXkbKkDqA16z4HvpHOPMtJF2TPOKhLyhu97XuNFxZ5ugnqLDPXR31dPcLbyQ
 8U9BiTOtXC62T1h4DUKatUugvoYQvxydrQBz13tsbYVsfIUYdHD4KkfoHjsMc+MxxVHi5ZwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=974 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
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

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

