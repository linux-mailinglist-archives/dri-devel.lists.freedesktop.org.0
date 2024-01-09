Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205C82889E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6355510E481;
	Tue,  9 Jan 2024 15:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683810E46E;
 Tue,  9 Jan 2024 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704812445; x=1736348445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n/UkLKv0HswBXjjuShhHXlbm0pQPFw9AL0Mj5AYf39c=;
 b=dXrpVrHS2/DjLEeu0ClNehTpXLAnsBadgBngOTAfEYyUs83f6PilhK0U
 x/Dor47fm3I1hxho7+Ga2zBb7sIJ3zl9AolwfAjK5rqpbzZo9+33wb9Kq
 /guMiwcufIJUhivxr67HBJ8nQheLwQqD/FfcvymTCQMaUq2UrQ5Pil6wz
 apbploz3T3NNZ09tJylMS5SjH9iHRWgOejwvZGwwtEIexDOE4IBsjwSN6
 2XLtghQz2RvgZaxMf9doiafsG+LCOZc8OaiCWtaQe0mcNBytK6QwfzHHI
 DtJBlae6VKRB6kjIo/ROaf9IOOaZvevfOtSfrFmK7l37OyplQJ6gzHF30 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4964750"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="4964750"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="905179124"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="905179124"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:00:42 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nightly.conf: Reorder the xe repo URLs
Date: Tue,  9 Jan 2024 16:00:15 +0100
Message-ID: <20240109150015.193368-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Select the https URL by default for xe since users may not have
registered a gitlab ssh key yet, and may get confused by
the corresponding error message.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 nightly.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nightly.conf b/nightly.conf
index accd3ff2cc39..84dbdb98a99f 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -25,8 +25,8 @@ https://anongit.freedesktop.org/git/drm/drm-tip
 https://anongit.freedesktop.org/git/drm/drm-tip.git
 "
 drm_tip_repos[drm-xe]="
-ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
 https://gitlab.freedesktop.org/drm/xe/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
 "
 drm_tip_repos[drm-intel]="
 ssh://git.freedesktop.org/git/drm/drm-intel
-- 
2.43.0

