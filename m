Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2178AEE9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A9F10E29D;
	Mon, 28 Aug 2023 11:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F050510E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693222369; x=1724758369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hXKh60i1gkUFXwjg44JpkRKrNVt+f0T67/wlaP+YCwI=;
 b=LLqxbyW5rdkRarR/aWZJA58RK9S/8MeH+ZnXJ+MKXEIjXtY5ihSuqVK9
 6g1rQjafB3iIiTucvlyVrIxNa1WPjpReU1Q9NNn6YVUsDwqVpQKptokdT
 WEdd2ufhwqMQzXsD03f+sGEYWEihVIBIJS6Vd9k/e3StXaNkrgnMMGBBX
 WPQMQTpRRQ6XgOxbRJ/fIeLw/6N688CXIMBmCMR0Ape2UEMz9qcgPubXz
 knyff92KGZzgKBdF7r/OhXxCpM6WeMl+fSjgUX2DKwaml714tqCaKVOpF
 jK97q+9LEFrrH5zelERC/EhAj9e56JRtl5FDx1wy/+brC6AZaVh46af43 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373968098"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="373968098"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 04:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="828345469"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="828345469"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2023 04:32:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qaaU5-00GJaY-1Y; Mon, 28 Aug 2023 14:32:41 +0300
Date: Mon, 28 Aug 2023 14:32:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Message-ID: <ZOyF2c+N9bfkID/7@smile.fi.intel.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
 <ZOyCLijP4fb6zxKn@smile.fi.intel.com>
 <20230828112921.GJ14596@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828112921.GJ14596@pendragon.ideasonboard.com>
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
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 02:29:21PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 28, 2023 at 02:17:02PM +0300, Andy Shevchenko wrote:
> > On Sat, Aug 26, 2023 at 08:19:01AM +0100, Biju Das wrote:
> > > Having conditional around the of_node pointers turns out to make driver
> > > code use ugly #ifdef and #if blocks. So drop the conditionals.

...

> > > -#ifdef CONFIG_OF
> > >  	/** @of_node: device node pointer to the bridge */
> > >  	struct device_node *of_node;
> > > -#endif
> > 
> > This simply has to be struct fwnode_handle to begin with.
> > Can you convert the driver to use it?
> 
> While that's possibly a good idea, it will require touching all the
> bridge drivers that set this field, so I think it could be done
> separately.

Okay.

-- 
With Best Regards,
Andy Shevchenko


