Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7208B813B0A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 20:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810D910E2F5;
	Thu, 14 Dec 2023 19:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F610E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 19:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702583524; x=1734119524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/fGXZ6UuZtPOIB3EPIcP7+ZSJO/azzgMGgHsLduVS8k=;
 b=aEE+0VdRvam+/ttXl3WQ4bJNdjFQgBZtwB0qB4Qz93Bm/e/BbV4eO1JP
 NBoGhSyF1NNrMgqpL9VmCHkl1f1r1qdal9S6oU4OpDkGjNfkMNDus/ZST
 7btgH5AsIKnhAabKnFja1eYbykjY00XxOl1IrFXyJ63PC0Pyyz+lzfIdM
 9kLIv9JJhu6BG6eAuw2h2fYAD92AL8kUAA9oZHFoOn0UDoqXSiwUinD8j
 s5VaBbI+whoWeLkikJOpAcSbI109Zp4aSlMwzOKUZUzbuRUjsJ0RAOqXh
 sgwZMnb7vgOw6zpY1B14oOb5Lps2bVuMKdp0C28ihsZ6e8e6GCGzZw8I/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394047214"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="394047214"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="778006681"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="778006681"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 11:52:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6B01218E; Thu, 14 Dec 2023 21:51:59 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] backlight: mp3309c: Allow to use on non-OF platforms
Date: Thu, 14 Dec 2023 21:51:12 +0200
Message-ID: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
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

Allow to use driver on non-OF platforms and other cleanups.

Andy Shevchenko (2):
  backlight: mp3309c: Make use of device properties
  backlight: mp3309c: Utilise temporary variable for struct device

 drivers/video/backlight/mp3309c.c | 76 +++++++++++++------------------
 1 file changed, 31 insertions(+), 45 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

