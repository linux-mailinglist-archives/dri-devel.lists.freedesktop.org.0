Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE7CFF588
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35010E643;
	Wed,  7 Jan 2026 18:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjdPzI+v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEO9YEIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A797D10E5F4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607H3w5A3050003
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pPEqdfktaAHE/Jjjjm6RwHrVcZ7AZ3stnlHc40P42b8=; b=XjdPzI+vprat0Amv
 gwL3eg4VCPgxWlfP8SP+gmGcQl0yvekPl5SWJ98dXB9sRWjAFvjVdTlLxe8EsDSa
 bCbSdg7e/6q1v+hHAmq4FOhGOMqEm8eC0vubYxM8GJOK1yBCU/+errTsYHLWBhIk
 SFPQ4E2fTMzd2tn97gEbpm63rCCzXLmxJ8fjRb4dljA39rjJzOk3p/bPKBc/vyq8
 qMbVmKT2l6RFKdu7HoY5DkvrKKkyxuMxaoYPucTRUJI5xhq1v5KKECgSmo+ZDHto
 nL4i/tijX5o6Fw3wwCPH4i+Bgdnp1Qo1AS/xhUU6LQ28J/eDkz8qaF+rDPVZz9CJ
 KR6m0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhujeg8he-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bb6a7fea4dso572300085a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809707; x=1768414507;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pPEqdfktaAHE/Jjjjm6RwHrVcZ7AZ3stnlHc40P42b8=;
 b=QEO9YEIr1qbQFWOQ3jrgLR7nQ0gCm6zn4T4DVnzjTbV5qCTSf/SFjZ3EW/GD7tqr2W
 VTUjzkTqiaDTuqEazAwbXWCDY8fwNyVacJoQ30y6jhiIS81Y6Neh6iX6pGg+Xd/8ixMf
 7aZoySu3nKKYHc69aboFIVdx4B2BKD6epNQ+17+P+6Ax54qqqNaiwG58BDhiSoYuzv0I
 ImWSD/T35TVL47xHuobxPg9Pnq47+3bwx+2JD7+Kf2gzIoySjDsSqpuX9eJ24VYZu+9k
 D8kABWq1a8cMvNwHJIF2FBpwxU0ZsTwzEABI76DKdgcoyOaYmKNibLSWa99sQc7TygnT
 rg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809707; x=1768414507;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pPEqdfktaAHE/Jjjjm6RwHrVcZ7AZ3stnlHc40P42b8=;
 b=QqmS9O89BxVME5q5cRCgN7vuyzTNRJa/AJjIxmlHGcWkYnotmQsgWFZTTKUVjhMztw
 14dA9gkHFTYiuC7lPuKOTO5AyYaBJaEBYeipf4DPJKU8WQXP1Ct+T1MMvu02lB6ZnyU2
 AvcUvqKo5qSbFbcbFtMoyf2oTDMnEmwzBYwEsIVoslA0aHXCV6OqlbKW1ZjeAUgDFa0U
 TPNLbdEhwFOHlNolLsYIyZaZMfVxVe2hh2kBuqeZbsMtifrGXBz0ipgtoW8vgXU6wOUA
 XtMXzkut3Xk1TBc1+Cie2S5Yk3Vgu03CqdKCSbYejHQ7nEQJxgtv9hQSWawrZ5NdxgXp
 Rjzg==
X-Gm-Message-State: AOJu0Yxq+sDMnTL7DZ58GeCjjtww6z6SoDJ0h3MZ72gAwTu5Iiyk5mWN
 YUceR/TEJFHD52C/AhJi52wxVFsDKEgh6Guwh32pFNXQvSCmHBoHtfRpZG9QG7cdTWqWnQEJmXL
 R+BfDZgDdUS3FPgaBRaZayB3S0XPq1endfygWRB/hmowbJ5NentHfDs0ey86s8ACGXcYLvi8=
X-Gm-Gg: AY/fxX4dY/kpBjNlAkRS8rT4vKr5+oTHX7aWFhvl2Iwb/bkThh47n4MS6SCP7F8y7oi
 0hypiux6YTFKOhfKTg2rY0TVlcVtIIuh6CIJRXfi6EUh9d0YDsbsMdzgI3YmAzbYK9EXx+DFcR0
 c0aE95mfRR3P1hYecPP8vCwpehUvOnK09Vh9RwEWPWaluxKRHZ62gbjZrGQmXOLsMRsID5kdNNX
 J9ryxPuanfg/VKJ6m/q3ByaOYSy7EczEWF+IveISnwHcBgj+6JD2Pk11r5XQ1ahvlsYFJrSm3Ul
 sUU2WcTHVsrIU0S2mgkB5T52HW3XGZq+XLCQAAFM7p/VFLTlSUgAJJn6LEM8BFFVdIPl7o5Pfk6
 wsS6xYTVHP9sZh5ie0TWApJ2tFf5qQ6++4FvKKZPmXCUzfYGOeDfrmAIP6BLVNlQcrvbDy/uGeq
 botwoGDa1cfdJoqBDz2ttdB6g=
X-Received: by 2002:a05:620a:711c:b0:8c0:cca6:8522 with SMTP id
 af79cd13be357-8c38939ce29mr472852585a.37.1767809706550; 
 Wed, 07 Jan 2026 10:15:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0AzgUocYSZpm2KC5Ln3K9tzKrPT4erDK/yC4UWYZHbUCAGZhC15uqj5QHGP7DsMDQRvR3PA==
X-Received: by 2002:a05:620a:711c:b0:8c0:cca6:8522 with SMTP id
 af79cd13be357-8c38939ce29mr472830885a.37.1767809704473; 
 Wed, 07 Jan 2026 10:15:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:14:58 +0200
Subject: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=26900;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XZUiI+P1J2mQYMmzuj2kKLbF6PlyfBdfsh+uTUhKM3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKk/8Nl7ok1dk6fEgJIBY2eHmOcgrrVbCdGg
 4G/w01IwRGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1WqSB/0VrgfS9rAIG9Uf20YH0OIYY4ndo3LeHhBOi8y+NVnkkrgy2GYB7/rQtaNP7nFjGfA4cmL
 vbob0bl/yFwoZQmX5PkeiPuoQSoaXRP7AtTHFBeRCi8Rj9oXqeEBUvIHu+aQBv/49k7WQadCRsL
 mUZovgX/I4GjOMOxM5h0ygkXgQO3MvIU+0mML823mquPoOjHaRJ3jIOUUziNm5KhauTTSv8bEZm
 nSoWmvCvTd8ktElS/MnI/p7rdGaiBmxxWtJifxx6QQ4NVYcjP/iEq3BtdhrWCen/IWD7BodYU3K
 Hmu1TnqjIt4tgMI702qK4C1kVfoT8MkuGsTjtWOwHZpujBeq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WKNyn3sR c=1 sm=1 tr=0 ts=695ea2ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=8CpnO3W62F676OTI3Z8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Rf6SWWhTm7cvDgBaBc97XovkZJvRTGyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXyfJ5Ztol0fR+
 266M9Rk+R8f+ZpvpSEMvKoOR+HOrRfKbasEfI9VVd5a1Gj1BaBeo4NSLHNdlib1JAzr7wRVia6p
 Pq0J4PKsNpnnWaRiScs6f81DQvCl9Ivht//12PoJuy66fvC4Znk9jToOxLnAdUFKT9GkHt6uYDq
 dK/EBtm2thMk+tNZ2Min008O7UgGoEVun3vgi4ohMRJGGSpLJr0m8/cRhYRsg+mBR1gq8k68wqP
 jTQEwSeUKMm8g4VSpMaXz+WrW86ihbTExU7v/imvIa0O1l3A8BPwC7aRKamWxJ/R2zsqGIoULae
 SJMJKym+KVWTjCq/FntACOS0Zu64gUYphCwKEl3Jl3vgRqGYTyznSo2vZRisskU0gYR7e5nFLqJ
 MCF/mSO6rtMLKYKxzT7tHurt1iQ69EZ4IYmPz5WCBT5foSLQ99KxJQxOx99/xjg8AfHhEDBYMBh
 PRaET/rGv0nWZDfDqoQ==
X-Proofpoint-ORIG-GUID: Rf6SWWhTm7cvDgBaBc97XovkZJvRTGyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

Verify the InfoFrames behaviour. Check that reporting InfoFrame as
unsupported doesn't result in a commit error. Also check that HDR and
Audio InfoFrames are not triggered if corresponding features are not
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 627 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 ++++
 3 files changed, 749 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 3f44fe5e92e4..ec58fe064d86 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -5,6 +5,7 @@
 
 #include <kunit/test.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_drv.h>
@@ -48,6 +49,8 @@ static const struct drm_connector_helper_funcs drm_client_modeset_connector_help
 };
 
 static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state
 };
 
 static int drm_client_modeset_test_init(struct kunit *test)
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bd412735000..80f819a9ff5b 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -35,11 +35,16 @@ struct drm_atomic_helper_connector_hdmi_priv {
 
 	const void *current_edid;
 	size_t current_edid_len;
+
+	int hdmi_update_failures;
 };
 
 #define connector_to_priv(c) \
 	container_of_const(c, struct drm_atomic_helper_connector_hdmi_priv, connector)
 
+#define encoder_to_priv(e) \
+	container_of_const(e, struct drm_atomic_helper_connector_hdmi_priv, encoder)
+
 static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
 {
 	struct drm_device *drm = connector->dev;
@@ -138,6 +143,22 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 	.reset			= dummy_hdmi_connector_reset,
 };
 
+static void test_encoder_atomic_enable(struct drm_encoder *encoder,
+			      struct drm_atomic_state *state)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		encoder_to_priv(encoder);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_update_infoframes(&priv->connector, state);
+	if (ret)
+		priv->hdmi_update_failures++;
+}
+
+static const struct drm_encoder_helper_funcs test_encoder_helper_funcs = {
+	.atomic_enable = test_encoder_atomic_enable,
+};
+
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 __connector_hdmi_init(struct kunit *test,
@@ -2323,10 +2344,616 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite
 	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
 };
 
+/*
+ * Test that the default behaviour works without errors. We expect that
+ * infoframe-related hooks are called and there are no errors raised.
+ */
+static void drm_test_check_infoframes(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_crtc_state:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = priv->hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, old_hdmi_update_failures, priv->hdmi_update_failures);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type,
+						const u8 *buffer, size_t len)
+{
+	if (type == HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.write_infoframe = reject_avi_infoframe_write_infoframe,
+};
+
+/*
+ * Test that the rejection of AVI InfoFrame results in the failure of
+ * drm_atomic_helper_connector_hdmi_update_infoframes().
+ */
+static void drm_test_check_reject_avi_infoframe(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&reject_avi_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_crtc_state:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = priv->hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_NE(test, old_hdmi_update_failures, priv->hdmi_update_failures);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type,
+						const u8 *buffer, size_t len)
+{
+	if (type == HDMI_INFOFRAME_TYPE_DRM)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.write_infoframe = reject_hdr_infoframe_write_infoframe,
+};
+
+/*
+ * Test that the HDR InfoFrame isn't programmed in
+ * drm_atomic_helper_connector_hdmi_update_infoframes() if the max_bpc is 8.
+ */
+static void drm_test_check_reject_hdr_infoframe_bpc_8(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&reject_hdr_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_conn_state:
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	if (PTR_ERR(new_conn_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	/* Verify that there is no HDR property, so "userspace" can't set it. */
+	for (int i = 0; i < conn->base.properties->count; i++)
+		KUNIT_ASSERT_PTR_NE(test,
+				    drm->mode_config.hdr_output_metadata_property,
+				    conn->base.properties->properties[i]);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = priv->hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, old_hdmi_update_failures, priv->hdmi_update_failures);
+
+	new_conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
+
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 8);
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, false);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that the rejection of HDR InfoFrame results in the failure of
+ * drm_atomic_helper_connector_hdmi_update_infoframes() in the high bpc is
+ * supported.
+ */
+static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	struct hdr_output_metadata hdr_data;
+	struct drm_property_blob *hdr_blob;
+	bool replaced;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				&reject_hdr_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_conn_state:
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	if (PTR_ERR(new_conn_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	hdr_data.metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	hdr_data.hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
+	hdr_data.hdmi_metadata_type1.metadata_type = HDMI_STATIC_METADATA_TYPE1;
+
+	hdr_blob = drm_property_create_blob(drm, sizeof(hdr_data), &hdr_data);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hdr_blob);
+
+	ret = drm_property_replace_blob_from_id(drm,
+						&new_conn_state->hdr_output_metadata,
+						hdr_blob->base.id,
+						sizeof(struct hdr_output_metadata), -1,
+						&replaced);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_EQ(test, replaced, true);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = priv->hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_LE(test, old_hdmi_update_failures, priv->hdmi_update_failures);
+
+	new_conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
+
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 10);
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, true);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static int reject_audio_infoframe_write_infoframe(struct drm_connector *connector,
+						  enum hdmi_infoframe_type type,
+						  const u8 *buffer, size_t len)
+{
+	if (type == HDMI_INFOFRAME_TYPE_AUDIO)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.write_infoframe = reject_audio_infoframe_write_infoframe,
+};
+
+/*
+ * Test that Audio InfoFrame is only programmed if we call a corresponding API,
+ * thus the drivers can safely assume that they won't get Audio InfoFrames if
+ * they don't call it.
+ */
+static void drm_test_check_reject_audio_infoframe(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	struct hdmi_audio_infoframe cea;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&reject_audio_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_crtc_state:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = priv->hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, old_hdmi_update_failures, priv->hdmi_update_failures);
+
+	/*
+	 * So, it works without Audio InfoFrame, let's fail with it in place,
+	 * checking that writing the infofraem actually gets triggered.
+	 */
+
+	hdmi_audio_infoframe_init(&cea);
+	cea.channels = 2;
+	cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(conn, &cea);
+	KUNIT_ASSERT_EQ(test, ret, -EOPNOTSUPP);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_crtc_state_2:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state_2;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = priv->hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state_2;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_crtc_state_2;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_LE(test, old_hdmi_update_failures, priv->hdmi_update_failures);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_infoframes_tests[] = {
+	KUNIT_CASE(drm_test_check_infoframes),
+	KUNIT_CASE(drm_test_check_reject_avi_infoframe),
+	KUNIT_CASE(drm_test_check_reject_hdr_infoframe_bpc_8),
+	KUNIT_CASE(drm_test_check_reject_hdr_infoframe_bpc_10),
+	KUNIT_CASE(drm_test_check_reject_audio_infoframe),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_infoframes_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_infoframes",
+	.test_cases	= drm_atomic_helper_connector_hdmi_infoframes_tests,
+};
+
 kunit_test_suites(
 	&drm_atomic_helper_connector_hdmi_check_test_suite,
 	&drm_atomic_helper_connector_hdmi_reset_test_suite,
 	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
+	&drm_atomic_helper_connector_hdmi_infoframes_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
index c59c8528a3f7..f4923157f5bf 100644
--- a/drivers/gpu/drm/tests/drm_kunit_edid.h
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -293,6 +293,125 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
 	0x00, 0x00, 0x00, 0xfc
 };
 
+/*
+ * edid-decode (hex):
+ *
+ * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
+ * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
+ * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
+ * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
+ * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
+ * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
+ * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
+ *
+ * 02 03 1c 81 e3 05 c0 20 41 10 e2 00 4a 67 03 0c
+ * 00 12 34 00 28 e6 06 05 01 52 52 51 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4e
+ *
+ * ----------------
+ *
+ * Block 0, Base EDID:
+ *   EDID Structure Version & Revision: 1.3
+ *   Vendor & Product Identification:
+ *     Manufacturer: LNX
+ *     Model: 42
+ *     Made in: 2023
+ *   Basic Display Parameters & Features:
+ *     Digital display
+ *     DFP 1.x compatible TMDS
+ *     Maximum image size: 160 cm x 90 cm
+ *     Gamma: 2.20
+ *     Monochrome or grayscale display
+ *     First detailed timing is the preferred timing
+ *   Color Characteristics:
+ *     Red  : 0.0000, 0.0000
+ *     Green: 0.0000, 0.0000
+ *     Blue : 0.0000, 0.0000
+ *     White: 0.0000, 0.0000
+ *   Established Timings I & II:
+ *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *   Standard Timings: none
+ *   Detailed Timing Descriptors:
+ *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
+ *                  Hfront   88 Hsync  44 Hback  148 Hpol P
+ *                  Vfront    4 Vsync   5 Vback   36 Vpol P
+ *     Display Product Name: 'Test EDID'
+ *     Display Range Limits:
+ *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
+ *     Dummy Descriptor:
+ *   Extension blocks: 1
+ * Checksum: 0x92
+ *
+ * ----------------
+ *
+ * Block 1, CTA-861 Extension Block:
+ *   Revision: 3
+ *   Underscans IT Video Formats by default
+ *   Native detailed modes: 1
+ *   Colorimetry Data Block:
+ *     BT2020YCC
+ *     BT2020RGB
+ *     sRGB
+ *   Video Data Block:
+ *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
+ *   Video Capability Data Block:
+ *     YCbCr quantization: No Data
+ *     RGB quantization: Selectable (via AVI Q)
+ *     PT scan behavior: No Data
+ *     IT scan behavior: Always Underscanned
+ *     CE scan behavior: Always Underscanned
+ *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *     Source physical address: 1.2.3.4
+ *     Maximum TMDS clock: 200 MHz
+ *   HDR Static Metadata Data Block:
+ *     Electro optical transfer functions:
+ *       Traditional gamma - SDR luminance range
+ *       SMPTE ST2084
+ *     Supported static metadata descriptors:
+ *       Static metadata type 1
+ *     Desired content max luminance: 82 (295.365 cd/m^2)
+ *     Desired content max frame-average luminance: 82 (295.365 cd/m^2)
+ *     Desired content min luminance: 81 (0.298 cd/m^2)
+ * Checksum: 0x4e  Unused space in Extension Block: 99 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.31.0-5387
+ * edid-decode SHA: 5508bc4301ac 2025-08-25 08:14:22
+ *
+ * EDID conformity: PASS
+ */
+static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] = {
+	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
+	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
+	0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
+	0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
+	0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
+	0x46, 0x1e, 0x46, 0x0f, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x92, 0x02, 0x03, 0x1c, 0x81,
+	0xe3, 0x05, 0xc0, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x67, 0x03, 0x0c,
+	0x00, 0x12, 0x34, 0x78, 0x28, 0xe6, 0x06, 0x05, 0x01, 0x52, 0x52, 0x51,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0xd6,
+};
+
 /*
  * edid-decode (hex):
  *

-- 
2.47.3

