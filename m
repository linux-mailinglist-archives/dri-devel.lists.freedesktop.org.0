Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9889212C14
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 20:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1146E963;
	Thu,  2 Jul 2020 18:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8156E9A3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 18:21:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f7so26609529wrw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3hPvGC/HkagaCR9HulPob6e55+qIh6naoY1GWRQP/P8=;
 b=UyCARtoBCRxJz8yzvVPLXJEETcY1MimBLC5mOAzoosrh2Pjd8B5VFX7RYHhv8mr5JS
 w3083ls2AlVka+7WgZ/xxcUj3MIZdGgoB8EaigsY+zuR+Qyn15LDBIjQT2llEb8ZgW4r
 qZiQP1zLCTgxAAk5J+DqTmc6Q072nB3zsWTo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3hPvGC/HkagaCR9HulPob6e55+qIh6naoY1GWRQP/P8=;
 b=FdVcFjZtXPAPVfjVv75zJeM22ntortHBfFtrgL5fn5pcCUZOqYw4pWNUb5gkeS7BqW
 hSO0Yjfovqu7j/KDJELWb1lBnwl+SHkJ7286svPCys+bJ3jBGpdCn+2fSZ/RsOelImcj
 LfiWb1UiHmEVf6wqTY+f6QyXjQ5q/yThZBAVC0DnwdsIHVyklEC11FSQUQF1It+2PqEO
 yN3jMmFXcIyQd1sMtEiERc//kMRw08e5hcyHPaWYQYDqZLop6Tt2TIz/nxE7o9wMkE/A
 oht2+zM21aBlfTX+boY6+0nagV2d/2Open8nTQq8M87f3xa3Tstzra5A4vbP+QucAQUe
 q7kw==
X-Gm-Message-State: AOAM533P2h+gt8F70MzgsjO5RGAhDVgFetknqYFMYbt6cgkRg2DmSftB
 /U4erssfQKWr9h+4UhRu5/Zkog==
X-Google-Smtp-Source: ABdhPJy9vmA6imnvMObJEUW/p+OQIMBPOpiRjvTTVls/209rJgxCRsDdiiuED8PRwO417cH4YBjhtA==
X-Received: by 2002:adf:f14e:: with SMTP id y14mr32774321wro.151.1593714101975; 
 Thu, 02 Jul 2020 11:21:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 30sm12394767wrm.74.2020.07.02.11.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:21:41 -0700 (PDT)
Date: Thu, 2 Jul 2020 20:21:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 2/8] drm/amdgpu: Use __drm_atomic_helper_crtc_reset
Message-ID: <20200702182139.GD3278063@phenom.ffwll.local>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-2-daniel.vetter@ffwll.ch>
 <ad375dbb-760b-b2e9-cfab-94fba61f4eb7@amd.com>
 <CADnq5_NY1P8nM9gSL9zb1fpizsFxgRwvztQRg426-fEKMupq+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NY1P8nM9gSL9zb1fpizsFxgRwvztQRg426-fEKMupq+w@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Stylon Wang <stylon.wang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 01:41:17PM -0400, Alex Deucher wrote:
> On Fri, Jun 12, 2020 at 1:24 PM Harry Wentland <hwentlan@amd.com> wrote:
> >
> > On 2020-06-12 12:00 p.m., Daniel Vetter wrote:
> > > Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
> > > which means vblank state isn't ill-defined and fail-y at driver load
> > > before the first modeset on each crtc.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > > Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > > Cc: Roman Li <roman.li@amd.com>
> > > Cc: Mikita Lipski <mikita.lipski@amd.com>
> > > Cc: Stylon Wang <stylon.wang@amd.com>
> >
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >
> 
> Daniel, do you want to take the whole series, or should I pull this in
> through my tree?  Either way works for me.  Thanks for the patch!

Merged the entire series through drm-misc-next now.
-Daniel

> 
> Alex
> 
> > Harry
> >
> > > ---
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index 68a73065b516..36d605a6eb16 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -4594,9 +4594,7 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
> > >       if (WARN_ON(!state))
> > >               return;
> > >
> > > -     crtc->state = &state->base;
> > > -     crtc->state->crtc = crtc;
> > > -
> > > +     __drm_atomic_helper_crtc_reset(crtc, &state->base);
> > >  }
> > >
> > >  static struct drm_crtc_state *
> > >
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
