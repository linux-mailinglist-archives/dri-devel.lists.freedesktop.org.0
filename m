Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4950B02895
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232510EAF9;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzYmnk9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423A710E16D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMZfC5018395
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kpz0sBR+v1h/WdMG/RhlIYKzhzI8L7RbaceCFIlPTic=; b=DzYmnk9pMCKKLcPt
 7or/cvo+N4cER94N3rqKy+jWI5yc7iOodbhyOMV977WQQZdDRP980jFaXGYZNoKi
 uuZF9rAjhOOcXixzXjOeljeh2e0wYJpEIIUqNAfLP2iE22Z8jYdhH55uNDd9fCyD
 iVeZ9Yao2qNOCWV3J7aaCXNlFmTIOz311RshrAyn3ip2TnUYZm0GA3pckQsxlrAh
 fqkHpDmlk3rLB9gStkwLeECtrqZMasxD0/ydCR+jSRN6pD0+7mDNdMX7g8fPiZyz
 Z8hK5S1E7xOg4ExlnsLNyKGlqWrCJlBAVV+cNQvtmfZLiTZUle9yLZ0lB1pOQYXl
 XLeuvA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso3931451a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281926; x=1752886726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpz0sBR+v1h/WdMG/RhlIYKzhzI8L7RbaceCFIlPTic=;
 b=Nvbd2PJKpBGHmqBV25eoobeHIV1Om6/GvuexqQDBKiIaZVElsO/TeRSZvBNxybOR9g
 P7W6/XdQSj1YgpnDBNAc88kjjeuaxvqVASt60zc+5yA3gOHzaSh9oJY17IgNkN9iFFXe
 wpx21cGM30gGCtM/qDgL08h9lolgY7jDid3yR6IMHq3f81WP5kwSzqvHqFfvCqobada9
 0QerlRquVkS6biGzwNTQ8KE+jypF4x08mAF9amBsLPu0bpT4PuHlPgRDILKgPsDREFsg
 eLklY2usxT2EkOiCpBJsMmfgsm8uqmmABqdZbZL9L1C4DFdTdIg3lWM5i34pq7wrhCWN
 8s9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlvrAMuUmR9CskU1tInS7GK1o9PjBCmJWGRexbuEmSGuOo8TIjFUCQ6kk1mQDZcqKlz3LeMs2FwFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8/p/2IR8iTNxBPPIISxgNx9PMsJhvb8ZnGumOtSmqtjO4vkO5
 FFEzJWDOIb+cZXgkfVjuxSye6w9UDzh7ElXXaYZO5thLaT7k/HT3EllGBoJzpGfmeS1Ai/wRBOo
 tbG5c82hsm2623qzJj6kAq66pjJwxUPT5+dxruvBLrF4Ht0gRNsBt6dPWsM92m9W54WsV+wA=
X-Gm-Gg: ASbGncv7oDvxxLOVOAmJHftLUpBSNskgEHC5optCM/ZPRBN73+j0P4XxxyQgGaGeVWk
 2NJwxlt+8YYynwVKfxYra7NSFxG5dIT5GPmsw/IzkUlYLZY3h9L6er3pI6TdczOMFdAxP/QQMbK
 GzECtENQUJhuUz7I6TPAr/01zXpK1HCfqInHRLcnvo0YfqTH0gbbOrRQF8GZTr3zC7UFflg/nhy
 FfNpsQnFWAcYS1jjAiZU6aBPWfmHXANYw//dEIBnErNl2KiZ+M4r/fCXF/qEvQ9I1+ZFLVFIgvc
 cNZ6ojIrTFFGEUhmNgNBWEDvNemkYEzL9uoK6vWHyyXk7gpDovRpiWhfU9KOcL68m9byEHrnMVg
 5jYtiFZsSTsmlS8TrMbJE47+M
X-Received: by 2002:a17:90b:3886:b0:311:d28a:73ef with SMTP id
 98e67ed59e1d1-31c4ca845famr8018771a91.10.1752281925799; 
 Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKh0L/9TQnNmBay88tOhLWbbUb90POPJfrncC4mgSklO12N0KVR5eOs5fxviRSmmoM4Hox/g==
X-Received: by 2002:a17:90b:3886:b0:311:d28a:73ef with SMTP id
 98e67ed59e1d1-31c4ca845famr8018725a91.10.1752281925320; 
 Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:17 -0700
Subject: [PATCH 12/19] drm/msm/dp: Drop ST_MAINLINK_READY hpd_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-12-33cbac823f34@oss.qualcomm.com>
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
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1230;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=yjltdvgzQFS/rBBYfAe4dvA1j+EvnEUZxQgjt30Wp1o=;
 b=WfFiy+F0KkPjBLpzzbEf5tdoau0ORRRNR4ey0sQZ/xL06nlHnVc1WCtGxOBpGqdwwrs2bFYu6
 FD54qCrYupNCmUD7Gmmd/+FQEoCpVzIuDjYOmuh1aFneX8YdiD/3Rp/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX2utefdbgqP2G
 qspTBDjweCcNCBun49ayFHb+WxBgHpeEecLxm8n391H6K2NJACsDO89c7oVDQaQ5EOeP24VBEmh
 gIBqxPMIdlAhWXTJ8MzM2OL4MxplbUfdfpKBmFt2bnXBDyWOOZiIi6C4rojTsfaeShNDIZn4w8F
 oVE9EI7tFFzPVXDW0xlcBu+krfg8v1dk6URoDg7smRNdHqIyfH5moSEaQyyhDUvBSMsB5xjSDIA
 Lx7Ev+hB/qmo0FvcBUiJ+SHoiZ/lXmIGc6LW54Bz7uUujPG2EhHAuYt9/pU8dV5xRrBA2vjRV1d
 XIXnV8od6Uf+/F7Nhp9Rw5sUDqr08VjUMYLKV+jXlu0+zbcWR/L8zFNI/ycjEayhEXlJPtKl25a
 FHBoX6raGbn2aevf/7xPSASjZjcC/xrFzX006dVj547HENiGmvuZR97cUbgGD+UP3pUKnw2/
X-Proofpoint-GUID: --5gPfoiHgdKUf9eOUk8Ib6gR4ZqxBlP
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b346 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5QVpEtgF4fCaE371oBMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: --5gPfoiHgdKUf9eOUk8Ib6gR4ZqxBlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

Drop the now-unused ST_MAINLINK_READY hpd_state.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 17093b78900c..5efc8d4ecf54 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -46,7 +46,6 @@ enum {
 /* event thread connection state */
 enum {
 	ST_DISCONNECTED,
-	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
@@ -526,7 +525,6 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		}
 	} else {
 		if (!dp->msm_dp_display.connected) {
-			dp->hpd_state = ST_MAINLINK_READY;
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
 				dp->hpd_state = ST_DISCONNECTED;
@@ -613,8 +611,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_DISCONNECTED;
 		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
-	} else {
-		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",

-- 
2.50.1

