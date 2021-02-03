Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395C30D824
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BFB6EA5E;
	Wed,  3 Feb 2021 11:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6699A6EA5C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:08:19 +0000 (UTC)
IronPort-SDR: sP2FN2chtq3Hlv1SQ88Rkux43samZ1F7H+twfxCfXFPgeXyhMr9SijV7AnLhUzpu3At1V97p4T
 LgFO6JDhElOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="180249411"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="180249411"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 03:08:18 -0800
IronPort-SDR: o134eirMFPeTUWOydEEw8aYttN75QcofTnGYMkGLqCpwZuyydYfYGmESVeFcTSWS2xu+NjzHnO
 eEoISbHn+T7w==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="433366277"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 03:08:15 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1l7G15-001c7c-VW; Wed, 03 Feb 2021 13:08:11 +0200
Date: Wed, 3 Feb 2021 13:08:11 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <YBqEG4GGXmfD6f0f@smile.fi.intel.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
 <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
 <8d350b8c-5f1d-256d-cdc5-8501af0c0cad@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d350b8c-5f1d-256d-cdc5-8501af0c0cad@redhat.com>
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
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Gross <mgross@linux.intel.com>, linux-watchdog@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 11:35:59AM +0100, Hans de Goede wrote:
> On 2/3/21 10:54 AM, Andy Shevchenko wrote:
> > On Tue, Jan 26, 2021 at 4:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> >>> Hi guys,
> >>>
> >>> This is first part of Intel MID outdated platforms removal. It's collected into
> >>> immutable branch with a given tag, please pull to yours subsystems.
> >>>
> >>> (All changes are tagged by the respective maintainers)
> > 
> >> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
> >> these 2 could be merged independently.
> >>
> >> Anyways I just did a test-merge and there is no conflict, so everything is ok.
> >>
> >> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
> >> before the merge-window.
> >>
> >> I'm going to hold off on doing that for a bit for now in case one of the other
> >> subsys maintainers has any objections.
> > 
> > Any news on this? Have you pulled it somewhere (I don't see it in Linux next)?
> 
> I was going through all pending pdx86 stuff yesterday to prep for the upcoming
> merge-window. I was doing so in FIFO order and I ran out of steam just as I got
> to this pull-req.
> 
> So today is a new day and after sending out a fixes pull-req for 5.11 this is
> (was) the first thing on my list.
> 
> I've merged this into my review-hans now (and I will push it to for-next soon).
> 
> I did one last check of all the commits after merging, and I found one small
> issue.
> 
> The "gpio: msic: Remove driver for deprecated platform" commit forgets to
> drop the Makefile line for the msic driver:
> 
> obj-$(CONFIG_GPIO_MSIC)                 += gpio-msic.o
> 
> This is not a reason to redo the entire branch, but it would be good if you
> can do a follow up patch to fix this.

Indeed. Thanks for catching this, I'll fixed locally and will send it soon.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
