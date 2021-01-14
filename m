Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864EB2F5B96
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 08:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8E89E69;
	Thu, 14 Jan 2021 07:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414089B33;
 Thu, 14 Jan 2021 07:53:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 317DC23A1D;
 Thu, 14 Jan 2021 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610610830;
 bh=idK8XxiiyoaOs4dRWdbCzNyTgXtfNWQ9SoHpDwL3m2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b8dswQE7d/kB9wq8ybsSfUBXKKkwU+3so8XJ12vaHCSCAOzrG/sIRTcotmO+FIOzz
 1vYZ9ljGc1MW0Dj8OJg8cwTbG7ah/bKjkBpZS81UQc9bIZT7kpwEtysxp9kyeC8YNj
 BMMhNdj1HDHIU9lKBErMLGWf4PUEUI/PXXdnQHHtLit/GTocSZ6mEiu4Nylnqtzsul
 ksCxayncQ43o2mIIT9YzYNt5rl3Nf9z6BzewjVkiJbV7Q+HxaIxb1oeDssyR4stJ7v
 EYAIbYlNrw8cYi6Lm52mUAvcyXiJjjdqMR0SlsYePai6Os9DQUGBzvjpx8uYG1+sIY
 /zv635ZwB6Tmw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzxRz-00EPuD-9C; Thu, 14 Jan 2021 08:53:47 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 06/10] drm: amd: amdgpu_dm.h: fix a wrong kernel-doc markup
Date: Thu, 14 Jan 2021 08:53:41 +0100
Message-Id: <8e16f3aa553786cd193e49882ce5131e3769afb8.1610610444.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610610444.git.mchehab+huawei@kernel.org>
References: <cover.1610610444.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Eryk Brol <eryk.brol@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a missing colon, causing the markup to be ignored,
solving those warnings:

	../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:340: warning: Incorrect use of kernel-doc format:          * @active_vblank_irq_count
	../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:379: warning: Function parameter or member 'active_vblank_irq_count' not described in 'amdgpu_display_manager'

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index f084e2fc9569..5ee1b766884e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -337,7 +337,7 @@ struct amdgpu_display_manager {
 	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
 
 	/**
-	 * @active_vblank_irq_count
+	 * @active_vblank_irq_count:
 	 *
 	 * number of currently active vblank irqs
 	 */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
