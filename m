Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406B8BE7E4
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EED112163;
	Tue,  7 May 2024 15:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CWGWk4qg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6FA112132
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:24 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-417bf71efb4so18096095e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097323; x=1715702123;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=KogNzHA8DNUq5qVErfyTruPa2HrDq2ZydyrNVBz6ZGM=;
 b=CWGWk4qgySe88YohaT+s4sWeICyzHuvkfsr4es93frs1fp/RlQxv1v8TZ9A9ek+L/g
 1mGAl8BmCeWzRG5Nw2+u0avfmCMTcJn7nr6Gg0HLiqInJHGop7D4p2eqaOPoe2Ah6XPj
 timTR+JhdcXPSQXhfmehKBhY2sR1V184hDVarzEHTDoEXY5bcNvUwaMkAyCDINCwTa+t
 8gAYre14Kd/xkepuiAbQ9sDI9cXKicGp1qUQriGy89gZsyYqk5tvcRI74Kq4cXKLEvj3
 fmAP7uTsBTxyvENHUCUNUV9JC/pq3f2ZPtkxCi/go7tgjLdtAougX/TgN1DoPBhjpukE
 yiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097323; x=1715702123;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KogNzHA8DNUq5qVErfyTruPa2HrDq2ZydyrNVBz6ZGM=;
 b=om4MIte2aog7eW7TFDhOEfHHEpVfz/vxl2Vme38UVzrkx8B375LonbkPNk6lyJpQij
 kW8ONEdt15JJ1wVtpf2TKX23LTe0JqzKHN7FfatOU2qxHttb2UqFvYRaFVV0713VG7NS
 6PhSPrXIrM+lhCCILhW/VQSZCq+PS1fP6/x2hDa4WI7u4fzzBfg7VzCUjNLri+DiP0l3
 ehwNefTTfgX/4NhylGMHwcTbHNB8hsks4gvwEihVAo7JMamylAxkMb5ZgZHH0nrGFSHC
 vqmpfAU7bWRQWsdWftttwDoRvn2jcXS0qk69FzZKpT+0wVRqzBkB+ZAlQl2OWOYD3bNT
 qnmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTjkZr2WTrSw8lvbj8k8Vpc25bht1cJt14/SLz/XXtR+R+JrQSw6QpVBnPBjJN0zLpkd6SBQ7teURC+BcqDHJ1Di0qWbYQ+rruijNLgpoS
X-Gm-Message-State: AOJu0Yxt1QRb6mmsTOs3Z20LQzVvYbLjxQcpb8HXI1B4XrzLSOSNJxLa
 Fd1hqlbi4KwqHfk73gBA3xO5frNPt6Vb+QT5wT6Dqnpz9N1nZ6+TRQXeeUN42UQE2dcqGTcdvXI
 QoFv1KKtqeQ==
X-Google-Smtp-Source: AGHT+IGDg7S/ue235EfhlQUzDC/L5iFA57uekVNXwTOfcB0fO9I1mzuwv8vAyKMuJbKe/pE9JwRfCzdMS/2g1g==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:4305:b0:41b:d9c8:5c19 with SMTP
 id 5b1f17b1804b1-41f2db247b5mr326195e9.2.1715097322908; Tue, 07 May 2024
 08:55:22 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:09 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-7-panikiel@google.com>
Subject: [PATCH v3 06/10] media: v4l2-mediabus: Add support for DisplayPort
 media bus
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Add new definitions, a config struct, and a parser for the DisplayPort
media bus.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 38 +++++++++++++++++++++++++++
 include/media/v4l2-fwnode.h           |  5 ++++
 include/media/v4l2-mediabus.h         | 17 ++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-cor=
e/v4l2-fwnode.c
index 89c7192148df..49ea4d264eb2 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -67,6 +67,10 @@ static const struct v4l2_fwnode_bus_conv {
 		V4L2_FWNODE_BUS_TYPE_DPI,
 		V4L2_MBUS_DPI,
 		"DPI",
+	}, {
+		V4L2_FWNODE_BUS_TYPE_DISPLAYPORT,
+		V4L2_MBUS_DISPLAYPORT,
+		"DisplayPort",
 	}
 };
=20
@@ -417,6 +421,33 @@ v4l2_fwnode_endpoint_parse_csi1_bus(struct fwnode_hand=
le *fwnode,
 		vep->bus_type =3D V4L2_MBUS_CSI1;
 }
=20
+static int
+v4l2_fwnode_endpoint_parse_dp_bus(struct fwnode_handle *fwnode,
+				  struct v4l2_fwnode_endpoint *vep,
+				  enum v4l2_mbus_type bus_type)
+{
+	struct v4l2_mbus_config_displayport *bus =3D &vep->bus.displayport;
+	u32 array[4];
+	int count;
+	int i;
+
+	count =3D fwnode_property_count_u32(fwnode, "data-lanes");
+	if (count < 0)
+		return count;
+	if (!(count =3D=3D 1 || count =3D=3D 2 || count =3D=3D 4))
+		return -EINVAL;
+	fwnode_property_read_u32_array(fwnode, "data-lanes", array, count);
+
+	for (i =3D 0; i < count; i++)
+		bus->data_lanes[i] =3D array[i];
+	bus->num_data_lanes =3D count;
+	bus->multi_stream_support =3D fwnode_property_present(fwnode, "multi-stre=
am-support");
+
+	vep->bus_type =3D V4L2_MBUS_DISPLAYPORT;
+
+	return 0;
+}
+
 static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 					struct v4l2_fwnode_endpoint *vep)
 {
@@ -482,6 +513,13 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_=
handle *fwnode,
 		v4l2_fwnode_endpoint_parse_parallel_bus(fwnode, vep,
 							vep->bus_type);
=20
+		break;
+	case V4L2_MBUS_DISPLAYPORT:
+		rval =3D v4l2_fwnode_endpoint_parse_dp_bus(fwnode, vep,
+							 vep->bus_type);
+		if (rval)
+			return rval;
+
 		break;
 	default:
 		pr_warn("unsupported bus type %u\n", mbus_type);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f7c57c776589..777a61015ca0 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -36,6 +36,8 @@
  * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 2 (MIPI CSI2).
+ * @bus.displayport: embedded &struct v4l2_mbus_config_displayport.
+ *		     Used if the bus is VESA DisplayPort.
  * @link_frequencies: array of supported link frequencies
  * @nr_of_link_frequencies: number of elements in link_frequenccies array
  */
@@ -46,6 +48,7 @@ struct v4l2_fwnode_endpoint {
 		struct v4l2_mbus_config_parallel parallel;
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
+		struct v4l2_mbus_config_displayport displayport;
 	} bus;
 	u64 *link_frequencies;
 	unsigned int nr_of_link_frequencies;
@@ -166,6 +169,7 @@ struct v4l2_fwnode_connector {
  * @V4L2_FWNODE_BUS_TYPE_PARALLEL: Camera Parallel Interface bus
  * @V4L2_FWNODE_BUS_TYPE_BT656: BT.656 video format bus-type
  * @V4L2_FWNODE_BUS_TYPE_DPI: Video Parallel Interface bus
+ * @V4L2_FWNODE_BUS_TYPE_DISPLAYPORT: DisplayPort bus
  * @NR_OF_V4L2_FWNODE_BUS_TYPE: Number of bus-types
  */
 enum v4l2_fwnode_bus_type {
@@ -177,6 +181,7 @@ enum v4l2_fwnode_bus_type {
 	V4L2_FWNODE_BUS_TYPE_PARALLEL,
 	V4L2_FWNODE_BUS_TYPE_BT656,
 	V4L2_FWNODE_BUS_TYPE_DPI,
+	V4L2_FWNODE_BUS_TYPE_DISPLAYPORT,
 	NR_OF_V4L2_FWNODE_BUS_TYPE
 };
=20
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 5bce6e423e94..74b5d96f5050 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -120,6 +120,18 @@ struct v4l2_mbus_config_mipi_csi1 {
 	unsigned char clock_lane;
 };
=20
+/**
+ * struct v4l2_mbus_config_displayport - DisplayPort data bus configuratio=
n
+ * @data_lanes: an array of physical data lane indexes
+ * @num_data_lanes: number of data lanes
+ * @multi_stream_support: multi stream transport support
+ */
+struct v4l2_mbus_config_displayport {
+	unsigned char data_lanes[4];
+	unsigned char num_data_lanes;
+	bool multi_stream_support;
+};
+
 /**
  * enum v4l2_mbus_type - media bus type
  * @V4L2_MBUS_UNKNOWN:	unknown bus type, no V4L2 mediabus configuration
@@ -131,6 +143,7 @@ struct v4l2_mbus_config_mipi_csi1 {
  * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
  * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
  * @V4L2_MBUS_DPI:      MIPI VIDEO DPI interface
+ * @V4L2_MBUS_DISPLAYPORT: DisplayPort interface
  * @V4L2_MBUS_INVALID:	invalid bus type (keep as last)
  */
 enum v4l2_mbus_type {
@@ -142,6 +155,7 @@ enum v4l2_mbus_type {
 	V4L2_MBUS_CSI2_DPHY,
 	V4L2_MBUS_CSI2_CPHY,
 	V4L2_MBUS_DPI,
+	V4L2_MBUS_DISPLAYPORT,
 	V4L2_MBUS_INVALID,
 };
=20
@@ -159,6 +173,8 @@ enum v4l2_mbus_type {
  * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 2 (MIPI CSI2).
+ * @bus.displayport: embedded &struct v4l2_mbus_config_displayport.
+ *	    Used if the bus is VESA DisplayPort interface.
  */
 struct v4l2_mbus_config {
 	enum v4l2_mbus_type type;
@@ -166,6 +182,7 @@ struct v4l2_mbus_config {
 		struct v4l2_mbus_config_parallel parallel;
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
+		struct v4l2_mbus_config_displayport displayport;
 	} bus;
 };
=20
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

