Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E244BB75
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 06:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9C76FC60;
	Wed, 10 Nov 2021 05:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052496FC5E;
 Wed, 10 Nov 2021 05:53:11 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id p8so1243654pgh.11;
 Tue, 09 Nov 2021 21:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LyGojFN74Psdib99ofgTmmS3ryfTtC+JFhiog+TgrPk=;
 b=ThngYRDkGQt/7B2VOWG8P+A2jlEI7zl51h39SDQsT6VW+yMcRYnbiL497063uSki7E
 IcMFmXS1IyaMi2Pf0Twv0tjqsSkBoBz1eVnb41hgNTWJCpwSDR9hDeijlQMXC2PHqTb1
 vLtnCJecNBC7EWKLjBhvTo1Z8QQAhSOLHUTvZF73cQllzW2eSF6LG8qXPVv1nyqb1wOj
 XtjR8KzbTO5KaK2deiYnSVbmvvhs2TsTAdV9vlIzRolvHUqbhY6+3FrNjBhzTUghg0Te
 90nQp+Cqkwb4URA+nh1N6Gl2YdKOO/z84iiZ0QhNRVif6cBA5MkrGPxtYuUcqvgF5eht
 aDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LyGojFN74Psdib99ofgTmmS3ryfTtC+JFhiog+TgrPk=;
 b=r/tc7RFssEqc5dcYhb+a28O++NbYlmlUi0dHNMs8uv9ajz6BueNZTEgrXzPbfIfSay
 V3yav3Zcv9cuC/BSLRIYlhnA4hNwvb8UsTbKQSm3yd77GJl8XPwAws2WQ2z+QGtN1Tgy
 cexH/0mrLYzShCoM4vdHePYVgmRe0NRtW8kY+wIfl8V7L4YwyG3FLuVnR6oKeeuHxQkO
 /Czqb8zCuzKrzb45zw78DCPx46DBCFzl+Jo6W9bqHRHRB9QhsZUbDeCrmjN5zlb5vdz/
 ERQdqN4tb4+XpRDwyIeeTQkIq29Lehzfz53EoBAbZTl+USk8N3OhpVvxQAr4yAHDizDR
 l52A==
X-Gm-Message-State: AOAM5313idAjsx2D2rRHoULyl24xtsCfFYgGi3GsCjpB3qHXc/pCj4sV
 uQIu2htG8u6BucWQkB8V8Xw=
X-Google-Smtp-Source: ABdhPJzzQYRnfFYf2r5U3knJCyJSBudSz80FotI/m9UuQMmpjvonKh1lzwKN3av2iyVBA0LUNF06Zw==
X-Received: by 2002:a63:f644:: with SMTP id u4mr10295033pgj.300.1636523590625; 
 Tue, 09 Nov 2021 21:53:10 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id e15sm20604742pfc.134.2021.11.09.21.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 21:53:10 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: evan.quan@amd.com
Subject: [PATCH] drm/amdgpu: remove unneeded variable
Date: Wed, 10 Nov 2021 05:53:03 +0000
Message-Id: <20211110055303.136782-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: lijo.lazar@amd.com, Jack.Gui@amd.com, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, ran jianping <ran.jianping@zte.com.cn>,
 kenneth.feng@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ran jianping <ran.jianping@zte.com.cn>

Fix the following coccicheck review:
./drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:1174:14-18
:Unneeded variable

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index a4108025fe29..b0bb389185d5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1171,7 +1171,7 @@ static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
 				   enum smu_clk_type clk_type, uint32_t mask)
 {
 	struct amdgpu_device *adev = smu->adev;
-	int ret = 0, size = 0;
+	int ret = 0;
 	uint32_t soft_min_level = 0, soft_max_level = 0, min_freq = 0, max_freq = 0;
 
 	soft_min_level = mask ? (ffs(mask) - 1) : 0;
@@ -1216,7 +1216,7 @@ static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
 	if ((clk_type == SMU_GFXCLK) || (clk_type == SMU_SCLK))
 		amdgpu_gfx_off_ctrl(adev, true);
 
-	return size;
+	return 0;
 }
 
 static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)
-- 
2.25.1

