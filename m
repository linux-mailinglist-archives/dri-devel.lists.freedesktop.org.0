Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99183622AD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CB46EBFE;
	Fri, 16 Apr 2021 14:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3AB6EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:42:09 +0000 (UTC)
IronPort-SDR: /T9HQTKv9spT9WmsNscdQiEeB+RLesh1LgJ/YauMdq3SqX6ubrZTM6SYx5S+/BQzfOuDDlOKB/
 JF1OjmhXIzYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="215582462"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="215582462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:42:08 -0700
IronPort-SDR: HG4qjL1YMnW5HHQIdjfSEzfDoqyXUesZW51hWmyBeha99RNQ6nryWSzv4AI92sOWr++wOe2EW/
 w6GtmmN+UAAw==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="399925866"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:42:06 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lXPfY-004fhK-4q; Fri, 16 Apr 2021 17:42:04 +0300
Date: Fri, 16 Apr 2021 17:42:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] video: ssd1307fb: Drop OF dependency
Message-ID: <YHmiPMcgMqHCzaur@smile.fi.intel.com>
References: <20210409164140.17337-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409164140.17337-1-andriy.shevchenko@linux.intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc: Greg.

Greg, can you pick up this one?

The subsystem seems orphaned and I see your name in the git history for the
recent submissions against that driver.

Id is 20210409164140.17337-1-andriy.shevchenko@linux.intel.com

On Fri, Apr 09, 2021 at 07:41:40PM +0300, Andy Shevchenko wrote:
> After the commit 72915994e028 ("video: ssd1307fb: Make use of device
> properties") driver does not depend on OF, drop unneeded dependency.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/fbdev/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 4f02db65dede..7506b5949eb0 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2209,7 +2209,6 @@ config FB_SIMPLE
>  config FB_SSD1307
>  	tristate "Solomon SSD1307 framebuffer support"
>  	depends on FB && I2C
> -	depends on OF
>  	depends on GPIOLIB || COMPILE_TEST
>  	select FB_SYS_FOPS
>  	select FB_SYS_FILLRECT
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
