Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E3C8905B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A3C10E583;
	Wed, 26 Nov 2025 09:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MV1DKF7h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAqpLQqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BFB10E572
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQ2SQEt3706624
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M3j5o7XEKSZlIeCiZ5DKpqNZdvGJne19TQ44ufGC62k=; b=MV1DKF7hFo4+L6GQ
 KUUVV62nNGzVwnruQVTNGTm7PTOKgefibVcDz1irNUjYhPQhvIuLR6097F3p1TXL
 VYJx4CDYpPnX0JxO3lCJJma7Sv6TCOk9xjQAeSjfmdxuN+GhulZ53iqdQmP39h3G
 qDZAOVpBdZvRfwLFvoLfB6j9G+7k9AM8YP45L8ZcvUTB6CYWvoHjK+R8G00rVB9e
 7bqrbIQ16NY7jaUBEISuTFoBvsGQu4+u90yFpHQiOxbeCSlBAg9qb/RH5sXzye1c
 NtaMaNC08kl83m2i6Lop0nDaTtnWwk+Mcg87bYE71WJgCtOrFLUwsW4f8LVMUTam
 rLi45w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduftxda-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e19c8558so1461250885a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 01:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764150123; x=1764754923;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M3j5o7XEKSZlIeCiZ5DKpqNZdvGJne19TQ44ufGC62k=;
 b=eAqpLQqnI654D28l1Tp+t1zKLOz55ED1qGQCgRKQcvrv0VZlbkKfrNz+Tymwdf0Jfu
 qq3jsoVoazAdZ+XkgWIkontOvXqQZSxvWaoGc+Vx0R5oiKaiMN7oXTf3CHKmh+tsuFcr
 pH3fDKX6ZQLXf3AHF6S/1KjXSDPbPb3X4GE4IremrwdvGvmnW6lT+Qc30mxLeZ9K+3Bi
 2Fj2oKvvQMM6y+Laxz8N6nlbPCuIY8EXighLAyrkvcmVh+fY/afceRwc1ClLyaCBRFV5
 f1Ps95/pyDCd18YcC32ddYNb+uc9Ic+fw5ce6IvQcuspJgXLbLyfmZ9DuVuDn2rHJRxI
 NeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764150123; x=1764754923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M3j5o7XEKSZlIeCiZ5DKpqNZdvGJne19TQ44ufGC62k=;
 b=G/PAsEOrI3jI5XHuAsTWj5r6kKOU328x8CBjbtdh6Us99GxH5Hdbrpo9fzNptYCZhN
 vlkEAelbpqwW0SLXKbafnQHQdmaaxVUIQZjwcpXYPKeEqXc8iIQdY8y80DlY/idQZT3H
 EcE7qe4ShZS24A+xxF7/fhL5DpfsMflo7rQaTtKZttUataizVI3qmZDCzKT3LTRxom53
 C1SIzvFLmmuYaZ1ZZ7sAvFL4V/J8bFiagg0TESZ2Nf5hafM06fq3ScGTt0mMVWWZAv3k
 3saNypGbcwmRrzhUTmaVNTatWLu9LQa22ioWub0kMCP61VnFX0bvQ750TNo0NMgA3eYn
 Py8g==
X-Gm-Message-State: AOJu0Yzpgi/LZBJ5J+I56pie9cRUyV2feCvKoINUCD0LyoUoLg1F9Lqe
 ANMYpwfKkomER/HntBSwbT8cMfOOyE11jKXfljp+a7OU+ivSW6aZwMJM1Mf7eyYq2JkUET73eQR
 MGrWeGs6UgMpCJhvTCu8LF0UJcUiIuwEk9uFYgrW6UiE2x7D1hR/GmxDe53YoZxSyAzEtHMw=
X-Gm-Gg: ASbGncteR7yIvrOvohqO5AsPIsWzqA/hndVZrmiKXKhHBE2P3H5djUy5RtIqrWoB4aW
 e4kH8LMFTIFEtaOYQ9//HYIxv322bP+So2NQ+yRii8SkJGcr+8890/Q4xqk1vaGW0FqJ6Aj0WGd
 5z/TbFIarymWxxkNN7mMs+x4wYxUuxKymN1dtYIPIMszCKp9VqSNX0A4WdqjFQQoR6S5l9b8QM7
 /fok39xUraAz1q6dnRnj75AA/nMHRY7Y2l/ZxZJ1bTO6v3CJ3JbjZJSCAnMUcI+hc7oweaDpI3M
 qz+f5l82G/pzw/G6+ZoizG+h5+W/nPugmlX2D6IQDvJY/Hp0/XrgUfAIsG8lF0XG/r9eaS7/ZKg
 X3a5pzYTyBHfGiDQnqjeBaCPFo8b5tdy9IQs+ywXlLCtkWB/tYk88P/luxHRvk1c3G67uaUewcO
 84q/LIMzqkEwTYTkMVeVY8GTg=
X-Received: by 2002:a05:620a:3196:b0:8b2:e7db:2540 with SMTP id
 af79cd13be357-8b33d1d0df6mr2355827585a.29.1764150122785; 
 Wed, 26 Nov 2025 01:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgkri02+TGQbSc51Gh1Jm1pf9E+oAYwa67XcBA05lZ7ao8NgPAavaWYyv3ddD1aL22RunpLA==
X-Received: by 2002:a05:620a:3196:b0:8b2:e7db:2540 with SMTP id
 af79cd13be357-8b33d1d0df6mr2355822985a.29.1764150122145; 
 Wed, 26 Nov 2025 01:42:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 01:42:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:41:57 +0200
Subject: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
In-Reply-To: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10623;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uSNCR60mUAfhqc+JWZUJ2IwqPcnPja5G4zUDlK45vRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpJstms2rN08MIfxLywFGOdozwLYpKB3z/IwBch
 F2SeQYvYrqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSbLZgAKCRCLPIo+Aiko
 1YZQCACpENCPZMA3oR+EFX3pSQmUwN6/fEmiMv3WDEyXDcOI46f0XMMUuGXbhYgkNGM9Db5Ot61
 hkSRyKbkrAgNpRieU3QfGFyNqQTqnwWfEYyVQV/eyACntEcUiH0ckVZeFDdHGio/VCf6cxeRXMF
 oiH8rnvPnyZMoHr6+VmCbHu2/1RWHdODV9kJt0UIcR72m4aovV++53HEmC9wqTqTIiaDY2KQqYb
 p92o8cshFjbe6dUKVKFxRfjQ5KkmA4BPEkM3P7oQNNhB/bhIMyYAQMpz+s0esHO6lUznfrdwX99
 cx/5tiMdVT/oXlRmHwRB7hJzCV/YBBTQyHtZyWnQKfeuYpqg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926cb6b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SM6BNd7mGtu9OntbbzYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX3EzjhVCZhSpD
 UP4xu3M9yLPxXprAfSKaZ7esz1FCrHdqB7MBgNUbVo6C4ubFGYtpG0grLOYTSaB4BTKw9LyYWXf
 Vjl02XRy8/1WTqUsRQNN0/S01dPotBGKyIlPyuSpAk72+q+6apngA1WM+k7O7SAUNwhntXkDg6L
 Od/f12S/RiGU5nhFL96ysKPh2j8jF2SRm8di4VJdSAlSnMP72cqAQWCn/u90841QQmwl0i2OJNE
 zYBzWgJGB0P0/KbeBYkaOC0kxemrhLZOjC2cBYkzniwBi6M+92FEaseveKVkvcVWxG7JSVHy/eD
 HPRVcVbplipSGdhVtX9MHmtnjK0ftv5PmKlNAQ7AwMXlF5o6Jjh/dkUCtdGHiq62laXAuLxUKaB
 eF9vAbEoaJs6jhaeh021aztwI+9INg==
X-Proofpoint-ORIG-GUID: DOVeh9iqsVk52JRt0cUtCrkq-Yvs85_U
X-Proofpoint-GUID: DOVeh9iqsVk52JRt0cUtCrkq-Yvs85_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079
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

ANX7625 can be used as a USB-C controller, handling USB and DP data
streams. Provide minimal Type-C support necessary for ANX7625 to
register the Type-C port device and properly respond to data / power
role events from the Type-C partner.

While ANX7625 provides TCPCI interface, using it would circumvent the
on-chip running firmware. Analogix recommended using the higher-level
interface instead of TCPCI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/Kconfig   |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c | 163 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  21 +++-
 3 files changed, 175 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c2a5da18f6a3cdec53ef5766455e0..f3448b0631fea42e7e7ab10368777a93ce33cee7 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -34,6 +34,7 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on OF
+	depends on TYPEC || !TYPEC
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6f3fdcb6afdb9d785bc4515300676cf3988c5807..a44405db739669dfd2907b0afd41293a7b173035 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -3,6 +3,7 @@
  * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
  *
  */
+#include <linux/cleanup.h>
 #include <linux/gcd.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -15,6 +16,9 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/role.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_graph.h>
@@ -1325,7 +1329,7 @@ static int anx7625_read_hpd_gpio_config_status(struct anx7625_data *ctx)
 static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
-	int ret, val;
+	int ret;
 
 	/* Reset main ocm */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40);
@@ -1339,6 +1343,11 @@ static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
+}
+
+static void anx7625_configure_hpd(struct anx7625_data *ctx)
+{
+	int val;
 
 	/*
 	 * Make sure the HPD GPIO already be configured after OCM release before
@@ -1369,7 +1378,9 @@ static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
 	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
 		return -ENODEV;
 
-	anx7625_disable_pd_protocol(ctx);
+	if (!ctx->typec_port)
+		anx7625_disable_pd_protocol(ctx);
+	anx7625_configure_hpd(ctx);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
 			     anx7625_reg_read(ctx,
@@ -1472,6 +1483,115 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
 }
 
+#if IS_REACHABLE(CONFIG_TYPEC)
+static void anx7625_typec_set_orientation(struct anx7625_data *ctx)
+{
+	u32 val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
+
+	if (val & (CC1_RP | CC1_RD))
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NORMAL);
+	else if (val & (CC2_RP | CC2_RD))
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_REVERSE);
+	else
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NONE);
+}
+
+static void anx7625_typec_isr(struct anx7625_data *ctx,
+			      unsigned int intr_vector,
+			      unsigned int intr_status)
+{
+	if (intr_vector & CC_STATUS)
+		anx7625_typec_set_orientation(ctx);
+	if (intr_vector & DATA_ROLE_STATUS) {
+		usb_role_switch_set_role(ctx->role_sw,
+					 (intr_status & DATA_ROLE_STATUS) ?
+					 USB_ROLE_HOST : USB_ROLE_DEVICE);
+		typec_set_data_role(ctx->typec_port,
+				    (intr_status & DATA_ROLE_STATUS) ?
+				    TYPEC_HOST : TYPEC_DEVICE);
+	}
+	if (intr_vector & VBUS_STATUS)
+		typec_set_pwr_role(ctx->typec_port,
+				   (intr_status & VBUS_STATUS) ?
+				   TYPEC_SOURCE : TYPEC_SINK);
+	if (intr_vector & VCONN_STATUS)
+		typec_set_vconn_role(ctx->typec_port,
+				     (intr_status & VCONN_STATUS) ?
+				     TYPEC_SOURCE : TYPEC_SINK);
+}
+
+static int anx7625_typec_register(struct anx7625_data *ctx)
+{
+	struct typec_capability typec_cap = { };
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+	u32 val;
+	int ret;
+
+	fwnode = device_get_named_child_node(ctx->dev, "connector");
+	if (!fwnode)
+		return 0;
+
+	ret = typec_get_fw_cap(&typec_cap, fwnode);
+	if (ret < 0)
+		return ret;
+
+	typec_cap.revision = 0x0120;
+	typec_cap.pd_revision = 0x0300;
+	typec_cap.usb_capability = USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
+	typec_cap.orientation_aware = true;
+
+	typec_cap.driver_data = ctx;
+
+	ctx->typec_port = typec_register_port(ctx->dev, &typec_cap);
+	if (IS_ERR(ctx->typec_port))
+		return PTR_ERR(ctx->typec_port);
+
+	ctx->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(ctx->role_sw)) {
+		typec_unregister_port(ctx->typec_port);
+		return PTR_ERR(ctx->role_sw);
+	}
+
+	val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
+	anx7625_typec_set_orientation(ctx);
+	usb_role_switch_set_role(ctx->role_sw,
+				 (val & DATA_ROLE_STATUS) ?
+				 USB_ROLE_HOST : USB_ROLE_DEVICE);
+	typec_set_data_role(ctx->typec_port,
+			    (val & DATA_ROLE_STATUS) ?
+			    TYPEC_HOST : TYPEC_DEVICE);
+	typec_set_pwr_role(ctx->typec_port,
+			    (val & VBUS_STATUS) ?
+			    TYPEC_SOURCE : TYPEC_SINK);
+	typec_set_vconn_role(ctx->typec_port,
+			     (val & VCONN_STATUS) ?
+			     TYPEC_SOURCE : TYPEC_SINK);
+
+	return 0;
+}
+
+static void anx7625_typec_unregister(struct anx7625_data *ctx)
+{
+	usb_role_switch_put(ctx->role_sw);
+	typec_unregister_port(ctx->typec_port);
+}
+#else
+static void anx7625_typec_isr(struct anx7625_data *ctx,
+			      unsigned int intr_vector,
+			      unsigned int intr_status)
+{
+}
+
+static int anx7625_typec_register(struct anx7625_data *ctx)
+{
+	return 0;
+}
+
+static void anx7625_typec_unregister(struct anx7625_data *ctx)
+{
+}
+#endif
+
 static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 {
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
@@ -1566,7 +1686,7 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	}
 }
 
-static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
+static int anx7625_intr_status(struct anx7625_data *ctx)
 {
 	int intr_vector, status;
 	struct device *dev = ctx->dev;
@@ -1593,9 +1713,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 		return status;
 	}
 
-	if (!(intr_vector & HPD_STATUS_CHANGE))
-		return -ENOENT;
-
 	status = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
 				  SYSTEM_STSTUS);
 	if (status < 0) {
@@ -1604,6 +1721,12 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x45=%x\n", status);
+
+	anx7625_typec_isr(ctx, intr_vector, status);
+
+	if (!(intr_vector & HPD_STATUS))
+		return -ENOENT;
+
 	dp_hpd_change_handler(ctx, status & HPD_STATUS);
 
 	return 0;
@@ -1622,7 +1745,7 @@ static void anx7625_work_func(struct work_struct *work)
 		return;
 	}
 
-	event = anx7625_hpd_change_detect(ctx);
+	event = anx7625_intr_status(ctx);
 
 	mutex_unlock(&ctx->lock);
 
@@ -2741,11 +2864,29 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	}
 
 	if (!platform->pdata.low_power_mode) {
-		anx7625_disable_pd_protocol(platform);
+		struct fwnode_handle *fwnode;
+
+		fwnode = device_get_named_child_node(dev, "connector");
+		if (fwnode)
+			fwnode_handle_put(fwnode);
+		else
+			anx7625_disable_pd_protocol(platform);
+
+		anx7625_configure_hpd(platform);
+
 		pm_runtime_get_sync(dev);
 		_anx7625_hpd_polling(platform, 5000 * 100);
 	}
 
+	if (platform->pdata.intp_irq)
+		anx7625_reg_write(platform, platform->i2c.rx_p0_client,
+				  INTERFACE_CHANGE_INT_MASK, 0);
+
+	/* After getting runtime handle */
+	ret = anx7625_typec_register(platform);
+	if (ret)
+		goto pm_suspend;
+
 	/* Add work function */
 	if (platform->pdata.intp_irq) {
 		enable_irq(platform->pdata.intp_irq);
@@ -2759,6 +2900,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	return 0;
 
+pm_suspend:
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
@@ -2774,6 +2919,8 @@ static void anx7625_i2c_remove(struct i2c_client *client)
 {
 	struct anx7625_data *platform = i2c_get_clientdata(client);
 
+	anx7625_typec_unregister(platform);
+
 	drm_bridge_remove(&platform->bridge);
 
 	if (platform->pdata.intp_irq)
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index eb5580f1ab2f86b48b6f2df4fa4d6c3be603ad48..f9570cd6d22e55fd70a12c15960714cbb783d059 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -51,9 +51,21 @@
 #define INTR_RECEIVED_MSG BIT(5)
 
 #define SYSTEM_STSTUS 0x45
+#define INTERFACE_CHANGE_INT_MASK 0x43
 #define INTERFACE_CHANGE_INT 0x44
-#define HPD_STATUS_CHANGE 0x80
-#define HPD_STATUS 0x80
+#define VCONN_STATUS	BIT(2)
+#define VBUS_STATUS	BIT(3)
+#define CC_STATUS	BIT(4)
+#define DATA_ROLE_STATUS	BIT(5)
+#define HPD_STATUS	BIT(7)
+
+#define NEW_CC_STATUS 0x46
+#define CC1_RD                  BIT(0)
+#define CC1_RA                  BIT(1)
+#define CC1_RP			(BIT(2) | BIT(3))
+#define CC2_RD                  BIT(4)
+#define CC2_RA                  BIT(5)
+#define CC2_RP			(BIT(6) | BIT(7))
 
 /******** END of I2C Address 0x58 ********/
 
@@ -447,9 +459,14 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct typec_port;
+struct usb_role_switch;
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
+	struct typec_port *typec_port;
+	struct usb_role_switch *role_sw;
 	int hpd_status;
 	int hpd_high_cnt;
 	int dp_en;

-- 
2.47.3

