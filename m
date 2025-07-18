Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70129B0AC0D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 00:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4249110E18C;
	Fri, 18 Jul 2025 22:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeXl4k9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B4510E013
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 22:15:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEHHM1022256
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 22:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=C0PvvuuzwRxUCUNTXNvI2E
 7eGEwqScHU67dxy7VxDIk=; b=PeXl4k9GhBPXSMyVIKR6Uojtv9cKAkDCsPzQe1
 ZAPxUeWKXFwBqe540fNFoTMcFEIfd2QXFSC34slPxhlAAlJQ7N8qqwPSoYlbPuGJ
 C59oKwWCY92Eb9z0L9RzHq6e1p4HfAUa9PY7jwqq7jkP/JbFtlFUfoZt6R8TzzhN
 w2F8ynS1pj5Qo4e29ZGjii4jBou5FXofRPuEcGSx/txY7Ic1HHjo7/DZOoS6W0mw
 eZZMXFLGjg9se9OVkg19S2JY6aXfq/0sNQV68pAfgqfCnxjYEEnUZz5L2XBrj7DL
 GHfgPNYvF4eDgCA+Al4zLZ9augU/Yup9OqLBh+A6G1u/Xpdw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyd1n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 22:15:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso2868032a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752876958; x=1753481758;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0PvvuuzwRxUCUNTXNvI2E7eGEwqScHU67dxy7VxDIk=;
 b=hvc/XKytKmFYdDiZWu2+t6qfkNiuz2Go+2wpTYADsJql6EVnHesYL4YlxsucxcixJC
 S1qLNyiskHNdDXzjaVCOlu7ui8okNzkBSu+yxl19J4Pz+ImLoDaVKsZuBtyDnOOHFpYG
 sl/4AiRe2i1I19WNYXiVBEbuQbeevvTY3LAT/TawpR1O5N0AZCfbsNxyEpJULpkAYa7W
 URPsKPJcB+qh/hGKd9Vfd/MOCiB3ACdjZfjKls0D/Bm1HoCAE7bTpWu92ALx+UmM2QTK
 C7HqD5tmuiUTpxV0SLltpHBLwCzU5OkT/45J3n3TmyPFi1DlnAtFZb0GLtvRgea0/qd4
 nO9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL7yjISNh3yMHAUAEPnNBZW0py32IhS6vJuy7bo0FS2Jx4IvpRiFnqLV6Tt14Q2thfy4mc4t7Qlvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/RRS2JCd+cstnwXUwCQIRuIxIdJj/saTG4xaLC+B/lSLNmJYh
 7C8kYGLCGcFiIRFZ5IM/F1To/83lfEvC7+glZcYTO6QsMGJvgdKyhusO9mjAwfeJu1QIcRl8DnU
 zy+rmL0AV44yiNPavWaBGeREntOs6wUHy/pM+Sufn/+Y0ORyIgiPBx9WlSKgYUCyskJTHTf4=
X-Gm-Gg: ASbGncsJsc7AvLcArZYgXFQcXIFFAilxmkrgnE1Z/bp37xrrBR5p/d7UMrX5y2fyosv
 tzgzstaSqp1bz5nCp4D0A5a435xm25Ho7VzTN0M2AjklKN8Qkwh0qgVg4as7aNQO3b9njLUk/zl
 wOLTNKgUEaMf7/O8LCTjSsfXDb0eft+GwyWvbsr7I4a9tYtVp5+9sywbas9zkpNxf5J9NZDjAEp
 r/KVhQEYmDz50501SDogd2KdtQ/H2iee2kodQOws0hwfXlBynLg+i8s3A6p2od17bZQBMsqM1GV
 qJSb0Wnr+S+m0vRrkSMvXGqIQHUwog3a6TpiWeZ7A31PLIfuT7Z4WbbX5Z5Y/xrn2DEMi4FjNHM
 c3z60Umv0nXs2N2TD+84zWlzQ
X-Received: by 2002:a05:6a20:3d89:b0:22b:f4e5:d0ee with SMTP id
 adf61e73a8af0-2390db6ab83mr14277063637.14.1752876957753; 
 Fri, 18 Jul 2025 15:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBO0ykGTBfx1qrutnG+D2aTIW4RWxzLxSjTOcm4yBjA+VpO8y6BfIeSt9nGM4mM6vLEZlXAA==
X-Received: by 2002:a05:6a20:3d89:b0:22b:f4e5:d0ee with SMTP id
 adf61e73a8af0-2390db6ab83mr14277020637.14.1752876957315; 
 Fri, 18 Jul 2025 15:15:57 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc680absm1795568b3a.144.2025.07.18.15.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 15:15:57 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 15:15:51 -0700
Subject: [PATCH] drm/msm/dp: Propagate core clock enable error in runtime
 resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-dp-clk-error-v1-1-9bb5f28d4927@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJbHemgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3ZQC3eScbN3UoqL8Il3zZENLM1MDMzNTE0MloJaCotS0zAqwcdG
 xtbUAe16cUl4AAAA=
X-Change-ID: 20250703-dp-clk-error-7c1965066541
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752876956; l=2330;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=+ObMCEP0xXFpmbdqHtBPYDKFpPRzfo7882m39lX89Tg=;
 b=dgS9lNvWdwfby7lBzTlT1cofoz3lNYpyZ62ENSpTmdID0SgnlzSsj9e0Vdl8ysD9gnJPYJXlP
 3o8Eta1eK/GDXhhc3Dbp8FQ1HzTSVUSTi+inNYbjgPWxPp82OplE178
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE4MiBTYWx0ZWRfX/cg0pNW/ZvyF
 S/JhMgekZ7xxntsl/o2VwQKCcfqjm0ueTi95tjtlE5fInYN3a1HegpDDsqTEu0i5FEpjgk1tOsw
 4ntlAbl8jlaskcIm9Da3lqZkeE/DDfhRAhbYtS52IcAhXKKd1NNJidaCH+PACh5LxUT/DMcQy0b
 rv0vdanzLSH9Na+rOrOXXI9yH/c0KPO3CT11NSSKe8QPUbwmpZ1+mwLvnU5ErEKCBOGHk3iKMGs
 wek2uWo1/3BZRCwVQwtHRwJyr2YwkFexRQf60u0W/EFgea2ElqNfr4X395TkoYMuN65QOukbn3D
 TbuSJQ2Wpw/jes3FRW8KAnH/JbTMoqScYkXVK1AdCvFWheTz/7H9hRUR5FaEBTfDwglvjXu5x3h
 EcVl64aeVlNsDVfvOJVdijiVmlYpzhqGwB3MR8SqAps0lnIDEcn19OplZk28QK5JapwPepP0
X-Proofpoint-GUID: 9pkYFp5x5SkTaFAxD8H9oXPpsJo5CT-L
X-Proofpoint-ORIG-GUID: 9pkYFp5x5SkTaFAxD8H9oXPpsJo5CT-L
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687ac79e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_9WUdxqi14MbyrDA3vYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180182
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

Currently, runtime resume will always return success even if the core
clock enable fails.

Propagate any core clock enable errors during the resume to avoid any
crashes later.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..77d5e89239d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -463,17 +463,24 @@ static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
 	}
 }
 
-static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
+static int msm_dp_display_host_init(struct msm_dp_display_private *dp)
 {
+	int rc;
+
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_core_clk_enable(dp->ctrl);
+	rc = msm_dp_ctrl_core_clk_enable(dp->ctrl);
+	if (rc)
+		return rc;
+
 	msm_dp_ctrl_reset(dp->ctrl);
 	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
+
+	return 0;
 }
 
 static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
@@ -1453,6 +1460,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 static int msm_dp_pm_runtime_resume(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	int rc;
 
 	/*
 	 * for eDP, host cotroller, HPD block and PHY are enabled here
@@ -1462,14 +1470,14 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
 	 * PHY will be enabled at plugin handler later
 	 */
-	msm_dp_display_host_init(dp);
+	rc = msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
 	}
 
 	enable_irq(dp->irq);
-	return 0;
+	return rc;
 }
 
 static const struct dev_pm_ops msm_dp_pm_ops = {

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250703-dp-clk-error-7c1965066541

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

