Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7EA4ADDC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 21:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD5410E05F;
	Sat,  1 Mar 2025 20:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rrUqchJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE1B10E273
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 20:39:53 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30795988ebeso35340331fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 12:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740861592; x=1741466392; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2IasPYFyck61jInm/OvtsZeqbKrjdFXhpVOZmbiEdng=;
 b=rrUqchJI6bJDMns3wkB3We+SiH+STnEKXdBAfT10+whx2BC5uTfUhJfVuwNJGpC5lC
 YixhyJNCQLDZYOSGljKl+vsZgOg/OhxylbrV2DjEs5u1Tu7I1MxyzyN7etKFFVHWSSVw
 vRjKzzeEMbyJSckEJW59dpSykMm1jCvDKpv15xJAQ6699UzMYPTtCvbFHOh8DQ97adIF
 3xkAahwvpHNZ38yb6F3UFfmrxalj47lNhxEi96sRboJxawNl5rFgAOn5OTR88BHUIpn/
 RoJQwZK4tz0sqloeVFGzAT+nWdkj4PSyKcXfb0kQoyK9L1iPHcxQhkJIpojNI3bFImrx
 Vqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740861592; x=1741466392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2IasPYFyck61jInm/OvtsZeqbKrjdFXhpVOZmbiEdng=;
 b=apSS9stSDJj9fHI5j4AxMbDqtR7PHX0ft9WhP/esV2Jv3KWookTmDkaJomEjYhPX8h
 k4RmiXF3OHk7dmQhzI5shDe7xcnUNke+EOv3o4AyOseGttp+7hO9Zl7+hwfDmcXHs+lp
 L1xRT1U+bv4wr1fmvNHFFwqia5IoeU7m34JOGHs7Tq/ifqufbSOvNEaJdXQDJnDn2/aT
 wJChFmVVyDln4N/noNRbJp9ET0/Ygk8gpfRUBSJhqawlsedWq8mK8VoGZHTyErupZ5mK
 3aS9wcXsc+GIBYB9kqyrCpkle0jlhMJ38V1pGTVSgnAXcOT0Sewe/CVwIIUgP9VYOfhl
 Pamw==
X-Gm-Message-State: AOJu0Yx9NHltN46SbLadncLUNMrqKBTFm4G7bzhRYLLV4H1g+LmNdtCf
 8JFr8RgDzuGkP2P8c2IDq/6N/vkzeExmkoyZVVTf4/xzBJKpoKfxhUociYmCKYg=
X-Gm-Gg: ASbGncuU2s0Sipmkh33w3uoMqu0iwPTk4tCRng+qWEQRLHQ27okPKdtg+mIO26bmg+D
 6qr6Bt8dZazpza3BJVCHx8ytdlRGqoxxK8tjODXdO/+taiuvhGWfWfvn5Mh1oSFCmRiHJ1+Uhcb
 Y76lvEn+PUCGjP+hD97YiQC7skziG1WTzk0azbsth/kVptBoJvLWKq7A7tKUZhkGlG7gNA7LEn2
 2gB1JjM7dNftofr3kgpWwvTLXT5W7Red/H24fGMEXAGRpKcAfjdaaGgYVKt5WFOHWg8mg5jGayB
 d5H/zsmy9260o76hnq7oC+AvmOcx4Qvq3RwHyQzpBYi/ynWcftVY
X-Google-Smtp-Source: AGHT+IFJVQbgrBHCjIss8jOcCxZN6e9kkaMqGbtzLVpIQCvuH3XlrYL4Rhaxz77IkpvF0MNjluJNRA==
X-Received: by 2002:a2e:be03:0:b0:307:c829:f170 with SMTP id
 38308e7fff4ca-30b932123edmr32476561fa.4.1740861591852; 
 Sat, 01 Mar 2025 12:39:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 12:39:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:37 +0200
Subject: [PATCH RFC v2 2/7] drm/display: dp: change
 drm_dp_dpcd_read_link_status() return value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-2-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10528;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fqEuYKPyG9MQ813p/7tvsxYx0yGs7Qs1X2H3qVKnjMA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnw3CP7K2oBe/LOnAu7J2ncpdH11Dzua/ASKBuP
 1kKufZnl3WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8NwjwAKCRCLPIo+Aiko
 1fFFCACMOy6rLXbe4ghACJOx8Pe1yihQ14RjPE8DfZZN8iISKGjgnOOn7VF7fgbB/x/evwentc/
 n8b4YlBCWJ2Xs2Ya3Co/7FfL8drmmurUtCXsZOtrIBLAscbyBZT8xhlK4i353Ltn5sAl0b4/HHP
 78exoc44qNcd9UcxEwkTfc2cv0vLdMfCxnC4Yw+UKWTb87qUjH4fWOwCHqmhM5s4sanFnrA3U2F
 YrxtygRs8V+Uh6vxHUsO0ErUlbJ3FlkT+mPkYerRSeGfVnZ5bczSpdVcTXjnbEetDTLgl7IrcCc
 tZYuQC1wqtrT58OMQ8EFOyH36hUhv4BMPCSG/lwQHm5aofkx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

drm_dp_dpcd_read_link_status() follows the "return error code or number
of bytes read" protocol, with the code returning less bytes than
requested in case of some errors. However most of the drivers
interpreted that as "return error code in case of any error". Switch
drm_dp_dpcd_read_link_status() to drm_dp_dpcd_read_data() and make it
follow that protocol too.

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

