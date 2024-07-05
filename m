Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19515929825
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 15:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6C510E029;
	Sun,  7 Jul 2024 13:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L4a7I3/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3375510E97A;
 Fri,  5 Jul 2024 10:02:43 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70af9f7104cso1019193b3a.3; 
 Fri, 05 Jul 2024 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720173763; x=1720778563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ueZlpVq6cMGd2O6TPcbGvjQRFl2p51IxcfO3kFZ+XLY=;
 b=L4a7I3/RpJ6/a4EbjA/mp6V6b+NwRZS+QnLZnUBi7KUu9FZ8LAfmSTtsd2qMrMb1sU
 Ri25Z5IUHU9jNtxC8iVNFmeeqkX7ScBL7xX83eanI93Lo+0r9KQx9bvIbrYB7RWPzjTa
 3JdeU0TuiGXcIR/ql5A9ceCEvWX0lplZRCpg+PGenZbljxK82sdGvtGSZC4y6bKHt/gw
 vy9B84dqxiXjwSsOKHWefBJy1rcC7AQohlYX+PBi/fBXKtDodl1P93Oz2RP4p+/TwJef
 8gmAPnh2qebCdfn8F0pltCSoMTbK65vftn7EXMaIP6uPYGENJXUk5xApG3cXa2ZbHkcp
 VHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173763; x=1720778563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ueZlpVq6cMGd2O6TPcbGvjQRFl2p51IxcfO3kFZ+XLY=;
 b=TblmlafJo3yA4O1AhYClpLFerCmMPED5c5Iou4RHTDTQg/69vXCzJQlQfpMTf3RfQP
 EwZ9g3UnGptfG6FmQeKqCrQIQVDPeHvJJ7dHaozD1lqC4ydACeAHzgWIZUWT5T4mx1Pd
 15SacMWXsCCz03F3wZW5VQz4WDp22vqVcny9Q7WnoXxmIDDOZ0zydddG1P7CPZevICcX
 ipukwrHQmYNeVh1H11gcUSzsXOgm1D+TIrXovLpXEZ6YCBRLimgirylLz8Abpu+JC3p4
 dRbfAxXqWgj9oudgpl/MfXi+dbcBp3cB+/GRJnMI6boreDwVXNepHwoB03fguZm6kUyU
 euyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5IuVhwgowBMrMo9Kn0gI6O9uLgjFMnri8m0IeGHtgwBZQrgjb0eajkRg2q+qlG+A0tZgD9ECZHlBb4F8B/52yoMNkim3H7sStLe0CoqoDxTp638ikQhxML5wgTQBK2fHq4Edwiu8wXHWmWHFX2g==
X-Gm-Message-State: AOJu0Yy5llVTH+DYg5rMD5H3YJEBOOmI6KXJ3NcHdKOdZ5Ibqua7CkQ1
 KDdW0ZRCB34QfXLJM75B3KeQ1+s3XkT+6BTjS5XwgkGeq1PNr7fR
X-Google-Smtp-Source: AGHT+IGth6g00ULdqwjQ5OsB/b6tcPIphe8A+dcZteytrm1KA6ipJ415LiZeDcSQljJ2azzErnFegA==
X-Received: by 2002:a05:6a00:846:b0:705:b0aa:a6bf with SMTP id
 d2e1a72fcca58-70b00914f13mr4569613b3a.2.1720173762453; 
 Fri, 05 Jul 2024 03:02:42 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1cd7:818f:d731:f6bd:8194:7763])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804c835absm13623750b3a.220.2024.07.05.03.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:02:42 -0700 (PDT)
From: Akshay Behl <akshaybehl231@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch
Cc: Akshay Behl <akshaybehl231@gmail.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/display: Docs improvement in /dc/inc/hw/mpc.h
Date: Fri,  5 Jul 2024 15:31:26 +0530
Message-Id: <20240705100125.353231-1-akshaybehl231@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704092039.31264-1-akshaybehl231@gmail.com>
References: <20240704092039.31264-1-akshaybehl231@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 07 Jul 2024 13:44:38 +0000
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

After making the required changes

This patch fixes some of the warnings while building kernel Docs:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning: Function parameter or struct member 'read_mpcc_state' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning: Function parameter or struct member 'mpc_init_single_inst' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning: Function parameter or struct member 'get_mpcc_for_dpp_from_secondary' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning: Function parameter or struct member 'get_mpcc_for_dpp' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning: Function parameter or struct member 'wait_for_idle' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning: Function parameter or struct member 'assert_mpcc_idle_before_connect' not described in 'mpc_funcs'

by adding descriptions to these struct members

Signed-off-by: Akshay Behl <akshaybehl231@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 84 ++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 34a398f23fc6..d2bea0a9699d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -282,6 +282,21 @@ struct mpcc_state {
  * struct mpc_funcs - funcs
  */
 struct mpc_funcs {
+	/**
+	 * @read_mpcc_state:
+	 *
+	 * Read current state of a specified MPCC instance
+	 *
+	 * Parameters:
+	 *
+	 * - [in/out] mpc  - MPC context.
+	 * - [in] mpcc_inst - integer representing specific MPC instance
+	 * - [in/out] mpcc_state - MPCC state struct where read information will be stored
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
 	void (*read_mpcc_state)(
 			struct mpc *mpc,
 			int mpcc_inst,
@@ -352,6 +367,21 @@ struct mpc_funcs {
 	 * void
 	 */
 	void (*mpc_init)(struct mpc *mpc);
+
+	/**
+	 * @mpc_init_single_inst:
+	 *
+	 * Reset the MPCC HW status of a single MPCC physical instance.
+	 *
+	 * Parameters:
+	 *
+	 * - [in/out] mpc - MPC context.
+	 * - [in] mpcc_id - The MPCC physical instance to use for blending.
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
 	void (*mpc_init_single_inst)(
 			struct mpc *mpc,
 			unsigned int mpcc_id);
@@ -448,17 +478,69 @@ struct mpc_funcs {
 			struct mpc *mpc,
 			struct mpc_tree *tree,
 			struct mpcc *mpcc);
-
+	/**
+	 * @get_mpcc_for_dpp_from_secondary:
+	 *
+	 * Retrieve a specified MPCC struct from the 'secondary' MPC tree using the provided DPP id.
+	 *
+	 * Parameters:
+	 * - [in/out] tree - MPC tree structure that will be searched.
+	 * - [in]     dpp_id - DPP input for the MPCC.
+	 *
+	 * Return:
+	 *
+	 * struct mpcc* - MPCC that matched the input params
+	 */
 	struct mpcc* (*get_mpcc_for_dpp_from_secondary)(
 			struct mpc_tree *tree,
 			int dpp_id);
 
+	/**
+	 * @get_mpcc_for_dpp:
+	 *
+	 * Retrieve a specified MPCC struct from the MPC tree using the provided DPP id.
+	 *
+	 * Parameters:
+	 * - [in/out] tree - MPC tree structure that will be searched.
+	 * - [in]     dpp_id - DPP input for the MPCC.
+	 *
+	 * Return:
+	 *
+	 * struct mpcc* - MPCC that matched the input params
+	 */
+
 	struct mpcc* (*get_mpcc_for_dpp)(
 			struct mpc_tree *tree,
 			int dpp_id);
 
+	/**
+	 * @wait_for_idle:
+	 *
+	 * Wait for a specific MPCC instance to become idle
+	 *
+	 * Parameters:
+	 * - [in/out] mpc  - MPC context.
+	 * - [in]     id - ID of the MPCC instance to wait for
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
 	void (*wait_for_idle)(struct mpc *mpc, int id);
 
+	/**
+	 * @assert_mpcc_idle_before_connect:
+	 *
+	 * Assert that the specific MPCC instance is ideal before attempting to connect.
+	 *
+	 * Parameters:
+	 * - [in/out] mpc  - MPC context.
+	 * - [in]     mpcc_id - ID of the MPCC instance to check for
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
 	void (*assert_mpcc_idle_before_connect)(struct mpc *mpc, int mpcc_id);
 
 	void (*init_mpcc_list_from_hw)(
-- 
2.34.1

