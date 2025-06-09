Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280EAD2584
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898E10E432;
	Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7hFueSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553D410E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559G4u8G026958
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
 M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=i7hFueSs0hspbXU3m8LSLRGfgQ0
 oCWVIaU/SC8Q6wuVbDWHMy0gWZRDhhhCCen+GqFlbdNB1mM3sJQfi32BAxXb1Rp3
 5VIEtZaZeAharmseIr4Ofyb35rbK5JOjBZ0pI83Cqmsa1MtB16pftHmfbKhTYIgU
 A2mZh7YGzblRncTclgfEJik6uRxl3DVxLWB0a8IysK5uQbBuLikw6YyltzvJkb5S
 Lj83IgWXqoaxCIWhut8wmtvwNIb123aQm08VvrgDgYTquXGUvSvxlDSceY5LIPXz
 vJZE7JhMCgNYwaSaMMritFN/m0ypOiGA8x64mME0N6jVKdBjOCo9djK7OiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4762tg0ahh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-742cf6f6a10so6270362b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493484; x=1750098284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
 b=xVLGVJb3TVL+2k2dO8KdManhkQczT271j+QLOmj/sipcG8AwlyX+Rt8hajfrCHNL9+
 eZ1p55e+tPwZGCQlJHctgB8LS5RCX3162CfOef64U1IQPlE70ON5+gXYsChM4arRP8pt
 +GtObaUaF5jUe13HnBgMKFw+dM6BLRI8Wuh2FCSX3XV4ztfNbhhiUsOKetzQ7YH6PxHN
 8cudr1YnDWqYBt137+Od/IgkBz1t0ElSVci0RqI0XFQ+16gE6YgNGDlJgEjczUcJrInx
 /YehvprvIz3E1ZGk2g4NFYIJrZXtPtPmFuIN02fIx3MiTl5uXGRSF785ohiMSLBowXNY
 r/Fg==
X-Gm-Message-State: AOJu0YzVLYf/2rp3xyB/Zc7SFLVR1XLwo6rmcQEE2sdRjHUrNBrcreDo
 Hiy2AFvS/jaHOQ4tCPCqO+dOx/XvHzOLF06XRfik5acN983JjZLVqF+y6xuhvzzRkzai50Z8x4W
 AwfBbu9aX+/7PYsMXGPJ4ArSCOiSS+M5uel//tkegBwCY1SRgsOE5CiwB2MLW9wLT9jz0TcMZb+
 OcRFk=
X-Gm-Gg: ASbGncugFmzzGRlepbt1WjKJ5NNUg+5kzvJFPU2LawuI4GnkP8hUnA/01RsOc1p4FlE
 iAUcjAQxPmGPNuzLiqYmMY1Irt2hhF9+wJqB5yNtJQVKCp+zzRp5TAsSf9MrGnNZqLSd1To3lP8
 6X6pPr+HgnIOTfSpLH2I5XUWov+g87dS+0tkV8iry2SHKifNKIW9MBVjKczHuf4hlK9wLavmG6R
 o95uF0WFUqJB4f3qASTClES91qi5Z8rQwhXUuPKMlT8m4jZSTS7MOUsQHUQivDrym48ErcBlLts
 74vd5818Y5VDFyIrEUNdWK+BcKSMIPgz
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id
 d2e1a72fcca58-74827f330a7mr17505734b3a.23.1749493484077; 
 Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4XO4k7jfNXjeUp4cke4cx2uvEFDbj4Fl9AWPgXX5AvA95l91RUCPxIh1kKECvcbV1YQhTQ==
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id
 d2e1a72fcca58-74827f330a7mr17505710b3a.23.1749493483727; 
 Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7a216sm5945104b3a.40.2025.06.09.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 11:24:35 -0700
Message-ID: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZPyz/t c=1 sm=1 tr=0 ts=684726ed cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfXwliPxSxfuTqI
 FhhqjM44oQRNEzcXJVRmYjHwEd2idZPG/TlksR04oYqOm7v8dyvoq/SLh7Xy+iLLrcc+83doEes
 1R/88rmF8wig9Lkvi/e3vdAsiQ9bktIrBPG5WCcCmtunHGxGj8YoWwZ9dHNVC9EAZxkREToez5h
 02/StBRRffa7kgUYBE3TO9iA/qfmF8uck+Alnyl5sV+94b5kNXXbokYQVu2m+C+NgbUlW+3IYQ5
 C9jujLzsaioF6ooYTx4qQPTGgC4AhmZiJKNMITpnFPX25LDHuDpuol+LxTQqb4BVfwsy7iXbCyA
 XrBhqRlMo56aeLyPd+ItvxhGNBExLZT53XhnUaBIQDIufACaevQD0UKxBYSeO6kFAcpKKdoe6Ik
 OTqgWWk0mm77ImAMmca4tTg2Qm8Vggs2Qj3Zl57U/rcUnudOE6XGdUf9eFqhAyPJ0bqfW7kK
X-Proofpoint-ORIG-GUID: gLptIXlJicF9AII-7wn-ywZ40fXvNBdS
X-Proofpoint-GUID: gLptIXlJicF9AII-7wn-ywZ40fXvNBdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140
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

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0

