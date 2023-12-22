Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DD81C943
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 12:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F4B10E0FE;
	Fri, 22 Dec 2023 11:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96D10E041;
 Fri, 22 Dec 2023 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703245017; x=1734781017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2D2Qgc8BPJtZuPYl8rwgFbDHsMW8Yzq5njClGEd5kfo=;
 b=Zqf7IcnsWRvlwofrZmOCJwsyH7VNcATfN9HxkatUZdz833KFjfx3FFJi
 3sGH/Oh9zoaI+ImVUMDwLcyePX4srjWXlO0rjlK99BJkosKF0QVbyoEJi
 uh1bjwdbeOzLSwxIcAdyFisT+9cODFlKAdHRpwejILY/sXJ3gkpXJhxrb
 cdVuwHnEAXABseqSC2jDxgevQh+SCsVYQm+E6oTIolctmr/aAWjs+qWUr
 tiaO890KNSWQqafBbeeY95EZ0BFABQdoV1jpno6I3a9BBn2S52p4v1ji5
 lfZnb+Ya7/x3kHfHCQ4sB3pH4AxkbrLurv/tFOqpnXgMin8Oaq/LeDlqF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="398892435"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="398892435"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 03:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="770266895"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="770266895"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.207])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 03:36:54 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] nightly.conf: Add the xe repo to drm-tip
Date: Fri, 22 Dec 2023 12:36:39 +0100
Message-ID: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the xe repo to drm-tip and the dim tools.
For now use the sha1 of the first drm-xe-next pull request for drm-tip,
since that branch tip is currently adapted for our CI testing.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: daniel.vetter@ffwll.ch
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dim-tools@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 nightly.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/nightly.conf b/nightly.conf
index 24126b61b797..accd3ff2cc39 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
 https://anongit.freedesktop.org/git/drm/drm-tip
 https://anongit.freedesktop.org/git/drm/drm-tip.git
 "
+drm_tip_repos[drm-xe]="
+ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
+https://gitlab.freedesktop.org/drm/xe/kernel.git
+"
 drm_tip_repos[drm-intel]="
 ssh://git.freedesktop.org/git/drm/drm-intel
 ssh://git.freedesktop.org/git/drm-intel
@@ -65,14 +69,17 @@ drm_tip_config=(
 	"drm			drm-fixes"
 	"drm-misc		drm-misc-fixes"
 	"drm-intel		drm-intel-fixes"
+	"drm-xe			drm-xe-fixes"
 
 	"drm			drm-next"
 	"drm-misc		drm-misc-next-fixes"
 	"drm-intel		drm-intel-next-fixes"
+	"drm-xe			drm-xe-next-fixes"
 
 	"drm-misc		drm-misc-next"
 	"drm-intel		drm-intel-next"
 	"drm-intel		drm-intel-gt-next"
+	"drm-xe			drm-xe-next b6e1b7081768"
 
 	"drm-intel		topic/core-for-CI"
 	"drm-misc		topic/i915-ttm"
-- 
2.42.0

