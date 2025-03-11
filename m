Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C9A5C0E3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3336810E5A5;
	Tue, 11 Mar 2025 12:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jrC0XIzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2475F10E59E;
 Tue, 11 Mar 2025 12:25:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7cu4T011706;
 Tue, 11 Mar 2025 12:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Itlm7WxLGhz
 LsJTMKlCN93DiJWTrrzdR1tuidKcZZa4=; b=jrC0XIzSefdgrMkiWoUtSXm6c9m
 EmAMsFnGpY+q51K04cNxOEb/z+C2ApRsM1CdW58ninlk+jHxTv2tLj9Lfv7Q9TSm
 EUz5fW/DvTr/coLCYzyl62N3BNnacA+F6wcCuBmU1nqqPs7fo+cEg27RKF2KgXAc
 Z+YGaLB4VM2YhOEL36HfdPAGVQQfEBgyMw6XNRdZBH2TNy0WrDZOyNdGKY3Feo23
 ++n6eXw+0dCfD3gJK94IHBbW7Bv4KMrGmitINGJ5ecuiCMivaoFMJrOfz/vRDkO/
 g6y4KAmZtFDhj02BGVnVx8w78+ELxNmqpU0AnngukvobSRzylhusPsKuzow==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk8ha6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 12:24:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BCOoam008160; 
 Tue, 11 Mar 2025 12:24:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn373wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 12:24:50 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52BCOnbl008071;
 Tue, 11 Mar 2025 12:24:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52BCOn6e008130
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 12:24:50 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 54CF759E; Tue, 11 Mar 2025 17:54:48 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: [PATCH v2 10/10] drm/bridge: anx7625: change the gpiod_set_value API
Date: Tue, 11 Mar 2025 17:54:45 +0530
Message-Id: <20250311122445.3597100-11-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67d02b96 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=qu7jSu7UeuI-ykz2460A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uNmFDdnK4TMXFr38Y0118oDVk4y4YaFf
X-Proofpoint-ORIG-GUID: uNmFDdnK4TMXFr38Y0118oDVk4y4YaFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110080
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

Use gpiod_set_value_cansleep() instead of gpiod_set_value()
to fix the below call trace in the boot log:

[    5.690534] Call trace:
[    5.690536]  gpiod_set_value+0x40/0xa4
[    5.690540]  anx7625_runtime_pm_resume+0xa0/0x324 [anx7625]
[    5.690545]  __rpm_callback+0x48/0x1d8
[    5.690549]  rpm_callback+0x6c/0x78

Certain GPIO controllers require access via message-based buses
such as I2C or SPI, which may cause the GPIOs to enter a sleep
state. Therefore, use the gpiod_set_value_cansleep().

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index ad99ad19653f..310c9b598fbf 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1257,10 +1257,10 @@ static void anx7625_power_on(struct anx7625_data *ctx)
 	usleep_range(11000, 12000);
 
 	/* Power on pin enable */
-	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 1);
 	usleep_range(10000, 11000);
 	/* Power reset pin enable */
-	gpiod_set_value(ctx->pdata.gpio_reset, 1);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 1);
 	usleep_range(10000, 11000);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
@@ -1280,9 +1280,9 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
 		return;
 	}
 
-	gpiod_set_value(ctx->pdata.gpio_reset, 0);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 0);
 	usleep_range(1000, 1100);
-	gpiod_set_value(ctx->pdata.gpio_p_on, 0);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 0);
 	usleep_range(1000, 1100);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
-- 
2.34.1

