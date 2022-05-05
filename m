Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4651C2D8
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD4E10E448;
	Thu,  5 May 2022 14:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BD810E447;
 Thu,  5 May 2022 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651761986; x=1683297986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4+kd0vjMMPtv/zM2IFvgaogRom6Tf4HdZlD6H0t9CP0=;
 b=Ng+++amhxRW65S0WX6OwPnkGPAAStAPxP9QzbcUWX3nVZ9Ah7nh/YHgg
 LriHlkvBX59+vsKlpkxtwwktXhcDj0c8bS9KY7DhVwJVHWtv1gjKTZSPW
 1nXTyT2rRCe1gzRla6Y1u/Pz1Gd3xDddos05u4IH33dHvdBKrZ4Wtqz7z
 exTwS8Zlvediw4HLL04KJ4B+R8wTd107+K1V+fP58gQTkS+wsblSoUkOS
 RjfSo7a4xmLx/dpkVaQxTnPtClbFkGA4C+7mbFuoJsr8fWLW+cpYvdi3e
 4/SKAECS3pIfFNjhFCab4JzQLkI/r9qi/Byyn9RQpbnjPZi+k5AkBcoWD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="250115059"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="250115059"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 07:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="568618280"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga007.fm.intel.com with SMTP; 05 May 2022 07:46:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 May 2022 17:46:19 +0300
Date: Thu, 5 May 2022 17:46:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX transfers
Message-ID: <YnPjO4kbjezQl5Da@intel.com>
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com>
 <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
 <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 02:10:08PM -0400, Lyude Paul wrote:
> On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> > Hi,
> > 
> > On Wed, May 4, 2022 at 5:21 AM Ville Syrjälä
> > <ville.syrjala@linux.intel.com> wrote:
> > > 
> > > On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson wrote:
> > > > When doing DP AUX transfers there are two actors that need to be
> > > > powered in order for the DP AUX transfer to work: the DP source and
> > > > the DP sync. Commit bacbab58f09d ("drm: Mention the power state
> > > > requirement on side-channel operations") added some documentation
> > > > saying that the DP source is required to power itself up (if needed)
> > > > to do AUX transfers. However, that commit doesn't talk anything about
> > > > the DP sink.
> > > > 
> > > > For full fledged DP the sink isn't really a problem. It's expected
> > > > that if an external DP monitor isn't plugged in that attempting to do
> > > > AUX transfers won't work. It's also expected that if a DP monitor is
> > > > plugged in (and thus asserting HPD) that it AUX transfers will work.
> > > > 
> > > > When we're looking at eDP, however, things are less obvious. Let's add
> > > > some documentation about expectations. Here's what we'll say:
> > > > 
> > > > 1. We don't expect the DP AUX transfer function to power on an eDP
> > > > panel. If an eDP panel is physically connected but powered off then it
> > > > makes sense for the transfer to fail.
> > > 
> > > I don't agree with this. I think the panel should just get powred up
> > > for AUX transfers.
> > 
> > That's definitely a fair thing to think about and I have at times
> > thought about trying to make it work that way. It always ends up
> > hitting a roadblock.

How do you even probe the panel initially if you can't power it on
without doing some kind of full modeset/etc.?

> > 
> > The biggest roadblock that I recall is that to make this work then
> > you'd have to somehow ensure that the bridge chain's pre_enable() call
> > was made as part of the AUX transfer, right? Since the transfer
> > function can be called in any context at all, we have to coordinate
> > this with DRM. If, for instance, DRM is mid way through powering the
> > panel down then we need to wait for DRM to fully finish powering down,
> > then we need to power the panel back up. I don't believe that we can
> > just force the panel to stay on if DRM is turning it off because of
> > panel power sequencing requirements. At least I know it would have the
> > potential to break "samsung-atna33xc20.c" which absolutely needs to
> > see the panel power off after it's been disabled.
> > 
> > We also, I believe, need to handle the fact that the bridge chain may
> > not have even been created yet. We do AUX transfers to read the EDID
> > and also to setup the backlight in the probe function of panel-edp. At
> > that point the panel hasn't been linked into the chain. We had _long_
> > discussions [1] about moving these out of probe and decided that we
> > could move the EDID read to be later but that it was going to really
> > ugly to move the AUX backlight later. The backlight would end up
> > popping up at some point in time later (the first call to panel
> > prepare() or maybe get_modes()) and that seemed weird.
> > 
> > [1]
> > https://lore.kernel.org/lkml/CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com/
> > 
> > 
> > > Otherwise you can't trust that eg. the /dev/aux
> > > stuff is actually usable.
> > 
> > Yeah, it's been on my mind to talk more about /dev/aux. I think
> > /dev/aux has some problems, at least with eDP. Specifically:
> > 
> > 1. Even if we somehow figure out how to power the panel on as part of
> > the aux transfer, we actually _still_ not guaranteed to be able to
> > talk to it as far as I understand. My colleague reported to me that on
> > a system he was working with that had PSR (panel self refresh) that
> > when the panel was powered on but in PSR mode that it wouldn't talk
> > over AUX. Assuming that this is correct then I guess we'd also have to
> > do even more coordination with DRM to exit PSR and block future
> > transitions of PSR. (NOTE: it's always possible that my colleague ran
> > into some other bug and that panels are _supposed_ to be able to talk
> > in PSR. If you think this is the case, I can always try to dig more).
> 
> TBH - the coordination with drm I don't think would be the difficult part, as
> we'd just need to add some sort of property (ideally invisible to userspace)
> that can be used in an atomic commit to disable PSR - similar to how we enable
> CRC readback from sysfs in the majority of DRM drivers. That being said
> though, I think we can just leave the work of solving this problem up to
> whoever ends up needing this to work.

The driver should just disable/prevent PSR when doing AUX if the hardware
can't guarantee the PSR and AUX won't interfere with each other.

For i915 we have no problems with powering the panel on for AUX, but
there is still a race with PSR vs. AUX because both use the same hardware
internally. I've been nagging at people to fix this for i915 but I don't 
think it still got done :( Originally we were supposed to get a hardware
mutex for this but that plan got scrapped for some reason.

> 
> > 
> > 2. I'm not totally convinced that it's a great idea, at least for eDP,
> > for userspace to be mucking with /dev/aux. For DP's case I guess
> > /dev/aux is essentially enabling userspace drivers to do things like
> > update firmware on DP monitors or play with the backlight. I guess we
> > decided that we didn't want to add drivers in the kernel to handle
> > this type of stuff so we left it for userspace? For eDP, though, there
> 
> The main reason DP AUX got exposed to userspace in the first place was for
> usecases like fwupd,

My memory says the original reason was debugging. Or at least I had
no idea fwupd had started to use this until I saw some weird looking
DPCD addresses in some debug log.

But I suppose it's possible there were already plans for firmware
updates and whatnot and it just wasn't being discussed when this was
being developed.

-- 
Ville Syrjälä
Intel
