Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C597E746A7E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3612210E298;
	Tue,  4 Jul 2023 07:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6631B10E298
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688455300; x=1719991300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dmMqRubBY7jl+nvFgHg9YoaIiWyudbhqZ/7je2LSMIU=;
 b=DBO5b4ZwXrJk62UgXUpLjeCDAf8mqbhpylTaFNBXRPh/ThtXpx8XAu/g
 w7UHyrpX4UcUif3b1OwgunAdUkPlB70WtYJc5uRWsw8wPQq9PoTeUY2OZ
 d8Vn1vqx7y46zcRasqFtU5dm33AGHiejbYx5THxvFtVASDEDZOc+idIaP
 zkIlMiFDki5Z9+i+SnESLOxJi7+N8lCfylVUqFrnolWilewtPvuKDJKXd
 IkJ/jwpUOFJgqC5Ll9icvFoFJ/MD1HojfKdyG6xbQcOAm8IqudCkxrNcJ
 A1j9900TqbdrXBVbBdbqnyjvINgkfH4Pyg4hQmnl2svll+kWxEkpEANYb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426740882"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="426740882"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 00:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="753975095"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="753975095"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 04 Jul 2023 00:21:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qGaLr-0024Fd-2I; Tue, 04 Jul 2023 10:21:31 +0300
Date: Tue, 4 Jul 2023 10:21:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 4/5] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
Message-ID: <ZKPIezsC1zhKRrGU@smile.fi.intel.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-5-javierm@redhat.com>
 <ZKPIQngz6WkzASqa@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKPIQngz6WkzASqa@smile.fi.intel.com>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 10:20:35AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 04, 2023 at 01:05:28AM +0200, Javier Martinez Canillas wrote:

...

> Wondering if
> 
>   if FB_CORE
>   ...
>   endif
> 
> makes Kconfig looking better instead of replacing all these "depends on" lines.

I meant user visible effect (via `make *config` and in the source code.

> >  config FB_DEVICE
> >  	bool "Provide legacy /dev/fb* device"
> > -	depends on FB
> > +	depends on FB_CORE
> >  	default y

-- 
With Best Regards,
Andy Shevchenko


