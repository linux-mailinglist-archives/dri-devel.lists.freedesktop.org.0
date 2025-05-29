Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A3AC84E5
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 01:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84FE10E79F;
	Thu, 29 May 2025 23:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlWWlbeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D761D10E78B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1XEd004930
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=; b=WlWWlbebHQXU7IaB
 t02zhGKFXbemRqNf/kw0uIQ2ao2KMbVnBK4Vp0zi47WsA4reWndY8e7xqQ1hojRB
 J+qGJNVIKrXM6i05AmGI5qhB2FhX27TRfxaoDjqrfZEwOg4LXY/NPfyVxIgfRMYF
 HqW7vcJgbKLWqj4jhP87dYB+Ztkmk4edDm/NOqrWZJqlzS0/ZGj0wzJF9O/5Nz37
 hMYt2VK5NyXch9g8NMglhWP9YjGQdW/KatJnJ6fZPXkz1UZO2Jr5/dx9I8+PxxKE
 zL6nFpON9riyWpNQMTmq1NwpwQEVQ+8v/or1p7451QCXHI6xxJ5GvbEthnxk46ZC
 YJ8sUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek71nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-30a59538b17so1329045a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560528; x=1749165328;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=;
 b=ntVunjqdGoW2SZ2008Rpvlwfu25+Xj84iCtmk2PjhYax90g8L0+TAabrCFZs0nQjRo
 R3erUb5QcEfDVCM51oO4TLJPkTiR/kHgrbQQpPu0Gr5k9E2jJBC/WSNzSBAyASe71v8u
 rMiXvSTpO0B3k7MCE/EiKBvjeoSVHYSHyK0yzPseUTK70SEcM/mBkrn8Od1/d/DJGFZT
 PNi2gT7vmdf5jW1+VwvuvQG0WluBQXhry1dx8YHbCixY9sIf0kDj7NE0nn6X9r1O8mge
 D9JD2zdFqRGVFvIZgjoHQEHHWP4Xk9GkqEk1dJF0KmTqxvhoHeyW997heXDPGrBuRdGz
 QRIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcgSm4NtlHogK9HeSbxbVqLwP7Z8YNKr/MzZD8jUamoN0mfTQiQGiy6JYcnrIAz/qrtadUa4zExCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2QNrhmnPlqBZMwR6HdgUlUT/ZIQcYaSnMU28mxf8IU6k02Apb
 FPMosugoUPZ9/Mr/mB1P2wfB82mMQhvXIJKxj2xUP+4SEtqnYit1MdYVoyfg/4qYB1meUwXgULX
 IIMRl1EgiP9nMoQd4d1BzdmXtYPnv9c5mdhGpZoNmNW+wt8M7GO8xm74f4WKEyYD7CV7Vz28=
X-Gm-Gg: ASbGncs4KzCa+rVn6VyxIVWm6jM+ARPSv1TAboqwsZIv8um+5AxXrhcpE70QZJFeEmt
 WAhCbmy73HmNmCjqJ3FC827bNrG+JkKYogmURS9hpL8kNI6gG3z9XKpw3WwhWsyS6Te8BD93kft
 GRw5ZOwjdynBQfcZx5m87eRkVN5LJRwYc2G7U1gKgg5KMDnPNoUENfrdDlKWRSosEQa7Le/QHqM
 kxEPF4t9XIfEc9C8ULencH8Sl1I7FgAniS/pPhy8YeRT+Dxm+WgCMz47THOI7AjQ/jFEKEFVAgg
 Lf3sWZwj5DHRMvE0tUeAVY9/o1kv96HZfYCdg8WTs32x+09YCEgCic2yX+qIfb5uQ50KXsDJRsm
 BHgPzlvM=
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id
 98e67ed59e1d1-31241532ec2mr2226116a91.11.1748560527834; 
 Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKS8hP5QDpmvy9MOsu098RPR9jWdEHOkxDAW+2Xf6gU153iGKt6qoNGu8DVdUnTocC11rWTQ==
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id
 98e67ed59e1d1-31241532ec2mr2226080a91.11.1748560527405; 
 Thu, 29 May 2025 16:15:27 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:27 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:46 -0700
Subject: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-4-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=LQos15gYFKCo04VJZ/As3557mLEuaumxqfi0RxOfo5Y=;
 b=ZyMmKPBhU5YA6EHWCvynOwpmKVsv3ib05zmarBy/e1MwPCLCy3gRO0/VTzFbpLW+pORd1zhqW
 Qr5/lo9J/i2Ci3LD8bTC68qtF6PkoPKgqziVkownWvT+mt52PpUs1pg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6838ea91 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=zUghIR52pHC5fQqyx9gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _Y8kGq3ciU2cxOkcxXsdT6tPHEh9wk22
X-Proofpoint-GUID: _Y8kGq3ciU2cxOkcxXsdT6tPHEh9wk22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNiBTYWx0ZWRfX40r2+lJpedFb
 mKIjhv0MAvOUFJy1KvUCHa/VlMKwbmEyBfR0l7YuplcQhVzTJQJp6R2QQFXb2aENq5G+WbJNOVF
 V5gpvzzbEwoVbe4mlCPgRCW1h3VYW1KKFbniFSclFC+3Io9rKl8F1FrZAobxgl1QBZAaS+dsZjB
 t2NT6Bx0gSfFxW/+QfZOo+OYGypjMXzTew23so2w8meTMyFxuvM+BVPoy3/c9vRxkLf0xr5yTcd
 ndtADMgxMgaTcO4OAhxyDnBooIau+STxh84p7t5d/Opx4+vAPLqeqB8yO0jL46zAQNfN2ISVD3G
 YzUrXgDkJs3NXzGggfIbXqkTw35I50y+J7bdkI7ujRTd02yO6at5n3om1QUaPw524bLLpAIbISI
 SEPVzXroNlTa9oHtTq6zhylCrOZnCli+UlgCzVP97er5Xa9Cq/OiLe/Ilh5aZJy+7htqcfYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290226
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

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized. This can be replaced with a different check as
it just means the hpd_state was still ST_CONNECTED but without display
being powered on. Replace the ST_DISPLAY_OFF check with a combination
of connected and power_on checks.

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 785c813d2b31..6f05a939ce9e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -50,7 +50,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1526,7 +1525,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	hpd_state =  msm_dp_display->hpd_state;
 
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (hpd_state == ST_CONNECTED && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1584,8 +1583,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.49.0

