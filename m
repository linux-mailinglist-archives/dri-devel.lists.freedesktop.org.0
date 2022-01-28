Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98B4A2DD1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 11:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC4A10E867;
	Sat, 29 Jan 2022 10:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03B10E59D;
 Fri, 28 Jan 2022 17:35:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u15so12262019wrt.3;
 Fri, 28 Jan 2022 09:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TsIDTtHB4kRX1wNfgR6Ml8ylhDMIOCnu62XlBka8/6g=;
 b=TzXySIrLQJNqrp2gr8PFN82rs+nQaCsKZ+kBNBN1o/3UBgttOQ6AOUGGTnvrBy0ymC
 KMIylawFWQ3LmfwXaAH7aER4p7rXKKPFVevKkK1UGgosSYbhtXUZLs5NJBnPp1qx4MVf
 t1tfEfbHl/zujHaYJqCTkBBma2fgsmWyguw/zu/DECtDuCj6OYpP98EAzM9oUCVdrq6G
 Tl9HGH7zrIyYsSxVO/GL3I7YoyLQ6z8sIJdptDxWfAwWPcZ9X1um/RCWRU/1t8kQI0qC
 6wHrIB9NcxxK5xBrKRgaC8iNDxZb4py+Yka65szsM6m7JYMa+mv4G0eo0xU1eryn5/rn
 vqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TsIDTtHB4kRX1wNfgR6Ml8ylhDMIOCnu62XlBka8/6g=;
 b=zOvXIT6DO45RkxB74cm16G5cZcNjsGN6bRD3kwqAW1SXtg0gq5qgHisp2VCt6dWrJT
 C/g7Bbu45yNz4qS8JOSm9+YVM52jfurJNpPKrdqj9axHEfZp0lhdJrxX7fAcAr0CwngF
 /c0SGouSnZLE7mdE+RfzwHyoHDGe8pQdQ7+ZSOGR39f7/H2+ij4dNXrPIo/992x7iLy7
 xl9xa7LlaXNYvUvvPtWwzcc6wcQPajP5duxxGpaJlo+xTUI83h1nsKpxJ75Bj0zeHa1K
 XuQmhkE2GRfGd6cGIvTjayEIcn2UKAh08DBz+aeCmoCHt74vO9TnbZy7imSuFvKSvgUu
 ZluQ==
X-Gm-Message-State: AOAM531kSihyFivEjI/wpUZHFoPlt8l0PoAXi6grFuRpwgwxumE0JiX+
 vXt5CryY2zDhsSiPXhMNMnc=
X-Google-Smtp-Source: ABdhPJxJE0V/fphCdVdf6dtmH5D1Nmn7oSq2UA0Il16gHJVuWzQ4UL+lVYo/ob7txoCGhmhLdc5Myw==
X-Received: by 2002:a05:6000:1c01:: with SMTP id
 ba1mr8063219wrb.28.1643391304188; 
 Fri, 28 Jan 2022 09:35:04 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id z1sm2359404wmk.32.2022.01.28.09.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 09:35:03 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix spelling mistake: synatpics ->
 synaptics
Date: Fri, 28 Jan 2022 17:35:02 +0000
Message-Id: <20220128173502.594099-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Jan 2022 10:50:33 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are quite a few spelling mistakes in various function names
and error messages. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 75b5299b3576..db4ab01267e4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -539,7 +539,7 @@ bool dm_helpers_submit_i2c(
 }
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
-static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
+static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
 		bool is_write_cmd,
 		unsigned char cmd,
 		unsigned int length,
@@ -578,7 +578,7 @@ static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
 	ret = drm_dp_dpcd_write(aux, SYNAPTICS_RC_COMMAND, &rc_cmd, sizeof(rc_cmd));
 
 	if (ret < 0) {
-		DRM_ERROR("	execute_synatpics_rc_command - write cmd ..., err = %d\n", ret);
+		DRM_ERROR("	execute_synaptics_rc_command - write cmd ..., err = %d\n", ret);
 		return false;
 	}
 
@@ -600,7 +600,7 @@ static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
 		drm_dp_dpcd_read(aux, SYNAPTICS_RC_DATA, data, length);
 	}
 
-	DC_LOG_DC("	execute_synatpics_rc_command - success = %d\n", success);
+	DC_LOG_DC("	execute_synaptics_rc_command - success = %d\n", success);
 
 	return success;
 }
@@ -618,54 +618,54 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
 	data[3] = 'U';
 	data[4] = 'S';
 
-	if (!execute_synatpics_rc_command(aux, true, 0x01, 5, 0, data))
+	if (!execute_synaptics_rc_command(aux, true, 0x01, 5, 0, data))
 		return;
 
 	// Step 3 and 4
-	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220998, data))
+	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220998, data))
 		return;
 
 	data[0] &= (~(1 << 1)); // set bit 1 to 0
-	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220998, data))
+	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220998, data))
 		return;
 
-	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
+	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
 		return;
 
 	data[0] &= (~(1 << 1)); // set bit 1 to 0
-	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220D98, data))
+	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220D98, data))
 		return;
 
-	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x221198, data))
+	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x221198, data))
 		return;
 
 	data[0] &= (~(1 << 1)); // set bit 1 to 0
-	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x221198, data))
+	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x221198, data))
 		return;
 
 	// Step 3 and 5
-	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220998, data))
+	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220998, data))
 		return;
 
 	data[0] |= (1 << 1); // set bit 1 to 1
-	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220998, data))
+	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220998, data))
 		return;
 
-	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
+	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
 		return;
 
 	data[0] |= (1 << 1); // set bit 1 to 1
 		return;
 
-	if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x221198, data))
+	if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x221198, data))
 		return;
 
 	data[0] |= (1 << 1); // set bit 1 to 1
-	if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x221198, data))
+	if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x221198, data))
 		return;
 
 	// Step 6
-	if (!execute_synatpics_rc_command(aux, true, 0x02, 0, 0, NULL))
+	if (!execute_synaptics_rc_command(aux, true, 0x02, 0, 0, NULL))
 		return;
 
 	DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");
-- 
2.34.1

