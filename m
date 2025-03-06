Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C965A54FA4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D4610E9DE;
	Thu,  6 Mar 2025 15:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="eJIOlHRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131710E9DE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=I6efTm9PV4pBjdbnqkqM78JjSWuS+IsxuUu8XtCPY50=; b=eJIOlHRmlzyVk07y
 JYR+R2Ub5dqbL9UX6DE2heD/fmdKnJtlowguv8rM3dWdPIrtuWOAd8aEc6LdVwTefxFpLQZGTu+0D
 LPc/qpIzBHiL4xb3ZIbd2DN91Ux/kr/yLmEC4gJmbqxviEtDcxNpDr8rY0M1wIGJJj7dKJieyLnQS
 IF1NItAWIgcy5iw8Rz4OFwd5VYa0/oTv/5vyAy7S+tGGuBSTDdvk0Usv2nveZt4OkZAgo4DbA8cHX
 aBnrtKbMR6Acr9V1HaiGVKIeJRnZWhKfhOoTfnrXXaNi/iiX7TDyTAf2YRt2wX0Sgw3DW5md6YC6m
 PO+8jVzw52UovEM7uQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tqDWO-0039N5-0Y;
 Thu, 06 Mar 2025 15:52:28 +0000
Date: Thu, 6 Mar 2025 15:52:28 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gma500: Remove unused mrst_helper_funcs
Message-ID: <Z8nEvKh5evPw7qxp@gallifrey>
References: <20250201011434.453879-1-linux@treblig.org>
 <CAMeQTsa8enkergRai6ixmE-ivTQgWazoTJ9stMWSgzobexphJw@mail.gmail.com>
 <Z8m8i0iqgDUk5uFk@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8m8i0iqgDUk5uFk@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:52:05 up 302 days,  3:06,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * Patrik Jakobsson (patrik.r.jakobsson@gmail.com) wrote:
> > On Sat, Feb 1, 2025 at 2:14 AM <linux@treblig.org> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > The mrst_helper_funcs const was added in 2013 by
> > > commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
> > > and commented as 'Not used yet'.
> > >
> > > It's not been used since, so remove it.
> 
> Hi Patrik,
> 
> > You talk about mrst_helper_funcs but the patch removes
> > mrst_clock_funcs. I assume this is not intentional.
> 
> Oops! Thanks for spotting that, I'll send a v2 fixing the commit
> message; I think I was intending to write something like
> 'the helper functions it references are still used elsewhere.'
> 
> v2 coming up soon.

See message 20250306155155.212599-1-linux@treblig.org.

Thanks again,

Dave

> Dave
> 
> > -Patrik
> > 
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  drivers/gpu/drm/gma500/oaktrail_crtc.c | 7 -------
> > >  1 file changed, 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > > index de8ccfe9890f..ea9b41af0867 100644
> > > --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > > +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > > @@ -658,10 +658,3 @@ const struct drm_crtc_helper_funcs oaktrail_helper_funcs = {
> > >         .prepare = gma_crtc_prepare,
> > >         .commit = gma_crtc_commit,
> > >  };
> > > -
> > > -/* Not used yet */
> > > -const struct gma_clock_funcs mrst_clock_funcs = {
> > > -       .clock = mrst_lvds_clock,
> > > -       .limit = mrst_limit,
> > > -       .pll_is_valid = gma_pll_is_valid,
> > > -};
> > > --
> > > 2.48.1
> > >
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
