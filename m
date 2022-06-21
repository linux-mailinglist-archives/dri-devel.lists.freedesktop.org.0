Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E4553002
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1310E946;
	Tue, 21 Jun 2022 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC35410E946;
 Tue, 21 Jun 2022 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808391; x=1687344391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1sTO7aNDGiJ6RJCyNtNoIzxCMyt0dsZpaWqodiT0ROM=;
 b=AtxVAtdXlVZken4GLOUzrx8hlYcyrkYkeOzJ+rkhBYSM3nkRsQWsSrXJ
 W6eI87Auzld9rbBcqmiZq0MTHiPUN82V0pPdDkjFvWurxl1aCW3PmJi6D
 C6/cZaByc8RwFceJUGF6JDpIFsU05+UUVaN/db4/qMFzISnASEcnsF7Wf
 W+QVIPRBaudaavAQRtz8hhpHFxKvJgIpFr6TgenSCUbANLWxDFrz8Jv0w
 GkoUrB/8gdx3Y9x61G99pkS3UOOgLKRP/0nb/PW2xTBtefDJvluWpHZCE
 Z5RBiwdvcgwYj/NtnfBg3gwbhDlHbsblNxGXWg+XLnuroGQkqKLdTtJX6 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121896"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121896"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327011"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/12] small BAR uapi bits
Date: Tue, 21 Jun 2022 11:44:22 +0100
Message-Id: <20220621104434.190962-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test-with: 20220621103001.184373-1-matthew.auld@intel.com

IGT: https://patchwork.freedesktop.org/series/104368/#rev2
Mesa: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16739 (WIP)

-- 
2.36.1

