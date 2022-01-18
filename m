Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A76492152
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A247F1128E2;
	Tue, 18 Jan 2022 08:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9062911293D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:37:32 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id hv15so22627760pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 00:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHubPpVUFbRzFLg8T8kDPGraTUFZHSM+yB+IayI7i+s=;
 b=BNVQLfmQk6md7zj5f5A2JZMLlkVY3nsW+rWNMcDQFQSSESG1iJa90hai3eZwmBFsKn
 IrVMI1n4eyrPuICVT8b+BX/szy3mZ/xRbWkq9V6tQ8FhTSadk5weQSMhQvA7y+4Ve78T
 Jq9eRUhJyvV8+eBPuLyvaGXkpEBYcxGDqtObjkINyRsC5Rpeh+jrPgikvbbOodrLWtW9
 9KBVPKwK7PPvNHOKARO3F6N9clDzEP/XvdHUGp/UyT7ZCemmm8AonZIvKt2vqjIcULbN
 boomgfHUy5Y968l+0He/v51djOdv4spkhmPe2t6R6dEtt2mTLdDXz8+XqXKKriiZl9Eo
 ZCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nHubPpVUFbRzFLg8T8kDPGraTUFZHSM+yB+IayI7i+s=;
 b=D+ZyP4IdEZ8GuOQwqj0kfByHXm9QNkGlXqgzQKWm0pKxJ+Qdu5/uyWr7w/mxVEYQQO
 fPtsB4HL3QOZyQCZuoJEc71glFJ4T0TTEPgoovlwW1Zv5ACgbzLTcGV+9QZcC3t2mE5t
 wMjmTo942oznTZT2zAoJE61FeL+pjMJ3H3usfYrA5TMDsrGAIBXNvfRhNqnKKgH184lU
 XaYe6fu4pr1wZvuOZLyaf934F/ZACH56paOYcAuW8DmQXBnM0ftWyZtd/LNBbskEp4SR
 lbYdRlImcsHe75McmCLMy7Ec3crl7Pi7Y2WyMw+ZBteB0IU5Ab6OVzSC+JCl87Dq/5hZ
 ndDA==
X-Gm-Message-State: AOAM530sBXturOFv40bxotKpIsnr9i7frt/EZ/iP4bu5JKj+5cTG4d+r
 lUC9WInzPAsyO4XvYb0RWGzP7+3hpffy5zLS
X-Google-Smtp-Source: ABdhPJzZ58k/3S62+PArMC81nnoj8/jh7NTLeCglvPNuoMj1t8UJHrK1+E/kF7kQg0Ovz0GW78kTbQ==
X-Received: by 2002:a17:90b:1b50:: with SMTP id
 nv16mr17412800pjb.93.1642495051777; 
 Tue, 18 Jan 2022 00:37:31 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id c6sm1775615pjo.39.2022.01.18.00.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 00:37:31 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v4 3/3] drm: remove allow_fb_modifiers
Date: Tue, 18 Jan 2022 17:36:52 +0900
Message-Id: <20220118083652.16335-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118083652.16335-1-etom@igel.co.jp>
References: <20220118083652.16335-1-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The allow_fb_modifiers flag is unnecessary since it has been replaced
with cannot_support_modifiers flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/drm_plane.c                      |  9 ---------
 drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 -
 include/drm/drm_mode_config.h                    | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 5aa7e241971e..89a3d044ab59 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -288,15 +288,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		}
 	}
 
-	/* autoset the cap and check for consistency across all planes */
-	if (format_modifier_count) {
-		drm_WARN_ON(dev, !config->allow_fb_modifiers &&
-			    !list_empty(&config->plane_list));
-		config->allow_fb_modifiers = true;
-	} else {
-		drm_WARN_ON(dev, config->allow_fb_modifiers);
-	}
-
 	plane->modifier_count = format_modifier_count;
 	plane->modifiers = kmalloc_array(format_modifier_count,
 					 sizeof(format_modifiers[0]),
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
index 61b44d3a6a61..f6d66285c5fc 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
@@ -323,7 +323,6 @@ static struct drm_device mock_drm_device = {
 		.max_width = MAX_WIDTH,
 		.min_height = MIN_HEIGHT,
 		.max_height = MAX_HEIGHT,
-		.allow_fb_modifiers = true,
 		.funcs = &mock_config_funcs,
 	},
 };
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index b73af96e2c96..c41df5932a6b 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -917,22 +917,6 @@ struct drm_mode_config {
 	 */
 	bool async_page_flip;
 
-	/**
-	 * @allow_fb_modifiers:
-	 *
-	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
-	 * Note that drivers should not set this directly, it is automatically
-	 * set in drm_universal_plane_init().
-	 *
-	 * IMPORTANT:
-	 *
-	 * If this is set the driver must fill out the full implicit modifier
-	 * information in their &drm_mode_config_funcs.fb_create hook for legacy
-	 * userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
-	 * broken for modifier aware userspace.
-	 */
-	bool allow_fb_modifiers;
-
 	/**
 	 * @fb_modifiers_not_supported:
 	 *
-- 
2.25.1

