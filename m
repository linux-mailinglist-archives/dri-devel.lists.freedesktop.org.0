Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F5D22D18
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803CE10E6CE;
	Thu, 15 Jan 2026 07:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWyVbAjr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDnZAait";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726AB10E6CC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fxJv1991707
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q5ndWq2+SOonrUyTb4YVdVJvwIrb9Y/Y+iuQpW2fdps=; b=NWyVbAjrtsNJCHmM
 mi6NeUKCKhMGnRMs/hTdVzKG7x0AU2LDKjbjnzyk+0vf6Pf/XOTBfie5fJ+9eOBC
 yDsJPjqwz1jQOeaPuugmb6N02SFsEFBsl+BVJxLhlXP0eXKyhq/DgNZS3TaqBbUN
 PCNL930ysdWtvKl3uP+fBMMqJdmGjk5CTDR3wr4ElQ5kOFNKAhalJaTpME4A9y5y
 ZCYjrckUhBhuzXzhJzkhAwDDxjU3cQpIaLSfx/lzmekrqT8yOE2o95lvNeshoEy9
 8SZKx0IubjEIRzfFqTuT1rZBp9Sv89NmU0OQ62ncOZPOBGY9Y3t88KGrHa6LxciU
 jmj0LA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbu1cp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c530da0691so150410385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462164; x=1769066964;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q5ndWq2+SOonrUyTb4YVdVJvwIrb9Y/Y+iuQpW2fdps=;
 b=HDnZAaitDWmIKzITo3HrQ3bvoak+q2/NZrLkQ2nZVmPRP0hsdDEdd95EoIjzZN8HCH
 mrhzywaId1t3q5w+2OzAqFzMjmjsR+vsOslWrT3lzXfSuAacCVSRnysdBXWnD0MzKI9D
 VFNAqeGShxy8CYfl51DLJb9czDIJqsAapqPiIbZe7ZmX7Gwq6ndX7I0C6Hcs5Bjn763H
 vDqdfwgbFzRdNJCd1N/uv8GMdCd5mp7QZgkryy8Xu8my5J3SOSRO/yGIysIZaYyr0yL5
 AgMAIG2s77pSh1aozC1xTIv8OK/SPbokA2ajCmM5He8Xbdjq+0WjIZNDv5mzJ5rV6YqV
 2wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462164; x=1769066964;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q5ndWq2+SOonrUyTb4YVdVJvwIrb9Y/Y+iuQpW2fdps=;
 b=RAjyxQNX5SxiRZWrRVG5pPXFAhzHXrN2bBDzoPnUG2VzAy2H1mpUlK+aPzn48V8V6F
 fIYjMCA+E6VvgHmWpuQ95WcJwPhVAlp3N5HqKQk4mkhnEzqk2sM1FGXcLQNMqmfscBIx
 qUugMxCgjLVw1PjZDCFMVjOhvt8K2DTkT0sCxKKabGRty87SlUDC9nlI+esCv2wwIIKz
 o7ormL9iRXFTfvge6L0CN3LBGnhYg4/o8J34y+GT+/wCFq9+8RprspF+FPHsUK4uNISE
 vToXQLxQiEROGJaaUZIWvNoGSXLhC200szyRmR/ubaaVcRbOKldMUjAMxSqiopXWJxqc
 KYWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTOOA2LYbkq0ln2N91NHKiVpRk5VV0MR92B5QzhNUDAZ0pZcosgaJ9FeAnNQ7U3DGELVRzS8OzKn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgXKCIxHyDPmCjDqF6toZ1kvw9wza/cQZeudbaTur0ZhmtmxnJ
 JbQt64shasNSjBkamSLv7wcNlTOjDKF/PkuPBPmq08ZcPEmGgzAxGZIpDV0FyOmK5ioPNy4NzH0
 UFqACPOw1Y0W8oXynH+DvKP8t7ozI2v5MVzZehni8VPWvBpuaT8cIM2cVEekZTp887diMw+4=
X-Gm-Gg: AY/fxX7jqwGlqONLY7deGOdEehGS5YDG3RP061kWF9yFBGOV9Nw6QgP7QMBMI5qebpA
 CSixhVncZAxCFCXzrg6CEE7Zw16Z2rT8IKjmHoHOsHRWspqMeQlTXfWof/XZ0Zh3JqXH8TwRWZo
 O++VWo/lZOBM8L0A1Ld8jw8XmKcCNbkEL8Gk5zURIM5asA0ES6APmVUUlXz7W5XCwd/oYep/dLJ
 QIUzSiknCSY5qnIdqa3ZVHNXEn885pE7fw58hAw30ioZT8UPg3OK+ny5YrLXQiec66Lu3hU0VLB
 lNRRrpGLTLOr7WJ53MOGrlyCpGrDhwunhwaChv23GoMc5RWPNeJHkgRVeo4VgjVPa2tWT4EaZqm
 NmcDpNR3KcC8g5SIHpA60xilTh3wMmzKk3JL67GqNPBktMd1JMUTdqSexwISA0Bv35r+DPOhPcy
 0AbgpBth8kSe4i9ggppjIl7EI=
X-Received: by 2002:a05:620a:390d:b0:8b2:ed29:f15f with SMTP id
 af79cd13be357-8c52fb1cc8fmr788420185a.21.1768462163910; 
 Wed, 14 Jan 2026 23:29:23 -0800 (PST)
X-Received: by 2002:a05:620a:390d:b0:8b2:ed29:f15f with SMTP id
 af79cd13be357-8c52fb1cc8fmr788417685a.21.1768462163391; 
 Wed, 14 Jan 2026 23:29:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:10 +0200
Subject: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oivVKkrTSnZtWeuu1n/u5eqzgPzs0AehXaBFNGRZ8EM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bGdOcd97itRELfXJN0X8FeIsn/bdHfDHmzyk0S5l3u7
 9LZopU7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCR8AD2f3aBaWecIlnu3Usv
 E169dYLcxTar0gjjD7eDQxM1DII1dpo9Wsf00kNref4BR/3OOQFvuVs753AFam4zmxD0K0Xuy9b
 GJwJFm24cE1xwq/7igbBXqQtWi8y+HqKl/23vkobr19aK/563vay5KF1DaZulR79O427njMC8tP
 06m3rmyLl/9j1QszY2XF4x16iyTv3jole7t23mj1351Knp47GC5ZKHckwMHqq2z5X7xjbhQ+g/t
 jm9k+wsyibv2yzF9UfkpVKYpEN7+6u6TU+CZjipd1mKblrvanw2KSwv7ff77Kpv6inz1x8+tu/9
 LhHWjFnGXdWnRRNSHG03xTMnn7tj6dDO7yYWfICx7C87AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69689754 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gW5k9mFOS1cgrKxYKbgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PWPSqxEqCeBxVsCdjl_nfFUz8Xe32syC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX7+X0B+NU9Gpp
 7/QGBc0GpdYgnc6nlhtRXtcrTK96uwleGS/pmVwRiQIVhhFxRX2r64EMRebdD5SfzUln4IAFTUb
 WEG8ufH2Znkp4qMdk8eTogzmDPO6C+lkE4zG7BzRUNmuQuwLFvPE66XlQwSNKMKStZc0vLbrFKo
 u6d99vWLSWt4cyIykBYXPbJMcaXuWIhprcaIV3FM+Vi4ZpDQ1bbzGlhFbs7gmMFTdOOSEcb3yai
 A2ZRNqafphkOTiHbPxmogBZsANaJO1T6jqPftGMSj52fCtNBNNIhHPptp/G66hc73tv70+asGtI
 HmqzDqDAw+f63F8EGlhn3WmiefNKOZ3PaWQ5PpbOyvfMncRc22BaSpfAmb+RGweNoFjXHxxQouC
 470057rqdxlj7H0lRCInlkMStciOG6xhMRmSSvfeVWSm4ZtXavmoWNHR3INo+pGJPrvY21lanI4
 jyXtvx9azkm6WJ7Sa+w==
X-Proofpoint-GUID: PWPSqxEqCeBxVsCdjl_nfFUz8Xe32syC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3184066adb15..e0b424ac861a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
@@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
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
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.47.3

