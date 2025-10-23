Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F89BFFC76
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA5510E8C8;
	Thu, 23 Oct 2025 08:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAis9s7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFAB10E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MKMXYU021106
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mz3AW50CZzl
 RHFBJ07H/zDGQyFPRQspBYOGzKP8xt1g=; b=SAis9s7RiP4SLohaR1jKE5gv3Vg
 dpCapo4DK/R+/sx8BHhnFBgQu5xlP59mniIkOVOg5REcVCe3VL+zMnvCJ9Av0GF/
 IpC7M/5JapZAih/WCqhPllYhB0Dv51ZPx2PDYeCuta4rj+Z1iEWIjxkg1CKGqqNI
 QdXcqXNV3gwLfCNVWXQS+HNc6oIyNOJuXMw37zGhyZP4F1gSEQ1ltqjr7yAYh7CQ
 CYCzPDZpT2iIvR+pESQEQmP/mFc3dCe2FKlQ5lbKvZ7juYpemhTS+bJl1zEF84qr
 ia+GOlhMSkP/YYUx4yFv9sLXZlfWr4R3ZAXty6YfDQfO4Su7BQA0vFVk5UA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhh69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b6cff817142so95770a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206842; x=1761811642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mz3AW50CZzlRHFBJ07H/zDGQyFPRQspBYOGzKP8xt1g=;
 b=wmE59kvVzpHkx1hX+qWena4yozHhX2fZRHbtVtuPKChoP8peMA8qIhA/p6J6RqUtig
 AsFWEWEZXN4pvcAOfNccryTQJM97YL7sC9Jzf6angELx1T7xIbbhwNtmEP4oT4ZsBGXR
 2M0+NHqpKxGrnvkaoM/q92P5LWzRKMMlKqyz6wTS0BfmbALuMwh4NWE666CchYxiA32G
 LFOEmY/Pfo85DiLpesKYp39L9uSn+yrwAoPJ92Ihr5Qal1+DZStP8GZnCq0rgo5s2DJo
 04UFZxSap/AakZ38YDs0IfjL1yu6k5+6oynedxTqFnvDRqxmcOVRRbvizwhhSVZMAi+6
 MhRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTWRyS3FUBzzmgJBK1JXN0kfqJdwyQUymVBS61+r9A1FAh4Faj7q93T6SZ3QDTzXqdILx4io5InGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNuDMSsl3HPLd6dwEaHmEONXtJbNE9sWMNNRx/5ZfUXH1fuj0+
 EDN8Sdx6iJWDecy71B8KxWe449NAb1PNHrDamY+kLU8uN11sLfCHO1Xs5+Wq1kWHfrmuS/fDRYL
 K4nug3KzkkqxMhG5tNxkaFMlo5z1WXsvuFvLGhwMZoTguf/tOECHaWgIA9Je5gPg++/OSgcc=
X-Gm-Gg: ASbGncvXUKEVcT8Y79pDTRQBpa0JSqz33PZGWLl1rOuZ/rTZhqkyEpBMisAJ//rX2Ae
 IEww+SQmJWyVrJuaokf7HwPokHWH1c6H3dUekdHlRyULhfNcNwc684c9kcBYjGcXEkBGTVLtu5B
 MPXLXFqz7Mp/ouftals1WuecN8K7p9AC5mCeQfrq1pbCzXqL7qa3B53qgP0C0zrbPS+TRSBi3xs
 1eApBlXd8S3WIUJF4l/mOD4cm6sBPWCUz9nSw+hKE7z0wPWmvwhULyhizA7/yKZX1cXLtp0PX0S
 nBm0BZulGH5WQEc8ldbFek7gKcXdg/z2TIG8mE41qP6xA9xEMYW7HrUFIDjaPezAm17QxucUgn+
 GNdro2UK9imOeU2EKcX0eEfUcVSDAburxtVLCmVgIMwR0MddORw==
X-Received: by 2002:a05:6a21:6190:b0:334:97cd:26b4 with SMTP id
 adf61e73a8af0-33c5ffb11bfmr2223358637.15.1761206842369; 
 Thu, 23 Oct 2025 01:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWOEGOBmMvhSpmnFUPZtvwT2JAqPOdlZF4Gxli8yHh+BpFytOCUKdhyL6VqRKtXouFki5erw==
X-Received: by 2002:a05:6a21:6190:b0:334:97cd:26b4 with SMTP id
 adf61e73a8af0-33c5ffb11bfmr2223310637.15.1761206841920; 
 Thu, 23 Oct 2025 01:07:21 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:21 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Date: Thu, 23 Oct 2025 16:06:05 +0800
Message-Id: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXymG1YpXBhBLY
 SgmstujLwVZEqN/2dWC58j6Q6F/zU6OWycQTyHIWCxL4LimuWiNlrfDv6gIXb7JbuqmrGVVPupD
 GHja/rRzpRymEGX994piD/dP5/dVc8rCzOdKCpSRKWF/sevjdNCXDqu7lWf7XPfoRik245pjfO/
 nA9u5No4bmT+G/YtmitynLpVef5QHg5rZ3beWjdE41kWPNuek6Ldpp1QiAeU8ZaGornKqkncMjn
 5DGadLJ86ko5zjwmVi5C7HAiaT/ASG/TRW5/waqR5ggXNuaKxXGuxS4dYvh9+3dt9Mt6mXfpprY
 y7NeP6brQG13UzBbf24cmU7eWsXV32bfvjWkv+MN6gW+TUWserYv4YCw78YLmGXTxXjB/G+3Kxk
 Hm68akrheAA8Z/kACsN8MxMLy0CDgQ==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9e23b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=o76S2ntNi4yxzKwJcEwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: HcgBjQ68JpHiSnITxJiS2gHygkn1MVkv
X-Proofpoint-ORIG-GUID: HcgBjQ68JpHiSnITxJiS2gHygkn1MVkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

Build the NT37801 DSI panel driver as module.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8cfb5000fa8e..537a065db11c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
-- 
2.34.1

