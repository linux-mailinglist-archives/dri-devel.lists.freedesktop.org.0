Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BCAA763F8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 12:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD110E3BF;
	Mon, 31 Mar 2025 10:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YU5wCZY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252FB10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743416254; x=1774952254;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=P3ae9o2zkDLTx09+K++AB9fYk/TKSV28NS5F5x/wtcU=;
 b=YU5wCZY2nwB3WU/dhushPENET5xZTYrWbbNAa89D/vwhqMsaPuR+qTri
 K/H4PmtBC5uOammVTS/FVIs28XHmrSOI8LIPcfDEtCkXCnhx7rZLZSry1
 fUgecG0CmQBfvXm52ZApn/YM/i46pF6rMfC31DsWw2klJjwdG81cWMzwE
 lNQK/8k5tRzfxT97RJD1K5QakOVeumYHpgxif2Fi3TIeEw1L/EkaGtfS+
 YqZDrl+XBQvVvn3Rc+1Vd4quFAnekxRDH1zeOqyirxArgqL2MDBjKT4an
 dBWOntcDGya3dMVzTSJMjVXijE/01erLYN7Z6sdCOCdgjYlSca3QBcPKK Q==;
X-CSE-ConnectionGUID: BrLlE++jRCaQK2ijdGDo/w==
X-CSE-MsgGUID: Py3zSES4TsWYHhVF5nJcvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48364532"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48364532"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:17:33 -0700
X-CSE-ConnectionGUID: paWjvvQDQ7OT5YVewgiQLg==
X-CSE-MsgGUID: rMYsm2X9R4++SHo22bhuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="157057222"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:17:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>
Cc: simona.vetter@ffwll.ch, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
Date: Mon, 31 Mar 2025 13:17:28 +0300
Message-ID: <87h6394i87.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 28 Mar 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> If you want to do that hdrtest thing, do it as part of your *own*
> checks. Don't make everybody else see that disgusting thing and have
> those turds in their trees.
>
> I'll just disable it by marking it BROKEN for now. You guys can figure
> out what you want to do, but no, forcing others to see those things is
> not the answer.

Fair. I hear you.

> I would suggest you *not* make this part of the Kconfig setup and
> normal build at all, but be something where *you* can run it as part
> of your tests (ie do it as a "make drm-hdrtest" kind of thing, not as
> part of regular builds).

I would very much prefer for this to be part of the build, just hidden
behind Kconfig. We're doing build-time checks, and kbuild gives us all
the machinery to make it happen. Without the dependency tracking you'd
have to check everything every time, and that's just going to mean
people won't run it.

I suggest a Kconfig knob to truly make this opt-in, only for developers
who actually want it. Not enabled by allmodconfig or allyesconfig or
even allnoconfig. Only if you manually enable it. And yes, that's how it
should've been from the start. My bad.

Below's a patch to make it happen. We'll probably want to add more
checks like this in the future. We want to catch a whole bunch of build
issues up front. We want to be clean of e.g. W=1 and kernel-doc issues
pre-merge instead of doing extra rounds of fixes afterwards.

BR,
Jani.



From 8c709510caab4b4ad6aa73cbcd972f32b58cad8d Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Mon, 31 Mar 2025 12:25:45 +0300
Subject: [PATCH] drm: add config option for extra build-time checks
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Jani Nikula <jani.nikula@intel.com>

The DRM subsystem contains additional build-time checks, primarily aimed
at DRM developers and CI systems. The checks may be overzealous. They
may slow down or fail the build altogether. They may create excessive
dependency files in the build tree. They should not be enabled for
regular builds, and certainly not forced on unsuspecting developers
running an allyesconfig or allmodconfig build.

Add config DRM_DISABLE_EXTRA_BUILD_CHECKS, enabled by default as well as
by allyesconfig/allmodconfig, hiding the extra checks from anyone but
people who intentionally opt-in for the checks.

For example, to enable header tests:

$ scripts/config --disable CONFIG_DRM_DISABLE_EXTRA_BUILD_CHECKS --enable CONFIG_DRM_HEADER_TEST
$ make olddefconfig

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com
Fixes: 62ae45687e43 ("drm: ensure drm headers are self-contained and pass kernel-doc")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2cba2b6ebe1c..5a3fce9ef998 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -489,9 +489,26 @@ config DRM_PRIVACY_SCREEN
 	bool
 	default n
 
+# Reversed option to disable on allyesconfig/allmodconfig builds
+config DRM_DISABLE_EXTRA_BUILD_CHECKS
+	bool "Disable DRM subsystem extra build-time checks"
+	default y
+	help
+	  The DRM subsystem contains additional build-time checks, primarily
+	  aimed at DRM developers and CI systems. The checks may be
+	  overzealous. They may slow down or fail the build altogether. They may
+	  create excessive dependency files in the tree. They should not be
+	  enabled for regular builds, and thus they are disabled by default.
+
+# Proxy config to allow simple "depends on DRM_EXTRA_BUILD_CHECKS"
+config DRM_EXTRA_BUILD_CHECKS
+	bool
+	depends on DRM && EXPERT && DRM_DISABLE_EXTRA_BUILD_CHECKS=n
+	default !DRM_DISABLE_EXTRA_BUILD_CHECKS
+
 config DRM_WERROR
 	bool "Compile the drm subsystem with warnings as errors"
-	depends on DRM && EXPERT
+	depends on DRM_EXTRA_BUILD_CHECKS
 	depends on !WERROR
 	default n
 	help
@@ -505,7 +522,7 @@ config DRM_WERROR
 
 config DRM_HEADER_TEST
 	bool "Ensure DRM headers are self-contained and pass kernel-doc"
-	depends on DRM && EXPERT && BROKEN
+	depends on DRM_EXTRA_BUILD_CHECKS
 	default n
 	help
 	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
-- 
2.39.5


-- 
Jani Nikula, Intel
