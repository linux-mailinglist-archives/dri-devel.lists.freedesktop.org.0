Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0962B1F184
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD7710E993;
	Sat,  9 Aug 2025 00:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFkS5kGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253C410E993
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NF2UY020431
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AZ2xPxZ0aADglH/NNiPMVpiBOUDybWneJMhux20a+5g=; b=KFkS5kGJwoLDxjp8
 bC3AjVCcdw/tfdFuNHCF+IhBgmBBehYl/9I6Aa2o9maWBN3eXY+tZhfVzIwaDuRE
 zJHZ6ZlMk4YgKGGzmiVpo0wo7D+gZYL51sPqdj37qzE7GIAJiOt69limnIx8k8FH
 L/ZReglf9rxUYsV8y5tFGqlOVBDTeoJnz/QMDzSMHrXrTCa1ssX7z6sxASFsDC5s
 9QA7Jxaa5cVkW+t2vU2IvbcTvkjNCSdzH8r3c/06QPHhlWQpSjUHzOGSTSLX05wN
 6B7WikKnFbqAwnMkLloSdKDK48NU961+pWBd/CCDlDDp6Umo0u9pD2+6jwyXWNJw
 nTfPHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkt5qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2403c86ff97so37970015ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699743; x=1755304543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZ2xPxZ0aADglH/NNiPMVpiBOUDybWneJMhux20a+5g=;
 b=BcAcXtkjFOuleCmGD3EkwWKl+RQ5Ixk09kygpy0aIPO4lhFL8nA8MB92gDRL9jgZYe
 QN0EMaHQe8oGqyjS7mN4GSfw43lFyf0J0ifJOX8c1hZMRY5Lw1XhYrD4Gg3/j8M8eGLi
 xGn+VDjF/XTF2SbaW5xFrxSePkdKJXvjV2VDX74B3rW/cJ4r8XeW+/fnZm0yshITlQkB
 ZyTYJS/FYag3lbVih5FD7mSXBjs5Qfb0LtxO9hMdkm+7bUJpECq6dc8Kmur5az9HmNpG
 u1viGIjfTs0f2LtFI0JAAv6GfC438GH6bwd70ssNTGoAMm/Xc4B0pnEc0hwkHySN+5/D
 oUjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTd3UJB9UT14lDvwrJLTKPzXU1SGpYvVnTDubs8liDQPEKdPRzVWylMM6eMWqGRdbtA/Hpe3A2TJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypmjJkwSwxH6eLorcj50hQ+dSGXfQIkeLZl2q6TRIkwY1oD3vw
 zwON95Ogm8kJaYax3k+MLIB8bSWmV6FFIIUG271KfkTaebmjIaoqT16aZXYwgXEQEmEyNEzcrqi
 0UFP16VpfwILx67RRU6M1tTlow/LXX+ujd5Ox5aJi67tXPWZKwj1u0K5c3LV9quSUX5VMKVQ=
X-Gm-Gg: ASbGnctWFg5LtkTt5uOuxl6Y8fHx2uNLIq15FFBxkMyjsHb1haBRVoV37bXfKH4o1nx
 YVWmsdiX3qrv8lqjXkFVMwhjVudRPT7Sw328OrM98DtjQK4gGmJokrfFO0Hovvc14bgHg1uaMaT
 ZXg0C0uYpbVyPohltqXCxC5RcQzWjKnEn+u29wTa/cSzaWV83CWNIzN6GPF/5WnlKAE3mD/e/wK
 Ifre2nTVi4ubrC44Fem9MBv48SWSEOdm/G7OFKhwOqnIcH8Ba8zMTMBfgFcS4a7paaeuFkQFzd3
 QuFp95BJ4i8uvvovJEpW1SM4WaFTXzTqinwgT05rDfqX5uBopzPS3CmytuU2m5bBH/ycxt6yZT1
 uHSUdVlPDKw9XE5R9oGTpRLhP
X-Received: by 2002:a17:903:2987:b0:23f:8d56:b75b with SMTP id
 d9443c01a7336-242c224116cmr68534925ad.41.1754699742748; 
 Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAEqIzA4w/9X4in72ZzPva96ldMzCraSZJQFVFPIFyVWnAUhCwow2pLKBe5AzUihPqywBT1w==
X-Received: by 2002:a17:903:2987:b0:23f:8d56:b75b with SMTP id
 d9443c01a7336-242c224116cmr68534535ad.41.1754699742334; 
 Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:17 -0700
Subject: [PATCH v2 05/12] drm/msm/dp: Drop EV_USER_NOTIFICATION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2134;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=0luC8UsEHN9fWfXH6p1zip80kT4QBQaB8aTLon8BdOg=;
 b=KNHcay1Gz47I5v9s9LO4RakqENVxCn6/IpqtvSmuQPh6gYrJ4N3079g2LhjPpuzGoc1HhXkfJ
 VeSdBpztAebC7a6u6j0IrGagrIck7UzQwpogYuVlmzDmeeGdRJ5o8hg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfX0j1M2KVRefAo
 ZCsbG9DkA0BQXs62awl1i/8AqRvPdCAgsKt9xlaYQtnKSZvlOgAkVJpY7iVEDohIbKAvS0OaHnm
 qFSrf1VQ9XotxQDPYXvOCo/JDOmAuS9etT7rquCiewsySJ9OSb9gXtoV79SQy+Lmd7oHorPEgPr
 gqEEB44TrawQwV43hf53MZgoUqv1MHqcST5EN3c3fSLR/U7gZjBWW5k4DrURC9XUfW/HjofJE09
 IEdVsyeWkLrPVIuuA0PRnyMocsXCEUwYfLnSMwmL8Ztr0WdYevMeGhGrQi7nJmqgLz/d0+OQuk5
 vaHAWY3CPlV4A1RzePZsf4SaR1bCitTU63j2eY1twdlYzyDZN60X5zQOdNKibSGXVTEMHI2b8x6
 34e/H9sa
X-Proofpoint-GUID: YfKLpkdCkHzJn0-1nUKeydbFNGT0xEJx
X-Proofpoint-ORIG-GUID: YfKLpkdCkHzJn0-1nUKeydbFNGT0xEJx
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=689697df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=isfJdaZdMnE_RitM90UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066
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

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c849befe58f0..55fe8c95657e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -428,7 +427,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -497,7 +496,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -518,7 +517,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1112,10 +1111,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}

-- 
2.50.1

