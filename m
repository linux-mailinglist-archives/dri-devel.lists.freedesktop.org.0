Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010844AA8FA
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 14:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05210E28B;
	Sat,  5 Feb 2022 13:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3749810E28B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644066328; x=1675602328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P8ih86m6G0IyyDLA73dvPC4Mr4i85BIOOZC9rN0gCSw=;
 b=WTQkS3qMbTkm+Qt1PmmEmNVZCcs1z1vSGuJRqN2tKBHqZAIYxC2fdj/v
 T4qLLwAOh8fxwnyVq49WdN3maHvSh63ophR5FgfBpnS7zdl1jfagjbUQO
 62gRi0npht6pwzNOFY9FRryRU/l8rkxFWU6sm6RBRcU11z8Tloa7GE5AW
 7qxgpPfTLRwJh/E0X828tSDbRxirL82egkfuUuDhFNg47+Po5PpRanjGI
 6FFjOi2QgT33tOWfdvCIPdy/s7Pr9++2y3TNUmuu8Lyclk3QPMIJ3ks08
 5fBK9hyNQzb5zCgPgfCmhVUqw3pf1m/Jztogpq+PONZvJ3/Qaj+ugPyNZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="309255709"
X-IronPort-AV: E=Sophos;i="5.88,345,1635231600"; d="scan'208";a="309255709"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2022 05:05:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,345,1635231600"; d="scan'208";a="567007845"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2022 05:05:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nGKjm-001GmE-8z; Sat, 05 Feb 2022 15:04:22 +0200
Date: Sat, 5 Feb 2022 15:04:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 2/4] drm/tiny: Add driver for Solomon SSD130X OLED
 displays
Message-ID: <Yf511hhojzIXcNXp@smile.fi.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-3-javierm@redhat.com>
 <Yf03sCSuQwHKvgA9@smile.fi.intel.com>
 <d4e8c16c-5586-3233-0b99-be15a4c0f7aa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e8c16c-5586-3233-0b99-be15a4c0f7aa@redhat.com>
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

On Fri, Feb 04, 2022 at 08:19:12PM +0100, Javier Martinez Canillas wrote:
> On 2/4/22 15:26, Andy Shevchenko wrote:
> > On Fri, Feb 04, 2022 at 02:43:45PM +0100, Javier Martinez Canillas wrote:

...

> >> +struct ssd130x_device {
> >> +	struct drm_device drm;
> >> +	struct drm_simple_display_pipe pipe;
> >> +	struct drm_display_mode mode;
> >> +	struct drm_connector connector;
> > 
> > 
> >> +	struct i2c_client *client;
> > 
> > Can we logically separate hw protocol vs hw interface from day 1, please?
> > This will allow to add SPI support for this panel much easier.
> > 
> > Technically I would like to see here
> > 
> > 	struct device *dev;
> >
> > and probably (I haven't looked into design)
> > 
> > 	struct ssd130x_ops *ops;
> > 
> > or something alike.
> 
> Sure. I wanted to keep the driver simple, making the writes bus agnostic and
> adding a level of indirection would make it more complex. But I agree that
> it will also make easier to add more buses later. I will do that for v3.

I have SSD1306 display with SPI interface and I'm not able to test your series.
With the above it at least gives me a point to consider helping (coding and
testing)  with SPI one.

...

> >> +	if (!fb)
> >> +		return;
> > 
> > Can it happen?
> 
> I don't know, but saw that the handler of other drivers checked for this so
> preferred to play safe and do the same.

So, either cargo-cult or indeed it may happen. Somebody may conduct a research
on this...

...

> >> +	drm_mode_probed_add(connector, mode);
> >> +	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
> >> +
> >> +	return 1;
> > 
> > Positive code, what is the meaning of it?
> 
> It's the number of connector modes. The driver only supports 1.

A comment then?

-- 
With Best Regards,
Andy Shevchenko


