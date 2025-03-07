Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14085A569F2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465AE10EBC0;
	Fri,  7 Mar 2025 14:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="MHwg6mD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9468910EBC9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=UBQ6q3i2ePjT2i8U7tBuzMQdDLItSqljC2sOjafdBNw=; b=MHwg6mD546FqX8Qj
 TTP1dLVNaTx/Us4Jukg/gkx3CPbq9+KmF18KUfEyNmQARN+9/JlkGWgYJ/vydPZsvCMCrqwYTDjG1
 yWPWAei5PZFGyapLmjmB9VIyCypdeDm/SIjSn6d8Qw+fyNNNKNBBn/AxPIZi6dfa+oWVnWZT1UxAG
 sucV4PDp3n+rMZH8mvQO/6al7/VEhUdjVKLekXH5+KWg55EVrmMAEVVnuxCbYOVa/fv8NbEd/hkAy
 GNrdja++lzROCpZDPNbBiHzRXQoJYPuzpmqo1qzhOrWogkE59ADqBe5qO0p1hWzvhzHL5mhaW8LFZ
 M6uvPM+z3/DTLgJvJQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tqYLQ-003Phw-2S;
 Fri, 07 Mar 2025 14:06:32 +0000
Date: Fri, 7 Mar 2025 14:06:32 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: Remove unused mrst_clock_funcs
Message-ID: <Z8r9aE0mtb9_R0p8@gallifrey>
References: <20250306155155.212599-1-linux@treblig.org>
 <CAMeQTsaNfQJ=OgWXwQ2bAxa1xbbQxAWDYEcokQ3VJE_EApPbzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMeQTsaNfQJ=OgWXwQ2bAxa1xbbQxAWDYEcokQ3VJE_EApPbzQ@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 14:06:22 up 303 days,  1:20,  1 user,  load average: 0.03, 0.01, 0.00
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

* Patrik Jakobsson (patrik.r.jakobsson@gmail.com) wrote:
> On Thu, Mar 6, 2025 at 4:52 PM <linux@treblig.org> wrote:
> >
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > The mrst_clock_funcs const was added in 2013 by
> > commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
> > and commented as 'Not used yet'.
> >
> > It's not been used since, so remove it.
> > The helper functions it points to are still used elsewhere.
> >
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Applied to drm-misc-next

Thanks!

Dave

> Thanks
> 
> 
> > ---
> > v2
> >   commit message fixed to use correct struct name, and add
> >   note about the functions used still being used.
> >
> >  drivers/gpu/drm/gma500/oaktrail_crtc.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > index de8ccfe9890f..ea9b41af0867 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> > @@ -658,10 +658,3 @@ const struct drm_crtc_helper_funcs oaktrail_helper_funcs = {
> >         .prepare = gma_crtc_prepare,
> >         .commit = gma_crtc_commit,
> >  };
> > -
> > -/* Not used yet */
> > -const struct gma_clock_funcs mrst_clock_funcs = {
> > -       .clock = mrst_lvds_clock,
> > -       .limit = mrst_limit,
> > -       .pll_is_valid = gma_pll_is_valid,
> > -};
> > --
> > 2.48.1
> >
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
