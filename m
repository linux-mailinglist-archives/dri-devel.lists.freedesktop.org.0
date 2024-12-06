Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB29E6881
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EFF10F00C;
	Fri,  6 Dec 2024 08:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="aEUH2iQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D553F10E12C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 04:14:18 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-21594d9f540so2771515ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 20:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733458458; x=1734063258;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0IU9gPKZ0cYpxiTpLI8JVzoAjrjZPxFqYWDg1qG91HQ=;
 b=aEUH2iQZiSmWSzUdjMu3rMkdow9FClLhAFQB4R+qjq5OEnMLFJw+CM8KtQi0gzVu5Q
 3FRMP/uNw8KOtt/qYgT09mBArRtqcshkvyw9W6rUh2fybDP+AK26zLgfLtmyKtRXCNHJ
 FXDbK3L9Pf1xQ1Ap56+K7QLmYKZ49KcRCcOZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733458458; x=1734063258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0IU9gPKZ0cYpxiTpLI8JVzoAjrjZPxFqYWDg1qG91HQ=;
 b=cyl7jfCeZI66F1MzisepTnobBINizgSyLL1XBqrVM9Y7ORNPc5ib3oh/9AdPN8khoj
 oCjMgkxTBQtj8leIBWwUAUwqOPXd9QyDTJxJ+QxYI759Ic6+Cxk6fEpCKLosswCLnfzy
 e4ElO/IVq+d4s9Cr79l2bCmrU6lvWeTRwZRSTpUrDXeOym3XBvD54HtkBOhJjoc39GdA
 B/tdLX4Aw59eSwjGpyZQOJK2IJf09/qPzbaaZ0c0TbFfjOx0TlM7JSGNXGhiQHKbSag6
 POTHBn6rF0RUtZhdpMLRmuN6aZ3PdRvfsC53uWQNmvbleZozsDpcWS4aTPTgaQOH9qn5
 H9ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfImfide7wKsKUtnLw/SaUJTlwTK+xr3hIZXHhJSTMr3UZWB9zyevrdaxv/cw1+3HBy5gQQeY6o/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfSLDDvCOklsFP4O+HybJ5t43YknttKgGhCqpqz0c98iX2LL9k
 79RSIuUQ8oMnHCwpEfhPTXa7MyqlXrjIBbygSrr2xkguHWZffkGmJgBrE6G1dA==
X-Gm-Gg: ASbGncuyWInj6CckPfRa4WtzIdODxJ2w+dVfQ3tIT0ww/2Z7OF5FcO3BDILjGCv8hGH
 wTuZPkebNnKVonfGFJbXp93xQ5yDrQAlVXzYbF2Bk9k5Nt0UyesVvXfxQXcLc9sAUXCXCIy2yJL
 ITw+n3nn4MPUYx4UAC2t9b4Mg33DEL8d2v2qeIfTHJl51srb7URRJ/gtl67Sur664XdNvZJdUKW
 saJLuXg98bTKV2DM31v7FEJsqHgwcSqE+BqjDXGPy4xo6DEdbSC2OatAuy/60A6/C9ltQbi85BZ
 XmZT2DuNmFxZOrFq8vuppg==
X-Google-Smtp-Source: AGHT+IGLQ1YPW/GMhrOQCuIQu21lc9n4+a2xgkTaktnhXR5veCtx5oSsXukViRHArRUmvP9dHaYNNg==
X-Received: by 2002:a17:902:e88f:b0:215:9a73:6c4f with SMTP id
 d9443c01a7336-21614d5365fmr7802885ad.6.1733458458137; 
 Thu, 05 Dec 2024 20:14:18 -0800 (PST)
Received: from kk-ph5.. ([192.19.161.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8e3e8afsm20079925ad.18.2024.12.05.20.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 20:14:17 -0800 (PST)
From: Keerthana K <keerthana.kalyanasundaram@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, dillon.varone@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com,
 Sasha Levin <sashal@kernel.org>,
 Keerthana K <keerthana.kalyanasundaram@broadcom.com>
Subject: [PATCH v5.10-v6.1] drm/amd/display: Check BIOS images before it is
 used
Date: Fri,  6 Dec 2024 04:14:14 +0000
Message-Id: <20241206041414.4013356-1-keerthana.kalyanasundaram@broadcom.com>
X-Mailer: git-send-email 2.39.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 08:12:04 +0000
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 8b0ddf19cca2a352b2a7e01d99d3ba949a99c84c ]

BIOS images may fail to load and null checks are added before they are
used.

This fixes 6 NULL_RETURNS issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Keerthana K <keerthana.kalyanasundaram@broadcom.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 9b8ea6e9a..0f686e363 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -664,6 +664,9 @@ static enum bp_result get_ss_info_v3_1(
 
 	ss_table_header_include = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V3,
 		DATA_TABLES(ASIC_InternalSS_Info));
+	if (!ss_table_header_include)
+		return BP_RESULT_UNSUPPORTED;
+
 	table_size =
 		(le16_to_cpu(ss_table_header_include->sHeader.usStructureSize)
 				- sizeof(ATOM_COMMON_TABLE_HEADER))
@@ -1031,6 +1034,8 @@ static enum bp_result get_ss_info_from_internal_ss_info_tbl_V2_1(
 
 	header = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V2,
 		DATA_TABLES(ASIC_InternalSS_Info));
+	if (!header)
+		return result;
 
 	memset(info, 0, sizeof(struct spread_spectrum_info));
 
@@ -1104,6 +1109,8 @@ static enum bp_result get_ss_info_from_ss_info_table(
 	get_atom_data_table_revision(header, &revision);
 
 	tbl = GET_IMAGE(ATOM_SPREAD_SPECTRUM_INFO, DATA_TABLES(SS_Info));
+	if (!tbl)
+		return result;
 
 	if (1 != revision.major || 2 > revision.minor)
 		return result;
@@ -1631,6 +1638,8 @@ static uint32_t get_ss_entry_number_from_ss_info_tbl(
 
 	tbl = GET_IMAGE(ATOM_SPREAD_SPECTRUM_INFO,
 			DATA_TABLES(SS_Info));
+	if (!tbl)
+		return number;
 
 	if (1 != revision.major || 2 > revision.minor)
 		return number;
@@ -1711,6 +1720,8 @@ static uint32_t get_ss_entry_number_from_internal_ss_info_tbl_v2_1(
 
 	header_include = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V2,
 			DATA_TABLES(ASIC_InternalSS_Info));
+	if (!header_include)
+		return 0;
 
 	size = (le16_to_cpu(header_include->sHeader.usStructureSize)
 			- sizeof(ATOM_COMMON_TABLE_HEADER))
@@ -1748,6 +1759,9 @@ static uint32_t get_ss_entry_number_from_internal_ss_info_tbl_V3_1(
 
 	header_include = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V3,
 			DATA_TABLES(ASIC_InternalSS_Info));
+	if (!header_include)
+		return number;
+
 	size = (le16_to_cpu(header_include->sHeader.usStructureSize) -
 			sizeof(ATOM_COMMON_TABLE_HEADER)) /
 					sizeof(ATOM_ASIC_SS_ASSIGNMENT_V3);
-- 
2.39.4

