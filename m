Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53344D01B01
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCC910E6B0;
	Thu,  8 Jan 2026 08:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/NgMbHG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhsSnfa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E4510E6B0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:57:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6088pGJ24049328
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NRZ5PDF9RBE
 hUcKxfeiWyFu1TAhirkb+W51QleGLBP4=; b=V/NgMbHGwytnHcwRH+OIQIbn5sb
 g1pDt8phGBBmNuweA9cE5zhRdgAEOLbiKoBpoAFK3N4pFhjJAQh9+WuCgaqPQr8H
 ePDxx+Lfl8/v1CMv6dKFJU//sbNaGu/uE0St/HIRBgaro9CpLvnholPbJ80UZNBe
 tcx+PAS6r8voI/Lliaq0fLXGSuV4oMn+QRneWqVaA73yQ8/5zPTt/EpNffygC0Ue
 ux2Z4ubAz7Tlri/6eYKHaq3ELsR+Zes/mt/dFDMoTu2ArCc9eFg+PKdG43BImoAS
 39JJ+TL+9euaH/H894Uf6awGPsPRQL1aKM1O+94JqXrma1qalJ8SvgZcazg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8hahn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:57:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2e41884a0so368627385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862669; x=1768467469;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=EhsSnfa/BWQQK4gjuA5HOD2u7Duqojd1RNKC742epoWavQhcawgyGfPAy1eQ/ELjOx
 YGPDqyny/+Oa8V0fct5Gffi+j05GQXYDDNf1TZcA5edRDZpT9wGSFyULPQT/yEwjlhJJ
 WaQaICIFWrDC2fMBZKjbY+UbZZ1MNow/cBLUlleNILloOIACIYi5SbNC8W3HUxo9zBaX
 DISVgY1VeLtlAPwPtPrikLpAlP3D/8yMKQccS9DSNC52BrM6/M+YO+T4rofaDmAZnjiS
 eZC2Fk1VnkDwu7zurhVC5AYfVtVvxecB+LJlhtpfEbIp9q9AgpP3Du/IbbYkt74/VaIN
 mEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862669; x=1768467469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
 b=mbNVurrGYQDyiJj9TEbAf6eGvW/hzZgNMUy3095qo9+jIuQRQw4bKx5dKaNQChtdHD
 EXrPJFmO9J0Mo6OHvhg7cFjUQIqHo7IVH8eJ+WOx8ShYVF0XUz882OvAP41bipbVn6X+
 JNdckXiI0t70mCfmRx3ERQs5mfwKzGOOjDWV98w+efs6/6S3Qc/YqhL5A3J7uEegllfw
 1jFLZfSc1EY0G/HrT/xqoFqL0hQQkOa3MeSHrZVpDuDa0cBwydHyRTDPVm7tmPScfjGS
 x3GlW1JJYm9Nauc4dpWDRXhVSPO4u88z5BPJvFjW82aWC0E95pdObF+7NGPiiudU974r
 jikw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0l/h6NtJOFuqttHkE9y0kPrJ2w2xiBzNqCk8r2JnCyFV7ErLmDt+T3c9/b2FRkpm9A1kBldKFouA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6dvGdNwx7nHHSmsQGSliEFKaJ2taxHKgg3R2cElBMZm7QzH/6
 rq3d+jeQ4IKEQRV06NAKphLsGEwDEy00PqqGpKCGlUjxnCWhQ7rehH9qL7n17mrJJsnY4DlhGs8
 J9yFFdbm5NMjZ+eZrVKNaCGtnSKpchQ7EmV+/fc9RsrP26mcSew732gIdCUerW8oadvbcih0=
X-Gm-Gg: AY/fxX6eBhDbHM1EsJX/AUq89gfPsHFSWZSYsShRD+aDCVlf8iQqjr0jlvUx1PXs57N
 icHyTAcXN9Y3GGZedUH6j9reS25TkzQZlc9KvAlvZvg37ehvMNuRj75RqmGAzBzO6bQJ16DYX5Q
 pXjGW2R0PqJc2wKGiynvxD0p1Cs5cXBoNOvwVXtmAPrEpPIZ7UB0+feI/zZHwNP2UbO+phgY6Zo
 /abF/yAiJC3oMwVJwgw4sfGoYG4IALSx7cjAtuwMMfhCc0lThs6gW5vabL1rlIi5yNpTkNYwKtt
 C5kTmYiM01/pkBa7HtB0Q/JqMno+/ZES+gUGSNE9ewpLt2NMXNyFnKXnV4F0I4FAWBBbKMzgasV
 n2CEjfo+OxVDO6JX1x1OFMvj3baSamzPmsXmTkBuyX5D9sokPm0eJuLYfhP8iiQAY1lo=
X-Received: by 2002:a05:620a:298c:b0:8b2:e4f0:74c4 with SMTP id
 af79cd13be357-8c389425fadmr683907985a.84.1767862669513; 
 Thu, 08 Jan 2026 00:57:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLLiQ2dezWmxrUQBvh6EJdewjfDR82QVVpGRNZoYXLCqohZhvAtKpz5cj7Yjy4V79SxksFKQ==
X-Received: by 2002:a05:620a:298c:b0:8b2:e4f0:74c4 with SMTP id
 af79cd13be357-8c389425fadmr683906985a.84.1767862669125; 
 Thu, 08 Jan 2026 00:57:49 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:57:48 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 03/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Thu,  8 Jan 2026 16:56:50 +0800
Message-Id: <20260108085659.790-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f718e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5BPzleuu5TsTDGOkXNT21pc7NJi3l3Ex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX28QHgeHwG0RE
 b3mEKdEhjE5y2895Q0h3qrTi+RZ1WRs/jcw8M+B33jJaGy1iAMJxQAfuS2CiCzzC5KGa5fiESkY
 TB8ZAkBMc82AzW6tK0l89E1sNHaGthO8EHGAI/s48WIwrQO1YGIgvlxE6Lc3w2z0kMrCTFllqzc
 peKb2x8QxYKufWXrGsEWBQAoOpbjD36VloDkKv+Ghw9uw9NB/ARB6BunAWsHnIq1bMvD1QMwd1p
 B1lEHWEcFEgBGUp+uKewH9KCkt1SCni/Dq+AiAoL63Wa5nsr0ErqAcCyi1Sy2bZgAYMX4zzueou
 7VXlkzYdGrvrhdVgQH9YvAPEGldJWLrA4KtwswEzq1ozq/CjewaxdPbLsqv7lOn8383HeRzfmct
 cKbiA6YAz7cSZA33NvruqdPOqhv1s26GBK+KjpwifD+xEpXTQtvCCCedyphUjxVmjTi+IRseNYD
 FeyYUHKfnOaoV6Ypm8A==
X-Proofpoint-GUID: 5BPzleuu5TsTDGOkXNT21pc7NJi3l3Ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

