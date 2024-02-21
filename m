Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5C85E26D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9615710E801;
	Wed, 21 Feb 2024 16:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NBrsb9mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D7C10E7DD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:40 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4127721e3a3so3511815e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531358; x=1709136158;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4+3Sm96T7vJUTpcS+4lNZ9LA/sEbsUcxo41ULm96MSg=;
 b=NBrsb9mgXTvotX2/syVOyC2a6oeJ7LYUXjZ+RNXKhQtcEuYMbX2R7PxoJRJh5kUQXE
 cmDo4apqZBU5MjXjKA/5ehE2JkZLAt6pHY4GDg44GbznzjLMKVyhNV8TE5mJdb+sqrNI
 G1JAzLeqJ/DY9pt3DMjbUH1f7nNNZlO4ODOhOj/H4kTsdwUfS1Ij3cCK9tY2CuvIvU7I
 a6VdWeAHhfWn4rrPnZuemUTyURF6pljGNMS40w28azlGAE1INKxx7L/Wp/0n0mLz9crj
 Rhz3TDnh6+vs+DcS0knpPxE4dI+KdxuVjev8SVldpoG6LEP+PdTxs2pDvlG4X+ZiMteY
 4EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531358; x=1709136158;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4+3Sm96T7vJUTpcS+4lNZ9LA/sEbsUcxo41ULm96MSg=;
 b=HVRD3D0KQEz1yd4UgYI2M9/PLz1m9VVsBFnIpVyiRIns1zD/tR4zp84dKghuJ+ncet
 CCmOUd0Jc63ApwoDAu6JWZF+6lkRxtFYG+oMV1QDQ/5GeN/Au7cn+e91L4vIqVTO+wQX
 msiKgE+GaRq7NfDh/1JEG7kQV2V9V5SEdMEg1rItgeXPOctODRj3aguh8sU8vU1U2b3w
 zFWs/ZvdDOgF5B9p32orF7m1AueCuF+XBSsSZ0lgFcj6ZtublT53Knz52IvhHDMIyrA0
 Tph29Bg2kBoLNDhiOiQI3zy4Q6WmJMmK/F0TSBacx8wpC7YCwGcOkgNs7j74xBvmwsJY
 hkXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzHWt+Bixst6VZz4+PUT/jP/SV+dBMsTf+eovRWOLMdWkoW8yzs2TmLwVfe6MMTNdDWvhpM54R0chSghObiblWt+Mo36IBf4k2ADaRy2PW
X-Gm-Message-State: AOJu0Yyi7JuXROp8M9CCer4z2AG1EEMOgq8XcbB+e20MWWDiuvzpTRKn
 uHhFXaZNnXNtiy7Kg5qUgF0DrgRSVRcDDU9f34KKDKuiNluxjv6Vl28LUXN9eQ9IfCbhRjnze9V
 juSZ3mlIp4w==
X-Google-Smtp-Source: AGHT+IGGBteGeX3TLrSY/0NlSVhIFUJZ/CXPQE0M/uKjh49fp1p32uqkbBESvMuaCD7UkWStqr6/YxnWb3iArw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:a:b0:411:ea5e:6142 with SMTP id
 g10-20020a05600c000a00b00411ea5e6142mr128794wmc.2.1708531358714; Wed, 21 Feb
 2024 08:02:38 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:10 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-5-panikiel@google.com>
Subject: [PATCH v2 4/9] lib: Move DisplayPort CRC functions to common lib
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
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

The CRC functions found in drivers/gpu/drm/display/drm_dp_mst_topology.c
may be useful for other non-DRM code that deals with DisplayPort, e.g.
v4l2 drivers for DP receivers. Move these functions to /lib.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/gpu/drm/display/Kconfig               |  1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 76 ++----------------
 include/linux/crc-dp.h                        | 10 +++
 lib/Kconfig                                   |  8 ++
 lib/Makefile                                  |  1 +
 lib/crc-dp.c                                  | 78 +++++++++++++++++++
 6 files changed, 103 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/crc-dp.h
 create mode 100644 lib/crc-dp.c

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kcon=
fig
index 09712b88a5b8..c615f50152f2 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -14,6 +14,7 @@ config DRM_DISPLAY_HELPER
 config DRM_DISPLAY_DP_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
+	select CRC_DP
 	help
 	  DRM display helpers for DisplayPort.
=20
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/dr=
m/display/drm_dp_mst_topology.c
index f7c6b60629c2..ada1f90fa808 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -22,6 +22,7 @@
=20
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/crc-dp.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -195,73 +196,6 @@ drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *o=
ut, size_t len)
 }
=20
 /* sideband msg handling */
-static u8 drm_dp_msg_header_crc4(const uint8_t *data, size_t num_nibbles)
-{
-	u8 bitmask =3D 0x80;
-	u8 bitshift =3D 7;
-	u8 array_index =3D 0;
-	int number_of_bits =3D num_nibbles * 4;
-	u8 remainder =3D 0;
-
-	while (number_of_bits !=3D 0) {
-		number_of_bits--;
-		remainder <<=3D 1;
-		remainder |=3D (data[array_index] & bitmask) >> bitshift;
-		bitmask >>=3D 1;
-		bitshift--;
-		if (bitmask =3D=3D 0) {
-			bitmask =3D 0x80;
-			bitshift =3D 7;
-			array_index++;
-		}
-		if ((remainder & 0x10) =3D=3D 0x10)
-			remainder ^=3D 0x13;
-	}
-
-	number_of_bits =3D 4;
-	while (number_of_bits !=3D 0) {
-		number_of_bits--;
-		remainder <<=3D 1;
-		if ((remainder & 0x10) !=3D 0)
-			remainder ^=3D 0x13;
-	}
-
-	return remainder;
-}
-
-static u8 drm_dp_msg_data_crc4(const uint8_t *data, u8 number_of_bytes)
-{
-	u8 bitmask =3D 0x80;
-	u8 bitshift =3D 7;
-	u8 array_index =3D 0;
-	int number_of_bits =3D number_of_bytes * 8;
-	u16 remainder =3D 0;
-
-	while (number_of_bits !=3D 0) {
-		number_of_bits--;
-		remainder <<=3D 1;
-		remainder |=3D (data[array_index] & bitmask) >> bitshift;
-		bitmask >>=3D 1;
-		bitshift--;
-		if (bitmask =3D=3D 0) {
-			bitmask =3D 0x80;
-			bitshift =3D 7;
-			array_index++;
-		}
-		if ((remainder & 0x100) =3D=3D 0x100)
-			remainder ^=3D 0xd5;
-	}
-
-	number_of_bits =3D 8;
-	while (number_of_bits !=3D 0) {
-		number_of_bits--;
-		remainder <<=3D 1;
-		if ((remainder & 0x100) !=3D 0)
-			remainder ^=3D 0xd5;
-	}
-
-	return remainder & 0xff;
-}
 static inline u8 drm_dp_calc_sb_hdr_size(struct drm_dp_sideband_msg_hdr *h=
dr)
 {
 	u8 size =3D 3;
@@ -284,7 +218,7 @@ static void drm_dp_encode_sideband_msg_hdr(struct drm_d=
p_sideband_msg_hdr *hdr,
 		(hdr->msg_len & 0x3f);
 	buf[idx++] =3D (hdr->somt << 7) | (hdr->eomt << 6) | (hdr->seqno << 4);
=20
-	crc4 =3D drm_dp_msg_header_crc4(buf, (idx * 2) - 1);
+	crc4 =3D crc_dp_msg_header(buf, (idx * 2) - 1);
 	buf[idx - 1] |=3D (crc4 & 0xf);
=20
 	*len =3D idx;
@@ -305,7 +239,7 @@ static bool drm_dp_decode_sideband_msg_hdr(const struct=
 drm_dp_mst_topology_mgr
 	len +=3D ((buf[0] & 0xf0) >> 4) / 2;
 	if (len > buflen)
 		return false;
-	crc4 =3D drm_dp_msg_header_crc4(buf, (len * 2) - 1);
+	crc4 =3D crc_dp_msg_header(buf, (len * 2) - 1);
=20
 	if ((crc4 & 0xf) !=3D (buf[len - 1] & 0xf)) {
 		drm_dbg_kms(mgr->dev, "crc4 mismatch 0x%x 0x%x\n", crc4, buf[len - 1]);
@@ -725,7 +659,7 @@ static void drm_dp_crc_sideband_chunk_req(u8 *msg, u8 l=
en)
 {
 	u8 crc4;
=20
-	crc4 =3D drm_dp_msg_data_crc4(msg, len);
+	crc4 =3D crc_dp_msg_data(msg, len);
 	msg[len] =3D crc4;
 }
=20
@@ -782,7 +716,7 @@ static bool drm_dp_sideband_append_payload(struct drm_d=
p_sideband_msg_rx *msg,
=20
 	if (msg->curchunk_idx >=3D msg->curchunk_len) {
 		/* do CRC */
-		crc4 =3D drm_dp_msg_data_crc4(msg->chunk, msg->curchunk_len - 1);
+		crc4 =3D crc_dp_msg_data(msg->chunk, msg->curchunk_len - 1);
 		if (crc4 !=3D msg->chunk[msg->curchunk_len - 1])
 			print_hex_dump(KERN_DEBUG, "wrong crc",
 				       DUMP_PREFIX_NONE, 16, 1,
diff --git a/include/linux/crc-dp.h b/include/linux/crc-dp.h
new file mode 100644
index 000000000000..b63435c82b96
--- /dev/null
+++ b/include/linux/crc-dp.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CRC_DP_H
+#define _LINUX_CRC_DP_H
+
+#include <linux/types.h>
+
+u8 crc_dp_msg_header(const uint8_t *data, size_t num_nibbles);
+u8 crc_dp_msg_data(const uint8_t *data, u8 number_of_bytes);
+
+#endif /* _LINUX_CRC_DP_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 5ddda7c2ed9b..28f9f6cfec9f 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -171,6 +171,14 @@ config CRC_ITU_T
 	  the kernel tree does. Such modules that use library CRC ITU-T V.41
 	  functions require M here.
=20
+config CRC_DP
+	tristate "CRC DisplayPort MST functions"
+	help
+	  This option is provided for the case where no in-kernel-tree
+	  modules require CRC DisplayPort MST functions, but a module built outsi=
de
+	  the kernel tree does. Such modules that use library CRC DisplayPort MST
+	  functions require M here.
+
 config CRC32
 	tristate "CRC32/CRC32c functions"
 	default y
diff --git a/lib/Makefile b/lib/Makefile
index 6b09731d8e61..e4d7ffa260b3 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -188,6 +188,7 @@ obj-$(CONFIG_CRC7)	+=3D crc7.o
 obj-$(CONFIG_LIBCRC32C)	+=3D libcrc32c.o
 obj-$(CONFIG_CRC8)	+=3D crc8.o
 obj-$(CONFIG_CRC64_ROCKSOFT) +=3D crc64-rocksoft.o
+obj-$(CONFIG_CRC_DP)	+=3D crc-dp.o
 obj-$(CONFIG_XXHASH)	+=3D xxhash.o
 obj-$(CONFIG_GENERIC_ALLOCATOR) +=3D genalloc.o
=20
diff --git a/lib/crc-dp.c b/lib/crc-dp.c
new file mode 100644
index 000000000000..95b58bc436d4
--- /dev/null
+++ b/lib/crc-dp.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/crc-dp.h>
+
+/*
+ * Sideband MSG Header CRC
+ * Defined in DisplayPort 1.2 spec, section 2.11.3.1.9
+ */
+u8 crc_dp_msg_header(const uint8_t *data, size_t num_nibbles)
+{
+	u8 bitmask =3D 0x80;
+	u8 bitshift =3D 7;
+	u8 array_index =3D 0;
+	int number_of_bits =3D num_nibbles * 4;
+	u8 remainder =3D 0;
+
+	while (number_of_bits !=3D 0) {
+		number_of_bits--;
+		remainder <<=3D 1;
+		remainder |=3D (data[array_index] & bitmask) >> bitshift;
+		bitmask >>=3D 1;
+		bitshift--;
+		if (bitmask =3D=3D 0) {
+			bitmask =3D 0x80;
+			bitshift =3D 7;
+			array_index++;
+		}
+		if ((remainder & 0x10) =3D=3D 0x10)
+			remainder ^=3D 0x13;
+	}
+
+	number_of_bits =3D 4;
+	while (number_of_bits !=3D 0) {
+		number_of_bits--;
+		remainder <<=3D 1;
+		if ((remainder & 0x10) !=3D 0)
+			remainder ^=3D 0x13;
+	}
+
+	return remainder;
+}
+
+/*
+ * Sideband MSG Data CRC
+ * Defined in DisplayPort 1.2 spec, section 2.11.3.2.2
+ */
+u8 crc_dp_msg_data(const uint8_t *data, u8 number_of_bytes)
+{
+	u8 bitmask =3D 0x80;
+	u8 bitshift =3D 7;
+	u8 array_index =3D 0;
+	int number_of_bits =3D number_of_bytes * 8;
+	u16 remainder =3D 0;
+
+	while (number_of_bits !=3D 0) {
+		number_of_bits--;
+		remainder <<=3D 1;
+		remainder |=3D (data[array_index] & bitmask) >> bitshift;
+		bitmask >>=3D 1;
+		bitshift--;
+		if (bitmask =3D=3D 0) {
+			bitmask =3D 0x80;
+			bitshift =3D 7;
+			array_index++;
+		}
+		if ((remainder & 0x100) =3D=3D 0x100)
+			remainder ^=3D 0xd5;
+	}
+
+	number_of_bits =3D 8;
+	while (number_of_bits !=3D 0) {
+		number_of_bits--;
+		remainder <<=3D 1;
+		if ((remainder & 0x100) !=3D 0)
+			remainder ^=3D 0xd5;
+	}
+
+	return remainder & 0xff;
+}
--=20
2.44.0.rc0.258.g7320e95886-goog

