Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22233790608
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 10:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5610E08E;
	Sat,  2 Sep 2023 08:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED1F10E08E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693642493; x=1725178493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0j1VkS4CMOs9wlRLInadKgPZrsA0NV4dlxpjSSZbcsA=;
 b=dgbPLQQJLZ5zVNfdqi9FJrZTWEpIIM+c2ccDZc2wNTO73tKbnyGhY+xI
 waONd0goIFqvel6GJjTxGLMFEDWk/bHV7z6cnjX4pNAo8E1Ia+FdbR/dj
 voUee75Q7Ui0gFtyJnaq0/L20haTt5gwTpQ/T9EmBEXDWZZcBDKJ4ME3B
 yGAOAW1bqlQld15BF1P1TyOip3f8z0ZDbFInpzpfLFYFcy4yxRm12N+pV
 rJpK6G+sK4eL+JH5HWzsMrw++b+JYEsbjc12KBu83MoOEJqxAq1y/1W7O
 MacMvc75zDY2Q1m7vvwZP8vUayLKZ1PugQL+kHY1ZEjQyhfxRJZGJ7Izm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379077990"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; d="scan'208";a="379077990"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2023 01:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="810314863"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; d="scan'208";a="810314863"
Received: from adurango-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.43.44])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2023 01:14:48 -0700
Date: Sat, 2 Sep 2023 10:14:45 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH] drm/debugfs: Add inline to drm_debugfs_dev_init() to
 suppres -Wunused-function
Message-ID: <ZPLu9b4aL4+a5Scy@ashyti-mobl2.lan>
References: <20230901-debugfs-fix-unused-function-warning-v1-1-161dd0902975@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901-debugfs-fix-unused-function-warning-v1-1-161dd0902975@riseup.net>
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
Cc: tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, andrealmeid@riseup.net,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On Fri, Sep 01, 2023 at 03:05:50PM -0300, Arthur Grillo wrote:
> When CONFIG_DEBUG_FS is not set -Wunused-function warnings appear,
> make the static function inline to suppress that.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309012114.T8Vlfaf8-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309012131.FeakBzEj-lkp@intel.com/
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
