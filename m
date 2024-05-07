Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFB8BE7DD
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549A711200F;
	Tue,  7 May 2024 15:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NQGBCr4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1311200F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:18 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-419ec098d81so13203245e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097316; x=1715702116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=40+Pm6zyt5X6n4Ns9MlN83kz/gWPVXV1Uvz0YKR00AQ=;
 b=NQGBCr4pBEydH8sFivTvBdWKT87sVKGdO3peP5w6JEEF91tYQbAUvu/9gZZ5ZXfJA/
 qScqUad3e4WpW76CfuYE5SmoOlt04TuSaJXb5cRVYZVmOnNzEFAyoR49eep3T/IP3J2b
 /2VOjiraj8Gv38Vfy96tCxcLnOGOzgoJtMfGpc/RM2OM2aecJbojRIuOLcZprUPe773a
 eSmt/Le+u2OLJqJMFa6X3sH+LW8NvnE5XnKrPIN+lea9CoPrplH8LW6QAFhrK2l9Fzvn
 qw9mlPL2NhmWsn8tL4r/Dy3Px/ahGzYvDXDT3aROp8STfB8iHDD27yBx26D64oI2pVij
 FgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097316; x=1715702116;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=40+Pm6zyt5X6n4Ns9MlN83kz/gWPVXV1Uvz0YKR00AQ=;
 b=fs3+GavdbL9K9fcq4uUFm4MdoN1LT6yr8wJylHWWmw73NJ/cR83omx2PtOp/JLf3nY
 dBEQWF9CQ5gQOokalu0bq84LojK9LJt1TSPYYnjGOP1t4r282zmasHPJeMRRy0zCYwtF
 mj5z1BvcmIsxceZu5NldXXnlH45Zf+9eLFhjKSTIf0ZjDyBxDfhuDg4ipQIYj+yGH92M
 IVqkoCXLMPTqFtPcGYX40la+i+34TKuUvZdATjVyI2aItoTev8Xisi901ZcuRiEoZTVV
 BP6UKqI6SJlu8fYyucmDVQzUnY1scnt6hF70hcsN0pkGYUnHGUjft4OkYCNKRnKw4k0h
 spFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Ke25Huy0Vk89Uv2MBFgw5ZaqDPd9npclHVfgRDgVOhhAWdbKDGDYR4XYizmqlDbtiziEFKAThOKtLwOjmF0iOgA7UyCPIXP5P7yGOlfd
X-Gm-Message-State: AOJu0YwDF7/4vWmst8krOqR14WRxvzz/qzvKVH37LmvERaXOOVnk8DL+
 v2JGXCQ/QOaYDKwjb9baxV8+rpKpbDpU0zDtdGt4B+u+XX6GcQGKHBbgu8qgsZ0AG1XCBRtVRnR
 dZkfn1/jTqQ==
X-Google-Smtp-Source: AGHT+IF/5zSOo21MvZ154VSfD/SVvXl6RXiUdoc/sdkw9vF99qGVCLv+fog+PM7u+XdwnhS55cvGs0/dve3sQg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:2108:b0:41c:97e:20fc with SMTP
 id 5b1f17b1804b1-41f723a0969mr4115e9.3.1715097316211; Tue, 07 May 2024
 08:55:16 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:06 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-4-panikiel@google.com>
Subject: [PATCH v3 03/10] lib: Move DisplayPort CRC functions to common lib
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
index c0f56888c328..eda19645201d 100644
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
index 03d528209426..54ba98d3bc6f 100644
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
index 4557bb8a5256..d2836dacf10d 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -168,6 +168,14 @@ config CRC_ITU_T
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
index ffc6b2341b45..82edf655036b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -186,6 +186,7 @@ obj-$(CONFIG_CRC7)	+=3D crc7.o
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
2.45.0.rc1.225.g2a3ae87e7f-goog

