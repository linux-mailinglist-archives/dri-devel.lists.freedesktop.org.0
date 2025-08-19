Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BCB2CC8D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21E10E65C;
	Tue, 19 Aug 2025 18:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl+mKYka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDFE10E65F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHIa7V000431
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=dl+mKYkavx9jfaMA
 pxQZjyuWy6ApkP6xIBIp2SMVIRICIp0wxmhV7nhMBIRSvdjopk9vRHt5CYN5D5Df
 gLqKGiedMLp/PZNbePG1dNhpJjmbMK7kCP/AxuSYpD4fXH3A84UzGAUCQdknE074
 /aRuxQLfPQLqG41ItAlcFxxtg7dYd79jkKqtRnTWPXY1cPLux/M7lHq17viN3ikO
 fah3pe4J3EGxoQ028nhZKqBGYXZlQ2dFzNPrmO0NhDDQ2SFgR7aHouiDSu4CY4RK
 PqERRwTfzdyLIeFEGJD2WRq2FNcqPVCrHM3Z2a1a8/x3vKNyHRonQvhoyckHbAy7
 Mf2yGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079n47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9f636685so189530746d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629866; x=1756234666;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
 b=GFzpUM6AvzHaNle0rqjsjuGeRaj5zy+oMlSACXA7GLLTBTZw7fEjSr3BKy1ci3Xj4/
 SaLFe+/3038YZEN9CvcGNsndrCCRS9q4/G9wdF3yoDUGkKGrrG7V9SuK5zMtegXnprF/
 D1uvpqkS63qmpB0TNi3geVEsXyOc0YzeQEw6D++Jm1/qcvq6xUBKLKJ/Tsk1D0Ck7G/D
 k9jr5V99k0TDWWrbW2OVBRLSlj6Cb2chakCLdFfbbhWCroLHGGz1vig73IagP4vimtRY
 A1L+5nFVL8Sx6DoO6FTST5YYPAwYqaG0A96FfzJA6n3/Hgs+R2vyeQZua/BVBsvseNPJ
 OvXQ==
X-Gm-Message-State: AOJu0Yx0JVKZ/SYWfH0R008HTg/327G86x7gXMXsRLrQDKaN4pInr530
 C60EKvpLvKYSGcjVqAaQa8xfkU5VO/D1K+ylroCF7aWPZcKfbu5CGcfh4PA2SyUphMDTdh/U/v6
 H+yR2FC4X9wp86TGZ2ONPkbIis6LZ2UjFV9CBuY/W+swSWouvA3FRtCaIKhGHQEa+Y92N1Gs=
X-Gm-Gg: ASbGnctdCrBJR7QoP7OZH+ncBUm2ch6cx/0djkOrygYs7JIpcjIPxnKUbJKL6sh7dkD
 0GLaeg0tyHaPjz//+vY1577t0iMSV6A7YCyWM7JGlkyunfkC2JpsGfePSFe70bPzLdsR8o4wA49
 ORINv4tjbqPLGa3JLgjzxdlwkQ+4wKqSNpDsuYj0WV46pQcTx66s8TWLdZmUBwTXxK4DiPclwzn
 J7JYDQ78nwk6yzer6vUl+wu4P3pXUOboMqWLgqOED/NsbItpnLOGQOFgZoxpi5cH0LhTu8fUDYj
 CUDGGHgWGjWDK9ANwLDHM07QC/Ur0YBA01kP+ceqTgm3eOzDSmKE83kPPCTWJDuRvLTeZbQLdF6
 cNJTyh4JzAcgB2HNe8D3KiXwa0okXsGGXVXNcG3pE3ODrYbFzM8kF
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id
 6a1803df08f44-70d76f1b57fmr977646d6.3.1755629865652; 
 Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9lG70O+e1XTcrpB3s7bSU3peWs1FenRfwedIgpf8VBr8B4XQM4LoKEEzgPGJdC9gGNvxDA==
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id
 6a1803df08f44-70d76f1b57fmr977216d6.3.1755629865082; 
 Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:34 +0300
Subject: [PATCH v2 5/8] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-5-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkc6uAxm7Nj8Fu5N7QPKSrbc88k7ZAuyOExK
 KQwTesFW6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1agAB/9o1aDDfIY8MzTByg+veg862UBNIr6XxQEXInLmnD2NrcHjkS2h3H6hWZ6N5ehfnvYt2OB
 IfENqfzAoXBer32q85PKjMZRz2rbnEV3Q5hRMl3Yd+cLZ+Bgggm3SizKnyEUVEsOPG5u5e/UWdF
 VfWw6fncj22N8fWN4il1qeqCWwQpuYq1BbuxcWHT893G7cCwr+tEkLGlXL+RoeEhTZ79FjIOWLj
 nrjOzHE3F9R212pGr8mYVpoQim3b9qZFOAq3qjoZ0iRNLnROElCCvPsDxxdDhCMEznPjF+Lh08I
 s2lsMKsTVzytn+1wHItHP0kXCQgdfhgPAMPhTPoQ6pC3mpbH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7DH57WOMx-KJ9_9ePyKX2UgAnLdHq_hS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXz0+/eytcFN8L
 yufS5Xv0JstUcI4bw8fLH5RfSD7d/kdVgjI4qGnvQJo+nAWIVPHinkaDUU6P47p9aXkYXZ3yRhy
 uXGik82NB8X0Gok3jo4/MbaGkdgiFWEyszkHh6hNQb4PBTOPWHyO08w1OAAf9//ptKiVcAqUH0j
 aEyDdXd72tz33BiSwpr8fBuMojGlJ0K2B2N48+0nhiAsOcFIPPUkvOTPKE6eYBPaW5Lye8CA2DA
 n3KFSiXqZnou2ed+mWLq694G+K7ppY6DNpu3YCTMe1jxTPldxwq8J14O6xOT9MnvfayYpjaFYhj
 Su7nj3OSdxYcnBqfwqt/wUtY+TOb2BEQx2X32B2JNHax7Z5bVOxdFFWqwXeXPvHkQhgtR1qrTHo
 gRG/8mBy
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4c92a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 7DH57WOMx-KJ9_9ePyKX2UgAnLdHq_hS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM,
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

