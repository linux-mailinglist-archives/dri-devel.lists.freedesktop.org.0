Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D435B8CF1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5DF10E02E;
	Wed, 14 Sep 2022 16:27:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462710E02E;
 Wed, 14 Sep 2022 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663172853; x=1694708853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XOVJfqxTH9kERhADUfgD2vMvQhn9Gxnxv80ROt6OdLs=;
 b=oBsErWlSOZ1tQJe0jScFmaCM4Vj6eoVqg11/OEd4bR4rBYTyPWy+/XOa
 sQP/rRIt/x90w099q6fk+p8hRMDx1qBfjsLyeVGn6ayS+ZAeGnYOfrcQk
 K31wU72GwKuT7qP/zde0d2pUN+tZ8UPiZl3uaha5q8AxlLO/kqElFgP9+
 EjpkF2TpfMuacxEDaJw4tgftdfhu5zdDl0bw3gpVCAC3Mb/ToqlbIXOc3
 Pz2BertND7RkViIg6rMWyNPOaJ6MKKoFVafgC7THAcprYI4IbKnRJ7ciT
 xL4we+l8cBW4b3RWdJJReVsR5vZnaO5lWy2zv6wgw5z/15O9TYsoOPj8u g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278861649"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="278861649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 09:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="679117614"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by fmsmga008.fm.intel.com with ESMTP; 14 Sep 2022 09:26:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/1] Update to version reduced firmware file names
Date: Wed, 14 Sep 2022 09:27:21 -0700
Message-Id: <20220914162722.151756-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

Start using GuC/HuC firmware files with reduced version information in
the file name.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/uc: Enable version reduced firmware files for newest
    platforms

 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.37.3

