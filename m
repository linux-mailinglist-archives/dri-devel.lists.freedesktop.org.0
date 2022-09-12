Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835625B6469
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 01:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157010E488;
	Mon, 12 Sep 2022 23:54:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B510E44D;
 Mon, 12 Sep 2022 23:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663026886; x=1694562886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HVbunkcWEuXOF44PK9KRYdYqFtUoGhcyAPPwPEi3MOw=;
 b=DHEVJ6r/hEjeeS/1RUGyB9hjNVEMhw+QjB7m6rKYZFJVuBkRyiWwE+9B
 9eRk2bhcs9zIb4CrovBknN+FEjlfXumG8LKdj+ovvHrip4d7OrwZ2mXQ+
 gAxcry572mO2faQtkwt0dF/3P6pptXF2LdtnyZdrqxkkrNM+cKR0p/BKy
 SQzANRWn307e+UnuCrJnjMcyygtykA9BA+//afLPvK7EPI/L1uuL9wJIl
 PGAJZowDQXI19jBSj+CdSL/nIeyjXC6Dwh8atYTdXk+ifRGZiGJnfy1j2
 1rbAUeKhQ/cSi9J0q83Uht61m/GMNcbTUJr5TC47Qk0Rd8y8u+fWerZDh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384292949"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="384292949"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 16:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="684629545"
Received: from relo-linux-5.jf.intel.com ([10.165.21.151])
 by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2022 16:54:45 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/1] Fix bug in version reduced firmware update
Date: Mon, 12 Sep 2022 16:55:14 -0700
Message-Id: <20220912235515.2457180-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The earlier patch to support firmware files with reduced versioning
introduced an issue with the firmware override module parameter. So
fix that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/uc: Fix issues with overriding firmware files

 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.37.3

