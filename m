Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335144A7050
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086810E558;
	Wed,  2 Feb 2022 11:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801F910E655
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643802717; x=1675338717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TaSayFeG3Tla1Ek3mItiUJbCMOq53RsNaYSQFDxfn/k=;
 b=XEd2Vi8y53xyze+5SKvzvyMb2fb6q2V6tKsrK3utoKrouitoCoNq6h0F
 c/nHEqA/s3DFAnC+FS6oEbmE2BUqJbc3e5QGNk81bIZRh4412K8pO2Mh9
 sbiucSpW7j05I5LLLO3Z+T5E3CPZfZvcOUQzP/j+UbjNOzVtF2PLcaq7s
 USObwo3YJUxLFdV5ladsJm4NKtSVodJhg3lmoj71hd2xFK+Rq8b5zp/L8
 9xCfSwsTah5mSbNRn1cxDtI98D5+oxbnK8pcF1YxlPPSCm2WjRtEcr3no
 YVnLXraQwIlzg5vW2nLsFaxZix0bq1ZWV4USIQePYpU5tQmiapQkjJ7+z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228553609"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="228553609"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 03:51:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="620124007"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 03:51:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nFE9y-00041p-Fe; Wed, 02 Feb 2022 13:50:50 +0200
Date: Wed, 2 Feb 2022 13:50:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <YfpwGtjj5hGkN7A4@smile.fi.intel.com>
References: <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
 <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
 <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
 <YfmaqUBqCrgp0QdO@ravnborg.org>
 <e552caec-5136-f4b2-12dc-23b182ab8af6@redhat.com>
 <YfploeCM6C5y3Imj@smile.fi.intel.com>
 <2f149fef-b991-9e34-98cb-426e561192ff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f149fef-b991-9e34-98cb-426e561192ff@redhat.com>
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

On Wed, Feb 02, 2022 at 12:39:29PM +0100, Javier Martinez Canillas wrote:
> On 2/2/22 12:06, Andy Shevchenko wrote:
> > On Wed, Feb 02, 2022 at 09:38:51AM +0100, Javier Martinez Canillas wrote:
> >> On 2/1/22 21:40, Sam Ravnborg wrote:

> > And how will distros choose "the right" option in this case?
> 
> It depends on the distro. In Fedora we are disabling *all* the fbdev drivers.

Yes, and Distro A will think about old driver (because they have customers and
don't want to have a bad user experience) and Distro F will choose a new one.


> > What to do when I wan to see a regression and I want to change drivers w/o
> > recompilation?
> 
> If you want to have the two drivers without recompilation (and same compatible
> to match) then how would kmod / udev choose which one to load ? It becomes a
> race condition between the two drivers which one probes first.

We have a long history in kernel where new drivers came and old faded.
When two or more drivers of the same feature is enabled in the kernel
we may use modprobe facilities to prioritize them (blacklisting).

> > NAK from me to that proposal.
> 
> What's your suggestion then to solve the issue mentioned above ? With my distro
> maintainer hat I don't care that much, since the fbdev drivers will be disabled.

I think both of them can work together. If user doesn't care, the first one wins.

-- 
With Best Regards,
Andy Shevchenko


