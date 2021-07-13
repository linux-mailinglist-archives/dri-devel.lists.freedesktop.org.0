Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A03C7164
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231046E0A1;
	Tue, 13 Jul 2021 13:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176236E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:44:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso2419573wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FINeCuPukYbhv1xTzdjoUCid4zw6kZITuKvaxve1oMc=;
 b=QadkfaDShgJd/+NGzz3yoiOZUnE2aQTJlWTybWTCGXW22X5zbwAy5QRe93syByenJp
 kUlug44MwdIJiout5uCp3YKRjfcUwI3fhgBb5jLJ77Jn6T679Qf6Zbn9CBzOhfMRT5X/
 11hCLIFHfA8B3FAvmS8VQXa2gOtuNZUPSs20k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FINeCuPukYbhv1xTzdjoUCid4zw6kZITuKvaxve1oMc=;
 b=N+WGGCGLOelrccWxkwjnjD7Ex7gwUUBUSl7GGLv6vFV6ZEeGr/QTWPdOzkPwVYCaHk
 xYe6pSuTuvNnoLv4xPOfe1doLxETZUiEw9fV3kIQOuSETk/b5nUjUZ/sY/QPJO2i8z+X
 dj4huFHpAolUNTXjBnWaHD7itA+GdJ0Tnfv+xprcpHEdRQOsF1SyTbEW92guWNNl8paV
 SMvPKVrf3ATHOMpT9ox2GgexFPzUTYlB1DrlZNLZpYMoLb+QBM0l9eAvIL6Ji6eS8Z+d
 J+POpj5kqCUOfwtInclQN1CVpGIs57NZeno7qwHC62MlTnEjXdNkoMOEqrOa6MsxR/3P
 JYBw==
X-Gm-Message-State: AOAM530rTFJlj6m+o7Na2UOKIJXJMHokSjD3cYoKVssB53YJG5Rx0o/B
 GZS+Jx/2WuS/cOp2cSBdJRiu8w==
X-Google-Smtp-Source: ABdhPJym4Uozv751Vyc405wWER6Zpcdl4FODf/9syXgubp3Qizj3FCRWAXwYOzRWTLISCJPM3oFZxQ==
X-Received: by 2002:a05:600c:ac3:: with SMTP id c3mr5391442wmr.4.1626183876735; 
 Tue, 13 Jul 2021 06:44:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm2287936wmq.22.2021.07.13.06.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:44:36 -0700 (PDT)
Date: Tue, 13 Jul 2021 15:44:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <YO2Ywqla3CgS+AbL@phenom.ffwll.local>
References: <YO07pEfweKVO+7y0@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YO07pEfweKVO+7y0@linux-uq9g>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 10:44:05AM +0200, Thomas Zimmermann wrote:
> Hi Dave and Daniel,
> 
> these two fixes in drm-misc-fixes got lost during last cycle. Sending them
> now.

Applied to drm-fixes, thanks.
-Daniel

> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2021-07-13:
> Short summary of fixes pull:
> 
>  * dma-buf: Fix fence leak in sync_file_merge() error code
>  * drm/panel: nt35510: Don't fail on DSI reads
> The following changes since commit d330099115597bbc238d6758a4930e72b49ea9ba:
> 
>   drm/nouveau: fix dma_address check for CPU/GPU sync (2021-06-24 15:40:44 +0200)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-07-13
> 
> for you to fetch changes up to ffe000217c5068c5da07ccb1c0f8cce7ad767435:
> 
>   dma-buf/sync_file: Don't leak fences on merge failure (2021-07-12 13:34:49 +0200)
> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
>  * dma-buf: Fix fence leak in sync_file_merge() error code
>  * drm/panel: nt35510: Don't fail on DSI reads
> 
> ----------------------------------------------------------------
> Jason Ekstrand (1):
>       dma-buf/sync_file: Don't leak fences on merge failure
> 
> Linus Walleij (1):
>       drm/panel: nt35510: Do not fail if DSI read fails
> 
>  drivers/dma-buf/sync_file.c                   | 13 +++++++------
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c |  4 +---
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
