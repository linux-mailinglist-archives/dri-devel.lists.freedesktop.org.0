Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152978F10A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 18:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9775610E6A4;
	Thu, 31 Aug 2023 16:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ED710E6A1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693498640; x=1725034640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=18wR8ngZpT/NhFFAjntbyC0LHD/2G9QIXcCJpwW6+Jg=;
 b=UVRA18a2y5xZW0UfoEs3Ptg2XhGNOqCjCucN4pgrB9eeGNy3j5dQ0Heh
 kWnUSkUAS/vCAs409QJglGFdjW+wp+1MoBpaaUiYKNcl2LkqXtPvLstZP
 dRZL9FhZUuO73UY60KyOxlTRtN2FWMOD5tDXD5qQUH4VVjS39ClaH2OdV
 mmwMn5WsODf+4d8HRP6m64GiOKo512kb7D/JYvWCAxZFWItlFQQ57FOFV
 vmLGHCwJjqsSsvex+0jXfZyahE+og27cLw+P4L9XEOrAUudy9LkzSWzHD
 13fIRzoNOUkRE4/ROAO6EPTsJtzHbFNAbMVWg+dWk+0278FYiCywAe1bZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375933970"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="375933970"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 09:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913344695"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="913344695"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 09:14:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qbkJo-005Qpr-1v; Thu, 31 Aug 2023 19:14:52 +0300
Date: Thu, 31 Aug 2023 19:14:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v6 3/4] drm/bridge: Drop CONFIG_OF conditionals around
 of_node pointers
Message-ID: <ZPC8fJxQsRqJKK7k@smile.fi.intel.com>
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831080938.47454-4-biju.das.jz@bp.renesas.com>
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
Cc: Guillaume BRUN <the.cheaterman@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 09:09:37AM +0100, Biju Das wrote:
> Having conditional around the of_node pointers turns out to make driver
> code use ugly #ifdef and #if blocks. So drop the conditionals.

...

>  	anx78xx->bridge.of_node = client->dev.of_node;

>  	panel_bridge->bridge.of_node = panel->dev->of_node;

>  	hdmi->bridge.of_node = pdev->dev.of_node;

>  	dsi->bridge.of_node = pdev->dev.of_node;

Yeah, I would really switch all of these to

	bridge->fwnode = dev_fwnode(...);

But it's a suggestion for a separate change that I think can happen
sooner than later.

-- 
With Best Regards,
Andy Shevchenko


