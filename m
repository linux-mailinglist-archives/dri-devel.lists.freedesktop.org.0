Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332ACC8C3E4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A2E10E6D6;
	Wed, 26 Nov 2025 22:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mECPE+in";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522010E6D6;
 Wed, 26 Nov 2025 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764197100; x=1795733100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6n8HiP6mBKSIsKBkai+0IV0XJgLqkSPvDK/ma3XwzSE=;
 b=mECPE+in5ZAfw0pIybIlQLSU/ekfc23GqW5ISKWqKEylMnEFTvO3j8Cc
 GRGi24rxQ5Lv/vvvoTQmDPfhOGbTPf38srWOCEwgiDFOnDXhd/v/iDkAC
 KO/IE4rNJDMjK7Qozqwc1pDM6iCsm5TtjNFiDRM6TBn51OzhpYJj+g9ql
 Hd/GaazF/uVifzJuERzFfa/uejHMNt0NNnagCoQ/gqIPT0akOhyadLJcK
 et3prZ97OdlzPOSv1digE88omsRZwCM9SyBkPAHJ/kDy3IdwAMysIThjG
 X4fk3pBGak+/gl2ZIfDwTeGw/gLj+ip2xHeYkb1JfpZN74k37o1Th+vVH A==;
X-CSE-ConnectionGUID: wR2Ker55TXizKi63QGyEow==
X-CSE-MsgGUID: fTulSvP2RWCLv3Cl+cBxrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66190820"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66190820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:45:00 -0800
X-CSE-ConnectionGUID: Xzmr19skQzmB6xX04UiXoA==
X-CSE-MsgGUID: Nox7lstJTqSzF8eoSo+PIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192318006"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:44:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org,
	<intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] MAINTAINERS: Remove myself from xe maintainers
Date: Wed, 26 Nov 2025 14:43:58 -0800
Message-ID: <20251126224357.2482051-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As I'm leaving Intel soon, drop myself from the list of Xe maintainers.
Also update the mailmap to switch to my kernel.org address.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index af6e4fce9bfe1..716c0573db214 100644
--- a/.mailmap
+++ b/.mailmap
@@ -476,6 +476,7 @@ Lorenzo Pieralisi <lpieralisi@kernel.org> <lorenzo.pieralisi@arm.com>
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> <lstoakes@gmail.com>
 Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
 Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
+Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
 Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
 Lance Yang <lance.yang@linux.dev> <ioworker0@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index acc951f122eaf..c3fe83ea713cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12517,7 +12517,6 @@ F:	include/drm/intel/
 F:	include/uapi/drm/i915_drm.h
 
 INTEL DRM XE DRIVER (Lunar Lake and newer)
-M:	Lucas De Marchi <lucas.demarchi@intel.com>
 M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
 L:	intel-xe@lists.freedesktop.org
-- 
2.51.2

