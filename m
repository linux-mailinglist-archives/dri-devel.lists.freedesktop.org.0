Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6D76D0DB1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC21B10EF73;
	Thu, 30 Mar 2023 18:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A8610EF79
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:25:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2d17b1b21f1so50516f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680200731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iOtmJ2KZ0ZiiMvb3fUMOj4gM6dj5/D3yy/SyfnsnekQ=;
 b=JbC16PGOBHcWTyzwg4d2sd7pXXG7wvM7sYojfwTbwcpywvR8xp6LbZO5SRauxeEmTL
 V4cKlzc4xC6tstyTG3cqNsJvCBW2YQxXQXvAjX2ZFG32nSypZf1HArjLfh13AkUgABVi
 AvftZkCHDLhqECK9o9TvNyZ5eQPwyQPf7Iicg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680200731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOtmJ2KZ0ZiiMvb3fUMOj4gM6dj5/D3yy/SyfnsnekQ=;
 b=qY8ClUYaYcgoIvgCh+dSA5Rd8Ruyj82YhmN77h6DDhlWmt7oOC61gATqxxIAaJ3gvW
 aoXnmGuGkzsecftUapHwAm9hgP67pEMpBgDiN1GUej6R7zn2Gsn9LNvjoB1/kcml4Dei
 3Nkj0de26iYwfoSkxOuJ9kez2vihm3ggE1LAQCTC6+Yke0GtDeD9tiNSCKFgEEtkjTAy
 D0ZdrNJ9TIsE2wqAiJcDEPmqgnewYhFX/1eFz7dm4iTtZCpcEkhrzjvSnWuXL6+pWBZH
 pVxpc0DR39pbnFLW9HnK2sl0dvpzk2c5SmogTs4/lniate7hV9dOE6BwY5yDUOCiZFRY
 gv3Q==
X-Gm-Message-State: AAQBX9cp6sedJRZqrHyMFc4/yR1iVrvGPjg6nToDWEN2wH1/VAe92ivI
 j27iJYvpfbbT5XTz/tiPd6FDDQ==
X-Google-Smtp-Source: AKy350aTLmLMvvUYGKX3P9o/YXihNwP5HVENlrvntqhv+yPcEAaN3Z/pzvb3PN1mXoOTc/XXdt8kQQ==
X-Received: by 2002:a05:600c:3108:b0:3ee:1c42:6582 with SMTP id
 g8-20020a05600c310800b003ee1c426582mr2780456wmo.3.1680200730755; 
 Thu, 30 Mar 2023 11:25:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s17-20020a7bc391000000b003edef091b17sm2641wmj.37.2023.03.30.11.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 11:25:29 -0700 (PDT)
Date: Thu, 30 Mar 2023 20:25:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [GIT PULL] etnaviv-fixes for 6.3
Message-ID: <ZCXUF8t+ej1wrDGA@phenom.ffwll.local>
References: <de8e08c2599ec0e22456ae36e9757b9ff14c2124.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8e08c2599ec0e22456ae36e9757b9ff14c2124.camel@pengutronix.de>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 06:19:36PM +0200, Lucas Stach wrote:
> Hi Dave, Daniel,
> 
> please pull the following fixes for the next rc. One fix to get rid of
> a memory leak showing up in the wild and two reverts to get rid of the
> scheduler use-after-free reported by Danilo.
> 
> Regards,
> Lucas
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/lst/linux etnaviv/fixes

Pulled thanks.

> for you to fetch changes up to baad10973fdb442912af676de3348e80bd8fe602:
> 
>   Revert "drm/scheduler: track GPU active time per entity" (2023-03-30 17:47:05 +0200)
> 
> ----------------------------------------------------------------
> Lucas Stach (3):
>       drm/etnaviv: fix reference leak when mmaping imported buffer
>       Revert "drm/etnaviv: export client GPU usage statistics via fdinfo"
>       Revert "drm/scheduler: track GPU active time per entity"

Please record acks/r-b for shared code (afaict the revert didnt even go to
any m-l, at least it's not on lore) and explain why this is going through
a driver tree and not drm-misc. Avoids me crawling through lore to figure
out what's up.
-Daniel

> 
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 43 +------------------------------------------
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 10 +++++++++-
>  drivers/gpu/drm/scheduler/sched_main.c      |  6 ------
>  include/drm/gpu_scheduler.h                 |  7 -------
>  4 files changed, 10 insertions(+), 56 deletions(-)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
