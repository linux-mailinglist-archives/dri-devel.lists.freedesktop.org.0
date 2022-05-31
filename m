Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF435392D9
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 15:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F16113020;
	Tue, 31 May 2022 13:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6215311301C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:56:54 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v25so9577766eda.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o7CGAEJkYNHhr++UKAzMJiz0AjBj8WAKx8VxNBX3V/M=;
 b=cJ7QMvjO05syWye0vf9WFqpN9NCDFpKQmiZkpou2BvHE+RjrJRKUnHMwXwfxyg4Ipx
 grDHdcsZNErBzuYMUGroinrVNH4hIiqdrOYu/YaQpt0/vL2U/p/Vi4NPhVAdKUnYepqZ
 TzaheKRY3x2CeaPVUkZUMS2mecn8xC+33vNF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o7CGAEJkYNHhr++UKAzMJiz0AjBj8WAKx8VxNBX3V/M=;
 b=AliHLJfxbElQCPtgGZHvJvETBPkM1ENuLtMgfVG3upifLnWBQtmi86GCUmddtKCBZC
 qK2QtdL80aVT0yU5MdbnKSV+i2pZyi5nU2BMlI48goSD3Trs2wfToSobI3ZspCYOiUuW
 2nVkq6gM/hy8PDuLiJJG+b3AimvbiHzWP9mjPXHbrele3rues7BLMuuT4AWWDgDtZerA
 E2gJzv60j9a28N+4SQFTxBfTXuziPuueBq8QgSJdqm5UkykXbGXWGftvGvD9HDsN3VO7
 XG/p/bhxZ4fKCYc428p8q9vxWdPa5zA1fwla1OLjDP8q/QbB+e7UCQA97niuMkug2hxm
 /qVQ==
X-Gm-Message-State: AOAM531QVQwZl4orj4HgcMzOP3zxksAL+RBX/2HsROAAJlS+HO2Mvsv/
 GZtDdtGO7lnG4LuES18BVKH9ig==
X-Google-Smtp-Source: ABdhPJx7U8ffRmZVNtsRee/sQaejCa/xBx0+wVZZg4tbaiEUy3vEX1sGJ2Pj73Q3ldAZ7C6eoqU2Lw==
X-Received: by 2002:a05:6402:17d0:b0:42d:ccc1:f4e4 with SMTP id
 s16-20020a05640217d000b0042dccc1f4e4mr13591927edy.150.1654005412881; 
 Tue, 31 May 2022 06:56:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1709066b9900b006f4c4330c49sm4887098ejr.57.2022.05.31.06.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 06:56:52 -0700 (PDT)
Date: Tue, 31 May 2022 15:56:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [RFC V3 0/2] Attach and Set vrr_enabled property
Message-ID: <YpYeotF27wVJbAhJ@phenom.ffwll.local>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
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
Cc: manasi.d.navare@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 17, 2022 at 12:56:34PM +0530, Bhanuprakash Modem wrote:
> This series will add a support to set the vrr_enabled property for
> crtc based on the platform support and the request from userspace.
> And userspace can also query to get the status of "vrr_enabled".
> 
> Test-with: 20220422075223.2792586-2-bhanuprakash.modem@intel.com
> 
> Bhanuprakash Modem (2):
>   drm/vrr: Attach vrr_enabled property to the drm crtc
>   drm/i915/vrr: Set drm crtc vrr_enabled property

I'm rather confused by this patch set:

- This seems to move the property from connector to crtc without any
  justification. For uapi that we want to have standardized (anything
  around kms really) that's no good, unless there's really a mandatory
  semantic reason pls stick to existing uapi.

- If the driver interface doesn't fit (maybe the helper should be on the
  crtc and adjust the property for all connector) pls roll that change out
  to all drivers.

- This is uapi, so needs igt tests and userspace. For igts we should make
  sure they're generic so that they apply across all drivers which already
  support this property, and not just create new intel-only testcases.

- Finally the property is set up, but not wired through. Or at least I'm
  not seeing how this can even work.

So no idea what exactly you're aiming for here and what kind of comments
you want, but this doesn't look like it's on the right path at all.

Cheers, Daniel


> 
>  drivers/gpu/drm/drm_crtc.c               | 26 ++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c        |  2 +-
>  drivers/gpu/drm/i915/display/intel_vrr.c |  8 ++++++++
>  include/drm/drm_crtc.h                   |  3 +++
>  4 files changed, 38 insertions(+), 1 deletion(-)
> 
> --
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
