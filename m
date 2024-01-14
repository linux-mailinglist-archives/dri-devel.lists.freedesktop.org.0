Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A982D12D
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 16:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DDD10E196;
	Sun, 14 Jan 2024 15:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA610E196
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705246086; x=1736782086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kJ9IuL80YjK4r1jJ1meGk8LiMzS8j09TCsj86U8N1vE=;
 b=DZPSaiNO4O3D1Hj4aL38yGgTIDw8EwqjvLzesviY63gq77K5J+Em4Mb8
 92+bKhRytX8j5sFZH/3DLWvebgoWu2abWvvZz0unywUM1D7mISWdqs4t3
 nsbLA3mnUaixtn3+EZkbSey6DzG7T5JZP/uHOw/RwS2JPz/cCPJonfSqk
 AXpORH/+V9Ej+CNnT9qTy5p2ouvHe5WDJmLCkGSbde3QeasEZ8zSrFd+9
 DEynggT+1izCkWXYQdOQsOuPJ3J6tW979xm8hcc8e6sQZJc5tFPpLXL8g
 +IR9J9Pt/Tqsn3np7HwyABazH2JtyEHqof/9bx+VlRZXdtigDKREc8wrp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12835864"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="12835864"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 07:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030429354"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; d="scan'208";a="1030429354"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2024 07:28:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 132692AC; Sun, 14 Jan 2024 17:28:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] backlight: hx8357: Clean up and make OF-independent
Date: Sun, 14 Jan 2024 17:25:07 +0200
Message-ID: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few ad-hoc cleanups and one patch to make driver OF-independent.

Andy Shevchenko (4):
  backlight: hx8357: Make use of device properties
  backlight: hx8357: Move OF table closer to its consumer
  backlight: hx8357: Make use of dev_err_probe()
  backlight: hx8357: Utilise temporary variable for struct device

 drivers/video/backlight/hx8357.c | 57 +++++++++++++++-----------------
 1 file changed, 27 insertions(+), 30 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

