Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F36446845
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 19:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F56ECBD;
	Fri,  5 Nov 2021 18:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200276ECBD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 18:08:27 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7217561wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 11:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8FXlM/uEZ+QVIH3exfur1TguYF8WKyd7AbPDRFokQrw=;
 b=CzAg/yM/wiBJ+AMwcVNFPx9q7gnZZSw0z0zJ6pcwyypxVo2Y5yUPmLfd94yGh+JXGW
 MHThtMoy3uUR2vv7LvwWxi38Btql/HPutnrD0BQUoToxK9RIoWNfUgC+DvAD69fVeV3+
 iySJc2/LgDTeVx2NgcnSizm7dqlkM2kfc8k3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8FXlM/uEZ+QVIH3exfur1TguYF8WKyd7AbPDRFokQrw=;
 b=SUhW5FxDbICRvod1gwdF9FjGMNpcL33KHqhIU+eaYy1GskHPZ4Y/tB43RctrtU1vr3
 /gd+CCPcH5w5NyLRJZLYc4bQCr08KUB+hA45RZh+DZkYfisvDMXQ1l4bxCSYUT6Eu/qz
 XXIx4pa3idMC1EgE9ejIDSY62x6QjkFqbsa1rxrw/zopwgGyXCkJHXq9GowXL0PKpcMf
 kBlnSOzfPynFE0sG03ECBMPQj+qFwBWK7PE5k+YeX2FYkfoGJFwePP6LFBkQK/sBBlEA
 ZDTp6i0GZ3Vv5752ZQgYVYLnJ/oA0qJhQ9ltcou/uUG8DtmGhlXG7YS+MXgtAi8R6nIM
 TS+A==
X-Gm-Message-State: AOAM531wN2VqhOG3tF9tXcDYYC3y3kQqy5/crMa9srHBrhE0tVsJHUJz
 BawcbcjtatwRlaiy9m82uoJai0HNdq3VvA==
X-Google-Smtp-Source: ABdhPJzxkBLF8LM6EQbaags5VcmZLle9NfWtvtMgzhO9fTDEY8AXiDDJmJ/ytPB1mwMlyW/wFo4srA==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr31897174wmi.70.1636135705674; 
 Fri, 05 Nov 2021 11:08:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l7sm11198340wry.86.2021.11.05.11.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 11:08:25 -0700 (PDT)
Date: Fri, 5 Nov 2021 19:08:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] Revert "drm/imx: Annotate dma-fence critical section in
 commit path"
Message-ID: <YYVzF+uBKjaoD4vP@phenom.ffwll.local>
References: <20211104001112.4035691-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104001112.4035691-1-festevam@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 03, 2021 at 09:11:12PM -0300, Fabio Estevam wrote:
> This reverts commit f4b34faa08428d813fc3629f882c503487f94a12.
> 
> Since commit f4b34faa0842 ("drm/imx: Annotate dma-fence critical section in
> commit path") the following possible circular dependency is detected:
> 
> [    5.001811] ======================================================
> [    5.001817] WARNING: possible circular locking dependency detected
> [    5.001824] 5.14.9-01225-g45da36cc6fcc-dirty #1 Tainted: G        W
> [    5.001833] ------------------------------------------------------
> [    5.001838] kworker/u8:0/7 is trying to acquire lock:
> [    5.001848] c1752080 (regulator_list_mutex){+.+.}-{3:3}, at: regulator_lock_dependent+0x40/0x294
> [    5.001903]
> [    5.001903] but task is already holding lock:
> [    5.001909] c176df78 (dma_fence_map){++++}-{0:0}, at: imx_drm_atomic_commit_tail+0x10/0x160
> [    5.001957]
> [    5.001957] which lock already depends on the new lock.
> ...
> 
> Revert it for now.
> 
> Tested on a imx6q-sabresd.
> 
> Fixes: f4b34faa0842 ("drm/imx: Annotate dma-fence critical section in commit path")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Yeah I have these on my todo list since a while, I need to properly
document the reasons why this doesn't work.

Queued up for the merge window, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 9558e9e1b431..cb685fe2039b 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -81,7 +81,6 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
>  	struct drm_plane_state *old_plane_state, *new_plane_state;
>  	bool plane_disabling = false;
>  	int i;
> -	bool fence_cookie = dma_fence_begin_signalling();
>  
>  	drm_atomic_helper_commit_modeset_disables(dev, state);
>  
> @@ -112,7 +111,6 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
>  	}
>  
>  	drm_atomic_helper_commit_hw_done(state);
> -	dma_fence_end_signalling(fence_cookie);
>  }
>  
>  static const struct drm_mode_config_helper_funcs imx_drm_mode_config_helpers = {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
