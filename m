Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E830F1EB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 12:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6F56ED29;
	Thu,  4 Feb 2021 11:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEC46E02B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 11:00:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C52D73A4CCF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 10:58:17 +0000 (UTC)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 36493FF80B;
 Thu,  4 Feb 2021 10:57:53 +0000 (UTC)
Date: Thu, 4 Feb 2021 11:57:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <20210204105752.GA3940374@piout.net>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
 <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
 <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
 <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 11:20:51 +0000
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
 Alessandro Zummo <a.zummo@towertech.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Gross <mgross@linux.intel.com>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/02/2021 11:50:03+0100, Hans de Goede wrote:
> Hi,
> 
> On 2/4/21 11:36 AM, Daniel Vetter wrote:
> > On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> >>
> >> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>>
> >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> >>> <patrik.r.jakobsson@gmail.com> wrote:
> >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> >>>> <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>
> >>>>> Hi guys,
> >>>>>
> >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> >>>>> immutable branch with a given tag, please pull to yours subsystems.
> >>>>
> >>>> Hi Andy,
> >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> >>>> then I should probably start looking at removing the corresponding
> >>>> parts in GMA500.
> >>>
> >>> I have noticed new commits in DRM against GMA500 and it seems now in a
> >>> conflict with my immutable branch. Are you sure you don't forget to
> >>> pull it?
> >>
> >> Hi Andy, sorry I missed pulling the immutable branch before taking the
> >> gma500 medfield removal. I was unsure how to do that through drm-misc
> >> and it's tools so I got sidetracked. What would be the correct way to
> >> fix this?
> > 
> > Imo Linus can resolve this, it's pretty trivial, as long as both pull
> > requests point it out to him.
> 
> The removal of older Intel platforms touches a number of subsystem trees,
> the idea about the IM branch was that all subsystem-trees would merge that.
> 
> I can certainly point out the problem in the pdx86 pull-req to Linus,
> but the GPIO pull-req also contains a merge of the IM branch as will
> the x86/tip and rtc pull-reqs I believe. We can add a remark to all
> the pull-reqs about the issue I guess ?
> 

FWIW, I'm not going to merge the PR in the rtc tree because it is a
simple removal and doesn't have any conflicts.

> But it might be better to still merge the branch into drm-misc-next and
> resolve the conflict there. I think that should avoid Linus seeing it ?
> 

Linus doesn't mind seeing and solving conflicts.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
