Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD5931011
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041EC10E303;
	Mon, 15 Jul 2024 08:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UYi4kcm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88510E332
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:40:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-426719e2efeso4963685e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721032822; x=1721637622; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RgzA7sj7xpV2smokBUe81ciZuXU3I/NBeyJ+R2ni3eA=;
 b=UYi4kcm1HJQbCdWkrBTB26yFEKdzcuj+hzNpp1nhAxwikoi31QoEbEz/lLnK+StYCh
 o4MdXCWROJ4Cwa9kVrpy02ZJwSGpvf8Q5+Fqpwo9kL1Lf/gVSZx/u84gBJUgFvQV57w+
 BuyiH0YBf+V4YKAweJB5Fn6rC7m4hRiSEHMSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721032822; x=1721637622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgzA7sj7xpV2smokBUe81ciZuXU3I/NBeyJ+R2ni3eA=;
 b=GixxTdcocsx/f2zUgvDcnEQpaa3XoNEuSmCd9K16QQhddMKR4V+OXyJym0N489CJCe
 BRL3Ub+tthC3nGFF2uVbzs9179Xb/2fAOjmtDzZQZYVwDWEu15tMkp9iW4WVeIHC6uRk
 cuHwh8ItibohmR8e+2g+fjJJpr2/j2eVlMer+fXyBbMWqRmcX52NkdRO01B6z8EhelwZ
 t9g9IJHX3E0d/iduSIlO4lWgWSdBAL8vXy/7c/F2TdzOqaTnrnTY5/nQeNKg1j8lQddZ
 kIo6y2ipRpDvJJDu2yQ0Y2LCP8ofQI8YBHA7e4/JqFjA3WOOBng7TpWH3xK0K/XN7D8U
 5sMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLm85To9MMtVIkEH6HUf7p6SPEhLFPs00PrAoeGxiPyZWI5wydmdr1UUI0HYSgEzmWJwQFzA0volvSiYeTbcewxE3H9H+0vJdcOAA8D0G7
X-Gm-Message-State: AOJu0YyxM2eklBx8PWuknYPxEtMx20s34iX0h0mpa+oifARxyiC4mrn9
 xCol5jPa95pZdoGfFW27ccTu4v/N72oDbe6vBbDWvzEjG5YKtGN2vMhamODWb1g=
X-Google-Smtp-Source: AGHT+IEAxg/lboQUShtz50qwIecCeh+qhuGdeeZLdppErsWqo+x1aqyB1cBh5B7prERa9AvlPR/Uow==
X-Received: by 2002:a05:600c:4f49:b0:427:9f6f:9c00 with SMTP id
 5b1f17b1804b1-4279f6f9c11mr39749665e9.6.1721032821837; 
 Mon, 15 Jul 2024 01:40:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3ee4sm5738192f8f.7.2024.07.15.01.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 01:40:21 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:40:19 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
Message-ID: <ZpTgcwAGmJEi4cYX@phenom.ffwll.local>
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
 <20240708202907.383917-2-hamza.mahfooz@amd.com>
 <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local>
 <Zo0MSB7eSp1H0iPI@phenom.ffwll.local>
 <3214e5a3-a616-4bcd-8f1d-238e1bf346fe@amd.com>
 <Zo5Ju2bWFUVBHeKX@phenom.ffwll.local>
 <bd3da8d0-a60f-4905-b27d-cf549844c683@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd3da8d0-a60f-4905-b27d-cf549844c683@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Wed, Jul 10, 2024 at 05:13:18PM -0400, Hamza Mahfooz wrote:
> On 7/10/24 04:43, Daniel Vetter wrote:
> > On Tue, Jul 09, 2024 at 10:02:08AM -0400, Hamza Mahfooz wrote:
> > > On 7/9/24 06:09, Daniel Vetter wrote:
> > > > On Tue, Jul 09, 2024 at 11:32:11AM +0200, Daniel Vetter wrote:
> > > > > On Mon, Jul 08, 2024 at 04:29:07PM -0400, Hamza Mahfooz wrote:
> > > > > > Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
> > > > > > enable PSR more quickly for displays that support it.
> > > > > > 
> > > > > > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > > > > > ---
> > > > > >    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
> > > > > >    1 file changed, 22 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > > index fdbc9b57a23d..ee6c31e9d3c4 100644
> > > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > > @@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
> > > > > >    static void manage_dm_interrupts(struct amdgpu_device *adev,
> > > > > >    				 struct amdgpu_crtc *acrtc,
> > > > > > -				 bool enable)
> > > > > > +				 struct dm_crtc_state *acrtc_state)
> > > > > >    {
> > > > > >    	/*
> > > > > >    	 * We have no guarantee that the frontend index maps to the same
> > > > > > @@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
> > > > > >    	 *
> > > > > >    	 * TODO: Use a different interrupt or check DC itself for the mapping.
> > > > > >    	 */
> > > > > > -	int irq_type =
> > > > > > -		amdgpu_display_crtc_idx_to_irq_type(
> > > > > > -			adev,
> > > > > > -			acrtc->crtc_id);
> > > > > > +	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
> > > > > > +							   acrtc->crtc_id);
> > > > > > +	struct dc_crtc_timing *timing;
> > > > > > +	int offdelay;
> > > > > > +
> > > > > > +	if (acrtc_state) {
> > > > > > +		timing = &acrtc_state->stream->timing;
> > > > > > +
> > > > > > +		/* at least 2 frames */
> > > > > > +		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
> > > > > > +						       (uint64_t)100),
> > > > > > +						      timing->v_total),
> > > > > > +					    timing->h_total) + 1;
> > > > > 
> > > > > Yeah, _especially_ when you have a this short timeout your really have to
> > > > > instead fix the vblank driver code properly so you can enable
> > > > > vblank_disable_immediate. This is just cheating :-)
> > > > 
> > > > Michel mentioned on irc that DC had immediate vblank disabling, but this
> > > > was reverted with f64e6e0b6afe ("Revert "drm/amdgpu/display: set
> > > > vblank_disable_immediate for DC"").
> > > > 
> > > > I haven't looked at the details of the bug report, but stuttering is
> > > > exactly what happens when the driver's vblank code has these races. Going
> > > > for a very low timeout instead of zero just means it's a bit harder to hit
> > > > the issue, and much, much harder to debug properly.
> > > > 
> > > > So yeah even more reasons to look at the underlying root-cause here I
> > > > think.
> > > > -Sima
> > > 
> > > The issue is that DMUB (display firmware) isn't able to keep up with all of
> > > the requests that the driver is making. The issue is fairly difficult to
> > > reproduce (I've only seen it once after letting the system run with a
> > > program that would engage PSR every so often, after several hours).
> > > It is also worth noting that we have the same 2 idle frame wait on the
> > > windows
> > > driver, for the same reasons. So, in all likelihood if it is your opinion
> > > that
> > > the series should be NAKed, we will probably have to move the wait into the
> > > driver as a workaround.
> > 
> > Well that's an entirely different reason, and needs to be recorded in the
> > commit log that disabling/enabling vblank is too expensive and why. Also
> > would be good to record that windows does the same.
> 
> Point taken.
> 
> > 
> > I'm also not entirely sure this is a good interface, so some
> > thoughts/question:
> > 
> > - is the issue only with psr, meaning that if we switch the panel to a
> >    different crtc, do we need to update the off delay.
> 
> I can't say definitively, but all of the public reports (that I've seen)
> and my local repro are PSR related.
> 
> > 
> > - there's still the question of why vblank_immediate_disable resulted in
> >    stuttering, is that the same bug? I think for consistency it'd be best
> >    if we enable immediate vblank disabling everywhere (for maximum
> >    testing), and then apply the 2 frame delay workaround only where needed
> >    explicitly. Otherwise if there's other issues than DMUB being slow, they
> >    might be mostly hidden and become really hard to track down when they
> >    show up.
> 
> Ya, I believe they are all DMUB related since the stuttering issues are
> accompanied by the following dmesg log entry:
> 
> [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting for DMUB idle:
> status=3
> 
> (which is pretty much an unspecified firmware timeout)

Ah that would be really good to add to the commit message, should help
connect with any bug reports later on. And the firmware handling PSR
specially also makes sense, the flow is a lot more involved for that I
guess.

> Also, setting vblank_immediate_disable unconditionally for amdgpu, while
> only
> enabling the delay for cases that we know that we need it seems reasonable
> to me.
> 
> > 
> > - I think an interface to set the right values in lockstep with the vblank
> >    on/off state would be best, so maybe a special drm_crtc_vblank_on_config
> >    that takes additional parameters?
> 
> Sure, that seems fine, what parameters besides the off delay did you have
> in mind though?

Whatever you need, sounds like you need to update both the off delay and
the immediate disable (or maybe we just magically put them into the same
value, dunno). I just thought that supplying the right parameters to
drm_crtc_vblank_on is probably the right way to go about this.

Note that there's the question of whether drm_crtc_vblank_off should
restore the old values, or whether drivers simply have to use that special
version unconditionally, instead of only for the outputs like PSR that
need special handling.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
