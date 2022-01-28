Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BB4A0026
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E5410EAFE;
	Fri, 28 Jan 2022 18:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAE710EAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643394740; x=1674930740;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a/hQD5m6Oj7qx8tvrfdhqH7aauWQp74le7tT77QIxoo=;
 b=N1mU786uZFRnwhr2Sv/1AtUKzDuywGUS8LZIi8BraklLf7X6GVCLRPeV
 eWQ7ueXFqXYK1m7ibY4cQQOMKkeCgzrzo4jWEMXTZjtofJAvx0jwG8fp/
 QBYMHJXQi0Uzh8QFZt0dZ2H9apGlLfHFfEBlTF+03rrMwbRr/seNbfCIV
 UdHi8Asq2BtNPnFRXJ3E2CPW6Q4kosO1SYD42xQRgxeDGB6g7ckLMzSzz
 115Ohx0lvmva1fEhT8mSVNd462AErBAKM3HCnA0mySeluMU5B4RNcA3/5
 Go1udPq8XeM/G8w7iJLwxcBr1Re/i+KdM672SKYVE4S0wPLqp+uF/iNFI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244774577"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="244774577"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="480828085"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: gfx-internal-devel@eclists.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/i915: Fix header test and log spam on !x86
Date: Fri, 28 Jan 2022 10:33:02 -0800
Message-Id: <20220128183305.3072999-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
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

Some minor fixes and changes to help porting i915 to arm64, or even
anything !x86.

Lucas De Marchi (3):
  drm: Stop spamming log with drm_cache message
  drm/i915: Fix header test for !CONFIG_X86
  drm/i915: Do not spam log with missing arch support

 drivers/gpu/drm/drm_cache.c    | 9 +++------
 drivers/gpu/drm/i915/i915_mm.h | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.35.0

