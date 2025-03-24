Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9CAA6D961
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 12:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3049E10E2ED;
	Mon, 24 Mar 2025 11:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncRMViwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428B110E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PN05002599
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xwh0kAnHT7FdNhb96gdjp7PUruv4t4YUK908RVrCz7k=; b=ncRMViwZL/UoK7/S
 RBzXndtCAlEKWyYhFt9oWLqO1oYuZz7jBHmK1+iAm9sj/44sCgyoisypKgCS6sVd
 Jlq9EBu0A7Ia38Pnzmy9gvvnVbxC0eKpwzXMuVtroIl8yS474ghslPyqUFDBnEqX
 b0Js8WYeXIFD1Pz07hpxCrPDBJwynXYhhLsui8/pI/hjahg66bpvfVXPj7Flkg75
 Yz4SXLmtlGjHQmetRKOuHQf3DiZuicP6s+wyDm3q/1Zpq53bzvEw94ARUq2SXEcm
 v0WbAgVGCtjT7BC01McpkfMZU7di8lR+l0WvgQWlaAXX0V0kP6M77UzcT6FupE6j
 Q5l0Hw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmhk491u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so12807856d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 04:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742817089; x=1743421889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwh0kAnHT7FdNhb96gdjp7PUruv4t4YUK908RVrCz7k=;
 b=PAgOf9yVV5hAmY3gyNdm7P3Woe2KzstKRZdGvpwtH8DmA0pngNW0BSa4pwkMJwkzqm
 YZ01GMCY2ifJAX1+9Gta6rOO4exlfBZWC2kiDuosA9jAYC7Ch42hQ5doazOwmgtzESuI
 7KpUbf3lN0OmnI+q0TGV8Yb3HXzlUnfDfX8mlsCzUKbeBsvc7wrSIt8r5zNGDTQzkKm8
 NPj4OMgJDkDhgqUK79DlzypiQvfS4kN2taD7mAbJfE4S+7FfnbkIZWY2kobjwbuPjRul
 AD4hrqzdr7ja2qf00xhCzgSBISFDBfzgFoT5QWUY5QN5qYWrYzXfmQ6F11g66Vn0zPfK
 AIRw==
X-Gm-Message-State: AOJu0YxzB/CGgwQMT9x6amJUGf/uPJ/4jRNGB5YsBq2fOzRxZatvFEpS
 cIEi3zrGHZ6quFj8u577ANo3fKmj/QxWo/QVW6oRFKCSev3lr8n5ANn00pA2mi7ptprao3r8GdB
 7cWJK2LJh+Keh/LiU3GcnTacMp48zNEHFxadqB2/bTb+KXm1T4Tm8gDwZcFvGTl8dMOM=
X-Gm-Gg: ASbGnctL+wFo9Ac7EM3aSPB2ifimjTqpJR0GE9fFbPGb1/wgykZUPcktavheyqMffih
 tBavKfXVFqqMhGyoqAl/LR1k96iI9yiivDbiqDw42iiX+V1QSarKB1NVZ8v/dQYbYmX4bKCImfq
 q3JUsGkXXdRiniGWlfUI2aCUWbT4S6MNS7UXyXh/I0iWyZsgw3ZD7R5usDeWMmezXOyp1dBBjLI
 lAgIIERxW04p8qq/MlzNTxaNhkBK9tIzoziusG+157T5SMYg/kLpYrABVTkci41Gmp27PHaCNMh
 5d677KejNHX4DjWvuWT/HhDVdfZ8tc0lEA5ukvSngOpqFnwMmVlTf2ioWV2YiX7COySCCGGfA5S
 jNReQqSb0JQwZZ4/OL9eQhtuoiqW7
X-Received: by 2002:ad4:5d43:0:b0:6e6:6aa5:2326 with SMTP id
 6a1803df08f44-6eb3f2b7a23mr129137366d6.24.1742817089034; 
 Mon, 24 Mar 2025 04:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiaTVnFQnWFx4k7GIhe8YWVpjtG0t7HyzdDH1QAPl4ZYLpj8Y/iG1R+ORhx4y4pfFoHsyoPA==
X-Received: by 2002:ad4:5d43:0:b0:6e6:6aa5:2326 with SMTP id
 6a1803df08f44-6eb3f2b7a23mr129137096d6.24.1742817088474; 
 Mon, 24 Mar 2025 04:51:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64fbb51sm1142907e87.135.2025.03.24.04.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 04:51:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 13:51:20 +0200
Subject: [PATCH RESEND RFC v4 2/6] drm/display: dp: change
 drm_dp_dpcd_read_link_status() return value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-drm-rework-dpcd-access-v4-2-e80ff89593df@oss.qualcomm.com>
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10619;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XBxhw4jfP8Ib9Agf9heZOk6AB5nizhAMmuxM/unOe1k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn4Uc3laM2u4yPJyP4KlSTt/SGp1+SBNSzXYX9d
 5N6ph/GkwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+FHNwAKCRCLPIo+Aiko
 1SdFCACIE51P1iU2vApLEvX3fOJWyyxuVObbwhxELLVQGrKP7wvF/pdua0jAZE3NSIItmTzoysh
 hAhuSx5IBvgEQKvvLK6HiB9NnFMjQKLI17Segd/Un9nwO5bpphSYRTY9ji7x2n+RBlYuFN+PSzH
 nDY82oGWlXGu9cv6rW8wSIJGsxqL4Kvrzf4OBnPq+VYqlxhMqbmzkmdEPfL2j83aF6oy+Gxn3Vz
 2Ay+rIz+hqleup6Q5zfvhQDObRn06EsApwnjt2B/8jnPO57ckoywt5Bb1AlHjOj2EhvZPMs3svV
 gJqkxpXyvfZZhDjPIt7xQAa8KlD50ya1NSl8ac4FFvY2c+e8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=67e14742 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=SwUNW72u-79MlN5x3aoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qBzw8sZp1qg8FtEarCi9cbC7FFB3g5NR
X-Proofpoint-ORIG-GUID: qBzw8sZp1qg8FtEarCi9cbC7FFB3g5NR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240086
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

drm_dp_dpcd_read_link_status() follows the "return error code or number
of bytes read" protocol, with the code returning less bytes than
requested in case of some errors. However most of the drivers
interpreted that as "return error code in case of any error". Switch
drm_dp_dpcd_read_link_status() to drm_dp_dpcd_read_data() and make it
follow that protocol too.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |  8 ++++----
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  2 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  7 +++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 24 +++++-----------------
 drivers/gpu/drm/msm/dp/dp_link.c                   | 18 ++++++++--------
 drivers/gpu/drm/radeon/atombios_dp.c               |  8 ++++----
 7 files changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index 521b9faab18059ed92ebb1dc9a9847e8426e7403..492813ab1b54197ba842075bc2909984c39bd5c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -458,8 +458,8 @@ bool amdgpu_atombios_dp_needs_link_train(struct amdgpu_connector *amdgpu_connect
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	struct amdgpu_connector_atom_dig *dig = amdgpu_connector->con_priv;
 
-	if (drm_dp_dpcd_read_link_status(&amdgpu_connector->ddc_bus->aux, link_status)
-	    <= 0)
+	if (drm_dp_dpcd_read_link_status(&amdgpu_connector->ddc_bus->aux,
+					 link_status) < 0)
 		return false;
 	if (drm_dp_channel_eq_ok(link_status, dig->dp_lane_count))
 		return false;
@@ -616,7 +616,7 @@ amdgpu_atombios_dp_link_train_cr(struct amdgpu_atombios_dp_link_train_info *dp_i
 		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}
@@ -681,7 +681,7 @@ amdgpu_atombios_dp_link_train_ce(struct amdgpu_atombios_dp_link_train_info *dp_i
 		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 81fad14c2cd598045d989c7d51f292bafb92c144..8d5420a5b691180c4d051a450d5d3d869a558d1a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2305,7 +2305,7 @@ static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp)
 		 * If everything looks fine, just return, as we don't handle
 		 * DP IRQs.
 		 */
-		if (ret > 0 &&
+		if (!ret &&
 		    drm_dp_channel_eq_ok(status, mhdp->link.num_lanes) &&
 		    drm_dp_clock_recovery_ok(status, mhdp->link.num_lanes))
 			goto out;
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e43a8f4a252dae22eeaae1f4ca94da064303033d..410be0be233ad94702af423262a7d98e21afbfeb 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -778,14 +778,13 @@ EXPORT_SYMBOL(drm_dp_dpcd_write);
  * @aux: DisplayPort AUX channel
  * @status: buffer to store the link status in (must be at least 6 bytes)
  *
- * Returns the number of bytes transferred on success or a negative error
- * code on failure.
+ * Returns a negative error code on failure or 0 on success.
  */
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE])
 {
-	return drm_dp_dpcd_read(aux, DP_LANE0_1_STATUS, status,
-				DP_LINK_STATUS_SIZE);
+	return drm_dp_dpcd_read_data(aux, DP_LANE0_1_STATUS, status,
+				     DP_LINK_STATUS_SIZE);
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index f6355c16cc0ab2e28408ab8a7246f4ca17710456..a3b78b0fd53ef854a54edf40fb333766da88f1c6 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -188,7 +188,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
 
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
-		if (ret != DP_LINK_STATUS_SIZE) {
+		if (ret) {
 			drm_err(dp->dev, "Get lane status failed\n");
 			return ret;
 		}
@@ -236,7 +236,7 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
 
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
-		if (ret != DP_LINK_STATUS_SIZE) {
+		if (ret) {
 			drm_err(dp->dev, "get lane status failed\n");
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d8633a596f8da88cc55f60de80bec8999ffb07c8..69a26bb5fabd1c3077573ad5a1183ee69cf3b8cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1100,20 +1100,6 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	return ret == 1;
 }
 
-static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
-				    u8 *link_status)
-{
-	int ret = 0, len;
-
-	len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
-	if (len != DP_LINK_STATUS_SIZE) {
-		DRM_ERROR("DP link status read failed, err: %d\n", len);
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
@@ -1140,7 +1126,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	for (tries = 0; tries < maximum_retries; tries++) {
 		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
+		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 		if (ret)
 			return ret;
 
@@ -1252,7 +1238,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	for (tries = 0; tries <= maximum_retries; tries++) {
 		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
+		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 		if (ret)
 			return ret;
 
@@ -1805,7 +1791,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int num_lanes = ctrl->link->link_params.num_lanes;
 
-	msm_dp_ctrl_read_link_status(ctrl, link_status);
+	drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
@@ -1863,7 +1849,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			msm_dp_ctrl_read_link_status(ctrl, link_status);
+			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 
 			rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
@@ -1888,7 +1874,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			msm_dp_ctrl_read_link_status(ctrl, link_status);
+			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 
 			if (!drm_dp_clock_recovery_ok(link_status,
 					ctrl->link->link_params.num_lanes))
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1a1fbb2d7d4f2afcaace85d97b744d03017d37ce..92a9077959b3ec10c2a529db1a0e9fb3562aa5d3 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -714,21 +714,21 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 
 static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 {
-	int len;
+	int ret;
 
 	link->prev_sink_count = link->msm_dp_link.sink_count;
-	len = drm_dp_read_sink_count(link->aux);
-	if (len < 0) {
+	ret = drm_dp_read_sink_count(link->aux);
+	if (ret < 0) {
 		DRM_ERROR("DP parse sink count failed\n");
-		return len;
+		return ret;
 	}
-	link->msm_dp_link.sink_count = len;
+	link->msm_dp_link.sink_count = ret;
 
-	len = drm_dp_dpcd_read_link_status(link->aux,
-		link->link_status);
-	if (len < DP_LINK_STATUS_SIZE) {
+	ret = drm_dp_dpcd_read_link_status(link->aux,
+					   link->link_status);
+	if (ret < 0) {
 		DRM_ERROR("DP link status read failed\n");
-		return len;
+		return ret;
 	}
 
 	return msm_dp_link_parse_request(link);
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index fa78824931cc428b1f9e23fe8f98867136ef9883..3f3c360dce4bcf2c87a6c7adbbf7a727a4f8eb4c 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -501,8 +501,8 @@ bool radeon_dp_needs_link_train(struct radeon_connector *radeon_connector)
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	struct radeon_connector_atom_dig *dig = radeon_connector->con_priv;
 
-	if (drm_dp_dpcd_read_link_status(&radeon_connector->ddc_bus->aux, link_status)
-	    <= 0)
+	if (drm_dp_dpcd_read_link_status(&radeon_connector->ddc_bus->aux,
+					 link_status) < 0)
 		return false;
 	if (drm_dp_channel_eq_ok(link_status, dig->dp_lane_count))
 		return false;
@@ -678,7 +678,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
 		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}
@@ -741,7 +741,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
 		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}

-- 
2.39.5

