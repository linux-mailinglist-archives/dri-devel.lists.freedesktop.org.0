Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E055BFE5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9153D12B1D9;
	Tue, 28 Jun 2022 09:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EAD12B1CA;
 Tue, 28 Jun 2022 09:46:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA81E6182C;
 Tue, 28 Jun 2022 09:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77708C341EE;
 Tue, 28 Jun 2022 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656409590;
 bh=KmE1n0kBTzhMcDi/Es4qlC1RvvMz696gfPuCpCdCwXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gwuiQNtLKte3nUdoCxdKSDOuRdlj/40+1HS65mhF7M/yFot3TsdTn7O24tvybSWgC
 W8ISK3Ms8GdYha5G8nCAt23Yoswo5flJ6O7ezyLVvU+w/yIfP5bYo2xCXCIvS9hmrb
 S759Ga4sNfLrqyuwTyZZm/4mersiFwGydZr9UQPPhYtZJWpUAOv+X4uX19/5REBqjI
 1Qb/C2iiZ9mWBoXMilbVTGb1KIP4iaxbGqJ+AVrR7tl2cbPtQ5DYRptfDeEkfBxfo8
 gBjJPj0o96jsYKUX719G8Rq+8DKqK3LZH9jxhS1gPPZy9ZzwV9cbT401X7Z3UFIz4+
 tzfM/QEtoo3xg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o67nf-005HFG-Rk;
 Tue, 28 Jun 2022 10:46:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 11/22] drm: amd: amd_shared.h: Add missing doc for
 PP_GFX_DCS_MASK
Date: Tue, 28 Jun 2022 10:46:15 +0100
Message-Id: <3aee446a0e396fe3f338f270746939f6e803a4de.1656409369.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656409369.git.mchehab@kernel.org>
References: <cover.1656409369.git.mchehab@kernel.org>
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
Cc: Evan Quan <evan.quan@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This symbol is missing documentation:

	drivers/gpu/drm/amd/include/amd_shared.h:224: warning: Enum value 'PP_GFX_DCS_MASK' not described in enum 'PP_FEATURE_MASK'

Document it.

Fixes: 680602d6c2d6 ("drm/amd/pm: enable DCS")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/

 drivers/gpu/drm/amd/include/amd_shared.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index bcdf7453a403..2e02a6fc1717 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -193,6 +193,7 @@ enum amd_powergating_state {
  * @PP_ACG_MASK: Adaptive clock generator.
  * @PP_STUTTER_MODE: Stutter mode.
  * @PP_AVFS_MASK: Adaptive voltage and frequency scaling.
+ * @PP_GFX_DCS_MASK: GFX Async DCS.
  *
  * To override these settings on boot, append amdgpu.ppfeaturemask=<mask> to
  * the kernel's command line parameters. This is usually done through a system's
-- 
2.36.1

