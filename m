Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9073889B6
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103206ECE8;
	Wed, 19 May 2021 08:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3686ECE8;
 Wed, 19 May 2021 08:49:48 +0000 (UTC)
IronPort-SDR: 02m4kXmbJFW8i6Na++34LZgcNR6X4PCr396g2rKxXYJSt/uJPdHb7dM70Mno4uVvA6n7M/WRo9
 KQ3jZuFE7/PA==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="264842315"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="264842315"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:49:47 -0700
IronPort-SDR: A3ZuhPoIvJIIdAoaTqts9TxeYrNEf8KE5EMeiILZ3gJCoV+i9djmJYQoUZoL+LRZoPm1PmY9Iq
 JTjcnVdLXZpg==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="473401082"
Received: from akrolak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.37.74])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:49:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dim-tools@lists.freedesktop.org
Subject: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
Date: Wed, 19 May 2021 11:49:32 +0300
Message-Id: <20210519084932.8666-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	dri-devel@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had a stale repo for amd in drm-tip since around v4.15 i.e. for
more than three years. Nobody seems to notice or care. Drop the amd
branches from drm-tip.

Having the current amd branches in drm-tip would be nice to have, if
only to have a common drm integration tree. However, maintaining that
has a cost due to the inevitable conflicts. We can add the branches back
if and when there's interest in sharing the burden.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 nightly.conf | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/nightly.conf b/nightly.conf
index 9211550ef75c..35fb1d9ba600 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -40,12 +40,6 @@ git://anongit.freedesktop.org/drm-misc
 https://anongit.freedesktop.org/git/drm/drm-misc
 https://anongit.freedesktop.org/git/drm/drm-misc.git
 "
-drm_tip_repos[drm-amd]="
-ssh://git.freedesktop.org/git/drm/drm-amd
-git://anongit.freedesktop.org/drm/drm-amd
-https://anongit.freedesktop.org/git/drm/drm-amd
-https://anongit.freedesktop.org/git/drm/drm-amd.git
-"
 drm_tip_repos[drm]="
 ssh://git.freedesktop.org/git/drm/drm
 git://anongit.freedesktop.org/drm/drm
@@ -76,17 +70,14 @@ drm_tip_config=(
 	"drm			drm-fixes"
 	"drm-misc		drm-misc-fixes"
 	"drm-intel		drm-intel-fixes"
-	"drm-amd		drm-amd-fixes"
 
 	"drm			drm-next"
 	"drm-misc		drm-misc-next-fixes"
 	"drm-intel		drm-intel-next-fixes"
-	"drm-amd		drm-amd-next-fixes"
 
 	"drm-misc		drm-misc-next"
 	"drm-intel		drm-intel-next"
 	"drm-intel		drm-intel-gt-next"
-	"drm-amd		drm-amd-next"
 
 	"sound-upstream		for-linus"
 	"sound-upstream		for-next"
-- 
2.20.1

