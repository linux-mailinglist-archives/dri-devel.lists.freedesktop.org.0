Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0EA86B12B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972210E3E6;
	Wed, 28 Feb 2024 14:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKlGXiMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CE610E17A;
 Wed, 28 Feb 2024 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709128956; x=1740664956;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=V7Ggcv2ZTkUoR2yVAyXgzNA8oxhOyU++JWqxChpJWF0=;
 b=bKlGXiMvGdLmWT21k8lKLpVgwE4QOaLDDBo6cJ8fxR1jlFRXcJqO29Vu
 Ihgo9P9bH1rWSQP+I7owTyFZtbfliN2MZh/fmD0GlT+TQrluHx4O6oth5
 tiG0/z8BjRT355kqm0OlN3Vx2CHwMr3W6Tzub1FeaXoOISZ+zVkNPfLEd
 1eB1lljwf36xnRgcSG7QAqDdDqiOwDmj02qr3khlLjZqS669kyGgpsAkS
 OLLH35pUIBy259XeZetE6F3BUK/IsqlxYD+OIgp1/XSfW1mi4ArvjWBwk
 xUJsNzu5WB6lBON85x1q7iOlTaD3Qn5pXpyCIcf6oPJeqKkQVN+cAnSsN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25992732"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25992732"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="44974981"
Received: from mcox1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.233.55])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:02:31 -0800
Date: Wed, 28 Feb 2024 14:02:29 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <Zd889Wvu/ZKZSK4/@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave, Sima,

Last drm-intel-gt-next pull request for 6.9.

There are only two small fixes in there so could also wait for the
-next-fixes round if so would be preferred. One fix is for a kerneldoc
warning and other for a very unlikely userptr object creation failure
where cleanup would oops.

Regards,

Tvrtko

drm-intel-gt-next-2024-02-28:
Driver Changes:

Fixes:

- Add some boring kerneldoc (Tvrtko Ursulin)
- Check before removing mm notifier (Nirmoy
The following changes since commit eb927f01dfb6309c8a184593c2c0618c4000c481:

  drm/i915/gt: Restart the heartbeat timer when forcing a pulse (2024-02-14 17:17:35 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2024-02-28

for you to fetch changes up to db7bbd13f08774cde0332c705f042e327fe21e73:

  drm/i915: Check before removing mm notifier (2024-02-28 13:11:32 +0000)

----------------------------------------------------------------
Driver Changes:

Fixes:

- Add some boring kerneldoc (Tvrtko Ursulin)
- Check before removing mm notifier (Nirmoy

----------------------------------------------------------------
Nirmoy Das (1):
      drm/i915: Check before removing mm notifier

Tvrtko Ursulin (1):
      drm/i915: Add some boring kerneldoc

 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
 include/uapi/drm/i915_drm.h                 | 4 ++++
 2 files changed, 7 insertions(+)
