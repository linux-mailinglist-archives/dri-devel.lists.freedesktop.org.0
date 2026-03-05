Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGS4EbKTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2021378F
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC7410EC3D;
	Thu,  5 Mar 2026 14:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZlPtdgT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKE6PZuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF30B10EC3D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:31:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFhOq1783458
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ld2Ouw92w6/L6Zu9kQQPQe8AQdAbl6wT5lMzyeNx8XI=; b=ZZlPtdgT1jKTbdHS
 yFlCXwiYqio9mNrNu0W73a8s2yZg1OZjFmqYx6CUcZB+ETIByZmk0yut6hgrYUfr
 xuRiyQLTJMIqyzoqSV+jVOEW9x8IQkPO2T0lCZO+h9JKUmxBiuFB6k/+jp6WVGI+
 dpphcMhPn+qhACHdcMzxX4gDA39p5CmBETskqVt/ktlgFZVgwGm7ohDxAmpFbXOj
 bMWQOSqSbNmaogK7Oy7hzoiBB0RZCqjBmI9ovQjxfEIEPGx0PKV78Cg9kHlAMivp
 khhU3fQx2oL8DaylRIGMK1EJ1XuHk1EZO6jWYWH45w3l3gx41D0V2PAC0arQCiRw
 LsAh1A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk2288-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:31:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5ffc6cb5980so839849137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721069; x=1773325869;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ld2Ouw92w6/L6Zu9kQQPQe8AQdAbl6wT5lMzyeNx8XI=;
 b=YKE6PZuXuW2ypOQXTLd57BsHolDB4IH41h96+g9lptrkPnxFAEKvPDu3trsyIh5bLn
 nECgl47WtsWxgYi9HZpac/rgU9UlZmtaF40EA5924JpC/esLDAkrbEiLE0iPkbxtI0ak
 4k2QlFdgpXNB3TcXvoOCF8SRtKWAVk8nAidI4RmwZbDzEsOrSNPs32NSOa+/QNUbzeKt
 oAvm7X710ZVIAbCuV7FCltgT0VaZCLb696LoMLHmyRPje56I8Dbo7Lo3q8nFwwzsE79e
 aYN0XNwCa0SKf3+n6PFXIMY9nQ2+C5S/Fr1iZYo1vIufeJyxaFpIsRdW7D4Voc8eVOXp
 2AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721069; x=1773325869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ld2Ouw92w6/L6Zu9kQQPQe8AQdAbl6wT5lMzyeNx8XI=;
 b=DpnqvbeVnqO1dRnXuK4pkzPxIQNtsEAte67inEQLKisPRTIoXA8S+a0uhlM8loqqQg
 4EV93dAiA92+hOxeUOneXidAG3NQ/RAh6sBk5K6xPMpZoLWo9Md9EbJQCScm1R3kD5N/
 ajwapc2g3I8v+Qv4lSndbkOmgTcGGKZ73SU7v6NTqv6APNdmBWh4fAgcfk9mUa57O6g4
 VW5FyLlnfKNx6MiVQdJCs4LwHzhYFoyEm3fKkULK7/PC4ryoMhd/mSBN+Hbz/xJKv6kx
 EZwm76ACPaPq8ZsaCh33IOkEsXiCp1khfKx/0MAKka5AE38ET3xr14hGnDKOqYFYED+B
 vDsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiymyzGbbdO5JU+ycG9M3vsnHl/lF963KdvRPhcBao823c5qtaCHDCKiMkqX6Kk1kR4KxxXbnY9EQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx22p6cC1u+ugr83uWEvIS6vUFzi+Tf4RJ3x/Kcu1k06dBevh4h
 0WNUyGYyoXwwQS9/LxFOGGmgwPbHfnk7JB7X1OnXEv61hfbtyxZSz8tyRJxeSdX8Wqu+2nKC3uS
 B6uV3uUwvsnKUcnx5q9UjjVWAKH1az8C3FSua3ndLKhCYFZltNIZhb2c8o3lXN568S5YgJZ0=
X-Gm-Gg: ATEYQzxmZq314Q/hvx6yH8fdY98Z78CI/QReCk1bgaWEIYxuwaS8Zo3UFH3Dp4Khxnu
 cbnuRBPKIEkgmaq8DrKuD4N8MHPHkC6uFTN7fCbXT71OuxzLL5j6Dgd4kfGq1+uYicRQy2B6fCW
 /H5tR0AwhDpsZBFks1CHFB/I2yxvanKdqZ9zFXWHiIK5Rstt8+poLbRTOkKdfH4UIhsBb0XdjyJ
 41twqnanPsMIe5EKOet8A2qO3v5A+huQV6kgFszD7/1x5H+L5HmO9whgNqW3HGMQMaNm+AYQNpI
 9anSuXpF4eYQ987C36T8c+1Cxx7yK2pQwPu/zh3+x8TcZrP7Yldx9ZIDRJxfoEiXf7Hbkja89S1
 Ru60AXCSvdPmFMCVJaSXQOb/9u1MvDndrJ7ueqDYWtue99vP2aA1wxU1OryD7B4Nca6Mw+9fLcr
 gV0rvvnpOcVWBQlFzsugCiliuNMC5hQbUdG0E=
X-Received: by 2002:a05:6102:e0a:b0:5ff:a3de:7225 with SMTP id
 ada2fe7eead31-5ffaacfd745mr2297110137.16.1772721067632; 
 Thu, 05 Mar 2026 06:31:07 -0800 (PST)
X-Received: by 2002:a05:6102:e0a:b0:5ff:a3de:7225 with SMTP id
 ada2fe7eead31-5ffaacfd745mr2297065137.16.1772721065559; 
 Thu, 05 Mar 2026 06:31:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:31:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:51 +0200
Subject: [PATCH v4 9/9] drm/msm/dp: turn link_ready into plugged
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-9-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R32OdfLUHsQw4ysEiC4sXpcqBoejWjyDNBiNJmZkCVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOZQbN5JUhkNPEYzXrMNKSqWRlqvzSYG/AvE
 knF6myJ2mSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmQAKCRCLPIo+Aiko
 1RLbCACbfawTPPRng687TeslLGelMtrhY2VdjaX2+OUQvtLqLRsSiuoM4Xzw5f0Uw6FjtVwwrAq
 UJns3rfHeBxVNflPIEcdZsVDqpfQTJcAHEvl3/oYVrMj1GnKPSW6B6BhBh7i0FVLB6QyvqjY9wp
 y6efhJKgop96ABfz6YYOOF0BL9TyfIUgwGVBL1GCYP6USdhlY4JmNTsyE1zysd3myJJppLCqeIm
 wmeX6ugrwiGlYXk2AjL/d+tbKEwP0vjn1iz533gwEyljpkBAYiPbYQWdFxGCsl928jxoKC8KyNX
 xXV7XxbYWosQxrJUgf+IVeBc5W1w+lYb3lHppU+0sr8PlUgH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -2bHUK9XvI3obKAOUPZtrHuidBqUXlpD
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a993ad cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=n7_vWGaP1GUJy7dh50EA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: -2bHUK9XvI3obKAOUPZtrHuidBqUXlpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX+QgNzUdU9VUs
 Gm12xlwPJmB7BokVKnp8pK5DIWh4CbL6llxiayFW1JqrCYPJYtDVoL10+0CfEGXD4T2H9bCS9vi
 vvCrUr8tkiUGhZp5OHJyQgS0WMa8BpdW2wPi6kNCfIvG8CBuizmVxBihEUffaR9sM1iyO4Vn9CZ
 IXP9aExRoi2qkdnVbbDcZpAjAu47HhAogO1UBZLyt662wz+3VT4sq8RrXZqScCVYa6l+FySx5zP
 ORTjOBZ1yPUA5jli9y+sJglawh46UgYP4js7dke6r6NdRMadOeuhI4qQ63au8niuCYMhGtiNqNN
 4MN6iYbFVGGhp03WRl9FmYG1eZFbl+NScx35qrqai4AEbIL093zulPigZAvjRhG+NkyEScXHRoz
 ZjaVx4tNW8gZpBPVLl1JrGs7tcn+/n43KCi3OGxFakohapW9QJWNHeaZeFFobIy/G4uzrDd8i2W
 Q9C88LFod4x1z6ntsfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: E8B2021378F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Tracking when the DP link is ready isn't that useful from the driver
point of view. It doesn't provide a direct information if the device
should be suspended, etc. Replace it with the 'plugged' boolean, which
is set when the driver knows that there is DPRX plugged.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 94 ++++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 drivers/gpu/drm/msm/dp/dp_drm.c     | 41 ++--------------
 3 files changed, 61 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a1fb9c62bb0e..4e3664f9e5e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -53,6 +53,9 @@ struct msm_dp_display_private {
 	bool phy_initialized;
 	bool audio_supported;
 
+	struct mutex plugged_lock;
+	bool plugged;
+
 	struct drm_device *drm_dev;
 
 	struct drm_dp_aux *aux;
@@ -284,8 +287,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
-	dp->msm_dp_display.link_ready = true;
-
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
@@ -303,7 +304,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	return rc;
 }
 
-static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
+static bool msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
 {
 	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
 		dp->msm_dp_display.connector_type, dp->core_initialized,
@@ -312,7 +313,10 @@ static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
 	if (!dp->phy_initialized) {
 		msm_dp_ctrl_phy_init(dp->ctrl);
 		dp->phy_initialized = true;
+		return true;
 	}
+
+	return false;
 }
 
 static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
@@ -366,14 +370,6 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (!dp->msm_dp_display.link_ready) {
-		if (sink_request & DP_LINK_STATUS_UPDATED) {
-			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
-							sink_request);
-			DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
-			return -EINVAL;
-		}
-	}
 
 	msm_dp_ctrl_handle_sink_request(dp->ctrl);
 
@@ -392,11 +388,11 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (dp->msm_dp_display.link_ready)
-		return 0;
+	mutex_lock(&dp->plugged_lock);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
+		mutex_unlock(&dp->plugged_lock);
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return ret;
 	}
@@ -406,18 +402,16 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	msm_dp_display_host_phy_init(dp);
 
 	ret = msm_dp_display_process_hpd_high(dp);
-	if (ret) {	/* link train failed */
-		dp->msm_dp_display.link_ready = false;
-		msm_dp_aux_enable_xfers(dp->aux, false);
-		pm_runtime_put_sync(&pdev->dev);
-	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	/* uevent will complete connection part */
-	return 0;
+	dp->plugged = true;
+
+	mutex_unlock(&dp->plugged_lock);
+
+	return ret;
 };
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
@@ -446,8 +440,12 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (!dp->msm_dp_display.link_ready)
+	mutex_lock(&dp->plugged_lock);
+	if (!dp->plugged) {
+		mutex_unlock(&dp->plugged_lock);
+
 		return 0;
+	}
 
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
@@ -463,8 +461,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
-	dp->msm_dp_display.link_ready = false;
-
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -472,8 +468,12 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	/* uevent will complete disconnection part */
-	pm_runtime_put_sync(&pdev->dev);
+	if (dp->plugged) {
+		pm_runtime_put_sync(&pdev->dev);
+		dp->plugged = false;
+	}
+	mutex_unlock(&dp->plugged_lock);
+
 	return 0;
 }
 
@@ -820,41 +820,49 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	int status = connector_status_disconnected;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
+	bool phy_deinit;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	if (!dp->link_ready)
-		return status;
-
+	mutex_lock(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
+		mutex_unlock(&priv->plugged_lock);
 		return status;
 	}
 
+	phy_deinit = msm_dp_display_host_phy_init(priv);
+
 	msm_dp_aux_enable_xfers(priv->aux, true);
 
 	ret = msm_dp_aux_is_link_connected(priv->aux);
-	if (!ret) {
+	DRM_DEBUG_DP("aux link status: %x\n", ret);
+	if (!priv->plugged && !ret) {
 		DRM_DEBUG_DP("aux not connected\n");
+		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
 	if (ret) {
 		DRM_DEBUG_DP("failed to read caps\n");
+		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
 	if (ret) {
 		DRM_DEBUG_DP("failed to read desc\n");
+		priv->plugged = false;
 		goto end;
 	}
 
 	status = connector_status_connected;
+	priv->plugged = true;
+
 	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
 		int sink_count = drm_dp_read_sink_count(priv->aux);
 
@@ -865,7 +873,21 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	}
 
 end:
-	pm_runtime_put_sync(&dp->pdev->dev);
+	/*
+	 * If we detected the DPRX, leave the controller on so that it doesn't
+	 * loose the state.
+	 */
+	if (!priv->plugged) {
+		if (phy_deinit) {
+			msm_dp_aux_enable_xfers(priv->aux, false);
+			msm_dp_display_host_phy_exit(priv);
+		}
+
+		pm_runtime_put_sync(&dp->pdev->dev);
+	}
+
+	mutex_unlock(&priv->plugged_lock);
+
 	return status;
 }
 
@@ -1123,6 +1145,8 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 	dp->hpd_isr_status = 0;
 
+	mutex_init(&dp->plugged_lock);
+
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
 		return rc;
@@ -1353,7 +1377,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	if (dp->link_ready && !dp->power_on) {
+	if (!dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1398,9 +1422,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	if (!dp->link_ready)
-		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
-
 	msm_dp_display_disable(msm_dp_display);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
@@ -1498,9 +1519,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 
 	hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
 
-	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, link_ready=%d, status=%d\n",
-		   msm_dp_display->connector_type, hpd_link_status,
-		   msm_dp_display->link_ready, status);
+	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
+		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index d2d3d61eb0b0..0b65e16c790d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -17,7 +17,6 @@ struct msm_dp {
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
-	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
 	unsigned int connector_type;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f935093c4df4..8dc0dabd275c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,36 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
-			    struct drm_bridge_state *bridge_state,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	/*
-	 * There is no protection in the DRM framework to check if the display
-	 * pipeline has been already disabled before trying to disable it again.
-	 * Hence if the sink is unplugged, the pipeline gets disabled, but the
-	 * crtc->active is still true. Any attempt to set the mode or manually
-	 * disable this encoder will result in the crash.
-	 *
-	 * TODO: add support for telling the DRM subsystem that the pipeline is
-	 * disabled by the hardware and thus all access to it should be forbidden.
-	 * After that this piece of code can be removed.
-	 */
-	if (bridge->ops & DRM_BRIDGE_OP_HPD)
-		return (dp->link_ready) ? 0 : -ENOTCONN;
-
-	return 0;
-}
-
-
 /**
  * msm_dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
  * @bridge: Poiner to drm bridge
@@ -62,12 +32,10 @@ static int msm_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connect
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	/* pluggable case assumes EDID is read when HPD */
-	if (dp->link_ready) {
-		rc = msm_dp_display_get_modes(dp);
-		if (rc <= 0) {
-			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-			return rc;
-		}
+	rc = msm_dp_display_get_modes(dp);
+	if (rc <= 0) {
+		DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
+		return rc;
 	} else {
 		drm_dbg_dp(connector->dev, "No sink connected\n");
 	}
@@ -92,7 +60,6 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.mode_valid   = msm_dp_bridge_mode_valid,
 	.get_modes    = msm_dp_bridge_get_modes,
 	.detect       = msm_dp_bridge_detect,
-	.atomic_check = msm_dp_bridge_atomic_check,
 	.hpd_enable   = msm_dp_bridge_hpd_enable,
 	.hpd_disable  = msm_dp_bridge_hpd_disable,
 	.hpd_notify   = msm_dp_bridge_hpd_notify,

-- 
2.47.3

