Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA852CCC4DE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC8A10EA05;
	Thu, 18 Dec 2025 14:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI7q8WVk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvS7Eo1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8335110E9FC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI8fmlw527812
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5hM0e1rBGnltIWyeJYcpYQbcX0IE2b0dL5xuJ66J2o0=; b=MI7q8WVk8ulY+12Q
 QRccXdPjadFQ1J9bY3II1BUAarYH3v26lopQi116HhaEhoZ6a+1WfhcU9hSA20mv
 kXz18XdpG1AIpklQGbkTqDXH4cXFWrruuSnLpvH4DPWyqT4QVqAqpO8tEXX3KHEW
 DOCL8yRp7Ai+PJnjbQ+yExctdRhXbXaPMOxPJ2eXh6gt8lL4Ht1GJtM+LTOH5Wev
 HCF+8gnMYJODOGmcshbmG9IogbQD4BLhw66c0nhijfb+m10JAkbrhJwQw5ozgNGx
 N9oVxCS/g13kMV+bzGiKbnA7zpeXFZGfnfQ0/QkAVB52V9+voDhR9fg9bhNgNhzG
 54yw5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb2x9p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so17853531cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766068710; x=1766673510;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5hM0e1rBGnltIWyeJYcpYQbcX0IE2b0dL5xuJ66J2o0=;
 b=WvS7Eo1ri1y6fzw2YZi6o92ZCLkCvg1sYilVLUq+19CXhv8lM0BQEPrIdKAbYuFM8u
 CAY/Zej5cmpzB14wVRXaXdFe/7NbdhvDe8iKG2rfPQFp83Da7L1jpUvpUxZivCzDyFFl
 GiKNEDWG2ed88WtnAsMkY2dmIpQR/vDX7hC4fuRfVow1P3Ik0jZy5VRG/s2FIl9lFJLg
 wpyLbUAn7kmK4SkR0yU32RfUExURmOtyqNWK03RDV42B7+9wbJdOYmAJCyYJ/egkprWJ
 8ClIEcSniXNzr/6EfW8WdGBDsqZ9WvMuHcf64odZ23BAKgsWbTxwB0nQg66YkK9V2Mfg
 orzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766068710; x=1766673510;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5hM0e1rBGnltIWyeJYcpYQbcX0IE2b0dL5xuJ66J2o0=;
 b=LuROs5u9xp53D5epMbA6RR7FEIAJp3ryg9nFyBueoQ0I2yjtcwnQYzhIdezcThBg9D
 SQUs/5SXGMdrxLtbJitgb1IdtXCUOSI+Kc2d54xC+Z8nBhX2LYB7jcuAFP37d6woJpqk
 k6eRJSp1zVG/GhSZI3XI0e1Ct6mprJG1FuqYtv8u/FYir12rbhJ68HVyTKS7nX0gkpZt
 Z+w+XWvhXFKuCb3ZRgohvXJ8VjUkxqdA0sKD46i2KKGAz5bRZ1o8QsSCE2iJ0kFDrsRc
 uSf8oNkbQw5vFySZ05a6Y0bMTVlXEdLxio5tiueYpM9jaXcJg5IUCcDTJRxf1SrNsZCn
 32Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmVo6zMvAUVK3FhSFr5BGd66AfGXncUSz4/oTZOeNIBsftI6XD5WorCtSHPwMntOA+81aQqZ+k4Pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV6vReNVRs1fyrVmj54OHRIvbKrPIJHc9rskoRjA5JuQ3R6g6d
 IpwYVDejnZdn/MU9J62y6/t3wvWukVzuzxwTVP7bXvk7XFnc/9myj2UO22h+7hDDQ1nadSMP1N/
 diHmwLFFYRmKkJM+zWmCZ6qafYjIWVPRI7pdATOYL/0xXzDFBZL3mqDtMCpS2wR2dqXF8gAs=
X-Gm-Gg: AY/fxX5cKtLHBLxbbgh1KWgTjHglLqVqN7rebfoict4rrsEWqCAR87wdAzEN2x5Ria9
 7WvrSNALSnhGAZqsbxkbdYjP0tX3++vXgvINdTxvYE6UZOiz3wdGSRVnntvUF3HP1Ahvz8f3nqY
 q/QDUQkfpd24YnGZuQlYLSc2EI7QxkhnRz041x536OUHZDotJR5UQoxw89Fe9QW0id13naucvCH
 AYdm30Ltq2ouu61L6PNUzW053xLSjFk+vko0vphjnLNZ2rSkkgRP4kge5D5dAEf781FLwzkIVSu
 CAgf09A5vkKe8SAH/HkcMa9szlCWnWRUP182c/3GCpidEO7j3sKsXqki56zNVrBiBK/zI5fMAl8
 xsVsbEqpFOwGcZkThHu9Gf+/1Rl/TebSFMqtcPrgQ3vnEigE3Tmdm4XmVJXX+kmvWE/W50snnZt
 OYaB4LzQIaRAIB5n2LuEnPKZQ=
X-Received: by 2002:a05:622a:4c87:b0:4e8:ad19:99c3 with SMTP id
 d75a77b69052e-4f1d0625a4emr308561801cf.77.1766068709868; 
 Thu, 18 Dec 2025 06:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjWBMYpERGv0J1dETl3RC0lHkKNzWVH7w5avqgqDpV1QTSBlLgEUN1CqDCcY9IvZ1NA1Q7iw==
X-Received: by 2002:a05:622a:4c87:b0:4e8:ad19:99c3 with SMTP id
 d75a77b69052e-4f1d0625a4emr308561371cf.77.1766068709487; 
 Thu, 18 Dec 2025 06:38:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:38:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 16:38:24 +0200
Subject: [PATCH v2 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mdp5-drop-dpu3-v2-2-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z6PjTejhlkm/+1sYK38mn3Rv1fAX83RKbuAEiJG8aZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHhzYh/zJPMHRBPlGUM/9vUYn4gm4Q61zbJD
 dD/cCJFMDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4QAKCRCLPIo+Aiko
 1bw6B/9vAzVex2h9fW1sRqQolFdeEF1HMJdW3mrgXe8o9gEsNR3Nl5YsiEFP175PCQn2Cxn4/C7
 VY97SM9JiSMt1teE1gwee/MSHpOG3k5k5N6gclnI/C4XKbpUulPuW7FpO49KTTwthUGLZsdtvle
 NYOl/Cd9+MX2Csp8HpBEwTKdSXYkRSG1ulKdS41cgHi6/jsVaCPbo+grckAeWoEcAI8P6LfpDTp
 P+aAX2nqM9z2LwM/h9TJMBWkHEi537bclRnbVhK8I7Nfx29tpqFSfSRcpiQr3MZ1RUCQCczWJ9k
 J/7CbBweIEkHk1X58P/JcqJ8ap71iSsx7kHm3fnz3/Uo1Hb3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 01KnyNRtimNmXYl5T1ZTUJk-YJwoE1fa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfX7JICSQgyKcPk
 XudSOJ1NfFXqHsgPkXFc6OdeU5qLx0/Nh8OpC+ng+rBqQVrrFTlvjmuT7dxsu/hMYAOPHLdJ4un
 VAYz/lTF927eTeOu43epqDgeaPxQPvUw+WyH8eFt1DlSMmx8OF90niB6HH45X04nNQKxudB7An/
 6msBSJ4LEgg1G4ZCcpM/AG7XHBXiHAv0uEMm5R+SODiVsmPu/PVUMHDj8ZlGWmcKYtPboVMUmnH
 CpIsC8xpsbSH6WcktNB8KhAwGqo35n0g8TGR7wI8nUBYNj4aM0pkfizodgBCy0oj6FCKBy4Zcrg
 PMRuRQZ3+98O/2h2hDOALTVHPtxKP9YRfVcWLv3n5HY7YfrWkRAVEix75o14cxxNkSuCr4uIrQt
 rJXC1UhDwKis/DhskZFhcyfQ3BcDpA==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=694411e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=HylcnDg_oHYs4KzdblcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 01KnyNRtimNmXYl5T1ZTUJk-YJwoE1fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121
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

DPU units before 4.x don't have a separate CTL_START IRQ to mark the
begin of the data transfer. In such a case, wait for the

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..e6f55902e355 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl) ||
+	    !phys_enc->irq[INTR_IDX_CTL_START])
 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);

-- 
2.47.3

