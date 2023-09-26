Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F47AE79D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247A910E367;
	Tue, 26 Sep 2023 08:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71410E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5889ACE0628
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0309C433C9;
 Tue, 26 Sep 2023 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716031;
 bh=tr50ODn4xLi0WPzL73tIwSx34xkSXd0njW0b++RwK7A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Kq+5t1H1RqRZ7/wfRgoMtkAfWgZfRarFun74Y/EOoE/bL1/tbdSyOvbYZbQWVtHN9
 o+3n+7m+0cr3Z2tzmMCDp5FGAAGDQPFJpTFZovNmIFDykj307HiaHew4HLkIIUXy4H
 mttE0LUr2Oi+c4RKzS6PdV1Vnlstva0pROLHRYXcZp7KWMIYWEly6ZKGOLnXL4tbzq
 lryQwjFv89mr28563UU0FssZbNdq+NGIDrGGyStsICfWDLnAAAXZlWS04KSXkTdsPQ
 zTGb8CR8D2a+822TYO7hw99/2AeF7wtiGYrdCIWEzdlRNuPZhgapdUuwU9zL/YVk4z
 Yrx5y/KwDlP/Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] accel/habanalabs: minor cosmetics update to trace file
Date: Tue, 26 Sep 2023 11:13:38 +0300
Message-Id: <20230926081345.240927-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
References: <20230926081345.240927-1-ogabbay@kernel.org>
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

- Update copyright years
- Add missing newline at end of file

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/trace/events/habanalabs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/habanalabs.h b/include/trace/events/habanalabs.h
index 0d3667399d01..cf85753a33b1 100644
--- a/include/trace/events/habanalabs.h
+++ b/include/trace/events/habanalabs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2016-2021 HabanaLabs, Ltd.
+ * Copyright 2022-2023 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -209,3 +209,4 @@ DEFINE_EVENT(habanalabs_reg_access_template, habanalabs_elbi_write,
 
 /* This part must be outside protection */
 #include <trace/define_trace.h>
+
-- 
2.34.1

