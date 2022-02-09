Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4BA4AF61D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3F78946E;
	Wed,  9 Feb 2022 16:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9D8946E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644423020; x=1675959020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qM9JJC7wuaGK5/Ejpc9Fcc9rI1ENIVZDwsvv8sORsWY=;
 b=RDTKTWvVtOOqm5Tzpv//Dm/jgWGlFDP7mSUEoTdCF/jhH/6UKzO1/D3C
 5u9BNGXUs6cZnc74ubaxAbks9Bjtld16NqHsDtRWwNUffiG2QIts25jhY
 vFZx1bI4vF0aVui8Yv9MgKJRqF0gd92IWAsIxsiDcIcMkxLPW19yQp6j+
 az5E/4iFvAL3+GnR3du5l9H++3u4IjqP71a1iWsO3pqObMArGazbFjgts
 iTchvaDiLxD5V6uGEDpsNJkS0XM+TXDVGv7/KGy+bNtEiDysPT1tmxCrg
 wuZQO31YaTznN93m1zYR4jY0eYZANtshTJ1Ar+9oicrgfKYw/IDqtXUNT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229884850"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="229884850"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:09:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="633267219"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:09:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHpWV-002fOF-Jo; Wed, 09 Feb 2022 18:08:51 +0200
Date: Wed, 9 Feb 2022 18:08:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Message-ID: <YgPnE0yj0Y0OJxq6@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
 <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 04:54:01PM +0100, Javier Martinez Canillas wrote:
> On 2/9/22 16:12, Andy Shevchenko wrote:
> > On Wed, Feb 09, 2022 at 10:03:10AM +0100, Javier Martinez Canillas wrote:

...

> >> +	do {
> >> +		value = va_arg(ap, int);
> >> +		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, (u8)value);
> >> +		if (ret)
> >> +			goto out_end;
> >> +	} while (--count);

> > 
> > Can bulk operation be used in the callers instead?
> >
> 
> I'm using bulk writes for the data but not for the commands. Because I
> tried to do that before and didn't work. But I'll give it a try again
> now that I switched to regmap. Maybe it was some mistake on my end.
>  
> > I have noticed that all of the callers are using
> > - 1 -- makes no sense at all, can be replaced with regmap_write()
> 
> Yes, I just used for consistency. That way all the places sending a
> command would use the same function call.
> 
> > - 2
> > - 3
> > 
> > Can be helpers for two and three arguments, with use of bulk call.
> > 
> > What do you think?
> > 
> 
> Agreed, as mentioned I'll give it a try to sending all the data as a
> bulk write with regmap.

Ah, it might be that it should be noinc bulk op. Need to be checked anyway.

...

> >> +static void ssd130x_reset(struct ssd130x_device *ssd130x)
> >> +{
> >> +	/* Reset the screen */
> >> +	gpiod_set_value_cansleep(ssd130x->reset, 1);
> >> +	udelay(4);
> >> +	gpiod_set_value_cansleep(ssd130x->reset, 0);
> >> +	udelay(4);
> > 
> > I don't remember if reset pin is mandatory. fbtft does
> > 
> > 	if (!gpiod->reset)
> > 		return;
> > 
> > 	...do reset...
> > 
> >> +}
> > 
> > ...
> > 
> >> +	if (ssd130x->reset)
> > 
> > A-ha, why not in the callee?
> >
> 
> I think is easier to read when doing it in the caller, specially since there
> is only a single call. Than calling it unconditionally and making it a no-op
> if there isn't a reset GPIO.

It doesn't matter where the check is and checking that in the callee seems
better as it relies on the reset functionality. Caller in such case shouldn't
even think if it's supported or not, not their business.

Last, but not least, if you think of power management, you probably want to
assert reset there as well, means additional checks?

> >> +		ssd130x_reset(ssd130x);

...

> >> +	if (IS_ERR(ssd130x)) {
> > 
> >> +		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
> >> +		return ssd130x;
> > 
> > return dev_err_probe() ?
> >
> 
> No, because this isn't a resource provided by other driver. If this
> failed is mostly due a memory allocation error.

Is it a problem? dev_err_probe() got update in the documentation explaining
that's fine to call even in such cases. The outcome is less amount of LOCs.

> >> +	}

...

> >> +	if (IS_ERR(bl)) {
> >> +		ret = PTR_ERR(bl);
> >> +		dev_err(dev, "Unable to register backlight device: %d\n", ret);
> >> +		return ERR_PTR(ret);
> > 
> > Ditto.
> 
> Same. This is an error and not a reason to defer the probe.

Ditto.

> >> +	}

...

> >> +	ret = drm_dev_register(drm, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "DRM device register failed: %d\n", ret);
> >> +		return ERR_PTR(ret);
> > 
> > Ditto.
> 
> And same.

Ditto.

> >> +	}

...

> > I have feelings that half of my comments were ignored...
> > Maybe I missed the discussion(s).
> 
> I assure you that no comments from you or anyone were ignored.
> 
> I may had missed something but if if I did was a mistake and
> not intentionally. I keep a changelog for each revision in
> the patches with the name of the reviewer so people can check
> and compare.
> 
> If something that you mentioned is not there, I apologize and
> please point me out so I can address it in v4.

It's just a feeling, because I repeating that dev_err_probe() a lot :-)
Nevertheless, now I see at least your point why you went that way.
But see my comments on it.

-- 
With Best Regards,
Andy Shevchenko


