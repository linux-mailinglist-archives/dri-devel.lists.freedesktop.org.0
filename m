Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9998EA70
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD35310E7B8;
	Thu,  3 Oct 2024 07:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh9BdgBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B3F10E0C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 02:58:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4932niX6016236
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Oct 2024 02:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=q87Q2dHuDJxAM/tFgGrfhU
 NvO2zsd1XaxZiQ5xUbYkI=; b=Xh9BdgBqed78RooLrts88+5MfXP1B2E+kA59iY
 fTdK4Ao/Fn6AsaJ5v1uP97tglHAJkFD1tvxi+EA3OV9chymXuzTI+vsEOqKaCDjK
 HDETzGokqN5rp8lyTUP8qFyfp6JV+sI0g1PxvrreKE63zJGd4osqtV8tAbkVa50Q
 OTJZui/ekBfeO3BJV5mAKuGOKder1ycZRATijHx9QqC3CigVgPtMylvx6ocXbuLw
 lb4cLYlq8WxTbh2f78ULFELF00J/8YAb8ywcUM/Qngvl2edn/FoGqRtyj8xvojuB
 ndsIyi1N8a5ALnbyQcrC+tJf6ojouxh1N7r1XV21LuvwT3/Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa12w9ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 02:58:40 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-5e1d1621e77so1166717eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 19:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727924319; x=1728529119;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q87Q2dHuDJxAM/tFgGrfhUNvO2zsd1XaxZiQ5xUbYkI=;
 b=pIgdL/FeLSYYgbKHiqQ0SiwM91AlR7ict8jwzXc9KLDP41PtQTJa9s8TbeN/rqmhsu
 Vo9wfktRZV2PYLcN8BWhChI+OrAacgVNQ0MnZSd6pfIJMoENphma0yQ+TDb1nrqIcsg1
 rcO5bFoXv718GoXdZLbKscLlDk6JCSINrc9fL9wXg6IVjuaQPQYQ8pSfkdOGL88bFV1w
 gG31YQOe9rQGxeqdMhLIxFLdGSwxI3l20lY/YOR4JtdT/mSjtWO+jSrwQE39OLAuon5h
 7v7EWanHeVAQpm4a9mlobpWaEOPvlCbfY7o/5oK2LsT+KIkc/KRPmxz6HNLfRB+qkszK
 e1og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrKANye5dQ7YabbrNgVU5oe6PCtP85YmXiVuxbq+sbGarFOnH/ozMSM4+eF8au2hsOLHzmCMs//Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTZKHjMDqzGC3OZI2/eujq+TAlcQR2nuUI2eleVBzk4/2ViznF
 DPZtztujLQfM+9Dn9KrLDmirCwKvuRDTdzTeY1YJ9AleCOZlbnC+BugwqxRaNaSe14ej+JsfYZz
 9VUEqA+YpEszU0AaJXu9fQnjXKmpK4RcGSem+pEa0W2QkUW1RrnSd6AUolZhcFU53G3yGpElDde
 rRyxYEzXp6514g4Ho=
X-Received: by 2002:a05:6870:a551:b0:277:d790:6e99 with SMTP id
 586e51a60fabf-287a404ebcemr915314fac.18.1727924319178; 
 Wed, 02 Oct 2024 19:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg0JvlIROszA+vBjdJya8knWyGhXAkKydvC9LIezO0qqNQPEf4Qksob0bkVhdDzfAP+Z9+3g==
X-Received: by 2002:a05:6870:a551:b0:277:d790:6e99 with SMTP id
 586e51a60fabf-287a404ebcemr915298fac.18.1727924318822; 
 Wed, 02 Oct 2024 19:58:38 -0700 (PDT)
Received: from [192.168.86.60]
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-287ab9b5ba5sm188924fac.21.2024.10.02.19.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 19:58:37 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH RFT 0/2] drm/msm/adreno: Setup SMMU aparture
Date: Wed, 02 Oct 2024 20:01:31 -0700
Message-Id: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsJ/mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwMj3cSUotS8fN3i3NxS3cSCxKKS0qJU3bRU8xTTRMPkJAtjEyWg1oK
 i1LTMCrCx0UpBbiFKsbW1ACRXU2ZrAAAA
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=bNYddmgsyW8zpJaljT25nbUCMx0j2dCKdXD1Dvmcx/Y=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBm/gkch2/1mQLQC6vdzGTNgJUZUGqjflYJhWQTm
 hKmRcBFeIyJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZv4JHBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWDMg//QeesKF52cIqBJpczFAINE9i+3Uutx4KLVAMSvm4
 fKb6Yk+MKfdjkxacJjdJvVw2ABwCXsVCZsdi/8e0kk8HuSKKzQytBdZYLXfGMyot0dKLA/uMjds
 apF2Io6qWCaVZrcy/OhMmpjSenKgw5wgtNaiiYJPJ1Nwq+0AFBka7mEHW4nrAv+X4p/1eWpGT/8
 RUu2rrdAwcKQYP8mzky5BCPr7L0nL1W8JjxbfF16dTWSfhzDNNE/+zvnZfDa2aIGmKNqvOPWV7c
 zza70jdEfgL9NBwIS/RezeNiWWtkxf+g9tcKHmQK/maoeGvN8wRshfhccvJOeqHGDQ2u8p8tTez
 z7Dnw3+rr8K0zI7dFlTmJNJqjmC9TD52VHoq3LNByuZzjOpziJ7Av2Rhx8sgwA4kZD5zXtqGtci
 IlZgdT8oz3vIvcsuAw+6trOZfoSsp7zEURhQmXn3hHmphcK6yth4PHSJFT8ohMyuyWGbYP7cEcG
 l624x48xjLA1qZ7HYfa80/kQnGPs2MDnAoVHN6hrE0v10MLk739fUiinOeQNy/cI2tSCmzjnu5f
 WPIxeqJPl6t3O/wIq6jfFMjW0WNQmEOiN8QAikMMQI8QP7RLIybFItf4DshLDCZS3K8rizTjh8C
 crfPs5/ZSyWA48j5qlO8q4HHEAjP6mzDAjclZA8xXeQM=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: H1mkfPDt9--a8jF2rT8_Y9dsekE_zl3v
X-Proofpoint-GUID: H1mkfPDt9--a8jF2rT8_Y9dsekE_zl3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=938
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030019
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

Support for per-page tables requires the SMMU aparture to be setup, on
some targets this is done statically in firmware, on others it's
expected to be requested in runtime by the driver, through a SCM call.

Marking the series as RFT, as this has been tested on a few different
modern platforms, but only with Qualcomm presence in EL2.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      drm/msm/adreno: Setup SMMU aparture for per-process page table

 drivers/firmware/qcom/qcom_scm.c        | 19 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h        |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 4 files changed, 31 insertions(+)
---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20241002-adreno-smmu-aparture-fe7d5a1cb834

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

