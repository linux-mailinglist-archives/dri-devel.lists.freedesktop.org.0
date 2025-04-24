Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A09A9A7CF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4686B10E79F;
	Thu, 24 Apr 2025 09:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdOFmMR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B62710E794
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAEo005969
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=; b=GdOFmMR2dRM+TZyp
 glkhuB9JnKoiX4WZbUocXi127fgxsHI9BBa5LCyygPe6fkHgmIrJGdyUTS/it/iA
 ZNw8SBjDeFpKynHrkfdO+GaGro2wPZK3PsGdgf1HnncWKb2txEc+cb5AZwqf8Ep6
 qSDbxnuJQjcdulgUb0YYtpBbmJsmx8BfZThJTNRFV3srR+4nKmNgjQjvEQBouBWY
 5ukDgk3pNeWNvwzyVK35E6eP5Zg8ARcxP9AlURCpnEcjg0cJNOwYK/km4jQjujPe
 uiadU50Ba/fDt/zWqdV5fQ2MntkI6NWvtNc3NU70BK7alx3h3t1pCExX+urdSAIM
 J4nDsA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0502d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f2b3e4c176so17090856d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487034; x=1746091834;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=;
 b=eToJC5ZlTulb/kfUjQpPe1VYXGfKdWKxxdSuvLWvPQxellTkRUxc5gBMoxEb9JPnDt
 U8cX041T/v9+SVd3A1M10WQxoQyJ21O1mEHWI5cOZtQXP4FVUiQoIWZiI7CLQA5quwLg
 EVV0WeYZSdUQk4sIUlHk2E6lDi4Jg+PMJHO+ztBFs2UbhcJ7AnNdYgdws/sJlNJVOD4z
 k48jiH6RxKQU2N1S51RwDjVICUi+kr6ds3ijC1IiKQL+IhJFzvgaqpKOwQDOWxoof8tA
 C1+TYlbB9gONZ78q/N6k9ojn4MNxRRt+ipVozPxlNoEXe8RR1IUiA96kkGIX/O9TPW+f
 tFIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBW3BjQjrvAEQMnjPi53eJ8AqGPlRzlUsiEkXwqe4k6UJO39BGN8b2ZfDxAYxUhJBWHikYdvSs6HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuS0oJKzzeqQ7zjDvtnr8dUE9q8Z0rIQPqgEkkxE/+ayWkIiEr
 TCil9DQq3Q5f5Jy7iGsNKz1T+c8VuyJBajYPNWFH82UmD/DQQwetPuX0EFSfSNSZZSxxpPRcl4O
 IMAK4dT7g5U3jXCFCxTF5eGX0pwqANuD2Gf+hx/WyeOfLK1qLz405/9A3LwkCFCZgA/O1KfGVtf
 c=
X-Gm-Gg: ASbGncuLS662u43VXa9uxi6EMkbVPkS2kSSIJTFIQ9JH3CNbay+i231i32H4MOwdmdd
 yGEUDR+ee+8W1AudZqEI6p/7Nk5eUJ6OCBAoJsLJ0VcAUCJuXI+MbxW+wF1zAacosyBtGR315Nn
 mzLomOuUcRnhTZzYL8iZu2WDL24tWY3ALEtafOHvOQdPOBrmGG+V3Uc9rTaE4pjT/oLSZCbuO1a
 Nf0hKac3KauG71j+Ri9m/RaAKhOVlFaW7TlaDEYMZXwXFCcZ3ubCoRv9SiOlvWQMWRi66bCV9m5
 a4a8G0yMrTr/4zKx0RYG04LlA64jg4ejwI1qnCJXBAUMOjHHSGde5g8ujz/wWlw18cLGqiNOljr
 B4IQK79C3iK1gjUfArJILACRu
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id
 6a1803df08f44-6f4c2e59fc6mr12092016d6.44.1745487034051; 
 Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYiPdy8b33rsIWhjyFiQzIakpdZn+3nbe9+UAF3x7yXZ+JZYFOs7kqMnbbBxaZc8zFD/lqsw==
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id
 6a1803df08f44-6f4c2e59fc6mr12091676d6.44.1745487033547; 
 Thu, 24 Apr 2025 02:30:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:09 +0300
Subject: [PATCH v3 05/33] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-5-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqIqH1D8iy9QmolQ3g4lkccg43SLzxBrGRz
 ZKYMKQ4OPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1YI/B/wOv26Yb4VFOEtRUKCRC69FKjk/WGSbZOZIhHasZ47DuPlZbmNbEoWj3roPkKbSqrb3uPH
 NOpCq5/ldcFkEgylrt5/V0ZjR6bLB5HuzX4wXuxWTnURrHP19zd/ELzooZaInwfVPG+Hc1/idn6
 ol84xTej46Af/zW3INNdYLJ0JIEA21ZN29TOb4JxBvFdTzKRT+kv4c25lx7IH+1jDHtKQWVBygH
 bWDJyKfZi+ZEEuwdwcOc1lDE8NVWmm+krlQISZ/DhLGX1zlkx3QqzIDxdLkYkyjT8XwibwAM2u8
 mYX4gdn+arbBz8u+PniC13dEB1hynNsB04Yzth2WfFOPhsIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX4NsOWrp1V6CZ
 ENoPKzxsXwhlBpem1L0LhCO2/dDtpYo/9YAaIdQQcTonhSpdy7kdctBfdedM6K/E9/qpXiu+/Nx
 w9dk4UEBlTenNeeUga0vS6fNG7mjaHtLceOrPVYoniHJ/w5oOynJQ8KMmuk9mGNHEHevPrWyUd/
 DbLz0BJryMby9/uR2iBBPhNMUTkebsmS3Cn7RjBpWFqzOc+BRm4gyYs+3EXeZWhuBrAL3ZgZBBG
 fmwY73cYYmc5Jph7zQbEMT9Yb62DsvEJFHDjjCJ6mSTf6HChEEnnADOnQHPdJ8vnAiwBtUuSlyO
 SPz2Rt45GUjdv1cEfbmyuh158GT2S4ECy8SqpfsevRY7D8zdhlG9TITtNbaUC6KnVBWDa1TM8j9
 ue78xJF23RrHPNogHrFgoxKbDVhaWpNf+y016cMCLo4VGYwCWxhB9XeSmqkYgfLsuqFNVJNA
X-Proofpoint-GUID: b7z2RXShJWiLuhpom4Fald0bwq9yp54V
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04c5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b7z2RXShJWiLuhpom4Fald0bwq9yp54V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

