Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF694FDD9D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 13:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842CF10E459;
	Tue, 12 Apr 2022 11:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9741110E459
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649762822; x=1681298822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gIs6XvcWXzPcGcyZ4rwFB88kIQ7FOgRfZOHvOled5dE=;
 b=Fq7EmL2j3Ynvy8Sv4gGOJuk1xAdPxvfROUujcqm551PCpJ31UGBmbGtp
 DXlOAX11x3u/f3O4lembmGAxN9tOztT1AKiOx4tiEVSog1KTLmcWnb8hP
 /tBW5yvh111EF6Cz6z7nVPrZ5KHQrTBnJFZsi1ebQPBuU7cJbFw89j8dk
 8BcmXopg/c4ZuCGBEI7LnnafGrr5js+H5oV6832ois5Itjl0bvDe2k0Ce
 kFTXmXcxNbtRIKlqz7ci+VYOY7jwuPhmHpKWeXWsWSv9o+5Sz2zG/ubOw
 vUEzrP0Z02jSLYyoM9lteK7DW19m2umAB7Wb4gWANSLUtSpPIL69VoDev w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261201167"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261201167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 04:24:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="611397331"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 04:24:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1neEa4-001YkI-Tg; Tue, 12 Apr 2022 14:21:08 +0300
Date: Tue, 12 Apr 2022 14:21:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
Message-ID: <YlVgpHqqqFy43L37@smile.fi.intel.com>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-5-javierm@redhat.com>
 <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
 <4128b288-2b9a-f9cd-01f3-a1d50d3e10bb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4128b288-2b9a-f9cd-01f3-a1d50d3e10bb@redhat.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 10:07:02AM +0200, Javier Martinez Canillas wrote:
> On 4/12/22 09:23, Geert Uytterhoeven wrote:
> > On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:

...

> >> -       ssd130x->device_info = device_get_match_data(dev);
> >> +
> >> +       variant = (enum ssd130x_variants)device_get_match_data(dev);
> > 
> > (uintptr_t), to avoid a cast from pointer to integer of different
> > size warning.
> >
> 
> Indeed. The kernel test robot reported the same.

Not only because of this, but also with the non-NULL pointers I prefer the old
style without ugly castings.

Instead, you may export the array (in the driver's namespace) and use
&info[ID] pointer for the specific device info.

-- 
With Best Regards,
Andy Shevchenko


