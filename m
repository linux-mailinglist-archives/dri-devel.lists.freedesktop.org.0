Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AC7EFC02
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 00:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12CC10E77F;
	Fri, 17 Nov 2023 23:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BB910E77C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 23:01:53 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-77bc5d8490dso157808485a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700262112; x=1700866912;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fVbP8CyiBZehwmNjDxKXZZtGdp94/xgeZ0x/AluKOVY=;
 b=LT6EVT/S1xFyRjG6fh2IoLd5qeg3W2nWdf1UowqGeNeVkUd/Gjg12xejA8tMVR7vUy
 iLyTV1ImYwelJyrIVK+dhPWidInmz+Lgm1CjvYtXdh8Q0G1KQefTz58l7KAt8i0mt/QN
 +vQxrCxC/TfOOBIKaxxYccpQwVLOHhmREMhF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700262112; x=1700866912;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVbP8CyiBZehwmNjDxKXZZtGdp94/xgeZ0x/AluKOVY=;
 b=w3ZcKbvTVOpIzHx67GqAKXRh4IZNi1UtFsT9Tkq4i9JJRJMw8p7UB4IfRXu4L55uXc
 vE39aDEVphMS3wn0kIaNmShcXwhOrLBiKhL/f+95SxN+td73dg18mR1h+V6t/uj+XkTJ
 RRrZLiW8pDQSkvhZaHTbkGvjT0N6vDO2jGxJueGV1iBHcV00v8FX4YIXtb9ortZ14Ppa
 5Xm35AjOKvrqCQUJaKuJ7Z8Xc86EgoBxAYs9FdM7lle4EgEVbxPR2k5bKng9ftSItqdn
 /fQWXIyoC+vYP4Ae3/bF0ZBfXqOxCMK6/U3Z2n6bp3Rmw3ju8be+j23F4qirYzm8cIg6
 XdbQ==
X-Gm-Message-State: AOJu0YzrcGZpga6Uiv60tCYcXxlZ9J/sMGup1B0k4eAgbR2vaZ7Q7bL3
 Vnr/OH24wCetsT7D65OJkjcRlw==
X-Google-Smtp-Source: AGHT+IGo/j+JjI7nVgbEx1Oh0K7fiN+Cgcz8UA9x0+i23g0mH+S4fJxvJq/lN51n2QT7YE/f9oL0bA==
X-Received: by 2002:a05:620a:4541:b0:778:9148:3c2c with SMTP id
 u1-20020a05620a454100b0077891483c2cmr1044309qkp.18.1700262112282; 
 Fri, 17 Nov 2023 15:01:52 -0800 (PST)
Received: from google.com (193.132.150.34.bc.googleusercontent.com.
 [34.150.132.193]) by smtp.gmail.com with ESMTPSA id
 rr7-20020a05620a678700b0076cc0a6e127sm936543qkn.116.2023.11.17.15.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 15:01:51 -0800 (PST)
Date: Fri, 17 Nov 2023 23:01:50 +0000
From: Paz Zcharya <pazz@chromium.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Fix phys_base to be
 relative not absolute
Message-ID: <ZVfw3ghfBLdHB7uk@google.com>
References: <20231105172718.18673-1-pazz@chromium.org>
 <ZVQ3d8FFqxsy0OX7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVQ3d8FFqxsy0OX7@intel.com>
X-Mailman-Approved-At: Fri, 17 Nov 2023 23:05:15 +0000
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Subrata Banik <subratabanik@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, matthew.auld@intel.com,
 Marcin Wojtas <mwojtas@chromium.org>, Drew Davenport <ddavenport@chromium.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 10:13:59PM -0500, Rodrigo Vivi wrote:
> On Sun, Nov 05, 2023 at 05:27:03PM +0000, Paz Zcharya wrote:
> > Fix the value of variable `phys_base` to be the relative offset in
> > stolen memory, and not the absolute offset of the GSM.
> 
> to me it looks like the other way around. phys_base is the physical
> base address for the frame_buffer. Setting it to zero doesn't seem
> to make that relative. And also doesn't look right.
>
> > 
> > Currently, the value of `phys_base` is set to "Surface Base Address,"
> > which in the case of Meter Lake is 0xfc00_0000.
> 
> I don't believe this is a fixed value. IIRC this comes from the register
> set by video bios, where the idea is to reuse the fb that was used so
> far.
> 
> With this in mind I don't understand how that could overflow. Maybe
> the size of the stolen is not right? maybe the size? maybe different
> memory region?
>

Hi Rodrigo, thanks for the great comments.

Apologies for using a wrong/confusing terminology. I think 'phys_base'
is supposed to be the offset in the GEM BO, where base (or
"Surface Base Address") is supposed to be the GTT offset.

Other than what I wrote before, I noticed that the function 'i915_vma_pin'
which calls to 'i915_gem_gtt_reserve' is the one that binds the right
address space in the GTT for that stolen region.

I see that in the function 'i915_vma_insert' (full call stack below),
where if (flags & PIN_OFFSET_FIXED), then when calling 'i915_gem_gtt_reserve'
we add an offset.

Specifically in MeteorLake, and specifically when using GOP driver, this
offset is equal to 0xfc00_0000. But as you mentioned, this is not strict.

The if statement always renders true because in the function
'initial_plane_vma' we always set
pinctl = PIN_GLOBAL | PIN_OFFSET_FIXED | base;
where pinctl == flags (see file 'intel_plane_initial.c' line 145).

Call stack:
drm_mm_reserve_node
i915_gem_gtt_reserve
	i915_vma_insert
i915_vma_pin_ww
i915_vma_pin
initial_plane_vma
intel_alloc_initial_plane_obj
intel_find_initial_plane_obj

Therefore, I believe the variable 'phys_base' in the
function 'initial_plane_vma,' should be the the offset in the GEM BO
and not the GTT offset, and because the base is added later on
in the function 'i915_gem_gtt_reserve', this value should not be
equal to base and be 0.

Hope it makes more sense.

> > This causes the
> > function `i915_gem_object_create_region_at` to fail in line 128, when
> > it attempts to verify that the range does not overflow:
> > 
> > if (range_overflows(offset, size, resource_size(&mem->region)))
> >       return ERR_PTR(-EINVAL);
> > 
> > where:
> >   offset = 0xfc000000
> >   size = 0x8ca000
> >   mem->region.end + 1 = 0x4400000
> >   mem->region.start = 0x800000
> >   resource_size(&mem->region) = 0x3c00000
> > 
> > call stack:
> >   i915_gem_object_create_region_at
> >   initial_plane_vma
> >   intel_alloc_initial_plane_obj
> >   intel_find_initial_plane_obj
> >   intel_crtc_initial_plane_config
> > 
> > Looking at the flow coming next, we see that `phys_base` is only used
> > once, in function `_i915_gem_object_stolen_init`, in the context of
> > the offset *in* the stolen memory. Combining that with an
> > examinination of the history of the file seems to indicate the
> > current value set is invalid.
> > 
> > call stack (functions using `phys_base`)
> >   _i915_gem_object_stolen_init
> >   __i915_gem_object_create_region
> >   i915_gem_object_create_region_at
> >   initial_plane_vma
> >   intel_alloc_initial_plane_obj
> >   intel_find_initial_plane_obj
> >   intel_crtc_initial_plane_config
> > 
> > [drm:_i915_gem_object_stolen_init] creating preallocated stolen
> > object: stolen_offset=0x0000000000000000, size=0x00000000008ca000
> > 
> > Signed-off-by: Paz Zcharya <pazz@chromium.org>
> > ---
> > 
> >  drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> > index a55c09cbd0e4..e696cb13756a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> > +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> > @@ -90,7 +90,7 @@ initial_plane_vma(struct drm_i915_private *i915,
> >  			"Using phys_base=%pa, based on initial plane programming\n",
> >  			&phys_base);
> >  	} else {
> > -		phys_base = base;
> > +		phys_base = 0;
> >  		mem = i915->mm.stolen_region;
> >  	}
> >  
> > -- 
> > 2.42.0.869.gea05f2083d-goog
> > 
