Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3AD1A761
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FA910E529;
	Tue, 13 Jan 2026 16:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNuur/qt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESOg50zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522E10E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DG5BdE1294985
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=; b=ZNuur/qtVvLzMr+v
 XjNCee7HM10Vuh12hmEZcOK3HZp1xKLvdbeT6SsrAS+hgEiVW9WzRBjeh9VhDWVC
 Ti07r6PtcRH2lztn7CwnrtcQN625MnjlzixXdVXxp/ltELpDQppGzVQy2MtB5MXE
 5HirBRKrpe166TRMyOZ+z2ZQ/yJOVyfpGFGntgx5sAo2oE+NcedU53SXNUWVPYYi
 KgPEPgO31NsEAWUuTddgwDVQFMnlZ7KdxiDkPQ7sZjuu/vHf7LaPNE5Dl7WEeRVG
 hKcCBEiF7K0n9AK5emSEsXlpnozlBc8lOQeJuj3vBiHor7eHMEpYSQlVajzNcoLx
 R2xQzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v05wm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so101942785a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323463; x=1768928263;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=;
 b=ESOg50zuMGL57XXg8wHGuF3hJhf3dbrubYdzy29KfQem5VIk32snHNrPCbHztKpzAS
 AsXdCZnazgJY8RkYMgQW/tRempYOxwu0CiDXeO3/Ihw69IsgctTNTqdbmhx8RCaHsLz9
 iSihjfolOKdsuLm6n8RGhjU7xq5j2njbWbjfcilDYXIWGrbl15OD+hiKhcAPmG7BT03Z
 X2hHHkQX1M+jNHGiZTZ7YM5tz8bj4BGi/mgtiA3yLaXE7I54opZ+FVQLguNVcpVC8hEx
 vd8NETQ9JiMuZ5ldI6RyBix+5oNL591X7kq8VLIgBzZogXIma0GyGC1YigBz3mi7CyoY
 d8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323463; x=1768928263;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=;
 b=uEh+JybF3R8xmJep+XWKp82DvwiwFu7M5YuCtW0o3y2vovyD2GqoWDnkcbPgP+n9y4
 gzYB6gbjjcVPxDpcT6wK6AdJrIJJKlCuTbzjVhrjcBe0atyZWYmIsiki+9t8zeJrYvq5
 yo0kcR1G/5xtNE5qI7vCWG9RhjdbBARQYbjd8Vxv0Ok23IOFFTzcnp4ZxgwiBzt3u81Y
 RK2icL+Q9tGCNCAID7vLXr2aNkNY+jn+o1TeziCA70ijoJH6qKqJi82Uce0Pz7f83rlV
 OsvOLK76v6Ip3IJHFEI0wXGPvsXY9Ot3SzV5EHC9Jgo2mYqVHTlgoOyxGEbZouQloa3I
 kZ3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBEW9Kbe8d7GOGrCIaQY+Qkq0+V8QZsEKn0W550oqkuB+d1H4Md9BHqJWUzNVdjtw4ZM/sCwRpmb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwetzSCHK9afi7zllkmJ2a/lL4beEMp+cmd4FyQYOlbBTw7urI9
 pCdYMltba1SNUkJLqMK1tsDSQa+8J1F3f2WSPacqXau9PYEiqCt6YJdpNtR1fw9FOUf1y70FDXH
 VOr3lJkkFy2LHVKWhw/5hHzZWzz2tJQnIaDH7f4boFIzJmHHkKtIPjSThyjsXmGDmm0tZlTk=
X-Gm-Gg: AY/fxX5hhfTcoEuoU3u/bzjwVJwr10mXp7V7E50UtIYEzyAMUPFRfglFoqzP1nyVow+
 NXJfzsKC6KqXe8Chxnwus6TCBCUfukpVz5OqGL1FtgPsKzLfVy62t0VvZvbSCL8GWeGnTP1wfjW
 6niQrjdERwuLYMtY7urEFJQ2aGfImn84/ARkDkk+8WjmkAaov5ojgF+wyb+u08YZawqT5Td4oXc
 y1lNj0yB1qjcG9Jbqz+bxbD9n1tLP/DWKYjGWjk9vps/njs6snKodDhz37ACnBGCMw36VpkWEVf
 A6OGxQugDfCKdVyx3VbuYJr5m40lYeGxSGPmssrCXURblkb6ZAPwoApLrDpT98Hf2iBsvEUAUU0
 wxX5gWEeSr8N7mQYktcitYws35N8uTV6fqH+zc2tHcim9uz+HwAxS54c5EtUHhU3Nh5AIPHhqZT
 2i3v8l/fNQdP5EOtcim8a50vw=
X-Received: by 2002:a05:620a:522f:b0:8c5:2bcc:fbd4 with SMTP id
 af79cd13be357-8c52bccff0emr141438685a.53.1768323462869; 
 Tue, 13 Jan 2026 08:57:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAyNsrk5Z2AIsgj/nQvBJ4uUGWq1+bsfUTTPz0/uGeCx1jrAMbGLWAwnxIuqCW9E2DAXzDfg==
X-Received: by 2002:a05:620a:522f:b0:8c5:2bcc:fbd4 with SMTP id
 af79cd13be357-8c52bccff0emr141434485a.53.1768323462365; 
 Tue, 13 Jan 2026 08:57:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:25 +0200
Subject: [PATCH v2 10/11] drm/msm/mdss: use new helper to set min_acc
 length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-10-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FQ3Xn2inLRRi3XEzsW+334edjBagx6YVFOZWSWxe7Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0PTE5OHFGoICxjRO7KNmDeBBGHDOeA6HsO
 GiBE9zODjWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1fQAB/9voiIS7ZX04MxzzN0Dm1inK5aUdGgfXovuk/BA3B31X7AP8OTxtGaenMVPoXAqZlevNxE
 ZPdBKvVUsIXKrEDJgGtVVPPYHDImICP9S5GNbC6hyyIh10Re0xb3nsXr/zYqTg4Kq5diERZq2zf
 AIjWLSnFI8dy+V5BN53UE1t/dZ8MMBPt1xjQtqusy1GPJrErOfdB2kaNp0pppcuxOGpm7oYDmfD
 a8MAvz59mqXgE2SVaJmpbJct8XUFaxL8cU0M8WLgswAs8VmS/sLJBc7nWIxkYlApd1cYoDRqtPd
 Jk+n52B/7fIhtfBXiVRRA4p7i8fc6PRtP0oFEi1McOQBuzdR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69667987 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wDzr-XRQWIUGBKb_bdMm4yTJ6ItmjogQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXyLBMJ70gCAHO
 KFD72h1F6m7ohvTfhbwSbdoYIMEghhQaQyg0OnI7zJz98iVaIK2KRF7jpPkc39G5cchpxcRM+Es
 gHTNnrIh26EtUkBeS+4HQdruPKfx70K4khIroKWgpP4GNMdX4wy1CzPfGXa28ab3S05YKyNrCTI
 Uq0sM4jLYgyDap/1iVieV+VpAKi9R6XhczMUCJW1UlZEvqxgQ9jsh0mj+aG9mQptAUpKjIY2g9W
 uy9TzvYSUW1d4CJ1jZtEHzwQyWZg9WY3ynIYfrWDs4p5pEXUi2DztTbsF/CjIBv8V3otuEDisws
 ajb09qgrsr8gw4e7wi64TFzaERYUKfUA5Wvm3NtlyjdLIc0W0HnhRvUvdApEnW/xFAf9pnYBlp+
 a5b4CmgeZVuMR8ISosdegmEiK+bwAQSlBgWpk0GcsxrZuidpNSzYckIsyVocxUtI8zqApEADEcu
 6LxbiCh0+INrBwBNLTA==
X-Proofpoint-GUID: wDzr-XRQWIUGBKb_bdMm4yTJ6ItmjogQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3

