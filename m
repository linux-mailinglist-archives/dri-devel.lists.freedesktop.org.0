Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E70BB02896
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA7510EB10;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1etFXxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8677410EAF9
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAmQ7s007998
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6E9jQkxkkxYeO4ddlwUOckDDTm7H+p9IlxlOX6Jevp8=; b=D1etFXxmHyKRaxoM
 bJ6v71QP1LS9plKKCo8Q5z1fdSomHSjeU5sXvAH31+/zLKrSb+3BZSlnXkEepOkO
 M0IFP7jSc6e8s47GIf5EU6+ZQvcYOxQkr2qawl9M+dtwNO3zclCcyUXlyM+fh3o5
 2NgpIv/Bc0UHfM7JiV8oaEsv9mLv7Kx+EjwFCYlN3N92D55XTekQp/D/c5+8mOr4
 FIGu1wOaLs5AS65CYX7KWndd4b2F4VUdVuDb3fnAC22CuipCTxsBkqrbarty0ikX
 EYu1q/8dZ6hbw5j7UqtYdE7IPriBYAlbXkktzDh6I/36h7BSbQfDtnImwQXKCWEn
 AdLOWw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga6s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c36951518so2882243a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281913; x=1752886713;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6E9jQkxkkxYeO4ddlwUOckDDTm7H+p9IlxlOX6Jevp8=;
 b=e5xR3pmlaOr2CSpGoO48golhWQRDUKlzt+WQKYAUxYsqo0K5eu91psyUpSBc3YxBq8
 EnqRX7wc3hBrqGcBnP3v/VlxU/Z9Kow2887g4Lf77GOY2GFA6eZhb922Ue+hqmq7WeiO
 OYDBecoBwm2kDfshF0MNPQObcz/NB47MIlTxNnH36AkU/CvK3CoeTNC854eWcdJw0Pwq
 9ZXyhCUOSGsi165K9qd7sG2EIQd7tjCITefMoUsu/t4qynzIk1sxDr6DPzM0CmG3589Z
 HBXEUoTFADVi0ET1etIdlqwMCVhYNk8srLtAzg3MtI3jj6CARujkhTiU1KfVe0gW6vvj
 fqmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrwUwSgHigTdN8XFU7pLRxZd+P6I4gE3Qi/zcneH2SODqTCIIMrv9Rm1TVxIh3XIEiyr0ouS/uMSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztkV+xYBdiJ7qpktOeyATLqoMPEGxzSb+bI1pLMDaiDHTWdh4P
 jd/Z97cYDJHJemXHoc5H+zYn/kDaejfgGOEYfo1yocN1k1ucY7NnxnHPoTw/u7LWf1NAhNd0ZXb
 mhTG262JU+NPffl8K+WNHZJsfVmZcfb2xTW3UAbfHLdreAHmgHNL6iulDaLlH8NLZl7/b7nQ=
X-Gm-Gg: ASbGncuSHIPbD886ApS8/6SuXXwOIQ5NYxLQhetu3cL1Lrui7tnSFxv+Q0k+mnVvzkN
 696mlSE5gUs8xG2lubn2bmtmUWR/t1qU5OCrr9tgXeEqsdSpwm2dKL98HTRP9d6LwHouF6STOoU
 djuR5/WDTP3VqRvyNa6kMHCixNGlzIok1gd8jxp9XS2W0ZG5un9RrPhGtYrmRpgP8CqFArbKBGu
 XSq0FyEwKKcmA4AE0Q5VeTKReRzvOOfdFBvI/KiSjbaKoXqjBNKWv15F7y/5YmizV9Jgpci0MR2
 bSQNWOR7AyDu6+2jrJjA6mj/JbcCIJC1QmoriCkB0TUvmWQt9B53XoOyPYN1jdQaPpKRMEqu3P+
 I+Trpl3h60WzJZtSAuuXzH8e4
X-Received: by 2002:a17:90b:5708:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-31c4cd552d5mr9130353a91.33.1752281913153; 
 Fri, 11 Jul 2025 17:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH+CvOT5H9SfPGFHjjQmB9x97tDpBw/QCMTGSPmn9BMA6KNf6NniFL89xp7m2bTro77IABpA==
X-Received: by 2002:a17:90b:5708:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-31c4cd552d5mr9130308a91.33.1752281912727; 
 Fri, 11 Jul 2025 17:58:32 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:32 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:09 -0700
Subject: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1171;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=mxuxQD5kCjtX7ioz+ogKfK2PsWX6uqWHqGDi2GAvSJ4=;
 b=i3MbKDvWRQHZ10SLpwW1ak3aD4D143rFZvveeCBQjFISiena0vgzQcKaOGa0JMSty5fsxcubD
 8vWZq4Aby2IBX1FRdivd9xC+VpVmwUM6m7ZVVPPv6VwZhleCEyjAFVB
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871b33a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8oAJioj0-2SxPtK92HsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: awuGtdLdvfGVb_al2NE-K88-EJvH5SA8
X-Proofpoint-GUID: awuGtdLdvfGVb_al2NE-K88-EJvH5SA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXxmRI8Zq2/L98
 F2m/4JjwyHbddGXyu7bEKiFc6Bfy5SqqHGegjtnQxo2xO1UVYjAcy93gZ+8XNoUf7pEdhqhh1ZS
 mem6hoKSSeWCEmeh3daBe+ND0wRUf9HubNqXgpjFn0sCISQ8EWkty2kFjNECdv3fDqMGwkX5Kl9
 H5pTrTzr2ncBS7/0QL2jidWu8MVyMLV/bXGmVwFTBesJqGL301cs2fvI0WJAomvORqL7z5hOIPQ
 5KGfBIRiWZV+wKRPw3u+COIZNDdP8A7CgUnD39NI1zezoEBQnXBMoUQP1Fn5Ca5cUSRJ0LGZfz2
 0t+qWlD4w/NCnq90YMs+XpH2IpOvudKG4OSWhLAAmj8bRApx1A9CuplkwiNYUjbjJEuKpCGhAST
 kCvhG+NsPXxd+YfQssK6VD+V7CzF/sn6rfmSw+YeemhOha++Ye2CRghUXJ1kF9eigYgz3roI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=899 classifier=spam authscore=0 authtc=n/a authcc=
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_hpd_unplug_handle() checks if the display was already disabled and
if so does not transition to ST_DISCONNECT_PENDING state and goes directly
to ST_DISCONNECTED. The same result can be achieved with the !power_on
check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Note: Taken from https://patchwork.freedesktop.org/series/142010/
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fe38ea868eda..f93fbcff2cda 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -694,7 +694,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.50.1

