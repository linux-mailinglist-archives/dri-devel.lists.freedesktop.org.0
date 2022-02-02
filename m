Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F238E4A70A7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 13:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AAB10EB5B;
	Wed,  2 Feb 2022 12:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278D810EB5B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643804572; x=1675340572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eamKrK/VTEauZLd9AACZ72hNNHTYn1T5iAicwAio230=;
 b=WV/kKnb5FhrEDeKLReycf+sa3vVHKIOZpIbGbK/lNTWQ7RHaKhwa9fuR
 pdT87FRm82f8Y4YX0o+CDhxIvw6VVigVfQOsApliLRv7dHy0V2nxmuvrJ
 c0OkglQJbnHnOZAJ91FOOg34lpr/bO9JwOzfxQNHDt5fY7Ca831pPzayh
 75NXJcoxuAMUq4+HIM1u6SBa18KfZV34M3Sye9rtOr+0L5RYGxJu3f8DC
 2lCtBstV3jvrWDS4hV6EYQ9Z8kSCsFq/bQmiCFxZ1b7NuJyarULkfPcp5
 C7NiQEVWmMK9cZ5k308J1quVbcO8PZj85ZAVI6+ScYiK7YUGuCEnVGRHL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247672541"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="247672541"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 04:22:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="565970219"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 04:22:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nFEds-0004d4-Dd; Wed, 02 Feb 2022 14:21:44 +0200
Date: Wed, 2 Feb 2022 14:21:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <Yfp3WL8JMlSP19MI@smile.fi.intel.com>
References: <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
 <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
 <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
 <YfmaqUBqCrgp0QdO@ravnborg.org>
 <e552caec-5136-f4b2-12dc-23b182ab8af6@redhat.com>
 <YfploeCM6C5y3Imj@smile.fi.intel.com>
 <2f149fef-b991-9e34-98cb-426e561192ff@redhat.com>
 <YfpwGtjj5hGkN7A4@smile.fi.intel.com>
 <a3a06362-ab9f-e29b-4f03-968e3f1865ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a06362-ab9f-e29b-4f03-968e3f1865ba@redhat.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 12:54:32PM +0100, Javier Martinez Canillas wrote:
> On 2/2/22 12:50, Andy Shevchenko wrote:
> >> What's your suggestion then to solve the issue mentioned above ? With my distro
> >> maintainer hat I don't care that much, since the fbdev drivers will be disabled.
> > 
> > I think both of them can work together. If user doesn't care, the first one wins.
> 
> I don't think this is a good idea but as mentioned I don't really care that much
> since we will disable all fbdev drivers anyway. So I'm happy to allow them both.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


