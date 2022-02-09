Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F04AF4FC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207E210E273;
	Wed,  9 Feb 2022 15:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9F010E273
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644419901; x=1675955901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yAb9Fo/hjk9Pq9HEo1fxRFhKXRqCJKCLiblpnkScaao=;
 b=EQDwosRLOFRW+h0AZXdC8qKh93s3uSLPi0zYxdBroT72lzcMK1ZgglzZ
 2B3H1zzxVTdrzIPDkVAsFpu5NVvk24BT+V8f9hDX+tz+2fOR4SmJ4qQep
 V13O6xNSA3GX6x7KUlFqpG82SUWvj8ooi2f1nGtqj7OUK8pdFGpfGu1H+
 WhpUrJLMmIC9A1T5dfn+e7vquGGxyMNGOlp/fhIzIyt6TdD3k+OAwHfO7
 V1FlHDNQn7FphKQ3iE1wu21qLTnyJSfX895f1gk73AQ889HaPXCLkCWX9
 Mw5ehlm+ddJyo6ijUGku2Cru+wQw7zzpg9elfHTfrska20VBxnsul2rHj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249173653"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="249173653"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:18:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="499998951"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:18:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHoie-002eYQ-HB; Wed, 09 Feb 2022 17:17:20 +0200
Date: Wed, 9 Feb 2022 17:17:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
Message-ID: <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 01:25:46PM +0100, Geert Uytterhoeven wrote:
> On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

...

> > +               .compatible = "solomon,ssd1305fb-spi",
> 
> This needs an update to the DT bindings.
> Hence this may be a good time to deprecate the existing
> "solomon,ssd130*fb-i2c" compatible values, and switch to
> "solomon,ssd130*fb" instead, for both I2C and SPI.

Agree!

> Of course the I2C subdriver still has to bind against the old values,
> too, for backwards compatibility.


-- 
With Best Regards,
Andy Shevchenko


