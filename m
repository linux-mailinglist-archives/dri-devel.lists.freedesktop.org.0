Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF83BC2D4F
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 00:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7678F10E712;
	Tue,  7 Oct 2025 22:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqSIUPOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D4310E716
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 22:15:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETIAY027969
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 22:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=qzg0RGVNtw8UQBRce7wlFPpWaHbpTEgKV1P
 6tB6CS1E=; b=OqSIUPOnge5TUlz8U+/HWjmTkw0F9EY7v4ef27nlrUHInpFMrjs
 Z5KttfL1SDzrK9OvrOSQcA+FS0lKw40djNg7KRhulyeD3H9yOQZbRvRmSmecu3WL
 2o7VoIBIQnHOOEmG6revGwrSXAZaOxhvLdf10GgOLfZBh0xrk8BAlKKf1o2l3RoG
 mPcs9t2u7BEtP1qeYr/4fMZtonOQgtmysi5hCtAfCDgza2OGS0nt85znWlfa3pCP
 tcVu+EuyBholzC7nl4z4dPAmnFq6DoOyTDUH4XhUduuRHG7dtlZo9IQd04NiNneh
 hCvE+TAbouqq2dHaH7orotiFkkP3fnZSirA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0mest-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 22:15:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e57359997aso85995251cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759875330; x=1760480130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzg0RGVNtw8UQBRce7wlFPpWaHbpTEgKV1P6tB6CS1E=;
 b=PTiT1xAUoK4nvDiYdXp0+RNxJRgIYgj2UhY8xObuspqlTxwoliw+6YcVEuizI2L1jW
 RvU1C0OCN8BGvqbNL+qboTuq0/63yKwzAswDyrWzYDSAxOI6y8BhQ89w1dNfQ9KM2MXY
 78ngU0e3VP3YfJO3d7D9zlrkAUEBd+1XPs/8pPetLwZzcXIO57mxyisHfRXPL+7rTWmV
 W+KLmbr45x77PL5FQmpi5/5sl6j9txmQzq4PPX1Ac9aE8GWPCNP+9H569xxqcEJoa9Ym
 aDf/mgPQmY6weKrJ0sbZHWtYxLVeX30SkMQXxfxVfsnR/uX5QvKzY50xKSTEPJCOKSBK
 ktGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOMx1KdfCkJHNwOkSjFwag5gZEEZaIAsr2hHwuIcTwrDK43hZzju4ePTLTqp0K6oKr1PgjpgMWT6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9coUevkvoRKadK5HlSYr72b1SmT1FQw5ILkL8coBm8gn6Qmnu
 NlipaRc0shGJFXgqu2x2hWtWZZN7QF5xUJUZVnXd6ptYryJ2khVkCL0opoTiDEPsBOHvXN083OB
 fzo2pEI6qKFGf8UTGMrP3+r60pOBLImMvPov9d3USW0KNiquYwmCNyXXqL8QNJe7G12BUhEI=
X-Gm-Gg: ASbGncvqtC7TAtfzEUc2DQcBs27cx2f4K1PKxcWdqoijJ+iZOVSgWPGil4sIW5j7I+/
 l23FD6POSug2MHdHYVl+ZmA5L5sDf2yir1LtFLs7JNN87J3qSBcToYKWWWiZDrpNhR14o0JC5yj
 0KIMCZoBkP1pmp8gnr0qQqBc2AoJzJVpao8G9g668d48hLQoGKr9/n5DR1naTuQ21ciylf8IKJv
 t6zkuEVimxRzLiyyPe0IWbRhy5V13qA+zwOF77Y/qqvym5smNhw6pm9QvKiRY3ULKlgBtnybC9f
 NPUMK+IOjl1vpsmwfYCzsj0okcAipiYvE4TSW9xWt26k/ecdTLKucEwKPj19UZbdjHqaJ2ipPJ+
 bVzJp4bdx/A==
X-Received: by 2002:a05:622a:1dca:b0:4e4:f9f8:9d3d with SMTP id
 d75a77b69052e-4e6ead87103mr20760961cf.84.1759875329918; 
 Tue, 07 Oct 2025 15:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3pPRZAE0QnEmi7VS3Mj/VxmscKCog2juZMtHF0Ws48wIhs/gnODvFUSnxyYtXuwllAMz8SA==
X-Received: by 2002:a05:622a:1dca:b0:4e4:f9f8:9d3d with SMTP id
 d75a77b69052e-4e6ead87103mr20760471cf.84.1759875329351; 
 Tue, 07 Oct 2025 15:15:29 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa035sm1454173466b.15.2025.10.07.15.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 15:15:28 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
Date: Wed,  8 Oct 2025 00:15:28 +0200
Message-ID: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m4jKqDsfb5pRW-2q6DMpna93T5MeZcbg
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e59102 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9t2MsrROHLuJ27tN7sEA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: m4jKqDsfb5pRW-2q6DMpna93T5MeZcbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX3y5KcBCZum12
 rvp1xxwbNa1qxEMurhdIxuS4Vor9e8cGJ6/mHbr5WHKV1ttUfgMQxoCOuAEKcRidsXJX0LvJn8u
 q46psYlfoypuPCGwkcWftwFNjgnH0a7yXZ9nBXyu7ogt8/ZGUIZ2lPJuyyPrLAFvvLL9DMExZRv
 pLin8FkY9FegpnF06QFI4N39iaT144SXoZi2cCcn1eVV91Gy5W69VVMbtVEeRTqVTLbPLgdP4OP
 4Ed6D4+PFYW01XU9kMKSz9C+hUcFyfy/lq218K9Yt3DtWqIeLGEgrZlI2GWWIVLsJEUJQQ0OjjK
 hPr5xRrm9x9JW2+ZbMGEkMYniaHvhraaYd9tiQax1Tx1Nwy5u+EEeZBPgA2ekP8xpqk7biRbRaB
 VjGYDEsYptVYDP2rESy9Qo07NmH9KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123
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

From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>

Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.

Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..04e8acb94c04 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
 	[23] = "qcom/aic200/aop.mbn",
 	[32] = "qcom/aic200/tz.mbn",
 	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
 	[39] = "qcom/aic200/aic200_abl.elf",
 	[40] = "qcom/aic200/apdp.mbn",
 	[41] = "qcom/aic200/devcfg.mbn",
-- 
2.43.0

