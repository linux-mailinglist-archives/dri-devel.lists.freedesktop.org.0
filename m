Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFEA99A02
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63410E297;
	Wed, 23 Apr 2025 21:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNDHNM6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9EC10E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAaDRr015927
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=; b=eNDHNM6+9WJEUQLL
 P2DTjnamaO8f7mcaoiVLnGovumC8hrx5b0+VcGyZMZwNVqgFL589EyDEmm/aL6pt
 hFvPfKrxO/fzmLIwR9Wv1a87CZiqO10Z/ogWM5n/2v1RSFPEOpp5dnx4YNaIr8VI
 FPNfyc4Bfny5653P6Ee9YFkp5fPZSbnKJZbh1l0lCWMB3q1eBBCZC0QkZbUYc/4h
 90EJcO41wJt2fQgb1hYNZF1dAawwUPvk2SyBJ9kmoasb0fUbJIIsFvljnPoWmAWf
 OmmzvHsxd/zUuxUwPlpuU+5LuZsW0NiCHtRgOoidhEWn5I7nvYkyzq3vEysNsaEI
 w/jaBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0bey9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c77aff78so83209485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442618; x=1746047418;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=;
 b=Iekbik/jugk6phgOOYzWCCp7rj5/95ie7e32uxu3ITqK1y2agyY+Q3Aq61U+QhiLFG
 +bts8lztyY8JXEGSKGD4MQdGBai9UmoDEVYKMhXP4lc7RRPerKWTPwqfGLHkSJ4U97MJ
 EKv8QJBKVTYA3O9Rx9LMiepYMKi8cAeNNQ6KCWz4vyqDxnMUPHKRFPHFPDDxAaytvqXr
 TPoZM3ivtRMoxwGTOtebhT87OO5jTZB90DFWsIwnNpMLmZfTQklzgdVN0Wg97efKfUlT
 RgXMzrxjNK3FpV61tEB6az9Vs8ajvcb4JwPpiUkTCJvJmcQlBYCaXr7oio6WU8iAQoHk
 LD0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/hsJctuClKFYp4A+vmhJL758GlV2MJL4pMpnT4+FY31GMUH0epUo7XIRkcGtooGNepT/I6fM1+lc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC/xyS0av28K3lBGeLrz1ISqqTFHv3NRjIflgGfPLruaKUaxvS
 dv1r7tVe84BtIugg8/DDGy9qHSmSeHqjDa8pLyyQ0NBsTy0a8JdpBlxGocSzIZcLJM7W5OoHKp8
 x7Y+8gAu44rH5ZnuazwxyAehZimnX3hJQOiDeI//2vVmhaVUxN3mtYp/9YlCGaUgz7Lc=
X-Gm-Gg: ASbGnctJb6ajInbtP4/lPyUQ5ZcSTkFj54P1aVUqooGyA/KD+5jwK/wu7GEq08n5Qps
 WCNGbQDUP0ahibUgIb9eLTkZB2qVULZgcNLmJ3A4goFs2PCuN9FlvcFfVytiubx6enEXooRbzLw
 D80w+dVQZohQKjl3L6reGBZeqvBDy5TSwhy6+j/qCVrFjr3Col1oJDsOb28URo/nRFuMGB8dOVY
 feeGb/c6JgIdZV7/jPLY9z60Y06ND9uldxKkBx5kU6TFtovVlA22ny2+xUBgfGHqGsaiq9cXS5k
 9WUpgt5n8MQE/MOV+qfHHqrJkXHc0qJzF9jWLT82Q2JvMjQ9xhiAi2/oocOMnW09hN/m+MamOsO
 jTU7q5l15yahZH0eDB8kTr4u+
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id
 6a1803df08f44-6f4bfc9677emr2898646d6.41.1745442617999; 
 Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdN8j3WxVtC4umEdxXTXJ5CwdHR5VLabTb7DZpOIhVSxnxjki9ZdAxSPM6E0yzlSTACN9uGA==
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id
 6a1803df08f44-6f4bfc9677emr2898126d6.41.1745442617513; 
 Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:00 +0300
Subject: [PATCH v2 04/33] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-4-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuNb5wrJr2VbZ3pd+aopnix4TOpr1KLyK1dm40YaLo
 TjxYH0nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbC68/+V1bWfIVXc9pcFg+L
 DTGGD1+m+nowevZq3BG/rC/IsLS48/BzL7V+afY2xgXJ6l/Eqx8HX9nG4Tttgu7h5teiAbXHZyT
 H9XJIZi6O5+CTk89dvcjUMbTmid6K7xOMFq/U2PGgpMW8cWZWRajNKweWTqHfsy/qHFBxUvz5gF
 122px79fff+FlM0cor/fxhW/Oxa6sVzebOtuEx+6vWLJgntcFpXZ43b8qc7X8lnkw74naxoXB9n
 laH98IN75Z9PMrqVntY/Tzrzyf/IhdoG138tORHz5/qaCXPU8eOBwftvqIuLPBb7de6nNSXrzd3
 mtbPbJYyrW++JcXGmhcmX+7pvWqF6uSmmrsaSorP334CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oMjsyVanGgBbKlGcsdDkJ3dpI_XahFg0
X-Proofpoint-ORIG-GUID: oMjsyVanGgBbKlGcsdDkJ3dpI_XahFg0
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809573b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXw2euhlbd1bqj
 VJ32l5dYB5GbnB8VOZzvS0p2GjYTXxZNfoxZu0XE4ar8gJOigwAyzwqGKdzk6SWfDg2VMvhmUmO
 FvUYQPJ7n9Df1UAOVpmAE0Bq4eW2v/W9yzMrYuqgQpaH2XFtd/lWGd9qpcfpPS07uiFlFoxg250
 YviZTVz0Nw1aFhnbxfDt4nkO//Wge9PhEDTGdlhUOD41ApTv49Tb1pE2V3AJzKikTRc+Xbu3rrx
 WjGB/ePO3zyliZ3klCi5NkS8DCw3l+GlcXWzwZrOD11tY36/imJcJD2yHQ4zS93KRsMTL7R1LLB
 zwBwfDUcm/O8cRwz7VIUeMYIk3hTVGujqRURjdEYerqHYEtKrqzwhYikrF7t1krhZUKt+clWymZ
 cRfT7hVNY3TPrKQmWdkK3Hc4Fl3+5GEgCdfOBmWVHYk9X/DOG3pxAKgHJ1uY7SFdYyCgcEKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

