Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FF1ECD16
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 12:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E093589CD8;
	Wed,  3 Jun 2020 10:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFC089CD8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 10:03:34 +0000 (UTC)
Date: Wed, 03 Jun 2020 10:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591178611;
 bh=ZGW/XwvVT8H/CczPgC9JcGhFWBDmVVzlhaj75y1gw7Y=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=VikzwVFLM3+aQ2g1GZKG5CrhQsZ79HljwUfjeihVA5TNjnxhLTrDo0PBpOTtgblg1
 dv6WzHipgaQZJfDwnnL6a9o33gAEjNJCxRSqorbGOzO2NA3IrN1VUysQPCkmqwH0uC
 NRojg8NmKSKoRCQVU81U5glj0x4m5Y+ts9ZTmjEw=
To: Jani Nikula <jani.nikula@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS documentation for userspace
Message-ID: <OOP_Z50UnFKKsuj3Xw4iWOVWL9_isjrhODeaG_7mCMsCOaWmMI1fQupzpD30Tzo4K5Cnyrpd8X6W76dZzOjs8gMQFxBU0Mh5BdEWbOkY-pI=@emersion.fr>
In-Reply-To: <87mui3oyvq.fsf@intel.com>
References: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
 <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
 <87fto5pbvv.fsf@intel.com>
 <CAKMK7uFCKH5ydzRF8AsNDuFmva+1LWa70FhMGUiFTh3ka80C1w@mail.gmail.com>
 <87mui3oyvq.fsf@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, June 27, 2019 4:59 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Sat, 22 Jun 2019, Daniel Vetter daniel@ffwll.ch wrote:
>
> > On Wed, Jun 19, 2019 at 10:16 PM Jani Nikula
> > jani.nikula@linux.intel.com wrote:
> >
> > > On Wed, 19 Jun 2019, Daniel Vetter daniel@ffwll.ch wrote:
> > >
> > > > -   figure out what to do with the libdrm manpages. Some stuff we really
> > > >     want to also document there. But geez nroff. Maybe we need to stuff
> > > >     libdrm into the kernel, dunno.
> > > >
> > >
> > > How would people feel about converting libdrm man pages to rst, and
> > > using rst2man in the build? We did that for igt man pages [1]. Looking
> > > at the diff, I think it's plain to see how that could lower the bar for
> > > contributing. And perhaps it would be easier to refactor and move
> > > documentation around too.
> >
> > I think that'd be very nice.
> >
> > > I forget, I probably used pandoc or something to do the bulk of the igt
> > > conversion, and added some manual polish on top. I'm not volunteering
> > > for the libdrm man page conversion though. ;)
> >
> > Hm, maybe dig out the old tools you used and point Simon at them?
>
> I could swear I did it with pandoc only, but the pandoc I have on my
> distro right now does not support man input. Upstream documentation
> claims it does, so I don't know what gives.
>
> If that fails, first man2html and then pandoc from html to rst works to
> an extent.
>
> Regardless, I think the hardest part is deciding what style to use in
> the rst files (all the headings and synopsis and references etc.) and
> then tediously do the manual cleanup after the conversion. It's a
> one-time effort, so there are limits to the ROI on polishing the
> toolchain.

After all these months, I've started converting the man pages to
rst [1]. Better late than never!

I've used this command to convert xml to rst:

    pandoc -s -f docbook -t rst -o man/drm.rst man/drm.xml

This mostly works but needs some rework to fixup references and
headings. You can see the final result in the MR.

[1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/72
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
