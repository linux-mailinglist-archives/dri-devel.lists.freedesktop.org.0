Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF539495451
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935C510EC83;
	Thu, 20 Jan 2022 18:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB83F10EC67;
 Thu, 20 Jan 2022 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642704164; x=1674240164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yjQuO4qTReRDJOqLGvX4UXpCi5SqZcuUsAFvblxtyus=;
 b=Ux7vgNHYrwrOUyexyuMPmbWIJSrH9QJUdiykjy3pHnmwKiDO3nJKMzZx
 SFwha+sn2mbdtSo+HEwqHg9b8XDfAf11OTOxSj6MjI9IO51yF5ciH7cRo
 q84a1whiwp0l/iwwW0ug4gTwQIQkFvIw8y+jzV5LbPVIXQ9iby5VtRbHL
 Lu/H6StcHfR+jmhY1mBN4kayrecHfpfxN5Yt3P28k2+WTFAdSSwrNudYN
 kSZGTasIFGoJchPPeB0U7A/3nYxUp1YlRGvj0Pz+hyfc1OhmtIc7UuY8y
 YYEJihVyi1YzCEwgq9XoFe2I+t1T26bn+PfjuuYVAJr1itYGg5nM/aevG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245220042"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245220042"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:42:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="626416200"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:42:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] A few CT updates 
Date: Thu, 20 Jan 2022 10:36:53 -0800
Message-Id: <20220120183655.3228-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of minor CT updates. 1 for performance, 1 for extra debug.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/i915/guc: Don't check CT descriptor status before CT write / read
  drm/i915/guc: Print CT descriptor status in CT debug function

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.34.1

