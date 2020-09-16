Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13426C06E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 11:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AB26E378;
	Wed, 16 Sep 2020 09:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9606E378
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 09:24:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x23so2046936wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ez5wNYu/MjO97ZyiJlwYza1kXyksIirYgP4HuUfGgJI=;
 b=d3+XJjrJRUzisc3cKiqOeTKogPtz/VkjAtoeu01l3mporQwtAVB8gL1GamAn0CZFv/
 bJv2fxxcHIRFR/5BfYyiIRtGL19T0BkmeekwRmmOqDXlDG+CkGmgtdClvLipX/hW7iyA
 VySBk8WU1ukjGGCA6HqSelri/Cjx1WauzmJew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ez5wNYu/MjO97ZyiJlwYza1kXyksIirYgP4HuUfGgJI=;
 b=fY2t+f516llPshi023t4AwAI1ak0HxPWtl4pNoUy6LAcOr5ovKTEF3Nj+BnGSorm4Z
 W5jubq5W6tH4njzVaqfV56G1MtoQyqWcOzN9hiL+bvXXZco6hFvRcEC+KcZJwTF0bued
 DdR3K3bj/VvqHRbVB6njsMvLY5t1NV4fp79FzsPqypgr+198e15caWOtWE2De/YZJJAd
 7mBWIKlk+wJ1WC3CcTC8miZ3APumECP8xQSWysGvrIg1wYPBf+6mjs6eW66aLb+EezSV
 l+M1NF2fwkwQUEzXJdBkxC/VO2Pai/RH0CtYwacGYiUno9HQCVYA5bKIafaw2q461xGS
 iiMg==
X-Gm-Message-State: AOAM5322auhUgOU4tBsWmSFe0we44joyArF+JXYkPB/a5h+uxrT5Gs1m
 YC/zaVTmxYJ3OKzC//lkS8oO8NNyfDaZ356v
X-Google-Smtp-Source: ABdhPJynUKvPQ71nTunyAOYD9QpTcmRfa55d/WfFYnq31D/BfUSVcNg6Go0lLXC6P1gU4eSpGI7Xmg==
X-Received: by 2002:a7b:c8c9:: with SMTP id f9mr3778930wml.67.1600248264267;
 Wed, 16 Sep 2020 02:24:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n3sm4141794wmn.39.2020.09.16.02.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:24:23 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:24:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND][PATCH v3 0/4] drm/ast: Disable HW cursor when switching
 modes
Message-ID: <20200916092421.GA438822@phenom.ffwll.local>
References: <20200914072236.19398-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914072236.19398-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 09:22:32AM +0200, Thomas Zimmermann wrote:
> Since converting the ast driver to atomic modesetting, modesetting
> occationally locks up the graphics hardware and turns the display
> permanently dark. This happens once or twice per 10 mode switches.
> Investigation shows that the ast hardware presumably requires the HW
> cursor to be disabled while the modeswitch takes place.
> 
> This patchset fixes the problem by disabling planes before programming
> the CRTC mode. After the switch, the planes gets re-enabled if they were
> enabled before. For mere pageflip operations, nothing changes.
> 
> Patches #1 makes format changes work as intended: format registers are
> only updated if necessary. They used to be changed on each pageflip.
> 
> Patches #2 to #4 change the modesetting logic such that planes will be
> disabled with the CRTC, then the CRTC's new mode is being programmed,
> and finally planes are reenabled. The primary plane is enabled before
> the cursor plane. With this setup, the cursor plane always has a valid
> mode and framebuffer available.
> 
> Tested on AST2100 HW. The issue is not 100% reproducible, but does not
> show up after applying the patchset. I think the problem has been fixed.
> 
> Thomas Zimmermann (4):
>   drm/ast: Set format registers in primary plane's update
>   drm/ast: Disable planes while switching display modes
>   drm/ast: Program display mode in CRTC's atomic_enable()
>   drm/ast: Enable CRTC before planes

Ofc I can't check all the details, but I think this is using atomic
helpers a lot more like they're intended to be used. So definitely a good
cleanup. On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>  drivers/gpu/drm/ast/ast_drv.h  |   2 +
>  drivers/gpu/drm/ast/ast_mode.c | 103 ++++++++++++++++++++-------------
>  2 files changed, 64 insertions(+), 41 deletions(-)
> 
> --
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
