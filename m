Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0EC7AC5A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA8810E8E4;
	Fri, 21 Nov 2025 16:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkiyalIQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVlZ0tov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34CD10E8E6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALB4KHo3911797
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=; b=SkiyalIQG+hp6ImX
 fwpl1meDno6UhtCuASPEZImZA2kBEoGJGLZXcnE4/489oH5LbbOpB3cz/XO9zU+h
 2i06C8SJSzkSsmDaFi1AkpfPq6BOTsDdkIZ8xfmWdXUUlYMEGwdm/Mvr0LGIblbU
 b6Ym+PVh2qvB2/QpxUcKA9WDncLeK2FWaWfnvoBJJWFolO8U66Okx4eKBXQfnWmf
 1HgTkAZ0zfEBzemDrGHbXVwE4vHXKPtQYZijUogAvZUfXdKI+63rS5YcZqF8VwIC
 Bs8Q6Wjc8qFmCa8Fcnwvvaxaia4JK4uEoW4Fifq/NuS5N+OgPtRd2eqz2y+bIIWO
 a9LjcA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsgxme-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:02 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5595f2366c0so4254090e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741642; x=1764346442;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=;
 b=bVlZ0tov2fuA5GEwxqyJvkLpYN0HowhyXxOL6Q7YGnNYjIRm1otw4zgPDlWRudjBeI
 SE0ubjmUklh4XYcwX7WVqaGOzSPZt6LVufSWVd+fPuAdKUgxJkwP28cSOruusOFaye7Z
 fQRfYLMOj7guPaaKHvx7A0eBB+Ar/xGE6EYkKSxrtdf4iKGzFi0hkL5VNzO4NwY5syfK
 znFQ3p9sVrPFmlaSdqz70DXJ3WjOe5rw0lEjDpoPFP+dn0vaTT2K2b0Tm6rJeA2lmUNw
 1+71BAQ2uOZyqT+vrbDWOl9RHC0wJegJWw+0E+4jSKmYGNYQaXTh+B/Fo4U4IlwIfDpy
 O3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741642; x=1764346442;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=;
 b=YEWo6LLa87Q4H2N8nl6hxrnz/JsnCfOp9gpBpFrczBwHsP8TtjcFMA6juZPc2G5gGB
 O7xxCc3Ttrde3NI76dx+bvLf1Ie06wsF1Mxhrogr+a0jW1TJrWiaUzeIH05rhZpRD5YB
 CJ6ejt7jWB0DMmMJX88PK1URfZx6YpJBr39KO1SUssIqbNSdVsGXMoP5JGJbIpcDcsI1
 FuzuwX079XlL281gDiXrdCmavajsH2WSQcZXOR7ULGI2Dw0m0pztMw6sa3UVXySorqa1
 sF3hKmBKrD2Ca//eZMlYWpDLyVG2aGMymCmeyVGN/1pMu1Vpd7Vk3l+cD9ML2TliX335
 cLiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUSEjDfn5hBWaB/x9ps//D3fp7jKEJYwR1gwIKDCq5nn5ZHnHZwK5PDGMdsK/PVJa7C4/tHAJ9ykE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+D2uR8n3hOo8BflQprobpb+A+jUlYNwPFU1qewip5cUMtxrk0
 65pbgylP/q+6SN4TwANuP6dZxjNpQ5sKQerFoFHCLOuyZo+6Es5VAnxHUIgrt+HV1Dkcv0k+Eil
 rh/M8k/4UHXXO0jLAsA8oQV8GnaIwO1LoWgGeIyPWfHeQbqkQosEKcMMAP59WBrX1BZl643I=
X-Gm-Gg: ASbGnct7Mly4wshHEiz1MBNzqn1EDz1ccoS3DufzC1INdAX7TDy4uH81/8YSWkoLYXA
 FCKqjmInetVDsiY09l2OrnfQ5mbXfD+dxoTmHKjXRPNTex19dFNMeHGU4s0I5T3YzS3EEpNgkJ6
 trru2Yk+ejsF63VonjnFHyiAmHsiyYjlj3usmKoEoNm0deVAX0rNJalLzrf1uF7ymJr4JTWn0dv
 eggZRnDk+i9VDE/yuYqV4r27nUTUGpDignEsQ7VpUgMw8LEEdr5zL2zjZeRXtbItW3GlF11bNmj
 anGDb9GdmFOZkh0zhKNn6aS2Ch6Pm6CrXdzjweNGTzzFJeq8s9i9anv9WKQIVg+1NpnYy82syPH
 BCRZsf6zUfQOEfJmzHwtYX6+9Sk+fj2Mc58oIbCo70Zn397Z03uJOKN4MO18SjwBb2lU+hGs4h1
 JVDOIwGXFmO4jKee/kPiGisR8=
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-55b8eff05d5mr852228e0c.13.1763741642330; 
 Fri, 21 Nov 2025 08:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnM/0HJsNeT25iNtTu/Q3YjDCZtGtx9Z+NralVtjRltw4ot5OynRvAetYDwgNqKSPGw7aNpg==
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-55b8eff05d5mr852211e0c.13.1763741641942; 
 Fri, 21 Nov 2025 08:14:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:14:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:13:04 +0200
Subject: [PATCH 2/2] drm/msm/a2xx: add A225 entry to catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4mjjExWwAmG8isEitOAb68AjLdD1g2ziYxcCmOY4EAU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/EjMk8w8VwPXYnUwkk8izbyavLfLvdeEmM3
 9IGrsgnHQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPxAAKCRCLPIo+Aiko
 1ScvB/4xN5d9jbwFWqji8MhwVlGwK7iGKNh4cm7keJiLglhu2c4dhRnZWZmbP2BhqlrnIjeffa6
 lOlp3Zrf8aQOfCLhHMtdayiZQZxtfFnTOiu0V8pPMvaLkWd3epKP2uHOsQ01wAgFvihv51vQXWD
 rqUDoQCPbwD1LZmXj7GgDFqMym1CU2tbcGE276lgkfqRarq+r1/isjjv5/McYPhasINjHqTNb2u
 WLt/ONhI2vDFwnPZmkZsX/2XP8WKf7raaBTHQKAJA388CWiju1cSBA7vm58gI7x/XUC/7qOd7KV
 fm9GMx6kkg07unEICogNTLrNHlspotLcoEWK008ggaEjteVY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3mfdhm91kUiZSQFyRwtA-v6OG7_yOln4
X-Proofpoint-ORIG-GUID: 3mfdhm91kUiZSQFyRwtA-v6OG7_yOln4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX2NIbohwYDlvZ
 YNSXnfpJiDu237H5CWZ7payPYGy/LPQ+VSZL9mNhwRYgmxDe/6QNoMoDEWwQTG72MQST5tGVAF0
 esdQMq892DAZHxAB0t5ia26QCe2kEa73IUrI5rVgVKrSBbTe0zUOigKpVBfc8Y6SkEexOEp/1C8
 UKO2CBFstFVO6y/rc7PykJDWIO+afgKU6wjscuia+pAUYZJZCxP/WeQ5By2kEwjO6RJEQSGaPnw
 JrVID6NtL+1s4BuwHOu78C+tebXNsS05QtrPWIHaVGsgxvJ/YlR4uRz9DGS5bvUJMls39DIfgpB
 uyMOCVHh/iX1d40yphFAu0m1iCm6/2AgOzYICkMnKJ7O+/GToAFghOpug3yVVv8pQvozg6TAHj3
 xP679zDRo9tDvJS5uzSaEdkNnZqShA==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69208fcb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tn2a2yLXBXweI1urhwwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

Add catalog entry for Adreno A225.6 as present on MSM8960v3. Most of the
pieces were already contributed by Jonathan Marek in commit 21af872cd8c6
("drm/msm/adreno: add a2xx"), but weren't enabled because there was no
GPU entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..9ee4c9c4dcf7575a4fdfe24a14cd6acc99f5de1c 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -42,6 +42,18 @@ static const struct adreno_info a2xx_gpus[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
+	}, {
+		/* Only for msm8960v3, v2 required a special firmware */
+		.chip_ids = ADRENO_CHIP_IDS(0x02020506),
+		.family = ADRENO_2XX_GEN2,
+		.revn  = 225,
+		.fw = {
+			[ADRENO_FW_PM4] = "a225_pm4.fw",
+			[ADRENO_FW_PFP] = "a225_pfp.fw",
+		},
+		.gmem  = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a2xx_gpu_init,
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);

-- 
2.47.3

