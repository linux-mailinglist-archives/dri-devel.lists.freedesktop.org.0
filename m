Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC83CAB3A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 21:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB6A6E8AC;
	Thu, 15 Jul 2021 19:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E526E8AB;
 Thu, 15 Jul 2021 19:20:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id gb6so11118163ejc.5;
 Thu, 15 Jul 2021 12:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihOfb0tc3xVL5q8N3onToRfW8DW3UJeYLmddd1YjXNw=;
 b=TNgFfAfMluhQ3/TAFnzR108JbZSD2t2Cg2OhHV+y5IzE4VZgg1atgOSY+17DQV4w2c
 au925Ps4U0kh4odD9rUI8rvZ8i8ZVpvl5YuAvvi1UdsMvzHYryfDULnip10C99VCRPlP
 Z3Bd9lXqcSyqY11k16uH3Pyu5BSAfZ2ylIIIzQD7lxNYjEI6xTXO2Uoriff7B5obchay
 /uynkrtBj0a+NGRdJDqlyJRt4vgm8Stvy/RUVvzDwA6SaqTpF9rlpqCL/iJM5AAMfPws
 vK/Jz0snmMnTjnh6Q/EQhTW9IdDcJdk3Ezysmcrxz+8s5cfzdi1W0iY7vB6RrgSUeVlG
 Kb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihOfb0tc3xVL5q8N3onToRfW8DW3UJeYLmddd1YjXNw=;
 b=VPAK1Cr7eKxhSnY+8Vm2hEHl9evG/O1D/IG3O1mpF4LGSCuTMhR6yzb8+fmexP25vF
 Vr6IvCbMNwHMUGtYkRp6Kb2mMg9imHuHB2sJAzYCWpS7HBGVObgD5tcYkdsM3asI3J1y
 knn0VL6gw03dszlMwvfQAEULhHbR9QXcjar/6Rn60zOR5mu1XZ7sbcWLUly4WW1ua6Mf
 RUxYJR2M5HjO0MOAlyyOnF32e39VmSnS/WcLdl6KFWLjvo/3qQxRbwiK01uKAmIzdjvY
 c7vI9fru4vxIb2gvZnCJvb2LRgnw1Y8eUVWMkn3vEeBA0TfPKQ8+DEyxAd63HB8IKIv2
 wlMg==
X-Gm-Message-State: AOAM531VErlGE6hC82o0Ppdpr+zdLBg5/6u6d6jIAcS7uegOL9spI+2/
 IKjTuo86y3pG3o9tvuQEadrr97oPsMrWQwz+iTo=
X-Google-Smtp-Source: ABdhPJzFJhZDB3GiTntdV5Ju70ZAArFbxHINZyOxXMcxKyzPXkyoe3NFdbQONOO97TDXsNpV1EreDhU1j7OBkscM1O0=
X-Received: by 2002:a17:906:4a8d:: with SMTP id
 x13mr7186041eju.349.1626376805330; 
 Thu, 15 Jul 2021 12:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210714080652.113381-1-liviu@dudau.co.uk>
 <CADnq5_OA-em2jM-vmwaM7xxycOS-18EPC0r_myb7REy9b4h_vA@mail.gmail.com>
In-Reply-To: <CADnq5_OA-em2jM-vmwaM7xxycOS-18EPC0r_myb7REy9b4h_vA@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 15 Jul 2021 21:19:53 +0200
Message-ID: <CAEsyxyhurQ2vm=xwaRMqT8z+PJ2R60hYXt6kL8HnaB4zwbee3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix 10bit 4K display on CIK GPUs
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 6:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Jul 14, 2021 at 4:15 AM Liviu Dudau <liviu@dudau.co.uk> wrote:
> >
> > Commit 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at
> > 30bpp for DCE-11.0.") doesn't seems to have fixed 10bit 4K rendering over
> > DisplayPort for CIK GPUs. On my machine with a HAWAII GPU I get a broken
> > image that looks like it has an effective resolution of 1920x1080 but
> > scaled up in an irregular way. Reverting the commit or applying this
> > patch fixes the problem on v5.14-rc1.
> >
> > Fixes: 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.")
> > Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
>
> Harry or Mario any ideas?  Maybe we need finer grained DCE version
> checking?  I don't remember all of the caveats of this stuff.  DCE11
> and older is getting to be pretty old at this point.  I can just apply
> this if you don't have any insights.
>
> Alex
>

Hi Alex

I'd be fine with applying this. As my original commit says, photometer
measurements showed that increasing the line buffer depth was only
needed for my DCN-1 RavenRidge, not for my DCE-11.2 Polaris11 or a
DCE-8.3 cik, so this should probably not cause harm to the increased
precision modes.

Note that given the hardware and USB-C/DP-HDMI adapters i have, I only
tested this on a 2560x1440@144 Hz DP monitor with DCN-1, DCE-11.2, and
a 2560x1440@100 Hz HDMI monitor iirc with DCN-1, DCE-8.3, and i think
on a 2880x1800@60 Hz MBP Retina eDP panel with DCE-11.2. These are the
highest resolution/framerate monitors I have atm.I don't have access
to any 4k monitors, so maybe the problem is somehow specific to such
high resolutions? Maybe somewhere else in the code something would
need to be adapted? Lacking actual hw docs, my coding here is by
pattern matching against existing DC code, guessing and testing on my
limited hw samples.

Acked-by: Mario Kleiner <mario.kleiner.de@gmail.com>

-mario

> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > index a6a67244a322e..1596f6b7fed7c 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > @@ -1062,7 +1062,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
> >          * so use only 30 bpp on DCE_VERSION_11_0. Testing with DCE 11.2 and 8.3
> >          * did not show such problems, so this seems to be the exception.
> >          */
> > -       if (plane_state->ctx->dce_version != DCE_VERSION_11_0)
> > +       if (plane_state->ctx->dce_version > DCE_VERSION_11_0)
> >                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
> >         else
> >                 pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
> > --
> > 2.32.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
