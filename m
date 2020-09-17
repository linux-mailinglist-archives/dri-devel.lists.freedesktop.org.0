Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5326DA66
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22F56EA61;
	Thu, 17 Sep 2020 11:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34746E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:36:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l9so1695150wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=s7q5YyahCsObhi1zWedFvl1JKG52ECokbcXLRCoQrnU=;
 b=BSZuP13J+0n/zOaiLWS+1EpxuK5QgJRgMWqNV7UAsp+rWkUNS/+anNgHvQ0MFvNquD
 aU+XG9mfjBVfTpF+eOh8bdrnogFq0s1yoFXWfhVZtEiv3m9aiGnQY3AxWqu9mrW+ygi3
 2SziRqVBpZLj0IUwsZgb5wbvBb/7+Fb+hL6K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=s7q5YyahCsObhi1zWedFvl1JKG52ECokbcXLRCoQrnU=;
 b=YjkDjFEd42nJA8bzuFpIiIUfywgp2YCRCo87Fl9XT0Yjqw4QijpH6TOt0cyplEnBMJ
 sgJktIHcTmONMRrq5orHYmftCB6LS6w225rSwPnjtRVcGdXTJYZRavrCJsoL9tU0YS57
 lDj+9eSHeRPxRt159EGTRFwOHUSx0yI6+SGSwg6o79lgO47+GBhiVQwt80w+CH2enfBY
 prMKDmSks44Ne5IqlLB/gysGyd3krhFIXdkdM2EbnFgM7af6rVYr6cNna3Aj2/DIfz05
 m+oQoLplsIBySdmfw61j5e5zrnw0fsTzCVYAfNYgqfWuNWnYWiaYYiss5p7q/J2lTnRN
 w+FA==
X-Gm-Message-State: AOAM532qrTq5qar9IXYjbv10/ls9f/UFRlITdeWFXXf5ZGhxIg3ym9iI
 tOS75wBLRlJ84rEn4Ww02HS2NfofMAra5oxx
X-Google-Smtp-Source: ABdhPJzio+ECTKt+6EiLIp8tan8dQZTPez2BTgYYJ9I1xWYcE+zdkW/f/TxSUpd8ooY7OlqcAdOLJQ==
X-Received: by 2002:a1c:2441:: with SMTP id k62mr9508146wmk.178.1600342614380; 
 Thu, 17 Sep 2020 04:36:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l19sm10482326wmi.8.2020.09.17.04.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:36:53 -0700 (PDT)
Date: Thu, 17 Sep 2020 13:36:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH v2 0/4] Enlarge tracepoints in the display component
Message-ID: <20200917113651.GT438822@phenom.ffwll.local>
Mail-Followup-To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
 <20200916091214.GY438822@phenom.ffwll.local>
 <e05be8ec-e73b-7fd6-efca-4a360e9ebb57@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e05be8ec-e73b-7fd6-efca-4a360e9ebb57@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 11:27:27AM -0400, Kazlauskas, Nicholas wrote:
> On 2020-09-16 5:12 a.m., Daniel Vetter wrote:
> > On Fri, Sep 11, 2020 at 10:59:23AM -0400, Rodrigo Siqueira wrote:
> > > Debug issues related to display can be a challenge due to the complexity
> > > around this topic and different source of information might help in this
> > > process. We already have support for tracepoints inside the display
> > > component, i.e., we have the basic functionalities available and we just
> > > need to expand it in order to make it more valuable for debugging. For
> > > this reason, this patchset reworks part of the current tracepoint
> > > options and add different sets of tracing inside amdgpu_dm, display
> > > core, and DCN10. The first patch of this series just rework part of the
> > > current tracepoints and the last set of patches introduces new
> > > tracepoints.
> > > 
> > > This first patchset version is functional. Please, let me know what I
> > > can improve in the current version but also let me know what kind of
> > > tracepoint I can add for the next version.
> > > 
> > > Finally, I want to highlight that this work is based on a set of patches
> > > originally made by Nicholas Kazlauskas.
> > > 
> > > Change in V2:
> > > - I added another patch for capturing the clock state for different display
> > >    architecture.
> > 
> > Hm I'm not super sure tracepoints for state dumping are the right thing
> > here. We kinda have the atomic state dumping code with all the various
> > callbacks, and you can extend that pretty easily. Gives you full state
> > dump in debugfs, plus a few function to dump into dmesg.
> > 
> > Maybe what we need is a function to dump this also into printk tracepoint
> > (otoh with Sean Paul's tracepoint work we'd get that through the dmesg
> > stuff already), and then you could do it there?
> > 
> > Upside is that for customers they'd get a much more consistent way to
> > debug display issues across different drivers.
> > 
> > For low-level hw debug what we do is give the hw guys an mmio trace, and
> > they replay it on the fancy boxes :-) So for that I think this here is
> > again too high level, but maybe what you have is a bit different.
> > -Daniel
> 
> We have raw register traces, but what I find most useful is to be able to
> see are the incoming DRM IOCTLs, objects and properties per commit.
> 
> Many of the bugs we see in display code is in the conversion from DRM -> DM
> -> DC state. The current HW state is kind of useless in most cases, but the
> sequence helps track down intermittent problems and understand state
> transitions.
> 
> Tracepoints provide everything I really need to be able to track down these
> problems without falling back to a full debugger. The existing DRM prints
> (even at high logging levels) aren't enough to understand what's going on in
> most cases in our driver so funneling those into tracepoints to improve perf
> doesn't really help that much.
> 
> I think this kind of idea was rejected for DRM core last year with Sean's
> patch series but if we can't get them into core then I'd like to get them
> into our driver at least. These are a cleaned up version of Sean's work + my
> work that I end up applying locally whenever I debug something.

Nah, Sean's series wasn't rejected. It's simply stuck waiting for review.
So if your goal is to get better dumping going on, I think combining this
with Sean's work (and getting that reviewed), plus then tapping into the
atomic state dumping code. Then you know what was requested, plus what your
atomic_check code computed should be the hw state, and you can compare
that with the register dumps you already grab.

Feels at least like a more complete and flexible solution than ad-hoc
tracepoints for debuggin in each driver. The idea behind Sean's work is
also that we'd have a blackbox recorder for any drm issues which distros
in the field could use. So driver doing their own debug output doesn't
sound super great.

I think Siqueira already chatted a bit with Sean.
-Daniel

> 

> Regards,
> Nicholas Kazlauskas
> 
> > 
> > > 
> > > Rodrigo Siqueira (4):
> > >    drm/amd/display: Rework registers tracepoint
> > >    drm/amd/display: Add tracepoint for amdgpu_dm
> > >    drm/amd/display: Add pipe_state tracepoint
> > >    drm/amd/display: Add tracepoint for capturing clocks state
> > > 
> > >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  17 +
> > >   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 712 +++++++++++++++++-
> > >   .../dc/clk_mgr/dce112/dce112_clk_mgr.c        |   5 +
> > >   .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |   4 +
> > >   .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |   4 +
> > >   .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |   4 +
> > >   .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |   4 +
> > >   drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 +
> > >   .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |   5 +
> > >   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
> > >   10 files changed, 747 insertions(+), 36 deletions(-)
> > > 
> > > -- 
> > > 2.28.0
> > > 
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
