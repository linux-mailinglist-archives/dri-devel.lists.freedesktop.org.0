Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041FA78113E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 19:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2985210E0D9;
	Fri, 18 Aug 2023 17:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF9B10E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692378556; x=1723914556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mzs+5M+GNbK7z97k5Ovdlc5RxEaxEPydxc/obNqVPIE=;
 b=lsyr49KMGUrbqAycBEPeitgAKE6MQM/03G/SvomrPMsC3TmhqUgs1Yxf
 6AJsNXBI+6Q7lPiZWdzW80vVnk0rOaNsbrf2gNKlibFiGjmgceXYOeBsH
 YCI84LDytHalclms+vaog6jm8pkXvy3nrr495dGekv/B4sC8R2Tq/cjOl
 pD9ZNLlhjtxbHfZ04iXoP+fmyF/OOL0Ywk8sh8LVsXQbXcgY62kYmF7Q7
 aKagyXduoDEw+3wEHTmk+TsXIp6aQw87OsBU2uLC37j145HLGgSard6bG
 C3a9Ifd7Zsu6adjWYZY3fkiNYHQoqj5f/aaumlQvlHY/L4icmErif5lAu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358121789"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="358121789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 10:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="738175433"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="738175433"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 18 Aug 2023 10:09:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qX2yD-00HEXa-0k; Fri, 18 Aug 2023 20:09:09 +0300
Date: Fri, 18 Aug 2023 20:09:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] Match data improvements for it66121 driver
Message-ID: <ZN+ltEl3zLN9pkKG@smile.fi.intel.com>
References: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:54:50PM +0100, Biju Das wrote:
> This patch series aims to add match data improvements for it66121 driver.

With the Fixes removed, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


