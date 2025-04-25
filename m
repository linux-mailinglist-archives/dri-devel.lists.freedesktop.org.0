Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B0A9D235
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFBC10E9B7;
	Fri, 25 Apr 2025 19:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZvvYB8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCADD10E9B6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrgu011039
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=QVF8qBKl2B8UgSSWNGQxTY
 skqSEtcYIfpjzN6wFXrIk=; b=SZvvYB8iEz3In35Ka6cSz6aCwXIGmYgn/avNAw
 9nINTBGkTIT38+rOhBV5VJ+Eb0W+B3Zk9HtH7WSDyCckfs6BOWRhJSZzi2jxVAR3
 H44LaTmGwtq0Jf6IoV+LIK/rZKvbjQkOvdfJX+hp+BNyRSg0EE0qTBx/aZqz1+eA
 bFIQxn4glIU8y+r4ocjDtBzmGC4hkegsPbUvsKymXpx/u0hMKMV1oAHuHNVt+16U
 4FKqOWR6rLN72cSUTQvrKvUVAin5TROHsZK8hIAb9I1H5DakjrkYMnu4yb6kzKdK
 f+aB/vMJZ6/X/2OvPXElqA3B3JFOZ9QPPPUtcq/V7V8uX43g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jab9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-47ae87b5182so46085281cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610552; x=1746215352;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVF8qBKl2B8UgSSWNGQxTYskqSEtcYIfpjzN6wFXrIk=;
 b=iJ1yiiAAI7E5XVaZUT9CQIoHVXmyBJgWa6zlhpLymPXvUzFMhd/ZxPMfIwxL0Xfy7e
 bDbRVVSaHYFsmJpxAMxX2HFry29oHq6rWRksHrM+JQmXV8DC/XobvDdaZIYcJy8xyTll
 elAPH0rqGbO18lwR/31f4KzY/l9S1uPqQRHnzZbGer1uU/TaKcXU+dMMKAMumLOrEcDI
 tOgy8F86IDmz5ZDDQwG3mDKxNHwnDDJ+6/TIHtAPan6L5b2EvJBksGqUlLUG2477Xlff
 p/HJ0WQ9+iiTr36zkeuBf7AXNv/oueMvIwXtYYXX+v4AcyUN/8sNofae0xxmjaOxqXwH
 Vu2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxMtNEsWo1F35bcL17yVAMOM8x+nimWgf4MJHKEg13qtYnBUwuw0V2ipFenQ0Zz1NbuNPclAnMahA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx60gth8koHa0yLLjxZU7rQn3GkjCLez/vN+vssLyzdQz9+Rt2h
 zLCKKxehfMlx/pbRJ1Rod7pS1A1iIKMdgxHkGZt710Eua15/151NBDjnMq0LvUmEx3JAcTkAPhT
 BEWBMpmGNjL4CVUXHKAeCiy5jiWuAel6x90VBog/61qEFPUgIobgOxyvkd1vhfHu5mmY=
X-Gm-Gg: ASbGncs6Z4AP3c4UzUlGWCxzB/YxdfSJXVPSEcHHpYkTaGShUHZb8Koi9xNKicWlJtZ
 UHwMbNrDmr7ui6rrSbZERiA2kC9F4ecYR8r74wOOwgicFAdfYh7JCdcCp2qdK3umAlnUhTA02V+
 NUmjovIxWUu4pUfqBMDAM0pBlneGvQcMdp5lIe5LrPtgjVwwwMpGTzpdN49P/V6J1izzJIOL/5Z
 qYkFZbXrBza6x+QczowukpfognYD1tMglDzUqDYOpv7769v/8YeUgF4TdBM+1AVXEFqPDveBwpc
 1T28K6ge06dX3twefy5Mh7b3iD6A2MnUDmb/eZNrIf1SfKxMEPrDedmseKACNvGUilf33F+tDR4
 OZhJZ2Tz2fft3BOD+1bLqThJh
X-Received: by 2002:a05:622a:1886:b0:477:1161:2361 with SMTP id
 d75a77b69052e-4801ca7cde2mr53690911cf.16.1745610552053; 
 Fri, 25 Apr 2025 12:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGe12+bSLXzF7eqw872nV8cM5KVYfx4GqOPCVUm/H+/NHn2EpcmQOmblco4sM1BMKL0eK7+Q==
X-Received: by 2002:a05:622a:1886:b0:477:1161:2361 with SMTP id
 d75a77b69052e-4801ca7cde2mr53690541cf.16.1745610551638; 
 Fri, 25 Apr 2025 12:49:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Fri, 25 Apr 2025 22:49:07 +0300
Message-Id: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPnC2gC/32OQQ6CMBBFr0Jm7WgLkhhW3sOwKDDFCUJxWhBDu
 LsV9y7f5M/7fwVPwuShSFYQmtmzGyKkhwTquxlaQm4iQ6rSXGXqgs04odDLSYczt9gb33msG7L
 Knm1WUQ3xdRSyvOzaW/ljoecU7eF3hMp4wtr1PYciGWgJp2gKJPCN39kHJ+991Kz3/P/+WaNCq
 6u80UobUtX1wYMRd3TSQrlt2we5zp1n6AAAAA==
X-Change-ID: 20250308-dpu-rework-vig-masks-cdef0f4f3bec
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xiXYEHCnpydgNxOjmQEiL855gJzsxvVYn2BH/KS7CTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c17deoKA0iAJh/+DZAGse+ko22l2hMwtKUq
 xGp25hijyKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNQAKCRCLPIo+Aiko
 1UybB/4pmAg7PHT7ety/HAwm+pTqqAj6iNMngLsn/aKcZ6g8ABF6CUMcSWWV3FqQIqKNhoK6w/a
 NUg+RnoDADw9qYjLZL9srANPWDU1PbB44qt7gWXaAT36ZQ2WZg02RreScinr8EzwscjEGg3pO42
 yWCg3MFuVF7dDxE2HfSpiBoUS1TXmw3S8x7+DQdyzTbGPUg5yPtpNvBXJT9UPOl08ClHReHtFcR
 S2LvFKKpxQqYMnrR/pbrgV3PTYGYaXBkd1/8DSd1hwWtoeEGeCHGLLgplLCkmbaNuDR7WTVY8Gj
 MUBD0WOWKWPdRGO503yxxM9P2bxiMH00obD0KuPwZmvluGuG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 29nRVMN2-Jj489Hzl5bBIqqlNvEfxZ27
X-Proofpoint-ORIG-GUID: 29nRVMN2-Jj489Hzl5bBIqqlNvEfxZ27
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680be739 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uRdDJePGNZSGe7RuJwkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfXygTqbKgT1eiA
 z7GM7mlyTuUT/8kij10ARMnqLcaWZ4j/XBZ4bitIYJ5Xa43HjaBsXbS8uG0V5WtrwzMh71dN7fu
 fu4H7hwarEpFofX3CPaw+m4IJXbJVj1Suo3JVnkIgPgZ/dbL2UvT9PV0Bz8cw42UuPzgSJw/j/z
 tj3BvveCWwi0O3N4YhmPB32bkIoeiI76wkApWV03xtPnYcIgPlOzpAOOeH0ggpIZhMen6SgGzIs
 omYgm+ybpeh9yDGrxQ5nk6cGdoAFP1UDrFJ5wCpw1L4Ld84L/OJcJXMDhuI2/9wCQlSc1V0mq1a
 lB6uQ9M5y0lOnU3e8OIWEQ45kKEr9dnXB9cxuJgLW3OBQ8tF+nWf2yokgpre1k0dl+30D85btO2
 NYax856/bkjX4TIxrTfp3s3YuMu5U+aUn2MagyMia7rx+/SEl98HTg/TRHMzq2oe3Qp0/BOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=961 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
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

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage).

Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
SSPP feature masks to make it more explicit that using non-SmartDMA
masks should not be an exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reset Abhinav's authorshiop onto patches 3,4 (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 16 ++++++++--------
 12 files changed, 63 insertions(+), 63 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250308-dpu-rework-vig-masks-cdef0f4f3bec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

