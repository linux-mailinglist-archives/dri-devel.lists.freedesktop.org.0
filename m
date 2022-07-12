Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C2571F2D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3088F64B;
	Tue, 12 Jul 2022 15:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C504B8ED4E;
 Tue, 12 Jul 2022 15:29:44 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id eq6so10587732edb.6;
 Tue, 12 Jul 2022 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k82muZrzjaGKL2uu6yggy5IYvpm5UzK+FZ+jRdRGdM8=;
 b=hkePFGV/YsKsbsERnfo1xi4ljiNSPMiSH1x0wvuJij7XQLk0spuiAyQhA+y0wO/vsj
 QLrk4yFVoIlo6h+GbX0ryi1e5oRixZSefL0MVtCkXc0H5UPQNYxIETD4LG+bh5wI8kFY
 rKsaYd/RqmIWFRMha1hrky4815sfu5UO/0y/gZH+2SccqsEEVVDMFLCdl0BsnNsoqld7
 XwpK04pY4Pv8Q3Ruoau6i37C1V51BFmn8860rx9leuFlqustsKQAca5/rPw8jp0w6tWi
 mdgrM4HX/azTWNixKUGWZV2Ii5tDs9JYaxUAWDPcYdjsuE3KXbrKxU6p5ODQeie5jSu+
 PVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k82muZrzjaGKL2uu6yggy5IYvpm5UzK+FZ+jRdRGdM8=;
 b=OLAyYRFw7MPyKVbJPnw0rV7VtuqIkhuAW20moBgUv+lKx+YBDlVR+GnsP2JZoA1abJ
 PB2si6owdZ+9e0GaekmcfBpXsYhmsDImnpFWU/+Az0xC73k7TSGtG4VCwKume0Pwq8cb
 UTYf4glG73M6/7GheP8aSODv1fAtJJcRgk6YugfUHAdjXcH1aNGNEa0N1HmDqhfqZE7i
 ae9hUiGuFKd/46L5imccz9K/c4goiTo79pVVGc9lDjwdQA37eALiTR+H4hMcIv6Zads6
 vf6kD59N/I4FdTfeGuG6DAvozmiEMSDNWGAfqaCJZbmSRPw+WrVUBRrufhmp9R1by3j1
 ZP4Q==
X-Gm-Message-State: AJIora9zcgJXDjuLlggXDddeW4wYjgsMYZEcTFxL68ujC1MKR+PuzfIP
 JGVMG69KMvICgyn4SVECh32TBbLJsXnq2dBB/y4BvW4a
X-Google-Smtp-Source: AGRyM1tBpI1AolR01rX2cadrBw7SXyoM7JFhOEkfmysmJ47u0+tmXW0I7Cq4OEd2cX/s4+TOzcbehM+auRBDK438igE=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr32023086edb.93.1657639783312; Tue, 12
 Jul 2022 08:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220712113239.132905-1-mwen@igalia.com>
 <062bf9e7-8903-5635-b681-ff42ea518031@amd.com>
In-Reply-To: <062bf9e7-8903-5635-b681-ff42ea518031@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jul 2022 11:29:31 -0400
Message-ID: <CADnq5_PDpg4XC4kWXo1D05brWjCPWgrjWvWGHWZQzrNZWavybw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: correct check of coverage blend mode
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: kernel-dev@igalia.com, kernel test robot <lkp@intel.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sungjoon.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jul 12, 2022 at 9:56 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-07-12 07:32, Melissa Wen wrote:
> > Check the value of per_pixel_alpha to decide whether the Coverage pixel
> > blend mode is applicable or not.
> >
> > Fixes: 76818cdd11a2 ("drm/amd/display: add Coverage blend mode for overlay plane")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index de1c139ae279..25cb833b267c 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -5486,7 +5486,7 @@ fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
> >                       }
> >               }
> >
> > -             if (per_pixel_alpha && plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE)
> > +             if (*per_pixel_alpha && plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE)
> >                       *pre_multiplied_alpha = false;
> >       }
> >
>
