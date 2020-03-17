Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332A18873F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280516E5AE;
	Tue, 17 Mar 2020 14:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB991898C4;
 Tue, 17 Mar 2020 07:51:34 +0000 (UTC)
Date: Tue, 17 Mar 2020 07:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1584431492;
 bh=EMEzGbH6WJQeMEfxN2A/GbEd2U+BF9wqqyChVAQMkhE=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=JPgYX9TLqIoTOB7e7l2l6ATtohqNCUVI1trv340NRMugeAsRquBaoHRfaauHFCwQV
 yILKLrmsiEBt73+YXTJqXtLKqEdqPjMZMbrHDcYm4e/xuhXcLa4Q49zi1beD/IWdWS
 fPJO/0OqEwrTFjNVh1JElFyygc1T8K+NKuX/06JA=
To: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] Remove stable HAINAN board from max_sclk override check in
 radeon and amdgpu modules
Message-ID: <SXhX80OoFKMCVNQM9khl9rN_3bsGdi2f6kiyvATRPj9w6_VqgIMqDqd5pPYK3OMFlHFaW1ln8wYqg2DXk4yyZIHJHeaCoaYj8EMmR52vf1U=@protonmail.com>
Feedback-ID: v3gTakqywBIYXeKntrQ6yy6583pNqH_nSJEjbgzjmBjMaZTDq3nLe0D-jSYppQY2NgolnS_R3Ad-LHjkRMDnTQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/gpu/drm/amd/amdgpu/si_dpm.c | 1 -
 drivers/gpu/drm/radeon/si_dpm.c     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
index 4cb4c891120b..0860e85a2d35 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
@@ -3439,7 +3439,6 @@ static void si_apply_state_adjust_rules(struct amdgpu_device *adev,

 	if (adev->asic_type == CHIP_HAINAN) {
 		if ((adev->pdev->revision == 0x81) ||
-		    (adev->pdev->revision == 0x83) ||
 		    (adev->pdev->revision == 0xC3) ||
 		    (adev->pdev->device == 0x6664) ||
 		    (adev->pdev->device == 0x6665) ||
diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index 05e8b4d0af3f..2cb85dbe728f 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -2979,7 +2979,6 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,

 	if (rdev->family == CHIP_HAINAN) {
 		if ((rdev->pdev->revision == 0x81) ||
-		    (rdev->pdev->revision == 0x83) ||
 		    (rdev->pdev->revision == 0xC3) ||
 		    (rdev->pdev->device == 0x6664) ||
 		    (rdev->pdev->device == 0x6665) ||
--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
