Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6607FD07DC9
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1BF10E81E;
	Fri,  9 Jan 2026 08:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlEfH4X0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCszcgV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AC310E81C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:38:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6096cPa81953482
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p2iydELEX89
 MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=; b=MlEfH4X0Oqkd9+WWa/b+2PkZb56
 xVTfEE2K1gl4jQoaJSkkbU1rOf/NPr2jdznoWZz+2mDPvojqO7gAhqoivcii+8QI
 xQ024+XRFXOqrE6eYDBJcy4PQWUvqJWe2rN7icrtRCl+yj+f5emvo9RBYeDiXnwL
 JsoFGCz7VDRtw6AaIK2rFQIeYla2MyeIxg6Hzs4AYaEgT0JehoRBteB8W9slV575
 f8iRbqEC5SiYxenrcaZTkz4DkRlaDC0zFMMreysBknW9Vp8h7vqv67+c/BkcJq6p
 VXGuubYHaSDeDHquy1qznb+7QtpI8j64wWIgFkTNja92l3bXWbz9y3Q3pGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaamt8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 08:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8ba026720eeso1050833985a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767947924; x=1768552724;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2iydELEX89MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=;
 b=jCszcgV0agqRVkjfH7Nh244fkMiIHS5Mu154AjJ6aALQIR3pRv4uoz68I5oyALMgoi
 TCpli2sHREEJTX8GCxYeLxEt4bR6m1TIDXANfomyxFkzmT8KCniAdK43OaHUkJoBWRRW
 FDYoQ4TywCvGzOnecoSqFjtwvAQKDayUTAuOGNA3VMnv78duKegA/G93k6VXeOENy0OC
 BTM6WdSyUmGP/HOSL+4vmvS+6LikE4lTpj1AJW1pfPmDYWKfp8+t/mb3Bl4FCqztTWuZ
 whI/BBRbruxEZPBxHhDusmyJw9cL8Yz30jLcKkRPZFCWLIvwbtNV1+c9EwTc1UeMwve/
 6f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947924; x=1768552724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p2iydELEX89MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=;
 b=BH/GjAgDVDQfq9D1WfZL6DdoDLQAPV1I6uJdlcG54VNhqk0rku71aZVhTpuP7MlS8S
 7A/5mEo7WjBhZBXXQllW1UsSXkLNcP71Cax2IjXq/fGfQqRQAjFjZWvCrYS+jm+ZPBaE
 fnfU4PepRi5CRy0M2YwESRH8hElWnHrr0aPNtSBkzlw19uEfRkVsm5y4RqccHnLw0pIj
 JNU6Gx0v5hHc2HiYvRsaY96I5z9Alh+vaA0DORHm3eorGM7ioByLSKVEVb6QlXGQUvgR
 uNhPsXCW/1xAiB+94vEZrObpu1bpXdCir/xQIt6zAhZiLsor2aA/jRs/yESsiOlFCS6/
 kLww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7CxbIBE2xpSoMEE33HZezU1l2cB8ozTI8sO8tozEM1RTugJwWWeI4jBXHwOHxFmljroGBe5YrUqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY76mB4AOnJaalSLKE/DhMIV/+kf2r3ebqD1Q+P2i+LjycBjIW
 MBl7eD+47lCf3LZPIJv//1876cAft0uF6/AtcDSnCoL9sG1QAOiookayJJDl/R5cLsOTHa5eDww
 H2PpD4TGSHYX/EOjB5A01M+VqtQzMxe6UTqHnz+zNhVl7u9YiJhrd7XCtCO2w5tMheUGS7Js=
X-Gm-Gg: AY/fxX5YvutZrDnTlyMIo4KZNLJaWk+FXYYxHwGsAKX1YKUymNNhonrQ9fC45KZ03AP
 Z6c+vmxC9mYj/5fIfT9OUsNEy2D0Ryz1t30mili+z1y7nPW2HaoINv5XU9UeP2nRv92Fc96R5ez
 JIukibGDZZC4ey8q1Sw4BgRNZGaksECHPknbn08oDmNXvwQp5eEqAw9zZTgA3tzgYmnPlo0ErTC
 hrTaw8k6L1m8xC9CW2OZaqv1X+g02daa+v1Fuwi1lF6NZcGiFZAkccrwpmduBYGzNTSvVTY5yeR
 HkmRgyVvE0F+pRYO6TL191Sbs1AVnyUBA6Yo0ibJJHR0qbJFkAQkYoj+tF0rmMOejmRw//AluOU
 0cYqwu4xQOGDBsIUqjIwd/NhBBVsZwipjrQ3I802BaH2QlNvhEkTCJgjHsCZkU6VaEAY=
X-Received: by 2002:a05:620a:2a15:b0:8b3:36d5:7544 with SMTP id
 af79cd13be357-8c3894203f9mr1062567085a.82.1767947924439; 
 Fri, 09 Jan 2026 00:38:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9rYzZuiEjS050fTw4qdxmLAcU8rZYTKxOswGCOeUlxovtPH3VDw92USgjLqt0puAdgHj05A==
X-Received: by 2002:a05:620a:2a15:b0:8b3:36d5:7544 with SMTP id
 af79cd13be357-8c3894203f9mr1062564185a.82.1767947923974; 
 Fri, 09 Jan 2026 00:38:43 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 00:38:43 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: [PATCH 2/2] drm/msm/dpu: use max_freq replace max_core_clk_rate
Date: Fri,  9 Jan 2026 16:38:08 +0800
Message-Id: <20260109083808.1047-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960be94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qtVmDkmmVSxoQgGSxMgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2NbJgX2wBLB3Qof78ogeULy-BrqUYJyz
X-Proofpoint-GUID: 2NbJgX2wBLB3Qof78ogeULy-BrqUYJyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfX+4O8H2eAnDvo
 rnl/E58xneNBPXw9pRjC7FjGWeo/LCVlnrsnA9NDUW1dIV8y9PCAMZKueJwl5YrgfTwNYv/KBRv
 w7VJCQKuBJIxQuZKIUI4bFqIsrN5F5/4ZMNOnnCIicuGVQ0ZWkejB9oALuTK0yxZnS4dFWxdequ
 vngM+63ldX9YiUiRNB8WPJE8Isx2UQssswqeh3fsyuc5b5yvIb7eMBxIt4ayHV8zMuFpise5KwB
 tE+SBHEfxuyg87+88UK1tMQXPvbo8IYezLDFN18758ZeZHk6ELRCYGPHMMCdGKUW0DyUU3+t4yr
 4SdXlit7hERdBAqrNmoA75iBeUKsGQZWYXIwdC/1ZbKGJ9kfYM155UlwKtd55r1ruJKw47tAAmo
 9TRAcAKyIzZXWnJFkGW/AD11bWpZE/x7s+137k/cIZfQZAuGEPWkvvBlnX9eiz2E0W8ct9a8E/3
 fnYflaTkOaEXdt312YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090060
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Enable power will use max_freq to set opp, so remove redundant
opp setting, and use max_freq to replace max_core_clk_rate.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c31488335f2b..973fec1c328c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1233,9 +1233,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	/* TODO: use the same max_freq as in dpu_kms_hw_init */
-	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
-	if (!max_core_clk_rate) {
+	if (dpu_kms->max_freq != ULONG_MAX) {
+		max_core_clk_rate = dpu_kms->max_freq;
+	} else {
 		DPU_DEBUG("max core clk rate not determined, using default\n");
 		max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
 	}
@@ -1317,8 +1317,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
 
-	dev_pm_opp_set_rate(dev, max_freq);
-
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
-- 
2.34.1

