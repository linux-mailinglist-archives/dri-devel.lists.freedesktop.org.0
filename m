Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25151516E8A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 13:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D38F10E2BA;
	Mon,  2 May 2022 11:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5810E2B7;
 Mon,  2 May 2022 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651489760; x=1683025760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B/rB1jUJP2W0ytvS+5FKU2xWD0bqN+24YHxaG2w1ITQ=;
 b=NbEnv5KyowQp6juCnwPk2xeusgaCgP1/Ad6wTAbaWPYZKN0p19Sw0Six
 pdZvGD11P+XPH9BcMFyyoCx8GTSM46D8rDbikbwFyzn8xbb0YtN49eIu7
 p00dL7M3go/gUQreJydLACG960LjHF+scLpEeWRjbyxrG+CiHCvMQ3/Sy
 01g5/SFbpGk9xNcZCoGRQt6kaQvoU/iV/iiNIpWkQBxM06ZsEKSBC6hGS
 /TgvZrOgk5lPqv30F1Y94Xfli1dtY9fY22jZRvfNYs0/UtsOoDaXuviIJ
 vZmRT3cFaz6JkBlz2iYn7PV3VwumA4LmfUxYaDzk/i39+OwaN8HmFNOwP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="254632152"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="254632152"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 04:09:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="535800049"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 04:09:00 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/4] lrc selftest fixes
Date: Mon,  2 May 2022 16:39:59 +0530
Message-Id: <20220502111003.32397-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few bug fixes for lrc selftest.

v4:
  Gen8 don't have per engine recording of BB_OFFSET [Chris]

Chris Wilson (4):
  drm/i915/gt: Explicitly clear BB_OFFSET for new contexts
  drm/i915/selftests: Check for incomplete LRI from the context image
  drm/i915/selftest: Always cancel semaphore on error
  drm/i915/selftest: Clear the output buffers before GPU writes

 drivers/gpu/drm/i915/gt/intel_engine_regs.h |   1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         |  20 ++++
 drivers/gpu/drm/i915/gt/selftest_lrc.c      | 115 ++++++++++++++++----
 3 files changed, 116 insertions(+), 20 deletions(-)

-- 
2.20.1

