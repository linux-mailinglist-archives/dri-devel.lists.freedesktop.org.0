Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C585D78AE9A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CB310E28E;
	Mon, 28 Aug 2023 11:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CC410E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693221461; x=1724757461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fgFK6LRKxwrhncdT/gqixBYiQ/SAodbCr/UI1yHjXSg=;
 b=AIEsasHbMHkxpkBb5IPDmuAsfB5GrX4MvZ3KP4RkTjm46kJNhZ4c4Hfn
 Q/VLgx3UqQo//iKPLv0W3ni0Kfhls0WYHvBTul/jwD3aRYw8FlZkIAyZk
 sbEGmtb/iqpG4kANiPS7K+rvMxtcPWF51Ruc4ls7ddlpgUsdxu/fDSMWG
 qyeirj53qi9bZ2QPkee9VMi8z27Q3lm6aq/7KSv7n/aTgyR+SI5UmgaiS
 3pHBUAfWFKhf2I+R3PE4MdrWm4beo4y7YQ5LQFRHvzwjExmdYlodEFwM/
 0m6O9Xu1sKmZJRlFRE9y/C2AWg6rVwCTe+Lbq4bm5gtKI7hIwmO+QIStD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="378852875"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="378852875"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 04:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="688070737"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="688070737"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 04:17:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qaaFR-00FpKc-0s; Mon, 28 Aug 2023 14:17:33 +0300
Date: Mon, 28 Aug 2023 14:17:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <ZOyCTPJK9JuAYbB8@smile.fi.intel.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 26, 2023 at 08:19:00AM +0100, Biju Das wrote:
> The driver has an ID table, but it uses the wrong API for retrieving match
> data and that will lead to a crash, if it is instantiated by user space or
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


