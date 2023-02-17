Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9C69A3DA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 03:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EADC10E1A9;
	Fri, 17 Feb 2023 02:25:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAB610E195;
 Fri, 17 Feb 2023 02:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676600704; x=1708136704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IXEZYwGE829U+aq2tJ8/GNxsWC9MqXg5nggZpccwUxw=;
 b=FZuBknv4TiiUDOOhBNpLbR/oyoNI7sDNFztcKdEI1i5lnrVrKa8omBOV
 /QQDd4uPrKfby+hC8cqdgUW4oESKEViuHyTNXy7j9bEsjS1ukMiAu/utR
 y6TYtaKnWYZB+9ga2n3GgQ23j8ybbiT5PEKKnvAaToQVUiDJ3vqmP0UhZ
 HjyBIPWHu84XZMuQhX+WoWbrPtJWiYxQLSNAqez77oUTntd4CcMNyJCHq
 sSUSL+PAJdPwmKl8/nvPXtGTGOqROZr4VDYxZ257bQ2x7aGdR/GLJV6M8
 /rN421Mjc9yVlJjx48zCQCfdH+NjlOJ4p66zGA1LuBkyxSIgNGnYtytek Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334093362"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334093362"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 18:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670389082"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="670389082"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 18:25:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/3] More error capture improvements
Date: Thu, 16 Feb 2023 18:24:17 -0800
Message-Id: <20230217022420.2664116-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Ecodes got lost with the switch to GuC based register lists. Put them
back.

Seqno values got lost with the switch to per context timelines. Put
those back too.

v2: Rework the timeline patch to just read the single seqno value
rather than copying the entire object.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Fix missing ecodes
  drm/i915/guc: Clean up of register capture search
  drm/i915: Include timeline seqno in error capture

 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 27 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gpu_error.c         |  3 +++
 drivers/gpu/drm/i915/i915_gpu_error.h         |  1 +
 3 files changed, 28 insertions(+), 3 deletions(-)

-- 
2.39.1

