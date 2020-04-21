Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98E1B26E6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291106E08E;
	Tue, 21 Apr 2020 12:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2A06E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:58:19 +0000 (UTC)
IronPort-SDR: vo1IPAp8YxonptbuGOyZsOtHHFJkHSJN8Vds5zU09Q4yRRDjrQ5RDXNZYVwqXpPx39cc/hDjO4
 yc7MAwZWZTuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 05:58:19 -0700
IronPort-SDR: axJ9m9BU+wnJvpOqz/6tiNoXd/1WErtbn7nWjaZcOfojZqzDTWX9Vm1Me6VPShLcS2Mnbj6O+t
 jNFvSMbOeeyw==
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; d="scan'208";a="429521801"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.46.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 05:58:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
In-Reply-To: <20200421122726.GW3456981@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
 <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
 <20200421122726.GW3456981@phenom.ffwll.local>
Date: Tue, 21 Apr 2020 15:58:08 +0300
Message-ID: <87a735yp0f.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Marek Vasut <marex@denx.de>,
 Thomas Hellstrom <thellstrom@vmware.com>, dsd@laptop.org,
 Saeed Mahameed <saeedm@mellanox.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Geert Uytterhoeven <geert@linux-m68k.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
 jfrederich@gmail.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Apr 20, 2020 at 04:03:23PM +0200, Arnd Bergmann wrote:
>> On Mon, Apr 20, 2020 at 10:14 AM Jani Nikula
>> <jani.nikula@linux.intel.com> wrote:
>> > On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>> > > On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
>> > >> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
>> > >> >
>> > >> > If we can agree on these changes, maybe someone can merge them
>> > >> > through the drm-misc tree.
>> > >> >
>> > >> > Please review
>> > >>
>> > >> Biggest concern I have is that usability of make menuconfig is horrible,
>> 
>> No doubt about that, but that seems to be unrelated to the cleanup.
>> 
>> > >> and it's very hard to find options that are hidden by depends on. You can
>> > >> use the search interface, if you happen to know the option.
>> > >>
>> > >> Once you've surmounted that bar, the next one is trying to find what
>> > >> exactly you need to enable. Which again means endless of recursive
>> > >> screaming at Kconfig files, since make menuconfig doesn't help you at all.
>> 
>> The changes I'm doing are mostly for fbdev, which is currently the
>> odd one out. Most kernel subsystems today follow the documented
>> recommendations and only use 'depends on' for things they
>> depend on.
>> 
>> Having fbdev be the exception causes two problems:
>> 
>> - It does not make kconfig any easier to use overall, just less consistent
>>   when it is the only thing that implicitly turns on dependencies and
>>   for everything else one still has to look up what the dependencies are.
>> 
>> - Most of the problems with circular dependencies come from mixing
>>   the two methods, and most of the cases where they have caused
>>   problems in the past involve fbdev in some way.
>> 
>> I also doubt switching lots of 'depends on' to 'select' all over Kconfig
>> would improve the situation on a global level. It would simplify the
>> problem of turning something on without understanding the what it
>> does, but in turn it makes it harder to turn off something else.
>> 
>> E.g. today it is hard to turn off fbdev because that is selected by a
>> number of (partly unrelated) options, but there was a recent discussion
>> about getting distros to stop enabling fbdev out of security concerns.
>
> I've done some history digging, this is the patch that started this all:
>
> commit d2f59357700487a8b944f4f7777d1e97cf5ea2ed
> Author: Ingo Molnar <mingo@elte.hu>
> Date:   Thu Feb 5 16:03:34 2009 +0100
>
>     drm/i915: select framebuffer support automatically
>
> I.e. driver gets disabled because a new config is added which isn't
> enabled. System doesn't boot, maintainer gets angry regression report,
> select hack gets added.

Gotta love a good commit message from a decade ago.

First, it says it's a migration helper. And that the problem
specifically is that the user has a working config *without* FB enabled
as a starting point.

Now, if the starting point for a new config *now* is less than ten years
old, and it had i915 enabled, it'll also have FB enabled. Because
select. The migration part has done its job, and I think we should be
good to make some progress.

The commit message also notes the problems of select.

BR,
Jani.


> Note on the specific example the code has been reworked enough that even
> if you'd upgrade the kernel all that would get disabled now is the fbdev
> emulation on top of drm drivers, not any of the drm drivers.
>
> The above says we should have an automatic system for at least oldconfig
> (but would be nice in menuconfig too), since "break user's kernel on
> upgrade" isn't an option. And without that select is going to come back
> somewhere and make a huge nasty mess: We're definitely not going to
> fix Kconfig when fixing a regression in -rc kernels.
>
> So in theory no need to convince me that select is terrible. Practice
> disagrees unfortunately.
> -Daniel
>
>> 
>> > I'm really all for switching to using depends when that is the
>> > semantically right thing to do. In many places using select is a hack to
>> > make the UI simpler, and that's just plain wrong. We'll be doomed to
>> > perpetual randconfig build failures and duct tape fixes.
>> >
>> > I'm pretty tired of this, and I regularly ignore those duct tape fixes
>> > to i915 backlight build issues on some bizarre configs that nobody will
>> > ever use, and would not exist if depends were used throughout.
>> >
>> > I'm fine with select but only when it's restricted to symbols that have
>> > no dependencies of their own and have no UI. This is in line with
>> > Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
>> > Kconfig tool shortcoming.
>> 
>> Agreed, that is generally a good rule.
>> 
>>       Arnd

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
