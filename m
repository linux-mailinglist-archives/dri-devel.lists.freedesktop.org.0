Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57723D9D7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 13:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637C36E181;
	Thu,  6 Aug 2020 11:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7D6E181
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 11:21:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f12so7786546wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rL8fJPSZQtP67DlwvfUTB83uJjCTBcHfRru38+b+DR0=;
 b=TWR63VTjsL39QLX37xavA2tdHeKDekC9WIeiCRm7sAjDk+f+lOoDKpxazG0Z8r2P/r
 g3My5n43FJvmI7HP1MQpymwHd4cE4w1R5TGhWWAlkI5y3ic76LlQW3+W3Vx9A/atv1Y+
 ERlB7dBA+z+th5oCusU2y20OHn9/K/ZT0du/UeCj6sUF5L1fxCaCnzmqpcd9P+unnB5w
 2ZRd/jzTGK/s/mloz+3/Awe0uHWQhwyN34a8YTuxwAITjbYlDMgpb46qFIW1Cx/jsvq5
 D1jZ6mJqZW/AGp4XuoF3z+egM2dpQn2YDwF5Xm0yyYq+37LvsCiUQQXyaaHZi347y5q/
 GqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rL8fJPSZQtP67DlwvfUTB83uJjCTBcHfRru38+b+DR0=;
 b=afWbocuObohpwT1MdQZ+S6jgKFdGycPOPtr03gpD9oFHQDz3DtEwquRw7wzzc9Ozes
 5dIyvp/ZHoElDKTKRNNZE1Zc7EeDeO2fVgkOt8i92fisXGAux7U9Dj0iCDYr2f2kqAJ0
 XDYiOKSoFpjjymwZkngHZdyUVxTugpUiPGMmlYH5qfFQx/rSBcV3AvUdSlkafL9dPQEy
 24UnA9XG/OAfH4dJTVLee3IO/EPa1KxmTuat5Pus2tmIRm8esx8LX+ziEqOlGeicwfOw
 cA66jWrN+e8HCXcUJkbQpi3Z1XaXnEyFMzibAZ1upI8rXp7fWX3tmOitPeN97GK+olTk
 /X9w==
X-Gm-Message-State: AOAM533KrsW6x2ySxzk8wWGVgvkg5Aahc2CImzIA06bwE/6ZgJAri9PU
 hPxNn1tu2Bsm36yvAekHYz4=
X-Google-Smtp-Source: ABdhPJwOL1UmQj1fz2TX3rPjIsH8GfJhoIyJTtLevicDwXbUzCaXtwO2L3ouQnxl5IUEqLGqCLz9Kg==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr6889735wrw.70.1596712909332; 
 Thu, 06 Aug 2020 04:21:49 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id c14sm6015437wrw.85.2020.08.06.04.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 04:21:48 -0700 (PDT)
Date: Thu, 6 Aug 2020 08:21:42 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: daniel@ffwll.ch
Subject: Re: [PATCH] drm/vkms: guarantee vblank when capturing crc
Message-ID: <20200806112142.rdsdx6rb5f5by4aa@smtp.gmail.com>
References: <20200801184929.2eaxyoq6fm3nk4ey@smtp.gmail.com>
 <20200804163939.GK6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804163939.GK6419@phenom.ffwll.local>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04, daniel@ffwll.ch wrote:
> On Sat, Aug 01, 2020 at 03:49:29PM -0300, Melissa Wen wrote:
> > VKMS needs vblank interrupts enabled to capture CRC. When vblank is
> > disabled, tests like kms_cursor_crc and kms_pipe_crc_basic getting stuck
> > waiting for a capture that will not occur until vkms wakes up. This
> > patch ensures that vblank remains enabled as long as the CRC capture is
> > needed.
> > 
> > It clears the execution of the following kms_cursor_crc subtests:
> > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> > random, fast-moving])] - successful when running individually.
> > 2. pipe-A-cursor-dpms passes again
> > 3. pipe-A-cursor-suspend also passes
> > 
> > The issue was initially tracked in the sequential execution of IGT
> > kms_cursor_crc subtest: when running the test sequence or one of its
> > subtests twice, the odd execs complete and the pairs get stuck in an
> > endless wait. In the IGT code, calling a wait_for_vblank on preparing
> > for CRC capture prevented the busy-wait. But the problem persisted in
> > the pipe-A-cursor-dpms and -suspend subtests.
> > 
> > Checking the history, the pipe-A-cursor-dpms subtest was successful
> > when, in vkms_atomic_commit_tail, instead of using the flip_done op, it
> > used wait_for_vblanks. Another way to prevent blocking was
> > wait_one_vblank when enabling crtc. However, in both cases,
> > pipe-A-cursor-suspend persisted blocking in the 2nd start of CRC
> > capture, which may indicate that something got stuck in the step of CRC
> > setup. Indeed, wait_one_vblank in the crc setup was able to sync things
> > and free all kms_cursor_crc subtests.
> > 
> > Besides, other alternatives to force enabling vblanks or prevent
> > disabling them such as calling drm_crtc_put_vblank or modeset_enables
> > before commit_planes + offdelay = 0, also unlock all subtests
> > executions. These facts together converge on the lack of vblank to
> > unblock the crc capture.
> > 
> > Finally, considering the vkms's dependence on vblank interruptions to
> > perform tasks, this patch acquires a vblank ref when setup CRC source
> > and releases ref when disabling crc capture, ensuring vblanks happen to
> > compute CRC.
> > 
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Co-developed-by: Sidong Yang <realwakka@gmail.com>
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > Co-developed-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> 
> Excellent summary of the debug story.
> 
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 4af2f19480f4..1161eaa383f1 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -241,6 +241,14 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
> >  
> >  	ret = vkms_crc_parse_source(src_name, &enabled);
> >  
> > +	/* Ensure that vblank interruptions are enabled for crc capture */
> > +	/* Enabling CRC: acquire vblank ref */
> 
> This comment just explains what the code does, that's not needed. The
> first comment I think can be replaced if we create a little helper
> function like
> 
> void vkms_set_composer(struct vkms_output, bool enable) {
> 	bool old_state;
> 
> 	if (enabled)
> 		drm_crtc_vblank_get(crtc);
> 
> 	spin_lock_irq(&out->lock);
> 	old_enable = out->composer_enabled;
> 	out->composer_enabled = enabled;
> 	spin_unlock_irq(&out->lock);
> 
> 	if (old_enabled)
> 		drm_crtc_vblank_put(crtc);
> 
> }
> 
> This should also help as prep for the writeback work, where we have a 2nd
> user that might need to enable the composer (maybe even need to switch to
> refcounting the composer state then).
>
Hi Daniel,

Thanks for the feedback and advice.
I applied the suggestion and just sent a v2.

Best regards,

Melissa

> > +	if (enabled)
> > +		drm_crtc_vblank_get(crtc);
> > +	/* Disabling CRC: release vblank ref */
> > +	if (!src_name)
> > +		drm_crtc_vblank_put(crtc);
> 
> I'm not sure this correctly releases the vblank reference in all cases, I
> think the suggestion in the helper function pseudo code should work
> better. It does mean we temporarily elevate the vblank refcount if we go
> enabled -> enabled, but that's not a problem since it's refcounted.
> 
> Cheers, Daniel
> 
> > +
> >  	spin_lock_irq(&out->lock);
> >  	out->composer_enabled = enabled;
> >  	spin_unlock_irq(&out->lock);
> > -- 
> > 2.27.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
