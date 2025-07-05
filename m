Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E225AF9F87
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1603D10E371;
	Sat,  5 Jul 2025 10:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggglFIcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82B510E371
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565301QT007821
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qr9nHXfoeeoP7fUi7W46pBoaSSHXj9P7KxRVEDWZdAM=; b=ggglFIcx/pxfroXC
 5pLzjdlKqy8JzrxWDTcgdk2k6qvEZ5aUwq7Y5qqKKzw8Sc8gOS7JZoCPu3sKApPJ
 nHNMSZfMp6P7fDLuw1cmRXoG4QQJmj3mSEaJAewMUtqsnOeaVxr0HlA7+eIjn/2g
 T23vDe8jE6hvamIL3N+ibRtwmnj/xcyS0acHnsjF+/Oy3hSF+cbWMfVxr3P6fARU
 +9JYlIu+L9VFMLyFx+E5emKotmeuiVSeBsZLYIS4Om4qTaiQBz6Q3xQ7oNxCOQVk
 LC8tmr/vfOlCUnq6pzX9Rpoll9dyHvocgFVRXswWAqwwX8Zu9L38KdpgTlutiXv7
 YCqMlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq8s17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d4576e83cdso457344585a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709759; x=1752314559;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qr9nHXfoeeoP7fUi7W46pBoaSSHXj9P7KxRVEDWZdAM=;
 b=E7k/ORs+JAmD1xKNFzY6ounP2ilfFVrzRqfu1jWaKmYrC9l07nN8uXR8SLe3JKn7lP
 cuCMAKNH7b8XuZKUm1OxeFofdD915UZxPXBsIyy84u407pCr1uyX9+x6FXGvWzPIGsAL
 qrsCMHNGqqXP/nFYazpSDlkUui166H7BynlmLFitaanblEDcgHcZ+iT/f7D+xC+Bpnhj
 bd+vB+up3HjRgLNOslvZieH1FKYVsujDXmqvsncOqTGj3Ry/GGgNofJV974T162cLW+n
 VneLPwnJ0fFAVo21NMtlJN2R/v9Hc3nkNFVetIVWlsqQhKMdH2W7kuryLolYzNQ7Xh3l
 ROcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKfKSpbK6dGrEmnPEqFSOQQMpLxa/JzYUGKU/Xq5S+vycyp+7WL8dpCM8UHEJb0LcffzqoEQjMilE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFUuiCeOZt/1gQkPNQ0xfYkAWQ1xhkMp2RaHkbnwxhEuhmOamz
 fNm7yPI9P6EZuBDPL05nbPs/O+SvZvWBm8rMg/0JWfE1CfDhi8ugzw3uTdWD7d7yhnkroLzz/10
 QQBnOqUfFTL5ntVzEcGU6BuYn0m9goX3tWWNl/sTK9NARnPr5pjmC9YLKYBz63+brUwvnBiI=
X-Gm-Gg: ASbGncvdEso2IQo+z0gFFNq9HMNt2wHX2EwvzXUaWXbpC+uaUHeVx9X/JO3wIDZ9M6v
 lHK+qbb4a3jFQoftWKufHHC23w6TpLHt7hVcIYjvwr7aT7rfMVr7rUvtiSD69aABOWY0aa4IfQe
 ExtnWfyehmxGNt0c3HpW3OQKl8T3XEiizoizDA1683Xr1ZB0oz8VsU0A+6/NUj6VBUQLDSwTGDt
 EYaVdlcfopLuFvLrbcCmAwH4UJp5J8Fo4V/6D6aztFal8cevndTENJs2gaHNeMfIC368XayiSuo
 NOTNc71SB0tyuyYErdqYy1PYgHf+jRPkqhWRAssaj7JxnOYtlYY6HGjR+2a69cMnottN+abt74Z
 6segWMRfyVvqE44mwwjeyMUfFFbqKsRtdTho=
X-Received: by 2002:a05:620a:172b:b0:7d4:43cf:68e with SMTP id
 af79cd13be357-7d5ef9b3303mr240399185a.17.1751709759010; 
 Sat, 05 Jul 2025 03:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf15hUu+CzItaoLcjAJ84fZWCepzL5EYNjpa61wso8RvEzFOqMDAKTjeUuqPlu449XIEuPoA==
X-Received: by 2002:a05:620a:172b:b0:7d4:43cf:68e with SMTP id
 af79cd13be357-7d5ef9b3303mr240396385a.17.1751709758572; 
 Sat, 05 Jul 2025 03:02:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:28 +0300
Subject: [PATCH v4 03/10] drm/msm/mdp4: get rid of mdp4_crtc.id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-3-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7I9SSPEIQPGrnlSdPo9OvtX0dZETia0LBeX4obv+vMM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzNe0zg+PB6a9Y3of8MKVqFfobTxyaNcWi2
 nn50KXTRmqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1RREB/9OJB18bPIclT1wQ2jGSYAG+LMaE5XWr4+F1sbgGdKNnWV6pCa2cT7yR2vPhAvK7ES37OP
 ywXc4klooDiRDycpDQ4u8w90zVU1SgVmdDD/80bBOwmXMQ9EsniGpil30R5QfjvQD6CAh3VYlaR
 xMnTLMraL162cF/M6gFyQy+rZYQXsyPgzP3+nlevTYDDPYYwqjzEJlY6N+1MKXywMzeCF1HbcAn
 SmNFCh4nHglzNYW/i/0AlR7gUsPlf4BcxMzMQISTFD34VgF1I0SQdMASHK8/azSk997wnsD7JJ9
 RFbJW+eCVyUaVy8oaxGRCA10C+jRGcCOIKWWmOLhQ1MceZLF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868f83f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JeS6effYNUkig2QXyjUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: esPVy8Vm-revyjoTK5B_j6Z8WJQKxg11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXy2rDOUwDmBYd
 M4wnw1P2jS1p3kYAJAOEZkFAfvQU+xcDQnbi2JQMvPHc++2m/Pf7U1/8VLLBUo2nGqM3HOLsrB/
 m4jGiQNhRtiGkriPYxGRPkLCM1qEz7ggq4MJscJgZfRn1jKfrFj1Fk20AvX22yRXR86OONdXwj4
 wc5QFRbg6TOokFczCYn6fc551mAiZN+d5xnCmqYvQhE3vPqaaoVJDQ3nC/FZJ1c71xUrzNYBYxe
 UrXP992X52iSo3UVK9vyMBOdlGVfPW0pdX593fDWTsNvXE+DUU8awvXT+jrCVKwmAz5wDvwDZ0w
 XlGzRneLpp8IxsdPpV5gBIDOs0ElJgx3ktND4CCB1gypPPCmbN5VW7Zs/6Gsxz3qewuI364GDbC
 b+2gBbVh3VYYdmDFpU9SW8jcskWz+kKfW9mhbdHazpZ/DhrZKVueTQxA0zHhpG0MeUa/tiC9
X-Proofpoint-GUID: esPVy8Vm-revyjoTK5B_j6Z8WJQKxg11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

There is no reason to store CRTC id, it's a part of the drm_crtc. Drop
this member and use drm_crtc.name for the warning message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 2ee03ce2fd398be4f5b101be09c6dfb495324128..da53ca88251e7f184f4a7067fda16d6b426d3c49 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -17,7 +17,6 @@
 struct mdp4_crtc {
 	struct drm_crtc base;
 	char name[8];
-	int id;
 	int ovlp;
 	enum mdp4_dma dma;
 	bool enabled;
@@ -539,7 +538,7 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
 	if (ret <= 0)
-		dev_warn(dev->dev, "vblank time out, crtc=%d\n", mdp4_crtc->id);
+		dev_warn(dev->dev, "vblank time out, crtc=%s\n", mdp4_crtc->base.name);
 
 	mdp4_crtc->flushed_mask = 0;
 
@@ -624,7 +623,7 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id)
 {
 	struct drm_crtc *crtc = NULL;
@@ -639,8 +638,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	crtc = &mdp4_crtc->base;
 
-	mdp4_crtc->id = id;
-
 	mdp4_crtc->ovlp = ovlp_id;
 	mdp4_crtc->dma = dma_id;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9acde91ad6c37369191e85820e58ee22892a61a5..6d938abe29ee7283de2b1535d3d0159bf09d6dff 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -339,7 +339,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		crtc  = mdp4_crtc_init(dev, plane, priv->num_crtcs, i,
+		crtc  = mdp4_crtc_init(dev, plane, i,
 				mdp4_crtcs[i]);
 		if (IS_ERR(crtc)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc for %s\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index f9d988076337cb6fb63af8e76be59b2eb34ab327..fb348583dc84de5c57c77fdf246894e9334af514 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -185,7 +185,7 @@ void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
 
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);

-- 
2.39.5

