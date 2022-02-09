Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334A4AF54E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086A810E1DE;
	Wed,  9 Feb 2022 15:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F311E10E1DE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644420799; x=1675956799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/42HF8Fl+ZC1zv3DJFoHRFzFvjgFJQkv4Tte+gzujnA=;
 b=FBWV9qzVBT30hD+t11bE/IbXlcfzIplI9IDLocJ2L9TwgMnJSmW/+dBQ
 xPsQHVLy2n76uNC4oTCSqNh3DUTgUmcrUvPfklo4xfHWChi2nX5tZl+S+
 PlPozIqG5bruFPpHmmSYjW2xy1mfPqVIRMEZEr2yGMBaZ+Fz3CXy0SZAR
 vb6KbwakvIrcLj9zicz2yctPwTRzfAJ/dlXSFvpKRTG/nbV0QsVwmmGrD
 Q5MPtr4ikslJ+Yk1213EKpG0ol2sgEZSU639KhMlF8/CW4/S8xCg6GnTk
 qu/dER7GNZeBFck0i2SNHZMn/DhNv0y7Jz3ypqiswV3FqQbQ4jZQ1twWD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249176800"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="249176800"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:33:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="585596858"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:33:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHox5-002em2-RY; Wed, 09 Feb 2022 17:32:15 +0200
Date: Wed, 9 Feb 2022 17:32:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
Message-ID: <YgPef3s5+AMqWpSH@smile.fi.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
 <YgPF1cBMsd9973Dx@smile.fi.intel.com>
 <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
 <f58b2608-0d51-3209-ae11-18bdac19dd66@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f58b2608-0d51-3209-ae11-18bdac19dd66@redhat.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 03:42:16PM +0100, Javier Martinez Canillas wrote:
> On 2/9/22 15:27, Geert Uytterhoeven wrote:

...

> Now, this is a reason why I mentioned that the old fbdev driver shouldn't
> be removed yet.

I agree on this conclusion.

I think based on the fbtft resurrection discussion I can send a new version
to unorphan it, route via fbdev, and leave under staging, so it will be a
compromise between all stakeholders.

-- 
With Best Regards,
Andy Shevchenko


