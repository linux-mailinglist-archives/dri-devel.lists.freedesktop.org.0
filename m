Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB92446D3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCD16E2E1;
	Fri, 14 Aug 2020 09:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DDA6E2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:15:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r2so7720089wrs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eYpU3y7ebzKMBuQXVvoEvJvkYtKwGT78NkijSgMoWJY=;
 b=WFH0MvLQnpQkcUnqvWwQ3IpHELagYVEDmhoOs8XAjsZKt51xf1FPsJgAPfaLCln3Wi
 jD+HyZoSM1yFtGB0fdISkJcPVS0fyUZ659muQf8tQX+bIpgDUxX0PH/v6awTM1rkO1U5
 N/99rpMwl0MMgPpGaE7Er3CyAK7tyOb2pzCP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eYpU3y7ebzKMBuQXVvoEvJvkYtKwGT78NkijSgMoWJY=;
 b=izjQ4TD7ITUkMLeDXRB7gRLJ7bWOcgUDKimFHB7HCR3dZDU75WHi+oB35BUditpIjj
 oX037IWjtjqPDdff8KohVPovSnvyfwiWTbcwbBRh2rLfvot2hBlmj5H8jvi3RIdTnQoC
 7PJXo70Ln+CDi2sLw7GT/xV4rqqTuu2p8il5UWAIe8rwTOv1gKGci/kYmwtq136xW5qn
 GJSAOn+s18lJ6O06781kZsUNKS+3f95OM3t+WExD+xOmnH5tLWieryqeQSrQ0YKRYp9Y
 NM2H+s+0u4c6kN6tdIO1ra+P1w/Cz3F4nB/+l/meb9OyE/VnVQrpAMmj87cU5JNVVQ5s
 zIDA==
X-Gm-Message-State: AOAM530F9vuo6IlXTZEAMQwPVDjAU/YjwKHNWHidR9D4BSjh+NVQIEAZ
 MovUSJFYObzBADDOYV0nPJPZbg==
X-Google-Smtp-Source: ABdhPJyPMqTxP6nOVJYe8zKT3bJ59aEMGWM2FWz8Wx4F6bgsXuU27JMvn8Svpoo4rvg86F0Y46Xd9A==
X-Received: by 2002:adf:a102:: with SMTP id o2mr1791617wro.319.1597396545670; 
 Fri, 14 Aug 2020 02:15:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 31sm14741758wrp.87.2020.08.14.02.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:15:44 -0700 (PDT)
Date: Fri, 14 Aug 2020 11:15:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Warnings with drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
Message-ID: <20200814091542.GN2352366@phenom.ffwll.local>
References: <CADnq5_O2gEAmNE9Y8jB7xYuLv3cw+YejWfy9r1BzhmQ_Uhamtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_O2gEAmNE9Y8jB7xYuLv3cw+YejWfy9r1BzhmQ_Uhamtw@mail.gmail.com>
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
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 11:17:11PM -0400, Alex Deucher wrote:
> The non-atomic modesetting code in amdgpu now spews warnings[1] with
> this patch applied.  I haven't really paged the legacy locking stuff
> into my head in quite a while.  Thoughts on how to proceed?

Uh that mess.

So the problem (and it's really the same for atomic as for legacy) is that
we have shared state between connector probe and modeset code. Generally
that's solved by just copying stuff (like drm_connector->display_info) and
hoping we don't race badly.

All the probe state is protected by dev->mode_config.mutex, while all the
modeset stuff is protected by the various drm_modeset_lock.

I think the simplest duct-tape is to reapply the old locking scheme to the
new macro, but only for non-atomic drivers. I'll type up something. But
I'll go on vacations for 2 weeks, so if it doesn't work out you have to
respin (and also merge).

Cheers, Daniel
> 
> Thanks,
> 
> Alex
> 
> commit 9bcaa3fe58ab7559e71df798bcff6e0795158695
> Author: Michal Orzel <michalorzel.eng@gmail.com>
> Date:   Tue Apr 28 19:10:04 2020 +0200
> 
>     drm: Replace drm_modeset_lock/unlock_all with DRM_MODESET_LOCK_ALL_* helpers
> 
>     As suggested by the TODO list for the kernel DRM subsystem, replace
>     the deprecated functions that take/drop modeset locks with new helpers.
> 
>     Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
>     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Link: https://patchwork.freedesktop.org/patch/msgid/1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com
> 
> 
> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/1224
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
