Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1BBCE4906
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 05:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF30211A8B0;
	Sun, 28 Dec 2025 04:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JawYBaHE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/QaWL4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BEA11A86F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS1BWoF762576
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /X0PlaGnVatZ+hIC0aJnIM6qwpAzUJWkJcMYRuQS9VE=; b=JawYBaHEZQPCZIyZ
 VsX0y5JIl+/WGOBacSsbmkjmISUbsvwgMHbexKokx0N6aBsgaPFYwWFSqXHUBEDD
 8HG+QVtjDdP0Miu/r4YrIkYH8XJM1emQyXz0uxNFnM30OEPQpe+2TnOjwymY+Dfv
 Pu8htKJh+OdIGWwrUsJMf8LrqBO1sFU6mWVWBSIOm3iTQNhRA1UCxQeETknstjxO
 cKmmQDnj6Cy6wNcEIT0QrlKFAaBNKJM0Sc5SPS5M07ZcgLqZcW6jjgjFx1knlrtl
 RbTNC0tAAopjK20RGZ9Ird1vDCBlMqydBxd5u/5XqZ3nmEJyAkoic0/YXB9bdy0O
 +fErDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnsteg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a47331c39so218568086d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 20:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894566; x=1767499366;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/X0PlaGnVatZ+hIC0aJnIM6qwpAzUJWkJcMYRuQS9VE=;
 b=f/QaWL4gzZnqSnQfuJnV+xZP3Uaqp4FaGvWlOQyMixt23UveQ7SeF/PrW5pARmJ94e
 jMWPrkUbsR68L9iw40Es1Z09tywrJGpsWaUhPsCtqocx/H01nOEJV+ogL81gCs4si7VJ
 XwQouXpb8W+7Nk1Mof3C2suTnVVecMGX85TF+lrbGKYTm6ITmRyS07ZvpBv36wy1iV1g
 7/DfuBf/OwYnTLv6wt0bHwQFfnRpC1rc5Vz9unerxX8jEJfUxzPiv1D9YGlMMWBcD/NY
 d84YB0mlMNFHb6pbyRK22kefwuYTcrArpFJomUDn3am0981aZpNvcedK+0ddSOErLJc0
 axrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894566; x=1767499366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/X0PlaGnVatZ+hIC0aJnIM6qwpAzUJWkJcMYRuQS9VE=;
 b=F4nYHmL0n/Jgr+ZIWxGRGbdgW1rx+EGDIxbhZJhSYQ4W+mMsM7iuT+eIXJ9nXqKYde
 xTn4cvjOKySfxYJZkF7ElMzusIJrZmNFFnikxuFYsD1A0Kr2TCQ2Xg+Gyvmj8/ZoN1dY
 bAynnjHM7DDMb0uvketektY9Ncy8s1QtYU7kSMYSBnse7wWGAvnDDOXhsedhdjvWUmhQ
 48gk/eKHBTCtdPsRi6phuxI1q+9S03LaQlq1kXOSZ9EZnQgP8vPY8sdvbluKtKRCYB7t
 J1K6IoOFY3xGUAWcLigxyNH6wMScc1jxzyWXGWWJUx2pwSDveFgAJmqlWQ3jUsxygPdw
 AOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJkouz7KXhd03R9HWo8t9b7bBW22tQM9d3Mj1A89WHTSdmrY6y5x+4omN6eI//RxtscEuSGepMnPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUI5mdxL8b4kYl7pRz4Mx7UwVcI1EgYGNM5oSvScT/vFanYOI8
 lt3xL3f+G+d0u+9m6rOlYnf2f2wsa03MxGJHa20JigLdbDuOfUN8tjTduJFko/gw7RnTWTn2EBw
 EcnyC2h1ZgrLHGcQ/7cNkRu8BRNqP21B/h0CPRFDi6qGV4A0MJ6Xfxnb73OZdpP/MEzTiCkw=
X-Gm-Gg: AY/fxX5awu4SeqlAU1DricpiHaeRe2uCkvu7+2m1e02p06Zj4jSY0rOzSQn1nQGJQqt
 olcBa9rd5yHR4ms1Y4PUXhx2HooIEhahuoEczofswddaBTN5+Ok00BvkM5nrzaADmNbtN4oxHCU
 AP7U77XIC9ImDQp1hC/Xlb8MHnw5hu7oqNnYTfEJqyDBM/kU5GzjbCDnZGBeiTGI7Od471j/Fgh
 Pt7dLYqkwePYgyT2sULd7GbY3cErxGynKOIldiAiXjD3W6bWXXHNjwamLK24TlCShrB4cd5LhXF
 PcEqL0o2rDBJeSwFwn4Niz2E3IqHnxHrgMGe4QisCiYMHEmbzlykyoQwIM1m+tVvLUhlq2XrCxo
 16Pn2Y/7fzBPxlQEvdhOTPgxR1mgwnDy+s15kUNco/C8TfbBgCJFZ4gZGhRl9MkZr92dcMB64fk
 RHbzbmOt4LJS6N3F9rgPos/E0=
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id
 6a1803df08f44-88d823300f6mr441670936d6.27.1766894566146; 
 Sat, 27 Dec 2025 20:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTf0JWZsrdmKQdOAhhIGD6Ga6LySukAhCaX8RqqEHk5hCMcUJgZYUZFdmWVm8KndrjnJawZA==
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id
 6a1803df08f44-88d823300f6mr441670796d6.27.1766894565787; 
 Sat, 27 Dec 2025 20:02:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 20:02:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:02:28 +0200
Subject: [PATCH v4 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-mdp5-drop-dpu3-v4-2-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RENHaPNgcH0iuo7H+XDIB0LIYFTLt0BPC5NR3Q0GN40=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvcWCP4K0Kq1NCdfrPs1+uJvqSIxbD6sfe9S
 4aIlu4qH+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr3AAKCRCLPIo+Aiko
 1VLMCACzQfW5MgfWUmueEI7oznLTNbRiASK3WTJL6aQimnQbyp25lS03Vjkm/P0XLoHhy7frcrx
 yKcPahIZZ5VHs/yhMWXJyelO5BsJLflT/qJcZcqewX6t4ZGcM4jNkxUcQbckqX3bCu5PZe1x2Lm
 riumUoawXMBevLJfxa1d/9YJUzbhBMdYu50tZTXcrBkiurZfkPGVQdoA9193AAAEdMsKoinKivV
 U0nNIFf9wWnW9V2TDGIjXFvZLbDl+uMcQ2XBlhPe56iE3RjkCUYukvv69Ndh8aPU91sgBJklp4t
 6SOS8wMbys2y4G2ihLOpW65qn9ndulV7bBxEg3UQblTM8fN3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6950abe6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=CRoN-q7HyvHBVqPpVUgA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: EJV_1Nsa-gb05Q4oyD0-LfOKoNaW2ffp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfX0V57xT30Eiy3
 IM+rPFbc0+lzjVFVDMpdKXQxjtq8Nzb2m1IT86rthXv4m7MMmZT27SAyeIpnDZgwPl5ojwXJoyC
 VsYrTlJA5DvBVtddtWrafKE5jajifzQhVM+fZ5ITowrksw7bqlR6CVNp47Z6DJphY4P/Yu5R4iP
 euNyn0NcLwYGWwPUeohuyuh398dhhrqbGNfij9GA5A9dZF2YPlDquSITO36x2KFp6HUB99GQVFk
 tW1/whqhLWAVg/kZSJF2pOyJRF7crsCMBjCDR1CY9CrMeuhnqgVhFz6ZKz94i0i2sog10VsKkuX
 VvqVuPi5wLsJxCBZgFW4BcEP86ngM9npgmekA0sgyJxxBBBfCAYLvDDG9LNuJz5UZ5wqvwUCpHQ
 MSab0qcEAJeCuWh38jXztp74UiDEVldt3+xfZ/FwJSxWLyPAxpSfFFbBGNSp1WsorDCFnaAE9LJ
 EcitaqPWma4qyBF7A6g==
X-Proofpoint-ORIG-GUID: EJV_1Nsa-gb05Q4oyD0-LfOKoNaW2ffp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280035
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
begin of the data transfer. In such a case, wait for the frame transfer
to complete rather than trying to wait for the CTL_START interrupt (and
obviously hitting the timeout).

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..93db1484f606 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,10 +681,11 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
-		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
+	if (phys_enc->irq[INTR_IDX_CTL_START] &&
+	    !phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+		return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 
-	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
+	return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 }
 
 static void dpu_encoder_phys_cmd_handle_post_kickoff(

-- 
2.47.3

