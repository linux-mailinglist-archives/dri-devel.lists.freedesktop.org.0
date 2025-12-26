Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2ACDEE33
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 19:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE41C10FA23;
	Fri, 26 Dec 2025 18:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrhWk0X6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5gEq04D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091210FA23
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8bq1N655875
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=; b=TrhWk0X63nN76CEN
 Txvv3cI9xk9ZuhJ0knooXspmzvrg3QdMB8ELMDQarwbWw6wtpkls/RTX/BxzksAS
 gNlWfqHk3NYSRe6B04dRDPjeV0opoeo2tQvLlwvGNTo3I0xaAPnq0LD6D+hg5ftP
 Y6O1dEQt7S38Z3giC+YVtGa13gzHNVplZfy+ucX+/USeNw+qfAIoIYy+7wD99rwy
 9xXDqszCzFN7OfFmxFIUPFOoIlBp7DEP23BkNK91IFxYw2AXZ5iRs2dKtkBIbtZD
 +Xs9LuXmLVOSUMtWNrABY6C/P+/+hN61IfOljGerQPio+6LW18HEkFGRsUOzVyPT
 CwlEJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9msthcx2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34c93f0849dso7445782a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773811; x=1767378611;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=P5gEq04DEDbEwnIvzJiaFylaAtE1nFJefqZnI0nZ5WC6djR+ckuXPuT3y9SbSUhtGV
 4PSpitW+WJQb52ph1d2ecqCI1laPAWXL0WH32x/3Ea0aSyZISlul7fE69ikokJGj0BRV
 ANLu/lfqQQ8TGs0KP/npBHJpNe54OJ9Lug1mGPIt/sGJU8LE0g5L7zY2Mbhq+nzn2sIP
 6wIBQb+5x371BbRMiB+aX+EsZ/YCYXpeyJSsWGah9ukQTYwQ9v618V7alm3kOnRBx54N
 kQBOXE5dIE+l5D3TAgARXbGWrUTB+oRTe6rP8DZJ2tFot+cvbJ9wR1WEFe75vUtGNb5t
 q2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773811; x=1767378611;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=TAx6UfihlwFEt/HOo3qpPF1cT3FLqsUaxtEHnFp0onzw40KMbX3YbJL83jALXjf4Fe
 jS1zHPMQo5zG0EZ0f4ILppnaY7o39LJB6lvEfRz/hiGRHGfJ4jbMcqlb02B7SJF1Qn4K
 6t799AirzF9RBDVeCOLWd2f3eykpzKz54SD7gXfSfQt49YB4lPEdUzImzTjgOyJIWDEw
 6TKn3XnoutpJa5VdJ0SGPiQhf5trUgBYISqMdJ0OpcGVysJxHcn7+/ob/Llzppj06g7U
 oVmH2b4ELI+I6c9CYBA6Ppr99xBb2pcJFari7D1okHzJ2jEusLSxgtaTZ5E7O8HzuTK1
 caUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMrarprut1MZleCjmDdmQOoALMzEKPrtSKK3jf9HFD3tJFcwGNBk7gsERA8rQmD6NEzhsqkcdKDqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOoVe4uO3GsZuQfu6niqbA5IpTXt+iZzHiJok6vsLf9E4EDFdx
 zP+0iKffEVQ9ws7ACjcLLT+RBYriIr+8HR0ArODlxqU5beZMzf+shperbKadOo/aJpo4+2QkivV
 8u/bK1Wu45N1UqV9GbHfIKRvqxWURgkolCWVqhcOtU5lw61yG3TYPdeqwzk5d/YbjWaA79IY=
X-Gm-Gg: AY/fxX5Ng0BzwvvQ/ZBtFD+xqr5z5zqpkzyTwTW8liiEPOrEi9Yv+twXNc4rKGwkhb2
 r6OtOjWPZ0iAcG+us7WCa5EGUTSLFDZwbCEorRIUg8K6mwwnWEc0lF/psr17B/atSrm1eOF1RRb
 F87E5jh/JSQphTXbSZKmwdBWkri9ANSKZ70x3vSxbw7+7fhEZo46r1Me/Tfe9bQMLAsLha/Ad6X
 cUBbRLqwwolHIYIOmE33kgBneHmnjnOJxHMQ0tVvT0ScwyuhrEmawWJu5pcznYhewVsXm8BD8+G
 /OHaEggxAp+p1nAFcIwC3bgLFiC8D63VOJSZRQJEh8T73BpQ/P7GZgmELI32499r0YKajJ1Nre6
 Ggkwj1sIktVrSH+CKL+ensCUyvUiuIKQzUQ==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id
 98e67ed59e1d1-34e71d6961amr23605191a91.3.1766773811518; 
 Fri, 26 Dec 2025 10:30:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaD8kQxfQc/TThojHQjO+Ie3t1EH+3EbOETAYXHcDtvrG4vSORZTdAIFwzqkAJiBzPmYXtvQ==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id
 98e67ed59e1d1-34e71d6961amr23605157a91.3.1766773811038; 
 Fri, 26 Dec 2025 10:30:11 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:10 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:34 +0530
Subject: [PATCH v5 1/8] drm/msm/a6xx: Retrieve gmu core range by index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-1-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=2432;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
 b=hn1AsMrVUsX2Z0TG+8TcZQT5a5wVnvQcQ0r/EOOjUPBRYXz7V79M72oDjV+3lvMiMbYkymYrd
 myNzut/c1GYBK1YrqvxMk0w83pVixNbiV/sZjlIBSluq34y5Kl7BG8p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX7crT0EfRxrrk
 1q0oKdIABurTX5zVpHEkRWoMt4ZW4MI6H0+uHTRL6CXvgW0pqOBIsg78UBqh1fETPb2T6YXjjBp
 bdWQYHR5w032Nl4urcmnPMtJtqsC5K3KzsCy9pnd+W26x3NR37tIn8ZjvkcTl2SLYGn1KQhr981
 pkto3/nVTk55jy2E/8DbmB4/prUtph1n06Mv6tY4xbad6WXAxVR0U1d6AbL5AHVgnoDKOzI6tj1
 XH2S/zh+mE9HATZWR+UE7TPr3WRuTYVsLGv0zVfVJmeN6eVteHFe+m6wkn270yWtTnqh8cpCG74
 66VP5slWrRjClSIyJJg//r29kmielLxnbgDeR2VNBPr70T3xcQPzixzlqs8AmconNSkc8UO5aPT
 XQkT96G3cX9O8whBANfW7jM0DF3HXH/EByHtVdg/0X3CL1hGnQ+v5Zha45jteC/HQbVQ2bToAzQ
 yBGpEkspWizrS+jvVLA==
X-Proofpoint-ORIG-GUID: EXURh09KWtPn2RH97HucHU5soGXFNSj4
X-Proofpoint-GUID: EXURh09KWtPn2RH97HucHU5soGXFNSj4
X-Authority-Analysis: v=2.4 cv=eMkeTXp1 c=1 sm=1 tr=0 ts=694ed434 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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

Some GPUs like A612 doesn't use a named register range resource. This
is because the reg-name property is discouraged when there is just a
single resource.

To address this, retrieve the 'gmu' register range by its index. It is
always guaranteed to be at index 0.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5903cd891b495f20e521562358068c7eea6ae603..9662201cd2e9d075425ac98bfa7c60989d00337d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
 	return 0;
 }
 
-static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
-		const char *name, resource_size_t *start)
+static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
 {
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *ret;
-	struct resource *res = platform_get_resource_byname(pdev,
-			IORESOURCE_MEM, name);
 
 	if (!res) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to find the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to map the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -2085,7 +2083,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->nr_clocks = ret;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_mmio;
@@ -2244,7 +2242,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_memory;

-- 
2.51.0

