Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D493F666FC7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855A710E8D0;
	Thu, 12 Jan 2023 10:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96E610E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673519817; x=1705055817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=slo6xLj/PY1pP/5JhL5TcH4kig+nfZoqmJ2N2YXxOIk=;
 b=bOWexgT5Ku3CDRIiDtBXdCT/iZjZOendYgXiB8qVb8+ksOq/MMdG4u4M
 oDwN1qmDHEuyDU+ABnqiZZbptv/vgWzS30zYJpAcKXxRTJFDN5zX+nRSh
 sKFoMZI3Nn6jMdJBEQXFKCi3iqVEMd4JIublBDDmB3TNGHkc+UJJ5Sd1g
 7n0Xl7B/gWqgR9vcyidVezubifVDP1XsHJd6ehx9+V2/GLFFCn0RVkP95
 3YjHNikj/R5zvqQpRJJfiyyyZNXEZHEfjdpEdc9O0R/CiMtMK9jM3KL+r
 xiFbca+zzQeDHNOIYudz63YMD6YoOcQCZFGQFli54GDDDr7Vpd6xPC4Wt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325693717"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="325693717"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="651082180"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="651082180"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 12 Jan 2023 02:36:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pFuwo-007zvQ-1N; Thu, 12 Jan 2023 12:36:38 +0200
Date: Thu, 12 Jan 2023 12:36:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v10 0/9] Register Type-C mode-switch in DP bridge endpoints
Message-ID: <Y7/itipjqIyulh6b@smile.fi.intel.com>
References: <20230112042104.4107253-1-treapking@chromium.org>
 <61ba2880-6784-1014-a7a2-a1eecc4e810e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61ba2880-6784-1014-a7a2-a1eecc4e810e@linaro.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 shaomin Deng <dengshaomin@cdjrlc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 06:34:52AM +0200, Dmitry Baryshkov wrote:
> On 12/01/2023 06:20, Pin-yen Lin wrote:
> > 
> > This series introduces bindings for anx7625/it6505 to register Type-C
> > mode-switch in their output endpoints, and use data-lanes property to
> > describe the pin connections.
> 
> Please cc everybody on all patches. Having received just a single patch made
> me spend time on having to look them up on lore.

Sorry but this seems a bit outdated requirement nowadays.
Why? Because we have `b4` in each famous Linux distro and
nice lore.kernel.org. It's really easy for the experienced
maintainer to catch up the whole thread.

Putting _all_ people on all patches may be an overkill.
What people should really get is the cover letter (assuming
that it explains well the structure of the series). The rest
depends.

-- 
With Best Regards,
Andy Shevchenko


