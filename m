Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A154B02888
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5CF10E3DF;
	Sat, 12 Jul 2025 00:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY6KEZ6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8BD10E3DF
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0OBeB018429
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kFsYkMbbCPAVSW7u1O54kFwQDkZ7UfY3rOuddf3un7w=; b=dY6KEZ6Yyok8JzlS
 MXMes3w4hOlFs5R5zvCfENItM9LnmWWI9vCf1v7XTcuhLV9ZqMozI0xMoI+tYWsi
 Qj8n77spMD8wQ9rDmbLIDp3QFg1PInx20KX0JGBh9nV3Z/r8zf54syIMr+RCNLXJ
 DBr/LH3044abTyvCQWhbn4Mlnvqs6QyNmFvLA29mvAPAU59V7g/+UOc7ufnDZzq6
 q0L8Es/4x3mpWDabV4JR6OW89uL1PEwzJ+0GV99FqPTS1/DrTz+tDSLLijR5uCma
 Im8ZECshZRj3J5AV2xh79u7kX3gGFgoQJ4ouesZiaPR2Os254zLiKJElxymJtso5
 yQUyMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31202bbaafaso2737646a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281919; x=1752886719;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFsYkMbbCPAVSW7u1O54kFwQDkZ7UfY3rOuddf3un7w=;
 b=dydVUNj4mJtEoc21Z671V0HmWi1yhbQCR1MS5nJwPfmJm6YQQ8M9FPyWQbsoiszUTc
 0snEqEbY7ypNiuGJAmA3ox45ZNEMpGIfSOJc4QTc87tw4p7c0kQxeHRThezkKhgKig7+
 u705iZlXy5C/tpcd0Yn1ubafvFnj7NUOO4kkoWmTKJKMuMqM3Zjkb5HiISVicPK/HfRP
 zSWz/PchEu6AofAgfpRWj+JAk5P9msj2FmKnoxrZd02pxZYLtVEfHQqNmGHKaHC5vbtM
 o+m/+ffnSjbbo9AX7cfE57bre/NUHPb4zzjwU/XdAsim7vxexHjWC/zrglwL0Q/yNpvj
 k+Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgtiE/bLZIdVtWiArMO6Z6lEMqtX1cBgCmlBTEaGCKL1Gni/DeWu+Rvx6E4gsu7nFX0t3xSs/9zVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8jiMzAxmhRFsxZcdOAf8fCy9ocax00dZy4AHa2joCytW6b84B
 gYI0b4osU9bl1XLuYFmbutbh+8RF3z9G8Pr+TFjw61bTxMOJvzUqU30yMgt9AAH3mmkJpFbwYlG
 CnTl7Y+a1+0A73Vqn5KMMKfrcqyYwtJZOr7EojwV0DHxOif/VaildUYysAI45V9nD+NID1Mg=
X-Gm-Gg: ASbGncuMPBJIWRIGD8Dw1l9KCAVkgrJM/zO+HvDw8Y9LLo6JeExp/FMROsT2RV3zUxn
 VCe4Wffad38X3hKF2sIDmZjFvI+iAXCryjQzeJKhvdx41KBnV6I7XS8qOwK5JA1FnmPuS3+WjA2
 y33ZPaiGz8oU5ExH7HBwn5TZh+zVFe9xsXIYum4njKwqUAPGVRYe2lNNbeE8bXPL6iH+1vtmntl
 isIDFMKZZnx+P8zM5UbJ8g7F4pUkaFWx/MPt9AkwRrbxzOx8zswjoFvasFOgWbkp124d84U7Gc0
 NLXPsVptDMtP9N/2TiOGq8Pc+iZxWe4OCVOhKIweBRe8J1CuZgLeTdzvB8OuRgRQF9+L/JDmG5m
 WQDlhFxj/wfGCUh/M2dNsnJbo
X-Received: by 2002:a17:90a:da86:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-31c4f512810mr7999178a91.18.1752281919144; 
 Fri, 11 Jul 2025 17:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG02TDuoELfDpFVSQMxOzUgTbAOCMzQhtQ1BzktPdQH5UUzku4oC5I1fmsVdQV81JzCvjjFiA==
X-Received: by 2002:a17:90a:da86:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-31c4f512810mr7999134a91.18.1752281918722; 
 Fri, 11 Jul 2025 17:58:38 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:38 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:13 -0700
Subject: [PATCH 08/19] drm/msm/dp: Don't delay plug-in handling when
 ST_DISCONNECT_PENDING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-8-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1204;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=PV2gItPOtD2ro/W717vvW5Rzvp3X4mFntv6qSdc7eTA=;
 b=VML5o3LiZxvvLZFWgUSkZY0+K/ladfTLPXoxspXXguFKL4U2pE48BScPgV8l7YOhWVCer66r0
 /K5AxoiYvXuARwR5PkxRx2hKkxakVMScUQFz5NnmG6IJjQoT3UJZfKl
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX6ojD3Zgypkio
 cZXl3BoyEghGGouPlksfyZ7EN9gJCEJNaSCCV2LEUKhvhe2sb7TkQJI0uEtP20J9zeaA4E9erAT
 zwXrFMqZJrVjt1TDCL98q5XZyytrYTmaaTRynQw6RYA8t9WK5B7Ddsnjb/OmALdfygdPcsb5uoF
 l0O+F9pDzgfvqlI+9e7gLFJPsIuiF6GHRIWd2fthCwcUPYLu99lIvCG0If0jDjtLoJwii/P3pcd
 jPS9CLog8Q9s2kY3yJyqtvwAmc96EoULJXlgGACDfD2OA1qikFKItYHDzfb6mUeF2pIDIGSb1dP
 Z9OQkdrE8j53BK6VC43XIqHX7q9feFnR1cnodTUZnqDbswr9DyzIBhfyb6sE3CRZRl/LE2X4pkW
 a+Ea5ulxTLl3zmQ5VhoYsKx4D4pfAwHhhtIJiDIEwytCgnuIG63uyux/q28qhmmIrBMcaGDE
X-Proofpoint-GUID: LQQOe_QU44uH89_Cqhu3THhsolxqFGKq
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b340 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Yywnbx7U6RLlrUaFA7wA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LQQOe_QU44uH89_Cqhu3THhsolxqFGKq
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

Since there is already a return early for when the DP link is ready and
because link_ready is only set after the DP is connected and link
training has completed, the DP will already be disconnect for plug-in
handling to happen.

Thus, there is no need delay the plug-in handling until ST_DISCONNECTED
and we can drop this ST_DISCONNECT_PENDING handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1ce8051b116a..98f5274f123e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -602,13 +602,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	dp->msm_dp_display.connected = true;
 
-	if (state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.50.1

