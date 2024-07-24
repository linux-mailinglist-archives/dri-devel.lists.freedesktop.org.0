Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C165C93B630
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDAE10E784;
	Wed, 24 Jul 2024 17:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NrUfRgPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CDB10E78A;
 Wed, 24 Jul 2024 17:54:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fd9e6189d5so302175ad.3; 
 Wed, 24 Jul 2024 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721843676; x=1722448476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeMvaTqF6nVC8+TTPXCBAeC27R72xrtkyB8OCewfWY4=;
 b=NrUfRgPSsT/4opvgipZH+diKIHmnNxN18AfACIrDQVnisSV82cfpP637kErN/er+rD
 anEMhZivE9k+wkew2V/lfrFtyAjOHLteJUiok2gOusjpoNe5s0eLjstX3V5MV63+pHWm
 76KbrdpuAzXw5YdMSd4MG7X+WRSX+wzYvQnQbA7k78p+xiyW+RmnHrG1xV/pqWOL5PxE
 0viRoF3MYdlqqVce7uZTJHNIiOpYc7bEAWTsPXXra3sMxKIkzZHi02TcDSCgftnveQgp
 xdw/ZAddCFgfp+TRra1XZXh7bDGwRxnw2pGw/KwV3xYskVy6UYOVbt4Q1uLk83yS288n
 NEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721843676; x=1722448476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeMvaTqF6nVC8+TTPXCBAeC27R72xrtkyB8OCewfWY4=;
 b=sfeXwKRRhI+aa+1Z4XwNHMApjs5KwcNX3s46E1SK8ACl32SljJ/Jj+aYCVie3+Arjv
 qeYS7Ov+yYteDF6yMzjwex2jajZqsgwYqo/LVhUhQ32iwbyazfHz7Brtdx4QB7n4WAyo
 ATIVW//H9TjlDMJvjHLh7/CbKIPc3vLnTXAqFn2MtXHRBUrsNr0jYg1gWGzJhEmtD4tp
 wYkr0yNIU7xpiFEYJdLzVUQzSSp0pClBqv9K1fUu0/fSvt0kOWtgIS8MSu8oHqTAkST9
 Vxq1nyNLhMGlbUTdlqRLS94UlFqz/2lmmqTLIDYTXVAn44UDDW5fk3/+fs2shla26c/h
 1GtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4wfy5evFeO58XDPNYqj74B6aO4sEaHYW8uZQzW1c65OkfUJ+25DOcOD3lI8MBT2IjQtoMls14bdtzT4Ya7eDtNjKKI/Oe1Da9QM8YAd2H
X-Gm-Message-State: AOJu0YzUajszSWG5AqcE9jfE3tRqRuxeFoK9vSLIEUKjp/A6TVNwlvEd
 xkVLANrLlAd22ZN2Y4V20+XVs4YscjVQ3+Sr+K0QOx1a3064SeOp
X-Google-Smtp-Source: AGHT+IFUycfF2BPrsXjk1R8U+2PiWCnVeWgqd/XGw1a2IyeonzKrWsGYZ9XXWG1J32fNw6Xkf6/3Sg==
X-Received: by 2002:a17:902:e812:b0:1fd:69d6:856d with SMTP id
 d9443c01a7336-1fed38607cemr4234205ad.17.1721843674654; 
 Wed, 24 Jul 2024 10:54:34 -0700 (PDT)
Received: from embed-PC.. ([122.161.119.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f25ac88sm97165815ad.6.2024.07.24.10.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 10:54:34 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, marcelomspessoto@gmail.com, aurabindo.pillai@amd.com,
 adnelson@amd.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drm/amd/display: Fix documentation warning for mpc.h
Date: Wed, 24 Jul 2024 23:24:23 +0530
Message-Id: <20240724175423.18075-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix documentation compile warning by adding description
for program_3dlut_size function.

Remove the following warning:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1043: warning: Function parameter or struct member 'program_3dlut_size' not described in 'mpc_funcs'

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 40a9b3471208..615c69d966e7 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1039,7 +1039,21 @@ struct mpc_funcs {
 	*/
 	void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID id, const enum MCM_LUT_XABLE xable,
 			bool lut_bank_a, int mpcc_id);
-	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
+	/**
+	 * @program_3dlut_size:
+	 *
+	 * Program 3D LUT size.
+	 *
+	 * Parameters:
+	 * - [in/out] mpc - MPC context.
+	 * - [in] is_17x17x17 - Boolean Flag.
+	 * - [in] mpcc_id - MPCC physical instance.
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
+	 void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
 };
 
 #endif
-- 
2.34.1

