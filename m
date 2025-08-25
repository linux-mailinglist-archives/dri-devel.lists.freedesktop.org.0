Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B8EB34305
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE210E4B7;
	Mon, 25 Aug 2025 14:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YgalJd0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E105B10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8SVm2030501
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wrKjdpoxycp4zwQBuyFtLrpN7EB/eov61YjzQV3qsaY=; b=YgalJd0xo2V2c+CZ
 Tn8HjV3KRBF6crBV2LkayDXvEjzV52RQvwNsgikQ5S9XvztHq9nQg9YkOoW5Vp/3
 bRzZ8wd0U7VirlN9MREXCllkdRL5D8MguhhFjnUYOfL/GeIGRD1ZZn7uynVwFBUT
 /86a/vnAcS1IOYCFvE/IZRH1MtHk2GE+KWwHJDm3vpnRYZvHCCgNx0X+WoIR7lNi
 3jXhO0RKEEz2EW+XO01lzMplxBija9itq+8njVtzLoUCTnraq5RIP7JL2lCH1R26
 y+bVYhYz5YAKghH9EJSUdybC4OgYaHYb8Dw2epSSp0EcrO0+bFZ0+FLQRFcc0omT
 T0C6qA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unn8y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-771e1657d01so864344b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131458; x=1756736258;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrKjdpoxycp4zwQBuyFtLrpN7EB/eov61YjzQV3qsaY=;
 b=mQ+5BEdJgFLL4l4deYZR7VYgUSYQlbjRciKupd0EuvZU6FUwTcHjDo+19xIAd4jLV6
 8kt32+dkrVPaIcvlsFtA1qapCGmtAOlYe3oQpjuXT59XBPg4jOryksxOu3+4XFemSe10
 ERV6wSBU/SMs77PWlQ2LW4+LtoDnYp/d1baDjWJHFOmizbJSrGlxujiFJxG0jVwbRlqA
 mTI6scjYPtuxCiPAiqH7RKaiV8eiyzi/5MZqtaHaUWigVc7UFwhtgIKIEggNaq4LJ54a
 eIksJ0bdTqrtdeu+2/B79EUZDRHGHKWfG3DTEVnyfMbsVs+aNASm0+gV/1qQyia/3/DR
 WLFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtEjA0mAuZwhFak9gPEvI8WPgwmKi6IAd/ww0UHQdda2phqYK7hNnorReS7EibWbnPFh2YARL1x2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHVD6zJIuNb/G2M/r5lK/muqr46IPzHsf9arwm0eJz62MTXJes
 cV4eLf/Z+B+SPZTci2FCMSPMIZ3z0q53KnpiNEY7Cq7yfP8nNZXDmrOUgL7Ydg6l244gcgUjJRI
 i6LSlcHokt4ycJin7R/8Sx/LOgY1nPXJgUuyfitnjJO7B76NLZsKeXuuaaf4E9lwAKbPiZCg=
X-Gm-Gg: ASbGnctqX7Ts1uf85xIj2nucj7AE+S3O/pNu9AvYbFKzfQVzJCxBAwSeHaR3TgDfKL0
 2i0K/INBMpTqhvIsn4oI5dXmOAM4/DFsDJz/FGohu9a225Xj5dVzip4Ntt8Hmhm/f6W1rIi+6Dn
 CDYPvvxnPZRWsTu+7GAQYiheqjRdBCpgxxRhpVIt5qzMh7L8Z8axJZC9aaiYDaYpjz07Yr9ReMY
 0IBIEQOAr+0SjTOb5VsV28nUvjn9NA7tPhPU2fT7/nKxehG5TDbTikIasotRjSvRpht8HHPcreD
 82qCXKzhQ1lRebf+nDNRaEqLVtOKp0t7oxUaQ0RFTIUuYJH2olpigNClX+/uIAxPaqV17Sk=
X-Received: by 2002:a05:6a00:3912:b0:748:e5a0:aa77 with SMTP id
 d2e1a72fcca58-7702f9f153fmr18042144b3a.13.1756131458372; 
 Mon, 25 Aug 2025 07:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoeoIYD7IX4d2D6LwWN4xg7TGBlsCBJRgR2BV3sGR9tz7vWmXqFytzXB5A1yuns22KYfx06g==
X-Received: by 2002:a05:6a00:3912:b0:748:e5a0:aa77 with SMTP id
 d2e1a72fcca58-7702f9f153fmr18042070b3a.13.1756131457522; 
 Mon, 25 Aug 2025 07:17:37 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:53 +0800
Subject: [PATCH v3 07/38] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=4541;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=laPtcJI1sC3fX2ycQzzsK05nYl2YDFvhgopjq1iL0Jg=;
 b=u/fLY+q++RSsxq/mnLG9orc/hcrk3nh6rXINegH8Oo5ZOJGMugsoi7pjWq0MvAkr2r9zpSHFB
 ROXDbGf5voYCQYZQq5uqi8gsO2eSShoJ1IFNK38zr9hhYhVYVuAtZI5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: HZD8vY3UlXfc8mAo_y218OJ-LL9CGJKB
X-Proofpoint-ORIG-GUID: HZD8vY3UlXfc8mAo_y218OJ-LL9CGJKB
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac7083 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=s_Xww9EJd3sp7u0t16cA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXzWBzC5RCxz24
 zLylOKZX9QzxXoNtZNBbcRxK8CqSnEeIQNvXT5GXxiI0ArfIxyzDcl8uJlUgv7kqgxHEL1j1xlx
 aepvlpB+6SRKc48h2L5hnrWLbWCp/smHl9Adpp+gI2uZ+6lB1EU1kI+EIzcb5L6qHK5f10Xew3E
 0+kd8mQUwkzUChLONHzsGG6ioRX+PikdTaQmbqXBqOw/6R21wbNN/WAiVvpLyIOClO1dBwqDWFr
 2TxIuUB970ZawB8/PZM58jZsLo/Zr8OoF45klnmXaS+aDSl7NxTdc6HMIOzqUrtEwwRCrj1Ubgg
 0rW9Bx1zE9IGppCdQq6F0JgilUrNOGN+wEUADT/4A54XsOYBrVoPuFTQspLgdKFhsPWw1JFt+nh
 Wk7bqFgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

Currently, the dp_ctrl stream APIs operate on their own dp_panel
which is cached inside the dp_ctrl's private struct. However with MST,
the cached panel represents the fixed link and not the sinks which
are hotplugged. Allow the stream related APIs to work on the panel
which is passed to them rather than the cached one. For SST cases,
this shall continue to use the cached dp_panel.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6bfb639c1ebd33f1103c5b68dfb40701738fa267..261907446135904a9e479f18051974f5fea88ef1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -469,13 +469,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *msm_dp_panel)
 {
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, msm_dp_panel);
 
-	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
-	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
+	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -2497,7 +2498,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2510,9 +2511,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
 
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
@@ -2544,14 +2545,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	msm_dp_setup_peripheral_flush(ctrl);
 	msm_dp_ctrl_config_ctrl_link(ctrl);
 
-	msm_dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_panel_clear_dsc_dto(ctrl->panel);
+	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 93747c0a9b3f049bc877f347f05d42b66ad0dddf..78406c757eccf95e82f1a9d4437ebdbbc4f8ea46 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,7 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4c74eb2915fd620868f658ccafc32030b1c208c6..d07bb40f848e0e13a0fa32aa70ffb1621edca159 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -720,7 +720,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 

-- 
2.34.1

