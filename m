Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464AB02898
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140810EB09;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTK3Zm+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC1510E3DC
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0eTNM016817
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bnj/UdtLS2aJT6tt+mnkQtsgFuu9yNGCn+96IC2OnLA=; b=WTK3Zm+7AdUZi6nJ
 +w4v21aGD9luQc3Iy4CZdymSx0pOmpYXe1z3yzpi+GRqjkeMHsXIQjqpUHe+SLV7
 Bm/uqPeIeEfWiryX6IEDVKlBU6hUmYoB8esnMkVOuDK0gXvASWABIYN+UVGbA794
 VY9WQgUAwMrZlHCWmJUkRAzouEXm4Afo1zpX4jcSf7B2pBJdBmux6IBvUg+oeB6x
 QjQMSeGIW/lmfOycsAWh7YOHvn2Nr1j+WfpzWhc+uDWOr+zdJ6VcuB/SneuREgLt
 127nOOCoYn/fF1wKcg19GjEmbGn5kVH9Yozb6QIw2HUT+khoIev7I1R8NXU8jI6a
 YmDJuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smapa8gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23632fd6248so26361885ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281924; x=1752886724;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bnj/UdtLS2aJT6tt+mnkQtsgFuu9yNGCn+96IC2OnLA=;
 b=RA/1gQfWNSm97Cm24OGcAb4z4GVjjZWDI/vGGG5If1gyCIktKDnh37Rulno/JQRZ5F
 YmfdQ27qjdD3ciF7ovTUj/DBW4vvDVdniKsfqAKqa0SyzYTZ1PaLjuAeyM1EEIa1n6GZ
 rcKTcUa3OGGpaQpqZu5cbu/LeDUH+rlfT3TkubilzJBnSI9cKW1d+FauYB7M1ADJLvmA
 PWD5uVgloCNtXHjerMK5lws8mRqDxn/edoKnwUvirZSvbReH1sKzF/weJJKvfhsT3v2d
 wdddXE4rCn9PDMUcjuSXhOwxAt6AUm8NQEG86QsA2w4biJelVfxsktpoJdFKoxuUlTxS
 92Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsrqhLEcnfafgyouknyLpaBFYv20dRkJVlCN6lehnL3VSQjnfYWMm4yiyLPzfErBw7vkV4RnutRxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOZqkUjayrvqJSWCqAolXXfCz9MMAZvWcQ0EyX0eJ17T6xLkah
 6zdp/MYRdtfwddP8JOHoS9GD19Vu2armqYW0OrASeeoFhgaqEtM6lGOC6y3rqCB0hyDB/tMhEtt
 WT75dxmxJpYlbqBJ13ccgBij+1Lt8ve/8aMCvP3I47X12jBvwni4k2QVz8r2TjYwclLk5O9g=
X-Gm-Gg: ASbGncsUl+sIsan1EqwDrR6pM1jM5p4Un/r4EGJLfonVYxTgTEEGbL/Su9P97QfGUcF
 gtX44if49OgF9GoGZ38hQ/ACBkrMTL5Kdheq8xrTaNqwx58HfSLEY6ShhsSSDIja8XkaU6snO/x
 xC+KvPe+PDudHN69lxUWE3cjSjLHLD3PnnZmeWDYCSihmbuK0J372SvqzOFlpkrvEzkoSe/K9w1
 7YK9CAv4ju1SMvsUB9OVcR9O/VALB2X9tLZU00nXaOEBgd9YmZkfc2+RV5feqcNdUJgHNwV7dt5
 XmgKE+wzpmt2XFYrOV2dEKVAjMIIXfZtC/Hx8Eo017NvpjaYJEMiq44FaQ2FXjDVROMjRj2Uey/
 X7VUKCzuYKmIlcCYVb+5ZWuVK
X-Received: by 2002:a17:903:b8f:b0:234:c2e7:a103 with SMTP id
 d9443c01a7336-23dee0b4bd8mr70465355ad.33.1752281924246; 
 Fri, 11 Jul 2025 17:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpusDhFVgrUlTpfeonAK2ctLBAovrbfhCYztjelTtDsWRdvt1q8SMY3jgvBDzdtC7LdCLSHA==
X-Received: by 2002:a17:903:b8f:b0:234:c2e7:a103 with SMTP id
 d9443c01a7336-23dee0b4bd8mr70465065ad.33.1752281923817; 
 Fri, 11 Jul 2025 17:58:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:16 -0700
Subject: [PATCH 11/19] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-11-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1085;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=qiVAy7LBnLe6xWk8rAe5U/Lv4H0O1vYH0pwvmDHYaFw=;
 b=PZTBGq2SsGnfTa5lANcBGzPbzp7hYuocHgNU0oogVN6pQFC10FUz+KRyjf9Nzx284+35/YVOz
 5xYZPq9PivYAlMpkfEHmc9/ZugLlIvRMkX1fYAWogVCNFlRr7rNwUi1
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6871b345 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5EiMiATjTmrooIwbMLsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Aun_jvhjL4-5qTw7VE0Oo_FPxrj9Q2Sm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX6z3xr0WU1n0c
 lPVC1A1gOeO/QXJcKwDm6jVdDHidDi193OFhoy6mP6Yd4HbwI7QZmcNkXSG114/zZSrIS7X070W
 2jouYGyPxZt5M5b+PYITzfWBUA0W2EmC5QAvtaEAevtkHZNoXsWWHUH3v5SQBYpol8jdBh1yKIp
 v/tDnLSsvPmf6iKWSAs4jzxgDsj/BcExoWLVmPG9NfFNO/af9KlMkFvLaV4hDoFXjV1dP5ydaEl
 UndcnEL7QQ8g2ha6r7bsBcGfebW/fttEfnL/LSAGwSJiW6GPNSlfdCcE+VGBrfCR1K8h7n/6CmT
 KG0afS4EUgCfy2NpeIrvj/X0UXAYBfUZfHYhTrKz+FYLEQgPUm9RdCGVhrkzVNhxOCmhpAahPlp
 Av6TO/P9ZbpLSnl7rIAUiZk3Ic7O1/KArM5/jS5V/CnZmqnazz0kL/z516RrcNgmNHfSb9QF
X-Proofpoint-GUID: Aun_jvhjL4-5qTw7VE0Oo_FPxrj9Q2Sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005
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

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4c9a515648bc..17093b78900c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -49,7 +49,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1652,8 +1651,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.50.1

