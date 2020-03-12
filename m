Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA11832FD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0796EAD0;
	Thu, 12 Mar 2020 14:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D866E20D;
 Thu, 12 Mar 2020 14:28:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n8so6320689wmc.4;
 Thu, 12 Mar 2020 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dY/RhFMUP0nQ5TAbXB37oNSJMhhJygxiAwBiWfEJ74A=;
 b=t3vlWoDN2RG9FJdNKId8QZcDeUw31SKq4nKNnGovgVG7xia7I1dZVWUWWa2f/vEd43
 NdEOZzIDZwwwOIUNG+BLRw/3m3BGFi8dy3nc9G+X7taOp/VK+EBrwAmD2G8B84H1VCuo
 S010Kc+PTnMaVGP9bjnyrNW55HhvLaU4z6RoYBNBAdj5cS9+lsgH831WLtegEhHni/1t
 4H3TjD7dnseVcoOoWqf1q9rDzn3+55dyeW6qlPH0RTfrdTjb+i91EVSrwK2HUMGdTxZp
 VdVbEH+vkMQXwlcyaKdzvcgfBBZQ/qKzOEHOmoXmcz+m2bMbcdcw+lppsED7uadFkEGw
 tyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dY/RhFMUP0nQ5TAbXB37oNSJMhhJygxiAwBiWfEJ74A=;
 b=dj9OGYMT21hXdisVPYD1Ul27rM1usVnA8iNGiMV8Mv25NMAY6c9cK8ng8gWyvtlf3c
 w0IErQLeMOEYQ71WtFVdK1IpohjBcPW0vUp83tThhZwbCP5CH5T6dydGRW1xbdqc0fXr
 dROqLuED22ITEJIwceqirV2dMDYUM74dbruVqDd03bFronieIkYvCLN8NZNwPYIb5976
 uTx9ItZM9zmCc0vx2/fV/vzhlMb2hcpUCPaVUUUFfhxn0XmT6Em/glYt1q07YMYe9CmY
 KSwBWk/ifCsiPpfvZ4zjpbthws+R1nM78KLR42obMC8nzI8aOXKslKqkQTYJo1fQwauy
 Z66Q==
X-Gm-Message-State: ANhLgQ2CGPsOSvMmAGCiJUTuhr8XJ9x5ImtOwgIKIbihUn1X3jUmqITw
 Bpx5CmCfBjBGt5yIhgrssZMNslfdgkyu+idf+M1vcQ==
X-Google-Smtp-Source: ADFU+vsXshP7RsY77gDiaFil4BUsOOPxIIdV/vB0PFEE91IG8O0YaxhLKjOpgVnaVm7DWBSYZyORgDrSf9xUmjEHvMI=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr5139239wmc.39.1584023326879; 
 Thu, 12 Mar 2020 07:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200124010744.102849-1-lyude@redhat.com>
 <f9ab0fdf-b235-2709-8431-5a094b539531@amd.com>
In-Reply-To: <f9ab0fdf-b235-2709-8431-5a094b539531@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 10:28:34 -0400
Message-ID: <CADnq5_MoWMHq_t4KozoqgxfFB1LUqh=Uz20pOREsiQXNE_5nBA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Stop using the DRIVER debugging flag for
 vblank debugging messages
To: Harry Wentland <hwentlan@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks!

Alex

On Fri, Jan 24, 2020 at 9:48 AM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2020-01-23 8:07 p.m., Lyude Paul wrote:
> > These are some very loud debug statements that get printed on every
> > vblank when driver level debug printing is enabled in DRM, and doesn't
> > really tell us anything that isn't related to vblanks. So let's move
> > this over to the proper debug flag to be a little less spammy with our
> > debug output.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Thanks. Great change.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 9402374d2466..3675e1c32707 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -407,8 +407,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
> >       if (acrtc) {
> >               acrtc_state = to_dm_crtc_state(acrtc->base.state);
> >
> > -             DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> > -                              amdgpu_dm_vrr_active(acrtc_state));
> > +             DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n",
> > +                           acrtc->crtc_id,
> > +                           amdgpu_dm_vrr_active(acrtc_state));
> >
> >               /* Core vblank handling is done here after end of front-porch in
> >                * vrr mode, as vblank timestamping will give valid results
> > @@ -458,8 +459,9 @@ static void dm_crtc_high_irq(void *interrupt_params)
> >       if (acrtc) {
> >               acrtc_state = to_dm_crtc_state(acrtc->base.state);
> >
> > -             DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> > -                              amdgpu_dm_vrr_active(acrtc_state));
> > +             DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n",
> > +                           acrtc->crtc_id,
> > +                           amdgpu_dm_vrr_active(acrtc_state));
> >
> >               /* Core vblank handling at start of front-porch is only possible
> >                * in non-vrr mode, as only there vblank timestamping will give
> > @@ -522,8 +524,8 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
> >
> >       acrtc_state = to_dm_crtc_state(acrtc->base.state);
> >
> > -     DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> > -                             amdgpu_dm_vrr_active(acrtc_state));
> > +     DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> > +                   amdgpu_dm_vrr_active(acrtc_state));
> >
> >       amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
> >       drm_crtc_handle_vblank(&acrtc->base);
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
