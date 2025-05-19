Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E245ABC386
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83F410E3D3;
	Mon, 19 May 2025 16:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1f3+sUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE6010E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9bruO002228
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=; b=I1f3+sUooKHzN3kB
 p4CYpEnOxN3E352DDRYkS+1jWnv1HXpxz7q3ZeThgukufIUCWY8HdGJ81AFGKQ+H
 X27/ilqG2hQOZ5RsyVi2zIUbhFTgCeQSK1RRljz/Wghflr/s1b9UUZTtb/seF7gx
 96zJehAbl7zjRPbQu/QCVa69logmWZWM19iiEGJ6KXMXvBfNWpi6TP+9AH7kkg+W
 0c8+Ly8CdXyh8EiePH3IS4CTaUh0OGgfQfhq2/PAVGRsmSDSgIO7d8C9EXKsatU7
 deum6J0i+td1qqkfDuqqXSjkEpzrhP5xTcen1/RUAaOxH5AvTFi/R0IU6NKuVOTZ
 SoCTDg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-72b881599f6so5315009a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670667; x=1748275467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=;
 b=H920qbLkjnoPCkAX129sEZxRxu/XjvZ1YrHDaOlRhRSYtpoCJt3IXggIH2JoAtgBvX
 ORqlrKsiJAld5XW2KMfb0dNxL0TG2OzfyV79hpzBZ23bB3yiwxnQYoQeykSWF1xKj3CJ
 oTgEQqVBgmf4KWEUiE7SR2EayGGm818DPntngcSA1wrTYmEF+kqa+Mvv0P4wQjDLUs7/
 QRHdOUeLPSjJ/durlhUYepRZX5HPIP2ZNYSxvjy1tUIejzxZvdugWNbCauZX9i0T6tXV
 mlVjb350XhtXN3UnFZwVoypkL8py3BM9J8ZHX5io0N/PU/oIjT59kDBTeYAnjc0SKTxp
 R5Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZS+jRfoc23PNcvxhyCxuRTnkQPD/2oDq4m2gtfPNjY8e9LB+ma4Nnfi5cuOZE2scL9I7j7SVyt1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMJvj/DSLv7I+40AM23cPHqYLuo90khJmSe/yF4uC20hE8YugR
 ldImrDTaHXPKWf9cfgx+cTlYiv7WxyToj2UCk6SL+/TA7SxAb42lKNSq5i1AJKOfWo5nHtk56uR
 6ziB7W5/6oZv98qpVkyEo2ClLxVw+prvputn986UcoMcz6XI/cviuyXmdYEKdtY+UK8CbnWc=
X-Gm-Gg: ASbGncuprGcJCdxtBvSguJ5JH8ytyHYsw2DHS+KCCUEY119sAqlxoP4Y8jaTE0Ffq7S
 KXzdP1X53v8JV0Be1ieZ1cvUObNXAnFjNMuygp+x4PuPJ3aZtVvZ8WeMoElqeMJ89Doqo9grhdH
 +DA5seE236NCSiCHH9rhmgiKb0kSxRnqfaSVCRVAmfzbEyBxt+mSQ+bpdwy9h3BtQBvq9ydBQqy
 Y6Hp+X16MyG2lHL/8YGvj9rF5MPkU5qW7PVpZPfnJnn85q/RreSqNNwfNnN6hHe6PVJK/1CnPz6
 zyGjHnUm4nbmXhx33D7t1+8SsoeB1zg/foBFPWwOouqo7Ps46uqR7sG2t7kUo2X5sFWALPD4PSD
 0G0+9/wcAWwnp4Ejx3AqByNGc
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id
 5614622812f47-404da7b8d69mr7382781b6e.33.1747670666785; 
 Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWGNkqDoudO9RrWuCi0wKzqrGIqcsU0h/pgq0zgnKD1jGMqg5LdIRqVst60xFqiYKu58bYqA==
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id
 5614622812f47-404da7b8d69mr7382740b6e.33.1747670666447; 
 Mon, 19 May 2025 09:04:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:08 +0300
Subject: [PATCH v4 06/30] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KY1YKEATuXx9KSgl3eMXV6sbTxL9UFjeSDTpsHW5e6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6q/sPeQO2gwYXC1xpGu3yco8msBFdP9+Ot
 w3qbkta0g2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YlKB/0QFom0Icz72zmEmsevu7heit4rtZvRppGBGc2foEzGKdj1WXTfDxIRVslcwZXU2GnVw0M
 VFr1qR9Ag+ybL4Fttyxj7nvkUx1LbfRlJjPN1M4MY7uhwR2beS85hN3lG/Td+G0ruxNE9VWO0qM
 XEsw1XW1hRxVJsVy+zupSCLqmkDwKhjI0okQJ2BB84z/wdGobaqISK3wctI5MxR7/0jjMR8ILIf
 viBhwxTrGvMhrDRb90MhFPVzJyIRkIruGFCqdF7ubCDr+PpIEPXRQ1yBchqHnjle86niXVngEJC
 8P5nQetdYPlPyGD1k5j1d/DeZxRQaJLnWqZcnJ9cZQQCzcFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YhIW4ENZuHlwevdv2y-bVWV8f_RC8uYc
X-Proofpoint-ORIG-GUID: YhIW4ENZuHlwevdv2y-bVWV8f_RC8uYc
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b568b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/dHcX7rWuZNS
 GVUvwwppk29M34MmbU/skGkN5FzTEctpyjKEE5+mc4oG3CnIRov6j7FaZUQPrvZnm7PoRMiubcI
 UVI8qQnc/kkKEnL+tCO60rAh9VpH0N6SZFyhrpDImm2cO91wUDvTz8qq3c2Rb+VMNSr7qQsZqJd
 lC0Ts1gBvuUjT6WlPj0AmBn7IjZulc7+zvH3P96yzbnP59YjhJKk94Ijebhtdp31rsEMX1rCfCD
 9Z/gb/Py6wNK1md1eGLr7oouCsqbdRNego5eUEZJ5u1/6n0zoxqQVEdKR+qvxnhapj9QTJgxO5/
 9mlLZW6N9YXk0smjqtWqgjvBU8+dabxxfTvGZvD1dmzOnQPqKBP+1tDsQwIUa37k0UZlJLVsd8J
 mYi/+XvNL/TxH9JPWAB8H9zT6ZHfU4rejyJc+Bt6tKPJXELcjDbw4wOsQTnHosRGJ5EVVrZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

