Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD802F462B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FA26E0F7;
	Wed, 13 Jan 2021 08:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7322D89C19;
 Tue, 12 Jan 2021 19:57:32 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id w2so2011231pfc.13;
 Tue, 12 Jan 2021 11:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8dVFyFiyF8C+YWyOq836m8QU0axjla2SznTviLPhcFk=;
 b=KhkahF+Q+s5CL6PHq2P1p5hNDDOSnWQVZeJHVkiJzQhVDLAvJhxj8n1E9aK1rgLP+i
 D+GyyNExLtp5vqHuX6XcII2nR2HAhVZ8lkxZwd4reXmQg3exTBn6wTnseA41PObhqgKI
 X5Jnnx7uSDTirc71GLq0F9EZXxJZqur5wErdPlF/qs4NtCir6SGBgne1wRnQjWCib11j
 MvYDBmNdZlu7oLX/ViQbbPVfWB0NVLfcAMTRTy66FUwgs67AVQR+uKE0fMB3TMxEoAOJ
 ZhgSJlPdp1tiT7pk4YaB/179iyH8zmCvUlG4DSvhXQiplw8sE2Ob4oeBhvKbW0TvnMVW
 T1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8dVFyFiyF8C+YWyOq836m8QU0axjla2SznTviLPhcFk=;
 b=rxFsGU/mTp6us8EEyqCk8xRm1tJYq9ebiyfA5wWn8fqDcGZpm0ANv5obL5pcX4Ddkx
 MfVfeCz5/UJKjkSlgnjOUAeglC572ZvMzYRJemYx+nVgl8ha5tXkxWgy9Swf/xZnpo8S
 KMukreeLGNoHVPlPbhPk6hEi3I7gh376cgLw4Tu6pMR8lNVCukB1e4KAwZI7341wFulQ
 SmOw6Th05o9D588xQQ+lvxjfFS71kGR0DdP/ZZZKG+y8HEGz/5kefiAluxfu6EFbQ6P0
 0zF1qw35hkVUgMo9KtkHxB8kodAhwQc6ArxPMdQjnMDOxALN2AQHLzXf/eSVO3LBPfAp
 ryag==
X-Gm-Message-State: AOAM5316pZygyRwGUBRYgcXXsTJt/uIgXxSr1DKYprReVIGL0Rq/4BWs
 tRK0OMGFPcwWaMX8Tb1dNlE=
X-Google-Smtp-Source: ABdhPJxWZJ0yiE0hSvXxmHZNYo4sSoW3/0CiG7pxMwVjn8U2zFJvSb5sR5sDJhAAPd+z95PzYX+sEg==
X-Received: by 2002:aa7:9a07:0:b029:1a6:5f93:a19f with SMTP id
 w7-20020aa79a070000b02901a65f93a19fmr865506pfj.21.1610481451911; 
 Tue, 12 Jan 2021 11:57:31 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.121.136])
 by smtp.gmail.com with ESMTPSA id 11sm4759328pgz.22.2021.01.12.11.57.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 11:57:31 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Xiaojian.Du@amd.com, ray.huang@amd.com, evan.quan@amd.com,
 lijo.lazar@amd.com, Jinzhou.Su@amd.com, Xiaomeng.Hou@amd.com
Subject: [PATCH] drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as static
Date: Wed, 13 Jan 2021 01:27:22 +0530
Message-Id: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kernel test robot throws below warnings ->

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
warning: no previous prototype for 'vangogh_clk_dpm_is_enabled'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
warning: no previous prototype for function 'vangogh_clk_dpm_is_enabled'
[-Wmissing-prototypes]

Mark vangogh_clk_dpm_is_enabled() as static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 75ddcad..3ffe56e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -610,7 +610,7 @@ static int vangogh_get_profiling_clk_mask(struct smu_context *smu,
 	return 0;
 }
 
-bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
+static bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
 				enum smu_clk_type clk_type)
 {
 	enum smu_feature_mask feature_id = 0;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
