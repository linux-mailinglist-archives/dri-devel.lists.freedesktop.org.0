Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C4A30C17D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 15:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1389E1B;
	Tue,  2 Feb 2021 14:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FEB89E1B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:27:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id f16so2637563wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1hqFuaWl5nS3ID5NlZkWngtzcUfY03tVaIxNYONF2d4=;
 b=e9cwZeLtqeQnyBk+AOPtvA8ygfALysFm+Xx+TXn00PXf0lIeUm0qisPVZwF/YdrNca
 KNQbIWbsL4iz6DTowmc07/IZ5KZ1y5D3DgM16QkH4gNRzAkaQeNFUGexKEIF8t1SLnwL
 Ct9eLjt54hp9mEReNXquNQO8xgXugYwg8Jh8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1hqFuaWl5nS3ID5NlZkWngtzcUfY03tVaIxNYONF2d4=;
 b=WmnK8RBhUX7ipcTcdAo2lqM2BrNSmXnmxsukOAIoynSAplE+k5nBUQA8Vd/8J0nBKS
 I4ZdT/AlwUvPsOUymi188T1cTBGYYQiR8ppuOerEnnLTS8aIU6HcnL3Hh4f0Q/xg4jRK
 5DKVshUQpQ/320QTNQm9FQmbbwsN8FSQ8gpKc4Di93hCu5ODeuXMV5jurFM1j0U0wyFP
 oNgrADV4vD5So24cNG+hNuYwFzF6IpGuA0OgUQiUC6ygmbOV4oAOyxAvo5YBiq/bec2i
 w2mhT/gbNaJmZ87vwoawT+t/uDM+kMwjC+oMx+iAMakCkI3LuvJXTgCUj+FihQw9TY9q
 HL0g==
X-Gm-Message-State: AOAM533HCk9jLU3cDNgLgphN8Usj4qSekD/zxx+gj3z2NWt31IKvAcEw
 RBS7yNYhs8t8r34+3JVBo505Sw==
X-Google-Smtp-Source: ABdhPJz4P3FFRHHRWA/dJPB5VeDBxhn2ZKAufv17hTJWsIF1v4mWOKGikgcVZMYwYQQi4Cs92hm71w==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr3916069wma.26.1612276022891; 
 Tue, 02 Feb 2021 06:27:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d3sm35171328wrp.79.2021.02.02.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 06:27:02 -0800 (PST)
Date: Tue, 2 Feb 2021 15:27:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/3] Experimental freesync video mode optimization
Message-ID: <YBlhNN4FSjnUEV+x@phenom.ffwll.local>
References: <20210119155029.18943-1-aurabindo.pillai@amd.com>
 <20210122103248.779e70bf@eldfell>
 <YAqeHZlDBrgALLo9@phenom.ffwll.local>
 <CADnq5_NkgDQqm8uTziTOhb9sv3jEzyfoCt_q_P1RA_mvpmkfEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NkgDQqm8uTziTOhb9sv3jEzyfoCt_q_P1RA_mvpmkfEQ@mail.gmail.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Thong Thai <thong.thai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Wayne Lin <wayne.lin@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 10:16:45AM -0500, Alex Deucher wrote:
> On Fri, Jan 22, 2021 at 4:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jan 22, 2021 at 10:32:48AM +0200, Pekka Paalanen wrote:
> > > On Tue, 19 Jan 2021 10:50:26 -0500
> > > Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
> > >
> > > > Changes in V5
> > > > =============
> > > >
> > > > * More info in commit messages on the rationale of changes being added
> > > > to the kernel.
> > > > * Minor fixes
> > >
> > > Hi,
> > >
> > > thank you for adding the explanations in the commit messages I asked
> > > for. It is now up to DRM maintainers to determine if this is
> > > conceptually fine.
> > >
> > > I do see that apparently setting the opt-in option does not yet taint
> > > the kernel although Daniel Vetter suggested it might be a good idea. I
> > > guess tainting the kernel would make it easier to remove this feature
> > > in the future because it would be easier to dismiss people that claim a
> > > kernel regression due to the removal.
> >
> > Reading the descriptions I'm honestly not sure why this isn't enabled by
> > default?
> >
> > Maybe the explanations should also capture why this is maybe not a good
> > idea ...
> 
> I don't know that it's a bad idea, I guess we are just cautious to
> avoid unforeseen consequences until we have more real world experience
> using the feature.  One issue brought up as a possible problem, but
> not actually verified to my knowledge, was the possibility of using a
> bit more power with freesync modes.  E.g., if you just change the
> front porch to set the refresh to 48 Hz on a 90Hz mode, you are
> technically running the display phys at the higher clock speed so you
> can seamlessly transition to 90Hz or whatever.  I don't know that it
> uses that much additional power and lets you get some nice features in
> a relatively seamless manner that already works today with most media
> players.

Hm yeah that's a good point. You can't change the dotclock to something
lower on the fly? We have that on some intel laptops, but it's kinda been
superseeded with manual update (PSR on DP) in most places, and then
everything is shut down anyway. But either of these happen automatically,
and we even have self refresh helpers now if you don't have hw assitance
for these to automatically ramp back up to max refresh rate (Intel loves
baking stuff into hw a bit too much, so drm/i915 isn't using it).

> I guess for media player folks, is this something you'd like as is?  A
> more explicit API may be nicer, but I think I think the ultimate
> solution will end up getting tied up in what are plans are for bigger
> features like more advanced flip queues and stuff like that.  So this
> seems like a nice intermediate step.

Yeah I think knobs to figure out details is good, but ime they're just
have a tendency to stay around forever and eventually we suffer from
combinatorial explosion and also a bit (for this one here) uapi
fragmentation. Which isn't nice if the solution to a user problem is "add
this obscure kernel cmdline to your grub file".

That's why I think the taining module param is a good interim step for
figuring stuff out, while reducing a bit the risk it'll become a permanent
thing users have to fiddle.

Cheers, Daniel

> 
> Alex
> 
> 
> > -Daniel
> >
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > >
> > > > --
> > > >
> > > > This patchset enables freesync video mode usecase where the userspace
> > > > can request a freesync compatible video mode such that switching to this
> > > > mode does not trigger blanking.
> > > >
> > > > This feature is guarded by a module parameter which is disabled by
> > > > default. Enabling this paramters adds additional modes to the driver
> > > > modelist, and also enables the optimization to skip modeset when using
> > > > one of these modes.
> > > >
> > > > --
> > > >
> > > > Aurabindo Pillai (3):
> > > >   drm/amd/display: Add module parameter for freesync video mode
> > > >   drm/amd/display: Add freesync video modes based on preferred modes
> > > >   drm/amd/display: Skip modeset for front porch change
> > > >
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 401 ++++++++++++++++--
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> > > >  4 files changed, 382 insertions(+), 35 deletions(-)
> > > >
> > >
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
