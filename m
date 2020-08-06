Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030423D763
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D172F89FDE;
	Thu,  6 Aug 2020 07:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A061289FDE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 07:34:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q76so8658016wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hm62n5nWJfQYQSRT7FGneq7QpvGO136qnX0cS28TOP4=;
 b=iy1UdrUQvj4AI5QzJyGQoO6FBXcrVB/n4g+YTAECDOb44jx4iDA09EXPKCIvJFoVs9
 pLAdLlB/Yjh8tDgn7z+Pabpx2ZDO7wojvuzSPqrv/UcUB/VT/XJIu82TrcALtCdFtVeC
 x3p892QNqvgJz6JgwOYqXmBdnRLykiYLr0LEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Hm62n5nWJfQYQSRT7FGneq7QpvGO136qnX0cS28TOP4=;
 b=hjkYNodxfT13FJLMhKGuDqX4hjrt4xD1RCGVoIzDQz7Jg3TGMfhwToJADzpgXPN3jt
 iMdzfq1ySYeFggKAMnio19Z9XkM4zdBigY4mvkf3kuZ3k6akeklck7tSGZ1Y59lGBFLq
 RZNz4xucjJwpAHeITMWxsD/FpzgC3ba8LO4ndTFjF7foJdK5h21Lcf7+jeuxhPkAMXIc
 XGaubsx56W2KbPlY+dYT6fv2qzTooIZUByJZnNqPwZh56FEzwTVRQH5vSL4Dv2yIAhlu
 A/Pfwsu5uWNZFzPXAtnueCImueX0EoGdNl+28siPvywJmce1lHSEY14kZ+t1riE4q90+
 xEqg==
X-Gm-Message-State: AOAM531+COF+asafHictUyxOvu1vA+5tCPg8PaTTTIcKzq1A8yKOck+e
 nobbZlEp3oq89dkExA/QWOf1sw==
X-Google-Smtp-Source: ABdhPJxPq3ysYOKZG3ngTkjjNcApdV2mBktQcQ2Zrr47LAqC//negOwZ9ogSW5b45w3DjOfK8YMsxQ==
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr6527177wml.70.1596699257216; 
 Thu, 06 Aug 2020 00:34:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm5537739wmc.18.2020.08.06.00.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 00:34:16 -0700 (PDT)
Date: Thu, 6 Aug 2020 09:34:14 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-ID: <20200806073414.GH6419@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Joe Perches <joe@perches.com>, Alex Deucher <alexdeucher@gmail.com>,
 Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20200805113510.18277-1-colin.king@canonical.com>
 <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
 <a8ab7d75ef9df54bd193fc88e0670b30026e7e67.camel@perches.com>
 <CADnq5_P9hfv=Zt9+m47sFC0z202x+q-Otifv7a5z4afJamtQ2Q@mail.gmail.com>
 <d720b466a2b4b7507a963f9a2605c7f81e82e7ba.camel@perches.com>
 <20200806093641.5795690c@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806093641.5795690c@canb.auug.org.au>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, Joe Perches <joe@perches.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 09:36:41AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 05 Aug 2020 15:19:38 -0700 Joe Perches <joe@perches.com> wrote:
> >
> > On Wed, 2020-08-05 at 17:27 -0400, Alex Deucher wrote:
> > > On Wed, Aug 5, 2020 at 4:53 PM Joe Perches <joe@perches.com> wrote:  
> > > > On Wed, 2020-08-05 at 16:01 -0400, Alex Deucher wrote:  
> > > > > On Wed, Aug 5, 2020 at 7:35 AM Colin King <colin.king@canonical.com> wrote:  
> > > > > > From: Colin Ian King <colin.king@canonical.com>
> > > > > > 
> > > > > > There is a spelling mistake in a DRM_ERROR message. Fix it.
> > > > > > 
> > > > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> > > > > 
> > > > > This is already fixed.  
> > > > 
> > > > This fix is not in today's -next.
> > > > 
> > > > Perhaps whatever tree it's fixed in should be in -next.
> > > >   
> > > 
> > > Weird.  It's in the drm-next tree as:
> > > 
> > > commit 4afaa61db9cf5250b5734c2531b226e7b3a3d691
> > > Author: Colin Ian King <colin.king@canonical.com>
> > > Date:   Fri Jul 10 09:37:58 2020 +0100
> > > 
> > >     drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
> > > 
> > >     There is a spelling mistake in a DRM_ERROR error message. Fix it.
> > > 
> > >     Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > 
> > > Alex
> > >   
> > > > $ git show --oneline -s
> > > > d15fe4ec0435 (HEAD, tag: next-20200805, origin/master, origin/HEAD) Add linux-next specific files for 20200805
> > > > 
> > > > $ git grep -i falied drivers
> > > > drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:                DRM_ERROR("Falied to terminate tmr\n");
> > > >   
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  
> > > > []  
> > > > > > @@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
> > > > > > 
> > > > > >         ret = psp_tmr_terminate(psp);
> > > > > >         if (ret) {
> > > > > > -               DRM_ERROR("Falied to terminate tmr\n");
> > > > > > +               DRM_ERROR("Failed to terminate tmr\n");
> > > > > >                 return ret;
> > > > > >         }  
> > 
> > Dunno.
> > 
> > Maybe it's due to some ordering of trees in
> > how -next accumulates patches?
> 
> The spelling error is introduced in two commits:
> 
>   c564b8601ae9 ("drm/amdgpu: add TMR destory function for psp")
> 
> in Linus' tree between v5.8-rc4 and rc5
> 
>   90937420c44f ("drm/amdgpu: add TMR destory function for psp")
> 
> in the amdgpu tree between two merges by the drm tree.  In this same
> interval, the error is corrected by commit
> 
>   4afaa61db9cf ("drm/amdgpu: fix spelling mistake "Falied" -> "Failed"")
> 
> so when David comes to merge the amdgpu tree in commit
> 
>   206739119508 ("Merge tag 'amd-drm-next-5.9-2020-07-17' of git://people.freedesktop.org/~agd5f/linux into drm-next")
> 
> the spelling error has been introduced on one side of the merge and
> introduced and corrected on the other.  This would have produced a
> conflict which David presumably resolved in haste by picking the HEAD
> side of the merge instead of the MERGE_HEAD side (it happens).
> 
> This could have been avoided by not cherry-picking fix commits around
> in the amdgpu process - instead having a fixes branch that is merged
> into the next branch after the fixes branch has been accepted upstream
> (that way there is only one commit for each fix and less conflicts).
> 
> I have to deal with these sort of conflicts (sometimes daily) due to
> the drm processes.  Its a pain as I have to track down each conflict to
> see if the same patches appear on both sides of merges and then try to
> figure out what other changes occur.  (This is only slightly helped by
> have the "cherry-picked from" tags in the fix commits.)

Yeah cherry-picking breaks if you only occasionally cherry-pick - then
stuff gets lost.

I'd say just apply it once more for the merge window fixes pull.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
