Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5738ACFF58E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1505910E61A;
	Wed,  7 Jan 2026 18:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Md2Ezqvu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PctUpuxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CE610E649
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607BMYF53152892
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=; b=Md2EzqvuQa88+NJo
 eO9CT6W6zNA2/mmL8bAXb6GdF2TgbDZwRiPcGhExvC1k/rcBmLe+40l0vu3MF44S
 QoUy/eggghWay8HBTYciFmcK5g2Aaf1FDZD9rolR0ZkMC1fbK/4XwkN295/ny6OD
 7Hj8ZpUvDJbaSgxgOTfCtEZ/BOyzVnuN1jYl2TiJ7O858oy/50DcJLZtCL/98fOS
 wCygVIIJJAKqG1PSF668wIDMDoHtjoc5LvKMAp7ude/wxjONNzUeXjIqQCv44rac
 XA1DZJ9KsfhFk550JzlbWRLh4b1Kazpk8gIsV1iwDBjhCZWAHHgTWxHTv9A6e2dC
 QiQ2Fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjasa8p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b51db8ebd9so776587785a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809710; x=1768414510;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
 b=PctUpuxYpUnJrcfz9Qp66+UFxlpaP1mPZimkHpbhVQ4CmW8b4OE+ADWS1OlPUs+xHC
 mxpkhMH9IQIHx9h3G9UXMEnKbUJxqI4KUH1/yoEIHrU2rsb+oViiDy55/ZmN1zbvvO/g
 FTzwUsioto4JYKHJFadUt9rnNXEQQ1zfq0hVJWY7KdlLjci6//VwNAHyO9AbUGp/bXox
 Zno8YEUKU8Fnpvsf3ABUbBZ474DUYhax0iLZ0DvLpLAkJfnwdirjIN16Vu0qKQR3qNao
 AFsFLoxDhpcEF05uv/9P9bAbsHLmcX0acpe7JYVwv4ygRuRqFAlv+U548pR8viboeNsT
 bUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809710; x=1768414510;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
 b=TIUheYTvB6uVePt7Qh+72bIc8IVMoLclFBfnur4EptdatWUUkYr0vf0vNjP2Dih6l3
 bSF98QVzQb8DDfTX/CkG5Szrnvm5+gupl1RDkRKbs/ON/xlWgPeuXs/jc0ebFWEJk2ia
 xAq6yYG+DNVm8LqzAsM8IjwqmIoN9qmCVtaAwJ4z/hQLX6FOlnCtJIlBGEhsVjPfuLSj
 2FIRy3u/rVk1KXx1jDstWogplHx9IuoP/LKCmPGv7p4NtgqNrBY4K0sMjfbJeDqT3LfF
 hABr6ZFkqZd34lYj09X5Bqm8O2fb7Gk563wXYOZBZXOLOVkgS5T8r0kerhSkBjadgGDG
 +W5A==
X-Gm-Message-State: AOJu0YwavatO3HjFgUmLJjme7mC0JAo1pLpp1TxIQKCipz4THa6l56JT
 phaHJ15ybPSImVVy/XqKhXwRph7ivyg1KcNsvJMxFSGoMvT4T9JdN85Cf1W8kKByABFPnwrraDi
 0bJkgnlEsje4nbNwofv6ca6v8BJkuQl9AXvxwTcUPHxHZVdjJ7L6I1Nzn9A2fUXbmjR5YyLA=
X-Gm-Gg: AY/fxX61sDDcAUPQkizjs5Y320ww0m+jiPcJ7rM5dS3T8RNqRMC6cd6XRwQGvQXhqar
 lKAGsVIP7WEuleYakz4HVjfSJuSaJD7k4fRTrUXGHRmop3sXP/dAEDmcd+LZcsGov2iZ3IIucsK
 /fAfdTq3CCHBrn0I1Bgya80m722eG2SxzbZvXD2MmVP23ZHbbZ3TotksidkztgBVos9FvCpwb4p
 TV2cvINyBICTjvzwvH4ji6LQTxMhMSfahqfy9mcFJKZSdG/GBvKbpXjnhRMg8LLIq4oByb1ulc+
 pPnESxh6iUi+Aa9xp+ZHtWABePuJA/k3N5AMNxH6c5wsJOoQ7o0/B8GfViDA7+PR2GINblYc3mJ
 ftXM+AU+mjetiWgPdarFUWSi2p9SD7k91vSYPXmJaaMguUyQdnKbkh1Hp861HQJbGCf3vsqRH80
 eotW215rjviFZ/+VxmSzTayP8=
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id
 af79cd13be357-8c38939548dmr415673385a.23.1767809709966; 
 Wed, 07 Jan 2026 10:15:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNnSAiO2TN35uowVz5nUxPTarPKtrJKczFdjq8YtoRDL79CU00FYbWgXjKjI0hV5LSFGnXqg==
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id
 af79cd13be357-8c38939548dmr415665885a.23.1767809709293; 
 Wed, 07 Jan 2026 10:15:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:01 +0200
Subject: [PATCH v4 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-4-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LT/feZw0CtZODegcFJ+4Vz9a++4eaSKUzh1MRBMJ8BM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkh8Uw4zR96uxdfP3B5zJVi4OZsf/KLRV9b
 W7ObW3B+sCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1b8ZCACVHXOVdotvxgogUT3C9rJjVAwz5C7cHtd38CQCrPUocd+kYKlETxwvuPGlVJvCHUeAM8X
 5/dbL3WQ4QoPcR1iBb8oDv1v6oB7mJeoOsV/aJpocz5lRWP8NYncKNG1ePRkGEpeU3WHjpZqIFS
 kYhO2EzWmB1sJ9inh/CWFfZvf4ElzxfTYGmj/kCkM/z5sVjYqKRiqW7x7HsR8MtVNsWKFqCfk3V
 dVqKuC0OSU4IUdW2h3I1weh+JiTliULMhONr5eVnvaNom/JZ5QKI3oJK+lJB7grw4QWcRHvOVP2
 EkMSiWdtnpNVOEWxdQ2Q6yJ+NQAxzjfP/bYkeyAmuPwG08rp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695ea2af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Y50rop8OnUQsFv1qFxIpbi_KVon44CxM
X-Proofpoint-GUID: Y50rop8OnUQsFv1qFxIpbi_KVon44CxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX67bXON7pUMCt
 KpGtgVyRY7atyHkJIGZH+QkLMUgBzeALmhAxZCYm4JpBVvUSyxK5r8ISpKMfcas9helICvFpsE4
 oZhx21r9H0CWJolPYmDian3Ex0mEqeM+LefRdt8CNznv23e6gZDO/YnR0rhRai1VY6AempTWQ1R
 IzzHVu2zmzj5V6qiMoCMuw7MiQEMkqzxfohK40db7TkZfommxN7LACoP+/7oredqNbYFNph7WF0
 8T5cB5H5lxKvRg4k57EtTW5mB/r7iBrI3zznO7/YBFC5txHTJRIu9JKD9Om46cBjxqlbbmNWdrA
 D9ezqhMEusBQDEGa+sZFV9b+RX11UTjginAUw743fk6/eZLmPkBuWOH/Ep0RRNleIcdYXCkGfAl
 G5jkPX2IAR4mrtdnYKHVvxomU2PmcwJARDdNxlEzjxdqRI6aF4X1zUQoSZnKyqor/jBU5tb23rh
 ZKbQame2ui4JtmGntbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
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

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 80f819a9ff5b..cfa14a6eb97f 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -78,7 +78,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -91,6 +106,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -103,6 +120,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2441,6 +2460,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2543,6 +2563,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2790,6 +2811,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3

