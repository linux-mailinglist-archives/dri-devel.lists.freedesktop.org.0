Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33249CA84
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8988110E684;
	Wed, 26 Jan 2022 13:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39610E684
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643202925; x=1674738925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5iUtFO+EhpHndQGOg3UJPsNAroHVFCQnJAjNbMjiMGc=;
 b=B0HulgMlkx8YrM0depFCi7ycnTH8/eCAwC9O6ey4szKMM/uA8f0kVdZq
 o2Rid0hlOxBdIUmxPIM2hgxkFDfD4n+2YEjbpw/HRqAH+j7/H744TFxWa
 7I51MXayLM7SbqUR0fRZ0/VD8mR1BmY7J/i+V+7YKazmUqIfTiX43kYf8
 8E/HumYR7QWUb8myXnhLm/iqz+faW/iHp72AtQCdZU4JMnh2mvxEEp45j
 iGPYEn+la2a62/0O+PhIAQvvPUf5soQpPH77Hi7s0uIUIm9dg1RwuLWek
 NWVqi9Ayj2aCK+Cz/hvWorSDHKyu/wTUglLhfbBzFQMm0mp5gIv6WXOgt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="245379361"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="245379361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:15:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="597459271"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:15:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCi5k-00EbXE-U5; Wed, 26 Jan 2022 15:12:04 +0200
Date: Wed, 26 Jan 2022 15:12:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfEv7OQs98O9wJdJ@kroah.com>
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
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:26:36PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
> > On 1/26/22 11:31, Daniel Vetter wrote:

...

> > You are describing a transitioning over to DRM - which is Ok.
> > But on that way there is no need to ignore, deny or even kill usage scenarios
> > which are different compared to your usage scenarios (e.g. embedded devices,
> > old platforms, slow devices, slow busses, no 3D hardware features,
> > low-color devices, ...).
> 
> All of those should be handled by the drm layer, as Daniel keeps
> pointing out.  If not, then the tinydrm layer needs to be enhanced to do
> so.
> 
> Anyone have a pointer to hardware I can buy that is one of these fbtft
> drivers that I could do a port to drm to see just how much work is
> really needed here?

I have bought myself (for other purposes, I mean not to convert the driver(s))
SSD1306 based display (SPI), SSD1331 (SPI), HX88347d (parallel).

Each of them costed less than $10 with delivery to EU (nowadays maybe a bit
more expensive). I believe it's very easy to find the links on AliExpress.

-- 
With Best Regards,
Andy Shevchenko


