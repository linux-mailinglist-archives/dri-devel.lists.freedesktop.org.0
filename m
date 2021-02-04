Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C330F4E8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 15:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B096E0A8;
	Thu,  4 Feb 2021 14:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540F56E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 14:27:54 +0000 (UTC)
IronPort-SDR: 1HqWKcnlgOJmal7wmk+/D117B+ETucVrzMvz8C+MuQ4v1cQdjO9TP5TYRs4fL0Q6eurFfAo0d5
 EzdY/+XiUOAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="168364779"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; d="scan'208";a="168364779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 06:27:53 -0800
IronPort-SDR: gUx4H1h+qtB8y95Q03WZldW1Wh1On8guEl5FzkQzNf2nJZEUOFpgDXU11BGoOAFqvDHXMD238g
 21L39mETNz9A==
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; d="scan'208";a="372980154"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 06:27:50 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1l7fbm-001v8j-Vy; Thu, 04 Feb 2021 16:27:46 +0200
Date: Thu, 4 Feb 2021 16:27:46 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <YBwEYo0F+vNSiglD@smile.fi.intel.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
 <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
 <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
 <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
 <20210204105752.GA3940374@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204105752.GA3940374@piout.net>
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Mark Gross <mgross@linux.intel.com>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 11:57:52AM +0100, Alexandre Belloni wrote:
> On 04/02/2021 11:50:03+0100, Hans de Goede wrote:
> > On 2/4/21 11:36 AM, Daniel Vetter wrote:
> > > On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > >> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> > >> <andy.shevchenko@gmail.com> wrote:
> > >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > >>> <patrik.r.jakobsson@gmail.com> wrote:
> > >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > >>>> <andriy.shevchenko@linux.intel.com> wrote:

> > >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> > >>>>> immutable branch with a given tag, please pull to yours subsystems.
> > >>>>
> > >>>> Hi Andy,
> > >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > >>>> then I should probably start looking at removing the corresponding
> > >>>> parts in GMA500.
> > >>>
> > >>> I have noticed new commits in DRM against GMA500 and it seems now in a
> > >>> conflict with my immutable branch. Are you sure you don't forget to
> > >>> pull it?
> > >>
> > >> Hi Andy, sorry I missed pulling the immutable branch before taking the
> > >> gma500 medfield removal. I was unsure how to do that through drm-misc
> > >> and it's tools so I got sidetracked. What would be the correct way to
> > >> fix this?
> > > 
> > > Imo Linus can resolve this, it's pretty trivial, as long as both pull
> > > requests point it out to him.
> > 
> > The removal of older Intel platforms touches a number of subsystem trees,
> > the idea about the IM branch was that all subsystem-trees would merge that.
> > 
> > I can certainly point out the problem in the pdx86 pull-req to Linus,
> > but the GPIO pull-req also contains a merge of the IM branch as will
> > the x86/tip and rtc pull-reqs I believe. We can add a remark to all
> > the pull-reqs about the issue I guess ?
> 
> FWIW, I'm not going to merge the PR in the rtc tree because it is a
> simple removal and doesn't have any conflicts.
> 
> > But it might be better to still merge the branch into drm-misc-next and
> > resolve the conflict there. I think that should avoid Linus seeing it ?
> 
> Linus doesn't mind seeing and solving conflicts.

Yes, but in this case the conflict is artificially created by us in the first
place and shouldn't be there from the day 1. I consider merging immutable tag
to DRM misc would be the less intrusive solution.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
