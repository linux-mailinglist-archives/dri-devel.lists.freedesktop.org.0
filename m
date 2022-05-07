Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF651E42F
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 06:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C460F112418;
	Sat,  7 May 2022 04:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB46112418;
 Sat,  7 May 2022 04:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651899525; x=1683435525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RhW7KOANVi4jHtwrhVxYBUpMpTe42hm5tPRgt9BPsrk=;
 b=csWSGNWHyJmp68ZhFKzOK/YIbCK18d7GX3PXado8Ip8D6v5sA+sMNwOT
 8zaFBTq2y7TceQJPKy5gZ2gO9RKWoepWRBppi+3OM3YWHwnafnMsnext1
 m8HPRJEK5tdJKzrnbH87l/66eHtNOqtfHJ3speD7pTdBAGMKi2D4kCBRQ
 LevgH/vG90uhnrm7wV5dMpnNTxc0ntXfDTMywfRdtpVZarHlbaFhX1aKF
 0dH1aRBnjgk3yIqfhkM8EaiPgea56/siSNeU3JejM//F+86LGwm23BQkk
 4JA6SL9loP0i2Y2K1Yf+kJMDQQeTeVuJ4m2bT7UG/tsS6FdNDTcnCletc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="329199725"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="329199725"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 21:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="633249416"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 06 May 2022 21:58:43 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] Remove unnecessary GuC err capture noise
Date: Fri,  6 May 2022 21:58:46 -0700
Message-Id: <20220507045847.862261-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series remove unnecessary GuC err capture noise.

Alan Previn (1):
  drm/i915/guc: Remove unnecessary GuC err capture noise

 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 77 +------------------
 1 file changed, 2 insertions(+), 75 deletions(-)

-- 
2.25.1

