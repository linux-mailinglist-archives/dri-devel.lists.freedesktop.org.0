Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84C69F625
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 15:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573DD10E038;
	Wed, 22 Feb 2023 14:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4E610E038
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677074956; x=1708610956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wpLN1gd73bREF0yIjZJYHMzn1mN4hBeaWGTvbEXlUfo=;
 b=T8MtXUL8tmAxovCNyqSVrFv675wr3l+tkdXjIXzmzlhQUS3C3CoqIiTj
 3k9UcFS8YHKBSlJ8ix7i+NOUVy68ReyMSYvjW2VP7/lt2z9hKOHGIo4QZ
 eI4fMUcQC0Gbb51JcRT1q8fciNnAZaJjnCFVYMqlxNuXrBclTPnohd6yx
 ysdmfSDUWKsc4cnJNCV4sI4NMUPsbS5l67uPsvuErakfWrhkMxc01jl2k
 mk21v168KsodEh98eD3VeTOGcvXbL3FAStvY7fLOLqfdsALmi03c+drrA
 sDbDr1m1FR9S1nGZhDQcH+mvotLNPcSO1Ubbi5Cb7fBd55s5/68yvl8lM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="313305569"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="313305569"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 06:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781446604"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="781446604"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2023 06:09:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pUpne-00ARKq-0t; Wed, 22 Feb 2023 16:08:50 +0200
Date: Wed, 22 Feb 2023 16:08:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v12 03/10] drm/display: Add Type-C switch helpers
Message-ID: <Y/Yh8tBa979G101H@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-4-treapking@chromium.org>
 <Y/SvhxgjTM2cYZa+@smile.fi.intel.com>
 <CAEXTbpcOA06Cf-niurjM4_3Rx6xa9Pi+fuJHUQCKmwaJL2ibmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXTbpcOA06Cf-niurjM4_3Rx6xa9Pi+fuJHUQCKmwaJL2ibmA@mail.gmail.com>
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
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Benson Leung <bleung@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 04:53:41PM +0800, Pin-yen Lin wrote:
> On Tue, Feb 21, 2023 at 7:48 PM Andy Shevchenko
> > On Tue, Feb 21, 2023 at 05:50:47PM +0800, Pin-yen Lin wrote:

...

> > >  #include <linux/delay.h>
> > >  #include <linux/i2c.h>
> > > +#include <linux/usb/typec_mux.h>
> >
> > I don't see users of this.
> > But a few forward declarations are missing.
> 
> I can put a `struct typec_mux_dev;` here, but there is also a usage of
> typec_mux_set_fn_t.
> 
> Should I add the typedef into this header file as well?

No, inclusion is fine, it's me who didn't notice the type in use.

-- 
With Best Regards,
Andy Shevchenko


