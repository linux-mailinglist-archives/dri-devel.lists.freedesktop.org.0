Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971E23C6C3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EB76E529;
	Wed,  5 Aug 2020 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2FB89E52;
 Tue,  4 Aug 2020 20:07:09 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w14so15192377ljj.4;
 Tue, 04 Aug 2020 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8X1vD9iMjbD58TZPHKwb4ye5PBWIjmiaZvRTOJ3otNU=;
 b=Ouoh3vaNcVVGD7H1kVwnvrVgU+wwepgvDoAEKRlV+AQ4Tf2O+YsRYKYjqgvyFNQB2o
 eROYCzwN/1rJZ+FMCt2vFYPMrt4X0Rmk9LoreTDEZAGNnFKT6V2YRSqWNc14awRYiFn7
 jEUkw6GM3xGAEjf3AXKOIgEMI3vjKawi3ItOG4+6Jl80xw80/Alin70MWgu/wjlM7d94
 c3jshDgkCYxxIq7vcFA18eAH30zhEryIJTkQW4bINYC9f/+SEEdxx8P4ZJ1UiSuqHgJU
 gVywg7cQU1OOxLn4t8RJCuKJx36zrpwywX8nIm3XL/Rs3oOwMK2kM33iP3Lm8D1toPPn
 YBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8X1vD9iMjbD58TZPHKwb4ye5PBWIjmiaZvRTOJ3otNU=;
 b=QHEC44kTRgfJ7HYrdzKJhJ8CQtFfl5QmIdjNqei6hDOkanC575fLyzVz5OHnfWRJPt
 XUvOQzdi0MbFhiAQs0WLsst1LNOtW4MuysGDA2oQ3C+k019RjGEzY7f3NJpgeKRCgtAC
 u2piB+YkQbXHCxw4cl5leHJ6YKx4hdv4XV5v4K4xYAIITKZ1RMa+rEem8aXPP7R9K+0p
 Wx5d7j+SnzCYsxlkpLeAua7OFnJFVCnNbpI137b59E5a/ohTT9yY6mat7omOK0lOiL1B
 jbcYf/a2yjIcl2ryJaE+J5mqZWJ8MJqmsi11GlKZ9DZUNK99bODdqfYc4x7mgmqzxJVl
 ByZw==
X-Gm-Message-State: AOAM532rrX+IygayrZ4nEV8Q9pYzxkx+eWGJKiaeSMRRSNofxF02/uGE
 dJbVbVLL+GFcQY6x69XYysE=
X-Google-Smtp-Source: ABdhPJx1Y3+zg8EQVx5eowP9zlLeEH4mmso+i3MTOfkpYRGj2nf76AZey+5T5A6YD2go2MiFTnmiCg==
X-Received: by 2002:a2e:a179:: with SMTP id u25mr11596380ljl.101.1596571626718; 
 Tue, 04 Aug 2020 13:07:06 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id g21sm3080020ljh.103.2020.08.04.13.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:07:06 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Subject: [PATCH 1/3] drm/amd/display: Constify dcn20_res_pool_funcs
Date: Tue,  4 Aug 2020 22:06:53 +0200
Message-Id: <20200804200655.30495-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
References: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of dcn20_res_pool_funcs is to assign its address to a
const pointer. Make it const to allow the compiler to put it in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 2a5e7175926a..d7ce984a2ce3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -3320,7 +3320,7 @@ enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_stat
 	return DC_OK;
 }
 
-static struct resource_funcs dcn20_res_pool_funcs = {
+static const struct resource_funcs dcn20_res_pool_funcs = {
 	.destroy = dcn20_destroy_resource_pool,
 	.link_enc_create = dcn20_link_encoder_create,
 	.panel_cntl_create = dcn20_panel_cntl_create,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
