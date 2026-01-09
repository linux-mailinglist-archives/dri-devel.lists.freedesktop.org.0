Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98BD07DC3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A0D10E81D;
	Fri,  9 Jan 2026 08:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNrQNYhD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUKZqLDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA0D10E81B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:38:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098J9ZN2328431
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VOw+HSEIpW3
 EZgI38fHqxZSg7dj3NJr6PsLdb8K0mHM=; b=JNrQNYhDBpVwiiwB1sqPHOUpks3
 OhTbdyMQLvugnPpKoN+4CDjdlseY1dLyYBTbUJMTIuaLiNZiD6Lzng0jZaC3aFZD
 JGAk+XQDVRvApY0WYmARBIJEV5iO0+4FeifTrCn2Wu9omqBZah2PdMsdXxJ4dfCY
 onPb32EJhJXtks0I8cI1hXHwpYPyER1Udaj5nTq6htwgEUOqyoPziqpDvMdy2trP
 BFnK5hgYeoC4MTNmhJ3yML/rJx4/rvRNQTkP/y+Y8bxpSZJzMved/aurOBmXuaTH
 bcIIJJ2pZnsD5jvQLqpdKNFVijG5ucNY+m0wMAfCtWetjBmFUav6AJY7k4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaamsw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 08:38:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b51396f3efso758349285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767947918; x=1768552718;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOw+HSEIpW3EZgI38fHqxZSg7dj3NJr6PsLdb8K0mHM=;
 b=CUKZqLDtxekGCivSzxTHmZqu41kkqjOB6qn6CQN5lASsjjKt7XI13wJQrenR/2s3u7
 eudYxAG+t2+W7LXWk6FjK85eVAVNdc+4J7MfuGqcUVOFfCF6WoNmIfKUX3iwePM2mA+r
 rdNNsK+9p8qyLKoaKY/Ja5UDtIsW/h3LC8tzwMJo7Czr6cZ7ftSHXDcRGgAflkAqKiGE
 jTztpQ0djSOXRXlpwTI2thgSaGv+w2/5FBPz5AabUD78ddUZXmP4+wZDrZjEftxEFXJk
 6LvfEWzWlBwijljvfWovNJUY2KofDKfLppRyKo/92Uitkq71qfOf7waaV06CW2g2UqX2
 5EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947918; x=1768552718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VOw+HSEIpW3EZgI38fHqxZSg7dj3NJr6PsLdb8K0mHM=;
 b=iScxECJ3gZLSqajS2kRL+7LpQ2nDbipti2mDryAczRHNiwrjxeb3Lolf7GVc0guHGz
 /Yx7ihvyRoYa90mXPxv9/MBms3hWsYtooayyvkAByFPwsKQIqMQqZMNw5oqg8ziOZSNy
 ZCIs1/z4jGF9IuPM5pRUwJjqNzuEpntm18RmE6O9DuQYFCFrKqESDD0lkPPwhtmZVks0
 ZrMTjPRe5Fg66ysRh5OP7/aal3RaoWJW4V3GMHxHRQsF1oNx/YZdU9usxeT2W+iT23ZU
 FCUCZRWrrwErLVkcUlKP+YrnuqoakP4fgz0+Rxq8ioYJY1B0xHgxATodGJp1RZ4RUmLP
 BPfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJukU5VpX6yDU5cvTHUqHkW6DqnrUFdnlx+IwcUSOdWHDc3N/OdrpwTgyn3g27S+xidhZjc029E20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjxvCG6RGuLXMNNVBuI/s1Wk+2zpJyhMt2Bq75P26Z6QuBKPu3
 VlkenUF1J+8N+LhyN0EWcfjRIjV511D8UmFX05zr9WbJsi0ILDdFsk6BOgc/WmKQvk6q7bLNI3U
 NhKANM287FBirfwUYqZcUqgN3gSbvHhftPWmmS4BWDP0b5DLHaXhu8NYlU5SU8AXOARpcV+Q=
X-Gm-Gg: AY/fxX6fmBfBvV7do9hj0AJC4ISoW45WKLXdCFPVvE+p+uH0xnPRg8v7gpJ19ZulNck
 1edU4JFhKb7I1aD2shbVb9WSp343kjG1OlQmIOGmuaAEEZ1+gMdCRHqlzRObcuFxk0Oh4ZrdF/t
 1YahcMRXxezF3qwgN6881OROVE499LsTP45YF7x+kFKcB8HilI6vj2GioC0QHgXKRQy5U5y7SRL
 6Qmym+3E69Yg6gkADCz+2++afun1qFSfWtN1/65oQfznneP9+FQ6rISZvqLjV6FGNyEqY4ZjQ2U
 Co8TgP5FtsUFKR45hudrag/eoLAnUOCnf5p4fcbjS9lndXOLMM1ajhOv2WSmfgc1tgDjwGTqdCN
 jvbXtTR7rMN4hsZNMLIB83XhWogXIC7z42p7UnOO0NF+cI9gigSYElyJVd62M/vbvjkk=
X-Received: by 2002:a05:620a:25ce:b0:8b2:f228:ed64 with SMTP id
 af79cd13be357-8c389368dfcmr1185736285a.12.1767947918357; 
 Fri, 09 Jan 2026 00:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCZO5Wi/FsGcHzPlNSov7HprfEwEMTeHUZ7wBJ/nClRodC3/gGrAUB5KTuE5/GI8+qgWKpWg==
X-Received: by 2002:a05:620a:25ce:b0:8b2:f228:ed64 with SMTP id
 af79cd13be357-8c389368dfcmr1185733485a.12.1767947917875; 
 Fri, 09 Jan 2026 00:38:37 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 00:38:37 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Date: Fri,  9 Jan 2026 16:38:07 +0800
Message-Id: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960be8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VW4z5CC6hlf1mp1b6PkA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lJ4RV6FmDqanHQ22Ia_ezHm_LebymGqg
X-Proofpoint-GUID: lJ4RV6FmDqanHQ22Ia_ezHm_LebymGqg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfX6l6LvYiihXCh
 KPRAKqT8YAvM9u+0/O757PoiBAlu0+s+5yIukHD30UFQbzINAcDfc4nABc6+4H5CTkP+0Xdm83O
 3nSdpvm9jo/fcGu0lR9QktA4DmEzZCQnTRRJzu0ZtbXv8tiPiwwi+y8dDThOq07En1KSUh8PN4m
 z5mtcn3GDQdvVTOLpiTZMzlbxz075Dvl6Mm5WTQwGXqJ/mZC15Yy+no1UVXeau199M/Oc+LXinw
 nZCAlhOaoOyQyI00UWdjl2QWydAkgPeJ4iPRUJ/DoNHcR9AJAvxhkWEZT5Ote9u1Ct5Dj/sBXn+
 KP75q3We2qx2u/bf0INvtIj8pBSFTR+3OgD5Llo2esd4+XmMfR/kNwDwhtIeqPwEuaa7L468BT6
 T5uqaaZduzy7j5HVElIi5hYEZhey70CmljiplRi6Gzy7FnG99ZE6ij9zutx4JBRf1/apNtQfSee
 z3HMrJnQWrPTNZ9uFvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090060
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

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

For example, in the DPU bind path, the sequence could be:
  cpu0: dev_sync_state -> rpmhpd_sync_state
  cpu1:                                     dpu_kms_hw_init
timeline 0 ------------------------------------------------> t

After rpmhpd_sync_state, the voltage performance is no longer guaranteed
to stay at the highest level. During dpu_kms_hw_init, calling
dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
fall to MIN_SVS while the core clock is still at its maximum frequency.
When the power is re-enabled, only the clock is enabled, leading to a
situation where the MMCX rail is at MIN_SVS but the core clock is at its
highest rate. In this state, the rail cannot sustain the clock rate,
which may cause instability or system crash.

Fix this by setting the corresponding OPP corner during both power-on
and power-off sequences to ensure proper alignment of rail voltage and
clock frequency.

Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0623f1dbed97..c31488335f2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
-	unsigned long max_freq = ULONG_MAX;
+	dpu_kms->max_freq = ULONG_MAX;
+	dpu_kms->min_freq = 0;
 
-	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
+
+	opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
 
@@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
+	/* adjust the performance state vote to low performance state */
+	dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
 	for (i = 0; i < dpu_kms->num_paths; i++)
@@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	struct drm_device *ddev;
 
 	ddev = dpu_kms->dev;
+	/* adjust the performance state vote to high performance state */
+	if (dpu_kms->max_freq != ULONG_MAX)
+		dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
 
 	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 993cf512f8c5..8d2595d8a5f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -92,6 +92,9 @@ struct dpu_kms {
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
 
+	unsigned long max_freq;
+	unsigned long min_freq;
+
 	/* reference count bandwidth requests, so we know when we can
 	 * release bandwidth.  Each atomic update increments, and frame-
 	 * done event decrements.  Additionally, for video mode, the
-- 
2.34.1

