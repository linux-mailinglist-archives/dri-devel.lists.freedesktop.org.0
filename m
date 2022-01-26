Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB649CA7F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F85210E6BC;
	Wed, 26 Jan 2022 13:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FE610E684
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643202895; x=1674738895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aTN22F5cUIH86re3kf8Brx9AzzNMtIEiqIDfUt3h+vA=;
 b=eaRC5Iuakb7WOQOFFs0finUR1E1p1iBYyUmq7Mp66ZslLgNMn+/ca3xh
 Cl16h7Nya7C0OI9PdKMGHCN34gpd6V/JYcAnSgfCTj4pRAMEvYKCIzP9b
 oSqf6iiq6ps78OJVrdMWLP+yrCmXscOFP/GCmw2t2J2gk+niCycc2mrsx
 AYdl/xtSuWeiQMIthMcut/ZB65Ptj8mw7mjW+paesIkcJEiKQ5QT+STHW
 gh6XwXiPrWT6rpGz+xkdRq/f30du5SfYH2jLfASf/E3fYX+uT4THdiZnS
 tHShMFeyjYNCY6Uusj4KkBI3Y5BkUCkaOxa9a5RLxdrKPqc/Ll7RthFqf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244144334"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244144334"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:14:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="617959590"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:14:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCi7B-00EbZM-RD; Wed, 26 Jan 2022 15:13:33 +0200
Date: Wed, 26 Jan 2022 15:13:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFI/VAWY8HGaAkx@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <ebb9b4f4-32cd-c8a4-ed2d-e94b4759a984@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebb9b4f4-32cd-c8a4-ed2d-e94b4759a984@suse.de>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:31:40PM +0100, Thomas Zimmermann wrote:
> Am 26.01.22 um 12:17 schrieb Helge Deller:

...

> And none of those examples is out-ruled by DRM. In fact we do support
> devices that fall in those categories.
> 
> This is last week's discussion all over again.

Fine, write a driver or accept existing solution.
While there is no other solution, let's go with the existing.

-- 
With Best Regards,
Andy Shevchenko


