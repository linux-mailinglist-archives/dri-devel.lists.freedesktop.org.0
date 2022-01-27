Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B17049E0F6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4316110E627;
	Thu, 27 Jan 2022 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D233E10E485
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:31:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c2so1690497wml.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkClxaa+2C8a0Gjj8wVr84ck/Y/nk6VOxGU9yJzk5zg=;
 b=LiJaUPMq92a9bfWZNpvKXwGghvP4zSBcAMDzeZ/ReWu44m0+N68+ddiTjdr8P02zXx
 zaH+11MhDX1nAmKSJIcan2E3OYlZzK6odIWYyzvDS+K83UQ/qJ4v4DJDbLTFOHFhGkWT
 RizQFMxXQrQ3WuwfTgWdmBr6i5ncNvUlw8Me0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hkClxaa+2C8a0Gjj8wVr84ck/Y/nk6VOxGU9yJzk5zg=;
 b=szv2Is1FeiA9zxIG0uWP8lAYNIyukc0azw3g0WNx7Jqjcg8+QUGm/4bPN60GAYgRBm
 AgjVUgmqWf4A12TWr17jQj8EkAZ6dzqX+elCrrv+VoJDn8v0DxdPK2rbIdeNZGp70wjF
 JFtOeLrDvsOCILbIe4qVSpjy0S+veuYKMR0zwOtA6DYD+ZMucgfRGw+xgVWP5LtE0C3I
 XejEFLu1KQZbOlae1LQJEFULRHArv6ymzkuaEawZNHut0Cfl+Sz+Hs+ZX+vpCKMHKcUx
 Tg82n+QsznkvyHPbolcgaKzv/5+CztknbI0T+TD5f/TtdldDBcGdZ9px2y67sUkrIdx/
 H8OA==
X-Gm-Message-State: AOAM532yC0ckFizuZN4nAPCDE8egvXeov8Se46VAmxmCmAQMBTWrn3Wy
 CAs4Xq6d3IVrWuZn3KE9iaIPDA==
X-Google-Smtp-Source: ABdhPJzsSgHQc4/Sisg9p2IJQo1l/N+Y/KjTBTOmd8sk+y5btszDk60YCnmxc1l3iGgHjdXMSGgnwg==
X-Received: by 2002:a1c:7903:: with SMTP id l3mr2780924wme.43.1643283107438;
 Thu, 27 Jan 2022 03:31:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 5sm2288561wrb.113.2022.01.27.03.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:31:46 -0800 (PST)
Date: Thu, 27 Jan 2022 12:31:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
Message-ID: <YfKCoOk2sxDzHVXv@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
References: <20220127082058.434421-1-javierm@redhat.com>
 <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
 <b305cb36-1a09-c990-a3e6-98d420c62e3a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b305cb36-1a09-c990-a3e6-98d420c62e3a@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 11:50:30AM +0100, Javier Martinez Canillas wrote:
> Hello Thomas,
> 
> On 1/27/22 10:18, Thomas Zimmermann wrote:
> > Hi Javier,
> > 
> > thanks for this patch.
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> 
> Thanks!
>  
> > Find some ideas for consideration below.
> > 
> 
> [snip]
> 
> >> +
> >> +Learning material
> >> +=================
> > 
> > Maybe 'External References'.
> >
> 
> Agreed, I'll change it.
> 
> >> +
> >> +Since the Linux DRM layer supports complex graphics devices, it can be quite
> >> +overwhelming for newcomers to get familiar with all the needed concepts and
> >> +learn the subsystem's internals.
> > 
> > It sounds a bit intimdating to me. Can we give it a positive spin?
> >
> 
> Pekka also had reservations about this paragraph, so I think that will just
> drop it. The goal of having this section was to ease the learning curve but
> the way I worded it may reinforce the perception that DRM is hard to learn.
> 
> > IMHO we could add a separate section that talks about complexity and 
> > provides guidelines about how to deal with it:  trivial HW? use simple 
> > pipe;  dedicated VRAM? try TTM;  awkward color formats?  see 
> > drm_format_helper.c
> >
> 
> Indeed. And we can add such section as a follow-up. Maybe referring to some
> of the drivers in drivers/gpu/drm/tiny.

Do we have a talk anywhere for tiny?

Otherwise I think it'd be good to just add a paragraph about "hey tiny
exists" and maybe link to fbdev helpers and simple pipe helpers to get
people started with the right entry points for simple drivers.

And make it clear that the above pile of links is more for general
overview and if you don't yet know what exactly it is you need.

Also I guess for this year's xdc I really need to volunteer someone to do
a drm/tiny intro :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
