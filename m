Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AFB34325
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F76510E4B2;
	Mon, 25 Aug 2025 14:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvYDCdH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5F410E4B2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P80i69007563
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uJhqvqQDB3HVRz6gPABXZ4Z20PbjJ0Q4eZGeWqXXZ84=; b=fvYDCdH689Qc92QY
 XDgTTOW7ucZm+OLAYHd8f8/cxjUySobH98y8j9U+XUQtNeua1Z0CyEzuP/YkwE1o
 nSMAggzfsh6RjBsNf1DYg69EJbGDaruInTTPylL7FnJ1l/MyTtTOucUJrSuFcBCE
 6DVYZ11sWKuJune9ss157KL24+SZ2rDxdsXUkE75GM/0TBG2xcCGSma2cPoXip8O
 MBd765ieEazK7RYPDJfxLXFiEdKw4l8wP6T0qJ45ma4Okjp36z0aWDUMcqEYf6pH
 YNWWM9uZBkJ9Zpty8laI4/fGpLJa9ElFZBE7gHb0YqyHJH4NVFt5zsH5l8CPEbcJ
 bgiY4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e6e71f7c6so4623411b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131509; x=1756736309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJhqvqQDB3HVRz6gPABXZ4Z20PbjJ0Q4eZGeWqXXZ84=;
 b=c1KkePPVE4tsBA9XQ6KRznQDuQNrkQs1zfLU5MhAPIIZtcXhj2L8KdWIqR7j0f0off
 2M3xX3R83SEp9lmd+ABlKIMsTdGzx0ksWkJaWXaywcFmvJ0IAnEZWGJcth123iYQGb6K
 WAY/Ms7uV2Bw0rx0GXLXOq3q7WQGHu72GnqIoIEqASdzvQ9S0UCgaSWUVyxwXv/t4Ylf
 /p5e3uey+C+10xKNp3buPfnIEjH3bDNkxO6zLbkNIhDYE2uZ+azfeXrY1B2ALwReyxYB
 5v+0RLe5vN6PxpqQSqq1zz205fNtPiPeXwokLGknGc+CFoPyXzEY9iyllV3K51/OhUWu
 424w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3DwrXPLs3kfQL3PPcUIuNFCPQAGiiZ4KL8KMV/abOD8aYIzqvNV8cltfyRD/mJXwx82NK8ToMON8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkAl27nXYFzgZwLO97f6i56yf0FJKfNKYlPoeQcmUxqg1M/X1J
 jLsaPNYUdIBG0goTDo0mcJVr2FnZF8onu6hvCrnaUEKv6GKS6lghPF5dql5ady/v6qG8nsZD2nJ
 FT0HvCdu8ooHgGe1ezxLQQZ7L0bKDVLvT6q2tbbClQ5n8WnXtS11zotQpH0D6jk66ouN0muk=
X-Gm-Gg: ASbGncvbYwGUtFoSeDx90d6YHPpCI6pWA0xOGCTZvf/Y0fE2aU+A5iDTbcGhk0xwZgQ
 H7GibNDeqp8p8iwyxS+iUmj40phpUG3QsXLwIrmM1BcSvjbMMIgAOcX7EVFSlg8oUFU+AtcuwWc
 ttgaIMSofHQakg5rDLFrT4ou8I+pNsJ4N2uWQ3haNKb2nuSGscskDto60pmZz1BtRgTZWe8p8CM
 W+GKbu4dA6/mLHHe0VhjIILT50XNAEFy8sgxmqaikIo71r0GAbpO4LgWjeVnLMU6FGA0lMBChqH
 +ID1pqoRynCJ2IuocMcu5A9rzPof0QvecMZc9pXiSjZG3RqPmlAzQIiR7yPmRMg1QoB7jrM=
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id
 d2e1a72fcca58-771058e5ff3mr5451514b3a.8.1756131508924; 
 Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFNAi2rKuvat9119atkAeteEXRTs4Acy3AzEJ3ZC9cZKTCP+PnnhPW5x3T71qafgNzNby4LQ==
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id
 d2e1a72fcca58-771058e5ff3mr5451471b3a.8.1756131508321; 
 Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:05 +0800
Subject: [PATCH v3 19/38] drm/msm/dp: no need to update tu calculation for mst
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=1000;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=k1m4e3VK8u1xpO29Y3ltxjmABJorHzY7vguJ8hjD3qQ=;
 b=VkBvuFrfB1Ql4nqRlzbxrdOEfh+A3k5m2zJ0uZQo+MCP9ZGY9kVnH5NQQ8GIU33xIhfE9xTnD
 t6SQXjThQ+0Cc5q6e25GBxtl56Isg88ZTWiukWaloHZXTwSQmZ40lsh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 8nbewJMtp7lBML1edM5KjrJe5HvFGYJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX82MvHtVqBZx+
 5l5qdFjNGAfXq1DNCH/FYcvk4SgYvvjAsvg4gyddL+uIa8Z/25hz2GWXAubuyc4EyVXHHVWJaE+
 a12fj3mV/NwIZqLaBcOp7ylyAcTuxvjePBLYo8ErHqTT5OITTPCaIyElADEV3J5yBHIp3MWC9bs
 8ATlAFp3K6BGkLbPypl8/32CPFtcOMDUMnry0OFzDS5C128qldoZSW2ckNZgWnWrAZKc2HgxBs1
 ObTNgmgVg9GoDhrUBf9ZRwwjUjtyMirfAWatVDcCwTq8QJyge1etWX4do8AYrJBQLohz7581Rr0
 NoNJmHGm4N0kPq0IrSgkD0qxVFqV7paopDOA211Iltc4iAHMzfRdES83EEDeTj8ASRRfMWK84N3
 0YRhn5KL
X-Proofpoint-GUID: 8nbewJMtp7lBML1edM5KjrJe5HvFGYJs
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac70b5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nb1SeSCrlpLBeGjklAIA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

DP stream is transmitted in transfer units only for SST
case there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d562377a8d2846099bf0f8757128978a162745c3..c313a3b4853a1571c43a9f3c9e981fbc22d51d55 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2685,7 +2685,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.34.1

