Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D998825F7F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 13:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CA910E096;
	Sat,  6 Jan 2024 12:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCC410E096
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 12:42:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d41555f9dso4881075e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704544935; x=1705149735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/0Suv6vzFBcJ+SsSx39OTc6z6wFXvzjX7d7HBkY6jok=;
 b=ZnBvJzCu2BtAdcky+sZlKXAR48UZUdkANtRxsSkAmSkotmbCYQsClQaXA3EYGaE/iM
 V3pMgtX/MkBVQ5WzrNf9RY8exgU6n9kOEQyQRAXfthUJil3BqRQOawIMa05EciWBt6Bx
 u7C8rhIS5QJZul18CrELkyhnmJxYdNI6ZF5XwEVHp8KWjDfsNygwXGYiSBvONa84OFjj
 ZvEm8+2OUSu1wsEe8/MgMn1/p0PsT3iAdScRsFgUvqmhH9Rg7lZEoCDdnqR4XO/Nznsv
 +/QQUtWzoZzCuVRh8kXGsdRbnTNdgbM3cmtarWZ/6FwzwGvfi4qpS4pHfEOkDK1OuJVp
 cHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704544935; x=1705149735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0Suv6vzFBcJ+SsSx39OTc6z6wFXvzjX7d7HBkY6jok=;
 b=pBR9AFZDcBSXuZunY4wmHq5BPMjEuznNE5bDetG4wq+03ru8wav0DSkTyDNkDG+yWn
 xyCeEB2kXEvNX7JHza/9n/lUDebvCTc74oHeCsu5xcxPU8gUhF+tpLP1Dbxhcz5pcH1u
 no5nqUomIA1t2+wFV68xOhbvZYHq/PeDpCVd1GMMW3PoY5DCtiUblE02DtHURHilfFZU
 dVpZtytrnjbB4Xq3JgRsKLsw9r9OJ1ISiRwi7ByF5+7Fdiygu6JBxCTQu+YVIKGOO8R+
 A+/6daQ4Nr0bYWpa8GOKcRzjF0flUMizXutGV2IfRQUmcU0NxtKG8RkiZOZgiET7EPI4
 V6Yg==
X-Gm-Message-State: AOJu0YxcZZXoO8HZVBRXyFfqRFby04XWrrt+h03p2vjHC08J1cbJkbdJ
 SJppHBXKY8Byq+agVkx7OXs=
X-Google-Smtp-Source: AGHT+IFrkzRgV/gv7FAO9JRFh/XcDmwNGvDyTskg1q4LQSQ28sa30tIiulxogkC1T/j5A4oCCi0rqQ==
X-Received: by 2002:a7b:ce90:0:b0:40d:7fbe:e966 with SMTP id
 q16-20020a7bce90000000b0040d7fbee966mr518086wmj.40.1704544934665; 
 Sat, 06 Jan 2024 04:42:14 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b0040d5f466deesm4568664wmq.38.2024.01.06.04.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 04:42:14 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
 Benjamin Dotan <bdotan@habana.ai>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] accel/habanalabs: remove redundant assignment to
 pointer 'input'
Date: Sat,  6 Jan 2024 12:42:13 +0000
Message-Id: <20240106124213.51392-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.i.king@intel.com>

The pointer input is assigned a value that is not read, it is
being re-assigned again later with the same value. Resolve this
by moving the declaration to input into the if block.

Cleans up clang scan build warning:
warning: Value stored to 'input' during its initialization is never
read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@intel.com>
---
 drivers/accel/habanalabs/goya/goya_coresight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
index 41cae5fd843b..3827ea4c02f7 100644
--- a/drivers/accel/habanalabs/goya/goya_coresight.c
+++ b/drivers/accel/habanalabs/goya/goya_coresight.c
@@ -576,7 +576,6 @@ static int goya_config_spmu(struct hl_device *hdev,
 		struct hl_debug_params *params)
 {
 	u64 base_reg;
-	struct hl_debug_params_spmu *input = params->input;
 	u64 *output;
 	u32 output_arr_len;
 	u32 events_num;
@@ -592,7 +591,7 @@ static int goya_config_spmu(struct hl_device *hdev,
 	base_reg = debug_spmu_regs[params->reg_idx] - CFG_BASE;
 
 	if (params->enable) {
-		input = params->input;
+		struct hl_debug_params_spmu *input = params->input;
 
 		if (!input)
 			return -EINVAL;
-- 
2.43.0

