Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D219C89FE4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9810E5F0;
	Wed, 26 Nov 2025 13:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqbCaXdT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQkJxWAE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1D110E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:22:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQ968b13667836
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ntiK3ZzgUgZBhzToS3gLUQ
 81nCFCtGA9upCFWDeoYpw=; b=KqbCaXdTidNd/cejTL49x1xgM4Jbiy0MJoDzGP
 Vr5N7ZkhmLikv8E9tnnD3zKamvTTyUeNVZLYHOhEtPfG+IocqR8YoMMZhCAuOFu6
 X2xN3vobd/Nt5hALhuTwaBXZfmWQI/rBLnuuzNYx0GxPbqkOpDW1rs2IvPOuus/Z
 xf2K1rZsCVRFfsK+uSOdI0BrZo0+a6pDNBGAHz7Qn0mNsAlqG0d5yShkxMsLsrme
 5mUv06rGjf6xp7UiyEDQAgSESlPp4CMOCC9mKpd/NcIXTBgWCbcMnLfmy6RiuRlr
 o9vfc63oECr4BaYTEXGZ4/Yd61wm+WkMf8PGLrPjUaa8eORw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemt7wf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:22:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2980ef53fc5so188131945ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 05:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764163365; x=1764768165;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ntiK3ZzgUgZBhzToS3gLUQ81nCFCtGA9upCFWDeoYpw=;
 b=VQkJxWAEL8yNMWKkisYYEFHR48XR9EypeA/ajdyDv1wxIlBo6rX2dJCBx5AFawpb+x
 PbjcAXpRfWdjU1H2IbAP/ZlTV9T6GBBdd15agPEJBa7eXR1AA3xmK0LYm7xE5JU3QfgW
 0gBm0oe+WVu+HnNm9Ldbu2aIL9KUVNlI/ot/wLoV58WmKCg4BB/i9Czw+md2wCbKy3qw
 jln/BK2Kl127mFev/x41d65aE7lHa8WQK4XmB5JkBgclPkFh4XhKlPO91oOif5E02lgG
 a0UFleIzLC50bJgugSzHZgjeV+rKAyK2dogL76qKL0c8KtR6CrTEsFR9wajH79BgoxMz
 HEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764163365; x=1764768165;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntiK3ZzgUgZBhzToS3gLUQ81nCFCtGA9upCFWDeoYpw=;
 b=KQIqTYO1U4PVdW5lAMSOCk/q3R2EiqZhRcbiHB9ZTg1h9MWhEbY6mcYHlcYKRhWrKV
 bymUmmT2fiG/4xiEvZJKbkEPBYmZ/5w1F5sRV6X56hJLViTAoTTdJAXVXzmRG/Hz0UIQ
 CCVS/4IxXSUSDdUZsIwd3ooP27ewf87fcJUTTCZBCAwKCtGhfhJT3DJdPjgnQQObqDFG
 CWwOLfGXI0+tREIH6E12HZ3AhI7bmdzCrS4DC3a1IrPEFvsmO9+PrwXF9AEYDiLcvB7m
 fHR1cauf6ZRcbHcRZOQtggcZWkZEXqZ2NpFwE7DC8kJ3aYpoLaI+7Y5ilKEpyCXL6M3U
 aRbw==
X-Gm-Message-State: AOJu0YwedlqljmK0Ba2svadwEJFzfetaTS2nDqNuHgr0PXV/ZNhAx0HZ
 jDV0/5gjuH6kZOCCK3c8bDONEBgmOiJILPTjB/stvuOp67186F4E0DAbXG5+qVzMZttm/66zePG
 1cXYEny9RVPQNXwKpOJLen7MJnA85Ph9JnS2OpGCY+3sFxT02E1jwjkLMBXprc41oaQa2Rn/IQT
 olyA==
X-Gm-Gg: ASbGncuET+Ri2xeMDDCj84wsTJQkAG7C08EKBrlEnPrIv5YZyUjQojYeqB5teQlLoBu
 n7iPhRFuU87ULuCwUtscPqEq+Kkq7c/R0wSqR7Hi85/NxJiF1Q9ErgoOXzWiceVyeaLZraYHICy
 nUsREy1VxsljLTL0lePXeAbDdYxkdoB2GOUY/WkgS2hm+7yqF39w+fKr4v0E00VFFV/pq/vU2XK
 B5CcrIqrlaQVC3Keu3JMrq2biV8kdNVXqX/ZC3KL+jpFDpHccthxGg4hCk7Rozzcg89u1J03Ng4
 LRZZ70HrTFqpKSmbHGB2mLxMbwE8IWUyKWclNt3v4ZwCHcONJT/2zXrjLgmWtlIhWNKDtshVgy5
 Qq50/xBE8WN4FMttvkAaKQuDWZO04KCpn9vU=
X-Received: by 2002:a17:903:1663:b0:295:ac6f:c899 with SMTP id
 d9443c01a7336-29b6c6ad89bmr233572645ad.47.1764163364692; 
 Wed, 26 Nov 2025 05:22:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IER+H9+/FZZpOC8JY5k8npl9hA3+YsqLAonaw9kODMfZj5yPVlh7Kd5UbO3IUvud9SYFG0UKw==
X-Received: by 2002:a17:903:1663:b0:295:ac6f:c899 with SMTP id
 d9443c01a7336-29b6c6ad89bmr233572245ad.47.1764163364198; 
 Wed, 26 Nov 2025 05:22:44 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b1070c3sm201155025ad.12.2025.11.26.05.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:22:43 -0800 (PST)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:52:37 +0530
Subject: [PATCH v2] drm/bridge: lt9611uxc: add support for 4K@30 resolution
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-lt9611uxc-4k30-v2-1-3de0ea58c24e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABz/JmkC/13MQQ6CMBCF4auQWTukU2q1rryHcVHLVBqBaguGh
 HB3Gxcu3LzkW7x/hcwpcIZTtULid8ghjgVyV4Hr7HhnDG0xSCH3RFJjPxlNNC8O1aMR2BivlKX
 WCc1QTs/EPizf4OVa7FMccOoS219GHKT5z7wJCZ119qaPqvGmPcec69dsexeHoS4D2/YBmeYZ9
 K0AAAA=
X-Change-ID: 20251126-lt9611uxc-4k30-39f44a1dc06e
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764163359; l=962;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=zg5ZN0OgrLOFZOMaQ2yLJzDpMcHB4pvyLOBXH58Cjq4=;
 b=a8At2RKgyJupEwd4vq9VvPoawQeGtviI0jOgtRnvVe882kJ/aAT8HHqJeCpsIH1+wO8OUQzkq
 7SdgDhY3Gn8BNTdPBtPKQSnh7BFSCbqFUrcTgBXS2FQiRMcDjPr+8kY
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Proofpoint-ORIG-GUID: INSsmi1hmOjDjWozf5iTYjJJ8doAzGsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEwOSBTYWx0ZWRfX6GnMZYX1/pzq
 pGUHOPxp2vPiXP3bGZFaY9zI2oV4Fk/qxTrLZwTgThqK8/OB4gx4jz9Zqg+IMAC6qeLiC9sDMAJ
 5DqxuArkbMbXrMCFLDQDcJKdlKRImAu8SyhZmsi8eMAT/S75lYif4t3DgklkB0sVTsHeiFxkeSE
 GVli35BPLMATLlzQTELebrGoEziVLJ027A0EBwne+5wWwPkKqa1u4B7Ag52Ld1Ix/V/m0aMq8xo
 eSt0/84/QH11571b1+0E7PD5Zf8wrIDkRhulf7VvVZzEB89PF+8EjqE8+84XxTvRsZ/gj4wnHMD
 rMApJrLlhMnFZWUYQWmiZ94DkhKzR/3R4l1jTtvxwK/vkTu+AUyu0ZNYAFXaUWUCnJf7JvnW32R
 lcJwzlP2i7me4qlSbeERjWgWpsWdJQ==
X-Proofpoint-GUID: INSsmi1hmOjDjWozf5iTYjJJ8doAzGsq
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=6926ff25 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VfO1_MhE9zHharwcnMoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260109
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

Add 3840x2160@30 mode in lt9611uxc modes to add support for
4K@30 resolution.

Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index cfe389b4c25c..ac53da6c9711 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -100,6 +100,7 @@ struct lt9611uxc_mode {
  * Enumerate them here to check whether the mode is supported.
  */
 static struct lt9611uxc_mode lt9611uxc_modes[] = {
+	{ 3840, 4400, 2160, 2250, 30 },
 	{ 1920, 2200, 1080, 1125, 60 },
 	{ 1920, 2200, 1080, 1125, 30 },
 	{ 1920, 2640, 1080, 1125, 25 },

---
base-commit: 74fa9bb7c620b3771412bb8b14fd0b5a83296f06
change-id: 20251126-lt9611uxc-4k30-39f44a1dc06e

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

