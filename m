Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9B85146C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091FD10ED37;
	Mon, 12 Feb 2024 13:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="D5cY/S1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC3B10ED2E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:25 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-33b14a51901so1569047f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743663; x=1708348463;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=C857fcvjN2Q61CMGefzqTDLbKskpX9Jvk37xAZm0WZQ=;
 b=D5cY/S1ePNowLE9sH4ECngenBW069FVtD9hjXUntUFOS+o9IFURok4gj6Go6nctMiV
 ls/Rnoog//I1O9Vsf55LVwRwAxZoT/sRV5ICs04tTJNlAQF7u2OAh0Y8AlAhnj6vcbuZ
 MJ9ktVOxoRSwGNlf68fytKQz/iLA4i2ochEeW6oZgN+I8VabV5e0/fwb5Nqov1YBs8Cd
 n4r1nADkWD2hHNF7C4Pwp1KHFMnp/TW17Cmi9VVlSOKxaMCAU8b0JPSys2K0DXTca5T8
 iZ5fZksl1jziZ48LwifBDK+WLqwdzFFKIMaIv+27ATyIwG/JvsicIeAUPRcs5GkXVnRY
 kWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743663; x=1708348463;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C857fcvjN2Q61CMGefzqTDLbKskpX9Jvk37xAZm0WZQ=;
 b=s7qUL5w+0vdCQNd+J/EQgsWfAVS0iMahWoKh2wlUUtAMEyilS5Q3nim5bEssCJvdnF
 vkzaAmfS4xh72vuYwJbU/TxVT4b0NLTPLGAouX5i+Aln4dhwEg0j492BQ3zdTrcexKm/
 2Ghlpf6tDWSD5PCnNEkn8kw2MeI/+9ohuuRORfzJLf0DKGRyJvmhulJdmyP/DyzoqjcU
 E5Ot1Ze3/WKYeyA+iUwOgVRAgsT1JVm1ZlZjTPA5ouL4uNxGpy3roe3tRdGd9MDPOxBU
 PDQxz6w8+bEoRWZkbEHU9qdFBka+GqAnP71rPL5pQrGXuk48C9gyhQN7jHXqCaUFLJW9
 XZwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUahwvM5IMWa9wZAYIDCQdMMOZs2J6cX8qTblT42U4zwrLlAoAkGZoBTxphj0eC/p+1FQ+lcohKIMQIFXZPE2kaZS6wwzchnMu8oRHbBJz5
X-Gm-Message-State: AOJu0YwTGdlgvt9JJj8QD+IIBdghTGTo624S6kVXsmZRK6pki92kcQJk
 NOyKKnN1+iBbdom2Za+ILl5p0Gxqnz5kxrxqsL8ntdGb7Kpzpmz8mM1mXT44JUHBAQHChCvilsT
 X26TZ23XoVA==
X-Google-Smtp-Source: AGHT+IG5xi/ZS1yrFRFK1RW2aagwmX6KzFfQ5/5hjVdtE12WQdvMnvFrXJog3nKIuyfDcEXqGAW89Ra+zqrGCw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a5d:5a1a:0:b0:33b:1da0:a7cb with SMTP id
 bq26-20020a5d5a1a000000b0033b1da0a7cbmr36157wrb.4.1707743663594; Mon, 12 Feb
 2024 05:14:23 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:17 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-4-panikiel@google.com>
Subject: [PATCH 3/9] drm/dp_mst: Move DRM-independent structures to separate
 header
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

Move structures describing MST sideband messages into a separate header
so that non-DRM code can use them.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 include/drm/display/drm_dp_mst.h        | 238 ++++++++++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h | 232 +----------------------
 2 files changed, 239 insertions(+), 231 deletions(-)
 create mode 100644 include/drm/display/drm_dp_mst.h

diff --git a/include/drm/display/drm_dp_mst.h b/include/drm/display/drm_dp_=
mst.h
new file mode 100644
index 000000000000..4e398bfd3ee3
--- /dev/null
+++ b/include/drm/display/drm_dp_mst.h
@@ -0,0 +1,238 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _DRM_DP_MST_H_
+#define _DRM_DP_MST_H_
+
+#include <linux/types.h>
+
+struct drm_dp_nak_reply {
+	u8 guid[16];
+	u8 reason;
+	u8 nak_data;
+};
+
+struct drm_dp_link_address_ack_reply {
+	u8 guid[16];
+	u8 nports;
+	struct drm_dp_link_addr_reply_port {
+		bool input_port;
+		u8 peer_device_type;
+		u8 port_number;
+		bool mcs;
+		bool ddps;
+		bool legacy_device_plug_status;
+		u8 dpcd_revision;
+		u8 peer_guid[16];
+		u8 num_sdp_streams;
+		u8 num_sdp_stream_sinks;
+	} ports[16];
+};
+
+struct drm_dp_remote_dpcd_read_ack_reply {
+	u8 port_number;
+	u8 num_bytes;
+	u8 bytes[255];
+};
+
+struct drm_dp_remote_dpcd_write_ack_reply {
+	u8 port_number;
+};
+
+struct drm_dp_remote_dpcd_write_nak_reply {
+	u8 port_number;
+	u8 reason;
+	u8 bytes_written_before_failure;
+};
+
+struct drm_dp_remote_i2c_read_ack_reply {
+	u8 port_number;
+	u8 num_bytes;
+	u8 bytes[255];
+};
+
+struct drm_dp_remote_i2c_read_nak_reply {
+	u8 port_number;
+	u8 nak_reason;
+	u8 i2c_nak_transaction;
+};
+
+struct drm_dp_remote_i2c_write_ack_reply {
+	u8 port_number;
+};
+
+struct drm_dp_query_stream_enc_status_ack_reply {
+	/* Bit[23:16]- Stream Id */
+	u8 stream_id;
+
+	/* Bit[15]- Signed */
+	bool reply_signed;
+
+	/* Bit[10:8]- Stream Output Sink Type */
+	bool unauthorizable_device_present;
+	bool legacy_device_present;
+	bool query_capable_device_present;
+
+	/* Bit[12:11]- Stream Output CP Type */
+	bool hdcp_1x_device_present;
+	bool hdcp_2x_device_present;
+
+	/* Bit[4]- Stream Authentication */
+	bool auth_completed;
+
+	/* Bit[3]- Stream Encryption */
+	bool encryption_enabled;
+
+	/* Bit[2]- Stream Repeater Function Present */
+	bool repeater_present;
+
+	/* Bit[1:0]- Stream State */
+	u8 state;
+};
+
+#define DRM_DP_MAX_SDP_STREAMS 16
+struct drm_dp_allocate_payload {
+	u8 port_number;
+	u8 number_sdp_streams;
+	u8 vcpi;
+	u16 pbn;
+	u8 sdp_stream_sink[DRM_DP_MAX_SDP_STREAMS];
+};
+
+struct drm_dp_allocate_payload_ack_reply {
+	u8 port_number;
+	u8 vcpi;
+	u16 allocated_pbn;
+};
+
+struct drm_dp_connection_status_notify {
+	u8 guid[16];
+	u8 port_number;
+	bool legacy_device_plug_status;
+	bool displayport_device_plug_status;
+	bool message_capability_status;
+	bool input_port;
+	u8 peer_device_type;
+};
+
+struct drm_dp_remote_dpcd_read {
+	u8 port_number;
+	u32 dpcd_address;
+	u8 num_bytes;
+};
+
+struct drm_dp_remote_dpcd_write {
+	u8 port_number;
+	u32 dpcd_address;
+	u8 num_bytes;
+	u8 *bytes;
+};
+
+#define DP_REMOTE_I2C_READ_MAX_TRANSACTIONS 4
+struct drm_dp_remote_i2c_read {
+	u8 num_transactions;
+	u8 port_number;
+	struct drm_dp_remote_i2c_read_tx {
+		u8 i2c_dev_id;
+		u8 num_bytes;
+		u8 *bytes;
+		u8 no_stop_bit;
+		u8 i2c_transaction_delay;
+	} transactions[DP_REMOTE_I2C_READ_MAX_TRANSACTIONS];
+	u8 read_i2c_device_id;
+	u8 num_bytes_read;
+};
+
+struct drm_dp_remote_i2c_write {
+	u8 port_number;
+	u8 write_i2c_device_id;
+	u8 num_bytes;
+	u8 *bytes;
+};
+
+struct drm_dp_query_stream_enc_status {
+	u8 stream_id;
+	u8 client_id[7];	/* 56-bit nonce */
+	u8 stream_event;
+	bool valid_stream_event;
+	u8 stream_behavior;
+	u8 valid_stream_behavior;
+};
+
+/* this covers ENUM_RESOURCES, POWER_DOWN_PHY, POWER_UP_PHY */
+struct drm_dp_port_number_req {
+	u8 port_number;
+};
+
+struct drm_dp_enum_path_resources_ack_reply {
+	u8 port_number;
+	bool fec_capable;
+	u16 full_payload_bw_number;
+	u16 avail_payload_bw_number;
+};
+
+/* covers POWER_DOWN_PHY, POWER_UP_PHY */
+struct drm_dp_port_number_rep {
+	u8 port_number;
+};
+
+struct drm_dp_query_payload {
+	u8 port_number;
+	u8 vcpi;
+};
+
+struct drm_dp_resource_status_notify {
+	u8 port_number;
+	u8 guid[16];
+	u16 available_pbn;
+};
+
+struct drm_dp_query_payload_ack_reply {
+	u8 port_number;
+	u16 allocated_pbn;
+};
+
+struct drm_dp_sideband_msg_req_body {
+	u8 req_type;
+	union ack_req {
+		struct drm_dp_connection_status_notify conn_stat;
+		struct drm_dp_port_number_req port_num;
+		struct drm_dp_resource_status_notify resource_stat;
+
+		struct drm_dp_query_payload query_payload;
+		struct drm_dp_allocate_payload allocate_payload;
+
+		struct drm_dp_remote_dpcd_read dpcd_read;
+		struct drm_dp_remote_dpcd_write dpcd_write;
+
+		struct drm_dp_remote_i2c_read i2c_read;
+		struct drm_dp_remote_i2c_write i2c_write;
+
+		struct drm_dp_query_stream_enc_status enc_status;
+	} u;
+};
+
+struct drm_dp_sideband_msg_reply_body {
+	u8 reply_type;
+	u8 req_type;
+	union ack_replies {
+		struct drm_dp_nak_reply nak;
+		struct drm_dp_link_address_ack_reply link_addr;
+		struct drm_dp_port_number_rep port_number;
+
+		struct drm_dp_enum_path_resources_ack_reply path_resources;
+		struct drm_dp_allocate_payload_ack_reply allocate_payload;
+		struct drm_dp_query_payload_ack_reply query_payload;
+
+		struct drm_dp_remote_dpcd_read_ack_reply remote_dpcd_read_ack;
+		struct drm_dp_remote_dpcd_write_ack_reply remote_dpcd_write_ack;
+		struct drm_dp_remote_dpcd_write_nak_reply remote_dpcd_write_nack;
+
+		struct drm_dp_remote_i2c_read_ack_reply remote_i2c_read_ack;
+		struct drm_dp_remote_i2c_read_nak_reply remote_i2c_read_nack;
+		struct drm_dp_remote_i2c_write_ack_reply remote_i2c_write_ack;
+
+		struct drm_dp_query_stream_enc_status_ack_reply enc_status;
+	} u;
+};
+
+#endif
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/=
drm_dp_mst_helper.h
index 9b19d8bd520a..61add6f6accd 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -23,6 +23,7 @@
 #define _DRM_DP_MST_HELPER_H_
=20
 #include <linux/types.h>
+#include <drm/display/drm_dp_mst.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_fixed.h>
@@ -248,237 +249,6 @@ struct drm_dp_mst_branch {
 	u8 guid[16];
 };
=20
-
-struct drm_dp_nak_reply {
-	u8 guid[16];
-	u8 reason;
-	u8 nak_data;
-};
-
-struct drm_dp_link_address_ack_reply {
-	u8 guid[16];
-	u8 nports;
-	struct drm_dp_link_addr_reply_port {
-		bool input_port;
-		u8 peer_device_type;
-		u8 port_number;
-		bool mcs;
-		bool ddps;
-		bool legacy_device_plug_status;
-		u8 dpcd_revision;
-		u8 peer_guid[16];
-		u8 num_sdp_streams;
-		u8 num_sdp_stream_sinks;
-	} ports[16];
-};
-
-struct drm_dp_remote_dpcd_read_ack_reply {
-	u8 port_number;
-	u8 num_bytes;
-	u8 bytes[255];
-};
-
-struct drm_dp_remote_dpcd_write_ack_reply {
-	u8 port_number;
-};
-
-struct drm_dp_remote_dpcd_write_nak_reply {
-	u8 port_number;
-	u8 reason;
-	u8 bytes_written_before_failure;
-};
-
-struct drm_dp_remote_i2c_read_ack_reply {
-	u8 port_number;
-	u8 num_bytes;
-	u8 bytes[255];
-};
-
-struct drm_dp_remote_i2c_read_nak_reply {
-	u8 port_number;
-	u8 nak_reason;
-	u8 i2c_nak_transaction;
-};
-
-struct drm_dp_remote_i2c_write_ack_reply {
-	u8 port_number;
-};
-
-struct drm_dp_query_stream_enc_status_ack_reply {
-	/* Bit[23:16]- Stream Id */
-	u8 stream_id;
-
-	/* Bit[15]- Signed */
-	bool reply_signed;
-
-	/* Bit[10:8]- Stream Output Sink Type */
-	bool unauthorizable_device_present;
-	bool legacy_device_present;
-	bool query_capable_device_present;
-
-	/* Bit[12:11]- Stream Output CP Type */
-	bool hdcp_1x_device_present;
-	bool hdcp_2x_device_present;
-
-	/* Bit[4]- Stream Authentication */
-	bool auth_completed;
-
-	/* Bit[3]- Stream Encryption */
-	bool encryption_enabled;
-
-	/* Bit[2]- Stream Repeater Function Present */
-	bool repeater_present;
-
-	/* Bit[1:0]- Stream State */
-	u8 state;
-};
-
-#define DRM_DP_MAX_SDP_STREAMS 16
-struct drm_dp_allocate_payload {
-	u8 port_number;
-	u8 number_sdp_streams;
-	u8 vcpi;
-	u16 pbn;
-	u8 sdp_stream_sink[DRM_DP_MAX_SDP_STREAMS];
-};
-
-struct drm_dp_allocate_payload_ack_reply {
-	u8 port_number;
-	u8 vcpi;
-	u16 allocated_pbn;
-};
-
-struct drm_dp_connection_status_notify {
-	u8 guid[16];
-	u8 port_number;
-	bool legacy_device_plug_status;
-	bool displayport_device_plug_status;
-	bool message_capability_status;
-	bool input_port;
-	u8 peer_device_type;
-};
-
-struct drm_dp_remote_dpcd_read {
-	u8 port_number;
-	u32 dpcd_address;
-	u8 num_bytes;
-};
-
-struct drm_dp_remote_dpcd_write {
-	u8 port_number;
-	u32 dpcd_address;
-	u8 num_bytes;
-	u8 *bytes;
-};
-
-#define DP_REMOTE_I2C_READ_MAX_TRANSACTIONS 4
-struct drm_dp_remote_i2c_read {
-	u8 num_transactions;
-	u8 port_number;
-	struct drm_dp_remote_i2c_read_tx {
-		u8 i2c_dev_id;
-		u8 num_bytes;
-		u8 *bytes;
-		u8 no_stop_bit;
-		u8 i2c_transaction_delay;
-	} transactions[DP_REMOTE_I2C_READ_MAX_TRANSACTIONS];
-	u8 read_i2c_device_id;
-	u8 num_bytes_read;
-};
-
-struct drm_dp_remote_i2c_write {
-	u8 port_number;
-	u8 write_i2c_device_id;
-	u8 num_bytes;
-	u8 *bytes;
-};
-
-struct drm_dp_query_stream_enc_status {
-	u8 stream_id;
-	u8 client_id[7];	/* 56-bit nonce */
-	u8 stream_event;
-	bool valid_stream_event;
-	u8 stream_behavior;
-	u8 valid_stream_behavior;
-};
-
-/* this covers ENUM_RESOURCES, POWER_DOWN_PHY, POWER_UP_PHY */
-struct drm_dp_port_number_req {
-	u8 port_number;
-};
-
-struct drm_dp_enum_path_resources_ack_reply {
-	u8 port_number;
-	bool fec_capable;
-	u16 full_payload_bw_number;
-	u16 avail_payload_bw_number;
-};
-
-/* covers POWER_DOWN_PHY, POWER_UP_PHY */
-struct drm_dp_port_number_rep {
-	u8 port_number;
-};
-
-struct drm_dp_query_payload {
-	u8 port_number;
-	u8 vcpi;
-};
-
-struct drm_dp_resource_status_notify {
-	u8 port_number;
-	u8 guid[16];
-	u16 available_pbn;
-};
-
-struct drm_dp_query_payload_ack_reply {
-	u8 port_number;
-	u16 allocated_pbn;
-};
-
-struct drm_dp_sideband_msg_req_body {
-	u8 req_type;
-	union ack_req {
-		struct drm_dp_connection_status_notify conn_stat;
-		struct drm_dp_port_number_req port_num;
-		struct drm_dp_resource_status_notify resource_stat;
-
-		struct drm_dp_query_payload query_payload;
-		struct drm_dp_allocate_payload allocate_payload;
-
-		struct drm_dp_remote_dpcd_read dpcd_read;
-		struct drm_dp_remote_dpcd_write dpcd_write;
-
-		struct drm_dp_remote_i2c_read i2c_read;
-		struct drm_dp_remote_i2c_write i2c_write;
-
-		struct drm_dp_query_stream_enc_status enc_status;
-	} u;
-};
-
-struct drm_dp_sideband_msg_reply_body {
-	u8 reply_type;
-	u8 req_type;
-	union ack_replies {
-		struct drm_dp_nak_reply nak;
-		struct drm_dp_link_address_ack_reply link_addr;
-		struct drm_dp_port_number_rep port_number;
-
-		struct drm_dp_enum_path_resources_ack_reply path_resources;
-		struct drm_dp_allocate_payload_ack_reply allocate_payload;
-		struct drm_dp_query_payload_ack_reply query_payload;
-
-		struct drm_dp_remote_dpcd_read_ack_reply remote_dpcd_read_ack;
-		struct drm_dp_remote_dpcd_write_ack_reply remote_dpcd_write_ack;
-		struct drm_dp_remote_dpcd_write_nak_reply remote_dpcd_write_nack;
-
-		struct drm_dp_remote_i2c_read_ack_reply remote_i2c_read_ack;
-		struct drm_dp_remote_i2c_read_nak_reply remote_i2c_read_nack;
-		struct drm_dp_remote_i2c_write_ack_reply remote_i2c_write_ack;
-
-		struct drm_dp_query_stream_enc_status_ack_reply enc_status;
-	} u;
-};
-
 /* msg is queued to be put into a slot */
 #define DRM_DP_SIDEBAND_TX_QUEUED 0
 /* msg has started transmitting on a slot - still on msgq */
--=20
2.43.0.687.g38aa6559b0-goog

