Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E678355FE
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 14:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E205210E253;
	Sun, 21 Jan 2024 13:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028B610E253
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705845310; x=1737381310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xWyyPY/pPgSdMwCy46smjWIZscigOBsBxLXygB6GUA0=;
 b=cTwLYzVw0YptuNnSgO8ioyGxTBj+YXJuQnwID7ZYAEj0pkabpgguHxbP
 VOhQ2eCpTW413EHKG2wkdi0deSNZzDmu7boG3MPtfCjuaNIk+iirfF0Fe
 JfnA+dZgpvfrXuXl2yAY8vc1zQcM1lcNkhjF0D4i2ZFJqlgp0vwOgWMZX
 BLv1izo0aoS3rsT01YYsSeQSTThuN93paeqGTk0H1gj1Gk18LwA3J+dLA
 583Hx+jzF7wUlLLi8iW0lsDzQeK2QhQR63LsfG4sts2pEBzt7TV+25ytJ
 JbDQCssPld5VQ7Ygg6UEfyUDm2a6hzusGW4dsH+ObglMR+WQX1Szk7xw8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7708837"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="7708837"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 05:55:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="785447801"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="785447801"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 05:55:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rRYBB-0000000Fum7-1edI; Sun, 21 Jan 2024 15:48:05 +0200
Date: Sun, 21 Jan 2024 15:48:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 1/4] backlight: hx8357: Make use of device properties
Message-ID: <Za0glbPfzeTjdZjn@smile.fi.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
 <87bk9novmp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk9novmp.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 09:20:46AM +0100, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

...

> > +typedef int (*hx8357_init)(struct lcd_device *);
> 
> This kind of typedef usage is frowned upon in the Linux coding style [0]
> (per my understanding at least) and indeed in my opinion it makes harder
> to grep.
> 
> [0] https://www.kernel.org/doc/Documentation/process/coding-style.rst

Thanks for pointing this out. However, this piece does _not_ clarify typedef:s
for function pointers which I personally find a good to have.

...

> > -	ret = ((int (*)(struct lcd_device *))match->data)(lcdev);
> 
> This is what I mean, before it was clear what was stored in match->data.
> But after you changes, what is returned by the device_get_match_data()
> function is opaque and you need to look at the typedef hx8357_init to
> figure that out.

The above is so ugly in my opinion, that justifies using typedef:s even
if you are quite skeptical about them.

...

> No strong opinion though and I see other drivers doing the same (but no
> other driver in drivers/video/backlight).
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


