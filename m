Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6B532DBD
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 17:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424D10E58A;
	Tue, 24 May 2022 15:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C0910E58A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 15:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653407007; x=1684943007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3jwTcq7ET2KcwvsCVysRkO/gYrBPgJMTdXEBYr4oss8=;
 b=N0RAoTtg2ReTQzeW2KS9q8RAH1qZekovUIs68uPIZ5EiwSzSyxenmZMq
 Q9rp+hkPl59ZjFlxeYCEkf0B1ybw0rVDK1ru7+m8V+XMrDuGkPGnJJf4V
 zos+MzoRI2dV+fZuIR52DnduHPWDf+wg1y1v0PerP81+GYrKcuMsDe6WQ
 +I1n4aPP8LIbc6NbfhRLaXg4LFZmXBQKk09dmSxdrS3agoROyag06t5C2
 anpgsYRMhtkmsDoz0jzUFlYh0vTaSwyNzfLTqbHp/BVG5ZLah+hGwQHaJ
 yTf7LY7J25gZcRE/HTlF9d4gWLI5wBpX/DCMdbMJFvzuzsGRL1xnLvTmZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="255629594"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="255629594"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 08:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="629936569"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga008.fm.intel.com with SMTP; 24 May 2022 08:43:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 May 2022 18:43:22 +0300
Date: Tue, 24 May 2022 18:43:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <Yoz9GisEO9M4KRPB@intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com>
X-Patchwork-Hint: comment
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 24, 2022 at 11:36:22AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/23/22 13:54, Sebastian Wick wrote:
> > On Mon, May 23, 2022 at 10:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >>
> >> On Fri, 20 May 2022 17:20:50 +0200
> >> Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >>> I got pointed to this thread by Jonas Ådahl while asking some questions
> >>> the "max bpc" property related to:
> >>>
> >>> https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102#note_1382328
> >>>
> >>> The current i915 behavior which you describe here, which if I understand
> >>> things correctly is for "max bpc" to default to as high as possible is
> >>> causing problems with flickerfree boot in plymouth. Plymouth does a modeset
> >>> on the monitor's native resolution in case the BIOS/GOP setup the monitor
> >>> in a non native mode. Plymouth does not touch the "max bpc" property when
> >>> doing this modeset. Normally this works fine and when the BIOS/GOP has
> >>> already configured the monitor at the native resolution the i915 driver
> >>> will do a fastset and all is well.
> >>>
> >>> Still the modeset is causing the screen to go black for multiple seconds,
> >>> despite the resolution being unchanged. What is happening according to
> >>> the on screen mode info from the monitor is that on plymouth's modeset
> >>> the link is being configured changes from 8 bpc to 10 bpc.
> >>>
> >>> Is there anyway to avoid this without hardcoding "max bpc" to 8 in
> >>> plymouth (which would cause the same problem in the other direction
> >>> if the firmware sets up the link for 10bpc I believe) ?
> >>
> >> Hi Hans,
> >>
> >> there was an attempt to get much of the current link state information
> >> delivered to userspace, but I've forgot most about it.
> >> I did find https://lkml.org/lkml/2021/6/18/294 linked from
> >> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_963469 .
> >> I said the same in the Plymouth Gitlab issue you linked to.
> >>
> >> Personally, I would need to know all current link details for
> >> (professional) color management: am I still driving the monitor with
> >> the same signal as I did when I measured the monitor one reboot ago?
> >> If not, I cannot trust the color output and need to measure again.
> > 
> > I would go further and say that not being in control of all the link
> > details is an issue for user space.
> > 
> > Max bpc doesn't give us a minimum guarantee.
> > Bpc doesn't really make sense for YUV.
> > We don't know if the link is using RGB or YUV.
> > The Colorspace property requires user space to know if the link is RGB
> > or YUV (or does the link change depending on the Colorspace property?
> > What about the default Colorspace?).
> > Link compression can mess up colors.
> > 
> > There simply is no way to write a proper user space with the current KMS API.
> > 
> >>
> >> Nice to see there would be other uses for knowing which might be higher
> >> priority to the larger community.
> >>
> >> Would it be proper to initialize 'max bpc' to the link depth used by
> >> boot-up firmware? I guess it could make things more reliable and solve
> >> the Plymouth blanking issue, but not the professional color management
> >> use cases.
> > 
> > I was always under the impression that if you do an atomic commit
> > without changing any properties that it won't result in a mode set
> > which would clearly make the current behavior a bug.
> 
> I agree, IMHO the i915 driver currently setting max-bpc to 12 by default,
> causing an unrequested link re-negotation on the first modeset is
> a bug in the i195 driver and is also the root cause of this
> plymouth bug-report:
> 
> https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102

Why would anyone want to run at 8bpc when they have a panel with
higher color depth? So I think someone is going to be doing that
modeset eventually anyway.

-- 
Ville Syrjälä
Intel
