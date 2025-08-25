Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5CB34339
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33C410E4D1;
	Mon, 25 Aug 2025 14:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLfLV2Q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAEE10E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8IKWF010324
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d4em/xcDonNf4m1zVAyxC0QlLlKFxyiAEUK6Ca1lpXA=; b=hLfLV2Q7e/tX9PDH
 8tY9n7qGH4XqYK9E8CLSsndvGf9zENYtnZzQY/sH8GrYKCo1RN0M0r7PKNvOj6iq
 lQED+8goMLEL9awCENLCbdqJRXyjOkHAu3yk202ibX9y4GrqEBc9vZykHlS3lTbO
 xIxlqL6tqynqZZCQzGjkLmp0ILEhw+JdRVtfIIUydoB7PDIYzwN4MRruIJqMsTIr
 /lx+1wX/d6sTa4nKAfv8pcyneW59p6uIfbvnchgDUKDX0XYUGGP4WjCVnuETVuRD
 16YQAvL5jfxIrjVnF1owZvm2Ro1WVTJ+xNgHtuXcJdb+rLqXMqKFW/qMy7VF/6dm
 m6rwKg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77053dd5eecso2902647b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131538; x=1756736338;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4em/xcDonNf4m1zVAyxC0QlLlKFxyiAEUK6Ca1lpXA=;
 b=P2hnm/kS4DAUzDGLFFZytQZfuRi+xPJIQke8P9FWGmZVBtH5XEpf5JO7JkOr0Xut1W
 IAsHBLCcjpZNA2e58jvYM8OEOdtsl5ma24m+rpKEzbQqmJNEw6oL+oSWHXZ2ej+IdZII
 6wSLpTd1b5aCy3jWV8wwWCSageFM5iI6rRPEeCT2qFs8fXUAvPji6yKKv95hbh3iY750
 qEjW2IdASy6cGMh+y3t1krt/STLzSyjrGJ0aCWs/m7jOJiBWqq6N57UAuE1+Fu5nvkRG
 4/vmR5/jPzbkXIrRHFPOOA+jGwF8Jo9i3+pYTQ0XQEwGFma+v1bMOTWynjMawOtkzG+w
 VVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyBrz7ToSgDvlwQRjSBfB6zd3uW0ANggaDJ0aT8vixRHQrTobQzvuPsEg+NONwImXn3spTuSmCDc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD0d6mIeB6pTrP37gIrGQ5RzGNUPA6+x/ZPloXEA50DXA2pM/a
 SPgmiuQcKLpd8i318QXPrX6rzoK2PKK/kw3CHje6fvVEFIm9LX00E91eNf8MlKoA3rnLkqGKzg5
 C50rSJARIYW4DFycUwD/A3SDdZQWKwh2w1ny5rwsiUiCQvDgHN7ERVSrBfzmzzDW7uHTU9D0=
X-Gm-Gg: ASbGncuXikyLRffWgnXJL2qhVsFtP+aZ+iCjQ9duKrnjCMN5DDY2fMwbTqRPeX1N7rC
 67XJP+pF9ux2lpfQ0C2LVkLtWuldYAs1qGiuX8ErDS9XIc9l3teSMu88hTkmNGiW5ZuivJJYJ5V
 8FG7zYoQKMZJBVEjozdtuOQD6ZQLXPCq09+/gFxggaa+sxyAqli1P6GHpds/tNHZDgJxv4Jx1/p
 Ubn/ViL5WPXiZ2Mx5Ax30uM3kIScNtnjSqwy26vH4OnoM1N2yguzFdhHGZzxmrA+fFlIvifcRDD
 jH+nTIV6vc2m+DmSKmp4R4J+oqlbJ1EZXTqUmwA0s8PsRtYKpKYHWeptcqQwJy4ChJPLlps=
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr16349139b3a.9.1756131538021; 
 Mon, 25 Aug 2025 07:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcONK9QkiksV2iPZcOMhRszPAf8sw61weQPpzMqGsQNFrglfJdpF3Bk+hpt3laf8w+p1QW4A==
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr16349105b3a.9.1756131537494; 
 Mon, 25 Aug 2025 07:18:57 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:12 +0800
Subject: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on sink side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=3420;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=5rW/DfearqD7fwWZSsWrOun0WURd1EIi5z5yGV9n+1M=;
 b=EY7yhkz4fOACWjsghjS0efOMUzJwNpOWAwybbpu4RG1f01cD4hxc0M9fMrEN+mSjA4a4SCHrw
 JVNssBx1X0eCD1oIrpidZaR33X6TqT23B7AphT/54EqCJIX9ahQgaep
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70d2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vCCEq3Mv4WXTdc8uXsoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6t0pzNR0TOIg
 WbXwEqiFGoQuv0D14LffXZm20DdaO0YmXjPwWIphiAb2EXtDs4TKTUuOzr55Ep8zvKFOO/Z7A+J
 pln2KZehh5QVLhyZJhX6Ib1jUOt6sGv/gSVfxCUou+BZ4nGMgNQ2n9vmiKTAV7dJsOJZemMK6MI
 uPMsrU34I9flGht6tih4H81qnBqKlSDoKni+UNYgFQ45GBc67v0VLxXq5+f4dUHjlNL46bQ+5ad
 xQLXTECZRVllAl6Q13e1tC39v0ekmsGOE2fmmxF3ys3PRf9kK5k0eLQzPivYEbE5FPPQOawNwEP
 ZVzaslGQLEXuCsDKctUYs6rkOMOJi4vNBnqN/gMQaMA73YY4NYMwFBG0iwIN15/m+OkeyHdVqmE
 DY9wndIO
X-Proofpoint-GUID: u07bi7sYP-qC1vOl_lknETqUDgUDrRM9
X-Proofpoint-ORIG-GUID: u07bi7sYP-qC1vOl_lknETqUDgUDrRM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

If the DP controller is capable of supporting multiple streams
then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
DPCD register to enable MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
+{
+	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
+	u8 old_mstm_ctrl;
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* clear sink mst state */
+	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
+	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
+
+	/* add extra delay if MST old state is on*/
+	if (old_mstm_ctrl) {
+		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
+			   clear_mstm_ctrl_timeout_us);
+		usleep_range(clear_mstm_ctrl_timeout_us,
+			     clear_mstm_ctrl_timeout_us + 1000);
+	}
+
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
+				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink mst enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
-	}
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 
-	if (rc)
-		goto end;
+		if (rc)
+			goto end;
+	}
 
 	msm_dp_link_process_request(dp->link);
 
@@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
+	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
+		msm_dp_display_mst_init(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 	if (!dp->msm_dp_display.internal_hpd)

-- 
2.34.1

