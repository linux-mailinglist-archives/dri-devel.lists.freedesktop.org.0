Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C84AA8A2C
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB1610E21F;
	Mon,  5 May 2025 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAiW8nE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4255010E21F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544L0dvF022930
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=; b=nAiW8nE/itp0xVjY
 YUPQ9BUa9ZyG0iW0m9aLQGvyqzAIpH/uRS0kbvofPJHcAEEeeGwErdmbMjuzO+z0
 e4XtcpvUWGBmS1w5BTgnrep4Wlde9EufgKYLUx3RKytC1W6jOoC+vbMc6EyLwssW
 hMycCqHm6KmsjpJi6vxmBT9hX8GMo5IrFj3kCntI2HEnff583obp8i5f9qJf4v8p
 2l/CXNexgEM0vsgtYOhVNkINSWDjDKR6D0RZtzswS67SEx6T13gwm0gjosMDAiu2
 nft9fbUZAj2FGU1IWbU9SaNUPs31i/KnFfkl88PnIpQYY08ue2zgV3EVZidtyy1F
 E2SSXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c9305d29abso759170485a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404116; x=1747008916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=;
 b=epvPBPfMzdMUZPBbPIFO7cL3BHp8xNgIrAyNiIqvmyB4dYN/m/cBpSHL1M7pB43a+k
 ZvJC+UW5cx0s0GM18IkrzzT9giw8Vo/eoQR6cVbkNBrvAOi/Keu0WnCj4w9YpoQyQpOD
 RQ0u4f1pHWI8bcQoGws1ZDLV9Oegr6+Rz36TqF2z5hj+veraHOBWHdpbbI9dYkSGkA5I
 M94GiLN8Sd96+GhYr3IPlsIeDpFbcPewnmCyOLUo8xruK8h/t+YB4GA+cnf3glWS8XL4
 zlR3cc3uKhiXY6Wgp3+WX3quJGYJnPRk3w+Cwtg4V51N2KexOB8yXn+Db/JXWKBmKOOY
 DKfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSmiWpKRNjLM6m96PeqjY+on6ocigAD4AIB5KhHwHo9I3/miLxgLPWuImLg6Ou7W23JWPNCqTzL+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4hHTDDydoc/QVVwdwlEu6B8FI/PoNtRuv9g9t6Ista5qEnzmi
 YQ5PQAfHmg1sB8CdUEaMhbSqwCh/Dqi3pjYiWTbEFnNwAoSJfVxwYfGcul6eTh6O0LjDI24kXKu
 Zrc9jbPPdzCgOXi1il+/M/OwnrYGZXQ6N+8HT4VglZk336s70Oyg9mJ9/ms2gRQoigcw=
X-Gm-Gg: ASbGncvbtSW3kR260+JPkRNsPefO+rXLN3GZq6MjFk5s8igezM7BkzXK9qojfg8rsmG
 qcSEkxva6wv04hYR0TumZA81J+TeitBso0VSwqRMCzGzeSaBiQ38zCKsVCLhVWDMQXailO9RVJK
 5C2ZutbnFJNowmVSJwPtVRp+EA852usULRCu4vYDeYTUV0MK73nDV4mdDDJ6f7mQWqxkiBhZSz8
 GvUqlzXYRI01VOdkFi/rukMiFK9Qiu/lHgQVhABc6fomDBT9aB9Dheuip6Xu4f4juLGOTuEXudb
 WTyEUfa4LOA8DDPOe8Ow3Biw2gXlBgvBEpVT5sts6XWGh4bBXFYEIkMRwYP4QlDGAgEFpsMlcxr
 dylNk1Ez8oXvRw/k47Ftc2Dax
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7cadfe17315mr802248185a.32.1746404116398; 
 Sun, 04 May 2025 17:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExYazgDRjTexqikZJLs+e8cHSkJCMMfDgM9LGiX5mnr/yYzp0a87xL7ICzXIpxbm+W8Aa1RQ==
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7cadfe17315mr802244685a.32.1746404115996; 
 Sun, 04 May 2025 17:15:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:52 +0300
Subject: [PATCH v5 08/13] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-8-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL81jAwp87jlj7ePL8czNId/7xi5vSBolYDO
 u7aLLeOGLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1ZIrB/9urrL2y3ZvkQ2p9CqGK09lcSPj2IysMUziduCLEJKZVJY1Unqn29EtfW09+necJx1FnMu
 Oh1wVjrwn93y14OfZUCkCZj/VuGWmZrHQ2IiCbxAViknRVwNZwHh+SwCKKFz5PmFVRLpqF7UrIx
 lbfr084Ct04AbBoBdVZD2RpfCWmOmm4vfSowLzvpL2RYSix3bg30smbVtDZ0MKDy19qbyEbfmnY
 8BuWNgbVPoGwVrWOWeoynq6TJE3KY5c19DId31Pr0TzKQMEaKnSONTJGKFr50R8fC9Fry/1BX8q
 PX2DyLakLBKEigIRXub1o69z0JHanZVTsxpo2CVxkT2d5eOo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXwpQLxoX4lGJW
 9rddnh6OYLweW//O3MPDLvf+1/Zmcll/Ts288lHxUGeWAQ+wxrva8/WikDKqP4lHNynXiLi7eh+
 rE9/Gmew31fCyr8gad/gD+C8fpWvVIaNYYQvZg3wvWZBz7oLifeYV6XbuYtm4TsM3/FVA1WBeiF
 yJT7X4GQQ7TRBQxP+gSCw11U7LjDmWg87PxBo2Ljg88S+e3al5ktZJHaxEIXFjx7lDJYpbZc61B
 RPFDsKVCcAgkNp/plVagKjscLhJaVkvZuSdGdobCXm5mkwne8b3c3ybq6//tsjV14Hw0XRox1xJ
 Qq9wJkC2etPXf+Ws1Voz4l+EKXbMIC/Vw5yEEczjevpZ+N15XN5G6y81ktNsgJqC54ssn6FUxMa
 yte21vb4cq/aCxmc90VR1RLdcYjF/ggOTW/LjsKa8KeUNSsiv1Nsqijm7Y8oKiQnSplPdu2B
X-Proofpoint-ORIG-GUID: OWhMnQp98O5kJR-ez_7IQlZPU48kQwNO
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68180315 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=bgq6psdzRVsaJitvC04A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OWhMnQp98O5kJR-ez_7IQlZPU48kQwNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000
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

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240ff3ed6694c469eafc4388c982346..ebefea4fb40855745001ed97367d571bde28f413 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.5

