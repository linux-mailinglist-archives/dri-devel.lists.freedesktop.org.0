Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4DABAF83
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CCA10E2B8;
	Sun, 18 May 2025 10:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyDajpKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC3110E29C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAtVGl029142
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=LyDajpKgC2KGmovE
 vD7CLfxSD7e8whb0GX0P0hzQu/8Es0WBZLLBXLJBiPExzrBXmIeRpZ9X2f9c9Xen
 h0N9gyFAdSAVd1XQ/y5jGVyJpcwpx03F0TY78ah5X7hpvVW6+6EdECqu4/jWyRqC
 GWAC7ByQsojnNep9EWlG55tQXT5MR3F1KzS7ds39eSsqtfVtbqautVWFp6tdYq3X
 0OUkkJ1uensk/+H67jRTrbz1u/JyHtIzZeYnrXqfyrvOyZARxoIJ0xDreIKuPUWe
 vdPmTZH2nTt5wxOtGf3xJHLPZi7X07LwdgaCrDHpygANF2YTv/pbGczhRNH7R4j5
 jbKvig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhvns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8d4461e7bso2456336d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565740; x=1748170540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
 b=s8yv/4YQ1mnTLC4/37K4O9lSCtDNPSMBURqqfxqQDEV17L0ZlKGpNu3bVgwFxoF73N
 z8XoEU7qtZ+8ceeSXZSAZpTy4mIJaZeOvJPi0eVqH3vEJSpnBXRWBUaomXdJsZE/wJUI
 EYf7k3q342zQTyEX9/vZQ/xeEcgMgdOhpqrMAtFeB7xIt0jNz7PIIdkqcdx9+3IiODDc
 tLnxpkOJeARYE+BM3IqK/g+81cPeKhLV7tbzSUXQqUIjHJGg8r/dbaT7FosDUuKOXQv0
 UoJod9v9clbpIIsTMLsfQ1wn9eJHsk6gKik7JcDswCd97ZshyNeFgfo/j+JG4tXeTDsx
 DcQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0UYyDx6usHn21qcw3gTqRlwMStA5aZo23aF575d2Z511L7Ruveil+wpEsTwHso7LMZiMF0KqxjGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6XjAUG8Flnh8OcdLqn1ohl/ZvVL1QNeICZmh0eC/goJy1r393
 KzIB2q7G5TBeEaDvwbfCtTNikJoNIFkWiWR21TRLUkaLxvFaP+mmS68BlUBBTU51L12BipcsAjE
 K1ZFsLc5jJkfhdqtldKTSkqUyDQXGTqNvzMjygHdb4Cq7+wXoA7KbBuGcfGq4uNzmgIkanHQ=
X-Gm-Gg: ASbGncsC4hui6C2O0nQMtas/v2oz3bAPTU/2Dg85ZsMlO1gD1YyKfMguAPEyV3HWGvt
 qU6HrpjeaHJITVyM+9tip603CI3+snx2kTywxGuLVx68YXsPM08lny1arskGFHrJn5UEttzdwKV
 ktO30wYdN3LTrIFMLjsbh/F/6WDXvAdjngPTvkEjiFnEHn2sZpyu8ssCpXPH3WDPIPKVYkA/1Af
 ohi1tBmjN8YRW39dBjW0AiVTQGjoQYSBzYojr64lH5MXT502rJInq+30+djiMT0YKBqR35DTLh6
 9uCmcjZJ+ozJwID21gfWiGmpGiIbNdSlg30GJWKubGAzGC+lph/hD5E0Ijal9p38CmOHCvmr/8x
 wPEoQmwf2R9iQlmMeOOieOIdg
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr94273706d6.5.1747565739708; 
 Sun, 18 May 2025 03:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1sFBZ0jpOcZcVNQk92qKH1hJy1f0oX5GkS+yyQeLR6D/tyQ+iWs0QRbfpQspVibue1vU6kw==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr94273536d6.5.1747565739402; 
 Sun, 18 May 2025 03:55:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:25 +0300
Subject: [PATCH v3 07/11] drm/msm: bail out late_init_minor() if it is not
 a GPU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-7-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyaqbU3hdPDIhnaYG5VTR+PRu1+nwwWz4ZU+
 2SgY3BT/7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1YjZB/wNZChpdTIpEJDDI5eGygeNTAmk9GYiIm3LbhSUdeXnfVFWyY0oiedFTFaGYtFU9So+yFw
 J0Ln9HLeBPSUgM4L7/c70Ly11D5Lb5uL0KOaXYgCrOpx1aDEaiselsy8C/gfSFujH6JKBFy7t7p
 S2a9n0gVcgka4S48jKzL214ip8nDJUtKDsnexIq6auUbfcSBbX0pZZHaPVqCYfEjVzWqwovVMey
 KAeqVtA8uiDJ+fNPematZ+ZEkYr/khR0KH4vD3cJmNh9nsILgXXOqxrgVVsMMQr/lKbjB4ShE8G
 kF0EYI/5S8T1I1C8LDKjsq+MNnXAFBhmMw6wEyz8gzpLkzpP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qf1mRFzP-vTqDL72sxv2aL8zsACv4fP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX4ukbZURC6CSN
 P6QSpw/yvFT8DZI64LhH2Fks3CkRKBsOOkweKSTFo8S6L1Z5xedr+Y6QkKfbNDYY8sRvry7qerQ
 gLkDpeV9ZlF2f6MLEjLB8b+i3lJzOVozkiizeuZ2owiV7x2FJ/reEXbs7vEFKohVwWUyix/OLyS
 VIomGQgVLDk1VmZllRWpcyKplKny3vozgfd5MH3AG6zKka0ddeZvBWSvrF+MU+9clLn5k94pC62
 c2NxxOT2uePdsCJq1bbTbGtHO1Oc7QhC2Y9pIiUSnLeods0vogCjmOId39zZDCbn+aGtfjZFAnn
 0Ea7/fdidcgzm6V8caVrbUSwA2WK0jun5+8nXZKmelmyWz6wE2CHibda1e9nZeo55O9R/vQF6BZ
 aOIO4La94WJwJcjc0utGNi/VO+ixdM3FiWmvbSu7sLQlpwWtJf6kVN81o3SNOgYkgIVBQpQz
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829bcad cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: qf1mRFzP-vTqDL72sxv2aL8zsACv4fP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

