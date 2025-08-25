Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0197B3430F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465AF10E4C4;
	Mon, 25 Aug 2025 14:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8SqCiI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B68910E4C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P94VX7012844
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ehd6Z3j9F6UFJbL1ClLACpAxqFTJVB256eRXwzSO4q4=; b=f8SqCiI7IGyNFm6R
 9lCq+wvmY6Hwj7QyViqHMp0qYMBU6Ll2k6LBaC0CUNKraIhForGHSwe5ktTcZ/Ia
 BAk5ELQRXw7oACjLzvoIUS5b6B5EJQztU1qFL7NgjGVYoYOCkE0cNrUEo5J1zO5/
 if3U+op3nC3W1NR7kFyU1SzM9lzetXsG7/C/bCGo9+gxm1JgXeEwfQlzcn4/wcP7
 DoHT97txjokqOOLeHhudq2oDZVRA1YzGIxXz8Ta1XqPGKzqYofbnh+bcc8nT6UNZ
 tqH0Cl93gPYCCa3bu+AYWx8c26GOy2eZrKYnUHqrNHr07Cvxmp6ZeumXP5rBCJ7G
 ZwqfmQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5ded-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e364afb44so3429420b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131475; x=1756736275;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehd6Z3j9F6UFJbL1ClLACpAxqFTJVB256eRXwzSO4q4=;
 b=bqQsD0KV0pe1gRGlpX8dynWo8bfgZuqPmXkofHHfnC8wdU27WiGJg1w/ObakNa9tAp
 damrwknfvXzdcFW+5LvHKbPGO7UPqQRHcxOYxVure1hz9gs0n0sQSdwLrxUMtoGFBrgJ
 X0MXHbr/RGyT8jRbaWmxmQuXvRBplDpk96BUe2IqVf2AZXDHnCZBZ58mt885zuKpNa+A
 NF0GVEetyHrKCedaLk5VY6OcweGX+Q0W7EPG1a6MaG3GuEaPFWTydv/IdzQDwex4CQZ0
 885ucLdOO7I7tMcD4MZBzT+x8//2UIoUONOPb2LjEvjgvQ1l4jBO+yglGQKdQEeohzzC
 lV0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2JsB/0acynRtp5dRWGBBUBPXEis3XiBogRkfs5EtO/eU69Ys3sDcQHIFE77KuaL/vxW8qwupErFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw5RsmBdowOZ6P0CVNMY/eBCp6RmtW2WcBmQ2TyFQac32fLEcG
 H03bPL3DdPrv2sNmGBTMDT+7froG3L0rzl8IiqWltxTiLIxyAB3X45GOlMo3lS24LvMb5qQwprm
 DVAG7AbG84+1zxDYO7kmzDpo+LHA4P7MjEjwq6mPpRqk3PYqUsTVAc99aus4wQY032qo4XhE=
X-Gm-Gg: ASbGncsKQ/SDzXXkRUWUsnRL+msUa6tKek3nVFwbiC37QebsXTeT1PPZD37Qfnzv0Xi
 JP1Kb2Qf7dvWx43zx/XfHNzmAmYS9DvlfUKiob1IKp33zPFJ1ajMfXbjTg/nlJUoMe9uTUPWiU1
 gyQtwLbJqHY0TsPzzng9Xjzftsusym33ZCeCS/lXRqp9l1L6LY3kp7eQoi8jJsmtB6kk8pUnj6B
 j5DeQrvOiI0fm8f2FCAP83Js7pkPJzMB59psnl1ofQVIToeDkoGwAtbiGhKj09189cLF0nbEKak
 zJAX4HDVReDD+eyzw9vUKYJisuyYmlyfpfX9Ws3j4JVcA6ZS1CjrhL/BZYAA19O1YnDJTus=
X-Received: by 2002:a05:6a00:989:b0:771:ebf1:5e45 with SMTP id
 d2e1a72fcca58-771ebf1660cmr2234352b3a.22.1756131474837; 
 Mon, 25 Aug 2025 07:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG09CpaFtCh665b+UlMocJfA8OyKjoGgQ9CL/OZNsmGoCPdzMYCFLICiDjOWQzYZdEyXdcfOQ==
X-Received: by 2002:a05:6a00:989:b0:771:ebf1:5e45 with SMTP id
 d2e1a72fcca58-771ebf1660cmr2234312b3a.22.1756131474287; 
 Mon, 25 Aug 2025 07:17:54 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:57 +0800
Subject: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=3193;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=JGxMLypPbWKxuAwuwREf9cwiYhjKSbC5pwhS5CeKWxI=;
 b=RznuqTe8L3ZHOURGRmWpwGF4mnaHM1muZz9YRCIleoH0fWDqRblDuLOyyUxyD4TKnrGV1lEjN
 MPHaoI4QpkuDxuQkmdMZuprEovAdbWskxdLf/oo8w9MxRVeU4KmJVxA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXw3OoghDFYQux
 X4BipH8m13lLlisvi5qMKBqpyyVJ6cueFhCjeo/CYlL14is3yjTqAwimAfCPdvorqeGT9ATKV4p
 HV4o2tKvmeK3R9GL5R+SfUBtZG59gEcF5l5g+vSwxtxZdzR0wigJOpCoezliwodMu05nxG9H976
 esOc4vkqbVnkpQU5UpuHvjmgt9JFnJXN1hrHp4Z3EA8cZVnhj0PgY0+B6PJNrLrexis3QjiVKNV
 foLnBhJ1IqmLLwZv+70/E+B+T26ElkmRzKxRbRuCmq7dfoPm+V+lKdPe73+/8qYDypw4788kW+S
 9Ped2nyMOEFOKHnG5SKZujMRKFEez8op0J4RUHLzgkUUw0QvOOdL9PBNXfVtp5KyrZeXTK2R+Jw
 1u/+jMOm
X-Proofpoint-ORIG-GUID: 74OrDupew5FkZxODxVhxDQJFAqqzWlIM
X-Proofpoint-GUID: 74OrDupew5FkZxODxVhxDQJFAqqzWlIM
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac7093 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_prepare() only prepares the link in case its not
already ready before dp_display_enable(). Hence separate it into
its own API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8e95cfb98bd08088a707ffb5643a5021a288095f..78d932bceb581ee54116926506b1025bd159108f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1438,7 +1438,7 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 {
 	int rc = 0;
 	struct msm_dp_display_private *dp;
@@ -1449,10 +1449,18 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 		msm_dp_hpd_plug_handle(dp, 0);
 
 	rc = msm_dp_display_prepare(dp);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		return;
-	}
+
+	return;
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	int rc = 0;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->prepared) {
 		rc = msm_dp_display_enable(dp);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e12496ac73f853a2bc120e68eeb84e5a2de6aabe..37c6e87db90ce951274cdae61f26d76dc9ef3840 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -38,6 +38,7 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display);
 void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 void msm_dp_display_mode_set(struct msm_dp *dp,
 			     const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index b6b77ee96c30ca60e31cf76569e262a237493aeb..b0dba97e120566f7376e047b319a60c5bc36ba4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -87,6 +87,7 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 
@@ -196,6 +197,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 

-- 
2.34.1

